using System;
using UnityEngine;

// Token: 0x02000288 RID: 648
public class GearSettingsMenuBehavior : GearDaisySubmenuBehavior
{
	// Token: 0x0600114B RID: 4427 RVA: 0x0007B464 File Offset: 0x00079664
	public void change_nickname()
	{
		if (string.IsNullOrEmpty(this.name_input.value))
		{
			return;
		}
		globals.player_data.latest_device_data.nickname = this.name_input.value;
		globals.player_data.saveData(false, false);
	}

	// Token: 0x0600114C RID: 4428 RVA: 0x0007B4B0 File Offset: 0x000796B0
	public override void show(bool b)
	{
		base.gameObject.SetActive(b);
		if (b)
		{
			this.volume_slider.value = Mathf.InverseLerp((float)this.min_volume, (float)this.max_volume, (float)globals.gear_volume);
			this._previous_volume = this.volume_slider.value;
			this.gear_info_widget.set_data(globals.player_data.latest_device_data);
			this.name_input.value = globals.player_data.latest_device_data.nickname;
			this.firmware_version_label.text = Localization.Get("FIRMWARE_VERSION") + globals.player_data.getFirmwareVersion(globals.player_data.getPrimaryDevice());
			GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(globals.player_data.latest_device_data.type.ToString(), true) as GearDBItemClass;
			if (gearDBItemClass)
			{
				this.gear_type_label.text = gearDBItemClass.name;
			}
			else
			{
				this.gear_type_label.text = "AVENGERS GEAR";
			}
		}
	}

	// Token: 0x0600114D RID: 4429 RVA: 0x0007B5B8 File Offset: 0x000797B8
	private void set_volume()
	{
		if (globals.mola_downloading(true))
		{
			globals.show_OK_alert("COMMUNICATION NOT ALLOWED", Localization.Get("WAIT_TO_UPDATE_DONE"), null);
		}
		else
		{
			globals.debug("setting volume!");
			this.gear_daisy.play_sync();
			int num = (int)Mathf.Lerp((float)this.min_volume, (float)this.max_volume, this.volume_slider.value);
			globals.gear_volume = num;
			globals.BLE_manager.sendSetVolume(num);
			globals.BLE_manager.sendIdentifyDevice(globals.BLE_manager.connectedDevice, 2, "MISSIONACCEPT");
		}
		this._previous_volume = this.volume_slider.value;
	}

	// Token: 0x0600114E RID: 4430 RVA: 0x0007B65C File Offset: 0x0007985C
	protected override void Update()
	{
		base.Update();
		this.volume_slider.enabled = !globals.mola_busy(false);
		if (this.edit_name_button.clicked)
		{
			this.name_input.isSelected = true;
		}
		else if (Input.GetMouseButtonUp(0) && this._previous_volume != this.volume_slider.value)
		{
			this.set_volume();
		}
	}

	// Token: 0x040011B5 RID: 4533
	public GearInfoWidgetBehavior gear_info_widget;

	// Token: 0x040011B6 RID: 4534
	public UILabel gear_type_label;

	// Token: 0x040011B7 RID: 4535
	public UILabel firmware_version_label;

	// Token: 0x040011B8 RID: 4536
	public UISlider volume_slider;

	// Token: 0x040011B9 RID: 4537
	public int min_volume = 8;

	// Token: 0x040011BA RID: 4538
	public int max_volume = 74;

	// Token: 0x040011BB RID: 4539
	public UIInput name_input;

	// Token: 0x040011BC RID: 4540
	public buttonBehavior edit_name_button;

	// Token: 0x040011BD RID: 4541
	private float _previous_volume;
}
