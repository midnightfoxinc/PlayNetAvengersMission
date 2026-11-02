using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x02000271 RID: 625
	public class Ingredient
	{
		// Token: 0x060010E5 RID: 4325 RVA: 0x000788C0 File Offset: 0x00076AC0
		public static Dictionary<int, Ingredient> fromJSON(JSONObject j)
		{
			Dictionary<int, Ingredient> dictionary = new Dictionary<int, Ingredient>();
			JSONObject jsonobject = j["ingredients"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					Ingredient ingredient = new Ingredient();
					ingredient.id = (int)jsonobject2["id"].n;
					ingredient.name = jsonobject2["name"].str;
					dictionary.Add(ingredient.id, ingredient);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010E6 RID: 4326 RVA: 0x000789A4 File Offset: 0x00076BA4
		public static JSONObject toJSON(Dictionary<int, Ingredient> ingredients)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("ingredients", jsonobject2);
			foreach (KeyValuePair<int, Ingredient> keyValuePair in ingredients)
			{
				Ingredient value = keyValuePair.Value;
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("id", value.id);
				jsonobject3.AddField("name", value.name);
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x04001148 RID: 4424
		public int id;

		// Token: 0x04001149 RID: 4425
		public string name;
	}
}
