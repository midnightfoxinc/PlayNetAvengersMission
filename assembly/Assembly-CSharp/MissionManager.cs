using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200028F RID: 655
public class MissionManager
{
	// Token: 0x06001175 RID: 4469 RVA: 0x0007C73C File Offset: 0x0007A93C
	public static MissionManager getInstance()
	{
		if (MissionManager.instance == null)
		{
			MissionManager.instance = new MissionManager();
		}
		return MissionManager.instance;
	}

	// Token: 0x06001176 RID: 4470 RVA: 0x0007C758 File Offset: 0x0007A958
	public void init()
	{
	}

	// Token: 0x06001177 RID: 4471 RVA: 0x0007C75C File Offset: 0x0007A95C
	public bool isPackageInstalled(int deviceId, string entitlementId, bool checkCurrentVersion = false)
	{
		if (globals.BLE_manager.connectedDevice == deviceId && globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(deviceId))
		{
			Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[deviceId];
			if (checkCurrentVersion && dictionary.ContainsKey(entitlementId))
			{
				string version = dictionary[entitlementId].version;
				if (globals.BLE_manager.connectedDevice_data.isContentInstalledWithThisVersion(entitlementId, int.Parse(version)))
				{
					return true;
				}
			}
			else if (globals.BLE_manager.connectedDevice_data.content_installed(entitlementId))
			{
				return true;
			}
		}
		return false;
	}

	// Token: 0x06001178 RID: 4472 RVA: 0x0007C7F8 File Offset: 0x0007A9F8
	public bool isPackageCached(int deviceId, string entitlementId, string version)
	{
		bool result = false;
		if (globals.BLE_manager.connectedDevice == deviceId)
		{
			Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[deviceId];
			bool flag = dictionary.ContainsKey(entitlementId);
			if (flag && globals.BLE_manager.connectedDevice_data.isContentCachedWithThisVersion(entitlementId, int.Parse(version)))
			{
				result = true;
			}
		}
		return result;
	}

	// Token: 0x06001179 RID: 4473 RVA: 0x0007C854 File Offset: 0x0007AA54
	public bool isPackageReadyToGet(int deviceId, string entitlementId, string version)
	{
		bool result = false;
		if (globals.BLE_manager.connectedDevice == deviceId && globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(deviceId))
		{
			Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[deviceId];
			if (!dictionary.ContainsKey(entitlementId))
			{
				result = true;
			}
		}
		return result;
	}

	// Token: 0x0600117A RID: 4474 RVA: 0x0007C8A8 File Offset: 0x0007AAA8
	public bool isPackageDownloading(int deviceId, string entitlementId, string version)
	{
		return false;
	}

	// Token: 0x0600117B RID: 4475 RVA: 0x0007C8AC File Offset: 0x0007AAAC
	public bool isPackageReadytoInsall(int deviceId, string entitlementId, string version)
	{
		bool result = false;
		if (globals.BLE_manager.connectedDevice == deviceId && globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(deviceId))
		{
			Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[deviceId];
			if (dictionary.ContainsKey(entitlementId) && !globals.BLE_manager.connectedDevice_data.isContentInstalledWithThisVersion(entitlementId, int.Parse(version)))
			{
				result = true;
			}
		}
		return result;
	}

	// Token: 0x0600117C RID: 4476 RVA: 0x0007C91C File Offset: 0x0007AB1C
	public bool isPackageInstalling(int deviceId, string entitlementId, string version)
	{
		bool result = false;
		if (globals.BLE_manager.connectedDevice == deviceId)
		{
			result = globals.BLE_manager.connectedDevice_data.contentUnderDownloadState(entitlementId);
		}
		return result;
	}

	// Token: 0x0600117D RID: 4477 RVA: 0x0007C950 File Offset: 0x0007AB50
	public List<string> getDownloadableContentList(string locationId)
	{
		List<string> list = new List<string>();
		locationDataItemClass locationDataItemClass = globals.location_data.item_by_id(locationId);
		List<missionDataClass> list2 = new List<missionDataClass>();
		if (locationDataItemClass != null)
		{
			list2 = locationDataItemClass.missions;
			for (int i = 0; i < list2.Count; i++)
			{
				missionDataClass missionDataClass = list2[i];
				if (!string.IsNullOrEmpty(missionDataClass.env_package) && !list.Contains(missionDataClass.env_package))
				{
					list.Add(missionDataClass.env_package);
					list.Add(missionDataClass.entitlements);
				}
				else
				{
					list.Add(missionDataClass.entitlements);
				}
			}
		}
		return list;
	}

	// Token: 0x0600117E RID: 4478 RVA: 0x0007C9F4 File Offset: 0x0007ABF4
	public List<string> getDeleteContentList(string locationId)
	{
		List<string> list = new List<string>();
		locationDataItemClass locationDataItemClass = globals.location_data.item_by_id(locationId);
		List<missionDataClass> list2 = new List<missionDataClass>();
		if (locationDataItemClass != null)
		{
			list2 = locationDataItemClass.missions;
			for (int i = 0; i < list2.Count; i++)
			{
				missionDataClass missionDataClass = list2[i];
				list.Add(missionDataClass.entitlements);
			}
			for (int j = 0; j < list2.Count; j++)
			{
				missionDataClass missionDataClass2 = list2[j];
				if (!string.IsNullOrEmpty(missionDataClass2.env_package) && !list.Contains(missionDataClass2.env_package))
				{
					list.Add(missionDataClass2.env_package);
				}
			}
		}
		return list;
	}

	// Token: 0x0600117F RID: 4479 RVA: 0x0007CAAC File Offset: 0x0007ACAC
	public bool isLocationInstalled(string locationId)
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		if (!globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(primaryDevice))
		{
			return false;
		}
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		foreach (string text in downloadableContentList)
		{
			bool flag = this.isPackageInstalled(primaryDevice, text, false);
			globals.debug(string.Concat(new object[]
			{
				"isLocationInstalled ",
				primaryDevice,
				":",
				text,
				":",
				flag
			}));
			if (!flag)
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x06001180 RID: 4480 RVA: 0x0007CB90 File Offset: 0x0007AD90
	public bool isLocationPartiallyInstalled(string locationId)
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		if (!globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(primaryDevice))
		{
			return false;
		}
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		foreach (string text in downloadableContentList)
		{
			bool flag = this.isPackageInstalled(primaryDevice, text, false);
			globals.debug(string.Concat(new object[]
			{
				"isLocationPartiallyInstalled ",
				primaryDevice,
				":",
				text,
				":",
				flag
			}));
			if (flag)
			{
				return true;
			}
		}
		return false;
	}

	// Token: 0x06001181 RID: 4481 RVA: 0x0007CC74 File Offset: 0x0007AE74
	public bool isLocationCached(string locationId)
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[primaryDevice];
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		foreach (string text in downloadableContentList)
		{
			if (!dictionary.ContainsKey(text))
			{
				return false;
			}
			string version = dictionary[text].version;
			bool flag = this.isPackageCached(primaryDevice, text, version);
			globals.debug(string.Concat(new object[]
			{
				"isLocationCached ",
				primaryDevice,
				":",
				text,
				":",
				version,
				":",
				flag
			}));
			if (!flag)
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x06001182 RID: 4482 RVA: 0x0007CD84 File Offset: 0x0007AF84
	public bool isLocationBought(string locationId)
	{
		return false;
	}

	// Token: 0x06001183 RID: 4483 RVA: 0x0007CD88 File Offset: 0x0007AF88
	public bool isLocationUnderInstall(string locationId)
	{
		bool result = false;
		int primaryDevice = globals.player_data.getPrimaryDevice();
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		List<string> downloadQueu = globals.player_data.getDownloadQueu(primaryDevice);
		foreach (string text in downloadableContentList)
		{
			if (downloadQueu != null && downloadQueu.Contains(text))
			{
				result = true;
				return result;
			}
		}
		return result;
	}

	// Token: 0x06001184 RID: 4484 RVA: 0x0007CE28 File Offset: 0x0007B028
	public void installLocation(string locationId)
	{
		if (this.isAnyOutstandingFirmwareOrPatch())
		{
			return;
		}
		if (this.isLocationInstalled(locationId))
		{
			globals.debug("location already installed: " + locationId);
			return;
		}
		int primaryDevice = globals.player_data.getPrimaryDevice();
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		globals.player_data.enqueueDownloadQueu(primaryDevice, downloadableContentList);
		globals.debug("sendUnlockEnvironment" + locationId);
		globals.BLE_manager.sendUnlockEnvironment(locationId);
		foreach (string packageId in downloadableContentList)
		{
			globals.packageDownload_manager.cachePackage(packageId);
		}
	}

	// Token: 0x06001185 RID: 4485 RVA: 0x0007CEF0 File Offset: 0x0007B0F0
	public void updateLocation(string locationId)
	{
		if (this.isAnyOutstandingFirmwareOrPatch())
		{
			return;
		}
		int primaryDevice = globals.player_data.getPrimaryDevice();
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		List<string> allAvailableDLCPatchIds = globals.BLE_manager.getAllAvailableDLCPatchIds();
		List<string> list = new List<string>();
		foreach (string text in downloadableContentList)
		{
			if (allAvailableDLCPatchIds.Contains(text) || !globals.BLE_manager.connectedDevice_data.content_installed(text))
			{
				list.Add(text);
			}
		}
		globals.player_data.enqueueDownloadQueu(primaryDevice, list);
		foreach (string packageId in list)
		{
			globals.packageDownload_manager.cachePackage(packageId);
		}
	}

	// Token: 0x06001186 RID: 4486 RVA: 0x0007D00C File Offset: 0x0007B20C
	public int getGlobalProgress()
	{
		if (globals.packageDownload_manager.install_progress < 0f)
		{
			return -1;
		}
		int primaryDevice = globals.player_data.getPrimaryDevice();
		locationDataItemClass locationDataItemClass = globals.location_data.location_of_entitlement(globals.packageDownload_manager.current_install);
		if (locationDataItemClass != null)
		{
			return (int)(this.locationDownloadPercentage(locationDataItemClass.id).overall_percentage * 100f);
		}
		int num = globals.player_data.getDownloadQueu(primaryDevice).Count;
		if (num < 1)
		{
			num = 1;
		}
		return (int)(globals.packageDownload_manager.install_progress / (float)num * 100f);
	}

	// Token: 0x06001187 RID: 4487 RVA: 0x0007D09C File Offset: 0x0007B29C
	private bool isAnyOutstandingFirmwareOrPatch()
	{
		globals.debug(string.Concat(new object[]
		{
			"isAnyOutstandingFirmwareOrPatch",
			globals.player_data.firmwareUpdateStarted,
			":",
			globals.packageDownload_manager.current_install,
			":",
			globals.isFirmwareUpdateAvailable,
			":",
			globals.BLE_manager.getAvailablePatchId()
		}));
		if (globals.player_data.firmwareUpdateStarted || !string.IsNullOrEmpty(globals.packageDownload_manager.current_install))
		{
			globals.show_OK_alert(string.Empty, Localization.Get("WAIT_TO_UPDATE_DONE"), null);
			return true;
		}
		if (globals.isFirmwareUpdateAvailable || globals.BLE_manager.getAvailablePatchId() != null)
		{
			this.displayUpdateFirstMessage();
			return true;
		}
		return false;
	}

	// Token: 0x06001188 RID: 4488 RVA: 0x0007D170 File Offset: 0x0007B370
	private void displayUpdateFirstMessage()
	{
		globals.debug(string.Concat(new object[]
		{
			"displayUpdateFirstMessage ",
			globals.isFirmwareUpdateAvailable,
			":",
			globals.BLE_manager.getAvailablePatchId()
		}));
		if (globals.isFirmwareUpdateAvailable)
		{
			GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(globals.player_data.latest_device_data.type.ToString(), true) as GearDBItemClass;
			string text;
			if (gearDBItemClass)
			{
				text = gearDBItemClass.name;
			}
			else
			{
				text = "AVENGERS GEAR";
			}
			globals.show_confirm_alert(text + " " + Localization.Get("FIRMWARE_UPDATE_REQ"), Localization.Get("FIRMWARE_UPDATE_FIRST"), new EventDelegate.Callback(this.OnSkip), new EventDelegate.Callback(this.GoAheadAndinstallFirmware), Localization.Get("SKIP"), Localization.Get("OKAY"), true);
		}
		else if (globals.BLE_manager.getAvailablePatchId() != null)
		{
			globals.show_confirm_alert(Localization.Get("UPDATE_REQ"), Localization.Get("PATCH_UPDATE_FIRST"), new EventDelegate.Callback(this.OnSkip), new EventDelegate.Callback(this.GoAheadAndinstallPatch), Localization.Get("SKIP"), Localization.Get("OKAY"), true);
		}
	}

	// Token: 0x06001189 RID: 4489 RVA: 0x0007D2B0 File Offset: 0x0007B4B0
	private void OnSkip()
	{
		globals.debug("Skipped Do nothing");
	}

	// Token: 0x0600118A RID: 4490 RVA: 0x0007D2BC File Offset: 0x0007B4BC
	private void GoAheadAndinstallFirmware()
	{
		globals.debug("GoAheadAndinstallFirmware");
		if (globals.gear_daisy)
		{
			globals.gear_daisy.open_firmware_resume_manager();
		}
		else
		{
			globals.debugWarning("no gear daisy! Can't resume firmware");
		}
	}

	// Token: 0x0600118B RID: 4491 RVA: 0x0007D2FC File Offset: 0x0007B4FC
	private void GoAheadAndinstallPatch()
	{
		globals.debug("GoAheadAndinstallPatch");
		if (globals.gear_daisy)
		{
			globals.gear_daisy.open_patch_resume_manager();
		}
		else
		{
			globals.debugWarning("no gear daisy! Can't resume patch");
		}
	}

	// Token: 0x0600118C RID: 4492 RVA: 0x0007D33C File Offset: 0x0007B53C
	public bool isLocationEntitled(string locationId)
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		if (!globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(primaryDevice))
		{
			return false;
		}
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[primaryDevice];
		foreach (string text in downloadableContentList)
		{
			if (!dictionary.ContainsKey(text))
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x0600118D RID: 4493 RVA: 0x0007D3F0 File Offset: 0x0007B5F0
	public sLocationDownloadProgress locationDownloadPercentage(string locationId)
	{
		sLocationDownloadProgress sLocationDownloadProgress = new sLocationDownloadProgress();
		if (globals.BLE_manager.connectedDevice_data)
		{
			int connectedDevice = globals.BLE_manager.connectedDevice;
			List<string> downloadableContentList = this.getDownloadableContentList(locationId);
			List<string> downloadQueu = globals.player_data.getDownloadQueu(connectedDevice);
			sLocationDownloadProgress.total_files = downloadableContentList.Count;
			foreach (string text in downloadableContentList)
			{
				if (globals.packageDownload_manager.current_install == text)
				{
					sLocationDownloadProgress.piece_percentage = globals.packageDownload_manager.install_progress;
					sLocationDownloadProgress.currently_downloading = text;
				}
				else if (globals.BLE_manager.connectedDevice_data.content_installed(text) && !downloadQueu.Contains(text))
				{
					sLocationDownloadProgress.files_complete++;
				}
			}
		}
		if (sLocationDownloadProgress.files_complete >= sLocationDownloadProgress.total_files)
		{
			sLocationDownloadProgress.overall_percentage = 1f;
			sLocationDownloadProgress.piece_percentage = 1f;
		}
		else
		{
			float num = 1f / (float)sLocationDownloadProgress.total_files;
			float num2 = num * (float)sLocationDownloadProgress.files_complete;
			num2 += num * sLocationDownloadProgress.piece_percentage;
			sLocationDownloadProgress.overall_percentage = num2;
		}
		return sLocationDownloadProgress;
	}

	// Token: 0x0600118E RID: 4494 RVA: 0x0007D554 File Offset: 0x0007B754
	public bool isLocationDownloadPending(string locationId)
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		List<string> downloadQueu = globals.player_data.getDownloadQueu(primaryDevice);
		foreach (string text in downloadableContentList)
		{
			if (downloadQueu == null || !downloadQueu.Contains(text))
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x0600118F RID: 4495 RVA: 0x0007D5F4 File Offset: 0x0007B7F4
	public bool canDownloadFromCloud(string locationId)
	{
		return this.isLocationEntitled(locationId) && !this.isLocationCached(locationId) && !this.isLocationDownloadPending(locationId);
	}

	// Token: 0x06001190 RID: 4496 RVA: 0x0007D62C File Offset: 0x0007B82C
	public bool canAddToGear(string locationId)
	{
		return this.isLocationEntitled(locationId) && this.isLocationCached(locationId) && this.isLocationInstalled(locationId);
	}

	// Token: 0x06001191 RID: 4497 RVA: 0x0007D664 File Offset: 0x0007B864
	public bool locationOnGearAndCanRemove(string locationId)
	{
		return this.isLocationInstalled(locationId);
	}

	// Token: 0x06001192 RID: 4498 RVA: 0x0007D678 File Offset: 0x0007B878
	public bool locationPartiallyOnGearAndCanRemove(string locationId)
	{
		return this.isLocationPartiallyInstalled(locationId);
	}

	// Token: 0x06001193 RID: 4499 RVA: 0x0007D684 File Offset: 0x0007B884
	public bool canBuyItInTheStore(string locationId)
	{
		return !Application.isEditor && !this.isLocationEntitled(locationId);
	}

	// Token: 0x06001194 RID: 4500 RVA: 0x0007D6A4 File Offset: 0x0007B8A4
	public bool unInstallLocation(string locationId)
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		List<string> deleteContentList = this.getDeleteContentList(locationId);
		return globals.BLE_manager.clearContent(primaryDevice, deleteContentList);
	}

	// Token: 0x06001195 RID: 4501 RVA: 0x0007D6D4 File Offset: 0x0007B8D4
	public void cancelLocationDownload(string locationId)
	{
		List<string> downloadableContentList = this.getDownloadableContentList(locationId);
		List<string> downloadQueu = globals.player_data.getDownloadQueu(globals.player_data.getPrimaryDevice());
		bool flag = false;
		for (int i = 0; i < downloadableContentList.Count; i++)
		{
			string text = downloadableContentList[i];
			if (!downloadQueu.Contains(text) || globals.packageDownload_manager.current_install == text)
			{
				flag = true;
			}
			downloadQueu.Remove(text);
		}
		if (flag)
		{
			globals.BLE_manager.resetDownload(globals.player_data.getPrimaryDevice());
			globals.player_data.clearDownloadQueu(globals.player_data.getPrimaryDevice());
			bool flag2 = MissionManager.getInstance().unInstallLocation(locationId);
			globals.BLE_manager.getDeviceContentList(globals.player_data.getPrimaryDevice());
			if (!flag2)
			{
				globals.BLE_manager.disconnectFromDevice();
			}
		}
		else
		{
			globals.player_data.clearDownloadQueu(globals.player_data.getPrimaryDevice());
		}
		globals.player_data.enqueueDownloadQueu(globals.player_data.getPrimaryDevice(), downloadQueu);
	}

	// Token: 0x040011E6 RID: 4582
	private static MissionManager instance;
}
