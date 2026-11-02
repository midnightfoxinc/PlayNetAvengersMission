using System;
using System.Collections.Generic;
using Prime31;

// Token: 0x02000307 RID: 775
public class StoreDigitalDetailsBehavior : StoreItemDetailsBehavior
{
	// Token: 0x0600143B RID: 5179 RVA: 0x000918B0 File Offset: 0x0008FAB0
	private bool is_unlocked()
	{
		return globals.player_data.has_unlock(base.id) || globals.temp_unlocks.Contains(base.id);
	}

	// Token: 0x0600143C RID: 5180 RVA: 0x000918EC File Offset: 0x0008FAEC
	private bool is_entitled()
	{
		if (!globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(globals.BLE_manager.connectedDevice))
		{
			return false;
		}
		List<string> downloadableContentList = MissionManager.getInstance().getDownloadableContentList(base.id);
		Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[globals.BLE_manager.connectedDevice];
		for (int i = 0; i < downloadableContentList.Count; i++)
		{
			if (!dictionary.ContainsKey(downloadableContentList[i]))
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x0600143D RID: 5181 RVA: 0x00091970 File Offset: 0x0008FB70
	private void set_buy_button()
	{
		if (globals.player_data.isGuestLogin())
		{
			this.buy_button.label.text = "SIGN IN";
			this._buy_action = StoreDigitalDetailsBehavior.buy_action_enum.login;
			return;
		}
		if (!this.is_unlocked())
		{
			IAPProduct iapproduct = IAPHandler.product_by_id(base.id);
			if (iapproduct == null)
			{
				this.buy_button.label.text = "BUY";
			}
			else
			{
				string text = (!iapproduct.price.Contains("$")) ? ("$" + iapproduct.price) : iapproduct.price;
				this.buy_button.label.text = text;
			}
			this._buy_action = StoreDigitalDetailsBehavior.buy_action_enum.buy;
		}
		else if (!globals.player_data.connected_device_data)
		{
			this.buy_button.label.text = "CONNECT GEAR";
			this._buy_action = StoreDigitalDetailsBehavior.buy_action_enum.connect;
		}
		else if (!this.is_entitled())
		{
			this.buy_button.label.text = "VERIFY PURCHASE";
			this._buy_action = StoreDigitalDetailsBehavior.buy_action_enum.buy;
		}
		else
		{
			this.buy_button.label.text = "MISSION MANAGER";
			this._buy_action = StoreDigitalDetailsBehavior.buy_action_enum.purchased;
		}
	}

	// Token: 0x0600143E RID: 5182 RVA: 0x00091AAC File Offset: 0x0008FCAC
	protected override void Update()
	{
		base.Update();
		this.set_buy_button();
		if (this.buy_button.clicked)
		{
			switch (this._buy_action)
			{
			case StoreDigitalDetailsBehavior.buy_action_enum.buy:
				if (globals.player_data.device_ids().Count > 0)
				{
					globals.store_main.show_age_gate();
				}
				else
				{
					globals.store_main.get_gear_popup.show();
				}
				break;
			case StoreDigitalDetailsBehavior.buy_action_enum.login:
				globals.login();
				break;
			case StoreDigitalDetailsBehavior.buy_action_enum.purchased:
				this.close(true);
				globals.open_mm_to_location(base.id, true);
				break;
			case StoreDigitalDetailsBehavior.buy_action_enum.connect:
				if (globals.gear_daisy)
				{
					this.close(true);
					globals.gear_daisy.mode = GearDaisyBehavior.mode_enum.switch_gear;
				}
				break;
			}
		}
	}

	// Token: 0x04001636 RID: 5686
	public LabelledButtonBehavior buy_button;

	// Token: 0x04001637 RID: 5687
	private StoreDigitalDetailsBehavior.buy_action_enum _buy_action;

	// Token: 0x02000308 RID: 776
	private enum buy_action_enum
	{
		// Token: 0x04001639 RID: 5689
		buy,
		// Token: 0x0400163A RID: 5690
		login,
		// Token: 0x0400163B RID: 5691
		purchased,
		// Token: 0x0400163C RID: 5692
		connect
	}
}
