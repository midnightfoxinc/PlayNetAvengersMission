using System;
using UnityEngine;

// Token: 0x0200030B RID: 779
public class NetworkTestBehavior : MonoBehaviour
{
	// Token: 0x06001447 RID: 5191 RVA: 0x00091FA4 File Offset: 0x000901A4
	private void test_ios_receipt()
	{
		JSONObject jsonobject = new JSONObject();
		jsonobject.AddField("receipt", this.ios_receipt);
		jsonobject.AddField("productId", this.ios_product);
		base.StartCoroutine(WebHandler.instance.httpPostJson(globals.network_manager.iOSReceiptURL, jsonobject.ToString(), delegate(JSONObject json)
		{
			this.ios_receipt_label.text = "test_ios_receipt success: " + json;
		}, delegate(string url, string err)
		{
			this.ios_receipt_label.text = "test_ios_receipt failed: " + err.break_every_n(this.max_err_length, " ");
		}, false, false));
	}

	// Token: 0x06001448 RID: 5192 RVA: 0x00092014 File Offset: 0x00090214
	private void test_android_receipt()
	{
		JSONObject jsonobject = new JSONObject();
		jsonobject.AddField("receipt", this.android_receipt);
		jsonobject.AddField("productId", this.android_product);
		jsonobject.AddField("appId", this.android_app_id);
		base.StartCoroutine(WebHandler.instance.httpPostJson(globals.network_manager.androidReceiptURL, jsonobject.ToString(), delegate(JSONObject json)
		{
			this.android_receipt_label.text = "test_android_receipt success: " + json;
		}, delegate(string url, string err)
		{
			this.android_receipt_label.text = "test_android_receipt failed: " + err.break_every_n(this.max_err_length, " ");
		}, false, false));
	}

	// Token: 0x06001449 RID: 5193 RVA: 0x00092098 File Offset: 0x00090298
	private void go()
	{
		this.test_ios_receipt();
		this.test_android_receipt();
	}

	// Token: 0x0600144A RID: 5194 RVA: 0x000920A8 File Offset: 0x000902A8
	private void Update()
	{
		if (globals.player_data.isAuthenticated())
		{
			globals.debug("===== PLAYER AUTHENTICATED. RUNNING NETWORK TESTS =====");
			this.go();
			base.enabled = false;
		}
	}

	// Token: 0x0400164E RID: 5710
	public UILabel ios_receipt_label;

	// Token: 0x0400164F RID: 5711
	public UILabel android_receipt_label;

	// Token: 0x04001650 RID: 5712
	public string ios_receipt;

	// Token: 0x04001651 RID: 5713
	public string ios_product;

	// Token: 0x04001652 RID: 5714
	public string android_receipt;

	// Token: 0x04001653 RID: 5715
	public string android_product;

	// Token: 0x04001654 RID: 5716
	public string android_app_id;

	// Token: 0x04001655 RID: 5717
	public int max_err_length = 100;
}
