using System;
using Disney.DMOAnalytics;
using UnityEngine;

// Token: 0x02000181 RID: 385
public class DMOAnalyticsInitializer : MonoBehaviour
{
	// Token: 0x06000BEA RID: 3050 RVA: 0x00057390 File Offset: 0x00055590
	private void Awake()
	{
		Object.DontDestroyOnLoad(this);
		DMOManager.use_dmo_analytics = true;
		DMOAnalyticsInitializer.platform platform = (Application.platform != 11) ? this.iOS : this.Android;
		if (Application.isEditor)
		{
			DMOAnalytics.SharedAnalytics.initWithAnalyticsKeySecretAppInfo(this, platform.key, platform.secret, this.test_bundle_ID, "editor");
		}
		else
		{
			DMOAnalytics.SharedAnalytics.initWithAnalyticsKeySecretAppInfo(this, platform.key, platform.secret, Application.bundleIdentifier, BundleVersion.get(true));
		}
		DMOAnalytics.SharedAnalytics.DebugLogging = false;
		DMOAnalytics.SharedAnalytics.LogAppStart();
	}

	// Token: 0x06000BEB RID: 3051 RVA: 0x00057430 File Offset: 0x00055630
	private void OnApplicationPause(bool paused)
	{
		if (paused)
		{
			DMOAnalytics.SharedAnalytics.LogAppBackground();
		}
		else
		{
			DMOAnalytics.SharedAnalytics.LogAppForeground();
		}
	}

	// Token: 0x06000BEC RID: 3052 RVA: 0x00057454 File Offset: 0x00055654
	private void OnApplicationQuit()
	{
		DMOAnalytics.SharedAnalytics.LogAppEnd();
	}

	// Token: 0x04000BC0 RID: 3008
	public DMOAnalyticsInitializer.platform iOS;

	// Token: 0x04000BC1 RID: 3009
	public DMOAnalyticsInitializer.platform Android;

	// Token: 0x04000BC2 RID: 3010
	public string test_bundle_ID;

	// Token: 0x02000182 RID: 386
	[Serializable]
	public class platform
	{
		// Token: 0x04000BC3 RID: 3011
		public string key;

		// Token: 0x04000BC4 RID: 3012
		public string secret;
	}
}
