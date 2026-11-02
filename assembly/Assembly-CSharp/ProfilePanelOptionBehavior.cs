using System;
using UnityEngine;

// Token: 0x020002CC RID: 716
public class ProfilePanelOptionBehavior : MonoBehaviour
{
	// Token: 0x1700022C RID: 556
	// (get) Token: 0x060012E9 RID: 4841 RVA: 0x00087234 File Offset: 0x00085434
	public bool released
	{
		get
		{
			return this.button.released;
		}
	}

	// Token: 0x1700022D RID: 557
	// (get) Token: 0x060012EA RID: 4842 RVA: 0x00087244 File Offset: 0x00085444
	public bool clicked
	{
		get
		{
			return this.button.clicked;
		}
	}

	// Token: 0x060012EB RID: 4843 RVA: 0x00087254 File Offset: 0x00085454
	public void set_count(int n)
	{
		if (n < 1)
		{
			this.count_label.gameObject.SetActive(false);
		}
		else
		{
			this.count_label.gameObject.SetActive(false);
			this.count_label.text = n.ToString();
		}
	}

	// Token: 0x060012EC RID: 4844 RVA: 0x000872A4 File Offset: 0x000854A4
	public void select(bool b)
	{
		this.button.gameObject.SetActive(!b);
		this.selected_sprite.gameObject.SetActive(b);
		if (b && this.profile_panel)
		{
			this.profile_panel.selection_pointer.bottomAnchor.target = base.transform;
		}
	}

	// Token: 0x040013ED RID: 5101
	public buttonBehavior button;

	// Token: 0x040013EE RID: 5102
	public UISprite selected_sprite;

	// Token: 0x040013EF RID: 5103
	public UILabel count_label;

	// Token: 0x040013F0 RID: 5104
	public ProfilePanelBehavior.mode_enum mode;

	// Token: 0x040013F1 RID: 5105
	internal ProfilePanelBehavior profile_panel;
}
