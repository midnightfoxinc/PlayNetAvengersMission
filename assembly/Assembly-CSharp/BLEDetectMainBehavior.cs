using System;
using UnityEngine;

// Token: 0x02000196 RID: 406
public class BLEDetectMainBehavior : CallbackMonoBehavior
{
	// Token: 0x06000C69 RID: 3177 RVA: 0x0005A6A0 File Offset: 0x000588A0
	private void Start()
	{
		this.ble_popup.SetActive(false);
		if (globals.build_type == build_type_enum.no_gear_demo)
		{
			if (!string.IsNullOrEmpty(this.demo_next_state))
			{
				this.next_state = this.demo_next_state;
				this.skip_state = this.demo_next_state;
			}
			globals.BLE_manager.bluetooth_enabled = true;
		}
		if (Application.isEditor || Application.platform == 11)
		{
			globals.FTUE_manager.set_state(this.next_state, false);
		}
		else
		{
			this.getBLEState();
		}
	}

	// Token: 0x06000C6A RID: 3178 RVA: 0x0005A72C File Offset: 0x0005892C
	private void getBLEState()
	{
		if (!globals.BLE_manager_exists)
		{
			base.Invoke("isBLEEnable", 3f);
		}
		else
		{
			base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_ENABLED, new BLEManager.DataReceivedDelegate(this.OnBLEEnabled));
			base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DISABLED, new BLEManager.DataReceivedDelegate(this.OnBLEDisable));
			globals.BLE_manager.isBluetoothRadioOn();
		}
	}

	// Token: 0x06000C6B RID: 3179 RVA: 0x0005A794 File Offset: 0x00058994
	public void OnBLEDisable(JSONObject data)
	{
		this.state = BLEDetectMainBehavior.state_enum.enable_ble;
		globals.BLE_manager.bluetoothPopup();
	}

	// Token: 0x06000C6C RID: 3180 RVA: 0x0005A7A8 File Offset: 0x000589A8
	public void OnBLEEnabled(JSONObject data)
	{
		if (!globals.BLE_manager.any_unregistered_devices())
		{
			this.state = BLEDetectMainBehavior.state_enum.get_gear;
		}
	}

	// Token: 0x06000C6D RID: 3181 RVA: 0x0005A7C0 File Offset: 0x000589C0
	private void Update()
	{
		if (globals.BLE_manager.any_unregistered_devices())
		{
			globals.FTUE_manager.set_state(this.next_state, false);
		}
		else if (this.learn_more_button.hit)
		{
			globals.URL_roster.show_website();
		}
		else if (this.enable_button.hit)
		{
			globals.BLE_manager.bluetoothPopup();
		}
		else
		{
			for (int i = 0; i < this.skip_button.Length; i++)
			{
				if (this.skip_button[i].hit)
				{
					globals.FTUE_manager.set_state(this.skip_state, false);
				}
			}
		}
		this.detecting_popup.SetActive(this.state == BLEDetectMainBehavior.state_enum.detecting);
		this.ble_popup.SetActive(this.state == BLEDetectMainBehavior.state_enum.enable_ble);
		this.get_gear_popup.SetActive(this.state == BLEDetectMainBehavior.state_enum.get_gear);
	}

	// Token: 0x04000C0F RID: 3087
	public buttonBehavior[] skip_button;

	// Token: 0x04000C10 RID: 3088
	public buttonBehavior enable_button;

	// Token: 0x04000C11 RID: 3089
	public buttonBehavior learn_more_button;

	// Token: 0x04000C12 RID: 3090
	public GameObject detecting_popup;

	// Token: 0x04000C13 RID: 3091
	public GameObject ble_popup;

	// Token: 0x04000C14 RID: 3092
	public GameObject get_gear_popup;

	// Token: 0x04000C15 RID: 3093
	public BLEDetectMainBehavior.state_enum state;

	// Token: 0x04000C16 RID: 3094
	public string next_state;

	// Token: 0x04000C17 RID: 3095
	public string skip_state;

	// Token: 0x04000C18 RID: 3096
	public string demo_next_state;

	// Token: 0x02000197 RID: 407
	public enum state_enum
	{
		// Token: 0x04000C1A RID: 3098
		detecting,
		// Token: 0x04000C1B RID: 3099
		enable_ble,
		// Token: 0x04000C1C RID: 3100
		get_gear
	}
}
