using System;
using System.Collections.Generic;
using UnityEngine;

namespace Disney.DMOAnalytics.Framework
{
	// Token: 0x02000031 RID: 49
	public class DMOBinderAndroid : IDMOAnalyticsBinder
	{
		// Token: 0x06000152 RID: 338 RVA: 0x0000AB68 File Offset: 0x00008D68
		public DMOBinderAndroid()
		{
			if (Application.platform == 11 && (DMOBinderAndroid.playerActivityContext == null || DMOBinderAndroid._plugin == null))
			{
				using (AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
				{
					DMOBinderAndroid.playerActivityContext = androidJavaClass.GetStatic<AndroidJavaObject>("currentActivity");
				}
				using (AndroidJavaClass androidJavaClass2 = new AndroidJavaClass("com.dismo.AnalyticsPlugin"))
				{
					if (androidJavaClass2 != null)
					{
						DMOBinderAndroid._plugin = androidJavaClass2.CallStatic<AndroidJavaObject>("instance", new object[0]);
						if (DMOBinderAndroid._plugin != null)
						{
							DMOBinderAndroid._plugin.Call("setContext", new object[]
							{
								DMOBinderAndroid.playerActivityContext
							});
						}
					}
				}
			}
		}

		// Token: 0x06000153 RID: 339 RVA: 0x0000AC5C File Offset: 0x00008E5C
		public void Init(MonoBehaviour gameObj, string appKey, string appSecret)
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("init", new object[]
				{
					appKey,
					appSecret
				});
			}
		}

		// Token: 0x06000154 RID: 340 RVA: 0x0000AC88 File Offset: 0x00008E88
		public void LogEvent(string appEvent)
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("dmoAnalyticsLogEvent", new object[]
				{
					appEvent
				});
			}
		}

		// Token: 0x06000155 RID: 341 RVA: 0x0000ACB0 File Offset: 0x00008EB0
		public void LogAppStart()
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("dmoAnalyticsLogAppStart", new object[0]);
			}
		}

		// Token: 0x06000156 RID: 342 RVA: 0x0000ACD4 File Offset: 0x00008ED4
		public void LogAppForeground()
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("dmoAnalyticsLogAppForeground", new object[0]);
			}
		}

		// Token: 0x06000157 RID: 343 RVA: 0x0000ACF8 File Offset: 0x00008EF8
		public void LogAppBackground()
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("dmoAnalyticsLogAppBackground", new object[0]);
			}
		}

		// Token: 0x06000158 RID: 344 RVA: 0x0000AD1C File Offset: 0x00008F1C
		public void LogAppEnd()
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("dmoAnalyticsLogAppEnd", new object[0]);
			}
		}

		// Token: 0x06000159 RID: 345 RVA: 0x0000AD40 File Offset: 0x00008F40
		public void LogEventWithContext(string eventName, Dictionary<string, object> data)
		{
			if (DMOBinderAndroid._plugin != null)
			{
				string stringFromDictionary = DMOAnalyticsHelper.GetStringFromDictionary(data);
				DMOBinderAndroid._plugin.Call("dmoAnalyticsLogEventWithContext", new object[]
				{
					eventName,
					stringFromDictionary
				});
			}
		}

		// Token: 0x0600015A RID: 346 RVA: 0x0000AD7C File Offset: 0x00008F7C
		public void FlushAnalyticsQueue()
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("dmoAnalyticsflushAnalyticsQueue", new object[0]);
			}
		}

		// Token: 0x0600015B RID: 347 RVA: 0x0000ADA0 File Offset: 0x00008FA0
		public void LogGameAction(Dictionary<string, object> gameData)
		{
			if (DMOBinderAndroid._plugin != null)
			{
				string stringFromDictionary = DMOAnalyticsHelper.GetStringFromDictionary(gameData);
				DMOBinderAndroid._plugin.Call("dmoAnalyticsLogGameAction", new object[]
				{
					stringFromDictionary
				});
			}
		}

		// Token: 0x0600015C RID: 348 RVA: 0x0000ADD8 File Offset: 0x00008FD8
		public void LogMoneyAction(Dictionary<string, object> moneyData)
		{
			if (DMOBinderAndroid._plugin != null)
			{
				string stringFromDictionary = DMOAnalyticsHelper.GetStringFromDictionary(moneyData);
				DMOBinderAndroid._plugin.Call("dmoAnalyticsLogMoneyAction", new object[]
				{
					stringFromDictionary
				});
			}
		}

		// Token: 0x0600015D RID: 349 RVA: 0x0000AE10 File Offset: 0x00009010
		public void SetDebugLogging(bool isEnable)
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("dmoAnalyticsSetDebugLogging", new object[]
				{
					isEnable
				});
			}
		}

		// Token: 0x0600015E RID: 350 RVA: 0x0000AE48 File Offset: 0x00009048
		public void SetCanUseNetwork(bool isEnable)
		{
			if (DMOBinderAndroid._plugin != null)
			{
				DMOBinderAndroid._plugin.Call("dmoAnalyticsSetCanUseNetwork", new object[]
				{
					isEnable
				});
			}
		}

		// Token: 0x0400019F RID: 415
		private static AndroidJavaObject _plugin;

		// Token: 0x040001A0 RID: 416
		private static AndroidJavaObject playerActivityContext;
	}
}
