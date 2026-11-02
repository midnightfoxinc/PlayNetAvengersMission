using System;
using System.Collections.Generic;

// Token: 0x0200023C RID: 572
public class NotificationDataClass
{
	// Token: 0x06001006 RID: 4102 RVA: 0x00071BD4 File Offset: 0x0006FDD4
	public NotificationDataClass(string s)
	{
		this.parse(new JSONObject(s, -2, false, false));
	}

	// Token: 0x06001007 RID: 4103 RVA: 0x00071BF8 File Offset: 0x0006FDF8
	public NotificationDataClass(JSONObject j)
	{
		this.parse(j);
	}

	// Token: 0x06001008 RID: 4104 RVA: 0x00071C14 File Offset: 0x0006FE14
	public void parse(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			this.notification.Clear();
			for (int i = 0; i < obj.list.Count; i++)
			{
				NotificationClass notificationClass = new NotificationClass(obj.list[i]);
				this.notification.Add(notificationClass);
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

	// Token: 0x04001012 RID: 4114
	public List<NotificationClass> notification = new List<NotificationClass>();
}
