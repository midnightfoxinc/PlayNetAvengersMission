using System;
using UnityEngine;

// Token: 0x020001C1 RID: 449
public class VersionCheckerBehavior : MonoBehaviour
{
	// Token: 0x06000D17 RID: 3351 RVA: 0x0005E8B4 File Offset: 0x0005CAB4
	private void Start()
	{
		if (!Application.isEditor && globals.build_type == build_type_enum.release && globals.environment_manager.force_version)
		{
			this.fetchAppVersion();
		}
	}

	// Token: 0x06000D18 RID: 3352 RVA: 0x0005E8EC File Offset: 0x0005CAEC
	private void fetchAppVersion()
	{
		globals.network_manager.FetchCurrentAppVersion(new WebHandler.HttpResultDelegate(this.fetchAppVersionSuccess), new WebHandler.HttpErrorDelegate(this.fetchAppVersionError));
	}

	// Token: 0x06000D19 RID: 3353 RVA: 0x0005E91C File Offset: 0x0005CB1C
	private void fetchAppVersionSuccess(JSONObject j)
	{
		string text = string.Empty;
		string text2 = string.Empty;
		text = "PlaymationAppVersionAndroid";
		text2 = "androidWhitelist";
		bool flag = false;
		if (j.HasField(text))
		{
			globals.latestAppVersion = j[text].str;
			if (globals.latestAppVersion == BundleVersion.get(true))
			{
				flag = true;
			}
		}
		if (!flag && j.HasField(text2) && j[text2].IsArray)
		{
			for (int i = 0; i < j[text2].Count; i++)
			{
				if (j[text2][i].str == BundleVersion.get(true))
				{
					globals.debug("version found in whitelist: " + BundleVersion.get(true));
					flag = true;
				}
			}
		}
		if (!flag)
		{
			NavigationManager.load_scene(this.out_of_date_scene);
		}
	}

	// Token: 0x06000D1A RID: 3354 RVA: 0x0005EA04 File Offset: 0x0005CC04
	private void fetchAppVersionError(string url, string err)
	{
		globals.debug("fetchAppVersionError: " + err);
	}

	// Token: 0x04000D26 RID: 3366
	public string out_of_date_scene = "out of date";
}
