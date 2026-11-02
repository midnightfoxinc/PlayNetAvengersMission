using System;
using UnityEngine;

// Token: 0x0200017D RID: 381
public class GearScanBehavior : CallbackMonoBehavior
{
	// Token: 0x06000BDD RID: 3037 RVA: 0x00056F70 File Offset: 0x00055170
	private void Start()
	{
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_CONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceConnect));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceDisconnect));
	}

	// Token: 0x06000BDE RID: 3038 RVA: 0x00056FB0 File Offset: 0x000551B0
	public void onDeviceConnect(JSONObject data)
	{
		this._connected = true;
	}

	// Token: 0x06000BDF RID: 3039 RVA: 0x00056FBC File Offset: 0x000551BC
	public void onDeviceDisconnect(JSONObject data)
	{
		this._connected = false;
	}

	// Token: 0x06000BE0 RID: 3040 RVA: 0x00056FC8 File Offset: 0x000551C8
	private void Update()
	{
		if (Application.platform != 11)
		{
			base.enabled = false;
			return;
		}
		if (globals.BLE_manager.connectedDevice_data || this._connected)
		{
			this._countdown = 0f;
			return;
		}
		this._countdown -= Time.deltaTime;
		if (this._countdown < 0f)
		{
			this._countdown = this._scan_freq;
			NativeManager.getNative().beginScan();
			globals.debug("scanning for devices");
		}
	}

	// Token: 0x04000BB0 RID: 2992
	private float _scan_freq = 60f;

	// Token: 0x04000BB1 RID: 2993
	private float _countdown;

	// Token: 0x04000BB2 RID: 2994
	private bool _connected;
}
