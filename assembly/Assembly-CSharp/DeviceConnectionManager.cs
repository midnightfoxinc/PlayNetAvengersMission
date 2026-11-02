using System;

// Token: 0x02000179 RID: 377
public class DeviceConnectionManager : CallbackMonoBehavior
{
	// Token: 0x06000BD4 RID: 3028 RVA: 0x00056C90 File Offset: 0x00054E90
	private void Start()
	{
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.DEVICE_LOOKUPDONE, new BLEManager.DataReceivedDelegate(this.onDeviceFound));
	}

	// Token: 0x06000BD5 RID: 3029 RVA: 0x00056CAC File Offset: 0x00054EAC
	private void OnApplicationPause(bool paused)
	{
		if (!globals.autoConnect)
		{
			return;
		}
	}

	// Token: 0x06000BD6 RID: 3030 RVA: 0x00056CBC File Offset: 0x00054EBC
	private void connectToDevice()
	{
		globals.BLE_manager.connectToDevice(globals.player_data.getPrimaryDevice());
	}

	// Token: 0x06000BD7 RID: 3031 RVA: 0x00056CD4 File Offset: 0x00054ED4
	public void onDeviceFound(JSONObject data)
	{
		if (!globals.autoConnect)
		{
			return;
		}
		sFoundDevice sFoundDevice = new sFoundDevice();
		sFoundDevice.id = (int)data["device_id"].n;
		sFoundDevice.type = (int)data["type"].n;
		sFoundDevice.flags = (int)data["flags"].n;
		globals.debug(string.Concat(new object[]
		{
			"Auto Connect",
			globals.BLE_manager.connectedDevice,
			":",
			globals.player_data.getPrimaryDevice(),
			":",
			sFoundDevice.id,
			":",
			sFoundDevice.flags,
			":",
			globals.player_data.isDeviceRegistered(sFoundDevice.id)
		}));
		if (globals.BLE_manager.connectedDevice == -1 && globals.player_data.getPrimaryDevice() == sFoundDevice.id && sFoundDevice.flags == 1 && globals.player_data.isDeviceRegistered(sFoundDevice.id))
		{
			globals.BLE_manager.connectToDevice(sFoundDevice.id);
		}
	}

	// Token: 0x0200017A RID: 378
	public enum deviceAutoConnectScenn
	{
		// Token: 0x04000BA9 RID: 2985
		none,
		// Token: 0x04000BAA RID: 2986
		HQ_menu
	}
}
