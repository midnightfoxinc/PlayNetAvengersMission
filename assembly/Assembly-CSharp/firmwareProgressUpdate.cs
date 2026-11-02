using System;

// Token: 0x0200018E RID: 398
public class firmwareProgressUpdate : CallbackMonoBehavior
{
	// Token: 0x06000C36 RID: 3126 RVA: 0x00059468 File Offset: 0x00057668
	private void Awake()
	{
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_FINISH_NOTIFICATION, new BLEManager.DataReceivedDelegate(this.onDownloadFinish));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDownLoadIntrupted));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_INTERRUPTED, new BLEManager.DataReceivedDelegate(this.onDownLoadIntrupted));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_STATUS, new BLEManager.DataReceivedDelegate(this.OnDownloadUpdate));
		this.resetProgressUI();
	}

	// Token: 0x06000C37 RID: 3127 RVA: 0x000594E0 File Offset: 0x000576E0
	public void initUI()
	{
		this.resetProgressUI();
	}

	// Token: 0x06000C38 RID: 3128 RVA: 0x000594E8 File Offset: 0x000576E8
	public void onDownLoadIntrupted(JSONObject data = null)
	{
		this.resetProgressUI();
		this.resetUI();
	}

	// Token: 0x06000C39 RID: 3129 RVA: 0x000594F8 File Offset: 0x000576F8
	public void onDownloadFinish(JSONObject data)
	{
		this.resetUI();
	}

	// Token: 0x06000C3A RID: 3130 RVA: 0x00059500 File Offset: 0x00057700
	private void resetUI()
	{
		globals.debug("BLE_DEVICE_DISCONNECT from firmwareProgressUpdate");
		base.gameObject.SetActive(false);
	}

	// Token: 0x06000C3B RID: 3131 RVA: 0x00059518 File Offset: 0x00057718
	private void resetProgressUI()
	{
		this.progress_panel.set_completion(-1);
	}

	// Token: 0x06000C3C RID: 3132 RVA: 0x00059528 File Offset: 0x00057728
	public void OnDownloadUpdate(JSONObject data)
	{
		int completion = 0;
		if (data.HasField("percent"))
		{
			completion = (int)data["percent"].n;
		}
		this.progress_panel.set_completion(completion);
		base.gameObject.SetActive(globals.player_data.firmwareUpdateStarted);
	}

	// Token: 0x04000BF2 RID: 3058
	public DownloadProgressPanelBehavior progress_panel;
}
