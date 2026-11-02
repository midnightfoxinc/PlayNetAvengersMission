using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x02000270 RID: 624
	public class ImageRef
	{
		// Token: 0x060010E1 RID: 4321 RVA: 0x00078750 File Offset: 0x00076950
		public ImageRef(string t, string i)
		{
			this.type = t;
			this.img = i;
		}

		// Token: 0x060010E2 RID: 4322 RVA: 0x00078768 File Offset: 0x00076968
		public static List<ImageRef> fromJSON(JSONObject j)
		{
			List<ImageRef> list = new List<ImageRef>();
			foreach (JSONObject jsonobject in j.list)
			{
				try
				{
					list.Add(new ImageRef(jsonobject["type"].str, jsonobject["img"].str));
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return list;
		}

		// Token: 0x060010E3 RID: 4323 RVA: 0x00078824 File Offset: 0x00076A24
		public static JSONObject toJSON(List<ImageRef> imageList)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.ARRAY);
			foreach (ImageRef imageRef in imageList)
			{
				JSONObject jsonobject2 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject2.AddField("type", imageRef.type);
				jsonobject2.AddField("img", imageRef.img);
				jsonobject.Add(jsonobject2);
			}
			return jsonobject;
		}

		// Token: 0x04001146 RID: 4422
		public string type;

		// Token: 0x04001147 RID: 4423
		public string img;
	}
}
