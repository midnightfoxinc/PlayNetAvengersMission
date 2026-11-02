using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002AF RID: 687
public class MissionDetailsPanelBehavior : DetailsPanelBehavior
{
	// Token: 0x06001276 RID: 4726 RVA: 0x00083190 File Offset: 0x00081390
	private void Start()
	{
	}

	// Token: 0x06001277 RID: 4727 RVA: 0x00083194 File Offset: 0x00081394
	protected override void cleanup()
	{
		Resources.UnloadAsset(this.bg_texture.mainTexture);
	}

	// Token: 0x06001278 RID: 4728 RVA: 0x000831A8 File Offset: 0x000813A8
	public void show_data(missionDataClass d)
	{
		this.cleanup();
		this.data = d;
		if (this.name_label)
		{
			this.name_label.text = d.name;
		}
		this.bg_texture.mainTexture = Resources.Load<Texture>(this.comics_bg_prefix + d.id.ToString());
		if (globals.environment_manager.useMedals)
		{
			this.medal_sprite.spriteName = globals.medal_spritename(globals.player_data.get_grade(d.id));
		}
		else
		{
			this.medal_sprite.gameObject.SetActive(globals.player_data.get_grade(d.id) > 0);
		}
		this.setup_buttons(true);
		List<missionTipDataClass> list = new List<missionTipDataClass>();
		for (int i = 0; i < d.tip.Count; i++)
		{
			if (globals.player_data.latest_device_data)
			{
				if (d.tip[i].mola == globals.player_data.latest_device_data.type)
				{
					list.Add(d.tip[i]);
				}
			}
			else if (d.tip[i].mola == 2101)
			{
				list.Add(d.tip[i]);
			}
		}
		while (this.tip_button.Count < list.Count)
		{
			MissionTipBehavior missionTipBehavior = this.tip_button[0].CopyInPlace() as MissionTipBehavior;
			missionTipBehavior.name = "tip button " + this.tip_button.Count;
			this.tip_button.Add(missionTipBehavior);
		}
		for (int j = 0; j < this.tip_button.Count; j++)
		{
			if (j < list.Count)
			{
				this.tip_button[j].set_data(list[j]);
				this.tip_button[j].gameObject.SetActive(true);
			}
			else
			{
				this.tip_button[j].gameObject.SetActive(false);
			}
		}
		base.gameObject.SetActive(true);
		this.tip_button_grid.Reposition();
		this.see_also.set_buttons(d.characters);
		if (string.IsNullOrEmpty(d.prompt))
		{
			this.prompt_label.text = string.Empty;
			this.prompt_button.gameObject.SetActive(false);
		}
		else
		{
			this.prompt_label.text = d.prompt;
			this.prompt_button.gameObject.SetActive(true);
			this._check_for_prompt_end = true;
			this.prompt_jukebox.play(this.data.id.ToString());
		}
		ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
		scavenger_hunt_types type = scavenger_hunt_types.VIEW_MISSION;
		List<string> list2 = new List<string>();
		list2.Add(d.id.ToString());
		list2.Add(d.arena_type.ToString());
		list2.Add(d.entitlements);
		list2.Add(d.location.id.ToString());
		scavenger_hunt_manager.do_action(type, list2, 1);
	}

	// Token: 0x06001279 RID: 4729 RVA: 0x000834DC File Offset: 0x000816DC
	private void setup_buttons(bool log = false)
	{
		this.go_button_outline.gameObject.SetActive(true);
		this._info_state = MissionDetailsPanelBehavior.info_state_enum.unlocked;
		if (!globals.BLE_manager.connectedDevice_data && !this.location_main.faking_device_connection())
		{
			this.go_button.label.text = Localization.Get("MISSION CONNECT CTA");
			this.go_button.disabled = true;
			this.go_button_outline.gameObject.SetActive(false);
			Color white = Color.white;
			white.a = 0.6f;
			this.go_button_bg.color = white;
			this.info_button.label.text = Localization.Get("MISSION_INFO_CONNECT");
			this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.disconnected;
			this._info_state = MissionDetailsPanelBehavior.info_state_enum.disconnected;
		}
		else if (!this.data.unlocked())
		{
			this.go_button.label.text = Localization.Get("MISSION LOCKED CTA");
			this.go_button.disabled = true;
			this.go_button_bg.color = Color.red;
			if (!this.data.location.unlocked())
			{
				this.info_button.label.text = Localization.Get("MISSION_INFO_LOCATION").Replace("$LOCATION", this.data.location.name);
				this._info_state = MissionDetailsPanelBehavior.info_state_enum.location_locked;
			}
			else if (!this.data.location.embedded && !this.data.installed())
			{
				this.go_button.label.text = Localization.Get("MISSION INSTALL CTA");
				this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.uninstalled;
			}
			else
			{
				this.info_button.label.text = Localization.Get("MISSION_INFO_UNLOCK");
				this._info_state = MissionDetailsPanelBehavior.info_state_enum.mission_locked;
			}
			this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.locked;
		}
		else if (this.data.location.embedded)
		{
			this.go_button.label.text = Localization.Get("MISSION START CTA");
			this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.installed;
			this.go_button.disabled = false;
			this.go_button_bg.color = this.button_blue;
		}
		else if (globals.player_data.mission_entitled(this.data))
		{
			if (this.data.installed())
			{
				this.go_button.label.text = Localization.Get("MISSION START CTA");
				this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.installed;
			}
			else
			{
				this.go_button.label.text = Localization.Get("MISSION INSTALL CTA");
				this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.uninstalled;
			}
			this.go_button_bg.color = this.button_blue;
			this.go_button.disabled = false;
		}
		else if (this.data.location.requires_purchase())
		{
			this.go_button.label.text = Localization.Get("MISSION STORE CTA");
			this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.unowned;
			this.go_button_bg.color = this.button_blue;
			this.go_button.disabled = false;
		}
		else
		{
			this.go_button.label.text = Localization.Get("MISSION LOCKED CTA");
			this.go_button.disabled = true;
			this.go_button_bg.color = Color.red;
			this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.locked;
		}
		if (globals.BLE_manager.connectedDevice_data && globals.mola_busy(log))
		{
			this.go_button.disabled = true;
			this._mission_state = MissionDetailsPanelBehavior.mission_state_enum.busy;
		}
		this.info_button.gameObject.SetActive(this._info_state != MissionDetailsPanelBehavior.info_state_enum.unlocked);
	}

	// Token: 0x0600127A RID: 4730 RVA: 0x00083884 File Offset: 0x00081A84
	private void start_mission()
	{
		this.location_main.start_mission(this.data, false);
	}

	// Token: 0x0600127B RID: 4731 RVA: 0x00083898 File Offset: 0x00081A98
	private void show_info_popup()
	{
		switch (this._info_state)
		{
		case MissionDetailsPanelBehavior.info_state_enum.disconnected:
			globals.show_localized_OK_alert("MISSION_INFO_POPUP_CONNECT_HEADER", "MISSION_INFO_POPUP_CONNECT_BODY", null);
			break;
		case MissionDetailsPanelBehavior.info_state_enum.location_locked:
			this.location_main.show_requirement_popup();
			break;
		case MissionDetailsPanelBehavior.info_state_enum.mission_locked:
			globals.show_localized_OK_alert("MISSION_INFO_POPUP_UNLOCK_HEADER", "MISSION_INFO_POPUP_UNLOCK_BODY", null);
			break;
		}
	}

	// Token: 0x0600127C RID: 4732 RVA: 0x00083900 File Offset: 0x00081B00
	protected override void Update()
	{
		if (!this.location_main)
		{
			return;
		}
		if (this._current_device_id != globals.BLE_manager.connectedDevice)
		{
			this._current_device_id = globals.BLE_manager.connectedDevice;
			this.show_data(this.data);
		}
		if (globals.BLE_manager.connectedDevice_data)
		{
			this.setup_buttons(false);
		}
		if (this.go_button.clicked)
		{
			if (this.location_main.test_blast_doors && Application.isEditor)
			{
				this.start_mission();
			}
			else
			{
				switch (this._mission_state)
				{
				case MissionDetailsPanelBehavior.mission_state_enum.disconnected:
					DMOManager.LogNavigation("no_gear", "go_button", this.data.location.id, null);
					break;
				case MissionDetailsPanelBehavior.mission_state_enum.busy:
					if (globals.mola_downloading(false))
					{
						globals.show_OK_alert(string.Empty, Localization.Get("WAIT_TO_UPDATE_DONE"), null);
					}
					else
					{
						globals.show_OK_alert(string.Empty, Localization.Get("WAIT_TO_TRANSFER_ALLOWED"), null);
					}
					break;
				case MissionDetailsPanelBehavior.mission_state_enum.unowned:
					globals.store_item_id = this.data.location.id;
					DMOManager.LogNavigation("purchase", "go_button", this.data.location.id, null);
					NavigationManager.load_scene(NavigationManager.store_scene);
					break;
				case MissionDetailsPanelBehavior.mission_state_enum.uninstalled:
					if (globals.BLE_manager.connectedDevice_data)
					{
						globals.gear_daisy.mission_manager.show(true);
						globals.gear_daisy.mission_manager.select_location_by_id(this.data.location.id);
						DMOManager.LogNavigation("download", "go_button", this.data.location.id, null);
					}
					break;
				case MissionDetailsPanelBehavior.mission_state_enum.installed:
					this.start_mission();
					DMOManager.LogNavigation("go", "go_button", this.data.location.id, null);
					DMOManager.LogGameActionWithToyId("missionplay", "app_game_start", this.data.entitlements, null);
					break;
				case MissionDetailsPanelBehavior.mission_state_enum.locked:
					DMOManager.LogNavigation("locked", "go_button", this.data.location.id, null);
					break;
				}
			}
		}
		if (this.info_button.clicked)
		{
			this.show_info_popup();
		}
		this.see_also.check_buttons();
		for (int i = 0; i < this.tip_button.Count; i++)
		{
			if (this.tip_button[i].clicked)
			{
				DBItemClass d = globals.database_data.item_by_id(this.tip_button[i].id, true);
				if (d)
				{
					globals.poster_album.show(d);
				}
			}
		}
		if (this._check_for_prompt_end && !this.prompt_jukebox.audio.isPlaying)
		{
			ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
			scavenger_hunt_types type = scavenger_hunt_types.LISTEN_TO_PROMPT;
			List<string> list = new List<string>();
			list.Add(this.data.id.ToString());
			scavenger_hunt_manager.do_action(type, list, 1);
			this._check_for_prompt_end = false;
		}
		if (this.prompt_button.clicked)
		{
			if (SFXJukeboxBehavior.muted)
			{
				this._check_for_prompt_end = true;
			}
			this.prompt_jukebox.play(this.data.id.ToString());
		}
		if (Input.GetMouseButtonUp(0) && globals.selectedObject == this.close_button.gameObject)
		{
			globals.sfx_master.play(this.dismiss_sfx, null);
			this.prompt_jukebox.audio.Stop();
			base.gameObject.SetActive(false);
		}
		base.Update();
	}

	// Token: 0x0400130D RID: 4877
	public LabelledButtonBehavior go_button;

	// Token: 0x0400130E RID: 4878
	public UISprite go_button_bg;

	// Token: 0x0400130F RID: 4879
	public UISprite go_button_outline;

	// Token: 0x04001310 RID: 4880
	public LabelledButtonBehavior info_button;

	// Token: 0x04001311 RID: 4881
	public UITexture bg_texture;

	// Token: 0x04001312 RID: 4882
	public UISprite medal_sprite;

	// Token: 0x04001313 RID: 4883
	public List<MissionTipBehavior> tip_button;

	// Token: 0x04001314 RID: 4884
	public UIGrid tip_button_grid;

	// Token: 0x04001315 RID: 4885
	public UILabel prompt_label;

	// Token: 0x04001316 RID: 4886
	public buttonBehavior prompt_button;

	// Token: 0x04001317 RID: 4887
	public MissionPromptJukeboxBehavior prompt_jukebox;

	// Token: 0x04001318 RID: 4888
	public missionDataClass data;

	// Token: 0x04001319 RID: 4889
	public string comics_bg_prefix = "mission comics/comic_";

	// Token: 0x0400131A RID: 4890
	internal LocationMainBehavior location_main;

	// Token: 0x0400131B RID: 4891
	private MissionDetailsPanelBehavior.mission_state_enum _mission_state;

	// Token: 0x0400131C RID: 4892
	private MissionDetailsPanelBehavior.info_state_enum _info_state;

	// Token: 0x0400131D RID: 4893
	private int _current_device_id = -1;

	// Token: 0x0400131E RID: 4894
	private bool _check_for_prompt_end;

	// Token: 0x0400131F RID: 4895
	private Color button_blue = new Color(0.050980393f, 0.47058824f, 0.8235294f);

	// Token: 0x020002B0 RID: 688
	private enum mission_state_enum
	{
		// Token: 0x04001321 RID: 4897
		disconnected,
		// Token: 0x04001322 RID: 4898
		busy,
		// Token: 0x04001323 RID: 4899
		unowned,
		// Token: 0x04001324 RID: 4900
		uninstalled,
		// Token: 0x04001325 RID: 4901
		installed,
		// Token: 0x04001326 RID: 4902
		locked
	}

	// Token: 0x020002B1 RID: 689
	private enum info_state_enum
	{
		// Token: 0x04001328 RID: 4904
		unlocked,
		// Token: 0x04001329 RID: 4905
		disconnected,
		// Token: 0x0400132A RID: 4906
		location_locked,
		// Token: 0x0400132B RID: 4907
		mission_locked
	}
}
