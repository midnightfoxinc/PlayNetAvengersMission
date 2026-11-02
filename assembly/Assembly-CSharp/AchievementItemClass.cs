using System;
using System.Collections.Generic;

// Token: 0x02000238 RID: 568
public class AchievementItemClass
{
	// Token: 0x06000FF8 RID: 4088 RVA: 0x00071500 File Offset: 0x0006F700
	public AchievementItemClass(JSONObject obj)
	{
		this.parse(obj);
	}

	// Token: 0x06000FF9 RID: 4089 RVA: 0x00071538 File Offset: 0x0006F738
	private string scratch_tinted(string s)
	{
		return globals.datafile_roster.scratch_tinted(s, this.scratch);
	}

	// Token: 0x06000FFA RID: 4090 RVA: 0x0007154C File Offset: 0x0006F74C
	private void set_type(string s)
	{
		for (int i = 0; i < Enum.GetNames(typeof(achievement_type_enum)).Length; i++)
		{
			if (((achievement_type_enum)i).ToString() == s)
			{
				this.type = (achievement_type_enum)i;
				return;
			}
		}
		globals.debugWarning("unrecognized achievement type: " + s);
	}

	// Token: 0x06000FFB RID: 4091 RVA: 0x000715AC File Offset: 0x0006F7AC
	private void set_difficulty(string s)
	{
		for (int i = 0; i < Enum.GetNames(typeof(achievement_difficulty_enum)).Length; i++)
		{
			if (((achievement_difficulty_enum)i).ToString() == s)
			{
				this.difficulty = (achievement_difficulty_enum)i;
				return;
			}
		}
		globals.debugWarning("unrecognized achievement difficulty: " + s);
	}

	// Token: 0x06000FFC RID: 4092 RVA: 0x0007160C File Offset: 0x0006F80C
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
					if (AchievementItemClass.<>f__switch$mapC == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(8);
						dictionary.Add("id", 0);
						dictionary.Add("name", 1);
						dictionary.Add("description", 2);
						dictionary.Add("type", 3);
						dictionary.Add("difficulty", 4);
						dictionary.Add("target_id", 5);
						dictionary.Add("count", 6);
						dictionary.Add("special", 7);
						AchievementItemClass.<>f__switch$mapC = dictionary;
					}
					int num;
					if (AchievementItemClass.<>f__switch$mapC.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.id = jsonobject.str;
							break;
						case 1:
							this.name = this.scratch_tinted(jsonobject.str);
							break;
						case 2:
							this.description = this.scratch_tinted(jsonobject.str);
							break;
						case 3:
							this.set_type(jsonobject.str);
							break;
						case 4:
							this.set_difficulty(jsonobject.str);
							break;
						case 5:
							this.target_id = jsonobject.str;
							break;
						case 6:
							this.count = (int)jsonobject.n;
							break;
						case 7:
							this.special = jsonobject.str;
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x06000FFD RID: 4093 RVA: 0x000717E0 File Offset: 0x0006F9E0
	public static implicit operator bool(AchievementItemClass d)
	{
		return d != null;
	}

	// Token: 0x04001003 RID: 4099
	public string id;

	// Token: 0x04001004 RID: 4100
	public string name;

	// Token: 0x04001005 RID: 4101
	public string description;

	// Token: 0x04001006 RID: 4102
	public achievement_type_enum type;

	// Token: 0x04001007 RID: 4103
	public achievement_difficulty_enum difficulty;

	// Token: 0x04001008 RID: 4104
	public string target_id = string.Empty;

	// Token: 0x04001009 RID: 4105
	public int count = -1;

	// Token: 0x0400100A RID: 4106
	public string special = string.Empty;

	// Token: 0x0400100B RID: 4107
	public bool scratch;
}
