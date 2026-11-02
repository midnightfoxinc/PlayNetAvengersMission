using System;
using System.Collections.Generic;
using UnityEngine;

namespace Disney.DMOAnalytics.Framework
{
	// Token: 0x02000038 RID: 56
	public interface IDMOAnalyticsBinder
	{
		// Token: 0x0600019E RID: 414
		void Init(MonoBehaviour gameObj, string appKey, string appSecret);

		// Token: 0x0600019F RID: 415
		void LogEvent(string appEvent);

		// Token: 0x060001A0 RID: 416
		void LogAppStart();

		// Token: 0x060001A1 RID: 417
		void LogAppForeground();

		// Token: 0x060001A2 RID: 418
		void LogAppBackground();

		// Token: 0x060001A3 RID: 419
		void LogAppEnd();

		// Token: 0x060001A4 RID: 420
		void LogGameAction(Dictionary<string, object> gameData);

		// Token: 0x060001A5 RID: 421
		void LogMoneyAction(Dictionary<string, object> moneyData);

		// Token: 0x060001A6 RID: 422
		void LogEventWithContext(string eventName, Dictionary<string, object> data);

		// Token: 0x060001A7 RID: 423
		void FlushAnalyticsQueue();

		// Token: 0x060001A8 RID: 424
		void SetDebugLogging(bool isEnable);

		// Token: 0x060001A9 RID: 425
		void SetCanUseNetwork(bool isEnable);
	}
}
