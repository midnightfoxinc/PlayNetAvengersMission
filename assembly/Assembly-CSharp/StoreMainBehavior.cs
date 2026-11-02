using System;
using UnityEngine;

// Token: 0x020002E9 RID: 745
public class StoreMainBehavior : MonoBehaviour
{
	// Token: 0x060013A6 RID: 5030 RVA: 0x0008DE08 File Offset: 0x0008C008
	private void Start()
	{
		globals.store_main = this;
		if (!IAPHandler.available)
		{
			IAPHandler.request_product_data();
		}
		this.option_panel.init();
		this.digital_item_details.gameObject.SetActive(false);
		this.physical_item_details.gameObject.SetActive(false);
		this.filter_panel.gameObject.SetActive(false);
		this.get_gear_popup.gameObject.SetActive(false);
		this.age_gate.show(false);
		if (this.purchasing_indicator)
		{
			this.purchasing_indicator.SetActive(false);
		}
		globals.music_jukebox.change_music(this.music, 0.25f);
		this.show_item(globals.store_item_id);
	}

	// Token: 0x060013A7 RID: 5031 RVA: 0x0008DEC4 File Offset: 0x0008C0C4
	public bool any_subpanel_open()
	{
		return this.digital_item_details.gameObject.activeInHierarchy || this.physical_item_details.gameObject.activeInHierarchy || this.filter_panel.gameObject.activeInHierarchy;
	}

	// Token: 0x060013A8 RID: 5032 RVA: 0x0008DF10 File Offset: 0x0008C110
	public void show_item(string id)
	{
		if (string.IsNullOrEmpty(id))
		{
			return;
		}
		StoreItemDataClass storeItemDataClass = globals.store_data.item_by_id(id, true);
		if (!storeItemDataClass)
		{
			globals.debugWarning("no store item found for ID: " + id);
			return;
		}
		if (storeItemDataClass.type == StoreItemDataClass.type_enum.physical)
		{
			if (string.IsNullOrEmpty(storeItemDataClass.redirect_id))
			{
				this.physical_item_details.set_data(storeItemDataClass);
			}
			else
			{
				this.physical_item_details.set_data(storeItemDataClass.redirect_id);
			}
		}
		else if (storeItemDataClass.type == StoreItemDataClass.type_enum.location)
		{
			this.digital_item_details.set_data(storeItemDataClass);
		}
	}

	// Token: 0x060013A9 RID: 5033 RVA: 0x0008DFB0 File Offset: 0x0008C1B0
	public void show_age_gate()
	{
		if (this.use_age_gate)
		{
			this.age_gate.show(true);
		}
		else
		{
			this.age_gate_passed();
		}
	}

	// Token: 0x060013AA RID: 5034 RVA: 0x0008DFE0 File Offset: 0x0008C1E0
	public void age_gate_passed()
	{
		IAPHandler.purchase_item(this.digital_item_details.id);
	}

	// Token: 0x060013AB RID: 5035 RVA: 0x0008DFF4 File Offset: 0x0008C1F4
	private void update_iap()
	{
		switch (IAPHandler.purchase_result)
		{
		case purchase_result_enum.disabled:
			if (globals.environment_manager.isProd)
			{
				globals.show_localized_OK_alert("IAP DISABLED HEADER", "IAP DISABLED BODY", null);
			}
			else
			{
				PopupAlert.Show("IAP Result", Localization.Get("PURCHASING_DISABLED") + "\n" + IAPHandler.error, "OK", NGUITools.GetRoot(this.back_button.gameObject), null, 1f);
			}
			IAPHandler.reset_purchase_result();
			break;
		case purchase_result_enum.failed:
			if (globals.environment_manager.isProd)
			{
				globals.show_localized_OK_alert("IAP FAILED HEADER", "IAP FAILED BODY", null);
			}
			else
			{
				PopupAlert.Show("IAP Result", "Failed.\n" + IAPHandler.error, "OK", NGUITools.GetRoot(this.back_button.gameObject), null, 1f);
			}
			IAPHandler.reset_purchase_result();
			break;
		case purchase_result_enum.cancelled:
			if (globals.environment_manager.isProd)
			{
				globals.show_localized_OK_alert("IAP CANCELLED HEADER", "IAP CANCELLED BODY", null);
			}
			else
			{
				PopupAlert.Show("IAP Result", "Cancelled.\n" + IAPHandler.error, "OK", NGUITools.GetRoot(this.back_button.gameObject), null, 1f);
			}
			IAPHandler.reset_purchase_result();
			break;
		case purchase_result_enum.validated:
			this._new_location = IAPHandler.location_id;
			globals.temp_unlocks.Add(IAPHandler.location_id);
			IAPHandler.reset_purchase_result();
			break;
		}
		if (this.purchasing_indicator)
		{
			this.purchasing_indicator.SetActive(IAPHandler.purchase_result != purchase_result_enum.none);
		}
	}

	// Token: 0x060013AC RID: 5036 RVA: 0x0008E1A0 File Offset: 0x0008C3A0
	private void new_location_check()
	{
		if (string.IsNullOrEmpty(this._new_location) || !globals.player_data.connected_device_data || globals.showing_alert)
		{
			return;
		}
		globals.temp_unlocks.Clear();
		globals.BLE_manager.fetchContentList();
		globals.BLE_manager.sendUnlockEnvironment(this._new_location);
		globals.show_localized_confirm_alert("NEW LOCATION HEADER", "NEW LOCATION BODY", new EventDelegate.Callback(this.open_new_location), new EventDelegate.Callback(this.clear_new_location), "YES", "NO", false);
	}

	// Token: 0x060013AD RID: 5037 RVA: 0x0008E234 File Offset: 0x0008C434
	private void open_new_location()
	{
		this.digital_item_details.close(true);
		globals.open_mm_to_location(this._new_location, false);
		this._new_location = string.Empty;
	}

	// Token: 0x060013AE RID: 5038 RVA: 0x0008E25C File Offset: 0x0008C45C
	private void clear_new_location()
	{
		this._new_location = string.Empty;
	}

	// Token: 0x060013AF RID: 5039 RVA: 0x0008E26C File Offset: 0x0008C46C
	private void Update()
	{
		if (this.back_button.clicked || globals.base_escape_hit())
		{
			DMOManager.LogNavigation(NavigationManager.hq_scene, "back_btn", NavigationManager.store_scene, null);
			globals.player_data.saveData(true, false);
			NavigationManager.load_scene(NavigationManager.hq_scene);
		}
		this.new_location_check();
		this.update_iap();
	}

	// Token: 0x04001565 RID: 5477
	public buttonBehavior back_button;

	// Token: 0x04001566 RID: 5478
	public StoreOptionPanelBehavior option_panel;

	// Token: 0x04001567 RID: 5479
	public StoreDigitalDetailsBehavior digital_item_details;

	// Token: 0x04001568 RID: 5480
	public StorePhysicalDetailsBehavior physical_item_details;

	// Token: 0x04001569 RID: 5481
	public AgeGateBehavior age_gate;

	// Token: 0x0400156A RID: 5482
	public GetGearPopupBehavior get_gear_popup;

	// Token: 0x0400156B RID: 5483
	public StoreFilterPanelBehavior filter_panel;

	// Token: 0x0400156C RID: 5484
	public GameObject purchasing_indicator;

	// Token: 0x0400156D RID: 5485
	public UIAtlas gear_atlas;

	// Token: 0x0400156E RID: 5486
	public UIAtlas SF_atlas;

	// Token: 0x0400156F RID: 5487
	public UIAtlas location_atlas;

	// Token: 0x04001570 RID: 5488
	public string music = "store music";

	// Token: 0x04001571 RID: 5489
	public float drag_threshold = 10f;

	// Token: 0x04001572 RID: 5490
	public bool use_age_gate;

	// Token: 0x04001573 RID: 5491
	private string _new_location = string.Empty;
}
