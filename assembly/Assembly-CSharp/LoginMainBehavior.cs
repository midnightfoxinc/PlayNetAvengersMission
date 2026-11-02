using System;
using UnityEngine;

// Token: 0x020001A0 RID: 416
public class LoginMainBehavior : MonoBehaviour
{
	// Token: 0x06000C86 RID: 3206 RVA: 0x0005B1B4 File Offset: 0x000593B4
	private void Start()
	{
		this.login_panel.login_main = this;
		this.registration_panel.login_main = this;
		this.first_name_panel.login_main = this;
		this.login_panel.gameObject.SetActive(false);
		this.registration_panel.gameObject.SetActive(false);
		this.first_name_panel.gameObject.SetActive(false);
		this.authenticating_popup.gameObject.SetActive(false);
		this.registration_panel.legalese_panel.gameObject.SetActive(false);
		globals.music_jukebox.change_music(this.music, 0.25f);
		if (this.jarvis_jukebox)
		{
			this.jarvis_jukebox.play(this.jarvis_sfx, null);
		}
		this.launchLoginPanel();
	}

	// Token: 0x06000C87 RID: 3207 RVA: 0x0005B27C File Offset: 0x0005947C
	private void launchLoginPanel()
	{
		if (globals.network_manager.connected())
		{
			DMOManager.LogloginScreen("login");
			globals.DisneyIDManager.login_main = this;
			globals.DisneyIDManager.onLaunchLogin();
		}
		else
		{
			this.no_internet = true;
			globals.show_confirm_alert(Localization.Get("CONNECTION_HEADER"), Localization.Get("NO_INTERNET"), new EventDelegate.Callback(this.OnSkip), new EventDelegate.Callback(this.OnOK), Localization.Get("SKIP"), Localization.Get("OKAY"), true);
		}
	}

	// Token: 0x06000C88 RID: 3208 RVA: 0x0005B30C File Offset: 0x0005950C
	public void OnOK()
	{
	}

	// Token: 0x06000C89 RID: 3209 RVA: 0x0005B310 File Offset: 0x00059510
	public void OnSkip()
	{
		globals.FTUE_manager.set_state(this.skip_state, true);
	}

	// Token: 0x06000C8A RID: 3210 RVA: 0x0005B324 File Offset: 0x00059524
	private void OnApplicationPause(bool paused)
	{
		if (!paused && this.no_internet && !GameObject.Find("ConfirmationPopupAlert"))
		{
			this.launchLoginPanel();
		}
	}

	// Token: 0x06000C8B RID: 3211 RVA: 0x0005B354 File Offset: 0x00059554
	public void show_auth_popup(bool b)
	{
		if (this.authenticating_popup)
		{
			this.authenticating_popup.SetActive(b);
		}
	}

	// Token: 0x06000C8C RID: 3212 RVA: 0x0005B374 File Offset: 0x00059574
	public void load_next_scene()
	{
		globals.debug("player authenticated = " + globals.player_data.isAuthenticated().ToString());
		globals.debug("player id = " + globals.player_data.id);
		globals.FTUE_manager.just_logged_in = true;
		if (globals.BLE_manager.any_unregistered_devices())
		{
			globals.FTUE_manager.set_state(this.next_state, false);
		}
		else
		{
			globals.FTUE_manager.set_state(this.skip_state, true);
		}
	}

	// Token: 0x06000C8D RID: 3213 RVA: 0x0005B3FC File Offset: 0x000595FC
	public void load_skip_scene()
	{
		globals.sfx_master.play(this.button_press_sfx, null);
		globals.FTUE_manager.set_state(this.skip_state, true);
	}

	// Token: 0x06000C8E RID: 3214 RVA: 0x0005B42C File Offset: 0x0005962C
	private void Update()
	{
		if (Input.GetMouseButtonDown(0) && globals.selectedObject == this.skip_collider.gameObject)
		{
			this.load_skip_scene();
		}
		else if (this.login_panel.gameObject.activeInHierarchy && globals.FTUE_manager.done && Input.GetKeyDown(27))
		{
			globals.sfx_master.play(this.button_press_sfx, null);
			globals.FTUE_manager.set_state(this.skip_state, true);
		}
	}

	// Token: 0x04000C4F RID: 3151
	public LoginPanelBehavior login_panel;

	// Token: 0x04000C50 RID: 3152
	public RegistrationPanelBehavior registration_panel;

	// Token: 0x04000C51 RID: 3153
	public FirstNamePanelBehavior first_name_panel;

	// Token: 0x04000C52 RID: 3154
	public GameObject authenticating_popup;

	// Token: 0x04000C53 RID: 3155
	public Collider skip_collider;

	// Token: 0x04000C54 RID: 3156
	public SFXJukeboxBehavior jarvis_jukebox;

	// Token: 0x04000C55 RID: 3157
	public int age_band_1 = 8;

	// Token: 0x04000C56 RID: 3158
	public int age_band_2 = 13;

	// Token: 0x04000C57 RID: 3159
	public int age_band_3 = 18;

	// Token: 0x04000C58 RID: 3160
	public string button_press_sfx = "button click";

	// Token: 0x04000C59 RID: 3161
	public string error_sfx = "error";

	// Token: 0x04000C5A RID: 3162
	public string music;

	// Token: 0x04000C5B RID: 3163
	public string jarvis_sfx = "login";

	// Token: 0x04000C5C RID: 3164
	public string next_state = "register device";

	// Token: 0x04000C5D RID: 3165
	public string skip_state = "register later";

	// Token: 0x04000C5E RID: 3166
	public bool skip_first_name;

	// Token: 0x04000C5F RID: 3167
	private bool no_internet;
}
