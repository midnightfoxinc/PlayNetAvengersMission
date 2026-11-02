using System;
using System.Collections.Generic;

// Token: 0x0200024C RID: 588
public class EnemyDBItemClass : DBItemClass
{
	// Token: 0x06001035 RID: 4149 RVA: 0x00073358 File Offset: 0x00071558
	public EnemyDBItemClass(JSONObject obj)
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
					if (EnemyDBItemClass.<>f__switch$map16 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(5);
						dictionary.Add("bio", 0);
						dictionary.Add("enemy_class", 1);
						dictionary.Add("tip", 2);
						dictionary.Add("bg", 3);
						dictionary.Add("base_type", 4);
						EnemyDBItemClass.<>f__switch$map16 = dictionary;
					}
					int num;
					if (EnemyDBItemClass.<>f__switch$map16.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.bio = base.scratch_tinted(jsonobject.str);
							break;
						case 1:
							this.enemy_class = jsonobject.str.ToUpper();
							break;
						case 2:
							for (int j = 0; j < jsonobject.list.Count; j++)
							{
								int num2;
								if (int.TryParse(jsonobject.keys[j], ref num2) && Enum.IsDefined(typeof(Constants.PlaymationDeviceType), num2))
								{
									this._tip.Add((Constants.PlaymationDeviceType)num2, jsonobject.list[j].str);
								}
							}
							break;
						case 3:
							this.bg = jsonobject.str;
							break;
						case 4:
							this.base_type = (int)jsonobject.n;
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

	// Token: 0x06001036 RID: 4150 RVA: 0x0007355C File Offset: 0x0007175C
	public string tip(Constants.PlaymationDeviceType gearType)
	{
		if (gearType != Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			gearType = Constants.PlaymationDeviceType.DEVICE_REPULSOR;
		}
		if (this._tip.ContainsKey(gearType))
		{
			return this._tip[gearType];
		}
		return string.Empty;
	}

	// Token: 0x04001069 RID: 4201
	public string bio = string.Empty;

	// Token: 0x0400106A RID: 4202
	public string enemy_class = string.Empty;

	// Token: 0x0400106B RID: 4203
	public Dictionary<Constants.PlaymationDeviceType, string> _tip = new Dictionary<Constants.PlaymationDeviceType, string>();

	// Token: 0x0400106C RID: 4204
	public string bg = string.Empty;

	// Token: 0x0400106D RID: 4205
	public int base_type = -1;

	// Token: 0x0200024D RID: 589
	public class EnemySubtypeClass
	{
		// Token: 0x0400106F RID: 4207
		public string name;

		// Token: 0x04001070 RID: 4208
		public string action;
	}
}
