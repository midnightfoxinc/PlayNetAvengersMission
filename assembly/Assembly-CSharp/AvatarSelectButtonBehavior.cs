using System;

// Token: 0x020002C0 RID: 704
public class AvatarSelectButtonBehavior : LabelledButtonBehavior
{
	// Token: 0x060012B5 RID: 4789 RVA: 0x00085B2C File Offset: 0x00083D2C
	public void set_data(SFDBItemClass d)
	{
		this.sf_data = d;
		this.sprite.spriteName = this.avatar_select_panel.profile_panel.avatar_icon_prefix + d.id;
		this.label.text = d.name;
		base.gameObject.SetActive(true);
	}

	// Token: 0x0400139E RID: 5022
	public SFDBItemClass sf_data;

	// Token: 0x0400139F RID: 5023
	internal AvatarSelectPanelBehavior avatar_select_panel;
}
