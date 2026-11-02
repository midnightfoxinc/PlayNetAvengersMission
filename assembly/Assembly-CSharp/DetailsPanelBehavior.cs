using System;
using UnityEngine;

// Token: 0x020001E1 RID: 481
public abstract class DetailsPanelBehavior : BackButtonCloseBehavior
{
	// Token: 0x06000E03 RID: 3587
	protected abstract void cleanup();

	// Token: 0x06000E04 RID: 3588 RVA: 0x00063424 File Offset: 0x00061624
	public override void close(bool silent = false)
	{
		base.close(silent);
		this.cleanup();
	}

	// Token: 0x06000E05 RID: 3589 RVA: 0x00063434 File Offset: 0x00061634
	protected override void Update()
	{
		base.Update();
		if (this.see_also)
		{
			this.see_also.check_buttons();
		}
		if (Input.GetMouseButtonUp(0) && globals.selectedObject == this.close_button.gameObject)
		{
			this.close(false);
		}
	}

	// Token: 0x04000DB6 RID: 3510
	public string show_sfx;

	// Token: 0x04000DB7 RID: 3511
	public UILabel name_label;

	// Token: 0x04000DB8 RID: 3512
	public Collider close_button;

	// Token: 0x04000DB9 RID: 3513
	public SeeAlsoBehavior see_also;
}
