using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002BA RID: 698
public class RegistrationPanelBehavior : MonoBehaviour
{
	// Token: 0x1700022A RID: 554
	// (get) Token: 0x06001299 RID: 4761 RVA: 0x0008485C File Offset: 0x00082A5C
	// (set) Token: 0x0600129A RID: 4762 RVA: 0x00084864 File Offset: 0x00082A64
	public RegistrationPanelBehavior.age_band_enum age_band
	{
		get
		{
			return this._age_band;
		}
		set
		{
			this._age_band = value;
			this.username_title_label.text = ((!this._kid) ? "Email" : "Username (used for Login)");
			this.last_name_input.gameObject.SetActive(!this._kid);
			this.parent_email_input.gameObject.SetActive(this._kid);
			this.gender_toggle.gameObject.SetActive(this._kid);
			this.back_button.gameObject.SetActive(!this._kid);
			this.marketing_checkbox.gameObject.SetActive(!this._kid);
		}
	}

	// Token: 0x1700022B RID: 555
	// (get) Token: 0x0600129B RID: 4763 RVA: 0x00084914 File Offset: 0x00082B14
	private bool _kid
	{
		get
		{
			return this._age_band == RegistrationPanelBehavior.age_band_enum.child;
		}
	}

	// Token: 0x0600129C RID: 4764 RVA: 0x00084920 File Offset: 0x00082B20
	public void set_age(float n)
	{
		if (n < 13f)
		{
			this.age_band = RegistrationPanelBehavior.age_band_enum.child;
		}
		else if (n < 18f)
		{
			this.age_band = RegistrationPanelBehavior.age_band_enum.teen;
		}
		else
		{
			this.age_band = RegistrationPanelBehavior.age_band_enum.adult;
		}
	}

	// Token: 0x0600129D RID: 4765 RVA: 0x00084958 File Offset: 0x00082B58
	private void Start()
	{
		this.username_input.label.text = string.Empty;
		this.display_name_input.label.text = string.Empty;
		for (int i = 0; i < this.password_input.Length; i++)
		{
			this.password_input[i].label.text = string.Empty;
		}
		this.first_name_input.label.text = string.Empty;
		this.last_name_input.label.text = string.Empty;
		this.parent_email_input.label.text = string.Empty;
		this.error_label.text = string.Empty;
		this.marketing_checkbox.value = !this.canada;
		this.overview_button.gameObject.SetActive(this.canada);
		DMOManager.LogloginScreen("registration");
	}

	// Token: 0x0600129E RID: 4766 RVA: 0x00084A44 File Offset: 0x00082C44
	private bool is_valid_email(string e)
	{
		string[] array = e.Split(new char[]
		{
			'@'
		});
		return array.Length == 2 && array[1].Contains(".");
	}

	// Token: 0x0600129F RID: 4767 RVA: 0x00084A84 File Offset: 0x00082C84
	private void submit_pressed()
	{
		if (TouchScreenKeyboard.visible)
		{
			return;
		}
		this.submit_button.play_flash();
		string parent_email = (!this._kid) ? this.username_input.value : this.parent_email_input.value;
		if (this.password_input[0].value != this.password_input[1].value)
		{
			this.error_type = RegistrationPanelBehavior.error_enum.password_mismatch;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (string.IsNullOrEmpty(this.username_input.value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.username_empty;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (string.IsNullOrEmpty(this.password_input[0].value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.password_empty;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (string.IsNullOrEmpty(this.display_name_input.value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.displayname_empty;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (string.IsNullOrEmpty(this.first_name_input.value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.firstname_empty;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (this._kid && string.IsNullOrEmpty(this.parent_email_input.value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.parent_email_empty;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (this._kid && !this.is_valid_email(this.parent_email_input.value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.INVALID_PARENT_EMAIL;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (!this._kid && string.IsNullOrEmpty(this.last_name_input.value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.lastname_empty;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (!this.tos_checkbox.value)
		{
			this.error_type = RegistrationPanelBehavior.error_enum.tos_unchecked;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (!this._kid && !this.is_valid_email(this.username_input.value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.username_not_email;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (this._kid && this.is_valid_email(this.username_input.value))
		{
			this.error_type = RegistrationPanelBehavior.error_enum.kid_username_is_email;
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		this.login_main.show_auth_popup(true);
		globals.network_manager.Register(this._kid, this.username_input.value, this.password_input[0].value, this.login_main.login_panel.birthday_string, parent_email, this.display_name_input.value, this.first_name_input.value, this.last_name_input.value, (gender_enum)this.gender_toggle.current_value(), globals.player_data, new WebHandler.HttpResultDelegate(this.registration_successful), new WebHandler.HttpErrorDelegate(this.registration_failed));
		this.submit_button.play_sfx();
		DMOManager.LogDISIDRegistration(DMOManager.DISID_REGISTRATION_PROGRESS.START, string.Empty);
	}

	// Token: 0x060012A0 RID: 4768 RVA: 0x00084DEC File Offset: 0x00082FEC
	private void registration_successful(JSONObject obj)
	{
		globals.account_data.parse(obj);
		base.gameObject.SetActive(false);
		if (this.login_main.skip_first_name)
		{
			this.login_main.load_next_scene();
		}
		else
		{
			this.login_main.show_auth_popup(false);
			this.login_main.first_name_panel.gameObject.SetActive(true);
			this.login_main.first_name_panel.set_name(this.first_name_input.value);
		}
		DMOManager.LogDISIDRegistration(DMOManager.DISID_REGISTRATION_PROGRESS.SUCCESS, string.Empty);
	}

	// Token: 0x060012A1 RID: 4769 RVA: 0x00084E78 File Offset: 0x00083078
	private void registration_failed(string url, string errText)
	{
		globals.debugWarning("registration failed. url = " + url + "\nerrText = " + errText);
		string text = string.Empty;
		JSONObject jsonobject = new JSONObject(errText, -2, false, false);
		JSONObject jsonobject2 = jsonobject.drill_to(new object[]
		{
			"error",
			"serviceError",
			"details",
			0,
			"optionalDeveloperMessage"
		});
		if (jsonobject2 != null)
		{
			text = (string.IsNullOrEmpty(jsonobject2.str) ? string.Empty : jsonobject2.str);
		}
		jsonobject2 = jsonobject.drill_to(new object[]
		{
			"error",
			"serviceError",
			"optionalDeveloperMessage"
		});
		if (string.IsNullOrEmpty(text) && jsonobject2 != null)
		{
			text = (string.IsNullOrEmpty(jsonobject2.str) ? string.Empty : jsonobject2.str);
		}
		this.error_label.text = (string.IsNullOrEmpty(text) ? "Registration Failed" : text);
		DMOManager.LogDISIDRegistration(DMOManager.DISID_REGISTRATION_PROGRESS.ERROR, string.IsNullOrEmpty(text) ? "Registration Failed" : text);
		this.login_main.show_auth_popup(false);
		globals.sfx_master.play(this.login_main.error_sfx, null);
	}

	// Token: 0x060012A2 RID: 4770 RVA: 0x00084FC0 File Offset: 0x000831C0
	private void legalese_received(JSONObject j)
	{
		globals.debug("legalese retrieved!");
		Dictionary<string, string> dictionary = j.ToDictionary();
		if (dictionary != null && dictionary.ContainsKey("content"))
		{
			this.legalese_panel.set_content(j.ToDictionary()["content"]);
		}
	}

	// Token: 0x060012A3 RID: 4771 RVA: 0x00085010 File Offset: 0x00083210
	private void legalese_failed(string url, string errText)
	{
		globals.debug("legalese failed");
		this.legalese_panel.gameObject.SetActive(false);
	}

	// Token: 0x060012A4 RID: 4772 RVA: 0x00085030 File Offset: 0x00083230
	private void Update()
	{
		if (this.back_button.hit || Input.GetKeyDown(27))
		{
			if (!TouchScreenKeyboard.visible)
			{
				base.gameObject.SetActive(false);
				this.login_main.login_panel.gameObject.SetActive(true);
				globals.sfx_master.play(this.login_main.error_sfx, null);
				DMOManager.LogDISIDRegistration(DMOManager.DISID_REGISTRATION_PROGRESS.CANCEL, string.Empty);
				return;
			}
		}
		else if (Input.GetMouseButtonDown(0))
		{
			if (globals.selectedObject == this.submit_button.gameObject)
			{
				this.submit_pressed();
			}
			else if (this.tos_button.hit)
			{
				this.tos_button.play_flash();
				globals.sfx_master.play(this.login_main.button_press_sfx, null);
				globals.URL_roster.show_tos();
			}
			else if (this.privacy_button.hit)
			{
				this.privacy_button.play_flash();
				globals.sfx_master.play(this.login_main.button_press_sfx, null);
				globals.URL_roster.show_privacy();
			}
			else if (this.overview_button.hit)
			{
				this.overview_button.play_flash();
				globals.sfx_master.play(this.login_main.button_press_sfx, null);
				globals.URL_roster.show_overview();
			}
		}
		if (this._previous_tos_checkbox != this.tos_checkbox.value)
		{
			this._previous_tos_checkbox = this.tos_checkbox.value;
			globals.sfx_master.play((!this.tos_checkbox.value) ? this.login_main.error_sfx : this.login_main.button_press_sfx, null);
		}
		if (this.password_input.Length == 2 && !this.password_input[0].isSelected && !this.password_input[1].isSelected && !string.IsNullOrEmpty(this.password_input[0].value) && !string.IsNullOrEmpty(this.password_input[1].value))
		{
			if (this.password_input[0].value != this.password_input[1].value)
			{
				this.error_type = RegistrationPanelBehavior.error_enum.password_mismatch;
			}
			else if (this.error_type == RegistrationPanelBehavior.error_enum.password_mismatch)
			{
				this.error_type = RegistrationPanelBehavior.error_enum.none;
			}
		}
		if (this.password_input[0].value == this.password_input[1].value && this.error_type == RegistrationPanelBehavior.error_enum.password_mismatch)
		{
			this.error_type = RegistrationPanelBehavior.error_enum.none;
		}
	}

	// Token: 0x04001363 RID: 4963
	public buttonBehavior back_button;

	// Token: 0x04001364 RID: 4964
	public UIInput username_input;

	// Token: 0x04001365 RID: 4965
	public UILabel username_title_label;

	// Token: 0x04001366 RID: 4966
	public UIInput display_name_input;

	// Token: 0x04001367 RID: 4967
	public UIInput[] password_input;

	// Token: 0x04001368 RID: 4968
	public UIInput first_name_input;

	// Token: 0x04001369 RID: 4969
	public UIInput last_name_input;

	// Token: 0x0400136A RID: 4970
	public UIInput parent_email_input;

	// Token: 0x0400136B RID: 4971
	public ToggleGroupBehavior gender_toggle;

	// Token: 0x0400136C RID: 4972
	public UIToggle tos_checkbox;

	// Token: 0x0400136D RID: 4973
	public UIToggle marketing_checkbox;

	// Token: 0x0400136E RID: 4974
	public FlashyButtonBehavior tos_button;

	// Token: 0x0400136F RID: 4975
	public FlashyButtonBehavior privacy_button;

	// Token: 0x04001370 RID: 4976
	public FlashyButtonBehavior overview_button;

	// Token: 0x04001371 RID: 4977
	public LegalesePanelBehavior legalese_panel;

	// Token: 0x04001372 RID: 4978
	public bool canada;

	// Token: 0x04001373 RID: 4979
	public FlashyButtonBehavior submit_button;

	// Token: 0x04001374 RID: 4980
	public UILabel error_label;

	// Token: 0x04001375 RID: 4981
	public RegistrationPanelBehavior.error_enum error_type;

	// Token: 0x04001376 RID: 4982
	internal LoginMainBehavior login_main;

	// Token: 0x04001377 RID: 4983
	private RegistrationPanelBehavior.age_band_enum _age_band;

	// Token: 0x04001378 RID: 4984
	private bool _previous_tos_checkbox;

	// Token: 0x020002BB RID: 699
	public enum error_enum
	{
		// Token: 0x0400137A RID: 4986
		none,
		// Token: 0x0400137B RID: 4987
		password_mismatch,
		// Token: 0x0400137C RID: 4988
		username_empty,
		// Token: 0x0400137D RID: 4989
		displayname_empty,
		// Token: 0x0400137E RID: 4990
		password_empty,
		// Token: 0x0400137F RID: 4991
		firstname_empty,
		// Token: 0x04001380 RID: 4992
		lastname_empty,
		// Token: 0x04001381 RID: 4993
		tos_unchecked,
		// Token: 0x04001382 RID: 4994
		username_not_email,
		// Token: 0x04001383 RID: 4995
		parent_email_empty,
		// Token: 0x04001384 RID: 4996
		kid_username_is_email,
		// Token: 0x04001385 RID: 4997
		not_connected,
		// Token: 0x04001386 RID: 4998
		UNKNOWN_ERROR,
		// Token: 0x04001387 RID: 4999
		INVALID_EMAIL_SIZE,
		// Token: 0x04001388 RID: 5000
		INVALID_EMAIL_FORMAT,
		// Token: 0x04001389 RID: 5001
		INVALID_PARENT_EMAIL,
		// Token: 0x0400138A RID: 5002
		EMAIL_REQUIRED,
		// Token: 0x0400138B RID: 5003
		INVALID_USERNAME,
		// Token: 0x0400138C RID: 5004
		INVALID_USERNAME_SIZE,
		// Token: 0x0400138D RID: 5005
		INVALID_PASSWORD,
		// Token: 0x0400138E RID: 5006
		PASSWORD_INVALID_SIZE,
		// Token: 0x0400138F RID: 5007
		USERNAME_EXISTS
	}

	// Token: 0x020002BC RID: 700
	public enum age_band_enum
	{
		// Token: 0x04001391 RID: 5009
		child,
		// Token: 0x04001392 RID: 5010
		teen,
		// Token: 0x04001393 RID: 5011
		adult
	}
}
