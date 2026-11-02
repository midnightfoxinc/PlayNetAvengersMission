using System;
using UnityEngine;

// Token: 0x02000019 RID: 25
public class androidNative : INative
{
	// Token: 0x0600018A RID: 394 RVA: 0x00007730 File Offset: 0x00005930
	public androidNative()
	{
		this.init();
		this.test();
	}

	// Token: 0x0600018C RID: 396 RVA: 0x00007764 File Offset: 0x00005964
	void INative.setupDisneyId(string name, string clientID, string country, string languageSelection, string environment, string coreEnvironment, bool javascriptDebugState)
	{
		if (!Application.isEditor)
		{
			this.DisIDAndroidCall("setupDisneyId", new object[]
			{
				name,
				clientID,
				country,
				languageSelection,
				environment,
				coreEnvironment,
				javascriptDebugState
			});
		}
	}

	// Token: 0x0600018D RID: 397 RVA: 0x000077B4 File Offset: 0x000059B4
	void INative.displayPopup(string title, string message, string button, string callbackObject)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("displayPopup", new object[]
			{
				title,
				message,
				button,
				callbackObject
			});
		}
	}

	// Token: 0x0600018E RID: 398 RVA: 0x000077F0 File Offset: 0x000059F0
	void INative.setupBLE(string callbackObject)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("setupBLE", new object[]
			{
				callbackObject
			});
		}
	}

	// Token: 0x0600018F RID: 399 RVA: 0x00007814 File Offset: 0x00005A14
	void INative.connectToDevice(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("connectToDevice", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x06000190 RID: 400 RVA: 0x00007848 File Offset: 0x00005A48
	void INative.sendData(int deviceId, ushort eventType, string jsonData)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("sendData", new object[]
			{
				deviceId,
				(short)eventType,
				jsonData
			});
		}
	}

	// Token: 0x06000191 RID: 401 RVA: 0x00007888 File Offset: 0x00005A88
	void INative.imHereMessageReceived(string callbackObj)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("imHereMessageReceived", new object[]
			{
				callbackObj
			});
		}
	}

	// Token: 0x06000192 RID: 402 RVA: 0x000078AC File Offset: 0x00005AAC
	void INative.sendMission(int deviceId, string jsonData)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("sendMission", new object[]
			{
				deviceId,
				jsonData
			});
		}
	}

	// Token: 0x06000193 RID: 403 RVA: 0x000078E4 File Offset: 0x00005AE4
	void INative.getContentList(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("getContentList", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x06000194 RID: 404 RVA: 0x00007918 File Offset: 0x00005B18
	void INative.getDevices()
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("getDevices", new object[0]);
		}
	}

	// Token: 0x06000195 RID: 405 RVA: 0x00007938 File Offset: 0x00005B38
	void INative.getLogs()
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("getLogs", new object[0]);
		}
	}

	// Token: 0x06000196 RID: 406 RVA: 0x00007958 File Offset: 0x00005B58
	void INative.disconnectFromDevice()
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("disconnectFromDevice", new object[0]);
		}
	}

	// Token: 0x06000197 RID: 407 RVA: 0x00007978 File Offset: 0x00005B78
	void INative.unregisterBLE()
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("unregisterBLE", new object[0]);
		}
	}

	// Token: 0x06000198 RID: 408 RVA: 0x00007998 File Offset: 0x00005B98
	void INative.crash()
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("crash", new object[0]);
		}
	}

	// Token: 0x06000199 RID: 409 RVA: 0x000079B8 File Offset: 0x00005BB8
	void INative.registerDevice(string ownerId, int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("registerDevice", new object[]
			{
				ownerId,
				deviceId
			});
		}
	}

	// Token: 0x0600019A RID: 410 RVA: 0x000079F0 File Offset: 0x00005BF0
	void INative.unregisterDevice(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("unregisterDevice", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x0600019B RID: 411 RVA: 0x00007A24 File Offset: 0x00005C24
	void INative.setEncryptionKey(string key)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("setEncryptionKey", new object[]
			{
				key
			});
		}
	}

	// Token: 0x0600019C RID: 412 RVA: 0x00007A48 File Offset: 0x00005C48
	void INative.getEncryptionKey(string callbackObj)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("getEncryptionKey", new object[]
			{
				callbackObj
			});
		}
	}

	// Token: 0x0600019D RID: 413 RVA: 0x00007A6C File Offset: 0x00005C6C
	void INative.getAvailableSpace(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("getAvailableSpace", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x0600019E RID: 414 RVA: 0x00007AA0 File Offset: 0x00005CA0
	void INative.loginWithAccessToken(string accessToken, string cellophaneKey)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("loginWithAccessToken", new object[]
			{
				accessToken,
				cellophaneKey
			});
		}
	}

	// Token: 0x0600019F RID: 415 RVA: 0x00007AC8 File Offset: 0x00005CC8
	void INative.logout()
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("logout", new object[0]);
		}
	}

	// Token: 0x060001A0 RID: 416 RVA: 0x00007AE8 File Offset: 0x00005CE8
	void INative.uploadAnalytics(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("uploadAnalytics", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001A1 RID: 417 RVA: 0x00007B1C File Offset: 0x00005D1C
	void INative.sendRebootRequest(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("sendRebootRequest", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001A2 RID: 418 RVA: 0x00007B50 File Offset: 0x00005D50
	void INative.clearContent(int deviceId, string contentId, int version)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("clearContent", new object[]
			{
				deviceId,
				contentId,
				version
			});
		}
	}

	// Token: 0x060001A3 RID: 419 RVA: 0x00007B84 File Offset: 0x00005D84
	void INative.getDeviceContentList(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("getDeviceContentList", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001A4 RID: 420 RVA: 0x00007BB8 File Offset: 0x00005DB8
	void INative.requestDisplayName(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("requestDisplayName", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001A5 RID: 421 RVA: 0x00007BEC File Offset: 0x00005DEC
	void INative.getBuildNumber(string callbackObj)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("getBuildNumber", new object[]
			{
				callbackObj
			});
		}
	}

	// Token: 0x060001A6 RID: 422 RVA: 0x00007C10 File Offset: 0x00005E10
	void INative.sendPersonlizationRequest(string fname)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("sendPersonlizationRequest", new object[]
			{
				fname
			});
		}
	}

	// Token: 0x060001A7 RID: 423 RVA: 0x00007C34 File Offset: 0x00005E34
	void INative.personlizeDevice(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("personlizeDevice", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001A8 RID: 424 RVA: 0x00007C68 File Offset: 0x00005E68
	void INative.optOutPersonlization(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("optOutPersonlization", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001A9 RID: 425 RVA: 0x00007C9C File Offset: 0x00005E9C
	void INative.negotiateSessionKey(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("negotiateSessionKey", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001AA RID: 426 RVA: 0x00007CD0 File Offset: 0x00005ED0
	void INative.enterKeyMask(int deviceId, string keyedInput)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("enterKeyMask", new object[]
			{
				deviceId,
				keyedInput
			});
		}
	}

	// Token: 0x060001AB RID: 427 RVA: 0x00007D08 File Offset: 0x00005F08
	void INative.setRTOHost(string url)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("setRTOHost", new object[]
			{
				url
			});
		}
	}

	// Token: 0x060001AC RID: 428 RVA: 0x00007D2C File Offset: 0x00005F2C
	void INative.transferManifest(int deviceId, string packageId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("transferManifest", new object[]
			{
				deviceId,
				packageId
			});
		}
	}

	// Token: 0x060001AD RID: 429 RVA: 0x00007D64 File Offset: 0x00005F64
	void INative.requestFirmwareVersion(int deviceId, bool sendHeartbeatToCloud)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("requestFirmwareVersion", new object[]
			{
				deviceId,
				sendHeartbeatToCloud
			});
		}
	}

	// Token: 0x060001AE RID: 430 RVA: 0x00007D94 File Offset: 0x00005F94
	void INative.requestFirmware(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("requestFirmware", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001AF RID: 431 RVA: 0x00007DC8 File Offset: 0x00005FC8
	void INative.uploadFirmware(int deviceId, string fwpFilename)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("uploadFirmware", new object[]
			{
				deviceId,
				fwpFilename
			});
		}
	}

	// Token: 0x060001B0 RID: 432 RVA: 0x00007E00 File Offset: 0x00006000
	void INative.resetDownload(int deviceId)
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("resetDownload", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001B1 RID: 433 RVA: 0x00007E34 File Offset: 0x00006034
	void INative.getOwnerKey()
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("getOwnerKey", new object[0]);
		}
	}

	// Token: 0x060001B2 RID: 434 RVA: 0x00007E54 File Offset: 0x00006054
	void INative.isBluetoothRadioOn()
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("isBluetoothRadioOn", new object[0]);
		}
	}

	// Token: 0x060001B3 RID: 435 RVA: 0x00007E74 File Offset: 0x00006074
	void INative.libraryVersion()
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("libraryVersion", new object[0]);
		}
	}

	// Token: 0x060001B4 RID: 436 RVA: 0x00007E94 File Offset: 0x00006094
	void INative.bluetoothPopup()
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("bluetoothPopup", new object[0]);
		}
	}

	// Token: 0x060001B5 RID: 437 RVA: 0x00007EB4 File Offset: 0x000060B4
	void INative.getContentOnToy(int deviceId)
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("getContentOnToy", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001B6 RID: 438 RVA: 0x00007EE8 File Offset: 0x000060E8
	void INative.getContentEntitlements(int deviceId)
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("getContentEntitlements", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001B7 RID: 439 RVA: 0x00007F1C File Offset: 0x0000611C
	void INative.receivePackageToMobile(int deviceId, string packageId, int version)
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("receivePackageToMobile", new object[]
			{
				deviceId,
				packageId,
				version
			});
		}
	}

	// Token: 0x060001B8 RID: 440 RVA: 0x00007F54 File Offset: 0x00006154
	void INative.getCachedPackages(int deviceId)
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("getCachedPackages", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001B9 RID: 441 RVA: 0x00007F88 File Offset: 0x00006188
	void INative.sendPackageToToy(int deviceId, string packageId, int version)
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("sendPackageToToy", new object[]
			{
				deviceId,
				packageId,
				version
			});
		}
	}

	// Token: 0x060001BA RID: 442 RVA: 0x00007FC0 File Offset: 0x000061C0
	void INative.enable_unity_logging()
	{
	}

	// Token: 0x060001BB RID: 443 RVA: 0x00007FC4 File Offset: 0x000061C4
	void INative.unityLog(string log)
	{
		if (Application.isEditor)
		{
			Debug.Log(log);
		}
		else
		{
			this.AndroidCall("unityLog", new object[]
			{
				log
			});
		}
	}

	// Token: 0x060001BC RID: 444 RVA: 0x00007FFC File Offset: 0x000061FC
	void INative.removeAllCachedPackages(int deviceId)
	{
		if (Application.platform == 11)
		{
			this.AndroidCall("removeAllCachedPackages", new object[]
			{
				deviceId
			});
		}
	}

	// Token: 0x060001BD RID: 445 RVA: 0x00008030 File Offset: 0x00006230
	void INative.beginScan()
	{
		if (Application.platform == 11)
		{
		}
	}

	// Token: 0x060001BE RID: 446 RVA: 0x00008040 File Offset: 0x00006240
	void INative.InitializeDMO()
	{
		if (!Application.isEditor)
		{
			this.AndroidCall("initializeDMO", new object[0]);
		}
	}

	// Token: 0x060001BF RID: 447 RVA: 0x00008060 File Offset: 0x00006260
	void INative.launchDisIdLoginPage()
	{
		if (Application.platform == 11)
		{
			Debug.Log("launchDisIdLoginPage been called");
			this.DisIDAndroidCall("launchDisIdLoginPage", new object[0]);
		}
	}

	// Token: 0x060001C0 RID: 448 RVA: 0x0000808C File Offset: 0x0000628C
	void INative.onSilentLogin()
	{
		if (Application.platform == 11)
		{
			this.DisIDAndroidCall("onSilentLogin", new object[0]);
		}
	}

	// Token: 0x060001C1 RID: 449 RVA: 0x000080AC File Offset: 0x000062AC
	void INative.onForceRefreshToken()
	{
		if (Application.platform == 11)
		{
			this.DisIDAndroidCall("onForceRefreshToken", new object[0]);
		}
	}

	// Token: 0x060001C2 RID: 450 RVA: 0x000080CC File Offset: 0x000062CC
	void INative.onDisidLogout()
	{
		if (Application.platform == 11)
		{
			this.DisIDAndroidCall("onDisidLogout", new object[0]);
		}
	}

	// Token: 0x060001C3 RID: 451 RVA: 0x000080EC File Offset: 0x000062EC
	public static androidNative getInstance()
	{
		if (androidNative.instance == null)
		{
			androidNative.instance = new androidNative();
		}
		return androidNative.instance;
	}

	// Token: 0x060001C4 RID: 452 RVA: 0x00008108 File Offset: 0x00006308
	private void init()
	{
		AndroidJavaObject androidJavaObject = null;
		using (AndroidJavaClass androidJavaClass = new AndroidJavaClass(androidNative.unityAndroidJavaClassName))
		{
			androidJavaObject = androidJavaClass.GetStatic<AndroidJavaObject>("currentActivity");
		}
		AndroidJavaObject androidJavaObject2 = null;
		using (AndroidJavaClass androidJavaClass2 = new AndroidJavaClass(androidNative.unityAndroidJavaClassName))
		{
			androidJavaObject2 = androidJavaClass2.GetStatic<AndroidJavaObject>("currentActivity");
		}
		using (AndroidJavaClass androidJavaClass3 = new AndroidJavaClass(androidNative.customAndroidJavaClassName))
		{
			if (androidJavaClass3 != null)
			{
				AndroidJavaObject androidJavaObject3 = androidJavaClass3.CallStatic<AndroidJavaObject>("instance", new object[0]);
				androidJavaObject3.Call("setContext", new object[]
				{
					androidJavaObject
				});
			}
			else
			{
				Debug.Log("Problem getting AndroidJavaClass");
			}
		}
		Debug.Log("disIDAndroid 1");
		using (AndroidJavaClass androidJavaClass4 = new AndroidJavaClass(androidNative.disIDAndroidJavaClassName))
		{
			Debug.Log("disIDAndroid 2");
			if (androidJavaClass4 != null)
			{
				Debug.Log("disIDAndroid");
				AndroidJavaObject androidJavaObject4 = androidJavaClass4.CallStatic<AndroidJavaObject>("instance", new object[0]);
				androidJavaObject4.Call("setDisneyIDContext", new object[]
				{
					androidJavaObject2
				});
			}
			else
			{
				Debug.Log("Problem getting AndroidJavaClass");
			}
		}
	}

	// Token: 0x060001C5 RID: 453 RVA: 0x000082B0 File Offset: 0x000064B0
	private void AndroidCall(string methodName, params object[] args)
	{
		using (AndroidJavaClass androidJavaClass = new AndroidJavaClass(androidNative.customAndroidJavaClassName))
		{
			if (androidJavaClass != null)
			{
				AndroidJavaObject androidJavaObject = androidJavaClass.CallStatic<AndroidJavaObject>("instance", new object[0]);
				androidJavaObject.Call(methodName, args);
			}
			else
			{
				Debug.Log("Problem getting AndroidJavaClass");
			}
		}
	}

	// Token: 0x060001C6 RID: 454 RVA: 0x00008328 File Offset: 0x00006528
	private void DisIDAndroidCall(string methodName, params object[] args)
	{
		using (AndroidJavaClass androidJavaClass = new AndroidJavaClass(androidNative.disIDAndroidJavaClassName))
		{
			if (androidJavaClass != null)
			{
				Debug.Log("test" + methodName);
				AndroidJavaObject androidJavaObject = androidJavaClass.CallStatic<AndroidJavaObject>("instance", new object[0]);
				androidJavaObject.Call(methodName, args);
			}
			else
			{
				Debug.Log("Problem getting DisIDAndroidCall");
			}
		}
	}

	// Token: 0x060001C7 RID: 455 RVA: 0x000083B0 File Offset: 0x000065B0
	private void test()
	{
		this.AndroidCall("test", new object[0]);
	}

	// Token: 0x040000AF RID: 175
	private static androidNative instance;

	// Token: 0x040000B0 RID: 176
	private static string unityAndroidJavaClassName = "com.unity3d.player.UnityPlayer";

	// Token: 0x040000B1 RID: 177
	private static string customAndroidJavaClassName = "com.disney.emagine.sdk.plugin.EMTAndroidPlugin";

	// Token: 0x040000B2 RID: 178
	private static string disIDAndroidJavaClassName = "com.disney.id.android.webclient.DisIDPlugin";
}
