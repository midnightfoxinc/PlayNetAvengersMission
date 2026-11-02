using System;
using UnityEngine;

// Token: 0x020002F9 RID: 761
public class DatafileRosterBehavior : MonoBehaviour
{
	// Token: 0x060013F7 RID: 5111 RVA: 0x0008FF70 File Offset: 0x0008E170
	public string scratch_tinted(string s, bool scratch)
	{
		if (string.IsNullOrEmpty(s))
		{
			return s;
		}
		s = s.Replace("\\\"", "\"").Replace("\\\n", "\n");
		if (!scratch)
		{
			return s;
		}
		return string.Concat(new string[]
		{
			"[",
			NGUIText.EncodeColor(this.scratch_tint),
			"]",
			s,
			"[-]"
		});
	}

	// Token: 0x060013F8 RID: 5112 RVA: 0x0008FFE8 File Offset: 0x0008E1E8
	public DBDataClass parse_datafiles()
	{
		DBDataClass dbdataClass = new DBDataClass();
		dbdataClass.parse(this.SF_data.text, db_item_type_enum.smartfigure);
		dbdataClass.parse(this.enemy_data.text, db_item_type_enum.enemy);
		dbdataClass.parse(this.hazard_data.text, db_item_type_enum.hazard);
		dbdataClass.parse(this.gear_data.text, db_item_type_enum.gear);
		for (int i = 0; i < this.action_data.Length; i++)
		{
			dbdataClass.parse(this.action_data[i].text, db_item_type_enum.action);
		}
		for (int j = 0; j < this.ability_data.Length; j++)
		{
			dbdataClass.parse(this.ability_data[j].text, db_item_type_enum.ability);
		}
		return dbdataClass;
	}

	// Token: 0x060013F9 RID: 5113 RVA: 0x000900A0 File Offset: 0x0008E2A0
	public StoreDataClass parse_store_datafiles()
	{
		StoreDataClass storeDataClass = new StoreDataClass();
		for (int i = 0; i < this.store_item_data.Length; i++)
		{
			storeDataClass.parse_items(this.store_item_data[i].text);
		}
		for (int j = 0; j < this.store_department_data.Length; j++)
		{
			storeDataClass.parse_department(this.store_department_data[j].text);
		}
		return storeDataClass;
	}

	// Token: 0x060013FA RID: 5114 RVA: 0x0009010C File Offset: 0x0008E30C
	public AchievementDataClass parse_achievement_datafiles()
	{
		return new AchievementDataClass(this.achievement_data.text);
	}

	// Token: 0x060013FB RID: 5115 RVA: 0x00090120 File Offset: 0x0008E320
	public ScavengerHuntManagerClass parse_scavenger_hunt_datafile()
	{
		return new ScavengerHuntManagerClass(this.scavenger_hunt_data.text);
	}

	// Token: 0x060013FC RID: 5116 RVA: 0x00090134 File Offset: 0x0008E334
	public NotificationDataClass parse_notification_datafile()
	{
		return new NotificationDataClass(this.notification_data.text);
	}

	// Token: 0x040015D1 RID: 5585
	public TextAsset SF_data;

	// Token: 0x040015D2 RID: 5586
	public TextAsset enemy_data;

	// Token: 0x040015D3 RID: 5587
	public TextAsset hazard_data;

	// Token: 0x040015D4 RID: 5588
	public TextAsset gear_data;

	// Token: 0x040015D5 RID: 5589
	public TextAsset[] action_data;

	// Token: 0x040015D6 RID: 5590
	public TextAsset[] ability_data;

	// Token: 0x040015D7 RID: 5591
	public TextAsset location_data;

	// Token: 0x040015D8 RID: 5592
	public TextAsset[] store_item_data;

	// Token: 0x040015D9 RID: 5593
	public TextAsset[] store_department_data;

	// Token: 0x040015DA RID: 5594
	public TextAsset achievement_data;

	// Token: 0x040015DB RID: 5595
	public TextAsset scavenger_hunt_data;

	// Token: 0x040015DC RID: 5596
	public TextAsset notification_data;

	// Token: 0x040015DD RID: 5597
	public TextAsset xp_to_level;

	// Token: 0x040015DE RID: 5598
	public TextAsset sf_xp_to_level;

	// Token: 0x040015DF RID: 5599
	public string db_icon_prefix = "DBicon_";

	// Token: 0x040015E0 RID: 5600
	public Color scratch_tint = Color.magenta;
}
