using System;
using UnityEngine;

// Token: 0x0200018A RID: 394
public class FirmwareResumeManager : CallbackMonoBehavior
{
	// Token: 0x06000C0F RID: 3087 RVA: 0x000584B8 File Offset: 0x000566B8
	private void Start()
	{
		if (globals.build_type == build_type_enum.field_test)
		{
			base.enabled = false;
			return;
		}
		if (globals.touring() || !globals.FTUE_manager.done)
		{
			this.isTourOn = true;
			globals.debug("isTourOn");
		}
		else
		{
			this.isTourOn = false;
		}
		if (!this.isTourOn && globals.player_data.firmwareDownloadProgressState != Constants.FirmwareDownLoadState.NULL && this.isFirmwareReady())
		{
			this.initFirmwareDownlaod();
		}
		if (!this.isTourOn && globals.BLE_manager.connectedDevice != -1 && this.isFirmwareUnderProgressFromLastSession())
		{
			this.initFirmwareDownlaod();
		}
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_AVAILABLE, new BLEManager.DataReceivedDelegate(this.onFirmwareinfoRecieved));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.SAFE_TO_FIRMWARE, new BLEManager.DataReceivedDelegate(this.onOtherDownlaodStatus));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceDisconnect));
		globals.debug("FirmwareResumeManager");
	}

	// Token: 0x06000C10 RID: 3088 RVA: 0x000585BC File Offset: 0x000567BC
	private bool snooze_expired()
	{
		if (!globals.hq_main)
		{
			return false;
		}
		if (globals.update_snooze < 0f)
		{
			return true;
		}
		float num = Time.realtimeSinceStartup - globals.update_snooze;
		return num > this.snooze_minutes * 60f;
	}

	// Token: 0x06000C11 RID: 3089 RVA: 0x00058608 File Offset: 0x00056808
	private void Update()
	{
		if (!globals.touring() && globals.FTUE_manager.done)
		{
			this.isTourOn = false;
		}
		if (globals.BLE_manager.connectedDevice > -1 && !this.isTourOn && !this.firmwareOn && globals.isFirmwareUpdateAvailable && globals.player_data.getDownloadQueu(globals.player_data.getPrimaryDevice()).Count == 0 && globals.hq_main && globals.hq_main.menu_state == hq_menu_state_enum.main && globals.player_data.firmwareDownloadProgressState == Constants.FirmwareDownLoadState.NULL)
		{
			globals.debug("on Update FirmwareResumeManager");
			this.resumeIfFirmware();
		}
	}

	// Token: 0x06000C12 RID: 3090 RVA: 0x000586C0 File Offset: 0x000568C0
	public void resumeIfFirmware()
	{
		globals.debug(string.Concat(new object[]
		{
			"resumeIfFirmware :",
			globals.isFirmwareUpdateAvailable,
			":",
			globals.player_data.getDownloadQueu(globals.player_data.getPrimaryDevice()).Count
		}));
		if (globals.isFirmwareUpdateAvailable && globals.player_data.getDownloadQueu(globals.player_data.getPrimaryDevice()).Count == 0 && this.snooze_expired())
		{
			this.onFirmwareUpdateAvailable(null);
		}
	}

	// Token: 0x06000C13 RID: 3091 RVA: 0x00058758 File Offset: 0x00056958
	public bool full_screen_panel_active()
	{
		return this.firmwareUpdatePanel && this.firmwareUpdatePanel.showing();
	}

	// Token: 0x06000C14 RID: 3092 RVA: 0x00058778 File Offset: 0x00056978
	public void onDeviceDisconnect(JSONObject data = null)
	{
		globals.isFirmwareUpdateAvailable = false;
		this.firmwareinfoRecieved = (this.noOtherDownloadUnderProgress = (this.firmwareOn = false));
	}

	// Token: 0x06000C15 RID: 3093 RVA: 0x000587A4 File Offset: 0x000569A4
	public void onFirmwareinfoRecieved(JSONObject data = null)
	{
		this.firmwareinfoRecieved = true;
		if (this.firmwareinfoRecieved && this.noOtherDownloadUnderProgress)
		{
			this.onFirmwareUpdateAvailable(null);
		}
		globals.debug("firmwareinfoRecieved");
	}

	// Token: 0x06000C16 RID: 3094 RVA: 0x000587E0 File Offset: 0x000569E0
	public void onOtherDownlaodStatus(JSONObject data = null)
	{
		this.noOtherDownloadUnderProgress = true;
		if (this.firmwareinfoRecieved && this.noOtherDownloadUnderProgress)
		{
			this.onFirmwareUpdateAvailable(null);
		}
		globals.debug("noOtherDownloadUnderProgress");
	}

	// Token: 0x06000C17 RID: 3095 RVA: 0x0005881C File Offset: 0x00056A1C
	public void onFirmwareUpdateAvailable(JSONObject data = null)
	{
		globals.debug("onFirmwareUpdateAvailable *****:" + globals.player_data.getPrimaryDevice());
		if (this.isTourOn || this.firmwareOn || globals.BLE_manager.connectedDevice == -1)
		{
			return;
		}
		int primaryDevice = globals.player_data.getPrimaryDevice();
		if (globals.BLE_manager.mConnectedDevices.ContainsKey(primaryDevice))
		{
			ConnectedDevice connectedDevice = globals.BLE_manager.mConnectedDevices[primaryDevice];
			globals.debug(string.Concat(new object[]
			{
				"onFirmwareUpdateAvailable",
				globals.BLE_manager.connectedDevice,
				":",
				this.isFirmwareUnderProgressFromLastSession()
			}));
			globals.debug(string.Concat(new object[]
			{
				"onFirmwareUpdateAvailable || ",
				connectedDevice.mDownLoadState.Count,
				" : ",
				globals.player_data.firmwareDownloadProgressState,
				" : ",
				this.firmwareUpdatePanel,
				":",
				globals.progress_report_pending(),
				":",
				this.snooze_expired()
			}));
			if (globals.BLE_manager.connectedDevice != -1 && this.isFirmwareUnderProgressFromLastSession())
			{
				this.firmwareOn = true;
				this.initFirmwareDownlaod();
			}
			else if (connectedDevice.mDownLoadState.Count == 0 && globals.player_data.firmwareDownloadProgressState == Constants.FirmwareDownLoadState.NULL && this.firmwareUpdatePanel != null && !globals.progress_report_pending() && this.snooze_expired() && globals.isFirmwareUpdateAvailable)
			{
				this.firmwareUpdatePanel.gameObject.SetActive(true);
				this.firmwareOn = true;
				globals.debug("onFirmwareUpdateAvailable |||");
				if (!this.updateNotification.gameObject.activeSelf)
				{
					this.updateNotification.gameObject.SetActive(true);
				}
				DMOManager.LogGameAction("firmware", "screen", string.Empty, null);
			}
		}
	}

	// Token: 0x06000C18 RID: 3096 RVA: 0x00058A3C File Offset: 0x00056C3C
	public void showUI()
	{
		this.firmwareOn = false;
		this.onFirmwareUpdateAvailable(null);
	}

	// Token: 0x06000C19 RID: 3097 RVA: 0x00058A4C File Offset: 0x00056C4C
	private void initFirmwareDownlaod()
	{
		this.firmwareUpdateProgressGadget.SetActive(true);
		firmwareProgressUpdate component = this.firmwareUpdateProgressGadget.GetComponent<firmwareProgressUpdate>();
		component.initUI();
		globals.firmware_manager.init();
	}

	// Token: 0x06000C1A RID: 3098 RVA: 0x00058A84 File Offset: 0x00056C84
	private bool isFirmwareUnderProgressFromLastSession()
	{
		globals.debug(string.Concat(new object[]
		{
			globals.player_data.firmwareDownloadProgressState,
			":",
			globals.player_data.firmwareUpdateStarted,
			":",
			globals.player_data.firmwareUpdateFinished,
			":",
			globals.isFirmwareUpdateAvailable
		}));
		if (globals.player_data.firmwareDownloadProgressState == Constants.FirmwareDownLoadState.NULL && globals.player_data.firmwareUpdateStarted && !globals.player_data.firmwareUpdateFinished && globals.isFirmwareUpdateAvailable)
		{
			globals.debug(string.Concat(new object[]
			{
				"resuming Firmware download:",
				globals.player_data.firmwareUpdateStarted,
				":",
				globals.player_data.firmwareUpdateFinished
			}));
			return true;
		}
		return false;
	}

	// Token: 0x06000C1B RID: 3099 RVA: 0x00058B7C File Offset: 0x00056D7C
	private bool isFirmwareReady()
	{
		if (!globals.network_manager.connected())
		{
			globals.show_no_internet_alert(null);
			return false;
		}
		if (globals.file_transfer_allowed == 0)
		{
			globals.show_OK_alert("FILE TRANSFER NOT ALLOWED", Localization.Get("FIRMWARE_DOWNLOAD_NOTALLOWED_HP"), null);
			return false;
		}
		if (globals.player_data.missionDownloadProgressState != Constants.ContentDownLoadState.NULL)
		{
			globals.show_OK_alert(string.Empty, Localization.Get("WAIT_TO_UPDATE_DONE"), null);
			return false;
		}
		return true;
	}

	// Token: 0x06000C1C RID: 3100 RVA: 0x00058BE8 File Offset: 0x00056DE8
	public void setFirmwareUI()
	{
		globals.debug("setFirmwareUI ");
		base.CancelInvoke("resumeIfFirmware");
		base.Invoke("resumeIfFirmware", 2f);
	}

	// Token: 0x04000BDF RID: 3039
	public GameObject firmwareUpdateProgressGadget;

	// Token: 0x04000BE0 RID: 3040
	public FirmwareUpdatePanelBehavior firmwareUpdatePanel;

	// Token: 0x04000BE1 RID: 3041
	public GameObject updateNotification;

	// Token: 0x04000BE2 RID: 3042
	public float snooze_minutes = 1f;

	// Token: 0x04000BE3 RID: 3043
	private bool noOtherDownloadUnderProgress;

	// Token: 0x04000BE4 RID: 3044
	private bool firmwareinfoRecieved;

	// Token: 0x04000BE5 RID: 3045
	private bool isTourOn;

	// Token: 0x04000BE6 RID: 3046
	public bool firmwareOn;
}
