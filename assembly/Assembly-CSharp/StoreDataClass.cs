using System;
using System.Collections.Generic;

// Token: 0x02000244 RID: 580
public class StoreDataClass
{
	// Token: 0x06001024 RID: 4132 RVA: 0x000728B8 File Offset: 0x00070AB8
	public StoreItemDataClass item_by_id(string id, bool complain = true)
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

	// Token: 0x06001025 RID: 4133 RVA: 0x00072930 File Offset: 0x00070B30
	public void parse_department(string s)
	{
		this.parse_department(new JSONObject(s, -2, false, false));
	}

	// Token: 0x06001026 RID: 4134 RVA: 0x00072944 File Offset: 0x00070B44
	public void parse_department(JSONObject obj)
	{
		if (obj.IsArray)
		{
			for (int i = 0; i < obj.Count; i++)
			{
				this.parse_department(obj[i]);
			}
		}
		else
		{
			StoreDepartmentDataClass storeDepartmentDataClass = new StoreDepartmentDataClass(obj);
			if (storeDepartmentDataClass)
			{
				this.department.Add(storeDepartmentDataClass);
			}
		}
	}

	// Token: 0x06001027 RID: 4135 RVA: 0x000729A4 File Offset: 0x00070BA4
	public void parse_items(string s)
	{
		this.parse_items(new JSONObject(s, -2, false, false));
	}

	// Token: 0x06001028 RID: 4136 RVA: 0x000729B8 File Offset: 0x00070BB8
	public void parse_items(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			for (int i = 0; i < obj.list.Count; i++)
			{
				StoreItemDataClass storeItemDataClass = new StoreItemDataClass(obj.list[i]);
				this.item.Add(storeItemDataClass);
			}
		}
		else if (obj.list.Count > 0 && obj.list[0].type == JSONObject.Type.ARRAY)
		{
			this.parse_items(obj.list[0]);
		}
		else
		{
			globals.debugWarning("json object is not an array");
		}
	}

	// Token: 0x04001040 RID: 4160
	public List<StoreDepartmentDataClass> department = new List<StoreDepartmentDataClass>();

	// Token: 0x04001041 RID: 4161
	public List<StoreItemDataClass> item = new List<StoreItemDataClass>();
}
