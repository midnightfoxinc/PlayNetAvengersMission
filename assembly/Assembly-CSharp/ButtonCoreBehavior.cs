using System;
using UnityEngine;

// Token: 0x020001DD RID: 477
public abstract class ButtonCoreBehavior : MonoBehaviour
{
	// Token: 0x170001CD RID: 461
	// (get) Token: 0x06000DF3 RID: 3571 RVA: 0x00062FD0 File Offset: 0x000611D0
	public virtual bool hovered
	{
		get
		{
			return globals.selectedObject == base.gameObject;
		}
	}

	// Token: 0x170001CE RID: 462
	// (get) Token: 0x06000DF4 RID: 3572 RVA: 0x00062FE4 File Offset: 0x000611E4
	public bool pressed
	{
		get
		{
			return this.hovered && Input.GetMouseButton(0);
		}
	}

	// Token: 0x170001CF RID: 463
	// (get) Token: 0x06000DF5 RID: 3573 RVA: 0x00062FFC File Offset: 0x000611FC
	public bool hit
	{
		get
		{
			return this.hovered && Input.GetMouseButtonDown(0);
		}
	}

	// Token: 0x170001D0 RID: 464
	// (get) Token: 0x06000DF6 RID: 3574 RVA: 0x00063014 File Offset: 0x00061214
	public bool released
	{
		get
		{
			return this.hovered && Input.GetMouseButtonUp(0);
		}
	}

	// Token: 0x170001D1 RID: 465
	// (get) Token: 0x06000DF7 RID: 3575 RVA: 0x0006302C File Offset: 0x0006122C
	public bool clicked
	{
		get
		{
			return this._down_on && this.released;
		}
	}

	// Token: 0x06000DF8 RID: 3576 RVA: 0x00063044 File Offset: 0x00061244
	protected virtual void Update()
	{
		this.update_click_check();
	}

	// Token: 0x06000DF9 RID: 3577 RVA: 0x0006304C File Offset: 0x0006124C
	protected void update_click_check()
	{
		if (this._reset_down_on)
		{
			this._down_on = false;
			this._reset_down_on = false;
		}
		if (this._down_on && !this.pressed)
		{
			this._reset_down_on = true;
		}
		if (this.hit)
		{
			this._down_on = true;
			if (this.play_sfx_on_hit)
			{
				this.play_sfx();
			}
		}
	}

	// Token: 0x06000DFA RID: 3578 RVA: 0x000630B4 File Offset: 0x000612B4
	public void play_sfx()
	{
		if (this.disabled)
		{
			if (!string.IsNullOrEmpty(this.disabled_press_sfx))
			{
				globals.sfx_master.play(this.disabled_press_sfx, null);
			}
		}
		else if (!string.IsNullOrEmpty(this.pressed_sfx))
		{
			globals.sfx_master.play(this.pressed_sfx, null);
		}
		else
		{
			globals.sfx_master.play("placeholderbeep", null);
		}
	}

	// Token: 0x04000D9F RID: 3487
	public string pressed_sfx;

	// Token: 0x04000DA0 RID: 3488
	public string disabled_press_sfx;

	// Token: 0x04000DA1 RID: 3489
	public bool play_sfx_on_hit;

	// Token: 0x04000DA2 RID: 3490
	private bool _reset_down_on;

	// Token: 0x04000DA3 RID: 3491
	private bool _down_on;

	// Token: 0x04000DA4 RID: 3492
	public bool disabled;

	// Token: 0x04000DA5 RID: 3493
	public Color pressed_color = Color.white;

	// Token: 0x04000DA6 RID: 3494
	public Color disabled_color = Color.gray;
}
