using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001A5 RID: 421
public class RegisterDeviceMainBehavior : CallbackMonoBehavior
{
	// Token: 0x06000C9D RID: 3229 RVA: 0x0005B94C File Offset: 0x00059B4C
	private void Start()
	{
		this.set_connected_device_texture();
		this.update_ui();
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_CONNECT, new BLEManager.DataReceivedDelegate(this.joined_callback));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_KEYMASKREQUEST, new BLEManager.DataReceivedDelegate(this.sync_button_pressed_callback));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_CODEDECLINED, new BLEManager.DataReceivedDelegate(this.wrong_code_callback));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTERSUCCESS, new BLEManager.DataReceivedDelegate(this.register_success_callback));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_WRONGCODE, new BLEManager.DataReceivedDelegate(this.register_wrong_code_callback));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_SYNCAPPPROMPTFAIL, new BLEManager.DataReceivedDelegate(this.register_no_action_callback));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTERFAIL, new BLEManager.DataReceivedDelegate(this.register_fail));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTERFAILDECRYPTION, new BLEManager.DataReceivedDelegate(this.register_decryption_fail));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTER_FAIL_ALREADY_REGISTERED, new BLEManager.DataReceivedDelegate(this.register_fail_alReady_registred));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.RTO_ERROR, new BLEManager.DataReceivedDelegate(this.onRTOError));
	}

	// Token: 0x06000C9E RID: 3230 RVA: 0x0005BA60 File Offset: 0x00059C60
	public void onRTOError(JSONObject data)
	{
		if (this.state == RegisterDeviceMainBehavior.state_enum.in_mission && globals.file_transfer_allowed == 0)
		{
			return;
		}
		JSONObject jsonobject = data.drill_to(new object[]
		{
			"error",
			"responseStatusCode"
		});
		if (jsonobject && jsonobject.str == "401")
		{
			this.relogin(null);
			return;
		}
		jsonobject = data.drill_to(new object[]
		{
			"error",
			"serviceError",
			"code"
		});
		if (jsonobject && jsonobject.str == "DEVICE_OWNER_MISMATCH")
		{
			this.register_fail_contact_customer_care(null);
		}
		else
		{
			this.register_fail(null);
		}
	}

	// Token: 0x06000C9F RID: 3231 RVA: 0x0005BB24 File Offset: 0x00059D24
	public void register_no_action_callback(JSONObject data = null)
	{
		DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "sync_button_no_action");
		this.go_to_previous_screen();
	}

	// Token: 0x06000CA0 RID: 3232 RVA: 0x0005BB44 File Offset: 0x00059D44
	public void relogin(JSONObject data = null)
	{
		PopupAlert.Show(string.Empty, "Registration Fail, Please try to Login again", "OK", GameObject.Find("UI Root"), new EventDelegate.Callback(this.go_to_login_screen), 1f);
		DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "regitration_fail");
	}

	// Token: 0x06000CA1 RID: 3233 RVA: 0x0005BB98 File Offset: 0x00059D98
	public void register_fail(JSONObject data = null)
	{
		PopupAlert.Show(string.Empty, "Registration Fail, Please try again", "OK", GameObject.Find("UI Root"), new EventDelegate.Callback(this.go_to_previous_screen), 1f);
		DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "regitration_fail");
	}

	// Token: 0x06000CA2 RID: 3234 RVA: 0x0005BBEC File Offset: 0x00059DEC
	public void register_decryption_fail(JSONObject data = null)
	{
		PopupAlert.Show(string.Empty, "Registration Fail, Please try again", "OK", GameObject.Find("UI Root"), new EventDelegate.Callback(this.go_to_previous_screen), 1f);
		DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "regitration_fail_key_decryption");
	}

	// Token: 0x06000CA3 RID: 3235 RVA: 0x0005BC40 File Offset: 0x00059E40
	public void register_fail_alReady_registred(JSONObject data = null)
	{
		PopupAlert.Show(string.Empty, "Device is already registered.", "OK", GameObject.Find("UI Root"), new EventDelegate.Callback(this.go_to_previous_screen), 1f);
		DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "regitration_fail_another_guest");
	}

	// Token: 0x06000CA4 RID: 3236 RVA: 0x0005BC94 File Offset: 0x00059E94
	public void register_fail_contact_customer_care(JSONObject data = null)
	{
	}

	// Token: 0x06000CA5 RID: 3237 RVA: 0x0005BC98 File Offset: 0x00059E98
	public void joined_callback(JSONObject data = null)
	{
		globals.debug("Device Joined");
		this._joined = true;
		DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.START, string.Empty);
	}

	// Token: 0x06000CA6 RID: 3238 RVA: 0x0005BCCC File Offset: 0x00059ECC
	public void register_wrong_code_callback(JSONObject data = null)
	{
		this._sync_try_again = true;
	}

	// Token: 0x06000CA7 RID: 3239 RVA: 0x0005BCD8 File Offset: 0x00059ED8
	public void sync_button_pressed_callback(JSONObject data = null)
	{
		this._sync_button_pressed = true;
	}

	// Token: 0x06000CA8 RID: 3240 RVA: 0x0005BCE4 File Offset: 0x00059EE4
	public void wrong_code_callback(JSONObject data = null)
	{
		this._wrong_code_entered = true;
	}

	// Token: 0x06000CA9 RID: 3241 RVA: 0x0005BCF0 File Offset: 0x00059EF0
	public void register_success_callback(JSONObject data = null)
	{
		this._register_success = true;
	}

	// Token: 0x06000CAA RID: 3242 RVA: 0x0005BCFC File Offset: 0x00059EFC
	private void go_to_previous_screen()
	{
		globals.debug("disconnectFromDevice being called -disconnectFromDevice");
		globals.BLE_manager.disconnectFromDevice();
		globals.FTUE_manager.set_state(this.prev_state, false);
		DMOManager.LogNavigation("DeviceLookUp", "RegistrationDeviceUI", "RegistrationUIPage", null);
	}

	// Token: 0x06000CAB RID: 3243 RVA: 0x0005BD44 File Offset: 0x00059F44
	private void go_to_login_screen()
	{
		globals.debug("disconnectFromDevice being called -disconnectFromDevice - go_to_login_screen");
		globals.BLE_manager.disconnectFromDevice();
		globals.logout();
		globals.FTUE_manager.login();
		DMOManager.LogNavigation("LoginScreen", "RegistrationDeviceUI", "RegistrationUIPage", null);
	}

	// Token: 0x06000CAC RID: 3244 RVA: 0x0005BD8C File Offset: 0x00059F8C
	private void update_awaiting_code()
	{
		string text = this.code_panel.current_code_string();
		if (!string.IsNullOrEmpty(text))
		{
			globals.BLE_manager.SendEnterKeyMask(globals.BLE_manager.connectedDevice, text);
			this.code_panel.reset();
		}
		else if (this._sync_try_again)
		{
			this._sync_try_again = false;
			if (globals.file_transfer_allowed < 0)
			{
				this.state = RegisterDeviceMainBehavior.state_enum.fail;
				globals.show_localized_OK_alert("REGISTER FAIL HEADER", "REGISTER FAIL BODY", new EventDelegate.Callback(this.go_to_previous_screen));
				DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "connection_lost");
			}
			else
			{
				this.state = RegisterDeviceMainBehavior.state_enum.awaiting_code;
				globals.show_localized_OK_alert("REGISTER FAIL HEADER", "REGISTER FAIL BODY", null);
				DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "register_wrong_code");
			}
		}
		else if (this._register_success)
		{
			if (this._previously_registered)
			{
				this.state = RegisterDeviceMainBehavior.state_enum.restore;
			}
			else
			{
				this.state = RegisterDeviceMainBehavior.state_enum.success;
			}
			globals.BLE_manager.mEntileContentContentAvailable.Clear();
			globals.BLE_manager.fetchContentList();
			DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.SUCCESS, string.Empty);
		}
		else if (this._wrong_code_entered)
		{
			this._wrong_code_entered = false;
			globals.debug("code timed out. returning to gear detected scene");
			this._joined = true;
			this.state = RegisterDeviceMainBehavior.state_enum.joining;
			DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "register_wrong_code");
		}
		else if (!globals.network_manager.connected())
		{
			this.state = RegisterDeviceMainBehavior.state_enum.no_internet;
			DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "no_internet");
		}
	}

	// Token: 0x06000CAD RID: 3245 RVA: 0x0005BF2C File Offset: 0x0005A12C
	private void Update()
	{
		if (this.back_button.hit || Input.GetKeyDown(27))
		{
			DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.CANCEL, string.Empty);
			this.go_to_previous_screen();
		}
		this.connect_timeout -= Time.deltaTime;
		if (this.connect_timeout < 0f && globals.BLE_manager.connectedDevice < 0 && !this._register_success)
		{
			DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "connection_timeout");
			this.go_to_previous_screen();
		}
		switch (this.state)
		{
		case RegisterDeviceMainBehavior.state_enum.connecting:
			if (globals.file_transfer_allowed == 0)
			{
				this.state = RegisterDeviceMainBehavior.state_enum.in_mission;
				DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "no_internet");
			}
			else if (globals.BLE_manager.connectedDevice > -1)
			{
				List<int> list = new List<int>(globals.player_data.device_ids());
				this._previously_registered = list.Contains(globals.BLE_manager.connectedDevice);
				this._device_id = globals.BLE_manager.connectedDevice;
				this.set_connected_device_texture();
				this.state = RegisterDeviceMainBehavior.state_enum.joining;
			}
			break;
		case RegisterDeviceMainBehavior.state_enum.in_mission:
			if (globals.file_transfer_allowed > 0)
			{
				DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "in_mission");
				this.state = RegisterDeviceMainBehavior.state_enum.connecting;
			}
			break;
		case RegisterDeviceMainBehavior.state_enum.joining:
			if (globals.file_transfer_allowed == 0)
			{
				this.state = RegisterDeviceMainBehavior.state_enum.in_mission;
				DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "in_mission");
			}
			else if (!globals.network_manager.connected())
			{
				this.state = RegisterDeviceMainBehavior.state_enum.no_internet;
				DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "no_internet");
			}
			else if (this._joined)
			{
				globals.BLE_manager.RequestNegotiateSessionKey(globals.BLE_manager.connectedDevice);
				this.state = RegisterDeviceMainBehavior.state_enum.awaiting_sync;
			}
			break;
		case RegisterDeviceMainBehavior.state_enum.awaiting_sync:
			if (globals.file_transfer_allowed < 1)
			{
				this.state = RegisterDeviceMainBehavior.state_enum.in_mission;
				DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "in_mission");
			}
			else if (!globals.network_manager.connected())
			{
				this.state = RegisterDeviceMainBehavior.state_enum.no_internet;
				DMOManager.LogToyRegistration(globals.FTUE_manager.register_device_id, DMOManager.REGISTRATION_PROGRESS.ERROR, "no_internet");
			}
			else if (this._sync_button_pressed)
			{
				this._sync_button_pressed = false;
				this.state = RegisterDeviceMainBehavior.state_enum.awaiting_code;
			}
			break;
		case RegisterDeviceMainBehavior.state_enum.awaiting_code:
			this.update_awaiting_code();
			break;
		case RegisterDeviceMainBehavior.state_enum.success:
			if (this.next_button.hit)
			{
				globals.FTUE_manager.set_state(this.next_state, true);
			}
			break;
		case RegisterDeviceMainBehavior.state_enum.restore:
			if (this.restore_button.hit)
			{
				globals.FTUE_manager.set_state(this.next_state, true);
			}
			else if (this.erase_button.hit)
			{
				globals.player_data.clear_device_progress(this._device_id);
				globals.player_data.setPrimaryDevice(this._device_id);
				globals.player_data.saveData(true, false);
				globals.FTUE_manager.set_state(this.next_state, true);
			}
			break;
		case RegisterDeviceMainBehavior.state_enum.no_internet:
			if (globals.network_manager.connected())
			{
				this.state = RegisterDeviceMainBehavior.state_enum.connecting;
			}
			break;
		}
		this.update_ui();
	}

	// Token: 0x06000CAE RID: 3246 RVA: 0x0005C278 File Offset: 0x0005A478
	private void update_ui()
	{
		this.connecting_indicator.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.connecting);
		this.joining_indicator.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.joining);
		this.repulsor_sync_button_highlight.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.awaiting_sync);
		this.gamma_sync_button_highlight.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.awaiting_sync);
		this.sync_instructions.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.awaiting_sync);
		this.code_panel.gameObject.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.awaiting_code);
		this.in_mission_indicator.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.in_mission);
		this.no_internet_indicator.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.no_internet);
		this.success_panel.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.success);
		this.restore_panel.SetActive(this.state == RegisterDeviceMainBehavior.state_enum.restore);
		this.state_label.text = this.state.ToString();
	}

	// Token: 0x06000CAF RID: 3247 RVA: 0x0005C370 File Offset: 0x0005A570
	private void set_connected_device_texture()
	{
		if (globals.BLE_manager.connectedDevice_data)
		{
			this.repulsor_texture.gameObject.SetActive(globals.BLE_manager.connectedDevice_data.deviceType == Constants.PlaymationDeviceType.DEVICE_REPULSOR);
			this.gamma_texture.gameObject.SetActive(globals.BLE_manager.connectedDevice_data.deviceType == Constants.PlaymationDeviceType.DEVICE_HULKHAND);
		}
		else
		{
			this.repulsor_texture.gameObject.SetActive(false);
			this.gamma_texture.gameObject.SetActive(false);
		}
	}

	// Token: 0x04000C74 RID: 3188
	public RegisterDeviceMainBehavior.state_enum state;

	// Token: 0x04000C75 RID: 3189
	public GameObject repulsor_sync_button_highlight;

	// Token: 0x04000C76 RID: 3190
	public GameObject gamma_sync_button_highlight;

	// Token: 0x04000C77 RID: 3191
	public GameObject sync_instructions;

	// Token: 0x04000C78 RID: 3192
	public RegisterCodePanelBehavior code_panel;

	// Token: 0x04000C79 RID: 3193
	public buttonBehavior back_button;

	// Token: 0x04000C7A RID: 3194
	public UITexture repulsor_texture;

	// Token: 0x04000C7B RID: 3195
	public UITexture gamma_texture;

	// Token: 0x04000C7C RID: 3196
	public GameObject connecting_indicator;

	// Token: 0x04000C7D RID: 3197
	public GameObject joining_indicator;

	// Token: 0x04000C7E RID: 3198
	public GameObject in_mission_indicator;

	// Token: 0x04000C7F RID: 3199
	public GameObject no_internet_indicator;

	// Token: 0x04000C80 RID: 3200
	public UILabel state_label;

	// Token: 0x04000C81 RID: 3201
	public GameObject success_panel;

	// Token: 0x04000C82 RID: 3202
	public buttonBehavior next_button;

	// Token: 0x04000C83 RID: 3203
	public GameObject restore_panel;

	// Token: 0x04000C84 RID: 3204
	public buttonBehavior restore_button;

	// Token: 0x04000C85 RID: 3205
	public buttonBehavior erase_button;

	// Token: 0x04000C86 RID: 3206
	public float connect_timeout = 30f;

	// Token: 0x04000C87 RID: 3207
	public string prev_state = "gear detected";

	// Token: 0x04000C88 RID: 3208
	public string next_state = "done";

	// Token: 0x04000C89 RID: 3209
	private bool _joined;

	// Token: 0x04000C8A RID: 3210
	private bool _sync_button_pressed;

	// Token: 0x04000C8B RID: 3211
	private bool _wrong_code_entered;

	// Token: 0x04000C8C RID: 3212
	private bool _register_success;

	// Token: 0x04000C8D RID: 3213
	private bool _sync_try_again;

	// Token: 0x04000C8E RID: 3214
	private bool _previously_registered;

	// Token: 0x04000C8F RID: 3215
	private int _device_id = -1;

	// Token: 0x020001A6 RID: 422
	public enum state_enum
	{
		// Token: 0x04000C91 RID: 3217
		connecting,
		// Token: 0x04000C92 RID: 3218
		in_mission,
		// Token: 0x04000C93 RID: 3219
		joining,
		// Token: 0x04000C94 RID: 3220
		awaiting_sync,
		// Token: 0x04000C95 RID: 3221
		awaiting_code,
		// Token: 0x04000C96 RID: 3222
		code_entered,
		// Token: 0x04000C97 RID: 3223
		success,
		// Token: 0x04000C98 RID: 3224
		restore,
		// Token: 0x04000C99 RID: 3225
		no_internet,
		// Token: 0x04000C9A RID: 3226
		fail
	}
}
