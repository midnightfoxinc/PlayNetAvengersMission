using System;
using System.Collections.Generic;
using UnityEngine;

namespace Disney.DMOAnalytics.Framework
{
	// Token: 0x02000036 RID: 54
	public interface IDMONetworkRequest
	{
		// Token: 0x1700001B RID: 27
		// (set) Token: 0x0600018D RID: 397
		MonoBehaviour GameObj { set; }

		// Token: 0x0600018E RID: 398
		void StartCoroutine(Dictionary<string, object> GameData);

		// Token: 0x0600018F RID: 399
		void FlushQueue();
	}
}
