using System;
using UnityEngine;

// Token: 0x02000213 RID: 531
[RequireComponent(typeof(UIWidget))]
public class TestfireButtonBehavior : LabelledButtonBehavior
{
	// Token: 0x06000EF9 RID: 3833 RVA: 0x0006AC74 File Offset: 0x00068E74
	protected override void Update()
	{
		this.sprite.color = ((!this.disabled) ? this._normal_color : this.disabled_color);
		this.sprite.gameObject.SetActive(!base.pressed || this.disabled);
		this.held_sprite.gameObject.SetActive(base.pressed && !this.disabled);
		base.update_click_check();
	}

	// Token: 0x04000F68 RID: 3944
	public UISprite held_sprite;

	// Token: 0x04000F69 RID: 3945
	public UISprite icon;

	// Token: 0x04000F6A RID: 3946
	public AbilityDBItemClass.slot_enum slot;
}
