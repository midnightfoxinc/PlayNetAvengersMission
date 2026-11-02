using System;
using System.Collections.Generic;

// Token: 0x02000250 RID: 592
public class SFDBItemClass : DBItemClass
{
	// Token: 0x0600103A RID: 4154 RVA: 0x00073770 File Offset: 0x00071970
	public SFDBItemClass(JSONObject obj)
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
					if (SFDBItemClass.<>f__switch$map19 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(8);
						dictionary.Add("bio", 0);
						dictionary.Add("sf_class", 1);
						dictionary.Add("attack", 2);
						dictionary.Add("unlock_10", 3);
						dictionary.Add("ability", 4);
						dictionary.Add("hero", 5);
						dictionary.Add("avatar", 6);
						dictionary.Add("bg", 7);
						SFDBItemClass.<>f__switch$map19 = dictionary;
					}
					int num;
					if (SFDBItemClass.<>f__switch$map19.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.bio = base.scratch_tinted(jsonobject.str);
							break;
						case 1:
							this.sf_class = base.scratch_tinted(jsonobject.str.ToUpper());
							break;
						case 2:
							this.attack = base.scratch_tinted(jsonobject.str);
							break;
						case 3:
							for (int j = 0; j < jsonobject.list.Count; j++)
							{
								int num2;
								if (int.TryParse(jsonobject.keys[j], ref num2) && Enum.IsDefined(typeof(Constants.PlaymationDeviceType), num2))
								{
									this._unlock_10.Add((Constants.PlaymationDeviceType)num2, jsonobject.list[j].str);
								}
							}
							break;
						case 4:
							for (int k = 0; k < jsonobject.list.Count; k++)
							{
								int num3;
								if (int.TryParse(jsonobject.keys[k], ref num3) && Enum.IsDefined(typeof(Constants.PlaymationDeviceType), num3))
								{
									this._ability.Add((Constants.PlaymationDeviceType)num3, jsonobject.list[k].str);
								}
							}
							break;
						case 5:
							this.hero = jsonobject.b;
							break;
						case 6:
							this.avatar = jsonobject.b;
							break;
						case 7:
							this.bg = jsonobject.str;
							break;
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

	// Token: 0x0600103B RID: 4155 RVA: 0x00073A3C File Offset: 0x00071C3C
	public bool is_real_SF()
	{
		return !string.IsNullOrEmpty(this.attack);
	}

	// Token: 0x0600103C RID: 4156 RVA: 0x00073A4C File Offset: 0x00071C4C
	public string unlock_10(Constants.PlaymationDeviceType gearType)
	{
		if (gearType != Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			gearType = Constants.PlaymationDeviceType.DEVICE_REPULSOR;
		}
		if (this._unlock_10.ContainsKey(gearType))
		{
			return this._unlock_10[gearType];
		}
		return string.Empty;
	}

	// Token: 0x0600103D RID: 4157 RVA: 0x00073A84 File Offset: 0x00071C84
	public string ability(Constants.PlaymationDeviceType gearType)
	{
		if (gearType != Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			gearType = Constants.PlaymationDeviceType.DEVICE_REPULSOR;
		}
		if (this._ability.ContainsKey(gearType))
		{
			return this._ability[gearType];
		}
		return string.Empty;
	}

	// Token: 0x04001076 RID: 4214
	public string bio;

	// Token: 0x04001077 RID: 4215
	public string sf_class = string.Empty;

	// Token: 0x04001078 RID: 4216
	private Dictionary<Constants.PlaymationDeviceType, string> _unlock_10 = new Dictionary<Constants.PlaymationDeviceType, string>();

	// Token: 0x04001079 RID: 4217
	public string attack;

	// Token: 0x0400107A RID: 4218
	private Dictionary<Constants.PlaymationDeviceType, string> _ability = new Dictionary<Constants.PlaymationDeviceType, string>();

	// Token: 0x0400107B RID: 4219
	public bool hero;

	// Token: 0x0400107C RID: 4220
	public bool avatar;

	// Token: 0x0400107D RID: 4221
	public string bg;
}
