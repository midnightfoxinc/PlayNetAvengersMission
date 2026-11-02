using System;
using System.Collections.Generic;

// Token: 0x02000259 RID: 601
[Serializable]
public class missionSummaryClass
{
	// Token: 0x06001068 RID: 4200 RVA: 0x00074FAC File Offset: 0x000731AC
	public missionSummaryClass()
	{
	}

	// Token: 0x06001069 RID: 4201 RVA: 0x00075000 File Offset: 0x00073200
	public missionSummaryClass(JSONObject obj)
	{
		this.parse(obj);
	}

	// Token: 0x0600106A RID: 4202 RVA: 0x00075058 File Offset: 0x00073258
	private void parse_enemy_kill_json(int enemy_type, JSONObject value)
	{
		if (enemy_type < 0 || !value.IsArray || value.Count < 1)
		{
			return;
		}
		if (value[0].IsArray)
		{
			this.parse_enemy_kill_json(enemy_type, value[0]);
		}
		else
		{
			int num = 0;
			if (value.Count > 1)
			{
				num = (int)value[1].n;
			}
			if (num > 0)
			{
				this.enemies_killed.Add(new missionSummaryClass.EnemiesKilledClass(enemy_type, num));
			}
		}
	}

	// Token: 0x0600106B RID: 4203 RVA: 0x000750E0 File Offset: 0x000732E0
	public void parse(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.OBJECT)
		{
			int i = 0;
			while (i < obj.list.Count)
			{
				string text = obj.keys[i];
				JSONObject jsonobject = obj.list[i];
				if (text == "dxp." + globals.BLE_manager.connectedDevice.ToString())
				{
					this.xp = (int)jsonobject[0].n;
				}
				else if (text.Contains("char."))
				{
					string[] array = text.Split(new char[]
					{
						'.'
					});
					if (array.Length > 1)
					{
						int sf = Convert.ToInt32(array[1]);
						this.sf_rep.Add(new SFRepClass(sf, (int)jsonobject[0].n));
					}
				}
				string text2 = text;
				if (text2 == null)
				{
					goto IL_21E;
				}
				if (missionSummaryClass.<>f__switch$map1E == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(6);
					dictionary.Add("complete", 0);
					dictionary.Add("deaths", 1);
					dictionary.Add("health", 2);
					dictionary.Add("mission", 3);
					dictionary.Add("time", 4);
					dictionary.Add("devs", 5);
					missionSummaryClass.<>f__switch$map1E = dictionary;
				}
				int num;
				if (!missionSummaryClass.<>f__switch$map1E.TryGetValue(text2, ref num))
				{
					goto IL_21E;
				}
				switch (num)
				{
				case 0:
					this.completed = jsonobject.b;
					break;
				case 1:
					this.deaths = (int)jsonobject.n;
					break;
				case 2:
					this.health = (int)jsonobject.n;
					break;
				case 3:
					this.mission = (int)jsonobject.n;
					break;
				case 4:
					this.time = (int)jsonobject.n;
					break;
				case 5:
					for (int j = 0; j < jsonobject.list.Count; j++)
					{
						int id = int.Parse(jsonobject.keys[j]);
						JSONObject obj2 = jsonobject.list[j];
						this.devices_used.Add(new missionSummaryClass.DeviceUsedClass(id, obj2));
					}
					break;
				default:
					goto IL_21E;
				}
				IL_284:
				i++;
				continue;
				IL_21E:
				if (text.StartsWith("abil."))
				{
					this.weps_used.Add(new missionSummaryClass.WeaponUsedClass(text.Substring(5), jsonobject));
				}
				else if (text.StartsWith("enemies."))
				{
					int enemy_type = -1;
					int.TryParse(text.Replace("enemies.", string.Empty), ref enemy_type);
					this.parse_enemy_kill_json(enemy_type, jsonobject);
				}
				goto IL_284;
			}
			locationDataItemClass locationDataItemClass = globals.location_data.location_of_mission(this.mission);
			if (locationDataItemClass)
			{
				this.location = locationDataItemClass.id;
			}
			this.iso8 = this.xp * 2;
		}
		this.calculate_grade();
	}

	// Token: 0x0600106C RID: 4204 RVA: 0x000753C8 File Offset: 0x000735C8
	public void calculate_grade()
	{
		missionDataClass missionDataClass = globals.location_data.mission_by_id(this.mission);
		if (!missionDataClass)
		{
			globals.debugWarning("mission not found: " + this.mission.ToString());
			return;
		}
		if (missionDataClass.is_arena)
		{
			int num = 3 - this.deaths;
			if (this.time > missionDataClass.target_time)
			{
				num--;
			}
			if (num < 1)
			{
				num = 1;
			}
			this.grade = num;
		}
		else
		{
			int num2 = 2 - this.deaths;
			if (this.time > missionDataClass.target_time)
			{
				num2--;
				num2 -= (this.time - missionDataClass.target_time) / (30 * this._time_ticks_per_second);
			}
			else
			{
				num2++;
			}
			if (num2 < 1)
			{
				num2 = 1;
			}
			else if (num2 > 3)
			{
				num2 = 3;
			}
			this.grade = num2;
		}
		globals.player_data.set_grade(this.mission, this.grade);
	}

	// Token: 0x0600106D RID: 4205 RVA: 0x000754C0 File Offset: 0x000736C0
	public static implicit operator bool(missionSummaryClass d)
	{
		return d != null;
	}

	// Token: 0x040010B1 RID: 4273
	public bool completed;

	// Token: 0x040010B2 RID: 4274
	public int deaths;

	// Token: 0x040010B3 RID: 4275
	public int xp;

	// Token: 0x040010B4 RID: 4276
	public int health;

	// Token: 0x040010B5 RID: 4277
	public int mission = -1;

	// Token: 0x040010B6 RID: 4278
	public int time;

	// Token: 0x040010B7 RID: 4279
	public List<SFRepClass> sf_rep = new List<SFRepClass>();

	// Token: 0x040010B8 RID: 4280
	public List<missionSummaryClass.DeviceUsedClass> devices_used = new List<missionSummaryClass.DeviceUsedClass>();

	// Token: 0x040010B9 RID: 4281
	public List<missionSummaryClass.WeaponUsedClass> weps_used = new List<missionSummaryClass.WeaponUsedClass>();

	// Token: 0x040010BA RID: 4282
	public List<missionSummaryClass.EnemiesKilledClass> enemies_killed = new List<missionSummaryClass.EnemiesKilledClass>();

	// Token: 0x040010BB RID: 4283
	public string location;

	// Token: 0x040010BC RID: 4284
	public int iso8;

	// Token: 0x040010BD RID: 4285
	public int grade;

	// Token: 0x040010BE RID: 4286
	private int _time_ticks_per_second = 1000;

	// Token: 0x0200025A RID: 602
	[Serializable]
	public class DeviceUsedClass
	{
		// Token: 0x0600106E RID: 4206 RVA: 0x000754CC File Offset: 0x000736CC
		public DeviceUsedClass()
		{
		}

		// Token: 0x0600106F RID: 4207 RVA: 0x000754D4 File Offset: 0x000736D4
		public DeviceUsedClass(int id, int[] nums)
		{
			this.id = id;
			this.nums = nums;
		}

		// Token: 0x06001070 RID: 4208 RVA: 0x000754EC File Offset: 0x000736EC
		public DeviceUsedClass(int id, JSONObject obj)
		{
			this.id = id;
			List<int> list = new List<int>();
			for (int i = 0; i < obj.Count; i++)
			{
				list.Add((int)obj[i].n);
			}
			this.nums = list.ToArray();
		}

		// Token: 0x040010C0 RID: 4288
		public int id;

		// Token: 0x040010C1 RID: 4289
		public int[] nums;
	}

	// Token: 0x0200025B RID: 603
	[Serializable]
	public class WeaponUsedClass
	{
		// Token: 0x06001071 RID: 4209 RVA: 0x00075544 File Offset: 0x00073744
		public WeaponUsedClass(string wep_id, int fired, int hits)
		{
			this.wep_id = wep_id;
			this.fired = fired;
			this.hits = hits;
		}

		// Token: 0x06001072 RID: 4210 RVA: 0x00075578 File Offset: 0x00073778
		public WeaponUsedClass(string wep_id, JSONObject obj)
		{
			this.wep_id = wep_id;
			this.fired = (int)obj[0].n;
			this.hits = (int)obj[1].n;
		}

		// Token: 0x040010C2 RID: 4290
		public string wep_id = string.Empty;

		// Token: 0x040010C3 RID: 4291
		public int fired;

		// Token: 0x040010C4 RID: 4292
		public int hits;
	}

	// Token: 0x0200025C RID: 604
	[Serializable]
	public class EnemiesKilledClass
	{
		// Token: 0x06001073 RID: 4211 RVA: 0x000755C4 File Offset: 0x000737C4
		public EnemiesKilledClass(int type, int count)
		{
			this.type = type;
			this.count = count;
		}

		// Token: 0x040010C5 RID: 4293
		public int type;

		// Token: 0x040010C6 RID: 4294
		public int count;
	}
}
