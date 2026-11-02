using System;

// Token: 0x02000191 RID: 401
public class patchProgressUpdate : CallbackMonoBehavior
{
	// Token: 0x06000C58 RID: 3160 RVA: 0x0005A33C File Offset: 0x0005853C
	private void Awake()
	{
		this.resetProgressUI();
	}

	// Token: 0x06000C59 RID: 3161 RVA: 0x0005A344 File Offset: 0x00058544
	public void initUI()
	{
		this.progress_panel.set_completion(-1);
		base._callback_handler.removeAllCallbacks();
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.DOWNLOAD, new BLEManager.DataReceivedDelegate(this.OnDownloadUpdate));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_SUCCESS, new BLEManager.DataReceivedDelegate(this.onDownloadFinish));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_FAIL, new BLEManager.DataReceivedDelegate(this.onDownLoadIntrupted));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDownLoadIntrupted));
	}

	// Token: 0x06000C5A RID: 3162 RVA: 0x0005A3CC File Offset: 0x000585CC
	public void onDownLoadIntrupted(JSONObject data = null)
	{
		this.resetProgressUI();
		this.resetUI();
	}

	// Token: 0x06000C5B RID: 3163 RVA: 0x0005A3DC File Offset: 0x000585DC
	public void onDownloadFinish(JSONObject data)
	{
		this.resetUI();
	}

	// Token: 0x06000C5C RID: 3164 RVA: 0x0005A3E4 File Offset: 0x000585E4
	private void resetUI()
	{
		globals.debug("BLE_DEVICE_DISCONNECT from firmwareProgressUpdate");
	}

	// Token: 0x06000C5D RID: 3165 RVA: 0x0005A3F0 File Offset: 0x000585F0
	private void resetProgressUI()
	{
		this.progress_panel.set_completion(-1);
	}

	// Token: 0x06000C5E RID: 3166 RVA: 0x0005A400 File Offset: 0x00058600
	private void Update()
	{
		int globalProgress = MissionManager.getInstance().getGlobalProgress();
		this.progress_panel.set_completion(globalProgress);
		this.progress_panel.gameObject.SetActive(globalProgress >= 0);
	}

	// Token: 0x06000C5F RID: 3167 RVA: 0x0005A43C File Offset: 0x0005863C
	public void OnDownloadUpdate(JSONObject data)
	{
	}

	// Token: 0x04000BFB RID: 3067
	public DownloadProgressPanelBehavior progress_panel;
}
