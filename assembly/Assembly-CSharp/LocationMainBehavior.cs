using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002E8 RID: 744
public class LocationMainBehavior : MonoBehaviour
{
	// Token: 0x06001393 RID: 5011 RVA: 0x0008D044 File Offset: 0x0008B244
	private void Start()
	{
		this.mission_details.location_main = this;
		this.warning_panel.gameObject.SetActive(false);
		if (!string.IsNullOrEmpty(globals.location_id))
		{
			this.far_bg_texture_M.mainTexture = (Resources.Load("location bg/loc_bg_" + globals.location_id) as Texture);
		}
		this.bg_slider.enabled = false;
		this.bg_slider.ResetToBeginning();
		this.reset_ui();
	}

	// Token: 0x06001394 RID: 5012 RVA: 0x0008D0C0 File Offset: 0x0008B2C0
	public bool faking_device_connection()
	{
		return Application.isEditor && this.fake_device_connection;
	}

	// Token: 0x06001395 RID: 5013 RVA: 0x0008D0D8 File Offset: 0x0008B2D8
	private void set_mission_buttons(List<missionDataClass> missions)
	{
		while (this.mission_button.Count < missions.Count)
		{
			MissionButtonBehavior missionButtonBehavior = this.mission_button[0].CopyInPlace() as MissionButtonBehavior;
			missionButtonBehavior.name = "mission button " + this.mission_button.Count.ToString();
			this.mission_button.Add(missionButtonBehavior);
		}
		for (int i = 0; i < this.mission_button.Count; i++)
		{
			if (i < missions.Count)
			{
				this.mission_button[i].set_data(missions[i]);
			}
			else
			{
				this.mission_button[i].gameObject.SetActive(false);
			}
		}
		this.mission_button_grid.Reposition();
	}

	// Token: 0x06001396 RID: 5014 RVA: 0x0008D1B0 File Offset: 0x0008B3B0
	private void reset_ui()
	{
		if (!string.IsNullOrEmpty(globals.location_id))
		{
			this._location_data = globals.location_data.item_by_id(globals.location_id);
			this.title_label.text = this._location_data.name;
			globals.music_jukebox.change_music(globals.location_id + " music", 0.5f);
			this.ambient.set_location(globals.location_id);
		}
		if (this._location_data)
		{
			this.set_mission_buttons(this._location_data.missions);
		}
		else
		{
			this.set_mission_buttons(new List<missionDataClass>());
		}
		this.legalese_label.text = this.localized_legalese_text();
		this.set_info_button();
		globals.poster_album.hide();
		this.mission_details.gameObject.SetActive(false);
		ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
		scavenger_hunt_types type = scavenger_hunt_types.VIEW_LOCATION;
		List<string> list = new List<string>();
		list.Add(globals.location_id);
		scavenger_hunt_manager.do_action(type, list, 1);
	}

	// Token: 0x06001397 RID: 5015 RVA: 0x0008D2A8 File Offset: 0x0008B4A8
	public void start_mission(missionDataClass d, bool force_gamma = false)
	{
		this.mission_details.prompt_jukebox.audio.Stop();
		this.warning_panel.gameObject.SetActive(true);
		if (d && globals.BLE_manager.connectedDevice > -1)
		{
			globals.BLE_manager.sendStartMission(d.entitlements);
		}
		if (force_gamma || (globals.player_data.latest_device_data && globals.player_data.latest_device_data.type == 2111))
		{
			this._blast_doors = Object.Instantiate<Animator>(Resources.Load<Animator>(this.gamma_blast_doors_path));
			this._blast_doors_scene = this.gamma_blast_doors_scene;
		}
		else
		{
			this._blast_doors = Object.Instantiate<Animator>(Resources.Load<Animator>(this.repulsor_blast_doors_path));
			this._blast_doors_scene = this.repulsor_blast_doors_scene;
		}
		if (!this._blast_doors)
		{
			globals.debugWarning("blast doors not found!");
		}
		this._blast_doors.transform.parent = this.blast_doors_holder;
		this._blast_doors.transform.SnapToZero();
		this._blast_doors.gameObject.SetActive(true);
		this._blast_doors.Play(this.blast_doors_close_anim);
		this._mission_started = true;
		globals.music_jukebox.fade_out(0.5f);
	}

	// Token: 0x06001398 RID: 5016 RVA: 0x0008D3FC File Offset: 0x0008B5FC
	private void change_location(bool right)
	{
		globals.location_id = globals.location_data.next_location_id(globals.location_id, right);
		if (right)
		{
			this.bg_slider.from = new Vector3((float)this.far_bg_texture_M.width, 0f, 0f);
			Resources.UnloadAsset(this.far_bg_texture_L.mainTexture);
			this.far_bg_texture_L.mainTexture = this.far_bg_texture_M.mainTexture;
			this.far_bg_texture_M.mainTexture = (Resources.Load("location bg/loc_bg_" + globals.location_id) as Texture);
		}
		else
		{
			this.bg_slider.from = new Vector3((float)(-(float)this.far_bg_texture_M.width), 0f, 0f);
			Resources.UnloadAsset(this.far_bg_texture_R.mainTexture);
			this.far_bg_texture_R.mainTexture = this.far_bg_texture_M.mainTexture;
			this.far_bg_texture_M.mainTexture = (Resources.Load("location bg/loc_bg_" + globals.location_id) as Texture);
		}
		this.bg_slider.to = Vector3.zero;
		this.bg_slider.ResetToBeginning();
		this.bg_slider.PlayForward();
		this.reset_ui();
	}

	// Token: 0x06001399 RID: 5017 RVA: 0x0008D538 File Offset: 0x0008B738
	private void return_to_GTM()
	{
		globals.music_jukebox.fade_out(0.5f);
		NavigationManager.load_scene(NavigationManager.gtm_scene);
	}

	// Token: 0x0600139A RID: 5018 RVA: 0x0008D554 File Offset: 0x0008B754
	private string localized_legalese_text()
	{
		if (!this._location_data)
		{
			return string.Empty;
		}
		if (this._location_data.requires == "purchase")
		{
			return Localization.Get("LOCATION CONNECT CTA");
		}
		if (this._location_data.id == "SB")
		{
			return Localization.Get("LOCATION SB CTA");
		}
		if (this._location_data.id == "MT")
		{
			return Localization.Get("LOCATION MT CTA");
		}
		StoreItemDataClass storeItemDataClass = globals.store_data.item_by_id(this._location_data.requires, false);
		if (storeItemDataClass)
		{
			return Localization.Get("LOCATION TOY CTA").Replace("$TOY", storeItemDataClass.name);
		}
		return Localization.Get("LOCATION CONNECT CTA");
	}

	// Token: 0x0600139B RID: 5019 RVA: 0x0008D630 File Offset: 0x0008B830
	private void set_info_button()
	{
		if (!this._location_data)
		{
			return;
		}
		if (this._location_data.unlocked() || string.IsNullOrEmpty(this._location_data.requires))
		{
			if (this._location_data.installed())
			{
				this.info_button.gameObject.SetActive(false);
			}
			else
			{
				this.info_button.gameObject.SetActive(true);
				this.info_button.label.text = Localization.Get("LOCATION_UNLOCK_INFO_INSTALL");
			}
		}
		else
		{
			this.info_button.gameObject.SetActive(true);
			if (this._location_data.requires.ToLower().StartsWith("level"))
			{
				string text = this._location_data.requires.Replace("level", string.Empty).Trim();
				this.info_button.label.text = Localization.Get("LOCATION_UNLOCK_INFO_LEVEL").Replace("$LEVEL", text);
			}
			else if (this._location_data.requires_purchase())
			{
				this.info_button.label.text = Localization.Get("LOCATION_UNLOCK_INFO_PURCHASE");
			}
			else
			{
				DBItemClass dbitemClass = globals.database_data.item_by_id(this._location_data.requires, true);
				if (dbitemClass && dbitemClass is SFDBItemClass)
				{
					this.info_button.label.text = Localization.Get("LOCATION_UNLOCK_INFO_SF").Replace("$SF", dbitemClass.name);
				}
				else if (dbitemClass && dbitemClass.id == "1101")
				{
					this.info_button.label.text = Localization.Get("LOCATION_UNLOCK_INFO_PROWLERBOT");
				}
				else
				{
					this.info_button.label.text = "LOCKED";
				}
			}
		}
	}

	// Token: 0x0600139C RID: 5020 RVA: 0x0008D824 File Offset: 0x0008BA24
	public void show_requirement_popup()
	{
		if (globals.player_data.has_unlock(this._location_data.id) || string.IsNullOrEmpty(this._location_data.requires))
		{
			string title = Localization.Get("LOCATION_REQUIRES_POPUP_INSTALL_HEADER").Replace("$LOCATION", this._location_data.name);
			globals.show_OK_alert(title, Localization.Get("LOCATION_REQUIRES_POPUP_INSTALL_BODY"), null);
		}
		else if (this._location_data.requires.ToLower().StartsWith("level"))
		{
			string text = this._location_data.requires.Replace("level", string.Empty).Trim();
			string title2 = Localization.Get("LOCATION_REQUIRES_POPUP_LEVEL_HEADER").Replace("$LEVEL", text).Replace("$LOCATION", this._location_data.name);
			string body = Localization.Get("LOCATION_REQUIRES_POPUP_LEVEL_BODY").Replace("$LEVEL", globals.current_gear_level().ToString());
			globals.show_OK_alert(title2, body, null);
		}
		else if (this._location_data.requires_purchase())
		{
			globals.show_localized_OK_alert("LOCATION_REQUIRES_POPUP_PURCHASE_HEADER", "LOCATION_REQUIRES_POPUP_BODY", null);
		}
		else
		{
			DBItemClass dbitemClass = globals.database_data.item_by_id(this._location_data.requires, true);
			if (dbitemClass && dbitemClass is SFDBItemClass)
			{
				string title3 = Localization.Get("LOCATION_REQUIRES_POPUP_SF_HEADER").Replace("$SF", dbitemClass.name).Replace("$LOCATION", this._location_data.name);
				globals.show_OK_alert(title3, Localization.Get("LOCATION_REQUIRES_POPUP_BODY"), null);
			}
			else if (dbitemClass && dbitemClass.id == "1101")
			{
				string title4 = Localization.Get("LOCATION_REQUIRES_POPUP_PROWLERBOT_HEADER").Replace("$LOCATION", this._location_data.name);
				globals.show_OK_alert(title4, Localization.Get("LOCATION_REQUIRES_POPUP_BODY"), null);
			}
		}
	}

	// Token: 0x0600139D RID: 5021 RVA: 0x0008DA24 File Offset: 0x0008BC24
	private void Update()
	{
		if (this._mission_started)
		{
			if (this._blast_doors && this._blast_doors.GetCurrentAnimatorStateInfo(0).IsName(this.blast_doors_closed_anim))
			{
				NavigationManager.load_scene(this._blast_doors_scene);
			}
			return;
		}
		if (this.back_button.clicked || globals.base_escape_hit())
		{
			this.return_to_GTM();
			DMOManager.LogNavigation(NavigationManager.gtm_scene, "back_btn", NavigationManager.location_scene, null);
		}
		for (int i = 0; i < this.mission_button.Count; i++)
		{
			if (this.mission_button[i].clicked)
			{
				DMOManager.LogNavigation(AnalyticsStrings.GetAnalyticsTranslationName(this.mission_button[i].data.id.ToString()), "mission_btn", AnalyticsStrings.GetAnalyticsTranslationName(globals.location_id), null);
				this.mission_details.show_data(this.mission_button[i].data);
				globals.sfx_master.play(this.open_mission_sfx, null);
			}
			else if (globals.mission_to_open > -1 && this.mission_button[i].data.id == globals.mission_to_open)
			{
				this.mission_details.show_data(this.mission_button[i].data);
				globals.sfx_master.play(this.open_mission_sfx, null);
				globals.mission_to_open = -1;
			}
		}
		this.previous_location_button.gameObject.SetActive(!this.mission_details.gameObject.activeInHierarchy);
		this.next_location_button.gameObject.SetActive(!this.mission_details.gameObject.activeInHierarchy);
		if (this.next_location_button.clicked)
		{
			DMOManager.LogNavigation(AnalyticsStrings.GetAnalyticsTranslationName(globals.location_data.next_location_id(globals.location_id, true)), this.next_location_button.transform.name, AnalyticsStrings.GetAnalyticsTranslationName(globals.location_id), null);
			this.change_location(true);
		}
		else if (this.previous_location_button.clicked)
		{
			DMOManager.LogNavigation(AnalyticsStrings.GetAnalyticsTranslationName(globals.location_data.next_location_id(globals.location_id, false)), this.next_location_button.transform.name, AnalyticsStrings.GetAnalyticsTranslationName(globals.location_id), null);
			this.change_location(false);
		}
		if (this.info_button.clicked)
		{
			globals.sfx_master.play(this.info_button.pressed_sfx, null);
			this.show_requirement_popup();
		}
		if (Application.isEditor && !this._mission_started)
		{
			if (Input.GetKeyDown(98))
			{
				this.start_mission(null, false);
			}
			else if (Input.GetKeyDown(103))
			{
				this.start_mission(null, true);
			}
		}
	}

	// Token: 0x0600139E RID: 5022 RVA: 0x0008DCF4 File Offset: 0x0008BEF4
	private void OnEnable()
	{
		EasyTouch.On_SwipeStart += this.On_SwipeStart;
		EasyTouch.On_Swipe += this.On_Swipe;
		EasyTouch.On_SwipeEnd += this.On_SwipeEnd;
		globals.debug("Adding Easy Touch Events");
	}

	// Token: 0x0600139F RID: 5023 RVA: 0x0008DD34 File Offset: 0x0008BF34
	private void OnDisable()
	{
		this.UnsubscribeEvent();
	}

	// Token: 0x060013A0 RID: 5024 RVA: 0x0008DD3C File Offset: 0x0008BF3C
	private void OnDestroy()
	{
		this.UnsubscribeEvent();
	}

	// Token: 0x060013A1 RID: 5025 RVA: 0x0008DD44 File Offset: 0x0008BF44
	private void UnsubscribeEvent()
	{
		EasyTouch.On_SwipeStart -= this.On_SwipeStart;
		EasyTouch.On_Swipe -= this.On_Swipe;
		EasyTouch.On_SwipeEnd -= this.On_SwipeEnd;
	}

	// Token: 0x060013A2 RID: 5026 RVA: 0x0008DD7C File Offset: 0x0008BF7C
	private void On_SwipeStart(Gesture gesture)
	{
	}

	// Token: 0x060013A3 RID: 5027 RVA: 0x0008DD80 File Offset: 0x0008BF80
	private void On_Swipe(Gesture gesture)
	{
	}

	// Token: 0x060013A4 RID: 5028 RVA: 0x0008DD84 File Offset: 0x0008BF84
	private void On_SwipeEnd(Gesture gesture)
	{
		if (globals.selectedObject == this.swipe_area)
		{
			globals.debug("Should be swiping");
			if (gesture.swipe == EasyTouch.SwipeDirection.Left)
			{
				this.change_location(true);
			}
			else if (gesture.swipe == EasyTouch.SwipeDirection.Right)
			{
				this.change_location(false);
			}
		}
	}

	// Token: 0x04001547 RID: 5447
	public UITexture far_bg_texture_L;

	// Token: 0x04001548 RID: 5448
	public UITexture far_bg_texture_M;

	// Token: 0x04001549 RID: 5449
	public UITexture far_bg_texture_R;

	// Token: 0x0400154A RID: 5450
	public TweenPosition bg_slider;

	// Token: 0x0400154B RID: 5451
	public UILabel title_label;

	// Token: 0x0400154C RID: 5452
	public buttonBehavior back_button;

	// Token: 0x0400154D RID: 5453
	public List<MissionButtonBehavior> mission_button;

	// Token: 0x0400154E RID: 5454
	public UIGrid mission_button_grid;

	// Token: 0x0400154F RID: 5455
	public buttonBehavior previous_location_button;

	// Token: 0x04001550 RID: 5456
	public buttonBehavior next_location_button;

	// Token: 0x04001551 RID: 5457
	public LabelledButtonBehavior info_button;

	// Token: 0x04001552 RID: 5458
	public UILabel legalese_label;

	// Token: 0x04001553 RID: 5459
	public MissionDetailsPanelBehavior mission_details;

	// Token: 0x04001554 RID: 5460
	public UIPanel warning_panel;

	// Token: 0x04001555 RID: 5461
	public LocationAmbientBehavior ambient;

	// Token: 0x04001556 RID: 5462
	public Transform blast_doors_holder;

	// Token: 0x04001557 RID: 5463
	public string repulsor_blast_doors_path = "blast doors/repulsor blast doors";

	// Token: 0x04001558 RID: 5464
	public string gamma_blast_doors_path = "blast doors/gamma blast doors";

	// Token: 0x04001559 RID: 5465
	public string blast_doors_close_anim;

	// Token: 0x0400155A RID: 5466
	public string blast_doors_closed_anim = "closed";

	// Token: 0x0400155B RID: 5467
	public string open_mission_sfx = "open mission";

	// Token: 0x0400155C RID: 5468
	public string repulsor_blast_doors_scene = "repulsor blast doors scene";

	// Token: 0x0400155D RID: 5469
	public string gamma_blast_doors_scene = "gamma blast doors scene";

	// Token: 0x0400155E RID: 5470
	public GameObject swipe_area;

	// Token: 0x0400155F RID: 5471
	public bool test_blast_doors;

	// Token: 0x04001560 RID: 5472
	public bool fake_device_connection;

	// Token: 0x04001561 RID: 5473
	private locationDataItemClass _location_data;

	// Token: 0x04001562 RID: 5474
	private bool _mission_started;

	// Token: 0x04001563 RID: 5475
	private Animator _blast_doors;

	// Token: 0x04001564 RID: 5476
	private string _blast_doors_scene;
}
