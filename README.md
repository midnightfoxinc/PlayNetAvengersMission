# AvengersNet Offline Client

This repository documents the reverse-engineering work for **Marvel Playmation AvengersNet**
(`com.disney.playmationavengersnet_goo`), an Android app used with the
Marvel Playmation Avengers smart-toy and wearable interactive entertainment system.

## Free the Device Campaign

This project is part of the **Free the Device** campaign.

Disney decommissioned Playmation, pulled the app from the Play Store / App Store, and left
your kids unable to use the physical gear they purchased. This project preserves the ability
to play locally, scan gear, and progress missions without relying on Disney's
now-unavailable cloud services, login screens, or support infrastructure.

## Goal

Build an offline Android build that:

- launches without Disney ID sign-in
- does not require internet access
- unlocks all levels, abilities, regions, missions, and gear flows
- keeps working with Playmation gear over Bluetooth/low-energy radio
- avoids call-home, telemetry, and Disney content downloads

## What Was Patched

### Android / Smali layer

- `UIDevice.internetConnectionStatus()` now reports a connected state
- Disney ID guest/session helpers are forced offline-friendly
- `synchronizeLightBox()` and the Disney ID cache initialization are disabled
- Network and Wi-Fi state permissions are retained where the game API expects them
- Kochava/analytics receiver/bloat paths were removed

### Unity managed layer (`Assembly-CSharp.dll`)

The following methods were no-op'd with IL/C# body edits:

- `globals.show_no_internet_alert`
- `NetworkManagerBehavior.connected`
- `DisneyIDManager.onInternetDown`
- `DisneyIDManager.onLaunchLogin`

Progression and unlock gates were forced open:

- `PlayerData.isGuestLogin` -> `false`
- `PlayerData.isAuthenticated` -> `true`
- `PlayerData.has_unlock` -> `true`
- `PlayerData.mission_entitled` -> `true`
- `PlayerData.can_play_mission` -> `true`
- `locationDataItemClass.unlocked` -> `true`
- `locationDataItemClass.requires_purchase` -> `false`
- `missionDataClass.unlocked` -> `true`
- `missionDataClass.installed` -> `true`

## Why This Is Offline-Capable

Instead of authenticating against Disney's ID service, the patched game treats the local
player as authenticated. All device progress, level, ability, mission, and location gating
is satisfied locally, so gear scanning, progression, and mission play do not depend on
cloud accounts or online validation.

## Build Artifacts

The rebuild process produces a signed APK using apktool, zipalign, and apksigner.
See the commands below for rebuild and install.

## Rebuild Commands

```sh
cd ~/decoded
~/Avengernet/AvengersNet_offline_unsigned.apk
export PATH=~/Android/Sdk/build-tools/35.0.0:$PATH
zipalign -p 4 -f ~/AvengersNet_offline_unsigned.apk ~/AvengersNet_offline_aligned.apk
apksigner sign --ks ~/avengernet.keystore \
  --ks-pass pass:avengernet --key-pass pass:avengernet \
  ~/AvengersNet_offline_aligned.apk
```

## Install On Device

```sh
export PATH=~/Android/Sdk/platform-tools:$PATH
adb install -r -d ~/AvengersNet_offline_aligned.apk
```

## Verify

```sh
adb logcat -c
adb logcat -d | grep -niE "launchDisIdLoginPage|onSilentLogin|VolleyManager|cdn.registerdisney.go.com"
```

Expected: no Disney ID lightbox, no "No internet" popup, gear and mission flows open
without online login.

## Credits

Created to support users whose Playmation hardware was left stranded after Disney
discontinued the platform.
