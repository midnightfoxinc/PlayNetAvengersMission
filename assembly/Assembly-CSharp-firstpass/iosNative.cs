using System;
using System.Runtime.InteropServices;
using UnityEngine;

// Token: 0x0200001A RID: 26
public class iosNative : INative
{
	// Token: 0x060001C9 RID: 457 RVA: 0x000083CC File Offset: 0x000065CC
	void INative.displayPopup(string title, string message, string button, string callbackObject)
	{
		if (!Application.isEditor)
		{
			iosNative._displayPopup(title, message, button, callbackObject);
		}
	}

	// Token: 0x060001CA RID: 458 RVA: 0x000083E4 File Offset: 0x000065E4
	void INative.setupBLE(string callbackObject)
	{
		if (!Application.isEditor)
		{
			iosNative._setupBLE(callbackObject);
		}
	}

	// Token: 0x060001CB RID: 459 RVA: 0x000083F8 File Offset: 0x000065F8
	void INative.connectToDevice(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._connectToDevice(deviceId);
		}
	}

	// Token: 0x060001CC RID: 460 RVA: 0x0000840C File Offset: 0x0000660C
	void INative.sendData(int deviceId, ushort eventType, string jsonData)
	{
		if (!Application.isEditor)
		{
			iosNative._sendData(deviceId, eventType, jsonData);
		}
	}

	// Token: 0x060001CD RID: 461 RVA: 0x00008420 File Offset: 0x00006620
	void INative.imHereMessageReceived(string callbackObject)
	{
		if (!Application.isEditor)
		{
		}
	}

	// Token: 0x060001CE RID: 462 RVA: 0x0000842C File Offset: 0x0000662C
	void INative.sendMission(int deviceId, string jsonData)
	{
		if (!Application.isEditor)
		{
			iosNative._sendMission(deviceId, jsonData);
		}
	}

	// Token: 0x060001CF RID: 463 RVA: 0x00008440 File Offset: 0x00006640
	void INative.getContentList(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._getContentList(deviceId);
		}
	}

	// Token: 0x060001D0 RID: 464 RVA: 0x00008454 File Offset: 0x00006654
	void INative.getDevices()
	{
		if (!Application.isEditor)
		{
			iosNative._getDevices();
		}
	}

	// Token: 0x060001D1 RID: 465 RVA: 0x00008468 File Offset: 0x00006668
	void INative.getLogs()
	{
		if (!Application.isEditor)
		{
			iosNative._getLogs();
		}
	}

	// Token: 0x060001D2 RID: 466 RVA: 0x0000847C File Offset: 0x0000667C
	void INative.disconnectFromDevice()
	{
		if (!Application.isEditor)
		{
			iosNative._disconnectFromDevice();
		}
	}

	// Token: 0x060001D3 RID: 467 RVA: 0x00008490 File Offset: 0x00006690
	void INative.unregisterBLE()
	{
		if (!Application.isEditor)
		{
			iosNative._unregisterBLE();
		}
	}

	// Token: 0x060001D4 RID: 468 RVA: 0x000084A4 File Offset: 0x000066A4
	void INative.crash()
	{
		if (!Application.isEditor)
		{
			iosNative._crash();
		}
	}

	// Token: 0x060001D5 RID: 469 RVA: 0x000084B8 File Offset: 0x000066B8
	void INative.registerDevice(string ownerId, int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._registerDevice(ownerId, deviceId);
		}
	}

	// Token: 0x060001D6 RID: 470 RVA: 0x000084CC File Offset: 0x000066CC
	void INative.unregisterDevice(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._unregisterDevice(deviceId);
		}
	}

	// Token: 0x060001D7 RID: 471 RVA: 0x000084E0 File Offset: 0x000066E0
	void INative.setEncryptionKey(string key)
	{
		if (!Application.isEditor)
		{
		}
	}

	// Token: 0x060001D8 RID: 472 RVA: 0x000084EC File Offset: 0x000066EC
	void INative.getEncryptionKey(string callbackObj)
	{
		if (!Application.isEditor)
		{
		}
	}

	// Token: 0x060001D9 RID: 473 RVA: 0x000084F8 File Offset: 0x000066F8
	void INative.getAvailableSpace(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._getAvailableSpace(deviceId);
		}
	}

	// Token: 0x060001DA RID: 474 RVA: 0x0000850C File Offset: 0x0000670C
	void INative.loginWithAccessToken(string accessToken, string cellophaneKey)
	{
		if (!Application.isEditor)
		{
			iosNative._loginWithAccessToken(accessToken, cellophaneKey);
		}
	}

	// Token: 0x060001DB RID: 475 RVA: 0x00008520 File Offset: 0x00006720
	void INative.logout()
	{
		if (!Application.isEditor)
		{
			iosNative._logout();
		}
	}

	// Token: 0x060001DC RID: 476 RVA: 0x00008534 File Offset: 0x00006734
	void INative.uploadAnalytics(int deviceId)
	{
		if (!Application.isEditor)
		{
		}
	}

	// Token: 0x060001DD RID: 477 RVA: 0x00008540 File Offset: 0x00006740
	void INative.sendRebootRequest(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._sendRebootRequest(deviceId);
		}
	}

	// Token: 0x060001DE RID: 478 RVA: 0x00008554 File Offset: 0x00006754
	void INative.clearContent(int deviceId, string contentId, int version)
	{
		if (!Application.isEditor)
		{
			iosNative._clearContent(deviceId, contentId, version);
		}
	}

	// Token: 0x060001DF RID: 479 RVA: 0x00008568 File Offset: 0x00006768
	void INative.getDeviceContentList(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._getDeviceContentList(deviceId);
		}
	}

	// Token: 0x060001E0 RID: 480 RVA: 0x0000857C File Offset: 0x0000677C
	void INative.requestDisplayName(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._requestDisplayName(deviceId);
		}
	}

	// Token: 0x060001E1 RID: 481 RVA: 0x00008590 File Offset: 0x00006790
	void INative.getBuildNumber(string callbackObj)
	{
		if (!Application.isEditor)
		{
			iosNative._getBuildNumber(callbackObj);
		}
	}

	// Token: 0x060001E2 RID: 482 RVA: 0x000085A4 File Offset: 0x000067A4
	void INative.sendPersonlizationRequest(string fname)
	{
		if (!Application.isEditor)
		{
		}
	}

	// Token: 0x060001E3 RID: 483 RVA: 0x000085B0 File Offset: 0x000067B0
	void INative.personlizeDevice(int deviceId)
	{
		if (!Application.isEditor)
		{
		}
	}

	// Token: 0x060001E4 RID: 484 RVA: 0x000085BC File Offset: 0x000067BC
	void INative.optOutPersonlization(int deviceId)
	{
		if (!Application.isEditor)
		{
		}
	}

	// Token: 0x060001E5 RID: 485 RVA: 0x000085C8 File Offset: 0x000067C8
	void INative.negotiateSessionKey(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._negotiateSessionKey(deviceId);
		}
	}

	// Token: 0x060001E6 RID: 486 RVA: 0x000085DC File Offset: 0x000067DC
	void INative.enterKeyMask(int deviceId, string keyedInput)
	{
		if (!Application.isEditor)
		{
			iosNative._enterKeyMask(deviceId, keyedInput);
		}
	}

	// Token: 0x060001E7 RID: 487 RVA: 0x000085F0 File Offset: 0x000067F0
	void INative.setRTOHost(string url)
	{
		if (!Application.isEditor)
		{
			iosNative._setRTOHost(url);
		}
	}

	// Token: 0x060001E8 RID: 488 RVA: 0x00008604 File Offset: 0x00006804
	void INative.transferManifest(int deviceId, string packageId)
	{
		if (!Application.isEditor)
		{
			iosNative._transferManifest(deviceId, packageId);
		}
	}

	// Token: 0x060001E9 RID: 489 RVA: 0x00008618 File Offset: 0x00006818
	void INative.requestFirmwareVersion(int deviceId, bool sendHeartbeatToCloud)
	{
		if (!Application.isEditor)
		{
			iosNative._requestFirmwareVersion(deviceId, sendHeartbeatToCloud);
		}
	}

	// Token: 0x060001EA RID: 490 RVA: 0x0000862C File Offset: 0x0000682C
	void INative.requestFirmware(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._requestFirmware(deviceId);
		}
	}

	// Token: 0x060001EB RID: 491 RVA: 0x00008640 File Offset: 0x00006840
	void INative.uploadFirmware(int deviceId, string fwpFilename)
	{
		if (!Application.isEditor)
		{
			iosNative._uploadFirmware(deviceId, fwpFilename);
		}
	}

	// Token: 0x060001EC RID: 492 RVA: 0x00008654 File Offset: 0x00006854
	void INative.resetDownload(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._resetDownload(deviceId);
		}
	}

	// Token: 0x060001ED RID: 493 RVA: 0x00008668 File Offset: 0x00006868
	void INative.getOwnerKey()
	{
		if (!Application.isEditor)
		{
			iosNative._getOwnerKey();
		}
	}

	// Token: 0x060001EE RID: 494 RVA: 0x0000867C File Offset: 0x0000687C
	void INative.isBluetoothRadioOn()
	{
		if (!Application.isEditor)
		{
			iosNative._isBluetoothRadioOn();
		}
	}

	// Token: 0x060001EF RID: 495 RVA: 0x00008690 File Offset: 0x00006890
	void INative.libraryVersion()
	{
		if (!Application.isEditor)
		{
			iosNative._libraryVersion();
		}
	}

	// Token: 0x060001F0 RID: 496 RVA: 0x000086A4 File Offset: 0x000068A4
	void INative.bluetoothPopup()
	{
		if (!Application.isEditor)
		{
			iosNative._bluetoothPopup();
		}
	}

	// Token: 0x060001F1 RID: 497 RVA: 0x000086B8 File Offset: 0x000068B8
	void INative.launchDisIdLoginPage()
	{
		if (!Application.isEditor)
		{
			iosNative._launchDisIdLoginPage();
		}
	}

	// Token: 0x060001F2 RID: 498 RVA: 0x000086CC File Offset: 0x000068CC
	void INative.onSilentLogin()
	{
		if (!Application.isEditor)
		{
			iosNative._onSilentLogin();
		}
	}

	// Token: 0x060001F3 RID: 499 RVA: 0x000086E0 File Offset: 0x000068E0
	void INative.onForceRefreshToken()
	{
		if (!Application.isEditor)
		{
			iosNative._onForceRefreshToken();
		}
	}

	// Token: 0x060001F4 RID: 500 RVA: 0x000086F4 File Offset: 0x000068F4
	void INative.onDisidLogout()
	{
		if (!Application.isEditor)
		{
			iosNative._onDisidLogout();
		}
	}

	// Token: 0x060001F5 RID: 501 RVA: 0x00008708 File Offset: 0x00006908
	void INative.setupDisneyId(string name, string clientID, string country, string languageSelection, string environment, string coreEnvironment, bool javascriptDebugState)
	{
		if (!Application.isEditor)
		{
			iosNative._setupDiseyId(name, clientID, country, languageSelection, environment, coreEnvironment, javascriptDebugState);
		}
	}

	// Token: 0x060001F6 RID: 502 RVA: 0x00008730 File Offset: 0x00006930
	void INative.getContentOnToy(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._getContentOnToy(deviceId);
		}
	}

	// Token: 0x060001F7 RID: 503 RVA: 0x00008744 File Offset: 0x00006944
	void INative.getContentEntitlements(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._getContentEntitlements(deviceId);
		}
	}

	// Token: 0x060001F8 RID: 504 RVA: 0x00008758 File Offset: 0x00006958
	void INative.receivePackageToMobile(int deviceId, string packageId, int version)
	{
		if (!Application.isEditor)
		{
			iosNative._receivePackageToMobile(deviceId, packageId, version);
		}
	}

	// Token: 0x060001F9 RID: 505 RVA: 0x0000876C File Offset: 0x0000696C
	void INative.getCachedPackages(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._getCachedPackages(deviceId);
		}
	}

	// Token: 0x060001FA RID: 506 RVA: 0x00008780 File Offset: 0x00006980
	void INative.sendPackageToToy(int deviceId, string packageId, int version)
	{
		if (!Application.isEditor)
		{
			iosNative._sendPackageToToy(deviceId, packageId, version);
		}
	}

	// Token: 0x060001FB RID: 507 RVA: 0x00008794 File Offset: 0x00006994
	void INative.enable_unity_logging()
	{
		if (!Application.isEditor)
		{
			iosNative._enable_unity_logging();
		}
	}

	// Token: 0x060001FC RID: 508 RVA: 0x000087A8 File Offset: 0x000069A8
	void INative.unityLog(string log)
	{
		if (Application.isEditor)
		{
			Debug.Log(log);
		}
		else
		{
			iosNative._unityLog(log);
		}
	}

	// Token: 0x060001FD RID: 509 RVA: 0x000087C8 File Offset: 0x000069C8
	void INative.removeAllCachedPackages(int deviceId)
	{
		if (!Application.isEditor)
		{
			iosNative._removeAllCachedPackages(deviceId);
		}
	}

	// Token: 0x060001FE RID: 510 RVA: 0x000087DC File Offset: 0x000069DC
	void INative.beginScan()
	{
	}

	// Token: 0x060001FF RID: 511 RVA: 0x000087E0 File Offset: 0x000069E0
	void INative.InitializeDMO()
	{
	}

	// Token: 0x06000200 RID: 512
	[DllImport("__Internal")]
	private static extern void _displayPopup(string title, string message, string button, string callbackObject);

	// Token: 0x06000201 RID: 513
	[DllImport("__Internal")]
	private static extern void _setupBLE(string callbackObject);

	// Token: 0x06000202 RID: 514
	[DllImport("__Internal")]
	private static extern void _connectToDevice(int deviceId);

	// Token: 0x06000203 RID: 515
	[DllImport("__Internal")]
	private static extern void _sendData(int deviceId, ushort eventType, string jsonData);

	// Token: 0x06000204 RID: 516
	[DllImport("__Internal")]
	private static extern void _sendMission(int deviceId, string jsonData);

	// Token: 0x06000205 RID: 517
	[DllImport("__Internal")]
	private static extern void _getContentList(int deviceId);

	// Token: 0x06000206 RID: 518
	[DllImport("__Internal")]
	private static extern void _getDevices();

	// Token: 0x06000207 RID: 519
	[DllImport("__Internal")]
	private static extern void _disconnectFromDevice();

	// Token: 0x06000208 RID: 520
	[DllImport("__Internal")]
	private static extern void _unregisterBLE();

	// Token: 0x06000209 RID: 521
	[DllImport("__Internal")]
	private static extern void _getLogs();

	// Token: 0x0600020A RID: 522
	[DllImport("__Internal")]
	private static extern void _crash();

	// Token: 0x0600020B RID: 523
	[DllImport("__Internal")]
	private static extern void _registerDevice(string ownerId, int deviceId);

	// Token: 0x0600020C RID: 524
	[DllImport("__Internal")]
	private static extern void _unregisterDevice(int deviceId);

	// Token: 0x0600020D RID: 525
	[DllImport("__Internal")]
	private static extern void _setEncryptionKey(string key);

	// Token: 0x0600020E RID: 526
	[DllImport("__Internal")]
	private static extern void _getEncryptionKey(string callbackObj);

	// Token: 0x0600020F RID: 527
	[DllImport("__Internal")]
	private static extern void _getAvailableSpace(int deviceId);

	// Token: 0x06000210 RID: 528
	[DllImport("__Internal")]
	private static extern void _loginWithAccessToken(string accessToken, string cellophaneKey);

	// Token: 0x06000211 RID: 529
	[DllImport("__Internal")]
	private static extern void _logout();

	// Token: 0x06000212 RID: 530
	[DllImport("__Internal")]
	private static extern void _sendRebootRequest(int deviceId);

	// Token: 0x06000213 RID: 531
	[DllImport("__Internal")]
	private static extern void _clearContent(int deviceId, string contentId, int version);

	// Token: 0x06000214 RID: 532
	[DllImport("__Internal")]
	private static extern void _getDeviceContentList(int deviceId);

	// Token: 0x06000215 RID: 533
	[DllImport("__Internal")]
	private static extern void _requestDisplayName(int deviceId);

	// Token: 0x06000216 RID: 534
	[DllImport("__Internal")]
	private static extern void _getBuildNumber(string callbackObj);

	// Token: 0x06000217 RID: 535
	[DllImport("__Internal")]
	private static extern void _negotiateSessionKey(int deviceId);

	// Token: 0x06000218 RID: 536
	[DllImport("__Internal")]
	private static extern void _enterKeyMask(int deviceId, string keyedInput);

	// Token: 0x06000219 RID: 537
	[DllImport("__Internal")]
	private static extern void _setRTOHost(string url);

	// Token: 0x0600021A RID: 538
	[DllImport("__Internal")]
	private static extern void _transferManifest(int deviceId, string packageId);

	// Token: 0x0600021B RID: 539
	[DllImport("__Internal")]
	private static extern void _requestFirmwareVersion(int deviceId, bool sendHeartbeatToCloud);

	// Token: 0x0600021C RID: 540
	[DllImport("__Internal")]
	private static extern void _requestFirmware(int deviceId);

	// Token: 0x0600021D RID: 541
	[DllImport("__Internal")]
	private static extern void _uploadFirmware(int deviceId, string fwpFilename);

	// Token: 0x0600021E RID: 542
	[DllImport("__Internal")]
	private static extern void _resetDownload(int deviceId);

	// Token: 0x0600021F RID: 543
	[DllImport("__Internal")]
	private static extern void _getOwnerKey();

	// Token: 0x06000220 RID: 544
	[DllImport("__Internal")]
	private static extern bool _isBluetoothRadioOn();

	// Token: 0x06000221 RID: 545
	[DllImport("__Internal")]
	private static extern bool _libraryVersion();

	// Token: 0x06000222 RID: 546
	[DllImport("__Internal")]
	private static extern bool _bluetoothPopup();

	// Token: 0x06000223 RID: 547
	[DllImport("__Internal")]
	private static extern void _launchDisIdLoginPage();

	// Token: 0x06000224 RID: 548
	[DllImport("__Internal")]
	private static extern void _onSilentLogin();

	// Token: 0x06000225 RID: 549
	[DllImport("__Internal")]
	private static extern void _onForceRefreshToken();

	// Token: 0x06000226 RID: 550
	[DllImport("__Internal")]
	private static extern void _setupDiseyId(string name, string clientID, string country, string languageSelection, string environment, string coreEnvironment, bool javascriptDebugState);

	// Token: 0x06000227 RID: 551
	[DllImport("__Internal")]
	private static extern void _onDisidLogout();

	// Token: 0x06000228 RID: 552
	[DllImport("__Internal")]
	private static extern void _getContentOnToy(int deviceId);

	// Token: 0x06000229 RID: 553
	[DllImport("__Internal")]
	private static extern void _getContentEntitlements(int deviceId);

	// Token: 0x0600022A RID: 554
	[DllImport("__Internal")]
	private static extern void _receivePackageToMobile(int deviceId, string packageId, int version);

	// Token: 0x0600022B RID: 555
	[DllImport("__Internal")]
	private static extern void _getCachedPackages(int deviceId);

	// Token: 0x0600022C RID: 556
	[DllImport("__Internal")]
	private static extern void _sendPackageToToy(int deviceId, string packageId, int version);

	// Token: 0x0600022D RID: 557
	[DllImport("__Internal")]
	private static extern void _enable_unity_logging();

	// Token: 0x0600022E RID: 558
	[DllImport("__Internal")]
	private static extern void _unityLog(string log);

	// Token: 0x0600022F RID: 559
	[DllImport("__Internal")]
	private static extern void _removeAllCachedPackages(int deviceId);

	// Token: 0x06000230 RID: 560 RVA: 0x000087E4 File Offset: 0x000069E4
	public static iosNative getInstance()
	{
		if (iosNative.instance == null)
		{
			iosNative.instance = new iosNative();
		}
		return iosNative.instance;
	}

	// Token: 0x040000B3 RID: 179
	private static iosNative instance;
}
