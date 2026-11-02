using System;
using System.Collections.Generic;

// Token: 0x02000256 RID: 598
public class locationDataClass
{
	// Token: 0x06001059 RID: 4185 RVA: 0x0007476C File Offset: 0x0007296C
	public locationDataItemClass item_by_id(string id)
	{
		for (int i = 0; i < this.item.Count; i++)
		{
			if (this.item[i].id == id)
			{
				return this.item[i];
			}
		}
		return null;
	}

	// Token: 0x0600105A RID: 4186 RVA: 0x000747C0 File Offset: 0x000729C0
	public missionDataClass mission_by_id(int id)
	{
		if (id < 0)
		{
			return null;
		}
		for (int i = 0; i < this.item.Count; i++)
		{
			missionDataClass missionDataClass = this.item[i].mission_by_id(id);
			if (missionDataClass)
			{
				return missionDataClass;
			}
		}
		return null;
	}

	// Token: 0x0600105B RID: 4187 RVA: 0x00074814 File Offset: 0x00072A14
	public locationDataItemClass location_of_mission(int mission_id)
	{
		for (int i = 0; i < this.item.Count; i++)
		{
			if (this.item[i].mission_by_id(mission_id))
			{
				return this.item[i];
			}
		}
		return null;
	}

	// Token: 0x0600105C RID: 4188 RVA: 0x00074868 File Offset: 0x00072A68
	public locationDataItemClass location_of_entitlement(string entitlement)
	{
		for (int i = 0; i < this.item.Count; i++)
		{
			if (this.item[i].env_package == entitlement || this.item[i].mission_by_entitlement(entitlement))
			{
				return this.item[i];
			}
		}
		return null;
	}

	// Token: 0x0600105D RID: 4189 RVA: 0x000748D8 File Offset: 0x00072AD8
	public locationDataItemClass location_by_requires(string requires)
	{
		if (string.IsNullOrEmpty(requires))
		{
			return null;
		}
		for (int i = 0; i < this.item.Count; i++)
		{
			if (this.item[i].requires == requires)
			{
				return this.item[i];
			}
		}
		return null;
	}

	// Token: 0x0600105E RID: 4190 RVA: 0x00074938 File Offset: 0x00072B38
	public string next_location_id(string from_location, bool forward)
	{
		int i = 0;
		while (i < this.item.Count)
		{
			if (this.item[i].id == from_location)
			{
				if (forward)
				{
					if (i < this.item.Count - 1)
					{
						return this.item[i + 1].id;
					}
					return this.item[0].id;
				}
				else
				{
					if (i > 0)
					{
						return this.item[i - 1].id;
					}
					return this.item.Last<locationDataItemClass>().id;
				}
			}
			else
			{
				i++;
			}
		}
		return null;
	}

	// Token: 0x0600105F RID: 4191 RVA: 0x000749EC File Offset: 0x00072BEC
	private void parse_item(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.OBJECT)
		{
			locationDataItemClass locationDataItemClass = new locationDataItemClass();
			locationDataItemClass.parse(obj);
			locationDataItemClass locationDataItemClass2 = this.item_by_id(locationDataItemClass.id);
			if (locationDataItemClass2)
			{
				globals.debugWarning(string.Concat(new string[]
				{
					"duplicate ID found! ID #",
					locationDataItemClass.id.ToString(),
					" shared by ",
					locationDataItemClass2.name,
					" and ",
					locationDataItemClass.name,
					"! ",
					locationDataItemClass.name,
					" will not be added to the location list!"
				}));
			}
			else
			{
				this.item.Add(locationDataItemClass);
			}
		}
	}

	// Token: 0x06001060 RID: 4192 RVA: 0x00074AA0 File Offset: 0x00072CA0
	public void parse(string s)
	{
		this.parse(new JSONObject(s, -2, false, false));
	}

	// Token: 0x06001061 RID: 4193 RVA: 0x00074AB4 File Offset: 0x00072CB4
	public void parse(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			this.item.Clear();
			for (int i = 0; i < obj.list.Count; i++)
			{
				this.parse_item(obj.list[i]);
			}
		}
		else if (obj.list.Count > 0 && obj.list[0].type == JSONObject.Type.ARRAY)
		{
			this.parse(obj.list[0]);
		}
		else
		{
			globals.debugWarning("json object is not an array");
		}
	}

	// Token: 0x06001062 RID: 4194 RVA: 0x00074B54 File Offset: 0x00072D54
	public missionDataClass alert_mission()
	{
		List<missionDataClass> list = new List<missionDataClass>();
		missionDataClass missionDataClass = null;
		if (!globals.BLE_manager.connectedDevice_data)
		{
			return null;
		}
		for (int i = 0; i < this.item.Count; i++)
		{
			if (this.item[i].unlocked())
			{
				for (int j = 0; j < this.item[i].missions.Count; j++)
				{
					missionDataClass missionDataClass2 = this.item[i].missions[j];
					if (globals.player_data.can_play_mission(missionDataClass2))
					{
						if (missionDataClass2.is_arena)
						{
							list.Add(missionDataClass2);
						}
						else if (globals.player_data.get_grade(missionDataClass2.id) < 1)
						{
							if (missionDataClass2.installed())
							{
								return missionDataClass2;
							}
							if (!missionDataClass)
							{
								missionDataClass = missionDataClass2;
							}
						}
					}
				}
			}
		}
		if (missionDataClass)
		{
			return missionDataClass;
		}
		if (list.Count < 1)
		{
			return null;
		}
		for (int k = 0; k < list.Count; k++)
		{
			if (globals.player_data.get_grade(list[k].id) < 1)
			{
				return list[k];
			}
		}
		if (!this._session_random_arena)
		{
			this._session_random_arena = list.Random<missionDataClass>();
		}
		return this._session_random_arena;
	}

	// Token: 0x040010AA RID: 4266
	public List<locationDataItemClass> item = new List<locationDataItemClass>();

	// Token: 0x040010AB RID: 4267
	private missionDataClass _session_random_arena;
}
