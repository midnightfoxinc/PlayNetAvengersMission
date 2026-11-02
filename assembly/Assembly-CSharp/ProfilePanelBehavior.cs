using System;

// Token: 0x020002CA RID: 714
public class ProfilePanelBehavior : HQMenuPanelBehavior
{
	// Token: 0x060012DD RID: 4829 RVA: 0x00086DEC File Offset: 0x00084FEC
	private void set_mode(ProfilePanelBehavior.mode_enum m)
	{
		this._mode = m;
		for (int i = 0; i < this.option.Length; i++)
		{
			this.option[i].select(m == this.option[i].mode);
		}
		for (int j = 0; j < this.subpanel.Length; j++)
		{
			this.subpanel[j].show(m == this.subpanel[j].mode);
		}
	}

	// Token: 0x060012DE RID: 4830 RVA: 0x00086E6C File Offset: 0x0008506C
	private ProfilePanelBehavior.mode_enum GetMode()
	{
		return this._mode;
	}

	// Token: 0x060012DF RID: 4831 RVA: 0x00086E74 File Offset: 0x00085074
	private void refresh_level()
	{
		int num = globals.current_gear_level();
		if (num > 0)
		{
			float fill = globals.gear_xp_to_fill(globals.player_data.latest_device_data.xp);
			int type = globals.player_data.latest_device_data.type;
			this.level_widget.set_level(num, fill, type);
			this.gear_icon_sprite.spriteName = globals.gear_daisy.gear_icon.spriteName;
		}
		else
		{
			this.level_widget.hide();
		}
		this.avengers_level_button.label.text = globals.player_data.avengers_level().ToString();
	}

	// Token: 0x060012E0 RID: 4832 RVA: 0x00086F10 File Offset: 0x00085110
	private void Awake()
	{
		this._mode = this.starting_mode;
	}

	// Token: 0x060012E1 RID: 4833 RVA: 0x00086F20 File Offset: 0x00085120
	private void Start()
	{
		this.avatar_select_panel.gameObject.SetActive(false);
		for (int i = 0; i < this.option.Length; i++)
		{
			this.option[i].set_count(0);
			this.option[i].profile_panel = this;
		}
		this.avatar_select_panel.profile_panel = this;
		this.refresh_avatar();
		this.set_mode(this.starting_mode);
		this.setAbilitiesLabel();
		this.log_from = NavigationManager.profile_panel;
	}

	// Token: 0x060012E2 RID: 4834 RVA: 0x00086FA4 File Offset: 0x000851A4
	private void setAbilitiesLabel()
	{
		PlayerDeviceClass latest_device_data = globals.player_data.latest_device_data;
		int num = 2101;
		if (latest_device_data != null)
		{
			num = latest_device_data.type;
		}
		string text = Localization.Get("PROFILE_LEFT_ABILITIES");
		if (num == 2111)
		{
			text = Localization.Get("PROFILE_LEFT_ABILITIES_GAMMA");
		}
		this.abilities_label.text = text;
	}

	// Token: 0x060012E3 RID: 4835 RVA: 0x00086FFC File Offset: 0x000851FC
	public void refresh_avatar()
	{
		this.username_label.text = globals.player_data.display_name;
		this.avatar_icon_button.sprite.spriteName = this.avatar_icon_prefix + globals.player_data.avatar;
	}

	// Token: 0x060012E4 RID: 4836 RVA: 0x00087044 File Offset: 0x00085244
	public override void show(bool b)
	{
		base.show(b);
		if (b)
		{
			if (globals.build_type != build_type_enum.no_gear_demo)
			{
				this.refresh_level();
			}
			this.set_mode(this.GetMode());
			this.setAbilitiesLabel();
		}
	}

	// Token: 0x060012E5 RID: 4837 RVA: 0x00087084 File Offset: 0x00085284
	private void option_check()
	{
		if (this._dragging)
		{
			return;
		}
		for (int i = 0; i < this.option.Length; i++)
		{
			if (this.option[i].clicked)
			{
				if (this.option[i].mode == ProfilePanelBehavior.mode_enum.logout)
				{
					string body;
					if (string.IsNullOrEmpty(globals.player_data.display_name))
					{
						body = Localization.Get("LOGOUT_MSG_NO_NAME");
					}
					else
					{
						body = Localization.Get("LOGOUT_MSG").Replace("$NAME", globals.player_data.display_name);
					}
					globals.show_confirm_alert(Localization.Get("LOGOUT_TITLE"), body, new EventDelegate.Callback(this.on_logout), null, Localization.Get("YES"), "CANCEL", false);
				}
				else
				{
					this.set_mode(this.option[i].mode);
				}
			}
		}
	}

	// Token: 0x060012E6 RID: 4838 RVA: 0x00087164 File Offset: 0x00085364
	private void on_logout()
	{
		globals.logout();
		globals.sfx_master.play_sfx(this.logout_sfx);
		globals.hq_main.set_state(hq_menu_state_enum.main);
	}

	// Token: 0x060012E7 RID: 4839 RVA: 0x00087194 File Offset: 0x00085394
	protected override void Update()
	{
		if (this.scroll_view && this.scroll_view.isDragging)
		{
			this._dragging = true;
		}
		for (int i = 0; i < this.subpanel.Length; i++)
		{
			if (this.subpanel[i].dragging)
			{
				this._dragging = true;
			}
		}
		if (!this._dragging && this.avatar_icon_button.clicked)
		{
			this.avatar_select_panel.show();
		}
		this.option_check();
		base.Update();
	}

	// Token: 0x040013D8 RID: 5080
	public buttonBehavior avatar_icon_button;

	// Token: 0x040013D9 RID: 5081
	public UILabel username_label;

	// Token: 0x040013DA RID: 5082
	public LabelledButtonBehavior avengers_level_button;

	// Token: 0x040013DB RID: 5083
	public LevelWidgetBehavior level_widget;

	// Token: 0x040013DC RID: 5084
	public UISprite gear_icon_sprite;

	// Token: 0x040013DD RID: 5085
	public UILabel abilities_label;

	// Token: 0x040013DE RID: 5086
	public UISprite selection_pointer;

	// Token: 0x040013DF RID: 5087
	public ProfilePanelOptionBehavior[] option;

	// Token: 0x040013E0 RID: 5088
	public ProfileSubpanelBehavior[] subpanel;

	// Token: 0x040013E1 RID: 5089
	public AvatarSelectPanelBehavior avatar_select_panel;

	// Token: 0x040013E2 RID: 5090
	public ProfilePanelBehavior.mode_enum starting_mode;

	// Token: 0x040013E3 RID: 5091
	public string avatar_icon_prefix = "avatar_icon_";

	// Token: 0x040013E4 RID: 5092
	public string logout_sfx = "SFX_BackButton";

	// Token: 0x040013E5 RID: 5093
	private ProfilePanelBehavior.mode_enum _mode;

	// Token: 0x020002CB RID: 715
	public enum mode_enum
	{
		// Token: 0x040013E7 RID: 5095
		overview,
		// Token: 0x040013E8 RID: 5096
		feed,
		// Token: 0x040013E9 RID: 5097
		achievements,
		// Token: 0x040013EA RID: 5098
		sf,
		// Token: 0x040013EB RID: 5099
		abilities,
		// Token: 0x040013EC RID: 5100
		logout
	}
}
