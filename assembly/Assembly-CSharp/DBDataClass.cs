using System;
using System.Collections.Generic;

// Token: 0x0200023A RID: 570
[Serializable]
public class DBDataClass
{
	// Token: 0x06001002 RID: 4098 RVA: 0x000718D0 File Offset: 0x0006FAD0
	public DBItemClass item_by_id(string id, bool complain = true)
	{
		if (string.IsNullOrEmpty(id))
		{
			return null;
		}
		for (int i = 0; i < this.item.Count; i++)
		{
			if (this.item[i].id == id)
			{
				return this.item[i];
			}
		}
		if (complain)
		{
			globals.debugWarning("invalid id: " + id);
		}
		return null;
	}

	// Token: 0x06001003 RID: 4099 RVA: 0x00071948 File Offset: 0x0006FB48
	public void parse(string s, db_item_type_enum t)
	{
		this.parse(new JSONObject(s, -2, false, false), t);
	}

	// Token: 0x06001004 RID: 4100 RVA: 0x0007195C File Offset: 0x0006FB5C
	public void parse(JSONObject obj, db_item_type_enum t)
	{
		bool flag = false;
		if (obj.type == JSONObject.Type.ARRAY)
		{
			for (int i = 0; i < obj.list.Count; i++)
			{
				DBItemClass dbitemClass = null;
				switch (t)
				{
				case db_item_type_enum.smartfigure:
					dbitemClass = new SFDBItemClass(obj.list[i]);
					break;
				case db_item_type_enum.enemy:
					dbitemClass = new EnemyDBItemClass(obj.list[i]);
					break;
				case db_item_type_enum.hazard:
					dbitemClass = new HazardDBItemClass(obj.list[i]);
					break;
				case db_item_type_enum.action:
					dbitemClass = new ActionDBItemClass(obj.list[i]);
					break;
				case db_item_type_enum.ability:
					dbitemClass = new AbilityDBItemClass(obj.list[i]);
					break;
				case db_item_type_enum.gear:
					dbitemClass = new GearDBItemClass(obj.list[i]);
					break;
				}
				if (dbitemClass)
				{
					if (!this.item_by_id(dbitemClass.id, false))
					{
						this.item.Add(dbitemClass);
					}
					else if (!flag)
					{
						globals.debug("duplicate ID found: " + dbitemClass.id);
					}
				}
			}
		}
		else if (obj.list.Count > 0 && obj.list[0].type == JSONObject.Type.ARRAY)
		{
			this.parse(obj.list[0], t);
		}
		else
		{
			globals.debugWarning("json object is not an array");
		}
	}

	// Token: 0x0400100E RID: 4110
	public List<DBItemClass> item = new List<DBItemClass>();
}
