using System;
using UnityEngine;

// Token: 0x020002B3 RID: 691
public class FirstNamePanelBehavior : MonoBehaviour
{
	// Token: 0x06001280 RID: 4736 RVA: 0x00083CE8 File Offset: 0x00081EE8
	private void Start()
	{
		this.search_input.label.text = string.Empty;
	}

	// Token: 0x06001281 RID: 4737 RVA: 0x00083D00 File Offset: 0x00081F00
	public void set_name(string n)
	{
		if (n.Length > this.name_character_limit)
		{
			n = n.Substring(0, this.name_character_limit);
		}
		bool flag = false;
		if (flag)
		{
			this.verify_label.text = "Please confirm that we can call you \"[ffff00]" + n.ToUpper() + "[-]\"";
			this.confirm_button.gameObject.SetActive(true);
		}
		else
		{
			this.verify_label.text = "We could not find the name \"[ffff00]" + n.ToUpper() + "[-]\" in our database. Please search for a similar name, or choose not to be called by name.";
			this.confirm_button.gameObject.SetActive(false);
		}
	}

	// Token: 0x06001282 RID: 4738 RVA: 0x00083D9C File Offset: 0x00081F9C
	private void Update()
	{
		if (this.confirm_button.hit)
		{
			this.login_main.load_next_scene();
		}
		else if (this.default_button.hit)
		{
			this.login_main.load_next_scene();
		}
		else if (this.search_button.hit && !string.IsNullOrEmpty(this.search_input.value))
		{
			this.set_name(this.search_input.value);
		}
	}

	// Token: 0x0400132E RID: 4910
	public UILabel verify_label;

	// Token: 0x0400132F RID: 4911
	public buttonBehavior confirm_button;

	// Token: 0x04001330 RID: 4912
	public buttonBehavior default_button;

	// Token: 0x04001331 RID: 4913
	public UIInput search_input;

	// Token: 0x04001332 RID: 4914
	public buttonBehavior search_button;

	// Token: 0x04001333 RID: 4915
	public int name_character_limit = 50;

	// Token: 0x04001334 RID: 4916
	internal LoginMainBehavior login_main;

	// Token: 0x04001335 RID: 4917
	private string _name;
}
