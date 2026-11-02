using System;
using UnityEngine;

// Token: 0x020002CD RID: 717
public abstract class ProfileSubpanelBehavior : MonoBehaviour
{
	// Token: 0x1700022E RID: 558
	// (get) Token: 0x060012EE RID: 4846 RVA: 0x00087310 File Offset: 0x00085510
	public ProfilePanelBehavior profile_panel
	{
		get
		{
			if (!this._profile_panel)
			{
				this._profile_panel = base.GetComponentInParent<ProfilePanelBehavior>();
			}
			return this._profile_panel;
		}
	}

	// Token: 0x1700022F RID: 559
	// (get) Token: 0x060012EF RID: 4847 RVA: 0x00087340 File Offset: 0x00085540
	public bool dragging
	{
		get
		{
			return base.gameObject.activeInHierarchy && this._dragging;
		}
	}

	// Token: 0x060012F0 RID: 4848 RVA: 0x0008735C File Offset: 0x0008555C
	public virtual void show(bool b)
	{
		base.gameObject.SetActive(b);
		if (b)
		{
			this._dragging = true;
		}
	}

	// Token: 0x060012F1 RID: 4849 RVA: 0x00087378 File Offset: 0x00085578
	protected virtual void Update()
	{
		if (!Input.GetMouseButton(0))
		{
			this._dragging = false;
		}
		else if (this.scroll_view && this.scroll_view.isDragging)
		{
			this._dragging = true;
		}
		else if (globals.poster_album && globals.poster_album.any_poster_showing())
		{
			this._dragging = true;
		}
	}

	// Token: 0x040013F2 RID: 5106
	public ProfilePanelBehavior.mode_enum mode;

	// Token: 0x040013F3 RID: 5107
	public UIScrollView scroll_view;

	// Token: 0x040013F4 RID: 5108
	private ProfilePanelBehavior _profile_panel;

	// Token: 0x040013F5 RID: 5109
	protected bool _dragging;
}
