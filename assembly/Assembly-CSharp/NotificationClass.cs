using System;
using System.Collections.Generic;

// Token: 0x0200023B RID: 571
public class NotificationClass
{
	// Token: 0x06001005 RID: 4101 RVA: 0x00071AE4 File Offset: 0x0006FCE4
	public NotificationClass(JSONObject obj)
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
					if (NotificationClass.<>f__switch$mapD == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(2);
						dictionary.Add("title", 0);
						dictionary.Add("body", 1);
						NotificationClass.<>f__switch$mapD = dictionary;
					}
					int num;
					if (NotificationClass.<>f__switch$mapD.TryGetValue(text2, ref num))
					{
						if (num != 0)
						{
							if (num == 1)
							{
								this.body = jsonobject.str;
							}
						}
						else
						{
							this.title = jsonobject.str;
						}
					}
				}
			}
		}
	}

	// Token: 0x0400100F RID: 4111
	public string title = string.Empty;

	// Token: 0x04001010 RID: 4112
	public string body = string.Empty;
}
