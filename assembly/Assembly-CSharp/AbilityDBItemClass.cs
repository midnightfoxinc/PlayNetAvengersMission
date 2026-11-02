using System;
using System.Collections.Generic;

// Token: 0x02000246 RID: 582
public class AbilityDBItemClass : DBItemClass
{
	// Token: 0x0600102C RID: 4140 RVA: 0x00072BA4 File Offset: 0x00070DA4
	public AbilityDBItemClass(JSONObject obj)
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
					if (AbilityDBItemClass.<>f__switch$map13 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(12);
						dictionary.Add("image", 0);
						dictionary.Add("description", 1);
						dictionary.Add("instructions", 2);
						dictionary.Add("element", 3);
						dictionary.Add("slot", 4);
						dictionary.Add("mola", 5);
						dictionary.Add("damage", 6);
						dictionary.Add("shield_break", 7);
						dictionary.Add("stun", 8);
						dictionary.Add("cooldown", 9);
						dictionary.Add("unlocked_by_type", 10);
						dictionary.Add("unlocked_by_value", 11);
						AbilityDBItemClass.<>f__switch$map13 = dictionary;
					}
					int num;
					if (AbilityDBItemClass.<>f__switch$map13.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.image = jsonobject.str;
							break;
						case 1:
							this.description = base.scratch_tinted(jsonobject.str);
							break;
						case 2:
							this.instructions = base.scratch_tinted(jsonobject.str);
							break;
						case 3:
							this.element = base.scratch_tinted(jsonobject.str);
							break;
						case 4:
							this.set_slot(jsonobject.str);
							break;
						case 5:
							if (jsonobject.IsNumber)
							{
								this.mola = ((int)jsonobject.n).ToString();
							}
							else
							{
								this.mola = jsonobject.str;
							}
							break;
						case 6:
							this.damage = (int)jsonobject.n;
							break;
						case 7:
							this.shield_break = jsonobject.b;
							break;
						case 8:
							this.stun = jsonobject.b;
							break;
						case 9:
							this.cooldown = jsonobject.f;
							break;
						case 10:
							this.unlock.set_type(jsonobject.str);
							break;
						case 11:
							if (jsonobject.IsNumber)
							{
								this.unlock.value = ((int)jsonobject.n).ToString();
							}
							else
							{
								this.unlock.value = jsonobject.str;
							}
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x0600102D RID: 4141 RVA: 0x00072E74 File Offset: 0x00071074
	public void set_slot(string t)
	{
		for (int i = 0; i < Enum.GetNames(typeof(AbilityDBItemClass.slot_enum)).Length; i++)
		{
			if (t.ToLower().Trim() == ((AbilityDBItemClass.slot_enum)i).ToString().ToLower())
			{
				this.slot = (AbilityDBItemClass.slot_enum)i;
				return;
			}
		}
		globals.debugWarning("bad ability slot: " + t);
	}

	// Token: 0x0600102E RID: 4142 RVA: 0x00072EE0 File Offset: 0x000710E0
	public string unlock_text()
	{
		string text = string.Empty;
		switch (this.unlock.type)
		{
		case AbilityDBItemClass.unlock_enum.level:
			if (this.unlock.value == "0")
			{
				text = Localization.Get("ABIL_UNLOCK_LEVEL0");
			}
			else
			{
				text = Localization.Get("ABIL_UNLOCK_LEVEL").Replace("$LEVEL", this.unlock.value);
			}
			break;
		case AbilityDBItemClass.unlock_enum.sf:
		{
			SFDBItemClass sfdbitemClass = globals.database_data.item_by_id(this.unlock.value, true) as SFDBItemClass;
			if (sfdbitemClass)
			{
				text = Localization.Get("ABIL_UNLOCK_SF").Replace("$SF", sfdbitemClass.name);
			}
			break;
		}
		case AbilityDBItemClass.unlock_enum.action:
			text = Localization.Get("ABIL_UNLOCK_" + this.unlock.value);
			break;
		}
		if (text.Contains("$GEAR"))
		{
			GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(this.mola, true) as GearDBItemClass;
			if (gearDBItemClass)
			{
				text = text.Replace("$GEAR", gearDBItemClass.name);
			}
		}
		return text;
	}

	// Token: 0x04001045 RID: 4165
	public string image;

	// Token: 0x04001046 RID: 4166
	public string description;

	// Token: 0x04001047 RID: 4167
	public string instructions;

	// Token: 0x04001048 RID: 4168
	public string element = string.Empty;

	// Token: 0x04001049 RID: 4169
	public AbilityDBItemClass.slot_enum slot;

	// Token: 0x0400104A RID: 4170
	public string mola = string.Empty;

	// Token: 0x0400104B RID: 4171
	public int damage = 1;

	// Token: 0x0400104C RID: 4172
	public bool shield_break;

	// Token: 0x0400104D RID: 4173
	public bool stun;

	// Token: 0x0400104E RID: 4174
	public float cooldown;

	// Token: 0x0400104F RID: 4175
	public AbilityDBItemClass.unlock_class unlock = new AbilityDBItemClass.unlock_class();

	// Token: 0x02000247 RID: 583
	public enum unlock_enum
	{
		// Token: 0x04001052 RID: 4178
		level,
		// Token: 0x04001053 RID: 4179
		sf,
		// Token: 0x04001054 RID: 4180
		action
	}

	// Token: 0x02000248 RID: 584
	public enum slot_enum
	{
		// Token: 0x04001056 RID: 4182
		none,
		// Token: 0x04001057 RID: 4183
		Deploy,
		// Token: 0x04001058 RID: 4184
		Gesture,
		// Token: 0x04001059 RID: 4185
		ThndrClp,
		// Token: 0x0400105A RID: 4186
		GrndSlam,
		// Token: 0x0400105B RID: 4187
		Throw,
		// Token: 0x0400105C RID: 4188
		HlkAsst,
		// Token: 0x0400105D RID: 4189
		DblPnch,
		// Token: 0x0400105E RID: 4190
		Block
	}

	// Token: 0x02000249 RID: 585
	public class unlock_class
	{
		// Token: 0x06001030 RID: 4144 RVA: 0x00073028 File Offset: 0x00071228
		public void set_type(string t)
		{
			for (int i = 0; i < Enum.GetNames(typeof(AbilityDBItemClass.unlock_enum)).Length; i++)
			{
				if (t.ToLower().Trim() == ((AbilityDBItemClass.unlock_enum)i).ToString().ToLower())
				{
					this.type = (AbilityDBItemClass.unlock_enum)i;
					return;
				}
			}
			globals.debugWarning("bad ability unlock type: " + t);
		}

		// Token: 0x0400105F RID: 4191
		public AbilityDBItemClass.unlock_enum type;

		// Token: 0x04001060 RID: 4192
		public string value = string.Empty;
	}
}
