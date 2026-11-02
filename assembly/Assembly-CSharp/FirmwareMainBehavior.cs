using System;
using UnityEngine;

// Token: 0x020002E4 RID: 740
public class FirmwareMainBehavior : CallbackMonoBehavior
{
	// Token: 0x06001368 RID: 4968 RVA: 0x0008AB40 File Offset: 0x00088D40
	public void init()
	{
		this._newFirmwareId = globals.BLE_manager.getsystemUpdateId();
		this.mRoot = GameObject.Find("UI Root");
		globals.debug("FirmwareMainBehavior init:" + this._newFirmwareId);
		if (globals.player_data.firmwareDownloadProgressState != Constants.FirmwareDownLoadState.NULL)
		{
			this.registerBaseListners();
			this.resumeDownLoad();
		}
		else if (this.isReadyToDownload())
		{
			this.registerBaseListners();
			this.initDownload();
		}
		Screen.sleepTimeout = -1;
	}

	// Token: 0x06001369 RID: 4969 RVA: 0x0008ABC0 File Offset: 0x00088DC0
	private void Start()
	{
		globals.debug("FirmwareMainBehavior Start:" + this._newFirmwareId);
	}

	// Token: 0x0600136A RID: 4970 RVA: 0x0008ABD8 File Offset: 0x00088DD8
	public void registerBaseListners()
	{
		this.removeDeviceEventCallbacksAfterDownloadDone();
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.RTO_ERROR, new BLEManager.DataReceivedDelegate(this.onRTOError));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceDisconnect));
	}

	// Token: 0x0600136B RID: 4971 RVA: 0x0008AC20 File Offset: 0x00088E20
	public void onRTOError(JSONObject data)
	{
		this.mRoot = GameObject.Find("UI Root");
		globals.debug("RTO ERROR on Firmware" + data);
		if (data.HasField("Network Error Code") && (data["Network Error Code"].str == "0" || data["Network Error Code"].n == 0.0))
		{
			this.onManifestDownloadFail();
		}
		else
		{
			PopupAlert.Show(string.Empty, Localization.Get("FIRMWARE_DOWNLOAD_FAIL_ALERT"), Localization.Get("OKAY"), this.mRoot.transform.gameObject, new EventDelegate.Callback(this.onManifestDownloadFail), 1f);
		}
	}

	// Token: 0x0600136C RID: 4972 RVA: 0x0008ACE4 File Offset: 0x00088EE4
	private void initFetchFirmwareVersion()
	{
		if (this.isReadyToDownload())
		{
			globals.player_data.firmwareUpdateStarted = true;
			globals.player_data.firmwareUpdateFinished = false;
			globals.player_data.saveGameFile();
			base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_AVAILABLE, new BLEManager.DataReceivedDelegate(this.initFetchManifest));
			globals.BLE_manager.getFirmwareVersion(true);
			globals.BLE_manager.getFirmwareVersion(true);
		}
	}

	// Token: 0x0600136D RID: 4973 RVA: 0x0008AD4C File Offset: 0x00088F4C
	public void initFetchManifest(JSONObject data)
	{
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_AVAILABLE, new BLEManager.DataReceivedDelegate(this.initFetchManifest));
		globals.player_data.firmwareDownloadProgressState = Constants.FirmwareDownLoadState.FETCHMANIFEST;
		globals.debug("initFetchManifest" + data.Print(false));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_RECEIVED, new BLEManager.DataReceivedDelegate(this.initFetchFirmwareManifestDownload));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_RECEIVED_ERROR, new BLEManager.DataReceivedDelegate(this.OnFetchFirmwareManifestFail));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_METADATA_ERROR, new BLEManager.DataReceivedDelegate(this.OnFetchFirmwareManifestFail));
		NativeManager.getNative().requestFirmware(globals.BLE_manager.connectedDevice);
	}

	// Token: 0x0600136E RID: 4974 RVA: 0x0008ADF4 File Offset: 0x00088FF4
	public void initFetchFirmwareManifestDownload(JSONObject data = null)
	{
		globals.debug("initFetchFirmwareManifestDownload" + data);
		globals.player_data.firmwareDownloadProgressState = Constants.FirmwareDownLoadState.FETCHFIRMWARE;
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_RECEIVED_ERROR, new BLEManager.DataReceivedDelegate(this.OnFetchFirmwareManifestFail));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_RECEIVED, new BLEManager.DataReceivedDelegate(this.initFetchFirmwareManifestDownload));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_STATUS, new BLEManager.DataReceivedDelegate(this.OnDownloadUpdate));
		if (data != null && data.HasField("fwpFilename"))
		{
			globals.player_data.firmwarefwpFilename = data["fwpFilename"].str;
		}
		string firmwarefwpFilename = globals.player_data.firmwarefwpFilename;
		globals.debug("fwpFilename" + firmwarefwpFilename);
		if (firmwarefwpFilename != null)
		{
			NativeManager.getNative().uploadFirmware(globals.BLE_manager.connectedDevice, firmwarefwpFilename);
		}
		else
		{
			globals.debug("fwpFilename is null");
		}
	}

	// Token: 0x0600136F RID: 4975 RVA: 0x0008AEDC File Offset: 0x000890DC
	public void OnFetchFirmwareManifestFail(JSONObject data = null)
	{
		globals.debug("OnManifestFail: " + this._newFirmwareId);
		this.mRoot = GameObject.Find("UI Root");
		PopupAlert.Show(string.Empty, Localization.Get("FIRMWARE_DOWNLOAD_FAIL_ALERT"), Localization.Get("OKAY"), this.mRoot.transform.gameObject, new EventDelegate.Callback(this.onManifestDownloadFail), 1f);
		DMOManager.LogFirmwarerProgress(this._newFirmwareId, DMOManager.DOWNLOAD_PROGRESS.ERROR, "Firmware manifest Download Fail");
	}

	// Token: 0x06001370 RID: 4976 RVA: 0x0008AF60 File Offset: 0x00089160
	public void onDeviceDisconnect(JSONObject data = null)
	{
		globals.debug("Device Disconnected Firmware");
		if (globals.BLE_manager.connectedDevice == -1)
		{
			this.downloadProgress = 0;
			PopupAlert.Show(string.Empty, Localization.Get("DEVICE_DISCONNECTED_ALERT"), Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, new EventDelegate.Callback(this.OnClose), 1f);
			DMOManager.LogFirmwarerProgress(this._newFirmwareId, DMOManager.DOWNLOAD_PROGRESS.ERROR, "Device got disconnected");
			this._newFirmwareId = string.Empty;
		}
	}

	// Token: 0x06001371 RID: 4977 RVA: 0x0008AFF0 File Offset: 0x000891F0
	private void tryOnInternetDown()
	{
		globals.update_snooze = -1f;
		FirmwareResumeManager componentInParent = base.gameObject.GetComponentInParent<FirmwareResumeManager>();
		componentInParent.firmwareOn = false;
		componentInParent.onFirmwareUpdateAvailable(null);
	}

	// Token: 0x06001372 RID: 4978 RVA: 0x0008B024 File Offset: 0x00089224
	public bool isReadyToDownload()
	{
		this.mRoot = GameObject.Find("UI Root");
		PlayerData player_data = globals.player_data;
		if (!globals.network_manager.connected())
		{
			globals.show_no_internet_alert(new EventDelegate.Callback(this.tryOnInternetDown));
		}
		if (player_data.isGuestLogin())
		{
			PopupAlert.Show("Sign in ", "Please sign in ", "OK", this.mRoot.transform.gameObject, new EventDelegate.Callback(this.onLogin), 1f);
			return false;
		}
		if (globals.player_data.getPrimaryDevice() == 0)
		{
			PopupAlert.Show("Device Connection  ~", "Please register your device!!", Localization.Get("OKAY"), this.mRoot.transform.gameObject, null, 1f);
			return false;
		}
		return true;
	}

	// Token: 0x06001373 RID: 4979 RVA: 0x0008B0EC File Offset: 0x000892EC
	public void initDownload()
	{
		globals.player_data.firmwareDownloadProgressState = Constants.FirmwareDownLoadState.NULL;
		this._newFirmwareId = globals.BLE_manager.getsystemUpdateId();
		DMOManager.LogFirmwarerProgress(this._newFirmwareId, DMOManager.DOWNLOAD_PROGRESS.START, string.Empty);
		globals.debug("initDownload firmware" + globals.BLE_manager.connectedDevice);
		if (globals.BLE_manager.connectedDevice != -1)
		{
			globals.removeAlertPopup();
			this.removeDeviceEventCallback();
			this.initFetchFirmwareVersion();
		}
	}

	// Token: 0x06001374 RID: 4980 RVA: 0x0008B164 File Offset: 0x00089364
	public void OnDownloadUpdate(JSONObject data)
	{
		int num = 0;
		bool flag = false;
		if (data.HasField("finished"))
		{
			flag = data["finished"].b;
		}
		if (data.HasField("percent"))
		{
			num = (int)data["percent"].n;
		}
		this.downloadProgress = num;
		if (!data.HasField("error"))
		{
			if (flag)
			{
				globals.isFirmwareUpdateAvailable = false;
				this.removeDeviceEventCallbacksAfterDownloadDone();
				globals.player_data.firmwareUpdateStarted = false;
				globals.player_data.firmwareUpdateFinished = true;
				globals.player_data.saveGameFile();
				globals.player_data.updateFirmwareVersion(globals.BLE_manager.connectedDevice, data["name"].str);
				globals.player_data.firmwareDownloadProgressState = Constants.FirmwareDownLoadState.NULL;
				DMOManager.LogFirmwarerProgress(this._newFirmwareId, DMOManager.DOWNLOAD_PROGRESS.COMPLETE, string.Empty);
				this._newFirmwareId = string.Empty;
				this.mRoot = GameObject.Find("UI Root");
				PopupAlert.Show(Localization.Get("FIRMWARE_COMPLETE_TITLE"), Localization.Get("FIRMWARE_COMPLETE_MESSAGE"), Localization.Get("OKAY"), this.mRoot.transform.gameObject, new EventDelegate.Callback(this.onDownloadDone), 1f);
			}
		}
		else
		{
			DMOManager.LogFirmwarerProgress(this._newFirmwareId, DMOManager.DOWNLOAD_PROGRESS.ERROR, "Download Intrupted");
			this.mRoot = GameObject.Find("UI Root");
			PopupAlert.Show(string.Empty, Localization.Get("FIRMWARE_DOWNLOAD_INTERRUPTED"), Localization.Get("OKAY"), this.mRoot.transform.gameObject, new EventDelegate.Callback(this.initDownload), 1f);
		}
	}

	// Token: 0x06001375 RID: 4981 RVA: 0x0008B308 File Offset: 0x00089508
	public void OnClose()
	{
		globals.debug("OnClose firmware");
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_STATUS, new BLEManager.DataReceivedDelegate(this.OnDownloadUpdate));
		if (this.isReadyToDownload())
		{
			this.initDownload();
		}
	}

	// Token: 0x06001376 RID: 4982 RVA: 0x0008B34C File Offset: 0x0008954C
	private void onLogin()
	{
		globals.FTUE_manager.login();
	}

	// Token: 0x06001377 RID: 4983 RVA: 0x0008B358 File Offset: 0x00089558
	private void onManifestDownloadFail()
	{
		globals.BLE_manager.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_INTERRUPTED, string.Empty);
	}

	// Token: 0x06001378 RID: 4984 RVA: 0x0008B36C File Offset: 0x0008956C
	private void onDownloadDone()
	{
		globals.BLE_manager.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_STATUS, string.Empty);
	}

	// Token: 0x06001379 RID: 4985 RVA: 0x0008B380 File Offset: 0x00089580
	private void resumeDownLoad()
	{
		Constants.FirmwareDownLoadState firmwareDownloadProgressState = globals.player_data.firmwareDownloadProgressState;
		if (firmwareDownloadProgressState != Constants.FirmwareDownLoadState.FETCHMANIFEST)
		{
			if (firmwareDownloadProgressState == Constants.FirmwareDownLoadState.FETCHFIRMWARE)
			{
				base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_STATUS, new BLEManager.DataReceivedDelegate(this.OnDownloadUpdate));
			}
		}
		else
		{
			this.initFetchFirmwareManifestDownload(null);
		}
	}

	// Token: 0x0600137A RID: 4986 RVA: 0x0008B3D8 File Offset: 0x000895D8
	private void removeDeviceEventCallback()
	{
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_AVAILABLE, new BLEManager.DataReceivedDelegate(this.initFetchManifest));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_RECEIVED, new BLEManager.DataReceivedDelegate(this.initFetchFirmwareManifestDownload));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_METADATA_ERROR, new BLEManager.DataReceivedDelegate(this.OnFetchFirmwareManifestFail));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_STATUS, new BLEManager.DataReceivedDelegate(this.OnDownloadUpdate));
	}

	// Token: 0x0600137B RID: 4987 RVA: 0x0008B44C File Offset: 0x0008964C
	private void removeDeviceEventCallbacksAfterDownloadDone()
	{
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceDisconnect));
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.RTO_ERROR, new BLEManager.DataReceivedDelegate(this.onRTOError));
	}

	// Token: 0x0600137C RID: 4988 RVA: 0x0008B48C File Offset: 0x0008968C
	public void OnDestroy()
	{
		Screen.sleepTimeout = -2;
	}

	// Token: 0x040014E8 RID: 5352
	private GameObject mRoot;

	// Token: 0x040014E9 RID: 5353
	private string _newFirmwareId;

	// Token: 0x040014EA RID: 5354
	public int downloadProgress;
}
