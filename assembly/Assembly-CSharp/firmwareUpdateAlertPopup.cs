using System;
using UnityEngine;

// Token: 0x0200018F RID: 399
public class firmwareUpdateAlertPopup : MonoBehaviour
{
	// Token: 0x06000C3E RID: 3134 RVA: 0x00059584 File Offset: 0x00057784
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

	// Token: 0x06000C3F RID: 3135 RVA: 0x000595F4 File Offset: 0x000577F4
	private void Update()
	{
		if (this.updateLater.hit)
		{
			this.popup.SetActive(false);
			globals.update_snooze = Time.realtimeSinceStartup;
			DMOManager.LogGameAction("firmware", "bypass_download", string.Empty, null);
		}
		if (this.updateNow.hit)
		{
			this.popup.SetActive(false);
			this.fu.initUpdate();
		}
	}

	// Token: 0x04000BF3 RID: 3059
	public buttonBehavior updateLater;

	// Token: 0x04000BF4 RID: 3060
	public buttonBehavior updateNow;

	// Token: 0x04000BF5 RID: 3061
	public GameObject popup;

	// Token: 0x04000BF6 RID: 3062
	public FirmwareUpdatePanelBehavior fu;

	// Token: 0x04000BF7 RID: 3063
	public UISprite gear_icon;
}
