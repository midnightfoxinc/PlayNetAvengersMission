using System;
using System.Collections.Generic;
using Prime31;
using UnityEngine;

// Token: 0x020002EB RID: 747
public static class IAPHandler
{
	// Token: 0x060013B1 RID: 5041 RVA: 0x0008E338 File Offset: 0x0008C538
	public static void initialize(string android_key, string iap_prefix)
	{
		if (IAPHandler._initialized)
		{
			return;
		}
		IAPHandler._initialized = true;
		IAPHandler._iap_prefix = iap_prefix;
		IAP.init(android_key);
		IAPHandler.request_product_data();
		GoogleIABManager.purchaseSucceededEvent += new Action<GooglePurchase>(IAPHandler.play_purchase_successful);
		EtceteraAndroidManager.alertButtonClickedEvent += new Action<string>(IAPHandler.parse_alert_event);
	}

	// Token: 0x17000232 RID: 562
	// (get) Token: 0x060013B2 RID: 5042 RVA: 0x0008E38C File Offset: 0x0008C58C
	public static bool purchasing_enabled
	{
		get
		{
			return true;
		}
	}

	// Token: 0x17000233 RID: 563
	// (get) Token: 0x060013B3 RID: 5043 RVA: 0x0008E390 File Offset: 0x0008C590
	public static bool available
	{
		get
		{
			return Application.isEditor || IAPHandler.testing_IAP || IAPHandler._available;
		}
	}

	// Token: 0x17000234 RID: 564
	// (get) Token: 0x060013B4 RID: 5044 RVA: 0x0008E3B0 File Offset: 0x0008C5B0
	public static purchase_result_enum purchase_result
	{
		get
		{
			return IAPHandler._purchase_result;
		}
	}

	// Token: 0x17000235 RID: 565
	// (get) Token: 0x060013B5 RID: 5045 RVA: 0x0008E3B8 File Offset: 0x0008C5B8
	public static string error
	{
		get
		{
			return IAPHandler._error;
		}
	}

	// Token: 0x060013B6 RID: 5046 RVA: 0x0008E3C0 File Offset: 0x0008C5C0
	public static IAPProduct product_by_id(string id)
	{
		for (int i = 0; i < IAPHandler.iap_product.Count; i++)
		{
			if (IAPHandler._iap_prefix + id.ToLower() == IAPHandler.iap_product[i].productId)
			{
				return IAPHandler.iap_product[i];
			}
			if (id.StartsWith(IAPHandler._iap_prefix) && id == IAPHandler.iap_product[i].productId)
			{
				return IAPHandler.iap_product[i];
			}
		}
		return null;
	}

	// Token: 0x060013B7 RID: 5047 RVA: 0x0008E458 File Offset: 0x0008C658
	public static void request_product_data()
	{
		List<string> list = new List<string>();
		for (int i = 0; i < globals.location_data.item.Count; i++)
		{
			if (globals.location_data.item[i].requires_purchase())
			{
				list.Add(IAPHandler._iap_prefix + globals.location_data.item[i].id.ToLower());
			}
		}
		IAP.requestProductData(list.ToArray(), list.ToArray(), new Action<List<IAPProduct>>(IAPHandler.IAP_request_result));
	}

	// Token: 0x060013B8 RID: 5048 RVA: 0x0008E4EC File Offset: 0x0008C6EC
	private static string already_owned_receipt(string id)
	{
		for (int i = 0; i < IAP.androidPurchasedItems.Count; i++)
		{
			if (IAP.androidPurchasedItems[i].productId == id)
			{
				return IAPHandler.android_receipt(IAP.androidPurchasedItems[i]);
			}
		}
		return null;
	}

	// Token: 0x060013B9 RID: 5049 RVA: 0x0008E544 File Offset: 0x0008C744
	public static void purchase_item(string id)
	{
		if (IAPHandler._purchase_result != purchase_result_enum.none)
		{
			return;
		}
		if (Application.isEditor || IAPHandler.testing_IAP)
		{
			IAPHandler.location_id = id;
			IAPHandler._purchase_result = purchase_result_enum.validated;
			return;
		}
		if (!IAPHandler.purchasing_enabled)
		{
			globals.debug("purchasing disabled");
			IAPHandler._purchase_result = purchase_result_enum.disabled;
			return;
		}
		if (!IAPHandler.available)
		{
			globals.debug("purchasing unavailable");
			IAPHandler._purchase_result = purchase_result_enum.failed;
			return;
		}
		globals.autoConnect = false;
		IAPHandler.location_id = id;
		IAPHandler._product_to_purchase = IAPHandler._iap_prefix + id.ToLower();
		IAPHandler._already_owned_receipt = IAPHandler.already_owned_receipt(IAPHandler._product_to_purchase);
		if (string.IsNullOrEmpty(IAPHandler._already_owned_receipt))
		{
			globals.debug("sending IAP request for " + IAPHandler._product_to_purchase);
			IAP.purchaseNonconsumableProduct(IAPHandler._product_to_purchase, new Action<bool, string>(IAPHandler.IAP_result));
			IAPHandler._purchase_result = purchase_result_enum.waiting;
		}
		else
		{
			globals.debug("product already owned: " + IAPHandler._product_to_purchase);
			EtceteraAndroid.showAlert("You've already purchased this.", "Would you like to get it again for free?", IAPHandler._alert_positive, "No");
		}
	}

	// Token: 0x060013BA RID: 5050 RVA: 0x0008E654 File Offset: 0x0008C854
	private static void IAP_request_result(List<IAPProduct> p)
	{
		if (p == null || p.Count < 1)
		{
			return;
		}
		IAPHandler._available = true;
		IAPHandler.iap_product = p;
		string text = "IAP product request returned:\n";
		for (int i = 0; i < p.Count; i++)
		{
			text = text + p[i].productId + "\n";
		}
		globals.debug(text);
	}

	// Token: 0x060013BB RID: 5051 RVA: 0x0008E6BC File Offset: 0x0008C8BC
	private static void IAP_result(bool successful, string error)
	{
		if (successful)
		{
			IAPHandler._purchase_result = purchase_result_enum.success;
			IAPHandler._error = string.Empty;
		}
		else
		{
			IAPHandler._purchase_result = purchase_result_enum.failed;
			IAPHandler._error = error;
		}
	}

	// Token: 0x060013BC RID: 5052 RVA: 0x0008E6E8 File Offset: 0x0008C8E8
	private static void play_purchase_successful(GooglePurchase t)
	{
		IAPHandler.purchase_successful(t.productId, IAPHandler.android_receipt(t), false);
	}

	// Token: 0x060013BD RID: 5053 RVA: 0x0008E6FC File Offset: 0x0008C8FC
	private static string android_receipt(GooglePurchase t)
	{
		string val = t.originalJson.Replace("\"", "\\\"");
		JSONObject jsonobject = new JSONObject();
		jsonobject.AddField("signedData", val);
		jsonobject.AddField("signature", t.signature);
		return jsonobject.ToString().Replace("\\", "\\\\").Replace("\"", "\\\"");
	}

	// Token: 0x060013BE RID: 5054 RVA: 0x0008E768 File Offset: 0x0008C968
	private static void parse_alert_event(string s)
	{
		if (s == IAPHandler._alert_positive && !string.IsNullOrEmpty(IAPHandler._product_to_purchase) && !string.IsNullOrEmpty(IAPHandler._already_owned_receipt))
		{
			IAPHandler.purchase_successful(IAPHandler._product_to_purchase, IAPHandler._already_owned_receipt, true);
			IAPHandler._purchase_result = purchase_result_enum.success;
			IAPHandler._error = string.Empty;
			IAPHandler._already_owned_receipt = null;
		}
	}

	// Token: 0x060013BF RID: 5055 RVA: 0x0008E7CC File Offset: 0x0008C9CC
	private static void purchase_successful(string product_id, string receipt, bool restored)
	{
		globals.network_manager.ValidateReceipt(product_id, receipt, new WebHandler.HttpResultDelegate(IAPHandler.receipt_validated), new WebHandler.HttpErrorDelegate(IAPHandler.receipt_failed));
		globals.debug("purchase_successful! product_id = " + product_id);
		IAPProduct iapproduct = IAPHandler.product_by_id(IAPHandler._product_to_purchase);
		if (iapproduct != null)
		{
			string amount_paid = (!restored) ? iapproduct.price : "0";
			DMOManager.LogPaymentAction(IAPHandler._product_to_purchase, iapproduct.currencyCode, amount_paid);
		}
		else
		{
			globals.debug("can't find product by id: " + IAPHandler._product_to_purchase);
			DMOManager.LogPaymentAction(IAPHandler._product_to_purchase, string.Empty, string.Empty);
		}
	}

	// Token: 0x060013C0 RID: 5056 RVA: 0x0008E874 File Offset: 0x0008CA74
	public static void receipt_validated(JSONObject result)
	{
		if (result.HasField("name") && result["name"].str == "SUCCESS")
		{
			IAPHandler._purchase_result = purchase_result_enum.validated;
			globals.debug("!!!! Receipt Validation Success !!!!\n" + result.ToString());
		}
		else
		{
			IAPHandler._purchase_result = purchase_result_enum.failed;
			IAPHandler._error = "receipt validation failed\n" + result.ToString();
		}
	}

	// Token: 0x060013C1 RID: 5057 RVA: 0x0008E8EC File Offset: 0x0008CAEC
	public static void receipt_failed(string url, string err)
	{
		IAPHandler._purchase_result = purchase_result_enum.failed;
		IAPHandler._error = "receipt_failed\nURL = " + url + "\nerr = " + err.break_every_n(30, " ");
	}

	// Token: 0x060013C2 RID: 5058 RVA: 0x0008E924 File Offset: 0x0008CB24
	public static void reset_purchase_result()
	{
		IAPHandler._purchase_result = purchase_result_enum.none;
		IAPHandler._product_to_purchase = string.Empty;
		IAPHandler._error = string.Empty;
		IAPHandler.location_id = string.Empty;
		globals.autoConnect = true;
	}

	// Token: 0x0400157C RID: 5500
	public static bool testing_IAP = false;

	// Token: 0x0400157D RID: 5501
	public static List<IAPProduct> iap_product = new List<IAPProduct>();

	// Token: 0x0400157E RID: 5502
	public static string location_id = string.Empty;

	// Token: 0x0400157F RID: 5503
	private static purchase_result_enum _purchase_result = purchase_result_enum.none;

	// Token: 0x04001580 RID: 5504
	private static string _error = string.Empty;

	// Token: 0x04001581 RID: 5505
	private static bool _initialized = false;

	// Token: 0x04001582 RID: 5506
	private static bool _available = false;

	// Token: 0x04001583 RID: 5507
	private static string _product_to_purchase = string.Empty;

	// Token: 0x04001584 RID: 5508
	private static string _already_owned_receipt = string.Empty;

	// Token: 0x04001585 RID: 5509
	private static string _iap_prefix = string.Empty;

	// Token: 0x04001586 RID: 5510
	private static string _alert_positive = "Yes";
}
