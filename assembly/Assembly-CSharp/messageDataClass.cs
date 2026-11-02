using System;
using System.Collections.Generic;

// Token: 0x02000258 RID: 600
public class messageDataClass
{
	// Token: 0x06001064 RID: 4196 RVA: 0x00074CE0 File Offset: 0x00072EE0
	public messageDataClass(string s)
	{
		this.parse(new JSONObject(s, -2, false, false));
	}

	// Token: 0x06001065 RID: 4197 RVA: 0x00074D04 File Offset: 0x00072F04
	private void parse_item(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.OBJECT)
		{
			messageItemDataClass messageItemDataClass = new messageItemDataClass();
			for (int i = 0; i < obj.list.Count; i++)
			{
				string text = obj.keys[i];
				JSONObject jsonobject = obj.list[i];
				string text2 = text;
				if (text2 != null)
				{
					if (messageDataClass.<>f__switch$map1D == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(3);
						dictionary.Add("id", 0);
						dictionary.Add("level", 1);
						dictionary.Add("message", 2);
						messageDataClass.<>f__switch$map1D = dictionary;
					}
					int num;
					if (messageDataClass.<>f__switch$map1D.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							messageItemDataClass.id = jsonobject.str;
							break;
						case 1:
							messageItemDataClass.level = int.Parse(jsonobject.str);
							break;
						case 2:
							messageItemDataClass.message = jsonobject.str;
							break;
						}
					}
				}
			}
			this.item.Add(messageItemDataClass);
		}
	}

	// Token: 0x06001066 RID: 4198 RVA: 0x00074E14 File Offset: 0x00073014
	public void parse(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			this.item.Clear();
			for (int i = 0; i < obj.list.Count; i++)
			{
				this.parse_item(obj.list[i]);
			}
		}
		else if (obj.list.Count > 0 && obj.list[0].type == JSONObject.Type.ARRAY)
		{
			this.parse(obj.list[0]);
		}
		else
		{
			globals.debugWarning("json object is not an array");
		}
	}

	// Token: 0x06001067 RID: 4199 RVA: 0x00074EB4 File Offset: 0x000730B4
	public override string ToString()
	{
		string text = "[";
		for (int i = 0; i < this.item.Count; i++)
		{
			text = text + "{\"id\":\"" + this.item[i].id + "\",";
			text = text + "\"message\":\"" + this.item[i].message.Replace("\"", "\\\"") + "\",";
			string text2 = text;
			text = string.Concat(new object[]
			{
				text2,
				"\"level\":\"",
				this.item[i].level,
				"\""
			});
			text += "}";
			if (i < this.item.Count - 1)
			{
				text += ",";
			}
		}
		return text + "]";
	}

	// Token: 0x040010AF RID: 4271
	public List<messageItemDataClass> item = new List<messageItemDataClass>();
}
