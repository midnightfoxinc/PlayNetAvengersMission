using System;
using System.Collections.Generic;
using Disney.DMOAnalytics.Framework;
using UnityEngine;

namespace Disney.DMOAnalytics
{
	// Token: 0x02000030 RID: 48
	public class DMOAnalytics
	{
		// Token: 0x0600013C RID: 316 RVA: 0x0000A920 File Offset: 0x00008B20
		private DMOAnalytics()
		{
			this.mPlatformBinder = new DMOBinderAndroid();
		}

		// Token: 0x17000016 RID: 22
		// (get) Token: 0x0600013D RID: 317 RVA: 0x0000A934 File Offset: 0x00008B34
		// (set) Token: 0x0600013E RID: 318 RVA: 0x0000A93C File Offset: 0x00008B3C
		public string AnalyticsKey { get; private set; }

		// Token: 0x17000017 RID: 23
		// (get) Token: 0x0600013F RID: 319 RVA: 0x0000A948 File Offset: 0x00008B48
		// (set) Token: 0x06000140 RID: 320 RVA: 0x0000A950 File Offset: 0x00008B50
		public string AnalyticsSecret { get; private set; }

		// Token: 0x17000018 RID: 24
		// (get) Token: 0x06000141 RID: 321 RVA: 0x0000A95C File Offset: 0x00008B5C
		// (set) Token: 0x06000142 RID: 322 RVA: 0x0000A964 File Offset: 0x00008B64
		public bool DebugLogging
		{
			get
			{
				return DMOAnalyticsHelper.isDebugEnvLog;
			}
			set
			{
				DMOAnalyticsHelper.isDebugEnvLog = value;
				this.mPlatformBinder.SetDebugLogging(value);
			}
		}

		// Token: 0x17000019 RID: 25
		// (get) Token: 0x06000143 RID: 323 RVA: 0x0000A978 File Offset: 0x00008B78
		// (set) Token: 0x06000144 RID: 324 RVA: 0x0000A980 File Offset: 0x00008B80
		public bool CanUseNetwork
		{
			get
			{
				return DMOAnalyticsHelper.ICanUseNetwork;
			}
			set
			{
				DMOAnalyticsHelper.ICanUseNetwork = value;
				this.mPlatformBinder.SetCanUseNetwork(value);
			}
		}

		// Token: 0x1700001A RID: 26
		// (get) Token: 0x06000145 RID: 325 RVA: 0x0000A994 File Offset: 0x00008B94
		public static DMOAnalytics SharedAnalytics
		{
			get
			{
				if (DMOAnalytics.mInstance == null)
				{
					DMOAnalytics.mInstance = new DMOAnalytics();
				}
				return DMOAnalytics.mInstance;
			}
		}

		// Token: 0x06000146 RID: 326 RVA: 0x0000A9B0 File Offset: 0x00008BB0
		public static string GetLibVersion()
		{
			return DMOAnalyticsSysInfo.mVersion;
		}

		// Token: 0x06000147 RID: 327 RVA: 0x0000A9B8 File Offset: 0x00008BB8
		public void initWithAnalyticsKeySerect(MonoBehaviour GameObj, string AppKey, string AppSecret)
		{
			this.initWithAnalyticsKeySecretAppInfo(GameObj, AppKey, AppSecret, "com.unity.player", "1.0");
		}

		// Token: 0x06000148 RID: 328 RVA: 0x0000A9D0 File Offset: 0x00008BD0
		public void initWithAnalyticsKeySecretAppInfo(MonoBehaviour gameObj, string appKey, string appSecret, string bundleIdentifier, string appVersion)
		{
			if (gameObj == null || string.IsNullOrEmpty(appKey) || string.IsNullOrEmpty(appSecret) || string.IsNullOrEmpty(bundleIdentifier) || string.IsNullOrEmpty(appVersion))
			{
				throw new ArgumentException("Please make sure you have the correct Analytics Key,  Analytics Secret, BundleIdentifier and AppVersion for DMOAnalytics");
			}
			this.AnalyticsKey = appKey;
			this.AnalyticsSecret = appSecret;
			DMOAnalyticsSysInfo.setAppVersion(appVersion);
			DMOAnalyticsSysInfo.setBundelIdentifer(bundleIdentifier);
			this.mPlatformBinder.Init(gameObj, this.AnalyticsKey, this.AnalyticsSecret);
		}

		// Token: 0x06000149 RID: 329 RVA: 0x0000AA58 File Offset: 0x00008C58
		public void LogEvent(string eventInfo)
		{
			if (eventInfo == null)
			{
				return;
			}
			DMOAnalyticsHelper.Log("Log Event: " + eventInfo);
			this.mPlatformBinder.LogEvent(eventInfo);
		}

		// Token: 0x0600014A RID: 330 RVA: 0x0000AA80 File Offset: 0x00008C80
		public void LogAppStart()
		{
			DMOAnalyticsHelper.Log("Log app_start ");
			this.mPlatformBinder.LogAppStart();
		}

		// Token: 0x0600014B RID: 331 RVA: 0x0000AA98 File Offset: 0x00008C98
		public void LogAppForeground()
		{
			DMOAnalyticsHelper.Log("Log app_foreground ");
			this.mPlatformBinder.LogAppForeground();
		}

		// Token: 0x0600014C RID: 332 RVA: 0x0000AAB0 File Offset: 0x00008CB0
		public void LogAppBackground()
		{
			DMOAnalyticsHelper.Log("Log app_background ");
			this.mPlatformBinder.LogAppBackground();
		}

		// Token: 0x0600014D RID: 333 RVA: 0x0000AAC8 File Offset: 0x00008CC8
		public void LogAppEnd()
		{
			DMOAnalyticsHelper.Log("Log app_end");
			this.mPlatformBinder.LogAppEnd();
		}

		// Token: 0x0600014E RID: 334 RVA: 0x0000AAE0 File Offset: 0x00008CE0
		public void LogGameAction(Dictionary<string, object> gameData)
		{
			if (gameData == null)
			{
				return;
			}
			DMOAnalyticsHelper.Log("Log game_action");
			this.mPlatformBinder.LogGameAction(gameData);
		}

		// Token: 0x0600014F RID: 335 RVA: 0x0000AB00 File Offset: 0x00008D00
		public void LogMoneyAction(Dictionary<string, object> moneyData)
		{
			if (moneyData == null)
			{
				return;
			}
			DMOAnalyticsHelper.Log("Log money action");
			this.mPlatformBinder.LogMoneyAction(moneyData);
		}

		// Token: 0x06000150 RID: 336 RVA: 0x0000AB20 File Offset: 0x00008D20
		public void LogAnalyticsEventWithContext(string eventName, Dictionary<string, object> dataDetails)
		{
			if (eventName == null || dataDetails == null)
			{
				return;
			}
			DMOAnalyticsHelper.Log("Log arbitrary action with Context: " + eventName);
			this.mPlatformBinder.LogEventWithContext(eventName, dataDetails);
		}

		// Token: 0x06000151 RID: 337 RVA: 0x0000AB58 File Offset: 0x00008D58
		public void FlushAnalyticsQueue()
		{
			this.mPlatformBinder.FlushAnalyticsQueue();
		}

		// Token: 0x0400019B RID: 411
		private static DMOAnalytics mInstance;

		// Token: 0x0400019C RID: 412
		private IDMOAnalyticsBinder mPlatformBinder;
	}
}
