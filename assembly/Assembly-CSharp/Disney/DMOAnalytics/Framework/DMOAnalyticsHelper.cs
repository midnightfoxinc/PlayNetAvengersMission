using System;
using System.Collections.Generic;
using LitJson;
using UnityEngine;

namespace Disney.DMOAnalytics.Framework
{
	// Token: 0x02000033 RID: 51
	public class DMOAnalyticsHelper
	{
		// Token: 0x06000167 RID: 359 RVA: 0x0000AEF8 File Offset: 0x000090F8
		public static void Log(string msg)
		{
			if (DMOAnalyticsHelper.isDebugEnvLog)
			{
				Debug.Log(msg);
			}
		}

		// Token: 0x06000168 RID: 360 RVA: 0x0000AF0C File Offset: 0x0000910C
		public static string GetStringFromDictionary(Dictionary<string, object> dictData)
		{
			string result = string.Empty;
			if (dictData != null)
			{
				result = JsonMapper.ToJson(dictData);
			}
			return result;
		}

		// Token: 0x040001A5 RID: 421
		public static bool isDebugEnvLog;

		// Token: 0x040001A6 RID: 422
		public static bool ICanUseNetwork = true;

		// Token: 0x040001A7 RID: 423
		public static bool RestrictedTracking;
	}
}
