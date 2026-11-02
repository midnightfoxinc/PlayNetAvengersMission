using System;
using System.Collections.Generic;

// Token: 0x02000240 RID: 576
public class StoreRowDataClass
{
	// Token: 0x06001012 RID: 4114 RVA: 0x000721A4 File Offset: 0x000703A4
	public StoreRowDataClass(string name, List<string> items)
	{
		this.name = name;
		this.items = items;
	}

	// Token: 0x06001013 RID: 4115 RVA: 0x000721C8 File Offset: 0x000703C8
	public StoreRowDataClass(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.OBJECT)
		{
			if (obj.HasField("scratch"))
			{
				this.scratch = obj["scratch"].b;
			}
			for (int i = 0; i < obj.list.Count; i++)
			{
				string text = obj.keys[i];
				JSONObject jsonobject = obj.list[i];
				string text2 = text;
				if (text2 != null)
				{
					if (StoreRowDataClass.<>f__switch$mapF == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(2);
						dictionary.Add("name", 0);
						dictionary.Add("items", 1);
						StoreRowDataClass.<>f__switch$mapF = dictionary;
					}
					int num;
					if (StoreRowDataClass.<>f__switch$mapF.TryGetValue(text2, ref num))
					{
						if (num != 0)
						{
							if (num == 1)
							{
								this.parse_items(jsonobject);
							}
						}
						else
						{
							this.name = this.scratch_tinted(jsonobject.str);
						}
					}
				}
			}
		}
	}

	// Token: 0x06001014 RID: 4116 RVA: 0x000722D4 File Offset: 0x000704D4
	public void parse_items(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			this.items.Clear();
			for (int i = 0; i < obj.list.Count; i++)
			{
				this.items.Add(obj.list[i].str);
			}
		}
		else
		{
			globals.debugWarning("json store item list is not an array!");
		}
	}

	// Token: 0x06001015 RID: 4117 RVA: 0x00072340 File Offset: 0x00070540
	private string scratch_tinted(string s)
	{
		return globals.datafile_roster.scratch_tinted(s, this.scratch);
	}

	// Token: 0x06001016 RID: 4118 RVA: 0x00072354 File Offset: 0x00070554
	public static implicit operator bool(StoreRowDataClass d)
	{
		return d != null;
	}

	// Token: 0x04001027 RID: 4135
	public string name;

	// Token: 0x04001028 RID: 4136
	public List<string> items = new List<string>();

	// Token: 0x04001029 RID: 4137
	public bool scratch;
}
