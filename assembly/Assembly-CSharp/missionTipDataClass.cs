using System;
using System.Collections.Generic;

// Token: 0x02000251 RID: 593
public class missionTipDataClass
{
	// Token: 0x0600103E RID: 4158 RVA: 0x00073ABC File Offset: 0x00071CBC
	public missionTipDataClass(JSONObject obj, missionDataClass mission)
	{
		this.mission = mission;
		this.parse(obj);
	}

	// Token: 0x0600103F RID: 4159 RVA: 0x00073AF4 File Offset: 0x00071CF4
	private string scratch_tinted(string s)
	{
		if (this.mission)
		{
			return this.mission.scratch_tinted(s);
		}
		globals.debugWarning("mission tip is missing mission");
		return s;
	}

	// Token: 0x06001040 RID: 4160 RVA: 0x00073B2C File Offset: 0x00071D2C
	public void parse(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.OBJECT)
		{
			for (int i = 0; i < obj.list.Count; i++)
			{
				string text = obj.keys[i];
				JSONObject jsonobject = obj.list[i];
				string text2 = text;
				if (text2 != null)
				{
					if (missionTipDataClass.<>f__switch$map1A == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(3);
						dictionary.Add("mola", 0);
						dictionary.Add("action", 1);
						dictionary.Add("description", 2);
						missionTipDataClass.<>f__switch$map1A = dictionary;
					}
					int num;
					if (missionTipDataClass.<>f__switch$map1A.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.mola = (int)jsonobject.n;
							break;
						case 1:
							this.action = jsonobject.str;
							break;
						case 2:
							this.text = this.scratch_tinted(jsonobject.str);
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x0400107F RID: 4223
	public int mola;

	// Token: 0x04001080 RID: 4224
	public string action = string.Empty;

	// Token: 0x04001081 RID: 4225
	public string text = string.Empty;

	// Token: 0x04001082 RID: 4226
	public missionDataClass mission;
}
