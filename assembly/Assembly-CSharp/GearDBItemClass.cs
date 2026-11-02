using System;
using System.Collections.Generic;

// Token: 0x0200024E RID: 590
public class GearDBItemClass : DBItemClass
{
	// Token: 0x06001038 RID: 4152 RVA: 0x0007359C File Offset: 0x0007179C
	public GearDBItemClass(JSONObject obj)
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
					if (GearDBItemClass.<>f__switch$map17 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(1);
						dictionary.Add("image", 0);
						GearDBItemClass.<>f__switch$map17 = dictionary;
					}
					int num;
					if (GearDBItemClass.<>f__switch$map17.TryGetValue(text2, ref num))
					{
						if (num == 0)
						{
							this.image = jsonobject.str;
						}
					}
				}
			}
		}
	}

	// Token: 0x04001071 RID: 4209
	public string image;
}
