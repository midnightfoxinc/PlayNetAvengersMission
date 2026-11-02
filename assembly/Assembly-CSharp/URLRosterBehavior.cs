using System;
using UnityEngine;

// Token: 0x020002FC RID: 764
public class URLRosterBehavior : MonoBehaviour
{
	// Token: 0x06001403 RID: 5123 RVA: 0x0009027C File Offset: 0x0008E47C
	public void show_URL(string url, bool external = true)
	{
		if (external)
		{
			this.open_URL_with_confirmation(url);
			return;
		}
		if (Application.isEditor)
		{
			globals.debug("show_URL internal: " + url);
			Application.OpenURL(url);
			return;
		}
		EtceteraAndroid.showWebView(url);
	}

	// Token: 0x06001404 RID: 5124 RVA: 0x000902B4 File Offset: 0x0008E4B4
	private void parse_alert_event(string s)
	{
		if (s == this._alert_positive && !string.IsNullOrEmpty(this._requested_url))
		{
			Application.OpenURL(this._requested_url);
		}
	}

	// Token: 0x06001405 RID: 5125 RVA: 0x000902F0 File Offset: 0x0008E4F0
	private void open_URL_with_confirmation(string url)
	{
		if (!this.show_confirmation || Application.isEditor)
		{
			Application.OpenURL(url);
			return;
		}
		if (string.IsNullOrEmpty(this._requested_url))
		{
			EtceteraAndroidManager.alertButtonClickedEvent += new Action<string>(this.parse_alert_event);
		}
		this._requested_url = url;
		EtceteraAndroid.showAlert("Now Leaving AvengersNet", Localization.Get("EXTERNAL_URL_CONFIRM"), this._alert_positive, this._alert_negative);
	}

	// Token: 0x06001406 RID: 5126 RVA: 0x00090364 File Offset: 0x0008E564
	public void show_tos()
	{
		this.show_URL(this.tos_URL, false);
	}

	// Token: 0x06001407 RID: 5127 RVA: 0x00090374 File Offset: 0x0008E574
	public void show_privacy()
	{
		this.show_URL(this.privacy_policy_URL, false);
	}

	// Token: 0x06001408 RID: 5128 RVA: 0x00090384 File Offset: 0x0008E584
	public void show_privacy_faqs()
	{
		this.show_URL(this.privacy_faqs_URL, true);
	}

	// Token: 0x06001409 RID: 5129 RVA: 0x00090394 File Offset: 0x0008E594
	public void show_overview()
	{
		this.show_URL(this.overview_URL, false);
	}

	// Token: 0x0600140A RID: 5130 RVA: 0x000903A4 File Offset: 0x0008E5A4
	public void show_legal()
	{
		this.show_URL(this.legal_notices_URL, true);
	}

	// Token: 0x0600140B RID: 5131 RVA: 0x000903B4 File Offset: 0x0008E5B4
	public void show_playmation()
	{
		this.show_URL(this.playmation_URL, true);
	}

	// Token: 0x0600140C RID: 5132 RVA: 0x000903C4 File Offset: 0x0008E5C4
	public void show_website()
	{
		this.show_URL(this.website_URL, true);
	}

	// Token: 0x0600140D RID: 5133 RVA: 0x000903D4 File Offset: 0x0008E5D4
	public void show_help()
	{
		this.show_URL(this.playmation_help_URL, true);
	}

	// Token: 0x0600140E RID: 5134 RVA: 0x000903E4 File Offset: 0x0008E5E4
	public void show_training()
	{
		this.show_URL(this.training_URL, true);
	}

	// Token: 0x0600140F RID: 5135 RVA: 0x000903F4 File Offset: 0x0008E5F4
	public void show_retailer_loc()
	{
		this.show_URL(this.retailer_loc_URL, true);
	}

	// Token: 0x06001410 RID: 5136 RVA: 0x00090404 File Offset: 0x0008E604
	public void open_TDS_page(string TDS_id)
	{
		this.show_URL(this.TDS_base_URL + TDS_id, true);
	}

	// Token: 0x040015E7 RID: 5607
	public string tos_URL;

	// Token: 0x040015E8 RID: 5608
	public string privacy_policy_URL;

	// Token: 0x040015E9 RID: 5609
	public string privacy_faqs_URL;

	// Token: 0x040015EA RID: 5610
	public string legal_notices_URL;

	// Token: 0x040015EB RID: 5611
	public string overview_URL;

	// Token: 0x040015EC RID: 5612
	public string playmation_URL;

	// Token: 0x040015ED RID: 5613
	public string website_URL;

	// Token: 0x040015EE RID: 5614
	public string playmation_help_URL;

	// Token: 0x040015EF RID: 5615
	public string training_URL;

	// Token: 0x040015F0 RID: 5616
	public string retailer_loc_URL;

	// Token: 0x040015F1 RID: 5617
	public string TDS_base_URL = "http://www.disneystore.com/mp/";

	// Token: 0x040015F2 RID: 5618
	public bool show_confirmation = true;

	// Token: 0x040015F3 RID: 5619
	private string _requested_url = string.Empty;

	// Token: 0x040015F4 RID: 5620
	private string _alert_positive = "Yes";

	// Token: 0x040015F5 RID: 5621
	private string _alert_negative = "No";
}
