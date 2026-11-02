using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x02000274 RID: 628
	public class News
	{
		// Token: 0x060010EF RID: 4335 RVA: 0x00079020 File Offset: 0x00077220
		public static Dictionary<string, List<News>> fromJSON(JSONObject j)
		{
			Dictionary<string, List<News>> dictionary = new Dictionary<string, List<News>>();
			JSONObject jsonobject = j["news"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					News news = new News();
					if (jsonobject2.HasField("character"))
					{
						news.character = (int)jsonobject2["character"].n;
					}
					news.section = jsonobject2["section"].str;
					news.title = jsonobject2["title"].str;
					news.image = jsonobject2["image"].str;
					news.detail = jsonobject2["detail"].str;
					if (!dictionary.ContainsKey(news.section))
					{
						dictionary.Add(news.section, new List<News>());
					}
					dictionary[news.section].Add(news);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010F0 RID: 4336 RVA: 0x00079180 File Offset: 0x00077380
		public static JSONObject toJSON(Dictionary<string, List<News>> news)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("news", jsonobject2);
			foreach (KeyValuePair<string, List<News>> keyValuePair in news)
			{
				foreach (News news2 in keyValuePair.Value)
				{
					JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
					if (news2.character != 0)
					{
						jsonobject3.AddField("character", news2.character);
					}
					jsonobject3.AddField("section", news2.section);
					jsonobject3.AddField("title", news2.title);
					jsonobject3.AddField("image", news2.image);
					jsonobject3.AddField("detail", news2.detail);
					jsonobject2.Add(jsonobject3);
				}
			}
			return jsonobject;
		}

		// Token: 0x04001158 RID: 4440
		public int character;

		// Token: 0x04001159 RID: 4441
		public string section;

		// Token: 0x0400115A RID: 4442
		public string title;

		// Token: 0x0400115B RID: 4443
		public string image;

		// Token: 0x0400115C RID: 4444
		public string detail;
	}
}
