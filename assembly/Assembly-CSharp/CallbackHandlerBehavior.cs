using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000166 RID: 358
public class CallbackHandlerBehavior : MonoBehaviour
{
	// Token: 0x06000BAE RID: 2990 RVA: 0x00056114 File Offset: 0x00054314
	public void addDeviceEventCallback(BLEManager.DeviceEvent e, BLEManager.DataReceivedDelegate d)
	{
		this._deviceEventDelegates.Add(new CallbackHandlerBehavior.deviceEventDelegateClass(e, d));
		globals.BLE_manager.addDeviceEventCallback(e, d);
	}

	// Token: 0x06000BAF RID: 2991 RVA: 0x00056134 File Offset: 0x00054334
	public void addDataReceivedCallback(Constants.ToyDataType t, BLEManager.DataReceivedDelegate d)
	{
		this._dataReceivedDelegates.Add(new CallbackHandlerBehavior.dataReceivedDelegateClass(t, d));
		globals.BLE_manager.addDataReceivedCallback(t, d);
	}

	// Token: 0x06000BB0 RID: 2992 RVA: 0x00056154 File Offset: 0x00054354
	public void removeDeviceEventCallback(BLEManager.DeviceEvent e, BLEManager.DataReceivedDelegate d)
	{
		if (!globals.BLE_manager_exists)
		{
			return;
		}
		globals.BLE_manager.removeDeviceEventCallback(e, d);
	}

	// Token: 0x06000BB1 RID: 2993 RVA: 0x00056170 File Offset: 0x00054370
	public void removeDataReceivedCallback(Constants.ToyDataType t, BLEManager.DataReceivedDelegate d)
	{
		if (!globals.BLE_manager_exists)
		{
			return;
		}
		globals.BLE_manager.removeDataReceivedCallback(t, d);
	}

	// Token: 0x06000BB2 RID: 2994 RVA: 0x0005618C File Offset: 0x0005438C
	public void removeAllCallbacks()
	{
		if (globals.BLE_manager_exists)
		{
			for (int i = 0; i < this._deviceEventDelegates.Count; i++)
			{
				this.removeDeviceEventCallback(this._deviceEventDelegates[i].e, this._deviceEventDelegates[i].d);
			}
			for (int j = 0; j < this._dataReceivedDelegates.Count; j++)
			{
				this.removeDataReceivedCallback(this._dataReceivedDelegates[j].t, this._dataReceivedDelegates[j].d);
			}
		}
		this._deviceEventDelegates.Clear();
		this._dataReceivedDelegates.Clear();
	}

	// Token: 0x06000BB3 RID: 2995 RVA: 0x00056244 File Offset: 0x00054444
	private void OnDestroy()
	{
		this.removeAllCallbacks();
	}

	// Token: 0x04000B21 RID: 2849
	private List<CallbackHandlerBehavior.deviceEventDelegateClass> _deviceEventDelegates = new List<CallbackHandlerBehavior.deviceEventDelegateClass>();

	// Token: 0x04000B22 RID: 2850
	private List<CallbackHandlerBehavior.dataReceivedDelegateClass> _dataReceivedDelegates = new List<CallbackHandlerBehavior.dataReceivedDelegateClass>();

	// Token: 0x02000167 RID: 359
	private class deviceEventDelegateClass
	{
		// Token: 0x06000BB4 RID: 2996 RVA: 0x0005624C File Offset: 0x0005444C
		public deviceEventDelegateClass(BLEManager.DeviceEvent e, BLEManager.DataReceivedDelegate d)
		{
			this.e = e;
			this.d = d;
		}

		// Token: 0x04000B23 RID: 2851
		public BLEManager.DeviceEvent e;

		// Token: 0x04000B24 RID: 2852
		public BLEManager.DataReceivedDelegate d;
	}

	// Token: 0x02000168 RID: 360
	private class dataReceivedDelegateClass
	{
		// Token: 0x06000BB5 RID: 2997 RVA: 0x00056264 File Offset: 0x00054464
		public dataReceivedDelegateClass(Constants.ToyDataType t, BLEManager.DataReceivedDelegate d)
		{
			this.t = t;
			this.d = d;
		}

		// Token: 0x04000B25 RID: 2853
		public Constants.ToyDataType t;

		// Token: 0x04000B26 RID: 2854
		public BLEManager.DataReceivedDelegate d;
	}
}
