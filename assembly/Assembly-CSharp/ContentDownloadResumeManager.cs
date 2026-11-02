using System;
using UnityEngine;

// Token: 0x02000188 RID: 392
public class ContentDownloadResumeManager : CallbackMonoBehavior
{
	// Token: 0x06000C04 RID: 3076 RVA: 0x00058048 File Offset: 0x00056248
	private void Start()
	{
		if (globals.BLE_manager.connectedDevice != -1 && globals.player_data.missionDownloadProgressState == Constants.ContentDownLoadState.NULL)
		{
			this.onContentPresent(null);
		}
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_CONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceConnect));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.CACHED_PACKAGE_EVENT, new BLEManager.DataReceivedDelegate(this.onCacheInfo));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.CONTENT_PRESENT, new BLEManager.DataReceivedDelegate(this.onContentInfo));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.ENTITLE_PACKAGE_EVENT, new BLEManager.DataReceivedDelegate(this.onEntitleInfo));
	}

	// Token: 0x06000C05 RID: 3077 RVA: 0x000580E0 File Offset: 0x000562E0
	public void onDeviceConnect(JSONObject data)
	{
		this.entitleInfo = (this.cacheInfo = (this.contentInfo = false));
		globals.debug("onDeviceJoin onContentDownloadBeh");
	}

	// Token: 0x06000C06 RID: 3078 RVA: 0x00058110 File Offset: 0x00056310
	public void onCacheInfo(JSONObject data)
	{
		this.cacheInfo = true;
		if (this.entitleInfo && this.cacheInfo && this.contentInfo)
		{
			this.onContentPresent(null);
		}
	}

	// Token: 0x06000C07 RID: 3079 RVA: 0x00058144 File Offset: 0x00056344
	public void onEntitleInfo(JSONObject data)
	{
		this.entitleInfo = true;
		if (this.entitleInfo && this.cacheInfo && this.contentInfo)
		{
			this.onContentPresent(null);
		}
	}

	// Token: 0x06000C08 RID: 3080 RVA: 0x00058178 File Offset: 0x00056378
	public void onContentInfo(JSONObject data)
	{
		this.contentInfo = true;
		if (this.entitleInfo && this.cacheInfo && this.contentInfo)
		{
			this.onContentPresent(null);
		}
	}

	// Token: 0x06000C09 RID: 3081 RVA: 0x000581AC File Offset: 0x000563AC
	private bool isDownloadAllowed()
	{
		if (globals.file_transfer_allowed == 0)
		{
			GameObject gameObject = GameObject.Find("UI Root");
			PopupAlert.Show(string.Empty, Localization.Get("CONTENT_DOWNLOAD_NOTALLOWED_HP"), Localization.Get("OKAY"), gameObject.transform.gameObject, null, 1f);
			return false;
		}
		return true;
	}

	// Token: 0x06000C0A RID: 3082 RVA: 0x00058200 File Offset: 0x00056400
	private void onContentPresent(JSONObject data = null)
	{
		BLEManager ble_manager = globals.BLE_manager;
		int primaryDevice = globals.player_data.getPrimaryDevice();
		ConnectedDevice connectedDevice = ble_manager.mConnectedDevices[primaryDevice];
		string packageCachedButNotInstalled = connectedDevice.getPackageCachedButNotInstalled();
		globals.debug("onContentPresent  ");
		if (ble_manager.mConnectedDevices.ContainsKey(primaryDevice))
		{
			globals.debug(string.Concat(new object[]
			{
				"\tonContentPresent ",
				connectedDevice.mDownLoadState.Count,
				":",
				packageCachedButNotInstalled
			}));
			if (connectedDevice.mDownLoadState.Count > 0 || globals.player_data.getDownloadQueu(primaryDevice).Count > 0)
			{
				if (this.isDownloadAllowed())
				{
					globals.packageDownload_manager.initDownload();
				}
			}
			else if (connectedDevice.mInstallState.Count > 0)
			{
				GameObject gameObject = GameObject.Find("UI Root");
				PopupAlert.Show("Mission Download", " Mission  Downloaded, Rebooting your device.", "OK", gameObject.transform.gameObject, null, 1f);
				globals.BLE_manager.rebootDevice(primaryDevice);
			}
		}
		globals.debug(" onContentPresent !" + globals.packageDownload_manager.current_install);
		if (string.IsNullOrEmpty(globals.packageDownload_manager.current_install))
		{
			globals.debug(" onContentPresent !!" + globals.packageDownload_manager.current_install);
			globals.BLE_manager.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.SAFE_TO_FIRMWARE, data);
		}
		if (globals.player_data.getDownloadQueu(globals.player_data.getPrimaryDevice()).Count == 0)
		{
			globals.BLE_manager.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.SAFE_TO_PATCHUI, data);
		}
	}

	// Token: 0x04000BD8 RID: 3032
	private bool entitleInfo;

	// Token: 0x04000BD9 RID: 3033
	private bool cacheInfo;

	// Token: 0x04000BDA RID: 3034
	private bool contentInfo;
}
