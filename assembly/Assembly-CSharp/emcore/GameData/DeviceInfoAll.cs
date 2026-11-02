using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x0200026D RID: 621
	public class DeviceInfoAll
	{
		// Token: 0x060010BF RID: 4287 RVA: 0x00077BF0 File Offset: 0x00075DF0
		public static Dictionary<int, DeviceInfoAll> fromJSON(JSONObject j)
		{
			Dictionary<int, DeviceInfoAll> dictionary = new Dictionary<int, DeviceInfoAll>();
			foreach (JSONObject jsonobject in j.list)
			{
				try
				{
					DeviceInfoAll deviceInfoAll = new DeviceInfoAll();
					deviceInfoAll.deviceId = (int)jsonobject["deviceId"].n;
					deviceInfoAll.deviceType = (int)jsonobject["deviceType"].n;
					deviceInfoAll.installedFirmwareVersion = (int)jsonobject["installedFirmwareVersion"].n;
					deviceInfoAll.availableFirmwareVersion = (int)jsonobject["availableFirmwareVersion"].n;
					dictionary.Add(deviceInfoAll.deviceId, deviceInfoAll);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x04001124 RID: 4388
		public int deviceId;

		// Token: 0x04001125 RID: 4389
		public int deviceType;

		// Token: 0x04001126 RID: 4390
		public int installedFirmwareVersion;

		// Token: 0x04001127 RID: 4391
		public int availableFirmwareVersion;
	}
}
