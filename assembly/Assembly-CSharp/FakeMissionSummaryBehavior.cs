using System;
using UnityEngine;

// Token: 0x0200030A RID: 778
public class FakeMissionSummaryBehavior : MonoBehaviour
{
	// Token: 0x06001444 RID: 5188 RVA: 0x00091DAC File Offset: 0x0008FFAC
	private void Start()
	{
		this.execute();
	}

	// Token: 0x06001445 RID: 5189 RVA: 0x00091DB4 File Offset: 0x0008FFB4
	[ContextMenu("Execute")]
	private void execute()
	{
		if (this.clear_previous_data)
		{
			globals.player_data.clear_progress();
		}
		if (this.use_playerdata)
		{
			string jsonData = this.player_data.Replace("\t", " ").Replace("\n", string.Empty);
			string deviceData = this.device_data.Replace("\t", " ").Replace("\n", string.Empty);
			if (!this.use_devicedata)
			{
				globals.BLE_manager.parse_data_from_gear(jsonData, null);
			}
			else
			{
				globals.BLE_manager.parse_data_from_gear(jsonData, deviceData);
			}
		}
		else
		{
			globals.new_sf_level.AddRange(this.sf_rep);
			globals.report_items.sf.AddRange(this.sf_rep);
			for (int i = 0; i < this.sf_rep.Length; i++)
			{
				globals.player_data.setSFRep(this.sf_rep[i].sf, this.sf_rep[i].xp);
			}
			globals.new_abilities.AddRange(this.abilities);
			globals.report_items.abilities.AddRange(this.abilities);
			if (globals.hq_main)
			{
				globals.previous_xp = this.previous_xp;
				globals.current_xp = this.current_xp;
			}
		}
		AchievementEvents.inst.on_plr_dev_change(globals.player_data.latest_device_data);
		if (!this.use_summary_jsons)
		{
			for (int j = 0; j < this.summary.Length; j++)
			{
				this.summary[j].calculate_grade();
				globals.add_mission_summary(this.summary[j]);
			}
		}
		else
		{
			for (int k = 0; k < this.summary_jsons.Length; k++)
			{
				globals.add_mission_summary(new missionSummaryClass(new JSONObject(this.summary_jsons[k], -2, false, false)));
			}
		}
	}

	// Token: 0x04001642 RID: 5698
	public bool clear_previous_data;

	// Token: 0x04001643 RID: 5699
	public missionSummaryClass[] summary;

	// Token: 0x04001644 RID: 5700
	public SFRepClass[] sf_rep;

	// Token: 0x04001645 RID: 5701
	public string[] abilities;

	// Token: 0x04001646 RID: 5702
	public int previous_xp;

	// Token: 0x04001647 RID: 5703
	public int current_xp = 500;

	// Token: 0x04001648 RID: 5704
	public bool use_summary_jsons;

	// Token: 0x04001649 RID: 5705
	public bool use_playerdata = true;

	// Token: 0x0400164A RID: 5706
	public bool use_devicedata = true;

	// Token: 0x0400164B RID: 5707
	[TextArea(5, 30)]
	public string[] summary_jsons;

	// Token: 0x0400164C RID: 5708
	[TextArea(5, 30)]
	public string player_data;

	// Token: 0x0400164D RID: 5709
	[TextArea(5, 30)]
	public string device_data;
}
