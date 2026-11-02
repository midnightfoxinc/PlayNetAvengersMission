using System;
using UnityEngine;

// Token: 0x020001E2 RID: 482
public abstract class GearDaisySubmenuBehavior : BackButtonCloseBehavior
{
	// Token: 0x06000E07 RID: 3591 RVA: 0x000634A0 File Offset: 0x000616A0
	public override void close(bool silent = false)
	{
		if (!silent)
		{
			if (string.IsNullOrEmpty(this.dismiss_sfx))
			{
				this.close_button.play_sfx();
			}
			else
			{
				globals.sfx_master.play(this.dismiss_sfx, null);
			}
		}
		if (!this.gear_daisy)
		{
			this.gear_daisy = base.GetComponentInParent<GearDaisyBehavior>();
		}
		if (!this.gear_daisy)
		{
			globals.debugWarning("gear daisy submenu can't find its gear daisy! " + NGUITools.GetHierarchy(base.gameObject));
			this.show(false);
			return;
		}
		this.gear_daisy.mode = GearDaisyBehavior.mode_enum.none;
		this.gear_daisy.open(false, true);
	}

	// Token: 0x06000E08 RID: 3592
	public abstract void show(bool b);

	// Token: 0x06000E09 RID: 3593 RVA: 0x0006354C File Offset: 0x0006174C
	protected override void Update()
	{
		base.Update();
		if (!globals.BLE_manager.connectedDevice_data && !Application.isEditor && this._close_on_disconnect)
		{
			this.close(false);
		}
		else if (this.close_button.clicked)
		{
			this.close(false);
		}
	}

	// Token: 0x04000DBA RID: 3514
	public buttonBehavior close_button;

	// Token: 0x04000DBB RID: 3515
	internal GearDaisyBehavior gear_daisy;

	// Token: 0x04000DBC RID: 3516
	protected bool _close_on_disconnect = true;
}
