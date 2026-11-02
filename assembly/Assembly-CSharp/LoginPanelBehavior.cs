using System;
using System.Globalization;
using UnityEngine;

// Token: 0x020002B5 RID: 693
public class LoginPanelBehavior : MonoBehaviour
{
	// Token: 0x06001288 RID: 4744 RVA: 0x00083EE4 File Offset: 0x000820E4
	private void Start()
	{
		this.error_label.text = string.Empty;
		this.username_input.label.text = string.Empty;
		this.password_input.label.text = string.Empty;
		this.month_label.text = string.Empty;
		this.day_input.label.text = string.Empty;
		this.year_input.label.text = string.Empty;
		this.month_picker.show(false);
		this.field_test_blocker.SetActive(globals.build_type == build_type_enum.field_test);
	}

	// Token: 0x06001289 RID: 4745 RVA: 0x00083F84 File Offset: 0x00082184
	public float age()
	{
		int num = (!string.IsNullOrEmpty(this.day_input.label.text)) ? int.Parse(this.day_input.label.text) : 0;
		int num2 = (!string.IsNullOrEmpty(this.year_input.label.text)) ? int.Parse(this.year_input.label.text) : 0;
		if (this._month < 1 || num < 1 || num2 < 1)
		{
			return -1f;
		}
		if (num2 > 0 && num2 < 1000)
		{
			if (num2 + 2000 < DateTime.Now.Year)
			{
				num2 += 2000;
			}
			else
			{
				num2 += 1900;
			}
		}
		if (num > DateTime.DaysInMonth(num2, this._month))
		{
			return -1f;
		}
		this.birthday_string = string.Concat(new string[]
		{
			num2.ToString(),
			"-",
			this._month.ToString("00"),
			"-",
			num.ToString("00")
		});
		if (this.debug_birthday)
		{
			globals.debug("birthday string = " + this.birthday_string);
		}
		DateTime dateTime;
		if (!DateTime.TryParseExact(this.birthday_string, "yyyy-MM-dd", new CultureInfo("en-US"), 0, ref dateTime))
		{
			return -1f;
		}
		if (dateTime.CompareTo(DateTime.Now) < 0)
		{
			if (this.debug_birthday)
			{
				globals.debug(string.Concat(new string[]
				{
					"now = ",
					DateTime.Now.ToShortDateString(),
					" | bd = ",
					dateTime.ToShortDateString(),
					"\ndays diff = ",
					(DateTime.Now - dateTime).Days.ToString()
				}));
			}
			return (float)(DateTime.Now - dateTime).Days / 365f;
		}
		return -1f;
	}

	// Token: 0x0600128A RID: 4746 RVA: 0x000841AC File Offset: 0x000823AC
	public void set_month(int m)
	{
		this.month_label.text = ((month_enum)m).ToString();
		this._month = m;
		globals.sfx_master.play(this.login_main.button_press_sfx, null);
	}

	// Token: 0x0600128B RID: 4747 RVA: 0x000841EC File Offset: 0x000823EC
	private void login_pressed()
	{
		if (TouchScreenKeyboard.visible)
		{
			return;
		}
		this.login_button.play_flash();
		this.error_label.text = string.Empty;
		if (!globals.network_manager)
		{
			globals.debugWarning("no network manager found");
			return;
		}
		if (string.IsNullOrEmpty(this.username_input.value))
		{
			this.error_label.text = "Please enter a username";
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		if (string.IsNullOrEmpty(this.password_input.value))
		{
			this.error_label.text = "Please enter your password";
			globals.sfx_master.play(this.login_main.error_sfx, null);
			return;
		}
		DMOManager.LogloginStart();
		this.login_with_credentials(this.username_input.value.Trim(), this.password_input.value);
		this.login_button.play_sfx();
	}

	// Token: 0x0600128C RID: 4748 RVA: 0x000842E4 File Offset: 0x000824E4
	public void login_with_credentials(string username, string password)
	{
		this.login_main.show_auth_popup(true);
		globals.network_manager.Login(username, password, globals.player_data, new WebHandler.HttpResultDelegate(this.login_successful), new WebHandler.HttpErrorDelegate(this.login_failed));
	}

	// Token: 0x0600128D RID: 4749 RVA: 0x00084328 File Offset: 0x00082528
	private void login_successful(JSONObject obj)
	{
		globals.account_data.parse(obj);
		this.login_main.load_next_scene();
		DMOManager.LogloginSuccess();
	}

	// Token: 0x0600128E RID: 4750 RVA: 0x00084348 File Offset: 0x00082548
	private void login_failed(string url, string errText)
	{
		globals.debugWarning("login failed. url = " + url + "\nerrText = " + errText);
		string text = string.Empty;
		JSONObject jsonobject = new JSONObject(errText, -2, false, false);
		JSONObject jsonobject2 = jsonobject.drill_to(new object[]
		{
			"error",
			"serviceError",
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
			"details",
			0,
			"optionalDeveloperMessage"
		});
		if (string.IsNullOrEmpty(text) && jsonobject2 != null)
		{
			text = (string.IsNullOrEmpty(jsonobject2.str) ? string.Empty : jsonobject2.str);
		}
		if (errText.ToLower().Contains("offline"))
		{
			this.error_label.text = "No internet connection detected.";
		}
		else if (errText.Contains("A server with the specified hostname could not be found."))
		{
			this.error_label.text = "Can not connect to server.";
		}
		else if (errText.Contains("401"))
		{
			this.error_label.text = "Invalid Username/Password combination.";
		}
		else
		{
			this.error_label.text = (string.IsNullOrEmpty(text) ? "Login Failed" : text);
		}
		globals.sfx_master.play(this.login_main.error_sfx, null);
		this.login_main.show_auth_popup(false);
		base.gameObject.SetActive(true);
		this.login_main.registration_panel.gameObject.SetActive(false);
		DMOManager.LogloginFail(this.error_label.text);
	}

	// Token: 0x0600128F RID: 4751 RVA: 0x0008451C File Offset: 0x0008271C
	private void continue_pressed()
	{
		if (TouchScreenKeyboard.visible)
		{
			return;
		}
		this.continue_button.play_flash();
		this.error_label.text = string.Empty;
		float num = this.age();
		if (this.debug_birthday)
		{
			globals.debug("age = " + num.ToString("0.00"));
		}
		if (num < 0f)
		{
			this.error_label.text = "Invalid birthday!";
			globals.sfx_master.play(this.login_main.error_sfx, null);
		}
		else
		{
			base.gameObject.SetActive(false);
			this.login_main.registration_panel.username_input.label.text = this.username_input.value;
			this.login_main.registration_panel.set_age(num);
			this.login_main.registration_panel.gameObject.SetActive(true);
			this.continue_button.play_sfx();
		}
	}

	// Token: 0x06001290 RID: 4752 RVA: 0x00084618 File Offset: 0x00082818
	private void Update()
	{
		if (Input.GetMouseButtonDown(0))
		{
			if (globals.selectedObject == this.login_button.gameObject)
			{
				this.login_pressed();
			}
			else if (globals.selectedObject == this.continue_button.gameObject)
			{
				this.continue_pressed();
			}
			else if (globals.selectedObject == this.month_collider.gameObject)
			{
				this.month_picker.show(true);
				globals.sfx_master.play(this.login_main.button_press_sfx, null);
			}
		}
		if (this._month != this.month_picker.month)
		{
			this.set_month(this.month_picker.month);
		}
	}

	// Token: 0x0400133B RID: 4923
	public UIInput username_input;

	// Token: 0x0400133C RID: 4924
	public UIInput password_input;

	// Token: 0x0400133D RID: 4925
	public FlashyButtonBehavior login_button;

	// Token: 0x0400133E RID: 4926
	public UILabel month_label;

	// Token: 0x0400133F RID: 4927
	public Collider month_collider;

	// Token: 0x04001340 RID: 4928
	public UIInput day_input;

	// Token: 0x04001341 RID: 4929
	public UIInput year_input;

	// Token: 0x04001342 RID: 4930
	public FlashyButtonBehavior continue_button;

	// Token: 0x04001343 RID: 4931
	public UILabel error_label;

	// Token: 0x04001344 RID: 4932
	public MonthPickerBehavior month_picker;

	// Token: 0x04001345 RID: 4933
	public string birthday_string;

	// Token: 0x04001346 RID: 4934
	public GameObject field_test_blocker;

	// Token: 0x04001347 RID: 4935
	public bool debug_birthday;

	// Token: 0x04001348 RID: 4936
	internal LoginMainBehavior login_main;

	// Token: 0x04001349 RID: 4937
	private int _month;
}
