using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000190 RID: 400
public class packageDownloadManager : CallbackMonoBehavior
{
	// Token: 0x06000C41 RID: 3137 RVA: 0x00059684 File Offset: 0x00057884
	private void Start()
	{
		globals.debug("hello packageDownloadManager");
	}

	// Token: 0x06000C42 RID: 3138 RVA: 0x00059690 File Offset: 0x00057890
	public void init()
	{
		this.removeBaseListners();
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.RECEIVE_PACKAGE_EVENT, new BLEManager.DataReceivedDelegate(this.OnPackageReceiveToAppEnv));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.RECEIVE_PACKAGE_FAIL_EVENT, new BLEManager.DataReceivedDelegate(this.OnPackageReceiveFailToAppEnv));
	}

	// Token: 0x06000C43 RID: 3139 RVA: 0x000596D8 File Offset: 0x000578D8
	private void removeBaseListners()
	{
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.RECEIVE_PACKAGE_EVENT, new BLEManager.DataReceivedDelegate(this.OnPackageReceiveToAppEnv));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.RECEIVE_PACKAGE_FAIL_EVENT, new BLEManager.DataReceivedDelegate(this.OnPackageReceiveFailToAppEnv));
	}

	// Token: 0x170001B4 RID: 436
	// (get) Token: 0x06000C44 RID: 3140 RVA: 0x00059718 File Offset: 0x00057918
	public float install_progress
	{
		get
		{
			return this._install_progress;
		}
	}

	// Token: 0x06000C45 RID: 3141 RVA: 0x00059720 File Offset: 0x00057920
	public void cachePackage(string packageId)
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		int latestPackageVersion = globals.BLE_manager.getLatestPackageVersion(primaryDevice, packageId);
		globals.debug(string.Concat(new object[]
		{
			"cachePackage ",
			packageId,
			":",
			latestPackageVersion
		}));
		globals.BLE_manager.receivePackageToMobile(primaryDevice, packageId, latestPackageVersion);
	}

	// Token: 0x06000C46 RID: 3142 RVA: 0x00059780 File Offset: 0x00057980
	public void OnPackageReceiveToAppEnv(JSONObject data = null)
	{
		int num = (int)data["payload"]["version"].n;
		int num2 = (int)data["payload"]["status"].n;
		string str = data["payload"]["packageId"].str;
		globals.debug(string.Concat(new object[]
		{
			"OnPackageReceiveToApp",
			num,
			":",
			num2,
			":",
			str
		}));
		int primaryDevice = globals.player_data.getPrimaryDevice();
		if (globals.BLE_manager.mConnectedDevices.ContainsKey(primaryDevice))
		{
			ConnectedDevice connectedDevice = globals.BLE_manager.mConnectedDevices[primaryDevice];
			globals.debug(string.Concat(new object[]
			{
				"OnPackageReceiveToAppEnv! ",
				connectedDevice.mDownLoadState.Count,
				":",
				globals.player_data.missionDownloadProgressState,
				":",
				this.isDeviceInHP(false)
			}));
			if (connectedDevice.mDownLoadState.Count == 0 && globals.player_data.missionDownloadProgressState == Constants.ContentDownLoadState.NULL && !this.isDeviceInHP(true))
			{
				this.sendPackageToToy(globals.player_data.getPrimaryDevice(), str, num);
			}
		}
	}

	// Token: 0x06000C47 RID: 3143 RVA: 0x000598F0 File Offset: 0x00057AF0
	private void setProgressListners()
	{
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceDisconnect));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.DOWNLOAD, new BLEManager.DataReceivedDelegate(this.OnDownloadUpdate));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_SUCCESS, new BLEManager.DataReceivedDelegate(this.OnPackageDownloadSuccess));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_FAIL, new BLEManager.DataReceivedDelegate(this.OnPackageDownloadFail));
	}

	// Token: 0x06000C48 RID: 3144 RVA: 0x00059960 File Offset: 0x00057B60
	private void removeProgressListners()
	{
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceDisconnect));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.DOWNLOAD, new BLEManager.DataReceivedDelegate(this.OnDownloadUpdate));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_SUCCESS, new BLEManager.DataReceivedDelegate(this.OnPackageDownloadSuccess));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_FAIL, new BLEManager.DataReceivedDelegate(this.OnPackageDownloadFail));
	}

	// Token: 0x06000C49 RID: 3145 RVA: 0x000599D0 File Offset: 0x00057BD0
	private void OnDownloadUpdate(JSONObject data)
	{
		if (data["id"].str == this.current_install)
		{
			float f = data["percent"].f;
			if (!data.HasField("error"))
			{
				this._install_progress = f / 100f;
			}
			else
			{
				globals.show_OK_alert(string.Empty, "Content download interrupted.", new EventDelegate.Callback(this.initDownload));
				DMOManager.LogDLCProgress(this.current_install, DMOManager.DOWNLOAD_PROGRESS.ERROR, Time.time - this._download_time, "Content download interrupted");
			}
		}
	}

	// Token: 0x06000C4A RID: 3146 RVA: 0x00059A68 File Offset: 0x00057C68
	public void initDownload()
	{
		globals.debug("initDownload");
		globals.player_data.missionDownloadProgressState = Constants.ContentDownLoadState.NULL;
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.RTO_ERROR, new BLEManager.DataReceivedDelegate(this.onRTOError));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.RTO_ERROR, new BLEManager.DataReceivedDelegate(this.onRTOError));
		globals.removeAlertPopup();
		this.removeProgressListners();
		this.reTryDownload();
	}

	// Token: 0x06000C4B RID: 3147 RVA: 0x00059AD0 File Offset: 0x00057CD0
	public void reTryDownload()
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		if (globals.BLE_manager.mConnectedDevices.ContainsKey(primaryDevice))
		{
			ConnectedDevice connectedDevice = globals.BLE_manager.mConnectedDevices[primaryDevice];
			if (!globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(primaryDevice))
			{
				return;
			}
			Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[primaryDevice];
			globals.debug("reTryDownload" + connectedDevice.mDownLoadState.Count + globals.player_data.missionDownloadProgressState);
			if (connectedDevice.mDownLoadState.Count == 0 && globals.player_data.missionDownloadProgressState == Constants.ContentDownLoadState.NULL)
			{
				List<string> downloadQueu = globals.player_data.getDownloadQueu(primaryDevice);
				if (downloadQueu.Count > 0)
				{
					this.setDeviceSleep(true);
					string text = downloadQueu[0];
					string version = dictionary[text].version;
					bool flag = MissionManager.getInstance().isPackageCached(primaryDevice, text, version);
					bool flag2 = MissionManager.getInstance().isPackageInstalled(primaryDevice, text, true);
					globals.debug(string.Concat(new object[]
					{
						"isCached isAllReadyInstalled",
						flag2,
						" : ",
						flag,
						" : ",
						version,
						" : ",
						text
					}));
					if (flag2)
					{
						globals.debug("packageId is allready insatlled" + text);
						globals.player_data.dequeueDownloadQueu(globals.player_data.getPrimaryDevice(), text);
						globals.player_data.addDLCContent(globals.BLE_manager.connectedDevice, text);
						this.initDownload();
						return;
					}
					if (flag && !this.isDeviceInHP(true))
					{
						int latestPackageVersion = globals.BLE_manager.getLatestPackageVersion(primaryDevice, text);
						this.sendPackageToToy(globals.player_data.getPrimaryDevice(), text, latestPackageVersion);
					}
					else
					{
						this.cachePackage(text);
					}
				}
			}
			else if (connectedDevice.mDownLoadState.Count > 0 && !this.isDeviceInHP(true))
			{
				this.setDeviceSleep(true);
				using (Dictionary<string, int>.Enumerator enumerator = connectedDevice.mDownLoadState.GetEnumerator())
				{
					if (enumerator.MoveNext())
					{
						KeyValuePair<string, int> keyValuePair = enumerator.Current;
						string key = keyValuePair.Key;
						int latestPackageVersion2 = globals.BLE_manager.getLatestPackageVersion(primaryDevice, key);
						bool flag3 = MissionManager.getInstance().isPackageCached(primaryDevice, key, latestPackageVersion2.ToString());
						globals.debug(string.Concat(new object[]
						{
							"isCached -- ",
							flag3,
							" : ",
							flag3,
							" : ",
							key,
							" : ",
							latestPackageVersion2.ToString()
						}));
						if (!flag3)
						{
							globals.BLE_manager.resetDownload(primaryDevice);
							this.cachePackage(key);
						}
						else
						{
							this.sendPackageToToy(globals.player_data.getPrimaryDevice(), key, latestPackageVersion2);
						}
					}
				}
			}
		}
	}

	// Token: 0x06000C4C RID: 3148 RVA: 0x00059DF0 File Offset: 0x00057FF0
	private void setDeviceSleep(bool isOn)
	{
		Screen.sleepTimeout = ((!isOn) ? -2 : -1);
	}

	// Token: 0x06000C4D RID: 3149 RVA: 0x00059E08 File Offset: 0x00058008
	private void sendPackageToToy(int deviceId, string packageId, int version)
	{
		globals.debug(string.Concat(new object[]
		{
			"sendPackageToToy",
			deviceId,
			" : ",
			packageId,
			" : ",
			version
		}));
		this.current_install = packageId;
		this._install_progress = 0f;
		this.setProgressListners();
		globals.player_data.missionDownloadProgressState = Constants.ContentDownLoadState.FETCHCONTENT;
		this._download_time = Time.time;
		DMOManager.LogDLCProgress(packageId, DMOManager.DOWNLOAD_PROGRESS.START, -1f, string.Empty);
		globals.BLE_manager.sendPackageToToy(deviceId, packageId, version);
	}

	// Token: 0x06000C4E RID: 3150 RVA: 0x00059EA0 File Offset: 0x000580A0
	private void onDeviceDisconnect(JSONObject data = null)
	{
		if (globals.BLE_manager.connectedDevice == -1)
		{
			globals.debug("Disconnected.....");
			globals.player_data.missionDownloadProgressState = Constants.ContentDownLoadState.NULL;
			globals.show_localized_OK_alert("PACKAGE DISCONNECT HEADER", "PACKAGE DISCONNECT BODY", null);
			DMOManager.LogDLCProgress(this.current_install, DMOManager.DOWNLOAD_PROGRESS.ERROR, Time.time - this._download_time, "Device got disconnected");
			this.current_install = string.Empty;
			this._install_progress = -1f;
			this.setDeviceSleep(false);
		}
	}

	// Token: 0x06000C4F RID: 3151 RVA: 0x00059F1C File Offset: 0x0005811C
	private void OnPackageDownloadSuccess(JSONObject data)
	{
		globals.debug("OnPackageDownloadSuccess" + data.Print(false));
		this.setDeviceSleep(false);
		globals.player_data.missionDownloadProgressState = Constants.ContentDownLoadState.NULL;
		if (data.HasField("missionId") && globals.BLE_manager.isPatchType(data["missionId"].str))
		{
			PopupAlert.Show(Localization.Get("PATCH_COMPLETE_TITLE"), Localization.Get("PATCH_COMPLETE_MESSAGE"), Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, new EventDelegate.Callback(this.onCancelReboot), 1f);
		}
		else if (data.HasField("missionId") && data["missionId"].str.Contains("env_"))
		{
			PopupAlert.Show(Localization.Get("CONTENT_COMPLETE_TITLE"), Localization.Get("ENV DOWNLOAD DONE"), Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, new EventDelegate.Callback(this.onCancelReboot), 1f);
		}
		else
		{
			PopupAlert.Show(Localization.Get("CONTENT_COMPLETE_TITLE"), Localization.Get("CONTENT_COMPLETE_MESSAGE"), Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, new EventDelegate.Callback(this.onCancelReboot), 1f);
		}
		globals.player_data.dequeueDownloadQueu(globals.player_data.getPrimaryDevice(), data["missionId"].str);
		DMOManager.LogDLCProgress(data["missionId"].str, DMOManager.DOWNLOAD_PROGRESS.COMPLETE, Time.time - this._download_time, string.Empty);
		globals.player_data.addDLCContent(globals.BLE_manager.connectedDevice, data["missionId"].str);
		this.current_install = string.Empty;
		this._install_progress = -1f;
		this.removeProgressListners();
	}

	// Token: 0x06000C50 RID: 3152 RVA: 0x0005A11C File Offset: 0x0005831C
	private void onRTOError(JSONObject data)
	{
		globals.show_OK_alert("RTO ERROR", Localization.Get("CONTENT_DOWNLOAD_INTERRUPTED_SERVER_ERROR"), null);
	}

	// Token: 0x06000C51 RID: 3153 RVA: 0x0005A134 File Offset: 0x00058334
	private void OnPackageDownloadFail(JSONObject data)
	{
		globals.debug("OnPackageDownloadFail" + data.Print(false));
		globals.show_OK_alert("Download Intrupted ", "Content download intrupted.Please press OKAY to continue.", new EventDelegate.Callback(this.initDownload));
		DMOManager.LogDLCProgress(this.current_install, DMOManager.DOWNLOAD_PROGRESS.ERROR, Time.time - this._download_time, "OnPackageDownloadFail");
		this.current_install = string.Empty;
		this._install_progress = -1f;
		this.setDeviceSleep(false);
	}

	// Token: 0x06000C52 RID: 3154 RVA: 0x0005A1AC File Offset: 0x000583AC
	public bool isReadyToDownload(string entitlements = "")
	{
		if (string.IsNullOrEmpty(entitlements))
		{
			return false;
		}
		int primaryDevice = globals.player_data.getPrimaryDevice();
		if (globals.player_data.isGuestLogin())
		{
			globals.show_OK_alert("Sign in ", " Please sign in ", new EventDelegate.Callback(this.onLogin));
			return false;
		}
		if (primaryDevice == 0)
		{
			globals.show_OK_alert("Device Connection", "Please register your device!!", null);
			return false;
		}
		return true;
	}

	// Token: 0x06000C53 RID: 3155 RVA: 0x0005A218 File Offset: 0x00058418
	private void onLogin()
	{
		globals.FTUE_manager.login();
	}

	// Token: 0x06000C54 RID: 3156 RVA: 0x0005A224 File Offset: 0x00058424
	private void onCancelReboot()
	{
		DMOManager.LogScenePlayTime(AnalyticsStrings.GetAnalyticsTranslationName(NavigationManager.current_scene()), Time.timeSinceLevelLoad.ToString(), DMOManager.LEVEL_TIME_CHANGE_REASON.PLAYERINITIALIZED);
	}

	// Token: 0x06000C55 RID: 3157 RVA: 0x0005A250 File Offset: 0x00058450
	private bool isDeviceInHP(bool do_popup = true)
	{
		if (globals.file_transfer_allowed == 0)
		{
			if (do_popup)
			{
				GameObject gameObject = GameObject.Find("UI Root");
				PopupAlert.Show(string.Empty, Localization.Get("CONTENT_DOWNLOAD_NOTALLOWED_HP"), Localization.Get("OKAY"), gameObject.transform.gameObject, null, 1f);
			}
			return true;
		}
		return false;
	}

	// Token: 0x06000C56 RID: 3158 RVA: 0x0005A2AC File Offset: 0x000584AC
	public void OnPackageReceiveFailToAppEnv(JSONObject data = null)
	{
		if (data.HasField("payload") && data["payload"].HasField("packageId"))
		{
			string str = data["payload"]["packageId"].str;
			this.cachePackage(str);
			DMOManager.LogDLCProgress(str, DMOManager.DOWNLOAD_PROGRESS.ERROR, Time.time - this._download_time, "Unable to download or unzip");
		}
		globals.show_OK_alert(string.Empty, "Content download interrupted.", null);
		this.setDeviceSleep(false);
	}

	// Token: 0x04000BF8 RID: 3064
	public string current_install = string.Empty;

	// Token: 0x04000BF9 RID: 3065
	private float _install_progress = -1f;

	// Token: 0x04000BFA RID: 3066
	private float _download_time;
}
