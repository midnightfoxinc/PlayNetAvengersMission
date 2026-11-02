using System;
using System.IO;
using UnityEngine;

// Token: 0x02000193 RID: 403
public class simulator : MonoBehaviour
{
	// Token: 0x06000C64 RID: 3172 RVA: 0x0005A530 File Offset: 0x00058730
	private void Start()
	{
	}

	// Token: 0x06000C65 RID: 3173 RVA: 0x0005A534 File Offset: 0x00058734
	public void init()
	{
		string str = File.ReadAllText("device_sim.txt");
		this.data = new JSONObject(str, -2, false, false);
		globals.BLE_manager.deviceFound(this.data["DEVICEFOUND"].ToString());
		base.Invoke("deviceFound", 1f);
	}

	// Token: 0x06000C66 RID: 3174 RVA: 0x0005A58C File Offset: 0x0005878C
	private void deviceFound()
	{
		globals.BLE_manager.deviceJoin(this.data["deviceJoin"].ToString());
		globals.BLE_manager.deviceConnected(this.data["deviceConnected"].ToString());
		globals.file_transfer_allowed = 1;
		globals.BLE_manager.spaceAvailable(this.data["space"].ToString());
		globals.BLE_manager.firmwareUpdate(this.data["hasNewFirmware"].ToString());
		globals.BLE_manager.onCachedPackageEvent(this.data["cachePackage"].ToString());
		globals.BLE_manager.entiledContentAvailable(this.data["entiledContentAvailable"].ToString());
		globals.BLE_manager.contentPresentOnToy(this.data["contentPresenReceived"].ToString());
	}

	// Token: 0x04000C01 RID: 3073
	public JSONObject data;
}
