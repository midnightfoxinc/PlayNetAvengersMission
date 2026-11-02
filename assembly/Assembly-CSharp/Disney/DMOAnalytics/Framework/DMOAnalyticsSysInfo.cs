using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;

namespace Disney.DMOAnalytics.Framework
{
	// Token: 0x02000034 RID: 52
	public class DMOAnalyticsSysInfo
	{
		// Token: 0x0600016B RID: 363 RVA: 0x0000AFF4 File Offset: 0x000091F4
		public static string getAppVersion()
		{
			return DMOAnalyticsSysInfo.mAppVersion;
		}

		// Token: 0x0600016C RID: 364 RVA: 0x0000AFFC File Offset: 0x000091FC
		public static void setAppVersion(string appVersion)
		{
			DMOAnalyticsSysInfo.mAppVersion = appVersion;
		}

		// Token: 0x0600016D RID: 365 RVA: 0x0000B004 File Offset: 0x00009204
		public static string getAnalyticsURL()
		{
			if (DMOAnalyticsSysInfo.isIntServerEnvironment)
			{
				return DMOAnalyticsSysInfo.mIntBIServer;
			}
			return DMOAnalyticsSysInfo.mBIServer;
		}

		// Token: 0x0600016E RID: 366 RVA: 0x0000B01C File Offset: 0x0000921C
		public static string getCellophaneKey()
		{
			if (DMOAnalyticsSysInfo.isIntServerEnvironment)
			{
				return DMOAnalyticsSysInfo.CellophaneIntBIKey;
			}
			return DMOAnalyticsSysInfo.CellophaneBIKey;
		}

		// Token: 0x0600016F RID: 367 RVA: 0x0000B034 File Offset: 0x00009234
		public static string getCellophaneSecret()
		{
			if (DMOAnalyticsSysInfo.isIntServerEnvironment)
			{
				return DMOAnalyticsSysInfo.CellophaneIntBISecret;
			}
			return DMOAnalyticsSysInfo.CellophaneBISecret;
		}

		// Token: 0x06000170 RID: 368 RVA: 0x0000B04C File Offset: 0x0000924C
		public static string getAnalyticsKey()
		{
			return DMOAnalytics.SharedAnalytics.AnalyticsKey;
		}

		// Token: 0x06000171 RID: 369 RVA: 0x0000B058 File Offset: 0x00009258
		public static string getAnalyticsSecret()
		{
			return DMOAnalytics.SharedAnalytics.AnalyticsSecret;
		}

		// Token: 0x06000172 RID: 370 RVA: 0x0000B064 File Offset: 0x00009264
		public static void setBundelIdentifer(string bundleID)
		{
			DMOAnalyticsSysInfo.mBundleIdentifier = bundleID;
		}

		// Token: 0x06000173 RID: 371 RVA: 0x0000B06C File Offset: 0x0000926C
		public static string getBundleId()
		{
			return DMOAnalyticsSysInfo.mBundleIdentifier;
		}

		// Token: 0x06000174 RID: 372 RVA: 0x0000B074 File Offset: 0x00009274
		public static string getModel()
		{
			return SystemInfo.deviceModel;
		}

		// Token: 0x06000175 RID: 373 RVA: 0x0000B07C File Offset: 0x0000927C
		public static string getSystemVersion()
		{
			return SystemInfo.operatingSystem;
		}

		// Token: 0x06000176 RID: 374 RVA: 0x0000B084 File Offset: 0x00009284
		public static string getIsNewUser()
		{
			string result = "0";
			string @string = PlayerPrefs.GetString("DMOIsNewUser");
			if (string.IsNullOrEmpty(@string))
			{
				result = "1";
				PlayerPrefs.SetString("DMOIsNewUser", "0");
			}
			return result;
		}

		// Token: 0x06000177 RID: 375 RVA: 0x0000B0C4 File Offset: 0x000092C4
		private static string encryptString(string rawData)
		{
			if (rawData == null)
			{
				return null;
			}
			string result = string.Empty;
			byte[] bytes = Encoding.UTF8.GetBytes(rawData);
			int num = bytes.Length;
			if (num % DMOAnalyticsSysInfo.kCCBlockSizeAES128 > 0)
			{
				num = (num + DMOAnalyticsSysInfo.kCCBlockSizeAES128) / DMOAnalyticsSysInfo.kCCBlockSizeAES128 * DMOAnalyticsSysInfo.kCCBlockSizeAES128;
			}
			byte[] array = new byte[num];
			Array.Copy(bytes, array, bytes.Length);
			int num2 = 20;
			byte[] array2 = new byte[]
			{
				45,
				55,
				162,
				205,
				40,
				214,
				99,
				105,
				236,
				91,
				177,
				233,
				174,
				28,
				10,
				94,
				12,
				192,
				243,
				93
			};
			byte[] array3 = new byte[DMOAnalyticsSysInfo.kCCKeySizeAES128];
			int num3 = 0;
			for (int i = 0; i < num2; i++)
			{
				if (i != 1 && i != 4 && i != 11 && i != 19)
				{
					array3[num3++] = array2[i];
				}
			}
			ICryptoTransform cryptoTransform = new RijndaelManaged
			{
				Mode = 2,
				Padding = 1,
				Key = array3
			}.CreateEncryptor();
			byte[] array4 = cryptoTransform.TransformFinalBlock(array, 0, array.Length);
			if (array4 != null && array4.Length > 0)
			{
				StringBuilder stringBuilder = new StringBuilder();
				for (int j = 0; j < array4.Length; j++)
				{
					stringBuilder.AppendFormat("{0:x2}", (int)(array4[j] & byte.MaxValue));
				}
				result = stringBuilder.ToString();
			}
			return result;
		}

		// Token: 0x06000178 RID: 376 RVA: 0x0000B220 File Offset: 0x00009420
		public static string getSessionId()
		{
			if (DMOAnalyticsSysInfo.mSessionHash == null || DMOAnalyticsSysInfo.mSessionHash.Length == 0)
			{
				DMOAnalyticsSysInfo.mSessionHash = Guid.NewGuid().ToString().ToUpper();
			}
			return DMOAnalyticsSysInfo.mSessionHash;
		}

		// Token: 0x06000179 RID: 377 RVA: 0x0000B264 File Offset: 0x00009464
		public static string getUTCTime()
		{
			return DateTime.UtcNow.ToString();
		}

		// Token: 0x0600017A RID: 378 RVA: 0x0000B280 File Offset: 0x00009480
		public static string getOnlineFlag()
		{
			if (Application.internetReachability == 1)
			{
				return "1";
			}
			if (Application.internetReachability == 2)
			{
				return "2";
			}
			return "0";
		}

		// Token: 0x0600017B RID: 379 RVA: 0x0000B2AC File Offset: 0x000094AC
		public static string getTimeStamp()
		{
			DateTime utcNow = DateTime.UtcNow;
			DateTime dateTime = Convert.ToDateTime("1/1/1970 0:00:00 AM");
			TimeSpan timeSpan = utcNow.Subtract(dateTime);
			return ((long)(((timeSpan.Days * 24 + timeSpan.Hours) * 60 + timeSpan.Minutes) * 60 + timeSpan.Seconds)).ToString();
		}

		// Token: 0x0600017C RID: 380 RVA: 0x0000B304 File Offset: 0x00009504
		public static Dictionary<string, object> GetSysInfo()
		{
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary.Add("DMOLibVersion", DMOAnalyticsSysInfo.mVersion);
			dictionary.Add("api_key", DMOAnalyticsSysInfo.getAnalyticsKey());
			dictionary.Add("app_version", DMOAnalyticsSysInfo.getAppVersion());
			dictionary.Add("bundle_id", DMOAnalyticsSysInfo.getBundleId());
			dictionary.Add("model", DMOAnalyticsSysInfo.getModel());
			dictionary.Add("onlineflag", DMOAnalyticsSysInfo.getOnlineFlag());
			dictionary.Add("os_version", DMOAnalyticsSysInfo.getSystemVersion());
			dictionary.Add("session_hash", DMOAnalyticsSysInfo.getSessionId());
			dictionary.Add("timestamp", DMOAnalyticsSysInfo.getTimeStamp());
			return dictionary;
		}

		// Token: 0x0600017D RID: 381 RVA: 0x0000B3A8 File Offset: 0x000095A8
		public static Dictionary<string, object> GetCoreEventInfo()
		{
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary.Add("api_key", DMOAnalyticsSysInfo.getAnalyticsKey());
			dictionary.Add("bundle_id", DMOAnalyticsSysInfo.getBundleId());
			dictionary.Add("onlineflag", DMOAnalyticsSysInfo.getOnlineFlag());
			dictionary.Add("os_version", DMOAnalyticsSysInfo.getSystemVersion());
			dictionary.Add("session_hash", DMOAnalyticsSysInfo.getSessionId());
			dictionary.Add("timestamp", DMOAnalyticsSysInfo.getTimeStamp());
			return dictionary;
		}

		// Token: 0x0600017E RID: 382 RVA: 0x0000B41C File Offset: 0x0000961C
		public static Dictionary<string, object> GetTestDataDict()
		{
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary.Add("UTCTime", "2013-08-21+15:47:26+-25200+(PDT)");
			dictionary.Add("api_key", "2FD4ECB8-64B1-4610-BD3F-FF934AFA0FE1");
			dictionary.Add("bundle_id", "com.disney.abtest");
			dictionary.Add("ios_advertising_id", "2104d1f15a83ed00a95c123bea12d0c2b07a711e2b73c2f71ed50d8736583c0bbb7fb168f034b8456272afb06acb7e53");
			dictionary.Add("ios_vendor_id", "77945b5e1e28f990244a5c0837a9d339ebf22f785e369a0e7b648e10326b2d38123b79642c997e270f6b9126b8f58855");
			dictionary.Add("is_new_user", "0");
			dictionary.Add("method", "app_foreground");
			dictionary.Add("onlineflag", "2");
			dictionary.Add("session_hash", "791890AE-C8E8-4F15-95FC-314A929B8EDD");
			dictionary.Add("tag", "clicked_link");
			dictionary.Add("timestamp", "1377125247");
			return dictionary;
		}

		// Token: 0x040001A8 RID: 424
		private static string mIntBIServer = "http://blog.analytics.tapulous.com:8088";

		// Token: 0x040001A9 RID: 425
		private static string mBIServer = "https://api.disney.com/dismo/bi/v1";

		// Token: 0x040001AA RID: 426
		public static readonly string mVersion = "3.1.10";

		// Token: 0x040001AB RID: 427
		public static readonly string appStart = "app_start";

		// Token: 0x040001AC RID: 428
		public static readonly string appForeground = "app_foreground";

		// Token: 0x040001AD RID: 429
		public static readonly string appBackground = "app_background";

		// Token: 0x040001AE RID: 430
		public static readonly string appEnd = "app_end";

		// Token: 0x040001AF RID: 431
		public static readonly string gameAction = "game_action";

		// Token: 0x040001B0 RID: 432
		public static readonly string moneyAction = "money";

		// Token: 0x040001B1 RID: 433
		public static readonly string iOSMoneyAction = "payment_action";

		// Token: 0x040001B2 RID: 434
		public static string CellophaneBIKey = "3962215E-C235-4FA8-BD8D-78BB9DA7D3B4";

		// Token: 0x040001B3 RID: 435
		public static string CellophaneBISecret = "AC364A88C2D12A352DC81DC5FBBC9FEEE8BCCB3D9CA155FB";

		// Token: 0x040001B4 RID: 436
		public static string CellophaneIntBIKey = "334E04DB-F88C-4FAA-8D82-0680EFC01364";

		// Token: 0x040001B5 RID: 437
		public static string CellophaneIntBISecret = "2846EAA366F423DCA0E175B07D82770E918B8D27CD5B904E";

		// Token: 0x040001B6 RID: 438
		public static bool isIntServerEnvironment;

		// Token: 0x040001B7 RID: 439
		private static string mBundleIdentifier = "com.disney.HelloUnity";

		// Token: 0x040001B8 RID: 440
		private static string mSessionHash;

		// Token: 0x040001B9 RID: 441
		private static string mAppVersion = "1.0";

		// Token: 0x040001BA RID: 442
		private static int kCCBlockSizeAES128 = 16;

		// Token: 0x040001BB RID: 443
		private static int kCCKeySizeAES128 = 16;
	}
}
