using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000254 RID: 596
public class locationDataItemClass
{
	// Token: 0x0600104C RID: 4172 RVA: 0x000740F0 File Offset: 0x000722F0
	private string scratch_tinted(string s)
	{
		return globals.datafile_roster.scratch_tinted(s, this.scratch);
	}

	// Token: 0x0600104D RID: 4173 RVA: 0x00074104 File Offset: 0x00072304
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
					if (locationDataItemClass.<>f__switch$map1C == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(9);
						dictionary.Add("name", 0);
						dictionary.Add("rotation", 1);
						dictionary.Add("id", 2);
						dictionary.Add("embedded", 3);
						dictionary.Add("requires", 4);
						dictionary.Add("offworld_icon", 5);
						dictionary.Add("missions", 6);
						dictionary.Add("env_package", 7);
						dictionary.Add("memory_slots", 8);
						locationDataItemClass.<>f__switch$map1C = dictionary;
					}
					int num;
					if (locationDataItemClass.<>f__switch$map1C.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.name = this.scratch_tinted(jsonobject.str);
							break;
						case 1:
						{
							int[] array = jsonobject.str.ToIntArray(',');
							if (array.Length == 2)
							{
								this.rotation = new Vector2((float)array[0], (float)array[1]);
							}
							else
							{
								globals.debugWarning("bad rotation data: " + jsonobject.str);
							}
							break;
						}
						case 2:
							this.id = jsonobject.str.ToUpper();
							break;
						case 3:
							this.embedded = jsonobject.b;
							break;
						case 4:
							if (jsonobject.str != null)
							{
								this.requires = jsonobject.str;
							}
							else
							{
								globals.debugError("Bad 'requires' data");
							}
							break;
						case 5:
							this.offworld_icon = jsonobject.str;
							this.offworld = true;
							break;
						case 6:
							this.parse_missions(jsonobject);
							break;
						case 7:
							this.env_package = jsonobject.str;
							break;
						case 8:
							this.memory_slots = (int)jsonobject.n;
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x0600104E RID: 4174 RVA: 0x00074350 File Offset: 0x00072550
	public void parse_missions(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			this.missions.Clear();
			this.characters.Clear();
			for (int i = 0; i < obj.list.Count; i++)
			{
				missionDataClass missionDataClass = new missionDataClass();
				missionDataClass.parse(obj.list[i]);
				missionDataClass.location = this;
				missionDataClass missionDataClass2 = this.mission_by_id(missionDataClass.id);
				if (missionDataClass2)
				{
					globals.debugWarning(string.Concat(new string[]
					{
						"duplicate mission ID found! ID #",
						missionDataClass.id.ToString(),
						" shared by ",
						missionDataClass2.name,
						" and ",
						missionDataClass.name,
						" in mission ",
						this.name,
						"! ",
						missionDataClass.name,
						" will not be added to the mission list!"
					}));
				}
				else
				{
					this.add_characters(missionDataClass.characters);
					this.missions.Add(missionDataClass);
				}
			}
		}
		else
		{
			globals.debugWarning("json mission list is not an array!");
		}
	}

	// Token: 0x0600104F RID: 4175 RVA: 0x00074474 File Offset: 0x00072674
	public missionDataClass mission_by_id(int id)
	{
		for (int i = 0; i < this.missions.Count; i++)
		{
			if (this.missions[i].id == id)
			{
				return this.missions[i];
			}
		}
		return null;
	}

	// Token: 0x06001050 RID: 4176 RVA: 0x000744C4 File Offset: 0x000726C4
	public missionDataClass mission_by_entitlement(string entitlement)
	{
		for (int i = 0; i < this.missions.Count; i++)
		{
			if (this.missions[i].entitlements == entitlement)
			{
				return this.missions[i];
			}
		}
		return null;
	}

	// Token: 0x06001051 RID: 4177 RVA: 0x00074518 File Offset: 0x00072718
	public void add_characters(string[] c)
	{
		for (int i = 0; i < c.Length; i++)
		{
			if (!this.characters.Contains(c[i]))
			{
				this.characters.Add(c[i]);
			}
		}
	}

	// Token: 0x06001052 RID: 4178 RVA: 0x0007455C File Offset: 0x0007275C
	public bool requires_purchase()
	{
		return this.requires.ToLower().Trim() == "purchase";
	}

	// Token: 0x06001053 RID: 4179 RVA: 0x00074578 File Offset: 0x00072778
	public bool unlocked()
	{
		return globals.player_data.has_unlock(this.id);
	}

	// Token: 0x06001054 RID: 4180 RVA: 0x0007458C File Offset: 0x0007278C
	public bool installed()
	{
		if (this.embedded)
		{
			return true;
		}
		if (!globals.BLE_manager.connectedDevice_data)
		{
			return false;
		}
		if (!string.IsNullOrEmpty(this.env_package) && !globals.BLE_manager.connectedDevice_data.isContentInstalledWithLatestVersion(this.env_package))
		{
			return false;
		}
		for (int i = 0; i < this.missions.Count; i++)
		{
			if (!this.missions[i].installed())
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x06001055 RID: 4181 RVA: 0x00074620 File Offset: 0x00072820
	public locationDataItemClass.completion_enum completion()
	{
		locationDataItemClass.completion_enum result = locationDataItemClass.completion_enum.zero;
		bool flag = true;
		bool flag2 = true;
		for (int i = 0; i < this.missions.Count; i++)
		{
			if (this.missions[i].rated)
			{
				int num = globals.player_data.get_grade(this.missions[i].id);
				if (num < 3)
				{
					flag2 = false;
				}
				if (num > 0)
				{
					result = locationDataItemClass.completion_enum.partial;
				}
				else
				{
					flag = false;
				}
			}
		}
		if (flag2)
		{
			return locationDataItemClass.completion_enum.mastered;
		}
		if (flag)
		{
			return locationDataItemClass.completion_enum.complete;
		}
		return result;
	}

	// Token: 0x06001056 RID: 4182 RVA: 0x000746B0 File Offset: 0x000728B0
	public float CompletionFloat(bool based_on_medals = true)
	{
		int num = 0;
		int num2 = 0;
		for (int i = 0; i < this.missions.Count; i++)
		{
			if (this.missions[i].rated)
			{
				int num3 = globals.player_data.get_grade(this.missions[i].id);
				if (based_on_medals)
				{
					if (num3 > 0)
					{
						num2 += num3;
					}
					num += 3;
				}
				else
				{
					if (num3 > 0)
					{
						num2++;
					}
					num++;
				}
			}
		}
		if (num > 0)
		{
			return (float)num2 / (float)num;
		}
		return 0f;
	}

	// Token: 0x06001057 RID: 4183 RVA: 0x0007474C File Offset: 0x0007294C
	public static implicit operator bool(locationDataItemClass d)
	{
		return d != null;
	}

	// Token: 0x04001098 RID: 4248
	public string name;

	// Token: 0x04001099 RID: 4249
	public Vector2 rotation;

	// Token: 0x0400109A RID: 4250
	public string id;

	// Token: 0x0400109B RID: 4251
	public bool embedded;

	// Token: 0x0400109C RID: 4252
	public bool offworld;

	// Token: 0x0400109D RID: 4253
	public string offworld_icon;

	// Token: 0x0400109E RID: 4254
	public string requires = string.Empty;

	// Token: 0x0400109F RID: 4255
	public List<missionDataClass> missions = new List<missionDataClass>();

	// Token: 0x040010A0 RID: 4256
	public List<string> characters = new List<string>();

	// Token: 0x040010A1 RID: 4257
	public string env_package;

	// Token: 0x040010A2 RID: 4258
	public int memory_slots;

	// Token: 0x040010A3 RID: 4259
	public bool scratch;

	// Token: 0x02000255 RID: 597
	public enum completion_enum
	{
		// Token: 0x040010A6 RID: 4262
		zero,
		// Token: 0x040010A7 RID: 4263
		partial,
		// Token: 0x040010A8 RID: 4264
		complete,
		// Token: 0x040010A9 RID: 4265
		mastered
	}
}
