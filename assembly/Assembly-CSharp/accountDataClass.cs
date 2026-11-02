using System;
using System.Collections.Generic;

// Token: 0x02000245 RID: 581
public class accountDataClass
{
	// Token: 0x170001F2 RID: 498
	// (get) Token: 0x0600102A RID: 4138 RVA: 0x00072A7C File Offset: 0x00070C7C
	public bool isGuest
	{
		get
		{
			return string.IsNullOrEmpty(this.id);
		}
	}

	// Token: 0x0600102B RID: 4139 RVA: 0x00072A8C File Offset: 0x00070C8C
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
					if (accountDataClass.<>f__switch$map12 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(2);
						dictionary.Add("id", 0);
						dictionary.Add("accessToken", 1);
						accountDataClass.<>f__switch$map12 = dictionary;
					}
					int num;
					if (accountDataClass.<>f__switch$map12.TryGetValue(text2, ref num))
					{
						if (num != 0)
						{
							if (num == 1)
							{
								this.accessToken = jsonobject.str;
							}
						}
						else
						{
							this.id = jsonobject.str;
						}
					}
				}
			}
			if (string.IsNullOrEmpty(this.id))
			{
				globals.debugWarning("id missing!");
			}
			if (string.IsNullOrEmpty(this.accessToken))
			{
				globals.debugWarning("accessToken missing!");
			}
		}
		else
		{
			globals.debugWarning("data is not a json object");
		}
	}

	// Token: 0x04001042 RID: 4162
	public string id = string.Empty;

	// Token: 0x04001043 RID: 4163
	public string accessToken = string.Empty;
}
