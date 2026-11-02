using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x02000273 RID: 627
	public class Mission
	{
		// Token: 0x060010EC RID: 4332 RVA: 0x00078C18 File Offset: 0x00076E18
		public static Dictionary<int, Mission> fromJSON(JSONObject j)
		{
			Dictionary<int, Mission> dictionary = new Dictionary<int, Mission>();
			JSONObject jsonobject = j["missions"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					Mission mission = new Mission();
					mission.id = (int)jsonobject2["id"].n;
					mission.trackId = ((!jsonobject2.HasField("track")) ? 0 : ((int)jsonobject2["track"].n));
					mission.trackLevel = ((!jsonobject2.HasField("level")) ? 0 : ((int)jsonobject2["level"].n));
					mission.camp = ((!jsonobject2.HasField("camp")) ? 0 : ((int)jsonobject2["camp"].n));
					mission.prior = ((!jsonobject2.HasField("prior")) ? 0 : ((int)jsonobject2["prior"].n));
					mission.name = jsonobject2["name"].str;
					mission.icon = jsonobject2["icon"].str;
					mission.type = jsonobject2["type"].str;
					mission.desc = jsonobject2["desc"].str;
					mission.reward = jsonobject2["reward"].str;
					mission.unlock = ((!jsonobject2.HasField("unlock")) ? null : jsonobject2["unlock"].str);
					mission.premium = (jsonobject2.HasField("premium") && jsonobject2["premium"].b);
					dictionary.Add(mission.id, mission);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010ED RID: 4333 RVA: 0x00078E68 File Offset: 0x00077068
		public static JSONObject toJSON(Dictionary<int, Mission> missions)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("missions", jsonobject2);
			foreach (KeyValuePair<int, Mission> keyValuePair in missions)
			{
				Mission value = keyValuePair.Value;
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

		// Token: 0x0400114C RID: 4428
		public int id;

		// Token: 0x0400114D RID: 4429
		public int trackId;

		// Token: 0x0400114E RID: 4430
		public int trackLevel;

		// Token: 0x0400114F RID: 4431
		public int camp;

		// Token: 0x04001150 RID: 4432
		public int prior;

		// Token: 0x04001151 RID: 4433
		public string name;

		// Token: 0x04001152 RID: 4434
		public string icon;

		// Token: 0x04001153 RID: 4435
		public string type;

		// Token: 0x04001154 RID: 4436
		public string desc;

		// Token: 0x04001155 RID: 4437
		public string reward;

		// Token: 0x04001156 RID: 4438
		public string unlock;

		// Token: 0x04001157 RID: 4439
		public bool premium;
	}
}
