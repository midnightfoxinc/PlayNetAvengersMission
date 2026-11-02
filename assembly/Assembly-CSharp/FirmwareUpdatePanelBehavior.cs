using System;

// Token: 0x0200018B RID: 395
public class FirmwareUpdatePanelBehavior : GearUpdatePanelBehavior
{
	// Token: 0x06000C1E RID: 3102 RVA: 0x00058C18 File Offset: 0x00056E18
	private void OnEnable()
	{
		if (!globals.player_data.latest_device_data)
		{
			return;
		}
		GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(globals.player_data.latest_device_data.type.ToString(), true) as GearDBItemClass;
		if (gearDBItemClass)
		{
			this.gear_type_label.text = gearDBItemClass.name;
			this.gear_icon.spriteName = "icon_" + gearDBItemClass.id;
		}
		else
		{
			this.gear_type_label.text = "AVENGERS GEAR";
		}
	}

	// Token: 0x06000C1F RID: 3103 RVA: 0x00058CAC File Offset: 0x00056EAC
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
			DMOManager.LogGameAction("firmware", "bypass_download", string.Empty, null);
		}
	}

	// Token: 0x06000C20 RID: 3104 RVA: 0x00058D14 File Offset: 0x00056F14
	public void initUpdate()
	{
		if (this.isReady())
		{
			this.notification_panel.SetActive(false);
			this.firmwareUpdateProgressGadget.gameObject.SetActive(true);
			if (globals.gear_daisy)
			{
				globals.gear_daisy.show_disclaimer(true);
			}
			globals.firmware_manager.init();
		}
	}

	// Token: 0x06000C21 RID: 3105 RVA: 0x00058D70 File Offset: 0x00056F70
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

	// Token: 0x04000BE7 RID: 3047
	public firmwareProgressUpdate firmwareUpdateProgressGadget;

	// Token: 0x04000BE8 RID: 3048
	public UILabel gear_type_label;
}
