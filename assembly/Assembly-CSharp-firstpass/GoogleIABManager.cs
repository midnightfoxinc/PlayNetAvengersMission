using System;
using System.Collections.Generic;

namespace Prime31
{
	// Token: 0x0200000F RID: 15
	public class GoogleIABManager : AbstractManager
	{
		// Token: 0x060000F4 RID: 244 RVA: 0x00004408 File Offset: 0x00002608
		static GoogleIABManager()
		{
			AbstractManager.initialize(typeof(GoogleIABManager));
		}

		// Token: 0x14000016 RID: 22
		// (add) Token: 0x060000F5 RID: 245 RVA: 0x0000441C File Offset: 0x0000261C
		// (remove) Token: 0x060000F6 RID: 246 RVA: 0x00004434 File Offset: 0x00002634
		public static event Action billingSupportedEvent;

		// Token: 0x14000017 RID: 23
		// (add) Token: 0x060000F7 RID: 247 RVA: 0x0000444C File Offset: 0x0000264C
		// (remove) Token: 0x060000F8 RID: 248 RVA: 0x00004464 File Offset: 0x00002664
		public static event Action<string> billingNotSupportedEvent;

		// Token: 0x14000018 RID: 24
		// (add) Token: 0x060000F9 RID: 249 RVA: 0x0000447C File Offset: 0x0000267C
		// (remove) Token: 0x060000FA RID: 250 RVA: 0x00004494 File Offset: 0x00002694
		public static event Action<List<GooglePurchase>, List<GoogleSkuInfo>> queryInventorySucceededEvent;

		// Token: 0x14000019 RID: 25
		// (add) Token: 0x060000FB RID: 251 RVA: 0x000044AC File Offset: 0x000026AC
		// (remove) Token: 0x060000FC RID: 252 RVA: 0x000044C4 File Offset: 0x000026C4
		public static event Action<string> queryInventoryFailedEvent;

		// Token: 0x1400001A RID: 26
		// (add) Token: 0x060000FD RID: 253 RVA: 0x000044DC File Offset: 0x000026DC
		// (remove) Token: 0x060000FE RID: 254 RVA: 0x000044F4 File Offset: 0x000026F4
		public static event Action<string, string> purchaseCompleteAwaitingVerificationEvent;

		// Token: 0x1400001B RID: 27
		// (add) Token: 0x060000FF RID: 255 RVA: 0x0000450C File Offset: 0x0000270C
		// (remove) Token: 0x06000100 RID: 256 RVA: 0x00004524 File Offset: 0x00002724
		public static event Action<GooglePurchase> purchaseSucceededEvent;

		// Token: 0x1400001C RID: 28
		// (add) Token: 0x06000101 RID: 257 RVA: 0x0000453C File Offset: 0x0000273C
		// (remove) Token: 0x06000102 RID: 258 RVA: 0x00004554 File Offset: 0x00002754
		public static event Action<string, int> purchaseFailedEvent;

		// Token: 0x1400001D RID: 29
		// (add) Token: 0x06000103 RID: 259 RVA: 0x0000456C File Offset: 0x0000276C
		// (remove) Token: 0x06000104 RID: 260 RVA: 0x00004584 File Offset: 0x00002784
		public static event Action<GooglePurchase> consumePurchaseSucceededEvent;

		// Token: 0x1400001E RID: 30
		// (add) Token: 0x06000105 RID: 261 RVA: 0x0000459C File Offset: 0x0000279C
		// (remove) Token: 0x06000106 RID: 262 RVA: 0x000045B4 File Offset: 0x000027B4
		public static event Action<string> consumePurchaseFailedEvent;

		// Token: 0x06000107 RID: 263 RVA: 0x000045CC File Offset: 0x000027CC
		public void billingSupported(string empty)
		{
			ActionExtensions.fire(GoogleIABManager.billingSupportedEvent);
		}

		// Token: 0x06000108 RID: 264 RVA: 0x000045D8 File Offset: 0x000027D8
		public void billingNotSupported(string error)
		{
			ActionExtensions.fire<string>(GoogleIABManager.billingNotSupportedEvent, error);
		}

		// Token: 0x06000109 RID: 265 RVA: 0x000045E8 File Offset: 0x000027E8
		public void queryInventorySucceeded(string json)
		{
			if (GoogleIABManager.queryInventorySucceededEvent != null)
			{
				Dictionary<string, object> dictionary = JsonExtensions.dictionaryFromJson(json);
				GoogleIABManager.queryInventorySucceededEvent.Invoke(GooglePurchase.fromList(dictionary["purchases"] as List<object>), GoogleSkuInfo.fromList(dictionary["skus"] as List<object>));
			}
		}

		// Token: 0x0600010A RID: 266 RVA: 0x0000463C File Offset: 0x0000283C
		public void queryInventoryFailed(string error)
		{
			ActionExtensions.fire<string>(GoogleIABManager.queryInventoryFailedEvent, error);
		}

		// Token: 0x0600010B RID: 267 RVA: 0x0000464C File Offset: 0x0000284C
		public void purchaseCompleteAwaitingVerification(string json)
		{
			if (GoogleIABManager.purchaseCompleteAwaitingVerificationEvent != null)
			{
				Dictionary<string, object> dictionary = JsonExtensions.dictionaryFromJson(json);
				string text = dictionary["purchaseData"].ToString();
				string text2 = dictionary["signature"].ToString();
				GoogleIABManager.purchaseCompleteAwaitingVerificationEvent.Invoke(text, text2);
			}
		}

		// Token: 0x0600010C RID: 268 RVA: 0x00004698 File Offset: 0x00002898
		public void purchaseSucceeded(string json)
		{
			ActionExtensions.fire<GooglePurchase>(GoogleIABManager.purchaseSucceededEvent, new GooglePurchase(JsonExtensions.dictionaryFromJson(json)));
		}

		// Token: 0x0600010D RID: 269 RVA: 0x000046B0 File Offset: 0x000028B0
		public void purchaseFailed(string json)
		{
			if (GoogleIABManager.purchaseFailedEvent != null)
			{
				Dictionary<string, object> dictionary = Json.decode<Dictionary<string, object>>(json, null);
				GoogleIABManager.purchaseFailedEvent.Invoke(dictionary["result"].ToString(), int.Parse(dictionary["response"].ToString()));
			}
		}

		// Token: 0x0600010E RID: 270 RVA: 0x00004700 File Offset: 0x00002900
		public void consumePurchaseSucceeded(string json)
		{
			if (GoogleIABManager.consumePurchaseSucceededEvent != null)
			{
				ActionExtensions.fire<GooglePurchase>(GoogleIABManager.consumePurchaseSucceededEvent, new GooglePurchase(JsonExtensions.dictionaryFromJson(json)));
			}
		}

		// Token: 0x0600010F RID: 271 RVA: 0x00004724 File Offset: 0x00002924
		public void consumePurchaseFailed(string error)
		{
			ActionExtensions.fire<string>(GoogleIABManager.consumePurchaseFailedEvent, error);
		}
	}
}
