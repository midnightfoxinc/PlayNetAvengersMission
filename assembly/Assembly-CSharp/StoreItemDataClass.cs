using System;
using System.Collections.Generic;

// Token: 0x02000241 RID: 577
public class StoreItemDataClass
{
	// Token: 0x06001017 RID: 4119 RVA: 0x00072360 File Offset: 0x00070560
	public StoreItemDataClass(JSONObject obj)
	{
		this.parse(obj);
	}

	// Token: 0x06001018 RID: 4120 RVA: 0x000723B4 File Offset: 0x000705B4
	public DBItemClass db_item()
	{
		return globals.database_data.item_by_id(this.id, true);
	}

	// Token: 0x06001019 RID: 4121 RVA: 0x000723C8 File Offset: 0x000705C8
	public locationDataItemClass location_item()
	{
		return globals.location_data.item_by_id(this.id);
	}

	// Token: 0x0600101A RID: 4122 RVA: 0x000723DC File Offset: 0x000705DC
	public void set_type(string s)
	{
		for (int i = 0; i < Enum.GetNames(typeof(StoreItemDataClass.type_enum)).Length; i++)
		{
			if (s == ((StoreItemDataClass.type_enum)i).ToString())
			{
				this.type = (StoreItemDataClass.type_enum)i;
			}
		}
	}

	// Token: 0x0600101B RID: 4123 RVA: 0x00072428 File Offset: 0x00070628
	private string scratch_tinted(string s)
	{
		return globals.datafile_roster.scratch_tinted(s, this.scratch);
	}

	// Token: 0x0600101C RID: 4124 RVA: 0x0007243C File Offset: 0x0007063C
	public void parse(JSONObject obj)
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
					if (StoreItemDataClass.<>f__switch$map10 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(10);
						dictionary.Add("id", 0);
						dictionary.Add("name", 1);
						dictionary.Add("subname", 2);
						dictionary.Add("description", 3);
						dictionary.Add("see_also", 4);
						dictionary.Add("type", 5);
						dictionary.Add("starter_pack", 6);
						dictionary.Add("related", 7);
						dictionary.Add("tds_id", 8);
						dictionary.Add("redirect_id", 9);
						StoreItemDataClass.<>f__switch$map10 = dictionary;
					}
					int num;
					if (StoreItemDataClass.<>f__switch$map10.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.id = jsonobject.str;
							break;
						case 1:
							this.name = this.scratch_tinted(jsonobject.str.ToUpper());
							break;
						case 2:
							this.subname = this.scratch_tinted(jsonobject.str.ToUpper());
							break;
						case 3:
							this.description = this.scratch_tinted(jsonobject.str);
							break;
						case 4:
							this.see_also = jsonobject.str.Split(new char[]
							{
								','
							});
							break;
						case 5:
							this.set_type(jsonobject.str);
							break;
						case 6:
							this.starter_pack = jsonobject.b;
							break;
						case 7:
							this.related = jsonobject.str;
							break;
						case 8:
							this.tds_id = jsonobject.str;
							break;
						case 9:
							this.redirect_id = jsonobject.str;
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x0600101D RID: 4125 RVA: 0x00072674 File Offset: 0x00070874
	public static implicit operator bool(StoreItemDataClass d)
	{
		return d != null;
	}

	// Token: 0x0400102B RID: 4139
	public string id;

	// Token: 0x0400102C RID: 4140
	public string name;

	// Token: 0x0400102D RID: 4141
	public string subname = string.Empty;

	// Token: 0x0400102E RID: 4142
	public string description;

	// Token: 0x0400102F RID: 4143
	public string[] see_also = new string[0];

	// Token: 0x04001030 RID: 4144
	public StoreItemDataClass.type_enum type;

	// Token: 0x04001031 RID: 4145
	public bool starter_pack;

	// Token: 0x04001032 RID: 4146
	public string related = string.Empty;

	// Token: 0x04001033 RID: 4147
	public string tds_id = string.Empty;

	// Token: 0x04001034 RID: 4148
	public string redirect_id = string.Empty;

	// Token: 0x04001035 RID: 4149
	public bool scratch;

	// Token: 0x02000242 RID: 578
	public enum type_enum
	{
		// Token: 0x04001038 RID: 4152
		none,
		// Token: 0x04001039 RID: 4153
		physical,
		// Token: 0x0400103A RID: 4154
		location
	}
}
