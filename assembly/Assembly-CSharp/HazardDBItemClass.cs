using System;
using System.Collections.Generic;

// Token: 0x0200024F RID: 591
public class HazardDBItemClass : DBItemClass
{
	// Token: 0x06001039 RID: 4153 RVA: 0x00073658 File Offset: 0x00071858
	public HazardDBItemClass(JSONObject obj)
	{
		this.parse(obj);
		if (obj.type == JSONObject.Type.OBJECT)
		{
			for (int i = 0; i < obj.list.Count; i++)
			{
				string text = obj.keys[i];
				JSONObject jsonobject = obj.list[i];
				string text2 = text;
				if (text2 != null)
				{
					if (HazardDBItemClass.<>f__switch$map18 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(2);
						dictionary.Add("description", 0);
						dictionary.Add("bg", 1);
						HazardDBItemClass.<>f__switch$map18 = dictionary;
					}
					int num;
					if (HazardDBItemClass.<>f__switch$map18.TryGetValue(text2, ref num))
					{
						if (num != 0)
						{
							if (num == 1)
							{
								this.bg = jsonobject.str;
							}
						}
						else
						{
							this.description = base.scratch_tinted(jsonobject.str);
						}
					}
				}
			}
		}
		if (string.IsNullOrEmpty(this.icon))
		{
			this.icon = this.id;
		}
	}

	// Token: 0x04001073 RID: 4211
	public string description = string.Empty;

	// Token: 0x04001074 RID: 4212
	public string bg = string.Empty;
}
