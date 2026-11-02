using System;
using UnityEngine;

// Token: 0x020001B5 RID: 437
[RequireComponent(typeof(UIWidget))]
public class DisabledSpriteButtonBehavior : ButtonCoreBehavior
{
	// Token: 0x06000CEB RID: 3307 RVA: 0x0005D8F0 File Offset: 0x0005BAF0
	private void Awake()
	{
		if (!this.sprite)
		{
			this.sprite = base.GetComponent<UISprite>();
		}
		if (!this.sprite)
		{
			globals.debugWarning("button has no sprite! @ " + NGUITools.GetHierarchy(base.gameObject));
			base.enabled = false;
			return;
		}
		this._normal_color = this.sprite.color;
		this._normal_sprite = this.sprite.spriteName;
	}

	// Token: 0x06000CEC RID: 3308 RVA: 0x0005D970 File Offset: 0x0005BB70
	protected override void Update()
	{
		this.sprite.spriteName = ((!this.disabled) ? this._normal_sprite : this.disabled_sprite);
		this.sprite.color = ((!base.pressed) ? this._normal_color : this.pressed_color);
		if (base.hit && this.play_sfx_on_hit)
		{
			base.play_sfx();
		}
		base.Update();
	}

	// Token: 0x04000CEA RID: 3306
	public UISprite sprite;

	// Token: 0x04000CEB RID: 3307
	public string disabled_sprite;

	// Token: 0x04000CEC RID: 3308
	protected Color _normal_color;

	// Token: 0x04000CED RID: 3309
	protected string _normal_sprite;
}
