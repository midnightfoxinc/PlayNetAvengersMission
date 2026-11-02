using System;
using UnityEngine;

// Token: 0x020002EE RID: 750
public class NotificationManagerBehavior : MonoBehaviour
{
	// Token: 0x060013CF RID: 5071 RVA: 0x0008EB50 File Offset: 0x0008CD50
	private void set_mission_alert_notification(double hours, missionDataClass mission)
	{
		string body = Localization.Get("ALERT_NOTIFICATION").Replace("$LOCATION", mission.location.name).Replace("$MISSION", mission.name);
		NotificationHandler.create_notification(hours, string.Empty, body);
	}

	// Token: 0x060013D0 RID: 5072 RVA: 0x0008EB9C File Offset: 0x0008CD9C
	private void Start()
	{
		if (this.count < 1 || globals.notification_data.notification.Count < 1 || !globals.environment_manager.enableNotifications)
		{
			return;
		}
		NotificationHandler.clear();
		int days = (DateTime.Now - new DateTime(2015, 12, 1)).Days;
		int num;
		if (this.frequency > 0.0)
		{
			int @int = PlayerPrefs.GetInt("last_notification_day", 0);
			num = (int)((double)((days - @int) * 24) / this.frequency);
		}
		else
		{
			num = 0;
		}
		missionDataClass missionDataClass = globals.location_data.alert_mission();
		for (int i = 0; i < this.count; i++)
		{
			if (missionDataClass && this.mission_alert_every > 0 && i % this.mission_alert_every == 0)
			{
				this.set_mission_alert_notification(this.frequency * (double)(i + 1), missionDataClass);
			}
			else
			{
				NotificationClass notificationClass = globals.notification_data.notification[(i + num) % globals.notification_data.notification.Count];
				NotificationHandler.create_notification(this.frequency * (double)(i + 1), notificationClass.title, notificationClass.body);
			}
		}
		PlayerPrefs.SetInt("last_notification_day", days);
	}

	// Token: 0x0400158D RID: 5517
	public double frequency = 48.0;

	// Token: 0x0400158E RID: 5518
	public int count = 1;

	// Token: 0x0400158F RID: 5519
	public int mission_alert_every = 2;
}
