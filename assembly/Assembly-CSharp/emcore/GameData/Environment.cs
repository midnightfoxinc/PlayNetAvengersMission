using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x0200026E RID: 622
	public class Environment
	{
		// Token: 0x060010C1 RID: 4289 RVA: 0x00077CF8 File Offset: 0x00075EF8
		public static Dictionary<int, Environment> fromJSON(JSONObject j)
		{
			Dictionary<int, Environment> dictionary = new Dictionary<int, Environment>();
			foreach (JSONObject jsonobject in j["envs"].list)
			{
				try
				{
					Environment environment = new Environment();
					environment.id = (int)jsonobject["id"].n;
					environment.name = jsonobject["name"].str;
					environment.icon = jsonobject["icon"].str;
					environment.unlock = ((!jsonobject.HasField("unlock")) ? null : jsonobject["unlock"].str);
					environment.premium = jsonobject["premium"].b;
					environment.colorRGB = GameData.JsonToArray(jsonobject, "color");
					dictionary.Add(environment.id, environment);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010C2 RID: 4290 RVA: 0x00077E3C File Offset: 0x0007603C
		public static JSONObject toJSON(Dictionary<int, Environment> envs)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("envs", jsonobject2);
			foreach (KeyValuePair<int, Environment> keyValuePair in envs)
			{
				Environment value = keyValuePair.Value;
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("id", value.id);
				jsonobject3.AddField("name", value.name);
				jsonobject3.AddField("icon", value.icon);
				jsonobject3.AddField("premium", value.premium);
				if (value.unlock != null)
				{
					jsonobject3.AddField("unlock", value.unlock);
				}
				GameData.ArrayToJson(jsonobject3, value.colorRGB, "color");
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x04001128 RID: 4392
		public int id;

		// Token: 0x04001129 RID: 4393
		public string name;

		// Token: 0x0400112A RID: 4394
		public string icon;

		// Token: 0x0400112B RID: 4395
		public string unlock;

		// Token: 0x0400112C RID: 4396
		public bool premium;

		// Token: 0x0400112D RID: 4397
		public int[] colorRGB;
	}
}
