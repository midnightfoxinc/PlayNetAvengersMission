using System;
using Disney.DMOAnalytics;
using UnityEngine;

// Token: 0x02000032 RID: 50
public class DMOAnalyticsAutoLog : MonoBehaviour
{
	// Token: 0x06000160 RID: 352 RVA: 0x0000AE88 File Offset: 0x00009088
	private void Start()
	{
		DMOAnalytics.SharedAnalytics.LogAppStart();
	}

	// Token: 0x06000161 RID: 353 RVA: 0x0000AE94 File Offset: 0x00009094
	private void Update()
	{
	}

	// Token: 0x06000162 RID: 354 RVA: 0x0000AE98 File Offset: 0x00009098
	private void Awake()
	{
		Object.DontDestroyOnLoad(this);
		DMOAnalytics.SharedAnalytics.initWithAnalyticsKeySerect(this, "470DA3CE-1AAC-4483-977A-4C24C2180A4A", "6D73013B-8A6C-4AE2-830D-5356625A8A24");
	}

	// Token: 0x06000163 RID: 355 RVA: 0x0000AEB8 File Offset: 0x000090B8
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

	// Token: 0x06000164 RID: 356 RVA: 0x0000AEDC File Offset: 0x000090DC
	private void OnApplicationQuit()
	{
		DMOAnalytics.SharedAnalytics.LogAppEnd();
	}

	// Token: 0x040001A1 RID: 417
	public string DMOAnalyticsKey;

	// Token: 0x040001A2 RID: 418
	public string DMOAnalyticsSecret;

	// Token: 0x040001A3 RID: 419
	public string ApplicationBundleIdentifer;

	// Token: 0x040001A4 RID: 420
	public string ApplicationVersion;
}
