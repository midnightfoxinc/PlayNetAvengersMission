using System;
using UnityEngine;

// Token: 0x0200028A RID: 650
[RequireComponent(typeof(UIWidget))]
public class SwitchGearButtonBehavior : ButtonCoreBehavior
{
	// Token: 0x17000202 RID: 514
	// (get) Token: 0x0600115B RID: 4443 RVA: 0x0007BE00 File Offset: 0x0007A000
	public UIWidget widget
	{
		get
		{
			if (!this._widget)
			{
				this._widget = base.GetComponent<UIWidget>();
			}
			return this._widget;
		}
	}

	// Token: 0x17000203 RID: 515
	// (get) Token: 0x0600115C RID: 4444 RVA: 0x0007BE30 File Offset: 0x0007A030
	public int id
	{
		get
		{
			return this.gear_info_widget.id;
		}
	}

	// Token: 0x0600115D RID: 4445 RVA: 0x0007BE40 File Offset: 0x0007A040
	public void set_data(int id)
	{
		this.gear_info_widget.set_data(id);
	}

	// Token: 0x0600115E RID: 4446 RVA: 0x0007BE50 File Offset: 0x0007A050
	protected override void Update()
	{
		if (this.disabled)
		{
			this.widget.color = this.disabled_color;
		}
		else
		{
			this.widget.color = ((!base.pressed) ? Color.white : this.pressed_color);
		}
		if (base.hit && this.play_sfx_on_hit)
		{
			base.play_sfx();
		}
		base.Update();
	}

	// Token: 0x040011D0 RID: 4560
	public GearInfoWidgetBehavior gear_info_widget;

	// Token: 0x040011D1 RID: 4561
	private UIWidget _widget;
}
