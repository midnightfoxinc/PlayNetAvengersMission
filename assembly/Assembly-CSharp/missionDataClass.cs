using System;
using System.Collections.Generic;

// Token: 0x02000253 RID: 595
public class missionDataClass
{
	// Token: 0x170001F3 RID: 499
	// (get) Token: 0x06001042 RID: 4162 RVA: 0x00073C5C File Offset: 0x00071E5C
	public string env_package
	{
		get
		{
			if (string.IsNullOrEmpty(this._env_package) && this.location)
			{
				return this.location.env_package;
			}
			return this._env_package;
		}
	}

	// Token: 0x170001F4 RID: 500
	// (get) Token: 0x06001043 RID: 4163 RVA: 0x00073C9C File Offset: 0x00071E9C
	public bool is_arena
	{
		get
		{
			return this.arena_type != arena_type_enum.none;
		}
	}

	// Token: 0x06001044 RID: 4164 RVA: 0x00073CAC File Offset: 0x00071EAC
	public string scratch_tinted(string s)
	{
		return globals.datafile_roster.scratch_tinted(s, this.scratch);
	}

	// Token: 0x06001045 RID: 4165 RVA: 0x00073CC0 File Offset: 0x00071EC0
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
					if (missionDataClass.<>f__switch$map1B == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(12);
						dictionary.Add("name", 0);
						dictionary.Add("prompt", 1);
						dictionary.Add("id", 2);
						dictionary.Add("requires", 3);
						dictionary.Add("rated", 4);
						dictionary.Add("arena_type", 5);
						dictionary.Add("target_time", 6);
						dictionary.Add("characters", 7);
						dictionary.Add("entitlements", 8);
						dictionary.Add("tips", 9);
						dictionary.Add("play_summary", 10);
						dictionary.Add("env_package", 11);
						missionDataClass.<>f__switch$map1B = dictionary;
					}
					int num;
					if (missionDataClass.<>f__switch$map1B.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.name = this.scratch_tinted(jsonobject.str);
							break;
						case 1:
							this.prompt = this.scratch_tinted(jsonobject.str);
							break;
						case 2:
							this.id = (int)jsonobject.n;
							break;
						case 3:
							if (jsonobject.IsString)
							{
								this.requires = jsonobject.str;
							}
							else if (jsonobject.IsNumber)
							{
								this.requires = ((int)jsonobject.n).ToString();
							}
							break;
						case 4:
							this.rated = jsonobject.b;
							break;
						case 5:
							this.set_arena_type(jsonobject.str);
							break;
						case 6:
							this.target_time = (int)jsonobject.n;
							break;
						case 7:
							this.characters = jsonobject.str.Split(new char[]
							{
								','
							});
							break;
						case 8:
							this.entitlements = jsonobject.str;
							break;
						case 9:
							this.parse_tips(jsonobject);
							break;
						case 10:
							this.play_summary = jsonobject.str.Split(new char[]
							{
								'\t',
								' ',
								','
							}, 1);
							break;
						case 11:
							this._env_package = jsonobject.str;
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x06001046 RID: 4166 RVA: 0x00073F78 File Offset: 0x00072178
	private void set_arena_type(string s)
	{
		for (int i = 0; i < Enum.GetNames(typeof(arena_type_enum)).Length; i++)
		{
			if (((arena_type_enum)i).ToString() == s)
			{
				this.arena_type = (arena_type_enum)i;
				return;
			}
		}
	}

	// Token: 0x06001047 RID: 4167 RVA: 0x00073FC8 File Offset: 0x000721C8
	private void parse_tips(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			this.tip.Clear();
			for (int i = 0; i < obj.list.Count; i++)
			{
				this.tip.Add(new missionTipDataClass(obj.list[i], this));
			}
		}
	}

	// Token: 0x06001048 RID: 4168 RVA: 0x00074028 File Offset: 0x00072228
	public bool unlocked()
	{
		return this.location && this.location.unlocked() && (string.IsNullOrEmpty(this.requires) || globals.player_data.has_unlock(this.requires));
	}

	// Token: 0x06001049 RID: 4169 RVA: 0x0007407C File Offset: 0x0007227C
	public bool installed()
	{
		return globals.BLE_manager.connectedDevice_data && globals.BLE_manager.connectedDevice_data.isContentInstalledWithLatestVersion(this.entitlements);
	}

	// Token: 0x0600104A RID: 4170 RVA: 0x000740B8 File Offset: 0x000722B8
	public static implicit operator bool(missionDataClass d)
	{
		return d != null;
	}

	// Token: 0x04001089 RID: 4233
	public int id;

	// Token: 0x0400108A RID: 4234
	public string name;

	// Token: 0x0400108B RID: 4235
	public string prompt;

	// Token: 0x0400108C RID: 4236
	public string requires = string.Empty;

	// Token: 0x0400108D RID: 4237
	public bool rated = true;

	// Token: 0x0400108E RID: 4238
	public int target_time;

	// Token: 0x0400108F RID: 4239
	public string[] characters = new string[0];

	// Token: 0x04001090 RID: 4240
	public List<missionTipDataClass> tip = new List<missionTipDataClass>();

	// Token: 0x04001091 RID: 4241
	public string entitlements;

	// Token: 0x04001092 RID: 4242
	public locationDataItemClass location;

	// Token: 0x04001093 RID: 4243
	public arena_type_enum arena_type;

	// Token: 0x04001094 RID: 4244
	public string[] play_summary;

	// Token: 0x04001095 RID: 4245
	public bool scratch;

	// Token: 0x04001096 RID: 4246
	private string _env_package;
}
