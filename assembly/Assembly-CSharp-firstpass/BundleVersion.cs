using System;
using UnityEngine;

// Token: 0x02000002 RID: 2
public class BundleVersion
{
	// Token: 0x06000002 RID: 2 RVA: 0x000020F4 File Offset: 0x000002F4
	public static string get(bool major = true)
	{
		if (Application.isEditor)
		{
			return "editor";
		}
		string result = string.Empty;
		using (AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
		{
			AndroidJavaObject @static = androidJavaClass.GetStatic<AndroidJavaObject>("currentActivity");
			string text = @static.Call<string>("getPackageName", new object[0]);
			AndroidJavaObject androidJavaObject = @static.Call<AndroidJavaObject>("getPackageManager", new object[0]).Call<AndroidJavaObject>("getPackageInfo", new object[]
			{
				text,
				0
			});
			if (major)
			{
				result = androidJavaObject.Get<string>("versionName");
			}
			else
			{
				result = androidJavaObject.Get<int>("versionCode").ToString();
			}
		}
		return result;
	}
}
