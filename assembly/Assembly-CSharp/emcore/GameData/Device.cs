using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x0200026C RID: 620
	public class Device
	{
		// Token: 0x060010BC RID: 4284 RVA: 0x00077904 File Offset: 0x00075B04
		public static Dictionary<string, Device> fromJSON(JSONObject j)
		{
			Dictionary<string, Device> dictionary = new Dictionary<string, Device>();
			JSONObject jsonobject = j["devices"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					Device device = new Device();
					device.name = jsonobject2["name"].str;
					device.icon = jsonobject2["icon"].str;
					device.type = (int)jsonobject2["type"].n;
					if (jsonobject2.HasField("tags") && jsonobject2["tags"].IsArray)
					{
						device.tags = new string[jsonobject2["tags"].list.Count];
						int num = 0;
						foreach (JSONObject jsonobject3 in jsonobject2["tags"].list)
						{
							device.tags[num++] = jsonobject3.str;
						}
					}
					else
					{
						device.tags = new string[0];
					}
					dictionary.Add(device.name, device);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010BD RID: 4285 RVA: 0x00077ACC File Offset: 0x00075CCC
		public static JSONObject toJSON(Dictionary<string, Device> devices)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("devices", jsonobject2);
			foreach (KeyValuePair<string, Device> keyValuePair in devices)
			{
				Device value = keyValuePair.Value;
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("type", value.type);
				jsonobject3.AddField("name", value.name);
				jsonobject3.AddField("icon", value.icon);
				if (value.tags.Length > 0)
				{
					JSONObject jsonobject4 = new JSONObject(JSONObject.Type.ARRAY);
					for (int i = 0; i < value.tags.Length; i++)
					{
						jsonobject4.Add(value.tags[i]);
					}
					jsonobject3.AddField("tags", jsonobject4);
				}
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x04001120 RID: 4384
		public int type;

		// Token: 0x04001121 RID: 4385
		public string[] tags;

		// Token: 0x04001122 RID: 4386
		public string name;

		// Token: 0x04001123 RID: 4387
		public string icon;
	}
}
