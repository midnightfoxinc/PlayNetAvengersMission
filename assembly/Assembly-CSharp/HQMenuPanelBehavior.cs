using System;
using UnityEngine;

// Token: 0x020001E4 RID: 484
public abstract class HQMenuPanelBehavior : CallbackMonoBehavior
{
	// Token: 0x06000E0D RID: 3597 RVA: 0x000635EC File Offset: 0x000617EC
	public virtual void show(bool b)
	{
		base.gameObject.SetActive(b);
		if (b)
		{
			this._dragging = true;
		}
	}

	// Token: 0x06000E0E RID: 3598 RVA: 0x00063608 File Offset: 0x00061808
	protected virtual void Update()
	{
		if (this._dragging && !Input.GetMouseButton(0))
		{
			this._dragging = false;
		}
		if (this.close_button && this.close_button.clicked)
		{
			if (this.log_from != string.Empty)
			{
				DMOManager.LogNavigation(NavigationManager.hq_scene, "back_btn", this.log_from, null);
			}
			globals.hq_main.set_state(hq_menu_state_enum.main);
		}
	}

	// Token: 0x04000DC2 RID: 3522
	public buttonBehavior close_button;

	// Token: 0x04000DC3 RID: 3523
	public UIScrollView scroll_view;

	// Token: 0x04000DC4 RID: 3524
	protected bool _dragging;

	// Token: 0x04000DC5 RID: 3525
	protected string log_from = string.Empty;
}
