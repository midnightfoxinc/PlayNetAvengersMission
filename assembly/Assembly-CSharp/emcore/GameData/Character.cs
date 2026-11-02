using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x0200026B RID: 619
	public class Character
	{
		// Token: 0x060010B9 RID: 4281 RVA: 0x00077698 File Offset: 0x00075898
		public static Dictionary<int, Character> fromJSON(JSONObject j)
		{
			Dictionary<int, Character> dictionary = new Dictionary<int, Character>();
			JSONObject jsonobject = j["characters"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					Character character = new Character();
					character.id = (int)jsonobject2["id"].n;
					character.name = jsonobject2["name"].str;
					character.story = jsonobject2["story"].str;
					character.tag = jsonobject2["tag"].str;
					character.images = ImageRef.fromJSON(jsonobject2["images"]);
					character.missions = GameData.JsonToArray(jsonobject2, "missions");
					character.levels = GameData.JsonToArray(jsonobject2, "levels");
					dictionary.Add(character.id, character);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010BA RID: 4282 RVA: 0x000777E4 File Offset: 0x000759E4
		public static JSONObject toJSON(Dictionary<int, Character> characters)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("characters", jsonobject2);
			foreach (KeyValuePair<int, Character> keyValuePair in characters)
			{
				Character value = keyValuePair.Value;
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("id", value.id);
				jsonobject3.AddField("name", value.name);
				jsonobject3.AddField("story", value.story);
				jsonobject3.AddField("tag", value.tag);
				GameData.ArrayToJson(jsonobject3, value.missions, "missions");
				GameData.ArrayToJson(jsonobject3, value.levels, "levels");
				jsonobject3.AddField("images", ImageRef.toJSON(value.images));
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x04001119 RID: 4377
		public int id;

		// Token: 0x0400111A RID: 4378
		public string name;

		// Token: 0x0400111B RID: 4379
		public string story;

		// Token: 0x0400111C RID: 4380
		public string tag;

		// Token: 0x0400111D RID: 4381
		public List<ImageRef> images;

		// Token: 0x0400111E RID: 4382
		public int[] missions;

		// Token: 0x0400111F RID: 4383
		public int[] levels;
	}
}
