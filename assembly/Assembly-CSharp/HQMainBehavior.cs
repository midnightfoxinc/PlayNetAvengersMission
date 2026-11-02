using System;
using UnityEngine;

// Token: 0x020002E7 RID: 743
public class HQMainBehavior : CallbackMonoBehavior
{
	// Token: 0x17000231 RID: 561
	// (get) Token: 0x06001384 RID: 4996 RVA: 0x0008C3F8 File Offset: 0x0008A5F8
	// (set) Token: 0x06001385 RID: 4997 RVA: 0x0008C408 File Offset: 0x0008A608
	private bool _tour_done
	{
		get
		{
			return PlayerPrefs.GetInt("tour_done", 0) > 0;
		}
		set
		{
			PlayerPrefs.SetInt("tour_done", (!value) ? 0 : 1);
		}
	}

	// Token: 0x06001386 RID: 4998 RVA: 0x0008C424 File Offset: 0x0008A624
	public void set_state(hq_menu_state_enum s)
	{
		if (this.menu_state == s)
		{
			return;
		}
		if (this.main_panel)
		{
			this.main_panel.SetActive(s == hq_menu_state_enum.main);
		}
		if (this.database_panel)
		{
			this.database_panel.show(s == hq_menu_state_enum.database);
		}
		if (this.profile_panel)
		{
			this.profile_panel.show(s == hq_menu_state_enum.profile);
		}
		if (this.settings_panel)
		{
			this.settings_panel.show(s == hq_menu_state_enum.settings);
		}
		if (this.textdump_panel)
		{
			this.textdump_panel.show(s == hq_menu_state_enum.textdump);
		}
		if (this.progress_report_panel)
		{
			this.progress_report_panel.show(s == hq_menu_state_enum.progress_report);
		}
		if (s != hq_menu_state_enum.textdump && s != hq_menu_state_enum.main)
		{
			DMOManager.LogNavigation(this.state_to_string[(int)s], "HQ_Menu_UI", NavigationManager.hq_scene, null);
		}
		if (globals.gear_daisy)
		{
			globals.gear_daisy.open(false, true);
		}
		this.menu_state = s;
	}

	// Token: 0x06001387 RID: 4999 RVA: 0x0008C540 File Offset: 0x0008A740
	private void Start()
	{
		globals.retinalScan = false;
		globals.hq_main = this;
		this.menu_state = hq_menu_state_enum.settings;
		if (globals.blast_doors || globals.armory_lobby)
		{
			this.set_state(hq_menu_state_enum.blastdoors);
		}
		else
		{
			this.set_state(hq_menu_state_enum.main);
		}
		this.textdump_button.gameObject.SetActive(globals.build_type == build_type_enum.development);
		this.detect_button.gameObject.SetActive(globals.build_type == build_type_enum.development);
		if (globals.build_type == build_type_enum.field_test)
		{
			this.store_button.gameObject.SetActive(false);
		}
		globals.music_jukebox.change_music(this.music, 0.25f);
		this.profile_button.label.gameObject.SetActive(false);
		this.database_button.label.gameObject.SetActive(false);
		this.store_button.label.gameObject.SetActive(false);
		this.armory_button.label.gameObject.SetActive(false);
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DISABLED, new BLEManager.DataReceivedDelegate(this.blueToothWarning));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_CONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceConnect));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.CONTENT_PRESENT, new BLEManager.DataReceivedDelegate(this.verifyUnlockLocation));
		if (!globals.bleInitiated)
		{
			base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_SETUP, new BLEManager.DataReceivedDelegate(this.onSDKReady));
		}
		else
		{
			this.onSDKReady(null);
		}
		globals.autoConnect = true;
		AchievementEvents.inst.Equals(null);
		globals.FTUE_manager.done = true;
		if (!this._tour_done)
		{
			this.start_tour();
		}
		MissionManager.getInstance().init();
	}

	// Token: 0x06001388 RID: 5000 RVA: 0x0008C6FC File Offset: 0x0008A8FC
	public void start_tour()
	{
		if (!this.ftue_tour_group)
		{
			return;
		}
		this.set_state(hq_menu_state_enum.main);
		this.ftue_tour_group.gameObject.SetActive(true);
		globals.current_tour = this.ftue_tour_group;
		this._touring = true;
	}

	// Token: 0x06001389 RID: 5001 RVA: 0x0008C744 File Offset: 0x0008A944
	public void onSDKReady(JSONObject data = null)
	{
		int primaryDevice = globals.player_data.getPrimaryDevice();
		globals.debug(string.Concat(new object[]
		{
			"+++ onSDKReady",
			primaryDevice,
			":",
			globals.player_data.isDeviceRegistered(primaryDevice)
		}));
		if (globals.BLE_manager.connectedDevice == -1 && globals.player_data.isDeviceRegistered(primaryDevice) && globals.BLE_manager.devicesSeen.ContainsKey(primaryDevice) && globals.BLE_manager.isDeviceRegistered(primaryDevice))
		{
			globals.BLE_manager.connectToDevice(primaryDevice);
		}
		if (globals.player_data.getPrimaryDevice() > 0)
		{
			globals.BLE_manager.isBluetoothRadioOn();
		}
		globals.BLE_manager.getSDKVersion();
	}

	// Token: 0x0600138A RID: 5002 RVA: 0x0008C80C File Offset: 0x0008AA0C
	private void onDeviceConnect(JSONObject data)
	{
		globals.BLE_manager.sendPlayerData(-1);
	}

	// Token: 0x0600138B RID: 5003 RVA: 0x0008C81C File Offset: 0x0008AA1C
	public void blueToothWarning(JSONObject data)
	{
		ConfirmationPopupAlert.Show(Localization.Get("BLUETOOTH_WARNING_LABEL"), Localization.Get("BLUETOOTH_WARNING"), Localization.Get("CANCEL"), Localization.Get("OKAY"), GameObject.Find("UI Root"), null, new EventDelegate.Callback(this.onBLEEnable));
	}

	// Token: 0x0600138C RID: 5004 RVA: 0x0008C870 File Offset: 0x0008AA70
	private void onBLEEnable()
	{
		globals.BLE_manager.bluetoothPopup();
	}

	// Token: 0x0600138D RID: 5005 RVA: 0x0008C87C File Offset: 0x0008AA7C
	private void load_scene(string s)
	{
		DMOManager.LogNavigation(s, "HQ_Menu_UI", NavigationManager.hq_scene, null);
		NavigationManager.load_scene(s);
	}

	// Token: 0x0600138E RID: 5006 RVA: 0x0008C898 File Offset: 0x0008AA98
	private void parse_quit_event(string s)
	{
		EtceteraAndroidManager.alertButtonClickedEvent -= new Action<string>(this.parse_quit_event);
		if (s == this._quit_positive)
		{
			globals.debug("quitting");
			Application.Quit();
		}
	}

	// Token: 0x0600138F RID: 5007 RVA: 0x0008C8CC File Offset: 0x0008AACC
	private void quit_with_confirm()
	{
		EtceteraAndroidManager.alertButtonClickedEvent += new Action<string>(this.parse_quit_event);
		EtceteraAndroid.showAlert(Localization.Get("QUIT HEADER"), Localization.Get("QUIT BODY"), this._quit_positive, this._quit_negative);
	}

	// Token: 0x06001390 RID: 5008 RVA: 0x0008C910 File Offset: 0x0008AB10
	private void verifyUnlockLocation(JSONObject data = null)
	{
		for (int i = 0; i < globals.location_data.item.Count; i++)
		{
			if (!globals.location_data.item[i].embedded && !globals.location_data.item[i].unlocked())
			{
				string id = globals.location_data.item[i].id;
				locationDataItemClass locationDataItemClass = globals.location_data.item_by_id(id);
				if (!locationDataItemClass)
				{
					globals.debugWarning("invalid location ID: " + id);
				}
				else
				{
					for (int j = 0; j < locationDataItemClass.missions.Count; j++)
					{
						if (globals.BLE_manager.connectedDevice_data.content_installed(locationDataItemClass.missions[j].entitlements))
						{
							globals.BLE_manager.sendUnlockEnvironment(id);
							globals.debug("Unlocking the Location " + id);
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x06001391 RID: 5009 RVA: 0x0008CA14 File Offset: 0x0008AC14
	private void Update()
	{
		if (this.time_label)
		{
			int num = (int)(Time.realtimeSinceStartup / 3600f);
			int num2 = (int)(Time.realtimeSinceStartup / 60f) % 60;
			float num3 = Time.realtimeSinceStartup % 60f;
			this.time_label.text = string.Concat(new string[]
			{
				num.ToString("00"),
				":",
				num2.ToString("00"),
				":",
				num3.ToString("00.00")
			});
		}
		if (Input.GetMouseButtonUp(0) && globals.selectedObject == this.globe.globe_collider.gameObject)
		{
			globals.location_id = null;
			globals.sfx_master.play(this.click_globe_SFX, null);
			this.load_scene(NavigationManager.gtm_scene);
			base.enabled = false;
		}
		else if (this.database_button.clicked)
		{
			this.set_state(hq_menu_state_enum.database);
		}
		else if (this.armory_button.clicked)
		{
			globals.ability_to_test = null;
			this.load_scene(NavigationManager.armory_lobby_scene);
			base.enabled = false;
		}
		else if (this.store_button.clicked)
		{
			if (globals.environment_manager.enableStore)
			{
				globals.store_item_id = null;
				this.load_scene(NavigationManager.store_scene);
				base.enabled = false;
				return;
			}
			DMOManager.LogNavigation(NavigationManager.store_scene, "HQ_Menu_UI", NavigationManager.hq_scene, null);
			globals.URL_roster.show_retailer_loc();
		}
		else if (this.profile_button.clicked)
		{
			if (globals.build_type == build_type_enum.no_gear_demo)
			{
				this.set_state(hq_menu_state_enum.profile);
			}
			else if (this.menu_state == hq_menu_state_enum.profile)
			{
				this.set_state(hq_menu_state_enum.main);
			}
			else if (globals.player_data.isGuestLogin())
			{
				globals.login();
			}
			else
			{
				this.set_state(hq_menu_state_enum.profile);
			}
		}
		else if (this.settings_button.clicked)
		{
			this.set_state(hq_menu_state_enum.settings);
		}
		else if (this.textdump_button && this.textdump_button.clicked)
		{
			this.set_state(hq_menu_state_enum.textdump);
		}
		else if (this.detect_button && this.detect_button.clicked)
		{
			globals.FTUE_manager.set_state(FTUEManagerBehavior.FTUE_state_enum.gear_detected, false);
		}
		if (this.menu_state == hq_menu_state_enum.main)
		{
			this.armory_button.label.gameObject.SetActive(globals.new_abilities.Count > 0);
			this.armory_button.label.text = globals.new_abilities.Count.ToString();
			this.database_button.label.gameObject.SetActive(globals.new_sf_level.Count > 0);
			this.database_button.label.text = globals.new_sf_level.Count.ToString();
			if (this.progress_report_panel.show_check())
			{
				this.set_state(hq_menu_state_enum.progress_report);
			}
		}
		else if (this.menu_state == hq_menu_state_enum.blastdoors && !globals.blast_doors && !globals.armory_lobby)
		{
			this.set_state(hq_menu_state_enum.main);
		}
		if (this.menu_state != hq_menu_state_enum.main)
		{
			this.bg_panel.gameObject.SetLayerRecursively(this.blur_camera.gameObject.layer);
			if (globals.gear_daisy)
			{
				globals.gear_daisy.gameObject.SetLayerRecursively(this.blur_camera.gameObject.layer);
			}
		}
		else if (globals.gear_daisy && globals.gear_daisy.submenu_open())
		{
			this.bg_panel.gameObject.SetLayerRecursively(this.blur_camera.gameObject.layer);
			globals.gear_daisy.gameObject.SetLayerRecursively(this.ui_camera.gameObject.layer);
		}
		else if (globals.scavenger_hunt_manager.panel && globals.scavenger_hunt_manager.panel.showing())
		{
			this.bg_panel.gameObject.SetLayerRecursively(this.blur_camera.gameObject.layer);
			if (globals.gear_daisy)
			{
				globals.gear_daisy.gameObject.SetLayerRecursively(this.ui_camera.gameObject.layer);
			}
		}
		else
		{
			this.bg_panel.gameObject.SetLayerRecursively(this.ui_camera.gameObject.layer);
			if (globals.gear_daisy)
			{
				globals.gear_daisy.gameObject.SetLayerRecursively(this.ui_camera.gameObject.layer);
			}
		}
		if (globals.player_data.isGuestLogin())
		{
			this.profile_button.sprite.spriteName = this.profile_icon_prefix + "0";
			this.profile_button.disabled = true;
		}
		else
		{
			this.profile_button.sprite.spriteName = this.profile_icon_prefix + globals.player_data.avatar;
			this.profile_button.disabled = false;
		}
		if (this._touring && !this.ftue_tour_group.gameObject.activeInHierarchy)
		{
			this._tour_done = true;
			NavigationManager.reload_current_scene();
		}
		if (Input.GetKeyDown(27))
		{
			if (globals.close_top_panel())
			{
				globals.debug("top panel closed");
			}
			else if (this.menu_state != hq_menu_state_enum.main)
			{
				globals.debug("setting state back to main from " + this.menu_state.ToString());
				this.set_state(hq_menu_state_enum.main);
			}
			else
			{
				this.quit_with_confirm();
			}
		}
	}

	// Token: 0x04001528 RID: 5416
	public string[] state_to_string = new string[]
	{
		NavigationManager.hq_scene,
		NavigationManager.database_panel,
		NavigationManager.profile_panel,
		NavigationManager.settings_panel,
		"blastdoors",
		"textdump",
		NavigationManager.progress_report_panel
	};

	// Token: 0x04001529 RID: 5417
	public UIPanel bg_panel;

	// Token: 0x0400152A RID: 5418
	public GameObject main_panel;

	// Token: 0x0400152B RID: 5419
	public DatabasePanelBehavior database_panel;

	// Token: 0x0400152C RID: 5420
	public ProfilePanelBehavior profile_panel;

	// Token: 0x0400152D RID: 5421
	public SettingsPanelBehavior settings_panel;

	// Token: 0x0400152E RID: 5422
	public TextDumpPanelBehavior textdump_panel;

	// Token: 0x0400152F RID: 5423
	public ProgressReportPanelBehavior progress_report_panel;

	// Token: 0x04001530 RID: 5424
	public TourGroup ftue_tour_group;

	// Token: 0x04001531 RID: 5425
	public hq_menu_state_enum menu_state;

	// Token: 0x04001532 RID: 5426
	public HQGlobeBehavior globe;

	// Token: 0x04001533 RID: 5427
	public LabelledButtonBehavior profile_button;

	// Token: 0x04001534 RID: 5428
	public LabelledButtonBehavior database_button;

	// Token: 0x04001535 RID: 5429
	public LabelledButtonBehavior armory_button;

	// Token: 0x04001536 RID: 5430
	public LabelledButtonBehavior store_button;

	// Token: 0x04001537 RID: 5431
	public buttonBehavior settings_button;

	// Token: 0x04001538 RID: 5432
	public buttonBehavior textdump_button;

	// Token: 0x04001539 RID: 5433
	public buttonBehavior detect_button;

	// Token: 0x0400153A RID: 5434
	public UILabel time_label;

	// Token: 0x0400153B RID: 5435
	public string music = string.Empty;

	// Token: 0x0400153C RID: 5436
	public string click_forward_sfx = "click forward";

	// Token: 0x0400153D RID: 5437
	public string click_back_sfx = "click back";

	// Token: 0x0400153E RID: 5438
	public string click_globe_SFX = "SFX_Locationselect";

	// Token: 0x0400153F RID: 5439
	public Camera ui_camera;

	// Token: 0x04001540 RID: 5440
	public Camera blur_camera;

	// Token: 0x04001541 RID: 5441
	public UITweener blackout_tween;

	// Token: 0x04001542 RID: 5442
	public string profile_icon_prefix = "avatar_icon_";

	// Token: 0x04001543 RID: 5443
	public simulator sim;

	// Token: 0x04001544 RID: 5444
	private bool _touring;

	// Token: 0x04001545 RID: 5445
	private string _quit_positive = "Quit";

	// Token: 0x04001546 RID: 5446
	private string _quit_negative = "Cancel";
}
