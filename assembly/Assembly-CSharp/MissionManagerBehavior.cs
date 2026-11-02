using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000290 RID: 656
public class MissionManagerBehavior : GearDaisySubmenuBehavior
{
	// Token: 0x06001198 RID: 4504 RVA: 0x0007D8A4 File Offset: 0x0007BAA4
	private void Start()
	{
		this.init();
	}

	// Token: 0x06001199 RID: 4505 RVA: 0x0007D8AC File Offset: 0x0007BAAC
	private void init()
	{
		if (this._initialized)
		{
			return;
		}
		this._initialized = true;
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.DEVICECONTENTLIST_SUCCESS, new BLEManager.DataReceivedDelegate(this.OnDeviceContentReceived));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.CONTENT_DELETED, new BLEManager.DataReceivedDelegate(this.onConentDeleted));
		this.location_scroll_view.panel.bottomAnchor.target = NGUITools.GetRoot(base.gameObject).transform;
		while (this.location.Count < globals.location_data.item.Count)
		{
			MissionManagerLocationBehavior missionManagerLocationBehavior = this.location[0].CopyInPlace() as MissionManagerLocationBehavior;
			missionManagerLocationBehavior.name = "location option " + this.location.Count.ToString();
			this.location.Add(missionManagerLocationBehavior);
		}
		for (int i = 0; i < this.location.Count; i++)
		{
			this.location[i].mission_manager = this;
			if (i < globals.location_data.item.Count)
			{
				this.location[i].gameObject.SetActive(this.show_location(globals.location_data.item[i]));
				this.location[i].data = globals.location_data.item[i];
				if (!this.location[i].data.embedded)
				{
					if (this.location[i].gameObject.activeSelf)
					{
						this._selected_location = i;
					}
					this.location[i].gameObject.transform.SetAsFirstSibling();
				}
			}
			else
			{
				this.location[i].gameObject.SetActive(false);
			}
			this.location[i].set_color();
		}
		this.store_option_go.transform.SetAsLastSibling();
		this.select_location(-1);
		this.location_grid.Reposition();
		this.location_scroll_view.ResetPosition();
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_CONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceConnect));
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.CONTENT_PRESENT, new BLEManager.DataReceivedDelegate(this.onDeviceConnect));
	}

	// Token: 0x0600119A RID: 4506 RVA: 0x0007DB04 File Offset: 0x0007BD04
	private void onDeviceConnect(JSONObject data)
	{
		this.refresh_display();
	}

	// Token: 0x0600119B RID: 4507 RVA: 0x0007DB0C File Offset: 0x0007BD0C
	public void onConentDeleted(JSONObject data)
	{
		PopupAlert.Show(string.Empty, Localization.Get("CONTENT_DELETED"), Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, new EventDelegate.Callback(this.onDelete), 1f);
	}

	// Token: 0x0600119C RID: 4508 RVA: 0x0007DB5C File Offset: 0x0007BD5C
	private void onDelete()
	{
		this.show(false);
	}

	// Token: 0x0600119D RID: 4509 RVA: 0x0007DB68 File Offset: 0x0007BD68
	public bool show_location(locationDataItemClass ldic)
	{
		return ldic.id == "VC" || ldic.embedded || (ldic.requires_purchase() && MissionManager.getInstance().isLocationEntitled(ldic.id)) || (!MissionManager.getInstance().canBuyItInTheStore(ldic.id) && (globals.player_data.has_unlock(ldic.id) || ldic.requires == string.Empty));
	}

	// Token: 0x0600119E RID: 4510 RVA: 0x0007DBF8 File Offset: 0x0007BDF8
	public override void show(bool b)
	{
		if (base.gameObject.activeSelf == b)
		{
			return;
		}
		base.gameObject.SetActive(b);
		if (b)
		{
			this.init();
			this.refresh_display();
			globals.gear_daisy.open(false, false);
			globals.add_hide_scav_key("mission_manager");
			this.overall_progress.set_percentage(0);
			this.piece_progress.set_percentage(0);
		}
		else
		{
			globals.remove_hide_scav_key("mission_manager");
		}
	}

	// Token: 0x0600119F RID: 4511 RVA: 0x0007DC74 File Offset: 0x0007BE74
	private void refresh_display()
	{
		if (!globals.BLE_manager.connectedDevice_data)
		{
			this.show(false);
			return;
		}
		this._maxSpots = 10;
		if (globals.BLE_manager.connectedDevice_data.deviceType == Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			this._maxSpots = 8;
		}
		else if (globals.BLE_manager.connectedDevice_data.deviceType != Constants.PlaymationDeviceType.DEVICE_REPULSOR)
		{
		}
		this._maxSpots = Mathf.Min(this.storage_dots.Count, this._maxSpots);
		this._spotsFilled = 0;
		this._spotsFilling = 0;
		for (int i = 0; i < this.location.Count; i++)
		{
			if (!this.location[i].data.embedded)
			{
				if (MissionManager.getInstance().isLocationUnderInstall(this.location[i].data.id))
				{
					this._spotsFilling += this.location[i].data.memory_slots;
				}
				else if (MissionManager.getInstance().isLocationPartiallyInstalled(this.location[i].data.id))
				{
					this._spotsFilled += this.location[i].data.memory_slots;
				}
			}
			this.location[i].gameObject.SetActive(this.show_location(this.location[i].data));
			this.location[i].refresh();
		}
		this.select_location(-1);
		int num = this._spotsFilled + this._spotsFilling;
		int j;
		for (j = 0; j < this.storage_dots.Count; j++)
		{
			this.storage_dots[j].gameObject.SetActive(true);
		}
		j = 0;
		while (j < this._spotsFilled && j < this._maxSpots)
		{
			this.storage_dots[j].set_memory_filled(true);
			j++;
		}
		while (j < num && j < this._maxSpots)
		{
			this.storage_dots[j].animate_dot();
			j++;
		}
		int num2 = this._maxSpots - j;
		if (num2 == 1)
		{
			this.open_slot_lbl.text = "1 OPEN SLOT ON GEAR";
		}
		else if (num2 > 1)
		{
			this.open_slot_lbl.text = num2.ToString() + " OPEN SLOTS ON GEAR";
		}
		else
		{
			this.open_slot_lbl.text = "NO OPEN SLOTS ON GEAR";
		}
		while (j < this._maxSpots)
		{
			this.storage_dots[j].set_memory_filled(false);
			j++;
		}
		while (j < this.storage_dots.Count)
		{
			this.storage_dots[j].gameObject.SetActive(false);
			j++;
		}
		this.storage_dots_grid.Reposition();
		this.location_grid.Reposition();
	}

	// Token: 0x060011A0 RID: 4512 RVA: 0x0007DF8C File Offset: 0x0007C18C
	protected void OnDeviceContentReceived(JSONObject obj)
	{
		this.select_location(-1);
		globals.textdump_string += "[ffff00]===Available Content:[-]\n";
		foreach (KeyValuePair<string, BLEManager.Mission> keyValuePair in globals.BLE_manager.availableContent)
		{
			globals.textdump_string = globals.textdump_string + " " + keyValuePair.Key + "\n";
		}
		globals.textdump_string += "[ffff00]===[-]\n";
	}

	// Token: 0x060011A1 RID: 4513 RVA: 0x0007E040 File Offset: 0x0007C240
	public void select_location_by_id(string id)
	{
		for (int i = 0; i < this.location.Count; i++)
		{
			if (this.location[i].data.id == id)
			{
				this.select_location(i);
				return;
			}
		}
	}

	// Token: 0x060011A2 RID: 4514 RVA: 0x0007E094 File Offset: 0x0007C294
	private void set_installing_state()
	{
		this.progress_container_go.SetActive(true);
		this.button[0].set_button(location_button_states_enum.MM_CANCEL, false);
		this._location_downloading = true;
	}

	// Token: 0x060011A3 RID: 4515 RVA: 0x0007E0C8 File Offset: 0x0007C2C8
	private void select_location(int n = -1)
	{
		if (n < 0)
		{
			n = this._selected_location;
		}
		else
		{
			this._selected_location = n;
		}
		for (int i = 0; i < this.location.Count; i++)
		{
			this.location[i].select(n == i);
		}
		this._location_downloading = false;
		locationDataItemClass data = this.location[n].data;
		this.location_texture.mainTexture = (Resources.Load("location bg/loc_bg_" + data.id) as Texture);
		this.location_title.text = data.name;
		for (int j = 0; j < this.button.Count; j++)
		{
			this.button[j].set_button(location_button_states_enum.MM_OFF, false);
		}
		this.progress_container_go.SetActive(false);
		List<string> downloadQueu = globals.player_data.getDownloadQueu(globals.player_data.getPrimaryDevice());
		bool disable = downloadQueu != null && downloadQueu.Count > 0;
		if (data.embedded)
		{
			this.location_slot_go.SetActive(false);
			this.on_gear_go.SetActive(true);
			UISprite component = this.on_gear_go.GetComponent<UISprite>();
			if (globals.player_data.latest_device_data && component)
			{
				if (globals.player_data.latest_device_data.type == 2111)
				{
					component.spriteName = "icon_2111";
				}
				else
				{
					component.spriteName = "icon_2101";
				}
			}
			this.button[0].set_button(location_button_states_enum.MM_GOTO, false);
		}
		else
		{
			this.on_gear_go.SetActive(false);
			this.location_slot_go.SetActive(true);
			for (int k = 0; k < this.location_slot_gos.Count; k++)
			{
				this.location_slot_gos[k].SetActive(k < data.memory_slots);
			}
			if (data.memory_slots == 1)
			{
				this.location_slot_lbl.text = "1 SLOT";
			}
			else if (data.memory_slots > 1)
			{
				this.location_slot_lbl.text = data.memory_slots.ToString() + " SLOTS";
			}
			else
			{
				this.location_slot_lbl.text = string.Empty;
			}
			if (Application.isEditor && this.fake_installing)
			{
				this.set_installing_state();
			}
			else if (MissionManager.getInstance().isLocationDownloadPending(data.id))
			{
				this.set_installing_state();
			}
			else if (MissionManager.getInstance().isLocationUnderInstall(data.id))
			{
				this.set_installing_state();
			}
			else if (MissionManager.getInstance().locationPartiallyOnGearAndCanRemove(data.id))
			{
				globals.debug("locationOnGearAndCanRemove " + data.id);
				this.button[0].set_button(location_button_states_enum.MM_REMOVE, disable);
				this.button[1].set_button(location_button_states_enum.MM_GOTO, false);
				if (this.location[this._selected_location].update_count_lbl.gameObject.activeSelf)
				{
					this.button[2].set_button(location_button_states_enum.MM_UPDATE, false);
				}
			}
			else if (data.memory_slots > this._maxSpots - this._spotsFilled - this._spotsFilling)
			{
				this.button[0].set_button(location_button_states_enum.MM_NO_ROOM, false);
			}
			else
			{
				this.button[0].set_button(location_button_states_enum.MM_ADD, false);
			}
		}
	}

	// Token: 0x060011A4 RID: 4516 RVA: 0x0007E460 File Offset: 0x0007C660
	public void open_to_location(string id, bool download = true)
	{
		if (globals.BLE_manager.connectedDevice < 0)
		{
			globals.show_OK_alert(Localization.Get("MISSING MISSION HEADER"), Localization.Get("DEVICE_DISCONNECTED_ALERT"), null);
		}
		else
		{
			this.select_location_by_id(id);
			if (download && !MissionManager.getInstance().isLocationInstalled(id))
			{
				this.confirm_location_install();
			}
		}
	}

	// Token: 0x060011A5 RID: 4517 RVA: 0x0007E4C0 File Offset: 0x0007C6C0
	private void update_location(string id)
	{
		if (globals.BLE_manager.connectedDevice == -1)
		{
			globals.show_OK_alert(Localization.Get("MISSING MISSION HEADER"), Localization.Get("DEVICE_DISCONNECTED_ALERT"), null);
		}
		else
		{
			this.select_location_by_id(id);
			MissionManager.getInstance().updateLocation(id);
		}
	}

	// Token: 0x060011A6 RID: 4518 RVA: 0x0007E510 File Offset: 0x0007C710
	protected override void Update()
	{
		base.Update();
		if (!this._dragging)
		{
			for (int i = 0; i < this.location.Count; i++)
			{
				if (this.location[i].clicked)
				{
					this.select_location(i);
				}
			}
		}
		if (this.button_link.transform.localPosition.y > this.frame_link.transform.localPosition.y)
		{
			this.link_line_up.SetActive(true);
			this.link_line_down.SetActive(false);
		}
		else
		{
			this.link_line_up.SetActive(false);
			this.link_line_down.SetActive(true);
		}
		for (int j = 0; j < this.button.Count; j++)
		{
			if (this.button[j].clicked && this.button[j].gameObject.activeInHierarchy)
			{
				this.clicked_button(this.button[j].button_state);
			}
		}
		if (this.store_btn.clicked)
		{
			if (NavigationManager.current_scene() == this.store_scene)
			{
				this.close_button.play_sfx();
				this.show(false);
			}
			else
			{
				NavigationManager.load_scene(this.store_scene);
			}
		}
		List<string> downloadQueu = globals.player_data.getDownloadQueu(globals.player_data.getPrimaryDevice());
		this.download_warning_banner_go.SetActive(downloadQueu != null && downloadQueu.Count > 0);
		if (this._location_downloading)
		{
			sLocationDownloadProgress sLocationDownloadProgress = MissionManager.getInstance().locationDownloadPercentage(this.location[this._selected_location].data.id);
			this.overall_progress.set_percentage((int)(sLocationDownloadProgress.overall_percentage * 100f));
			this.piece_progress.set_percentage((int)(sLocationDownloadProgress.piece_percentage * 100f));
			locationDataItemClass locationDataItemClass = globals.location_data.location_of_entitlement(sLocationDownloadProgress.currently_downloading);
			string text = string.Empty;
			if (locationDataItemClass)
			{
				if (locationDataItemClass.env_package == sLocationDownloadProgress.currently_downloading)
				{
					text = locationDataItemClass.name;
				}
				else
				{
					text = locationDataItemClass.mission_by_entitlement(sLocationDownloadProgress.currently_downloading).name;
				}
			}
			this.piece_progress.set_title(string.Concat(new string[]
			{
				(sLocationDownloadProgress.files_complete + 1).ToString(),
				"/",
				sLocationDownloadProgress.total_files.ToString(),
				" ",
				text
			}));
		}
		if (!Input.GetMouseButton(0))
		{
			this._dragging = false;
		}
		else if (this.location_scroll_view.isDragging)
		{
			this._dragging = true;
		}
	}

	// Token: 0x060011A7 RID: 4519 RVA: 0x0007E7EC File Offset: 0x0007C9EC
	private bool isMissionUnlocked(missionDataClass mdc)
	{
		bool result = true;
		if (!mdc.unlocked())
		{
			if (!mdc.location)
			{
				globals.debugWarning("Mission has no location, something's wrong!");
			}
			else if (!mdc.location.unlocked())
			{
				StoreItemDataClass storeItemDataClass = globals.store_data.item_by_id(mdc.location.requires, true);
				if (storeItemDataClass)
				{
					string body = Localization.Get("UNLOCK_LOCATION_BEFORE_DOWNLOAD").Replace("$LOCATION", mdc.location.name).Replace("$TOY", storeItemDataClass.name);
					globals.show_OK_alert(Localization.Get("MISSION LOCKED CTA"), body, null);
				}
				return false;
			}
		}
		return result;
	}

	// Token: 0x060011A8 RID: 4520 RVA: 0x0007E89C File Offset: 0x0007CA9C
	private bool isAnyOutstandingFirmwareOrPatch()
	{
		globals.debug(string.Concat(new object[]
		{
			"##### globals.mola_busy(true): ",
			globals.mola_busy(true),
			"     globals.isFirmwareUpdateAvailable: ",
			globals.isFirmwareUpdateAvailable,
			"    globals.BLE_manager.getAvailablePatchId (): ",
			globals.BLE_manager.getAvailablePatchId()
		}));
		if (globals.mola_downloading(true))
		{
			globals.show_OK_alert(string.Empty, Localization.Get("WAIT_TO_UPDATE_DONE"), null);
			return true;
		}
		if (globals.mola_transfer_not_allowed(true))
		{
			globals.show_OK_alert(string.Empty, Localization.Get("CONTENT_DOWNLOAD_NOTALLOWED_HP"), null);
			return true;
		}
		if (globals.isFirmwareUpdateAvailable || globals.BLE_manager.getAvailablePatchId() != null)
		{
			this.displayUpdateFirstMessage();
			return true;
		}
		return false;
	}

	// Token: 0x060011A9 RID: 4521 RVA: 0x0007E960 File Offset: 0x0007CB60
	private void displayUpdateFirstMessage()
	{
		if (globals.isFirmwareUpdateAvailable)
		{
			globals.show_confirm_alert(Localization.Get("UPDATE_REQ"), Localization.Get("PATCH_UPDATE_FIRST"), new EventDelegate.Callback(this.OnSkip), new EventDelegate.Callback(this.GoAheadAndinstallFirmware), Localization.Get("LATER"), Localization.Get("UPDATE"), true);
		}
		else if (globals.isFirmwareUptodate && globals.BLE_manager.getAvailablePatchId() != null)
		{
			globals.show_confirm_alert(Localization.Get("UPDATE_REQ"), Localization.Get("PATCH_UPDATE_FIRST"), new EventDelegate.Callback(this.OnSkip), new EventDelegate.Callback(this.GoAheadAndinstallPatch), Localization.Get("LATER"), Localization.Get("UPDATE"), true);
		}
		else if (!globals.isFirmwareUptodate && !globals.isFirmwareUpdateAvailable)
		{
			globals.show_OK_alert(Localization.Get("MISSING MISSION HEADER"), Localization.Get("PLEASE_REBOOT"), null);
		}
	}

	// Token: 0x060011AA RID: 4522 RVA: 0x0007EA54 File Offset: 0x0007CC54
	private void OnSkip()
	{
		globals.debug("Skiped Do nothing");
	}

	// Token: 0x060011AB RID: 4523 RVA: 0x0007EA60 File Offset: 0x0007CC60
	private void GoAheadAndinstallFirmware()
	{
		if (globals.gear_daisy)
		{
			globals.gear_daisy.open_firmware_resume_manager();
		}
		this.show(false);
	}

	// Token: 0x060011AC RID: 4524 RVA: 0x0007EA90 File Offset: 0x0007CC90
	private void GoAheadAndinstallPatch()
	{
		if (globals.gear_daisy)
		{
			globals.gear_daisy.open_patch_resume_manager();
		}
		this.show(false);
	}

	// Token: 0x060011AD RID: 4525 RVA: 0x0007EAC0 File Offset: 0x0007CCC0
	private void on_delete_location()
	{
		MissionManager.getInstance().unInstallLocation(this.location[this._selected_location].data.id);
		this.refresh_display();
	}

	// Token: 0x060011AE RID: 4526 RVA: 0x0007EAFC File Offset: 0x0007CCFC
	private void on_install()
	{
		MissionManager.getInstance().installLocation(this.location[this._selected_location].data.id);
		this.refresh_display();
	}

	// Token: 0x060011AF RID: 4527 RVA: 0x0007EB34 File Offset: 0x0007CD34
	private void on_update_location()
	{
		this.update_location(this.location[this._selected_location].data.id);
		this.refresh_display();
	}

	// Token: 0x060011B0 RID: 4528 RVA: 0x0007EB60 File Offset: 0x0007CD60
	private void on_cancel_install()
	{
		this.refresh_display();
		MissionManager.getInstance().cancelLocationDownload(this.location[this._selected_location].data.id);
	}

	// Token: 0x060011B1 RID: 4529 RVA: 0x0007EB98 File Offset: 0x0007CD98
	private void confirm_location_install()
	{
		if (!this.isAnyOutstandingFirmwareOrPatch())
		{
			List<string> downloadableContentList = MissionManager.getInstance().getDownloadableContentList(this.location[this._selected_location].data.id);
			int count = downloadableContentList.Count;
			globals.show_confirm_alert(Localization.Get("INSTALL_TITLE"), Localization.Get("INSTALL_MSG").Replace("$MINUTES", (count * 5).ToString()).Replace("$X", count.ToString()), new EventDelegate.Callback(this.on_install), null, Localization.Get("YES"), "CANCEL", false);
		}
	}

	// Token: 0x060011B2 RID: 4530 RVA: 0x0007EC3C File Offset: 0x0007CE3C
	private void clicked_button(location_button_states_enum state)
	{
		switch (state)
		{
		case location_button_states_enum.MM_ADD:
			this.confirm_location_install();
			break;
		case location_button_states_enum.MM_CANCEL:
			globals.show_confirm_alert(Localization.Get("CANCEL_INSTALL_TITLE"), Localization.Get("CANCEL_INSTALL_MSG").Replace("$LOCATION", this.location[this._selected_location].data.name), new EventDelegate.Callback(this.on_cancel_install), null, Localization.Get("YES"), "CANCEL", false);
			break;
		case location_button_states_enum.MM_REMOVE:
			if (globals.file_transfer_allowed > 0)
			{
				globals.show_confirm_alert(Localization.Get("UNINSTALL_TITLE"), Localization.Get("UNINSTALL_MSG").Replace("$LOCATION", this.location[this._selected_location].data.name), new EventDelegate.Callback(this.on_delete_location), null, Localization.Get("YES"), "CANCEL", false);
			}
			else
			{
				globals.show_localized_OK_alert("GEAR BUSY HEADER", "GEAR BUSY BODY", null);
			}
			break;
		case location_button_states_enum.MM_GOTO:
			globals.location_id = this.location[this._selected_location].data.id;
			DMOManager.LogNavigation(AnalyticsStrings.GetAnalyticsTranslationName(globals.location_id), "goto_btn", NavigationManager.mission_manager_panel, null);
			NavigationManager.load_scene(NavigationManager.location_scene);
			break;
		case location_button_states_enum.MM_UPDATE:
			if (!this.isAnyOutstandingFirmwareOrPatch())
			{
				int num = 0;
				if (int.TryParse(this.location[this._selected_location].update_count_lbl.text, ref num))
				{
					globals.show_confirm_alert(Localization.Get("UPDATE_LOCATION_TITLE"), Localization.Get("UPDATE_LOCATION_MSG").Replace("$MINUTES", (num * 5).ToString()).Replace("$X", num.ToString()), new EventDelegate.Callback(this.on_update_location), null, Localization.Get("YES"), "CANCEL", false);
				}
			}
			break;
		}
	}

	// Token: 0x040011E7 RID: 4583
	public static Color MM_green = new Color(0f, 0.8392157f, 0.16470589f);

	// Token: 0x040011E8 RID: 4584
	public static Color MM_light_blue = new Color(0.2784314f, 0.62352943f, 0.6901961f);

	// Token: 0x040011E9 RID: 4585
	public static Color MM_red = new Color(0.5686275f, 0f, 0f);

	// Token: 0x040011EA RID: 4586
	public static Color MM_blue = new Color(0.007843138f, 0.19607843f, 0.41568628f);

	// Token: 0x040011EB RID: 4587
	public static Color MM_disabled = new Color(1f, 1f, 1f, 0.4f);

	// Token: 0x040011EC RID: 4588
	public static Color MM_orange = new Color(1f, 0.4f, 0f);

	// Token: 0x040011ED RID: 4589
	public List<MissionManagerLocationBehavior> location;

	// Token: 0x040011EE RID: 4590
	public UIGrid location_grid;

	// Token: 0x040011EF RID: 4591
	public UIScrollView location_scroll_view;

	// Token: 0x040011F0 RID: 4592
	public GameObject link_line_up;

	// Token: 0x040011F1 RID: 4593
	public GameObject link_line_down;

	// Token: 0x040011F2 RID: 4594
	public UISprite button_link;

	// Token: 0x040011F3 RID: 4595
	public UISprite frame_link;

	// Token: 0x040011F4 RID: 4596
	public string gear_spritename_prefix = "gearfound_";

	// Token: 0x040011F5 RID: 4597
	public string store_scene = "store menu";

	// Token: 0x040011F6 RID: 4598
	public List<MissionManagerLocationButton> button;

	// Token: 0x040011F7 RID: 4599
	public UILabel location_title;

	// Token: 0x040011F8 RID: 4600
	public GameObject on_gear_go;

	// Token: 0x040011F9 RID: 4601
	public GameObject location_slot_go;

	// Token: 0x040011FA RID: 4602
	public List<GameObject> location_slot_gos;

	// Token: 0x040011FB RID: 4603
	public UITexture location_texture;

	// Token: 0x040011FC RID: 4604
	public GameObject download_warning_banner_go;

	// Token: 0x040011FD RID: 4605
	public UIGrid storage_dots_grid;

	// Token: 0x040011FE RID: 4606
	public List<MissionManagerStorageDotBehavior> storage_dots;

	// Token: 0x040011FF RID: 4607
	public GameObject progress_container_go;

	// Token: 0x04001200 RID: 4608
	public MissionManagerProgressBar overall_progress;

	// Token: 0x04001201 RID: 4609
	public MissionManagerProgressBar piece_progress;

	// Token: 0x04001202 RID: 4610
	public UILabel open_slot_lbl;

	// Token: 0x04001203 RID: 4611
	public UILabel location_slot_lbl;

	// Token: 0x04001204 RID: 4612
	public GameObject store_option_go;

	// Token: 0x04001205 RID: 4613
	public buttonBehavior store_btn;

	// Token: 0x04001206 RID: 4614
	public bool fake_installing;

	// Token: 0x04001207 RID: 4615
	private bool _location_downloading;

	// Token: 0x04001208 RID: 4616
	private bool _dragging;

	// Token: 0x04001209 RID: 4617
	private int _selected_location;

	// Token: 0x0400120A RID: 4618
	private int _spotsFilled;

	// Token: 0x0400120B RID: 4619
	private int _spotsFilling;

	// Token: 0x0400120C RID: 4620
	private int _maxSpots;

	// Token: 0x0400120D RID: 4621
	private bool _initialized;
}
