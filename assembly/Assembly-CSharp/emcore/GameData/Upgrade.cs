using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x02000277 RID: 631
	public class Upgrade
	{
		// Token: 0x060010F9 RID: 4345 RVA: 0x00079880 File Offset: 0x00077A80
		public static Dictionary<string, Upgrade> fromJSON(JSONObject j)
		{
			Dictionary<string, Upgrade> dictionary = new Dictionary<string, Upgrade>();
			foreach (JSONObject jsonobject in j["upgrades"].list)
			{
				try
				{
					Upgrade upgrade = new Upgrade();
					upgrade.ability = (int)jsonobject["ability"].n;
					upgrade.name = jsonobject["name"].str;
					foreach (JSONObject jsonobject2 in jsonobject["recipe"].list)
					{
						upgrade.recipe.Add((int)jsonobject2["id"].n, jsonobject2["amount"].str);
					}
					dictionary.Add(upgrade.name, upgrade);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010FA RID: 4346 RVA: 0x000799E4 File Offset: 0x00077BE4
		public static JSONObject toJSON(Dictionary<string, Upgrade> upgrades)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("upgrades", jsonobject2);
			foreach (KeyValuePair<string, Upgrade> keyValuePair in upgrades)
			{
				Upgrade value = keyValuePair.Value;
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("ability", value.ability);
				jsonobject3.AddField("name", value.name);
				JSONObject jsonobject4 = new JSONObject(JSONObject.Type.ARRAY);
				foreach (KeyValuePair<int, string> keyValuePair2 in value.recipe)
				{
					JSONObject jsonobject5 = new JSONObject(JSONObject.Type.OBJECT);
					jsonobject5.AddField("id", keyValuePair2.Key);
					jsonobject5.AddField("amount", keyValuePair2.Value);
					jsonobject4.Add(jsonobject5);
				}
				jsonobject3.AddField("recipe", jsonobject4);
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x0400116B RID: 4459
		public int ability;

		// Token: 0x0400116C RID: 4460
		public string name;

		// Token: 0x0400116D RID: 4461
		public Dictionary<int, string> recipe = new Dictionary<int, string>();
	}
}
