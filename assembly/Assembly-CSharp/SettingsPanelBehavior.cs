using System;
using UnityEngine;

// Token: 0x020002A2 RID: 674
public class SettingsPanelBehavior : HQMenuPanelBehavior
{
	// Token: 0x06001245 RID: 4677 RVA: 0x00081D64 File Offset: 0x0007FF64
	private void Awake()
	{
		this.sfx_toggle.value = !SFXJukeboxBehavior.muted;
		this.music_toggle.value = !MusicJukeboxBehavior.muted;
	}

	// Token: 0x06001246 RID: 4678 RVA: 0x00081D98 File Offset: 0x0007FF98
	private void Start()
	{
		this.test_button_panel.gameObject.SetActive(!globals.player_data.isGuestLogin() && globals.build_type == build_type_enum.development);
		this.log_from = NavigationManager.settings_panel;
	}

	// Token: 0x06001247 RID: 4679 RVA: 0x00081DDC File Offset: 0x0007FFDC
	public void show()
	{
		base.gameObject.SetActive(true);
		this.sfx_toggle.value = !SFXJukeboxBehavior.muted;
		this.music_toggle.value = !MusicJukeboxBehavior.muted;
	}

	// Token: 0x06001248 RID: 4680 RVA: 0x00081E1C File Offset: 0x0008001C
	protected override void Update()
	{
		if (SFXJukeboxBehavior.muted == this.sfx_toggle.value)
		{
			SFXJukeboxBehavior.muted = !this.sfx_toggle.value;
		}
		if (MusicJukeboxBehavior.muted == this.music_toggle.value)
		{
			MusicJukeboxBehavior.muted = !this.music_toggle.value;
		}
		if (this.tos_button.clicked)
		{
			globals.URL_roster.show_tos();
		}
		else if (this.privacy_policy_button.clicked)
		{
			globals.URL_roster.show_privacy();
		}
		else if (this.privacy_faqs_button.clicked)
		{
			globals.URL_roster.show_privacy_faqs();
		}
		else if (this.playmation_button.clicked)
		{
			globals.URL_roster.show_website();
		}
		else if (this.playmation_help_button.clicked)
		{
			globals.URL_roster.show_help();
		}
		else if (this.legal_notices_button.clicked)
		{
			globals.URL_roster.show_legal();
		}
		else if (this.replay_welcome_button.clicked)
		{
			Handheld.PlayFullScreenMovie(this.intro_movie_name, Color.black, 0, 2);
		}
		else if (this.restart_HQ_button.clicked && globals.hq_main && globals.hq_main.ftue_tour_group)
		{
			globals.hq_main.start_tour();
		}
		this.sdk_label.text = "PORTAL " + globals.sdkVersion;
		base.Update();
	}

	// Token: 0x040012BF RID: 4799
	public UILabel sdk_label;

	// Token: 0x040012C0 RID: 4800
	public buttonBehavior tos_button;

	// Token: 0x040012C1 RID: 4801
	public buttonBehavior privacy_policy_button;

	// Token: 0x040012C2 RID: 4802
	public buttonBehavior privacy_faqs_button;

	// Token: 0x040012C3 RID: 4803
	public buttonBehavior legal_notices_button;

	// Token: 0x040012C4 RID: 4804
	public buttonBehavior playmation_button;

	// Token: 0x040012C5 RID: 4805
	public buttonBehavior playmation_help_button;

	// Token: 0x040012C6 RID: 4806
	public buttonBehavior replay_welcome_button;

	// Token: 0x040012C7 RID: 4807
	public buttonBehavior restart_HQ_button;

	// Token: 0x040012C8 RID: 4808
	public TestButtonPanelBehavior test_button_panel;

	// Token: 0x040012C9 RID: 4809
	public UIToggle sfx_toggle;

	// Token: 0x040012CA RID: 4810
	public UIToggle music_toggle;

	// Token: 0x040012CB RID: 4811
	public string intro_movie_name = "intro_movie.mp4";
}
