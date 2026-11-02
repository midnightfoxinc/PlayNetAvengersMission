using System;
using UnityEngine;

// Token: 0x020001E3 RID: 483
public abstract class GearUpdatePanelBehavior : MonoBehaviour
{
	// Token: 0x06000E0B RID: 3595 RVA: 0x000635B8 File Offset: 0x000617B8
	public bool showing()
	{
		return this.notification_panel.activeInHierarchy || this.remindmeLater_notificationPopup.activeInHierarchy;
	}

	// Token: 0x04000DBD RID: 3517
	public buttonBehavior start_button;

	// Token: 0x04000DBE RID: 3518
	public buttonBehavior remindme_button;

	// Token: 0x04000DBF RID: 3519
	public GameObject notification_panel;

	// Token: 0x04000DC0 RID: 3520
	public GameObject remindmeLater_notificationPopup;

	// Token: 0x04000DC1 RID: 3521
	public UISprite gear_icon;
}
