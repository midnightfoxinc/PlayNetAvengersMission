using System;
using UnityEngine;

// Token: 0x0200018D RID: 397
public class PatchUpdateResumeManager : CallbackMonoBehavior
{
	// Token: 0x06000C28 RID: 3112 RVA: 0x00058FB8 File Offset: 0x000571B8
	private void Start()
	{
		if (globals.touring() || !globals.FTUE_manager.done)
		{
			base.enabled = false;
			return;
		}
		globals.debug("PatchUpdateResumeManager");
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.SAFE_TO_PATCHUI, new BLEManager.DataReceivedDelegate(this.isSafeToLauchUI));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.CONTENT_PRESENT, new BLEManager.DataReceivedDelegate(this.onContentInfo));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.ENTITLE_PACKAGE_EVENT, new BLEManager.DataReceivedDelegate(this.onEntitleInfo));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_UPTODATE, new BLEManager.DataReceivedDelegate(this.onFirmwareUpToDate));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceDisconnect));
	}

	// Token: 0x06000C29 RID: 3113 RVA: 0x00059070 File Offset: 0x00057270
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

	// Token: 0x06000C2A RID: 3114 RVA: 0x000590BC File Offset: 0x000572BC
	public bool full_screen_panel_active()
	{
		return this.patchUpdatePanel && this.patchUpdatePanel.showing();
	}

	// Token: 0x06000C2B RID: 3115 RVA: 0x000590DC File Offset: 0x000572DC
	public void onDeviceDisconnect(JSONObject data)
	{
		globals.update_snooze = -1f;
		this.entitleInfo = (this.contentInfo = (this.firmwareuptodate = (this.safeToLauchUI = false)));
	}

	// Token: 0x06000C2C RID: 3116 RVA: 0x00059118 File Offset: 0x00057318
	public void isSafeToLauchUI(JSONObject data)
	{
		this.safeToLauchUI = true;
		if (this.entitleInfo && this.contentInfo && this.firmwareuptodate && this.safeToLauchUI)
		{
			this.isAnyPatchDue(null);
		}
	}

	// Token: 0x06000C2D RID: 3117 RVA: 0x00059160 File Offset: 0x00057360
	public void onFirmwareUpToDate(JSONObject data)
	{
		this.firmwareuptodate = true;
		if (this.entitleInfo && this.contentInfo && this.firmwareuptodate && this.safeToLauchUI)
		{
			this.isAnyPatchDue(null);
		}
	}

	// Token: 0x06000C2E RID: 3118 RVA: 0x000591A8 File Offset: 0x000573A8
	public void onEntitleInfo(JSONObject data)
	{
		this.entitleInfo = true;
		if (this.entitleInfo && this.contentInfo && this.firmwareuptodate && this.safeToLauchUI)
		{
			this.isAnyPatchDue(null);
		}
	}

	// Token: 0x06000C2F RID: 3119 RVA: 0x000591F0 File Offset: 0x000573F0
	public void onContentInfo(JSONObject data)
	{
		this.contentInfo = true;
		if (this.entitleInfo && this.contentInfo && this.firmwareuptodate && this.safeToLauchUI)
		{
			this.isAnyPatchDue(null);
		}
	}

	// Token: 0x06000C30 RID: 3120 RVA: 0x00059238 File Offset: 0x00057438
	private void isAnyPatchDue(JSONObject data = null)
	{
		string availablePatchId = globals.BLE_manager.getAvailablePatchId();
		globals.debug(string.Concat(new object[]
		{
			"isAnyPatchDue ",
			availablePatchId,
			" : ",
			data,
			":",
			this.entitleInfo,
			":",
			this.contentInfo,
			":",
			this.safeToLauchUI,
			":",
			this.firmwareuptodate,
			":",
			this.snooze_expired()
		}));
		if (!string.IsNullOrEmpty(availablePatchId) && globals.player_data.missionDownloadProgressState == Constants.ContentDownLoadState.NULL && this.snooze_expired())
		{
			globals.debug("Launching the patchUI");
			this.showUI();
		}
	}

	// Token: 0x06000C31 RID: 3121 RVA: 0x00059324 File Offset: 0x00057524
	public void showUI()
	{
		if (globals.BLE_manager.connectedDevice != -1)
		{
			this.patchUpdatePanel.gameObject.SetActive(true);
			if (!this.updateNotification.gameObject.activeSelf)
			{
				this.updateNotification.gameObject.SetActive(true);
			}
		}
		else
		{
			globals.show_OK_alert(Localization.Get("MISSING MISSION HEADER"), Localization.Get("DEVICE_DISCONNECTED_ALERT"), null);
		}
	}

	// Token: 0x06000C32 RID: 3122 RVA: 0x00059398 File Offset: 0x00057598
	private bool isDownloadAllowed()
	{
		if (globals.file_transfer_allowed == 0)
		{
			GameObject gameObject = GameObject.Find("UI Root");
			PopupAlert.Show(string.Empty, Localization.Get("CONTENT_DOWNLOAD_NOTALLOWED_HP"), Localization.Get("OKAY"), gameObject.transform.gameObject, null, 1f);
			return false;
		}
		return globals.player_data.firmwareDownloadProgressState == Constants.FirmwareDownLoadState.NULL;
	}

	// Token: 0x06000C33 RID: 3123 RVA: 0x00059400 File Offset: 0x00057600
	private void initDownlaodUI()
	{
		this.patchUpdateProgressGadget.SetActive(true);
		patchProgressUpdate component = this.patchUpdateProgressGadget.GetComponent<patchProgressUpdate>();
		component.initUI();
	}

	// Token: 0x06000C34 RID: 3124 RVA: 0x0005942C File Offset: 0x0005762C
	private void Update()
	{
		if (!string.IsNullOrEmpty(globals.packageDownload_manager.current_install) && !this.patchUpdateProgressGadget.gameObject.activeSelf)
		{
			this.initDownlaodUI();
		}
	}

	// Token: 0x04000BEA RID: 3050
	public GameObject patchUpdateProgressGadget;

	// Token: 0x04000BEB RID: 3051
	public PatchUpdatePanelBehavior patchUpdatePanel;

	// Token: 0x04000BEC RID: 3052
	public GameObject updateNotification;

	// Token: 0x04000BED RID: 3053
	public float snooze_minutes = 1f;

	// Token: 0x04000BEE RID: 3054
	private bool entitleInfo;

	// Token: 0x04000BEF RID: 3055
	private bool contentInfo;

	// Token: 0x04000BF0 RID: 3056
	private bool firmwareuptodate;

	// Token: 0x04000BF1 RID: 3057
	private bool safeToLauchUI;
}
