using System;

// Token: 0x0200018C RID: 396
public class PatchUpdatePanelBehavior : GearUpdatePanelBehavior
{
	// Token: 0x06000C23 RID: 3107 RVA: 0x00058DE4 File Offset: 0x00056FE4
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

	// Token: 0x06000C24 RID: 3108 RVA: 0x00058E54 File Offset: 0x00057054
	private void Update()
	{
		if (this.start_button.hit)
		{
			this.initUpdate();
		}
		else if (this.remindme_button.hit)
		{
			this.notification_panel.SetActive(false);
			this.remindmeLater_notificationPopup.SetActive(true);
		}
	}

	// Token: 0x06000C25 RID: 3109 RVA: 0x00058EA4 File Offset: 0x000570A4
	public void initUpdate()
	{
		string availablePatchId = globals.BLE_manager.getAvailablePatchId();
		if (this.isReady() && availablePatchId != null)
		{
			this.notification_panel.SetActive(false);
			this.patchUpdateProgressGadget.gameObject.SetActive(true);
			if (globals.gear_daisy)
			{
				globals.gear_daisy.show_disclaimer(true);
			}
			globals.debug("launching patch");
			patchProgressUpdate component = this.patchUpdateProgressGadget.GetComponent<patchProgressUpdate>();
			component.initUI();
			globals.packageDownload_manager.cachePackage(availablePatchId);
			globals.scavenger_hunt_manager.start_scavenger_hunt();
		}
	}

	// Token: 0x06000C26 RID: 3110 RVA: 0x00058F38 File Offset: 0x00057138
	private bool isReady()
	{
		if (!globals.network_manager.connected())
		{
			globals.show_no_internet_alert(null);
			return false;
		}
		if (globals.file_transfer_allowed == 0)
		{
			globals.show_OK_alert("FILE TRANSFER NOT ALLOWED", Localization.Get("FIRMWARE_DOWNLOAD_NOTALLOWED_HP"), null);
			return false;
		}
		if (globals.player_data.missionDownloadProgressState != Constants.ContentDownLoadState.NULL)
		{
			globals.show_OK_alert(string.Empty, Localization.Get("WAIT_TO_UPDATE_DONE"), null);
			return false;
		}
		return true;
	}

	// Token: 0x04000BE9 RID: 3049
	public patchProgressUpdate patchUpdateProgressGadget;
}
