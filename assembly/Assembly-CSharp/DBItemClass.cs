using System;
using System.Collections.Generic;

// Token: 0x020001E0 RID: 480
[Serializable]
public abstract class DBItemClass
{
	// Token: 0x170001D3 RID: 467
	// (get) Token: 0x06000DFE RID: 3582 RVA: 0x000631A8 File Offset: 0x000613A8
	public db_item_type_enum item_type
	{
		get
		{
			if (this is SFDBItemClass)
			{
				return db_item_type_enum.smartfigure;
			}
			if (this is EnemyDBItemClass)
			{
				return db_item_type_enum.enemy;
			}
			if (this is HazardDBItemClass)
			{
				return db_item_type_enum.hazard;
			}
			if (this is ActionDBItemClass)
			{
				return db_item_type_enum.action;
			}
			if (this is AbilityDBItemClass)
			{
				return db_item_type_enum.ability;
			}
			if (this is GearDBItemClass)
			{
				return db_item_type_enum.gear;
			}
			return db_item_type_enum.unknown;
		}
	}

	// Token: 0x06000DFF RID: 3583 RVA: 0x00063204 File Offset: 0x00061404
	protected string scratch_tinted(string s)
	{
		return globals.datafile_roster.scratch_tinted(s, this.scratch);
	}

	// Token: 0x06000E00 RID: 3584 RVA: 0x00063218 File Offset: 0x00061418
	public virtual void parse(JSONObject obj)
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
					if (DBItemClass.<>f__switch$mapB == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(4);
						dictionary.Add("id", 0);
						dictionary.Add("name", 1);
						dictionary.Add("icon", 2);
						dictionary.Add("see_also", 3);
						DBItemClass.<>f__switch$mapB = dictionary;
					}
					int num;
					if (DBItemClass.<>f__switch$mapB.TryGetValue(text2, ref num))
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
							this.icon = jsonobject.str;
							break;
						case 3:
							if (jsonobject.IsString)
							{
								this.see_also = jsonobject.str.Split(new char[]
								{
									','
								});
								for (int j = 0; j < this.see_also.Length; j++)
								{
									if (!string.IsNullOrEmpty(this.see_also[j]))
									{
										this.see_also[j] = this.see_also[j].Trim();
									}
								}
							}
							else if (jsonobject.IsArray)
							{
								List<string> list = new List<string>();
								for (int k = 0; k < jsonobject.Count; k++)
								{
									list.Add(jsonobject[k].str);
								}
								this.see_also = list.ToArray();
							}
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x06000E01 RID: 3585 RVA: 0x00063410 File Offset: 0x00061610
	public static implicit operator bool(DBItemClass d)
	{
		return d != null;
	}

	// Token: 0x04000DB0 RID: 3504
	public string id = string.Empty;

	// Token: 0x04000DB1 RID: 3505
	public string name;

	// Token: 0x04000DB2 RID: 3506
	public string icon;

	// Token: 0x04000DB3 RID: 3507
	public string[] see_also = new string[0];

	// Token: 0x04000DB4 RID: 3508
	public bool scratch;
}
