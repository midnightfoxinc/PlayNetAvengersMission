using System;
using UnityEngine;

// Token: 0x020001C6 RID: 454
[RequireComponent(typeof(UIWidget))]
public class buttonBehavior : ButtonCoreBehavior
{
	// Token: 0x06000D30 RID: 3376 RVA: 0x0005EE10 File Offset: 0x0005D010
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
		this.ButtonStartingLocalScale = this.sprite.localSize;
		this._normal_color = this.sprite.color;
	}

	// Token: 0x06000D31 RID: 3377 RVA: 0x0005EE90 File Offset: 0x0005D090
	protected override void Update()
	{
		if (this.disabled)
		{
			this.sprite.color = this.disabled_color;
		}
		else
		{
			this.sprite.color = ((!base.pressed) ? this._normal_color : this.pressed_color);
		}
		base.Update();
	}

	// Token: 0x04000D3C RID: 3388
	public UISprite sprite;

	// Token: 0x04000D3D RID: 3389
	public Vector2 ButtonStartingLocalScale;

	// Token: 0x04000D3E RID: 3390
	protected Color _normal_color;
}
