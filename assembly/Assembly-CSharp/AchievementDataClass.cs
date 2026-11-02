using System;
using System.Collections.Generic;

// Token: 0x02000239 RID: 569
public class AchievementDataClass
{
	// Token: 0x06000FFE RID: 4094 RVA: 0x000717EC File Offset: 0x0006F9EC
	public AchievementDataClass(string json_str)
	{
		this.parse(json_str);
	}

	// Token: 0x06000FFF RID: 4095 RVA: 0x00071808 File Offset: 0x0006FA08
	public AchievementItemClass item_by_id(string id)
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

	// Token: 0x06001000 RID: 4096 RVA: 0x0007185C File Offset: 0x0006FA5C
	public void parse(string json_str)
	{
		JSONObject jsonobject = new JSONObject(json_str, -2, false, false);
		if (jsonobject.IsArray)
		{
			for (int i = 0; i < jsonobject.Count; i++)
			{
				this.item.Add(new AchievementItemClass(jsonobject[i]));
			}
		}
		else
		{
			globals.debugWarning("Trigger data not in array format!");
		}
	}

	// Token: 0x0400100D RID: 4109
	public List<AchievementItemClass> item = new List<AchievementItemClass>();
}
