using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x0200026A RID: 618
	public class Campaign
	{
		// Token: 0x060010B6 RID: 4278 RVA: 0x000774A4 File Offset: 0x000756A4
		public static Dictionary<int, Campaign> fromJSON(JSONObject j)
		{
			Dictionary<int, Campaign> dictionary = new Dictionary<int, Campaign>();
			JSONObject jsonobject = j["campaigns"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					Campaign campaign = new Campaign();
					campaign.id = (int)jsonobject2["id"].n;
					campaign.name = jsonobject2["name"].str;
					campaign.icon = jsonobject2["icon"].str;
					campaign.locale = jsonobject2["locale"].str;
					dictionary.Add(campaign.id, campaign);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010B7 RID: 4279 RVA: 0x000775B4 File Offset: 0x000757B4
		public static JSONObject toJSON(Dictionary<int, Campaign> campaigns)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("campaigns", jsonobject2);
			foreach (KeyValuePair<int, Campaign> keyValuePair in campaigns)
			{
				Campaign value = keyValuePair.Value;
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("id", value.id);
				jsonobject3.AddField("name", value.name);
				jsonobject3.AddField("icon", value.icon);
				jsonobject3.AddField("locale", value.locale);
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x04001115 RID: 4373
		public int id;

		// Token: 0x04001116 RID: 4374
		public string name;

		// Token: 0x04001117 RID: 4375
		public string icon;

		// Token: 0x04001118 RID: 4376
		public string locale;
	}
}
