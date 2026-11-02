using System;
using System.Collections.Generic;
using emcore.GameData;
using UnityEngine;

// Token: 0x02000217 RID: 535
public class AbilitySelectPanelBehavior : CallbackMonoBehavior
{
	// Token: 0x06000F09 RID: 3849 RVA: 0x0006B238 File Offset: 0x00069438
	public void init()
	{
		base._callback_handler.addDataReceivedCallback(Constants.ToyDataType.CT_ABIL_LIST, new BLEManager.DataReceivedDelegate(this.OnAbilListReceived));
		this.ability_directory.ability_select_panel = this;
		this.ability_directory.init();
		this.ability_directory.set_buttons();
		this._mola_busy = globals.mola_busy(true);
		if (!this._mola_busy)
		{
			this.get_abilities_on_gear();
		}
	}

	// Token: 0x06000F0A RID: 3850 RVA: 0x0006B29C File Offset: 0x0006949C
	public void reset_gear_update_countup()
	{
		this._gear_update_countup = 0f;
	}

	// Token: 0x06000F0B RID: 3851 RVA: 0x0006B2AC File Offset: 0x000694AC
	private void get_abilities_on_gear()
	{
		if (!globals.BLE_manager.connectedDevice_data)
		{
			return;
		}
		globals.BLE_manager.dataQuery(3, 0);
		this._gear_update_countup = 0f;
	}

	// Token: 0x06000F0C RID: 3852 RVA: 0x0006B2E8 File Offset: 0x000694E8
	protected void OnAbilListReceived(JSONObject data)
	{
		if (data.HasField("cd"))
		{
			List<string> list = new List<string>();
			for (int i = 0; i < data["cd"].Count; i++)
			{
				if (data["cd"][i].HasField("toyid"))
				{
					list.Add(data["cd"][i]["toyid"].str.Replace("AbilData.", string.Empty));
				}
			}
			if (list.Count > 0)
			{
				string text = "abilities on gear: ";
				for (int j = 0; j < list.Count; j++)
				{
					AbilityDBItemClass abilityDBItemClass = globals.database_data.item_by_id(list[j], true) as AbilityDBItemClass;
					if (abilityDBItemClass)
					{
						if (this.equipped_ability.ContainsKey(abilityDBItemClass.slot))
						{
							this.equipped_ability[abilityDBItemClass.slot] = list[j];
						}
						else
						{
							this.equipped_ability.Add(abilityDBItemClass.slot, list[j]);
						}
						for (int k = 0; k < this.ability_directory.ability_type_panel.option.Count; k++)
						{
							if (this.ability_directory.ability_type_panel.option[k].slot == abilityDBItemClass.slot)
							{
								this.ability_directory.ability_type_panel.option[k].set_equipped(abilityDBItemClass.id);
							}
						}
					}
					text = text + "\n   " + list[j];
				}
				globals.debug(text);
			}
		}
	}

	// Token: 0x06000F0D RID: 3853 RVA: 0x0006B4AC File Offset: 0x000696AC
	public void select_ability(string id)
	{
		this.ability_directory.ability_type_panel.select_ability_by_id(id);
	}

	// Token: 0x06000F0E RID: 3854 RVA: 0x0006B4C0 File Offset: 0x000696C0
	public void show(bool b)
	{
		base.gameObject.SetActive(b);
		if (b)
		{
			this.directory_tween.PlayForward();
		}
		else
		{
			this.directory_tween.PlayReverse();
		}
	}

	// Token: 0x06000F0F RID: 3855 RVA: 0x0006B4F0 File Offset: 0x000696F0
	public void set_ability(AbilityDBItemClass b)
	{
		if (!b)
		{
			globals.debugWarning("set_ability called with null vaue");
			return;
		}
		bool flag = false;
		for (int i = 0; i < this.selected_ability.Count; i++)
		{
			if (this.selected_ability[i].slot == b.slot)
			{
				this.selected_ability[i] = b;
				flag = true;
			}
		}
		if (!flag)
		{
			this.selected_ability.Add(b);
		}
		this.ability_directory.name_label.text = b.name;
		globals.armory_main.testfire_panel.set_ability(b);
	}

	// Token: 0x06000F10 RID: 3856 RVA: 0x0006B594 File Offset: 0x00069794
	private void send_ability(AbilityDBItemClass data)
	{
		if (this.ability_currently_equipped(data.id) && !Application.isEditor)
		{
			globals.debug("selected ability is already on gear");
			return;
		}
		DMOManager.LogGameAction("ability_equip", "start", AnalyticsStrings.GetAnalyticsTranslationName(data.id), null);
		globals.debug("sending ability");
		if (globals.gear_daisy)
		{
			globals.gear_daisy.play_sync();
		}
		if (this.equipped_ability.ContainsKey(data.slot))
		{
			this.equipped_ability[data.slot] = data.id;
		}
		else
		{
			this.equipped_ability.Add(data.slot, data.id);
		}
		this.reset_gear_update_countup();
		Ability ability = new Ability();
		ability.isCustom = false;
		ability.toyid = "AbilData." + data.id;
		AbilityDBItemClass.slot_enum slot = data.slot;
		if (slot != AbilityDBItemClass.slot_enum.Deploy)
		{
			if (slot != AbilityDBItemClass.slot_enum.Gesture)
			{
				ability.armloc = 1;
			}
			else
			{
				ability.armloc = 4;
			}
		}
		else
		{
			ability.armloc = 2;
		}
		AchievementEvents.inst.manually_activate_event("ARMORY_TRANSFER");
		globals.BLE_manager.sendSetAbility(ability);
		for (int i = 0; i < this.ability_directory.ability_type_panel.option.Count; i++)
		{
			if (this.ability_directory.ability_type_panel.option[i].slot == data.slot)
			{
				this.ability_directory.ability_type_panel.option[i].set_equipped(data.id);
			}
		}
	}

	// Token: 0x06000F11 RID: 3857 RVA: 0x0006B73C File Offset: 0x0006993C
	private bool ability_currently_equipped(string id)
	{
		return this.correct_mola_connected() && this.equipped_ability.ContainsValue(id);
	}

	// Token: 0x06000F12 RID: 3858 RVA: 0x0006B758 File Offset: 0x00069958
	private bool ability_can_be_equipped(string id)
	{
		return !this._mola_busy && this.correct_mola_connected() && !this.ability_currently_equipped(id) && globals.player_data.connected_device_data.unlocks.Contains(id);
	}

	// Token: 0x06000F13 RID: 3859 RVA: 0x0006B7AC File Offset: 0x000699AC
	private void send_check()
	{
		AbilityDBItemClass data = this.ability_directory.ability_button_C.data;
		this.send_button.label.text = Localization.Get("ABILITY_UNEQUIPPED");
		if (!data || !this.correct_mola_connected())
		{
			this.set_send_btn_state(false);
			this.set_info_button(data);
		}
		else if (this.correct_mola_connected())
		{
			if (this.ability_currently_equipped(data.id))
			{
				this.set_send_btn_state(false);
				this.set_info_button(null);
				this.send_button.label.text = Localization.Get("ABILITY_EQUIPPED");
			}
			else if (!this.ability_can_be_equipped(data.id))
			{
				this.set_send_btn_state(false);
				this.set_info_button(data);
			}
			else
			{
				this.set_send_btn_state(true);
				this.set_info_button(null);
				if (this.send_button.clicked)
				{
					this.send_ability(data);
				}
			}
		}
		else
		{
			this.set_send_btn_state(false);
			this.set_info_button(null);
		}
		if (this.info_button && this.info_button.clicked)
		{
			this.show_info_popup(data);
		}
	}

	// Token: 0x06000F14 RID: 3860 RVA: 0x0006B8DC File Offset: 0x00069ADC
	private bool correct_mola_connected()
	{
		return globals.player_data.connected_device_data && globals.player_data.connected_device_data.type.ToString() == this.ability_directory.ability_type_panel.mola;
	}

	// Token: 0x06000F15 RID: 3861 RVA: 0x0006B928 File Offset: 0x00069B28
	private void set_info_button(AbilityDBItemClass ability)
	{
		if (!this.info_button)
		{
			return;
		}
		if (!ability)
		{
			this.info_button.gameObject.SetActive(false);
			return;
		}
		this.info_button.gameObject.SetActive(true);
		if ((!Application.isEditor || !this.fake_gear_connection) && !this.correct_mola_connected())
		{
			GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(ability.mola, true) as GearDBItemClass;
			if (gearDBItemClass)
			{
				this.info_button.label.text = Localization.Get("ABILITY_UNLOCK_INFO_CONNECT").Replace("$MOLA", gearDBItemClass.name);
			}
			else
			{
				this.info_button.gameObject.SetActive(false);
				globals.debugWarning("bad mola from ability: " + ability.name);
			}
			return;
		}
		this.info_button.label.text = ability.unlock_text();
	}

	// Token: 0x06000F16 RID: 3862 RVA: 0x0006BA28 File Offset: 0x00069C28
	private void show_info_popup(AbilityDBItemClass ability)
	{
		if (!ability)
		{
			return;
		}
		string title = string.Empty;
		string body = string.Empty;
		if ((!Application.isEditor || !this.fake_gear_connection) && !this.correct_mola_connected())
		{
			GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(ability.mola, true) as GearDBItemClass;
			if (gearDBItemClass)
			{
				body = Localization.Get("ABILITY_UNLOCK_POPUP_CONNECT_BODY").Replace("$MOLA", gearDBItemClass.name);
				globals.show_OK_alert(string.Empty, body, null);
			}
			return;
		}
		switch (ability.unlock.type)
		{
		case AbilityDBItemClass.unlock_enum.level:
			title = Localization.Get("ABILITY_UNLOCK_POPUP_LEVEL_HEADER").Replace("$LEVEL", ability.unlock.value).Replace("$ABILITY", ability.name);
			body = Localization.Get("ABILITY_UNLOCK_POPUP_LEVEL_BODY").Replace("$LEVEL", globals.current_gear_level().ToString());
			globals.show_OK_alert(title, body, null);
			break;
		case AbilityDBItemClass.unlock_enum.sf:
		{
			SFDBItemClass sfdbitemClass = globals.database_data.item_by_id(ability.unlock.value, true) as SFDBItemClass;
			if (sfdbitemClass)
			{
				title = Localization.Get("ABILITY_UNLOCK_POPUP_SF_HEADER").Replace("$SF", sfdbitemClass.name).Replace("$ABILITY", ability.name);
				body = Localization.Get("ABILITY_UNLOCK_POPUP_SF_BODY").Replace("$SF", sfdbitemClass.name).Replace("$LEVEL", globals.player_data.getSFLevel(sfdbitemClass.id).ToString());
				globals.show_OK_alert(title, body, null);
			}
			break;
		}
		case AbilityDBItemClass.unlock_enum.action:
			title = Localization.Get("ABILITY_UNLOCK_POPUP_LASER_HEADER");
			body = Localization.Get("ABILITY_UNLOCK_POPUP_LASER_BODY");
			globals.show_OK_alert(title, body, null);
			break;
		}
	}

	// Token: 0x06000F17 RID: 3863 RVA: 0x0006BC08 File Offset: 0x00069E08
	private void set_send_btn_state(bool enabled)
	{
		this.send_button.disabled = !enabled;
		this.send_button.label.alpha = (enabled ? 1f : 0.5f);
		this.send_btn_outline.gameObject.SetActive(enabled);
	}

	// Token: 0x06000F18 RID: 3864 RVA: 0x0006BC5C File Offset: 0x00069E5C
	private void show_instructions(AbilityDBItemClass.slot_enum type)
	{
		DBItemClass dbitemClass = null;
		switch (type)
		{
		case AbilityDBItemClass.slot_enum.ThndrClp:
			dbitemClass = globals.database_data.item_by_id("THUNDER_CLAP_GG", true);
			break;
		case AbilityDBItemClass.slot_enum.GrndSlam:
			dbitemClass = globals.database_data.item_by_id("GROUND_SLAM_GG", true);
			break;
		case AbilityDBItemClass.slot_enum.Throw:
			dbitemClass = globals.database_data.item_by_id("THROW_GG", true);
			break;
		case AbilityDBItemClass.slot_enum.HlkAsst:
			dbitemClass = globals.database_data.item_by_id("WAVE_GG", true);
			break;
		case AbilityDBItemClass.slot_enum.DblPnch:
			dbitemClass = globals.database_data.item_by_id("DOUBLE_PUNCH_GG", true);
			break;
		case AbilityDBItemClass.slot_enum.Block:
			dbitemClass = globals.database_data.item_by_id("BLOCK_GG", true);
			break;
		}
		if (globals.poster_album && dbitemClass)
		{
			globals.poster_album.show(dbitemClass);
		}
	}

	// Token: 0x06000F19 RID: 3865 RVA: 0x0006BD3C File Offset: 0x00069F3C
	public void StartTesting()
	{
		this.test_button.play_sfx();
		globals.armory_main.toggle_testfire(true);
		DMOManager.LogNavigation("armory_test_fire", "test_btn", NavigationManager.current_scene(), null);
	}

	// Token: 0x06000F1A RID: 3866 RVA: 0x0006BD74 File Offset: 0x00069F74
	private void Update()
	{
		if (globals.build_type == build_type_enum.no_gear_demo && globals.gear_daisy)
		{
			globals.gear_daisy.gameObject.SetActive(false);
		}
		if (this.test_button.clicked)
		{
			this.StartTesting();
		}
		if (this.instructions_button && this.instructions_button.clicked)
		{
			this.show_instructions(this.ability_directory.ability_type_panel.option[this.ability_directory.ability_type_panel.current].slot);
		}
		globals.armory_main.armory_exit_check();
		this.send_check();
		if (!this._mola_busy)
		{
			this._gear_update_countup += Time.deltaTime;
			if (this._gear_update_countup > this.gear_update_freq)
			{
				this.get_abilities_on_gear();
			}
		}
		else if (!globals.BLE_manager.connectedDevice_data)
		{
			this._mola_busy = false;
			this._gear_update_countup = 0f;
		}
	}

	// Token: 0x04000F87 RID: 3975
	public TweenPosition directory_tween;

	// Token: 0x04000F88 RID: 3976
	public AbilityDirectoryBehavior ability_directory;

	// Token: 0x04000F89 RID: 3977
	public buttonBehavior test_button;

	// Token: 0x04000F8A RID: 3978
	public buttonBehavior instructions_button;

	// Token: 0x04000F8B RID: 3979
	public LabelledButtonBehavior send_button;

	// Token: 0x04000F8C RID: 3980
	public UISprite send_btn_outline;

	// Token: 0x04000F8D RID: 3981
	public LabelledButtonBehavior info_button;

	// Token: 0x04000F8E RID: 3982
	public float gear_update_freq = 5f;

	// Token: 0x04000F8F RID: 3983
	public bool fake_gear_connection;

	// Token: 0x04000F90 RID: 3984
	private List<AbilityDBItemClass> selected_ability = new List<AbilityDBItemClass>();

	// Token: 0x04000F91 RID: 3985
	private Dictionary<AbilityDBItemClass.slot_enum, string> equipped_ability = new Dictionary<AbilityDBItemClass.slot_enum, string>();

	// Token: 0x04000F92 RID: 3986
	private float _gear_update_countup;

	// Token: 0x04000F93 RID: 3987
	private bool _mola_busy;
}
