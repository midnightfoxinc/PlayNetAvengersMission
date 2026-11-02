using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x02000276 RID: 630
	public class SystemPatch
	{
		// Token: 0x060010F6 RID: 4342 RVA: 0x0007946C File Offset: 0x0007766C
		public static Dictionary<int, SystemPatch> fromJSON(JSONObject j)
		{
			Dictionary<int, SystemPatch> dictionary = new Dictionary<int, SystemPatch>();
			JSONObject jsonobject = j["SystemPatch"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					SystemPatch systemPatch = new SystemPatch();
					systemPatch.id = (int)jsonobject2["id"].n;
					systemPatch.trackId = ((!jsonobject2.HasField("track")) ? 0 : ((int)jsonobject2["track"].n));
					systemPatch.trackLevel = ((!jsonobject2.HasField("level")) ? 0 : ((int)jsonobject2["level"].n));
					systemPatch.camp = ((!jsonobject2.HasField("camp")) ? 0 : ((int)jsonobject2["camp"].n));
					systemPatch.prior = ((!jsonobject2.HasField("prior")) ? 0 : ((int)jsonobject2["prior"].n));
					systemPatch.name = jsonobject2["name"].str;
					systemPatch.icon = jsonobject2["icon"].str;
					systemPatch.type = jsonobject2["type"].str;
					systemPatch.desc = jsonobject2["desc"].str;
					systemPatch.reward = jsonobject2["reward"].str;
					systemPatch.unlock = ((!jsonobject2.HasField("unlock")) ? null : jsonobject2["unlock"].str);
					systemPatch.premium = (jsonobject2.HasField("premium") && jsonobject2["premium"].b);
					dictionary.Add(systemPatch.id, systemPatch);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010F7 RID: 4343 RVA: 0x000796BC File Offset: 0x000778BC
		public static JSONObject toJSON(Dictionary<int, SystemPatch> patchs)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("patchs", jsonobject2);
			foreach (KeyValuePair<int, SystemPatch> keyValuePair in patchs)
			{
				SystemPatch value = keyValuePair.Value;
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("id", value.id);
				if (value.trackId != 0 && value.trackLevel != 0)
				{
					jsonobject3.AddField("track", value.trackId);
					jsonobject3.AddField("level", value.trackLevel);
				}
				if (value.camp != 0)
				{
					jsonobject3.AddField("camp", value.camp);
				}
				if (value.prior != 0)
				{
					jsonobject3.AddField("prior", value.prior);
				}
				jsonobject3.AddField("name", value.name);
				jsonobject3.AddField("icon", value.icon);
				jsonobject3.AddField("type", value.type);
				jsonobject3.AddField("desc", value.desc);
				if (value.unlock != null)
				{
					jsonobject3.AddField("unlock", value.unlock);
				}
				jsonobject3.AddField("reward", value.reward);
				jsonobject3.AddField("premium", value.premium);
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x0400115F RID: 4447
		public int id;

		// Token: 0x04001160 RID: 4448
		public int trackId;

		// Token: 0x04001161 RID: 4449
		public int trackLevel;

		// Token: 0x04001162 RID: 4450
		public int camp;

		// Token: 0x04001163 RID: 4451
		public int prior;

		// Token: 0x04001164 RID: 4452
		public string name;

		// Token: 0x04001165 RID: 4453
		public string icon;

		// Token: 0x04001166 RID: 4454
		public string type;

		// Token: 0x04001167 RID: 4455
		public string desc;

		// Token: 0x04001168 RID: 4456
		public string reward;

		// Token: 0x04001169 RID: 4457
		public string unlock;

		// Token: 0x0400116A RID: 4458
		public bool premium;
	}
}
