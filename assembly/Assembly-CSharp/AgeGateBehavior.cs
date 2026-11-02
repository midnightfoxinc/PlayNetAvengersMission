using System;
using System.Globalization;
using UnityEngine;

// Token: 0x020002FD RID: 765
public class AgeGateBehavior : MonoBehaviour
{
	// Token: 0x06001412 RID: 5138 RVA: 0x00090424 File Offset: 0x0008E624
	private void Start()
	{
	}

	// Token: 0x06001413 RID: 5139 RVA: 0x00090428 File Offset: 0x0008E628
	public void show(bool b)
	{
		base.gameObject.SetActive(b);
		if (b)
		{
			this.month_picker.show(false);
			this.month_label.text = string.Empty;
			this.day_input.label.text = string.Empty;
			this.day_input.value = string.Empty;
			this.year_input.label.text = string.Empty;
			this.year_input.value = string.Empty;
			this.error_label.text = string.Empty;
		}
	}

	// Token: 0x06001414 RID: 5140 RVA: 0x000904C0 File Offset: 0x0008E6C0
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

	// Token: 0x06001415 RID: 5141 RVA: 0x000906E8 File Offset: 0x0008E8E8
	public void set_month(int m)
	{
		this.month_label.text = ((month_enum)m).ToString();
		this._month = m;
	}

	// Token: 0x06001416 RID: 5142 RVA: 0x00090708 File Offset: 0x0008E908
	private void continue_pressed()
	{
		if (TouchScreenKeyboard.visible)
		{
			return;
		}
		this.error_label.text = string.Empty;
		float num = this.age();
		if (this.debug_birthday)
		{
			globals.debug("age = " + num.ToString("0.00"));
		}
		if (num < 0f)
		{
			this.error_label.text = "Invalid birthday. Please try again.";
			globals.sfx_master.play(this.error_sfx, null);
		}
		else if (num < 18f)
		{
			this.show(false);
			globals.show_OK_alert("Age Gate", "Please ask an adult for help.", null);
		}
		else
		{
			this.show(false);
			globals.store_main.age_gate_passed();
		}
	}

	// Token: 0x06001417 RID: 5143 RVA: 0x000907C8 File Offset: 0x0008E9C8
	private void Update()
	{
		if (this.cancel_button.hit)
		{
			this.cancel_button.play_sfx();
			this.show(false);
		}
		else if (this.continue_button.hit)
		{
			this.continue_pressed();
		}
		else if (Input.GetMouseButtonDown(0) && globals.selectedObject == this.month_collider.gameObject)
		{
			this.month_picker.show(true);
		}
		if (this._month != this.month_picker.month)
		{
			this.set_month(this.month_picker.month);
		}
	}

	// Token: 0x040015F6 RID: 5622
	public MonthPickerBehavior month_picker;

	// Token: 0x040015F7 RID: 5623
	public UILabel month_label;

	// Token: 0x040015F8 RID: 5624
	public Collider month_collider;

	// Token: 0x040015F9 RID: 5625
	public UIInput day_input;

	// Token: 0x040015FA RID: 5626
	public UIInput year_input;

	// Token: 0x040015FB RID: 5627
	public buttonBehavior continue_button;

	// Token: 0x040015FC RID: 5628
	public buttonBehavior cancel_button;

	// Token: 0x040015FD RID: 5629
	public UILabel error_label;

	// Token: 0x040015FE RID: 5630
	public string error_sfx;

	// Token: 0x040015FF RID: 5631
	public string birthday_string;

	// Token: 0x04001600 RID: 5632
	public bool debug_birthday;

	// Token: 0x04001601 RID: 5633
	private int _month;
}
