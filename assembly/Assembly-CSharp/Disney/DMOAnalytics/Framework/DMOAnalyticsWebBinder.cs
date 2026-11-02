using System;
using System.Collections.Generic;
using UnityEngine;

namespace Disney.DMOAnalytics.Framework
{
	// Token: 0x02000035 RID: 53
	public class DMOAnalyticsWebBinder : IDMOAnalyticsBinder
	{
		// Token: 0x0600017F RID: 383 RVA: 0x0000B4E0 File Offset: 0x000096E0
		public DMOAnalyticsWebBinder(IDMONetworkRequest networking)
		{
			if (networking == null)
			{
				throw new ArgumentNullException("networking");
			}
			this.mNetworking = networking;
		}

		// Token: 0x06000180 RID: 384 RVA: 0x0000B500 File Offset: 0x00009700
		public void Init(MonoBehaviour gameObj, string appID, string appKey)
		{
			this.mNetworking.GameObj = gameObj;
		}

		// Token: 0x06000181 RID: 385 RVA: 0x0000B510 File Offset: 0x00009710
		public void LogEvent(string eventName)
		{
			Dictionary<string, object> coreEventInfo = DMOAnalyticsSysInfo.GetCoreEventInfo();
			coreEventInfo.Add("method", eventName);
			this.mNetworking.StartCoroutine(coreEventInfo);
		}

		// Token: 0x06000182 RID: 386 RVA: 0x0000B53C File Offset: 0x0000973C
		public void LogAppStart()
		{
			Dictionary<string, object> sysInfo = DMOAnalyticsSysInfo.GetSysInfo();
			sysInfo.Add("method", "app_start");
			sysInfo.Add("is_new_user", DMOAnalyticsSysInfo.getIsNewUser());
			sysInfo.Add("tag", "clicked_link");
			this.mNetworking.StartCoroutine(sysInfo);
		}

		// Token: 0x06000183 RID: 387 RVA: 0x0000B58C File Offset: 0x0000978C
		public void LogAppForeground()
		{
			this.LogAppEvent(DMOAnalyticsSysInfo.appForeground);
		}

		// Token: 0x06000184 RID: 388 RVA: 0x0000B59C File Offset: 0x0000979C
		public void LogAppBackground()
		{
			this.LogAppEvent(DMOAnalyticsSysInfo.appBackground);
		}

		// Token: 0x06000185 RID: 389 RVA: 0x0000B5AC File Offset: 0x000097AC
		public void LogAppEnd()
		{
			this.LogAppEvent(DMOAnalyticsSysInfo.appEnd);
		}

		// Token: 0x06000186 RID: 390 RVA: 0x0000B5BC File Offset: 0x000097BC
		private void LogAppEvent(string eventName)
		{
			Dictionary<string, object> coreEventInfo = DMOAnalyticsSysInfo.GetCoreEventInfo();
			coreEventInfo.Add("method", eventName);
			if (eventName.Equals(DMOAnalyticsSysInfo.appForeground))
			{
				coreEventInfo.Add("is_new_user", DMOAnalyticsSysInfo.getIsNewUser());
				coreEventInfo.Add("tag", "clicked_link");
			}
			this.mNetworking.StartCoroutine(coreEventInfo);
		}

		// Token: 0x06000187 RID: 391 RVA: 0x0000B618 File Offset: 0x00009818
		public void LogEventWithContext(string eventName, Dictionary<string, object> data)
		{
			string stringFromDictionary = DMOAnalyticsHelper.GetStringFromDictionary(data);
			Dictionary<string, object> coreEventInfo = DMOAnalyticsSysInfo.GetCoreEventInfo();
			coreEventInfo.Add("method", eventName);
			coreEventInfo.Add("data", stringFromDictionary);
			this.mNetworking.StartCoroutine(coreEventInfo);
		}

		// Token: 0x06000188 RID: 392 RVA: 0x0000B658 File Offset: 0x00009858
		public void FlushAnalyticsQueue()
		{
			if (!DMOAnalyticsHelper.ICanUseNetwork)
			{
				return;
			}
			this.mNetworking.FlushQueue();
		}

		// Token: 0x06000189 RID: 393 RVA: 0x0000B670 File Offset: 0x00009870
		public void LogGameAction(Dictionary<string, object> gameData)
		{
			string stringFromDictionary = DMOAnalyticsHelper.GetStringFromDictionary(gameData);
			Dictionary<string, object> coreEventInfo = DMOAnalyticsSysInfo.GetCoreEventInfo();
			coreEventInfo.Add("data", stringFromDictionary);
			coreEventInfo.Add("method", DMOAnalyticsSysInfo.gameAction);
			coreEventInfo.Add("tag", DMOAnalyticsSysInfo.gameAction);
			this.mNetworking.StartCoroutine(coreEventInfo);
		}

		// Token: 0x0600018A RID: 394 RVA: 0x0000B6C4 File Offset: 0x000098C4
		public void LogMoneyAction(Dictionary<string, object> moneyData)
		{
			string stringFromDictionary = DMOAnalyticsHelper.GetStringFromDictionary(moneyData);
			Dictionary<string, object> coreEventInfo = DMOAnalyticsSysInfo.GetCoreEventInfo();
			coreEventInfo.Add("data", stringFromDictionary);
			coreEventInfo.Add("method", DMOAnalyticsSysInfo.moneyAction);
			coreEventInfo.Add("tag", DMOAnalyticsSysInfo.moneyAction);
			coreEventInfo.Add("source", "CCBILL");
			coreEventInfo.Add("subtype", "CCBILL");
			this.mNetworking.StartCoroutine(coreEventInfo);
		}

		// Token: 0x0600018B RID: 395 RVA: 0x0000B738 File Offset: 0x00009938
		public void SetDebugLogging(bool debugLogging)
		{
		}

		// Token: 0x0600018C RID: 396 RVA: 0x0000B73C File Offset: 0x0000993C
		public void SetCanUseNetwork(bool canUseNetwork)
		{
		}

		// Token: 0x040001BC RID: 444
		private IDMONetworkRequest mNetworking;
	}
}
