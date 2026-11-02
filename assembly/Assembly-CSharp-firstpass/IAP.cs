using System;
using System.Collections.Generic;
using UnityEngine;

namespace Prime31
{
	// Token: 0x0200000B RID: 11
	public static class IAP
	{
		// Token: 0x06000098 RID: 152 RVA: 0x00003E04 File Offset: 0x00002004
		static IAP()
		{
			GoogleIABManager.queryInventorySucceededEvent += delegate(List<GooglePurchase> purchases, List<GoogleSkuInfo> skus)
			{
				IAP.androidPurchasedItems = purchases;
				List<IAPProduct> list = new List<IAPProduct>();
				foreach (GoogleSkuInfo prod in skus)
				{
					list.Add(new IAPProduct(prod));
				}
				if (IAP._productListReceivedAction != null)
				{
					IAP._productListReceivedAction.Invoke(list);
				}
			};
			GoogleIABManager.queryInventoryFailedEvent += delegate(string error)
			{
				Debug.Log("fetching prouduct data failed: " + error);
				if (IAP._productListReceivedAction != null)
				{
					IAP._productListReceivedAction.Invoke(null);
				}
			};
			GoogleIABManager.purchaseSucceededEvent += delegate(GooglePurchase purchase)
			{
				if (purchase.developerPayload == "nonconsume")
				{
					if (IAP._purchaseCompletionAction != null)
					{
						IAP._purchaseCompletionAction.Invoke(true, null);
					}
				}
				else
				{
					GoogleIAB.consumeProduct(purchase.productId);
				}
			};
			GoogleIABManager.purchaseFailedEvent += delegate(string error, int response)
			{
				Debug.Log("purchase failed: " + error);
				if (IAP._purchaseCompletionAction != null)
				{
					IAP._purchaseCompletionAction.Invoke(false, error);
				}
			};
			GoogleIABManager.consumePurchaseSucceededEvent += delegate(GooglePurchase purchase)
			{
				if (IAP._purchaseCompletionAction != null)
				{
					IAP._purchaseCompletionAction.Invoke(true, null);
				}
			};
			GoogleIABManager.consumePurchaseFailedEvent += delegate(string error)
			{
				if (IAP._purchaseCompletionAction != null)
				{
					IAP._purchaseCompletionAction.Invoke(false, null);
				}
			};
		}

		// Token: 0x06000099 RID: 153 RVA: 0x00003EE8 File Offset: 0x000020E8
		public static void init(string androidPublicKey)
		{
			GoogleIAB.init(androidPublicKey);
		}

		// Token: 0x0600009A RID: 154 RVA: 0x00003EF0 File Offset: 0x000020F0
		public static void requestProductData(string[] iosProductIdentifiers, string[] androidSkus, Action<List<IAPProduct>> completionHandler)
		{
			IAP._productListReceivedAction = completionHandler;
			GoogleIAB.queryInventory(androidSkus);
		}

		// Token: 0x0600009B RID: 155 RVA: 0x00003F00 File Offset: 0x00002100
		public static void purchaseConsumableProduct(string productId, Action<bool, string> completionHandler)
		{
			IAP._purchaseCompletionAction = completionHandler;
			IAP._purchaseRestorationAction = null;
			GoogleIAB.purchaseProduct(productId, "consume");
		}

		// Token: 0x0600009C RID: 156 RVA: 0x00003F1C File Offset: 0x0000211C
		public static void purchaseNonconsumableProduct(string productId, Action<bool, string> completionHandler)
		{
			IAP._purchaseCompletionAction = completionHandler;
			IAP._purchaseRestorationAction = null;
			GoogleIAB.purchaseProduct(productId, "nonconsume");
		}

		// Token: 0x0600009D RID: 157 RVA: 0x00003F38 File Offset: 0x00002138
		public static void restoreCompletedTransactions(Action<string> completionHandler)
		{
			IAP._purchaseCompletionAction = null;
			IAP._purchaseRestorationAction = completionHandler;
		}

		// Token: 0x04000036 RID: 54
		private const string CONSUMABLE_PAYLOAD = "consume";

		// Token: 0x04000037 RID: 55
		private const string NON_CONSUMABLE_PAYLOAD = "nonconsume";

		// Token: 0x04000038 RID: 56
		public static List<GooglePurchase> androidPurchasedItems = new List<GooglePurchase>();

		// Token: 0x04000039 RID: 57
		private static Action<List<IAPProduct>> _productListReceivedAction;

		// Token: 0x0400003A RID: 58
		private static Action<bool, string> _purchaseCompletionAction;

		// Token: 0x0400003B RID: 59
		private static Action<string> _purchaseRestorationAction;
	}
}
