using System;
using UnityEngine;

namespace Prime31
{
	// Token: 0x0200000E RID: 14
	public class GoogleIAB
	{
		// Token: 0x060000E8 RID: 232 RVA: 0x000041AC File Offset: 0x000023AC
		static GoogleIAB()
		{
			if (Application.platform != 11)
			{
				return;
			}
			using (AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.prime31.GoogleIABPlugin"))
			{
				GoogleIAB._plugin = androidJavaClass.CallStatic<AndroidJavaObject>("instance", new object[0]);
			}
		}

		// Token: 0x060000E9 RID: 233 RVA: 0x00004218 File Offset: 0x00002418
		public static void enableLogging(bool shouldEnable)
		{
			if (Application.platform != 11)
			{
				return;
			}
			if (shouldEnable)
			{
				Debug.LogWarning("YOU HAVE ENABLED HIGH DETAIL LOGS. DO NOT DISTRIBUTE THE GENERATED APK PUBLICLY. IT WILL DUMP SENSITIVE INFORMATION TO THE CONSOLE!");
			}
			GoogleIAB._plugin.Call("enableLogging", new object[]
			{
				shouldEnable
			});
		}

		// Token: 0x060000EA RID: 234 RVA: 0x00004260 File Offset: 0x00002460
		public static void setAutoVerifySignatures(bool shouldVerify)
		{
			if (Application.platform != 11)
			{
				return;
			}
			GoogleIAB._plugin.Call("setAutoVerifySignatures", new object[]
			{
				shouldVerify
			});
		}

		// Token: 0x060000EB RID: 235 RVA: 0x00004290 File Offset: 0x00002490
		public static void init(string publicKey)
		{
			if (Application.platform != 11)
			{
				return;
			}
			GoogleIAB._plugin.Call("init", new object[]
			{
				publicKey
			});
		}

		// Token: 0x060000EC RID: 236 RVA: 0x000042C4 File Offset: 0x000024C4
		public static void unbindService()
		{
			if (Application.platform != 11)
			{
				return;
			}
			GoogleIAB._plugin.Call("unbindService", new object[0]);
		}

		// Token: 0x060000ED RID: 237 RVA: 0x000042F4 File Offset: 0x000024F4
		public static bool areSubscriptionsSupported()
		{
			return Application.platform == 11 && GoogleIAB._plugin.Call<bool>("areSubscriptionsSupported", new object[0]);
		}

		// Token: 0x060000EE RID: 238 RVA: 0x0000431C File Offset: 0x0000251C
		public static void queryInventory(string[] skus)
		{
			if (Application.platform != 11)
			{
				return;
			}
			GoogleIAB._plugin.Call("queryInventory", new object[]
			{
				skus
			});
		}

		// Token: 0x060000EF RID: 239 RVA: 0x00004350 File Offset: 0x00002550
		public static void purchaseProduct(string sku)
		{
			GoogleIAB.purchaseProduct(sku, string.Empty);
		}

		// Token: 0x060000F0 RID: 240 RVA: 0x00004360 File Offset: 0x00002560
		public static void purchaseProduct(string sku, string developerPayload)
		{
			if (Application.platform != 11)
			{
				return;
			}
			GoogleIAB._plugin.Call("purchaseProduct", new object[]
			{
				sku,
				developerPayload
			});
		}

		// Token: 0x060000F1 RID: 241 RVA: 0x00004398 File Offset: 0x00002598
		public static void consumeProduct(string sku)
		{
			if (Application.platform != 11)
			{
				return;
			}
			GoogleIAB._plugin.Call("consumeProduct", new object[]
			{
				sku
			});
		}

		// Token: 0x060000F2 RID: 242 RVA: 0x000043CC File Offset: 0x000025CC
		public static void consumeProducts(string[] skus)
		{
			if (Application.platform != 11)
			{
				return;
			}
			GoogleIAB._plugin.Call("consumeProducts", new object[]
			{
				skus
			});
		}

		// Token: 0x04000047 RID: 71
		private static AndroidJavaObject _plugin;
	}
}
