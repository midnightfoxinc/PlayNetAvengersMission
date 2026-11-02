using System;
using System.Collections.Generic;

// Token: 0x02000243 RID: 579
public class StoreDepartmentDataClass
{
	// Token: 0x0600101E RID: 4126 RVA: 0x00072680 File Offset: 0x00070880
	public StoreDepartmentDataClass(JSONObject obj)
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
					if (StoreDepartmentDataClass.<>f__switch$map11 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(3);
						dictionary.Add("name", 0);
						dictionary.Add("icon", 1);
						dictionary.Add("rows", 2);
						StoreDepartmentDataClass.<>f__switch$map11 = dictionary;
					}
					int num;
					if (StoreDepartmentDataClass.<>f__switch$map11.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.name = this.scratch_tinted(jsonobject.str);
							break;
						case 1:
							this.icon = jsonobject.str;
							break;
						case 2:
							this.parse_rows(jsonobject);
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x0600101F RID: 4127 RVA: 0x000727AC File Offset: 0x000709AC
	public void parse_rows(string s)
	{
		this.parse_rows(new JSONObject(s, -2, false, false));
	}

	// Token: 0x06001020 RID: 4128 RVA: 0x000727C0 File Offset: 0x000709C0
	public void parse_rows(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			this.row.Clear();
			for (int i = 0; i < obj.list.Count; i++)
			{
				StoreRowDataClass storeRowDataClass = new StoreRowDataClass(obj.list[i]);
				if (storeRowDataClass)
				{
					this.row.Add(storeRowDataClass);
				}
			}
		}
		else if (obj.list.Count > 0 && obj.list[0].type == JSONObject.Type.ARRAY)
		{
			this.parse_rows(obj.list[0]);
		}
		else
		{
			globals.debugWarning("json object is not an array");
		}
	}

	// Token: 0x06001021 RID: 4129 RVA: 0x00072878 File Offset: 0x00070A78
	private string scratch_tinted(string s)
	{
		return globals.datafile_roster.scratch_tinted(s, this.scratch);
	}

	// Token: 0x06001022 RID: 4130 RVA: 0x0007288C File Offset: 0x00070A8C
	public static implicit operator bool(StoreDepartmentDataClass d)
	{
		return d != null;
	}

	// Token: 0x0400103B RID: 4155
	public string name;

	// Token: 0x0400103C RID: 4156
	public string icon;

	// Token: 0x0400103D RID: 4157
	public List<StoreRowDataClass> row = new List<StoreRowDataClass>();

	// Token: 0x0400103E RID: 4158
	public bool scratch;
}
