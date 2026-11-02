using System;
using AnimationOrTween;
using UnityEngine;

// Token: 0x02000284 RID: 644
public class GearDaisyBehavior : MonoBehaviour
{
	// Token: 0x170001FA RID: 506
	// (get) Token: 0x06001130 RID: 4400 RVA: 0x0007AB48 File Offset: 0x00078D48
	public SwitchGearMenuBehavior switch_gear_menu
	{
		get
		{
			if (!this._switch_gear_menu)
			{
				this._switch_gear_menu = Object.Instantiate<SwitchGearMenuBehavior>(this.switch_gear_menu_prefab);
				this._switch_gear_menu.transform.parent = this.submenu_holder;
				this._switch_gear_menu.transform.SnapToZero();
				this._switch_gear_menu.name = "switch gear menu";
			}
			return this._switch_gear_menu;
		}
	}

	// Token: 0x170001FB RID: 507
	// (get) Token: 0x06001131 RID: 4401 RVA: 0x0007ABB4 File Offset: 0x00078DB4
	public GearSettingsMenuBehavior gear_settings_menu
	{
		get
		{
			if (!this._gear_settings_menu)
			{
				this._gear_settings_menu = Object.Instantiate<GearSettingsMenuBehavior>(this.gear_settings_menu_prefab);
				this._gear_settings_menu.transform.parent = this.submenu_holder;
				this._gear_settings_menu.transform.SnapToZero();
				this._gear_settings_menu.name = "gear settings menu";
			}
			return this._gear_settings_menu;
		}
	}

	// Token: 0x170001FC RID: 508
	// (get) Token: 0x06001132 RID: 4402 RVA: 0x0007AC20 File Offset: 0x00078E20
	public MissionManagerBehavior mission_manager
	{
		get
		{
			if (!this._mission_manager)
			{
				this._mission_manager = Object.Instantiate<MissionManagerBehavior>(this.mission_manager_prefab);
				this._mission_manager.transform.parent = this.submenu_holder;
				this._mission_manager.transform.SnapToZero();
				this._mission_manager.name = "mission manager";
			}
			return this._mission_manager;
		}
	}

	// Token: 0x170001FD RID: 509
	// (get) Token: 0x06001133 RID: 4403 RVA: 0x0007AC8C File Offset: 0x00078E8C
	public Animation sync_animation
	{
		get
		{
			if (!this._sync_animation)
			{
				this._sync_animation = Object.Instantiate<Animation>(this.sync_animation_prefab);
				this._sync_animation.transform.parent = this.submenu_holder;
				this._sync_animation.transform.SnapToZero();
				this._sync_animation.name = "sync animation";
			}
			return this._sync_animation;
		}
	}

	// Token: 0x170001FE RID: 510
	// (get) Token: 0x06001134 RID: 4404 RVA: 0x0007ACF8 File Offset: 0x00078EF8
	// (set) Token: 0x06001135 RID: 4405 RVA: 0x0007AD2C File Offset: 0x00078F2C
	public GearDaisyBehavior.gear_enum current_gear
	{
		get
		{
			GearDaisyBehavior.gear_enum? current_gear = this._current_gear;
			if (current_gear == null)
			{
				return GearDaisyBehavior.gear_enum.none;
			}
			GearDaisyBehavior.gear_enum? current_gear2 = this._current_gear;
			return current_gear2.Value;
		}
		set
		{
			if (this._current_gear == value)
			{
				return;
			}
			this._current_gear = new GearDaisyBehavior.gear_enum?(value);
			switch (value)
			{
			case GearDaisyBehavior.gear_enum.none:
				this.gear_icon.spriteName = this.no_gear_icon;
				break;
			case GearDaisyBehavior.gear_enum.repulsor:
				this.gear_icon.spriteName = this.repulsor_icon;
				break;
			case GearDaisyBehavior.gear_enum.warmachine:
				this.gear_icon.spriteName = this.warmachine_icon;
				break;
			case GearDaisyBehavior.gear_enum.hulk:
				this.gear_icon.spriteName = this.gamma_icon;
				break;
			case GearDaisyBehavior.gear_enum.shield:
				this.gear_icon.spriteName = this.shield_icon;
				break;
			}
		}
	}

	// Token: 0x170001FF RID: 511
	// (get) Token: 0x06001136 RID: 4406 RVA: 0x0007ADF8 File Offset: 0x00078FF8
	// (set) Token: 0x06001137 RID: 4407 RVA: 0x0007AE00 File Offset: 0x00079000
	public GearDaisyBehavior.mode_enum mode
	{
		get
		{
			return this._mode;
		}
		set
		{
			this._mode = value;
			this.switch_gear_menu.show(this._mode == GearDaisyBehavior.mode_enum.switch_gear);
			this.gear_settings_menu.show(this._mode == GearDaisyBehavior.mode_enum.gear_settings);
			this.mission_manager.show(this._mode == GearDaisyBehavior.mode_enum.mission_manager);
		}
	}

	// Token: 0x06001138 RID: 4408 RVA: 0x0007AE50 File Offset: 0x00079050
	private void Awake()
	{
		globals.gear_daisy = this;
		this.switch_gear_menu.gear_daisy = this;
		this.gear_settings_menu.gear_daisy = this;
		this.mission_manager.gear_daisy = this;
		this.mode = GearDaisyBehavior.mode_enum.none;
		this.drawer_tween.ResetToBeginning();
		this.open(false, true);
		this._firmware_resume_manager = base.gameObject.GetComponent<FirmwareResumeManager>();
		this._patch_update_resume_manager = base.gameObject.GetComponent<PatchUpdateResumeManager>();
		globals.packageDownload_manager.init();
	}

	// Token: 0x06001139 RID: 4409 RVA: 0x0007AED0 File Offset: 0x000790D0
	public void show_disclaimer(bool show_scavenger_hunt)
	{
		if (this.update_disclaimer_panel)
		{
			this.update_disclaimer_panel.show(show_scavenger_hunt);
		}
	}

	// Token: 0x0600113A RID: 4410 RVA: 0x0007AEF0 File Offset: 0x000790F0
	private void set_gear_connected(bool b)
	{
		this.gear_button.sprite.spriteName = ((!b) ? this.disconnected_sprite : this.connected_sprite);
		this.mission_manager_button.gameObject.SetActive(b);
		this.gear_settings_button.gameObject.SetActive(b);
		this.force_sync_button.gameObject.SetActive(b);
	}

	// Token: 0x0600113B RID: 4411 RVA: 0x0007AF58 File Offset: 0x00079158
	public void open(bool b, bool silent = false)
	{
		if (b)
		{
			this.drawer_tween.PlayForward();
			if (!silent)
			{
				globals.sfx_master.play(this.open_sfx, null);
			}
		}
		else
		{
			this.drawer_tween.PlayReverse();
			if (!silent)
			{
				globals.sfx_master.play(this.close_sfx, null);
			}
		}
	}

	// Token: 0x0600113C RID: 4412 RVA: 0x0007AFB4 File Offset: 0x000791B4
	private void toggle()
	{
		if (this.drawer_tween.direction == Direction.Forward)
		{
			this.open(false, false);
		}
		else
		{
			this.open(true, false);
		}
	}

	// Token: 0x0600113D RID: 4413 RVA: 0x0007AFE8 File Offset: 0x000791E8
	public bool submenu_open()
	{
		return this.switch_gear_menu.gameObject.activeInHierarchy || this.gear_settings_menu.gameObject.activeInHierarchy || this.mission_manager.gameObject.activeInHierarchy || this.update_disclaimer_panel.gameObject.activeInHierarchy || this.full_screen_update_panel_active();
	}

	// Token: 0x0600113E RID: 4414 RVA: 0x0007B060 File Offset: 0x00079260
	public bool full_screen_update_panel_active()
	{
		return (this._patch_update_resume_manager && this._patch_update_resume_manager.full_screen_panel_active()) || (this._firmware_resume_manager && this._firmware_resume_manager.full_screen_panel_active());
	}

	// Token: 0x0600113F RID: 4415 RVA: 0x0007B0B0 File Offset: 0x000792B0
	public void play_sync()
	{
		if (this.sync_animation && !this.sync_animation.isPlaying)
		{
			this.sync_animation.Play();
		}
	}

	// Token: 0x06001140 RID: 4416 RVA: 0x0007B0EC File Offset: 0x000792EC
	public void force_sync()
	{
		this.play_sync();
		globals.BLE_manager.sendPlayerData(-1);
		globals.BLE_manager.sendIdentifyDevice(globals.BLE_manager.connectedDevice, 2, "MISSIONACCEPT");
	}

	// Token: 0x06001141 RID: 4417 RVA: 0x0007B124 File Offset: 0x00079324
	public void open_mm_to_location(string id, bool download = true)
	{
		this.mode = GearDaisyBehavior.mode_enum.mission_manager;
		this.mission_manager.open_to_location(id, download);
	}

	// Token: 0x06001142 RID: 4418 RVA: 0x0007B13C File Offset: 0x0007933C
	public void open_firmware_resume_manager()
	{
		globals.update_snooze = -1f;
		this.mode = GearDaisyBehavior.mode_enum.none;
		if (this._firmware_resume_manager)
		{
			this._firmware_resume_manager.showUI();
		}
	}

	// Token: 0x06001143 RID: 4419 RVA: 0x0007B178 File Offset: 0x00079378
	public void open_patch_resume_manager()
	{
		globals.update_snooze = -1f;
		this.mode = GearDaisyBehavior.mode_enum.none;
		if (this._patch_update_resume_manager)
		{
			this._patch_update_resume_manager.showUI();
		}
	}

	// Token: 0x06001144 RID: 4420 RVA: 0x0007B1B4 File Offset: 0x000793B4
	private void Update()
	{
		this.set_gear_connected(globals.BLE_manager.connectedDevice_data != null);
		if (globals.player_data.latest_device_data)
		{
			int type = globals.player_data.latest_device_data.type;
			if (type != 2101)
			{
				if (type != 2111)
				{
					this.current_gear = GearDaisyBehavior.gear_enum.none;
				}
				else
				{
					this.current_gear = GearDaisyBehavior.gear_enum.hulk;
				}
			}
			else
			{
				this.current_gear = GearDaisyBehavior.gear_enum.repulsor;
			}
		}
		else
		{
			this.current_gear = GearDaisyBehavior.gear_enum.none;
		}
		if (this.gear_button.clicked)
		{
			this.toggle();
		}
		else if (this.switch_gear_button.clicked)
		{
			this.mode = GearDaisyBehavior.mode_enum.switch_gear;
		}
		else if (this.mission_manager_button.clicked)
		{
			this.mode = GearDaisyBehavior.mode_enum.mission_manager;
		}
		else if (this.gear_settings_button.clicked)
		{
			this.mode = GearDaisyBehavior.mode_enum.gear_settings;
		}
		else if (this.force_sync_button.clicked)
		{
			this.force_sync();
		}
		else if (Input.GetMouseButtonUp(0))
		{
			this.open(false, true);
		}
	}

	// Token: 0x04001186 RID: 4486
	public buttonBehavior gear_button;

	// Token: 0x04001187 RID: 4487
	public UISprite gear_icon;

	// Token: 0x04001188 RID: 4488
	public UITweener drawer_tween;

	// Token: 0x04001189 RID: 4489
	public ButtonCoreBehavior switch_gear_button;

	// Token: 0x0400118A RID: 4490
	public ButtonCoreBehavior mission_manager_button;

	// Token: 0x0400118B RID: 4491
	public ButtonCoreBehavior gear_settings_button;

	// Token: 0x0400118C RID: 4492
	public ButtonCoreBehavior force_sync_button;

	// Token: 0x0400118D RID: 4493
	public Transform submenu_holder;

	// Token: 0x0400118E RID: 4494
	public SwitchGearMenuBehavior switch_gear_menu_prefab;

	// Token: 0x0400118F RID: 4495
	public GearSettingsMenuBehavior gear_settings_menu_prefab;

	// Token: 0x04001190 RID: 4496
	public MissionManagerBehavior mission_manager_prefab;

	// Token: 0x04001191 RID: 4497
	public Animation sync_animation_prefab;

	// Token: 0x04001192 RID: 4498
	public UpdateDisclaimerBehavior update_disclaimer_panel;

	// Token: 0x04001193 RID: 4499
	public string disconnected_sprite;

	// Token: 0x04001194 RID: 4500
	public string connected_sprite;

	// Token: 0x04001195 RID: 4501
	public string repulsor_icon;

	// Token: 0x04001196 RID: 4502
	public string warmachine_icon;

	// Token: 0x04001197 RID: 4503
	public string gamma_icon;

	// Token: 0x04001198 RID: 4504
	public string shield_icon;

	// Token: 0x04001199 RID: 4505
	public string no_gear_icon;

	// Token: 0x0400119A RID: 4506
	public string open_sfx;

	// Token: 0x0400119B RID: 4507
	public string close_sfx;

	// Token: 0x0400119C RID: 4508
	private FirmwareResumeManager _firmware_resume_manager;

	// Token: 0x0400119D RID: 4509
	private PatchUpdateResumeManager _patch_update_resume_manager;

	// Token: 0x0400119E RID: 4510
	private SwitchGearMenuBehavior _switch_gear_menu;

	// Token: 0x0400119F RID: 4511
	private GearSettingsMenuBehavior _gear_settings_menu;

	// Token: 0x040011A0 RID: 4512
	private MissionManagerBehavior _mission_manager;

	// Token: 0x040011A1 RID: 4513
	public Animation _sync_animation;

	// Token: 0x040011A2 RID: 4514
	private GearDaisyBehavior.gear_enum? _current_gear;

	// Token: 0x040011A3 RID: 4515
	private GearDaisyBehavior.mode_enum _mode;

	// Token: 0x02000285 RID: 645
	public enum gear_enum
	{
		// Token: 0x040011A5 RID: 4517
		none,
		// Token: 0x040011A6 RID: 4518
		repulsor,
		// Token: 0x040011A7 RID: 4519
		warmachine,
		// Token: 0x040011A8 RID: 4520
		hulk,
		// Token: 0x040011A9 RID: 4521
		shield
	}

	// Token: 0x02000286 RID: 646
	public enum mode_enum
	{
		// Token: 0x040011AB RID: 4523
		none,
		// Token: 0x040011AC RID: 4524
		switch_gear,
		// Token: 0x040011AD RID: 4525
		mission_manager,
		// Token: 0x040011AE RID: 4526
		gear_settings
	}
}
