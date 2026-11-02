using System;
using UnityEngine;

// Token: 0x020002ED RID: 749
public class NotificationHandler
{
	// Token: 0x060013C7 RID: 5063 RVA: 0x0008E9A8 File Offset: 0x0008CBA8
	public static void init()
	{
		if (NotificationHandler._initialized)
		{
			return;
		}
		NotificationHandler._initialized = true;
	}

	// Token: 0x17000236 RID: 566
	// (get) Token: 0x060013C8 RID: 5064 RVA: 0x0008E9BC File Offset: 0x0008CBBC
	// (set) Token: 0x060013C9 RID: 5065 RVA: 0x0008E9E4 File Offset: 0x0008CBE4
	private static string _notification_IDs
	{
		get
		{
			if (string.IsNullOrEmpty(NotificationHandler.__notification_IDs))
			{
				NotificationHandler.__notification_IDs = PlayerPrefs.GetString("notification_IDs");
			}
			return NotificationHandler.__notification_IDs;
		}
		set
		{
			NotificationHandler.__notification_IDs = value;
			PlayerPrefs.SetString("notification_IDs", value);
		}
	}

	// Token: 0x060013CA RID: 5066 RVA: 0x0008E9F8 File Offset: 0x0008CBF8
	private static void add_ID(int id)
	{
		if (string.IsNullOrEmpty(NotificationHandler._notification_IDs))
		{
			NotificationHandler._notification_IDs = id.ToString();
		}
		else
		{
			NotificationHandler._notification_IDs = NotificationHandler._notification_IDs + "," + id.ToString();
		}
	}

	// Token: 0x060013CB RID: 5067 RVA: 0x0008EA40 File Offset: 0x0008CC40
	public static void create_notification(double hours, string title, string body)
	{
		if (!NotificationHandler._initialized)
		{
			NotificationHandler.init();
		}
		int id = EtceteraAndroid.scheduleNotification((long)(hours * 60.0 * 60.0), title, body, body, string.Empty, -1);
		NotificationHandler.add_ID(id);
	}

	// Token: 0x060013CC RID: 5068 RVA: 0x0008EA88 File Offset: 0x0008CC88
	public static void create_notification_by_date(DateTime d, string title, string body)
	{
		if (!NotificationHandler._initialized)
		{
			NotificationHandler.init();
		}
		long num = (long)(d - DateTime.Today).Days;
		int id = EtceteraAndroid.scheduleNotification(num * 24L * 60L * 60L, title, body, body, string.Empty, -1);
		NotificationHandler.add_ID(id);
	}

	// Token: 0x060013CD RID: 5069 RVA: 0x0008EADC File Offset: 0x0008CCDC
	public static void clear()
	{
		int[] array = NotificationHandler._notification_IDs.ToIntArray(',');
		for (int i = 0; i < array.Length; i++)
		{
			EtceteraAndroid.cancelNotification(array[i]);
		}
		NotificationHandler._notification_IDs = string.Empty;
		globals.debug("notifications cleared.");
	}

	// Token: 0x0400158B RID: 5515
	private static bool _initialized;

	// Token: 0x0400158C RID: 5516
	private static string __notification_IDs;
}
