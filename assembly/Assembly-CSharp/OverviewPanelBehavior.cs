using System;
using UnityEngine;

// Token: 0x020002C6 RID: 710
public class OverviewPanelBehavior : ProfileSubpanelBehavior
{
	// Token: 0x060012C5 RID: 4805 RVA: 0x00086234 File Offset: 0x00084434
	public override void show(bool b)
	{
		base.show(b);
		if (!b)
		{
			return;
		}
		if (globals.player_data.latest_device_data)
		{
			this.refresh_gear_info();
			this.refresh_progress_info();
			this.connected_panel.SetActive(true);
			this.unconnected_panel.SetActive(false);
		}
		else
		{
			this.connected_panel.SetActive(false);
			this.unconnected_panel.SetActive(true);
		}
	}

	// Token: 0x060012C6 RID: 4806 RVA: 0x000862A4 File Offset: 0x000844A4
	private void refresh_gear_info()
	{
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

	// Token: 0x060012C7 RID: 4807 RVA: 0x00086364 File Offset: 0x00084564
	private void refresh_progress_info()
	{
		this.achievement_progress_label.text = globals.player_data.achievements.Count.ToString() + "/" + globals.achievement_data.item.Count.ToString();
		int num = 0;
		for (int i = 0; i < globals.location_data.item.Count; i++)
		{
			if (globals.location_data.item[i].completion() == locationDataItemClass.completion_enum.complete)
			{
				num++;
			}
			else if (globals.location_data.item[i].completion() == locationDataItemClass.completion_enum.mastered)
			{
				num++;
			}
		}
		this.location_progress_label.text = num.ToString() + "/" + globals.location_data.item.Count.ToString();
		this.sf_progress_label.text = globals.player_data.SFRepCount() + "/" + this.total_SF_count().ToString();
		this.ability_progress_label.text = this.ability_progress();
		if (globals.player_data.latest_device_data.type == 2111)
		{
			this.ability_type_label.text = "Finishing Moves Unlocked";
		}
		else
		{
			this.ability_type_label.text = "Abilities Unlocked";
		}
	}

	// Token: 0x060012C8 RID: 4808 RVA: 0x000864D0 File Offset: 0x000846D0
	private int total_SF_count()
	{
		int num = 0;
		for (int i = 0; i < globals.database_data.item.Count; i++)
		{
			if (globals.database_data.item[i] is SFDBItemClass && (globals.database_data.item[i] as SFDBItemClass).is_real_SF())
			{
				num++;
			}
		}
		return num;
	}

	// Token: 0x060012C9 RID: 4809 RVA: 0x00086540 File Offset: 0x00084740
	private string ability_progress()
	{
		if (!globals.player_data.latest_device_data)
		{
			return "???";
		}
		int num = 0;
		int num2 = 0;
		for (int i = 0; i < globals.database_data.item.Count; i++)
		{
			if (globals.database_data.item[i] is AbilityDBItemClass && (globals.database_data.item[i] as AbilityDBItemClass).mola == globals.player_data.latest_device_data.type.ToString())
			{
				num++;
				if (globals.player_data.has_unlock(globals.database_data.item[i].id))
				{
					num2++;
				}
			}
		}
		return num2.ToString() + "/" + num.ToString();
	}

	// Token: 0x060012CA RID: 4810 RVA: 0x00086624 File Offset: 0x00084824
	public void change_nickname()
	{
		if (string.IsNullOrEmpty(this.name_input.value))
		{
			return;
		}
		globals.player_data.latest_device_data.nickname = this.name_input.value;
		globals.player_data.saveData(false, false);
	}

	// Token: 0x060012CB RID: 4811 RVA: 0x00086670 File Offset: 0x00084870
	protected override void Update()
	{
		base.Update();
		if (this.edit_name_button.clicked)
		{
			this.name_input.isSelected = true;
		}
		else if (this.connect_button.clicked)
		{
			globals.FTUE_manager.detect_gear();
		}
		else if (this.store_button.clicked)
		{
			globals.store_item_id = this.store_item;
			NavigationManager.load_scene(NavigationManager.store_scene);
		}
	}

	// Token: 0x040013B9 RID: 5049
	public GameObject connected_panel;

	// Token: 0x040013BA RID: 5050
	public GameObject unconnected_panel;

	// Token: 0x040013BB RID: 5051
	public UILabel achievement_progress_label;

	// Token: 0x040013BC RID: 5052
	public UILabel location_progress_label;

	// Token: 0x040013BD RID: 5053
	public UILabel sf_progress_label;

	// Token: 0x040013BE RID: 5054
	public UILabel ability_progress_label;

	// Token: 0x040013BF RID: 5055
	public UILabel ability_type_label;

	// Token: 0x040013C0 RID: 5056
	public GearInfoWidgetBehavior gear_info_widget;

	// Token: 0x040013C1 RID: 5057
	public UILabel gear_type_label;

	// Token: 0x040013C2 RID: 5058
	public UILabel firmware_version_label;

	// Token: 0x040013C3 RID: 5059
	public UIInput name_input;

	// Token: 0x040013C4 RID: 5060
	public buttonBehavior edit_name_button;

	// Token: 0x040013C5 RID: 5061
	public buttonBehavior connect_button;

	// Token: 0x040013C6 RID: 5062
	public buttonBehavior store_button;

	// Token: 0x040013C7 RID: 5063
	public string store_item = "2101sp";
}
