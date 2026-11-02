using System;
using UnityEngine;

// Token: 0x02000192 RID: 402
public class patchUpdateAlertPopup : MonoBehaviour
{
	// Token: 0x06000C61 RID: 3169 RVA: 0x0005A448 File Offset: 0x00058648
	private void OnEnable()
	{
		if (!globals.player_data.latest_device_data)
		{
			return;
		}
		GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(globals.player_data.latest_device_data.type.ToString(), true) as GearDBItemClass;
		if (gearDBItemClass)
		{
			this.gear_icon.spriteName = "icon_" + gearDBItemClass.id;
		}
	}

	// Token: 0x06000C62 RID: 3170 RVA: 0x0005A4B8 File Offset: 0x000586B8
	private void Update()
	{
		if (this.updateLater.hit)
		{
			this.popup.SetActive(false);
			globals.update_snooze = Time.realtimeSinceStartup;
			DMOManager.LogGameAction("patch", "bypass_download", string.Empty, null);
		}
		if (this.updateNow.hit)
		{
			this.popup.SetActive(false);
			this.fu.initUpdate();
		}
	}

	// Token: 0x04000BFC RID: 3068
	public buttonBehavior updateLater;

	// Token: 0x04000BFD RID: 3069
	public buttonBehavior updateNow;

	// Token: 0x04000BFE RID: 3070
	public GameObject popup;

	// Token: 0x04000BFF RID: 3071
	public PatchUpdatePanelBehavior fu;

	// Token: 0x04000C00 RID: 3072
	public UISprite gear_icon;
}
