using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200021A RID: 538
public class AchievementEvents
{
	// Token: 0x06000F28 RID: 3880 RVA: 0x0006C2FC File Offset: 0x0006A4FC
	public AchievementEvents()
	{
		for (int i = 0; i < globals.achievement_data.item.Count; i++)
		{
			AchievementEvents.UnlockCriteria unlockCriteria = AchievementEvents.unlock_factory(globals.achievement_data.item[i]);
			if (unlockCriteria != null)
			{
				unlockCriteria.id = globals.achievement_data.item[i].id;
				this.unlockCriterias.Add(unlockCriteria);
			}
		}
		foreach (AchievementEvents.UnlockCriteria unlockCriteria2 in this.unlockCriterias)
		{
			unlockCriteria2.on_app_login(this);
		}
		this.flush_event_buffer();
	}

	// Token: 0x170001DC RID: 476
	// (get) Token: 0x06000F2A RID: 3882 RVA: 0x0006C3F0 File Offset: 0x0006A5F0
	public static AchievementEvents inst
	{
		get
		{
			if (AchievementEvents._inst == null)
			{
				return AchievementEvents._inst = new AchievementEvents();
			}
			return AchievementEvents._inst;
		}
	}

	// Token: 0x06000F2B RID: 3883 RVA: 0x0006C410 File Offset: 0x0006A610
	private static AchievementEvents.UnlockCriteria unlock_factory(AchievementItemClass item)
	{
		AchievementEvents.UnlockCriteria unlockCriteria = null;
		switch (item.type)
		{
		case achievement_type_enum.ClearMissions:
		{
			AchievementEvents.ClearMissionsUnlock.MissionFilter mission_filter = AchievementEvents.ClearMissionsUnlock.MissionFilter.BOTH;
			for (int i = 0; i < Enum.GetNames(typeof(AchievementEvents.ClearMissionsUnlock.MissionFilter)).Length; i++)
			{
				if (((AchievementEvents.ClearMissionsUnlock.MissionFilter)i).ToString() == item.special)
				{
					mission_filter = (AchievementEvents.ClearMissionsUnlock.MissionFilter)i;
				}
			}
			unlockCriteria = new AchievementEvents.ClearMissionsUnlock((item.count <= 0) ? 1 : item.count, mission_filter, item.target_id);
			break;
		}
		case achievement_type_enum.ClearSpecificMission:
			unlockCriteria = new AchievementEvents.ClearSpecificMissionUnlock(item.target_id);
			break;
		case achievement_type_enum.ClearAllMissionsInLocation:
			unlockCriteria = new AchievementEvents.ClearAllMissionsInLocationUnlock(item.target_id);
			break;
		case achievement_type_enum.FigureLevel:
			unlockCriteria = new AchievementEvents.FigureLevelUnlock(item.target_id, 10);
			break;
		case achievement_type_enum.MultiFigureLevel:
			unlockCriteria = new AchievementEvents.MultiFigureLevelUnlock(item.special.ToIntArray(','), 10);
			break;
		case achievement_type_enum.GearLevel:
			unlockCriteria = new AchievementEvents.GearLevelUnlock(item.target_id, item.count);
			break;
		case achievement_type_enum.KillEnemies:
			if (string.IsNullOrEmpty(item.target_id))
			{
				unlockCriteria = new AchievementEvents.KillEnemiesUnlock(item.count, -1);
			}
			else
			{
				unlockCriteria = new AchievementEvents.KillEnemiesUnlock(item.count, int.Parse(item.target_id));
			}
			break;
		case achievement_type_enum.UsedAbility:
			unlockCriteria = new AchievementEvents.UsedAbilityUnlock(item.target_id);
			break;
		case achievement_type_enum.HasUnlock:
			unlockCriteria = new AchievementEvents.HasUnlockUnlock(item.target_id);
			break;
		case achievement_type_enum.Manual:
			unlockCriteria = new AchievementEvents.UnlockCriteria();
			break;
		}
		if (unlockCriteria == null)
		{
			globals.debugWarning("UnlockCriteria could not be created!");
		}
		return unlockCriteria;
	}

	// Token: 0x06000F2C RID: 3884 RVA: 0x0006C5A8 File Offset: 0x0006A7A8
	public void on_plr_dev_change(PlayerDeviceClass plr_dev)
	{
		foreach (AchievementEvents.UnlockCriteria unlockCriteria in this.unlockCriterias)
		{
			unlockCriteria.on_plr_dev_change(plr_dev, this);
		}
		this.flush_event_buffer();
	}

	// Token: 0x06000F2D RID: 3885 RVA: 0x0006C618 File Offset: 0x0006A818
	public void on_mission_summary(missionSummaryClass msn_sum)
	{
		foreach (AchievementEvents.UnlockCriteria unlockCriteria in this.unlockCriterias)
		{
			unlockCriteria.on_mission_summary(msn_sum, this);
		}
		this.flush_event_buffer();
	}

	// Token: 0x06000F2E RID: 3886 RVA: 0x0006C688 File Offset: 0x0006A888
	public void on_manual_update()
	{
		foreach (AchievementEvents.UnlockCriteria unlockCriteria in this.unlockCriterias)
		{
			unlockCriteria.on_manual_update(this);
		}
		this.flush_event_buffer();
	}

	// Token: 0x06000F2F RID: 3887 RVA: 0x0006C6F4 File Offset: 0x0006A8F4
	private void activate_event(string id, int level = -1)
	{
		this._event_buffer.Add(id);
	}

	// Token: 0x06000F30 RID: 3888 RVA: 0x0006C704 File Offset: 0x0006A904
	public void manually_activate_event(string id)
	{
		this.activate_event(id, -1);
		this.flush_event_buffer();
	}

	// Token: 0x06000F31 RID: 3889 RVA: 0x0006C714 File Offset: 0x0006A914
	private void flush_event_buffer()
	{
		for (int i = 0; i < this._event_buffer.Count; i++)
		{
			string text = this._event_buffer[i];
			if (!globals.player_data.achievements.Contains(text))
			{
				globals.debug("Achievement unlocked: " + text);
				globals.player_data.addAchievement(text, true);
			}
		}
		this._event_buffer.Clear();
	}

	// Token: 0x06000F32 RID: 3890 RVA: 0x0006C788 File Offset: 0x0006A988
	public void log_ability_testfired(string id)
	{
		if (globals.player_data.isGuestLogin())
		{
			return;
		}
		try
		{
			if (!globals.player_data.testFired.Contains(id))
			{
				globals.player_data.addTestFired(id);
				if (globals.player_data.testFired.Count >= 5)
				{
					this.manually_activate_event("ARMORY_TESTFIRE");
				}
			}
		}
		catch (Exception log)
		{
			globals.debugWarning(log);
		}
	}

	// Token: 0x04000FA0 RID: 4000
	private const int ARMORY_TESTFIRE_REQ_AMT = 5;

	// Token: 0x04000FA1 RID: 4001
	private List<string> _event_buffer = new List<string>();

	// Token: 0x04000FA2 RID: 4002
	private static AchievementEvents _inst;

	// Token: 0x04000FA3 RID: 4003
	public List<AchievementEvents.UnlockCriteria> unlockCriterias = new List<AchievementEvents.UnlockCriteria>();

	// Token: 0x0200021B RID: 539
	public class UnlockCriteria
	{
		// Token: 0x06000F34 RID: 3892 RVA: 0x0006C820 File Offset: 0x0006AA20
		public virtual void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
		}

		// Token: 0x06000F35 RID: 3893 RVA: 0x0006C824 File Offset: 0x0006AA24
		public virtual void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
		}

		// Token: 0x06000F36 RID: 3894 RVA: 0x0006C828 File Offset: 0x0006AA28
		public virtual void on_app_login(AchievementEvents handler)
		{
		}

		// Token: 0x06000F37 RID: 3895 RVA: 0x0006C82C File Offset: 0x0006AA2C
		public virtual void on_manual_update(AchievementEvents handler)
		{
		}

		// Token: 0x06000F38 RID: 3896 RVA: 0x0006C830 File Offset: 0x0006AA30
		public virtual bool has_count()
		{
			return false;
		}

		// Token: 0x06000F39 RID: 3897 RVA: 0x0006C834 File Offset: 0x0006AA34
		public virtual int actions_to_complete()
		{
			return 1;
		}

		// Token: 0x06000F3A RID: 3898 RVA: 0x0006C838 File Offset: 0x0006AA38
		public virtual int actions_done()
		{
			return 0;
		}

		// Token: 0x04000FA4 RID: 4004
		public string id;
	}

	// Token: 0x0200021C RID: 540
	private class KillEnemiesUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F3B RID: 3899 RVA: 0x0006C83C File Offset: 0x0006AA3C
		public KillEnemiesUnlock(int num_times, int base_enemy_type = -1)
		{
			this.num_times = num_times;
			this.base_enemy_type = base_enemy_type;
		}

		// Token: 0x06000F3C RID: 3900 RVA: 0x0006C85C File Offset: 0x0006AA5C
		public override bool has_count()
		{
			return true;
		}

		// Token: 0x06000F3D RID: 3901 RVA: 0x0006C860 File Offset: 0x0006AA60
		public override int actions_to_complete()
		{
			return this.num_times;
		}

		// Token: 0x06000F3E RID: 3902 RVA: 0x0006C868 File Offset: 0x0006AA68
		public override int actions_done()
		{
			int num = 0;
			if (this.base_enemy_type > -1)
			{
				if (globals.player_data.enemies_killed.ContainsKey(this.base_enemy_type))
				{
					num += globals.player_data.enemies_killed[this.base_enemy_type];
				}
				return num;
			}
			foreach (KeyValuePair<int, int> keyValuePair in globals.player_data.enemies_killed)
			{
				num += keyValuePair.Value;
			}
			return num;
		}

		// Token: 0x06000F3F RID: 3903 RVA: 0x0006C918 File Offset: 0x0006AB18
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			this.do_check(handler);
		}

		// Token: 0x06000F40 RID: 3904 RVA: 0x0006C924 File Offset: 0x0006AB24
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			this.do_check(handler);
		}

		// Token: 0x06000F41 RID: 3905 RVA: 0x0006C930 File Offset: 0x0006AB30
		private void do_check(AchievementEvents handler)
		{
			if (this.actions_done() >= this.num_times)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FA5 RID: 4005
		public int num_times = 1;

		// Token: 0x04000FA6 RID: 4006
		public int base_enemy_type;
	}

	// Token: 0x0200021D RID: 541
	private class UsedAbilityUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F42 RID: 3906 RVA: 0x0006C950 File Offset: 0x0006AB50
		public UsedAbilityUnlock(string ability_type)
		{
			this.ability_type = ability_type;
		}

		// Token: 0x06000F43 RID: 3907 RVA: 0x0006C960 File Offset: 0x0006AB60
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			string text = this.ability_type;
			bool flag = false;
			foreach (missionSummaryClass.DeviceUsedClass deviceUsedClass in msn_sum.devices_used)
			{
				if (deviceUsedClass.id == 2111)
				{
					flag = true;
				}
			}
			if (flag && this.ability_type == "Jump")
			{
				text = "Grapple";
			}
			if (flag && this.ability_type == "Grapple")
			{
				return;
			}
			if (!flag && this.ability_type == "Jump")
			{
				return;
			}
			if (msn_sum.completed)
			{
				missionDataClass missionDataClass = globals.location_data.mission_by_id(msn_sum.mission);
				if (!missionDataClass)
				{
					return;
				}
				for (int i = 0; i < missionDataClass.play_summary.Length; i++)
				{
					if (missionDataClass.play_summary[i] == text)
					{
						handler.activate_event(this.id, -1);
						return;
					}
				}
			}
		}

		// Token: 0x04000FA7 RID: 4007
		private string ability_type;
	}

	// Token: 0x0200021E RID: 542
	private class UsedReviveUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F45 RID: 3909 RVA: 0x0006CAA8 File Offset: 0x0006ACA8
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			if (msn_sum.deaths > 0 && msn_sum.completed)
			{
				handler.activate_event(this.id, -1);
			}
		}
	}

	// Token: 0x0200021F RID: 543
	private class ClearAllMissionsInLocationUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F46 RID: 3910 RVA: 0x0006CADC File Offset: 0x0006ACDC
		public ClearAllMissionsInLocationUnlock(string location_id)
		{
			this.location_id = location_id;
		}

		// Token: 0x06000F47 RID: 3911 RVA: 0x0006CAEC File Offset: 0x0006ACEC
		public override bool has_count()
		{
			return true;
		}

		// Token: 0x06000F48 RID: 3912 RVA: 0x0006CAF0 File Offset: 0x0006ACF0
		public override int actions_to_complete()
		{
			if (globals.location_data.item_by_id(this.location_id) == null)
			{
				globals.debugWarning("Location ID " + this.location_id + " does not exist!");
				return 1;
			}
			return globals.location_data.item_by_id(this.location_id).missions.Count;
		}

		// Token: 0x06000F49 RID: 3913 RVA: 0x0006CB48 File Offset: 0x0006AD48
		public override int actions_done()
		{
			if (globals.location_data.item_by_id(this.location_id) == null)
			{
				globals.debugWarning("Location ID " + this.location_id + " does not exist!");
				return 0;
			}
			List<missionDataClass> missions = globals.location_data.item_by_id(this.location_id).missions;
			int num = 0;
			for (int i = 0; i < missions.Count; i++)
			{
				missionDataClass missionDataClass = missions[i];
				if (globals.player_data.latest_device_data && missionDataClass != null && globals.player_data.latest_device_data.get_grade(missionDataClass.id) > 0)
				{
					num++;
				}
			}
			return num;
		}

		// Token: 0x06000F4A RID: 3914 RVA: 0x0006CBF8 File Offset: 0x0006ADF8
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			if (this.actions_done() >= this.actions_to_complete())
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x06000F4B RID: 3915 RVA: 0x0006CC18 File Offset: 0x0006AE18
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			if (this.actions_done() >= this.actions_to_complete())
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FA8 RID: 4008
		public string location_id;
	}

	// Token: 0x02000220 RID: 544
	private class ClearMissionsUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F4C RID: 3916 RVA: 0x0006CC38 File Offset: 0x0006AE38
		public ClearMissionsUnlock(int num_missions = 1, AchievementEvents.ClearMissionsUnlock.MissionFilter mission_filter = AchievementEvents.ClearMissionsUnlock.MissionFilter.BOTH, string location_id = "")
		{
			this.num_missions = num_missions;
			this.location_id = location_id;
			this.mission_filter = mission_filter;
		}

		// Token: 0x06000F4D RID: 3917 RVA: 0x0006CC58 File Offset: 0x0006AE58
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			this.do_check(handler);
		}

		// Token: 0x06000F4E RID: 3918 RVA: 0x0006CC64 File Offset: 0x0006AE64
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			this.do_check(handler);
		}

		// Token: 0x06000F4F RID: 3919 RVA: 0x0006CC70 File Offset: 0x0006AE70
		public override int actions_done()
		{
			int num = 0;
			List<missionDataClass> list = new List<missionDataClass>();
			if (string.IsNullOrEmpty(this.location_id))
			{
				foreach (locationDataItemClass locationDataItemClass in globals.location_data.item)
				{
					list.AddRange(locationDataItemClass.missions);
				}
			}
			else
			{
				list = globals.location_data.item_by_id(this.location_id).missions;
			}
			for (int i = 0; i < list.Count; i++)
			{
				missionDataClass missionDataClass = list[i];
				if (missionDataClass != null && globals.player_data.get_grade(missionDataClass.id) > 0)
				{
					switch (this.mission_filter)
					{
					case AchievementEvents.ClearMissionsUnlock.MissionFilter.BOTH:
						num++;
						break;
					case AchievementEvents.ClearMissionsUnlock.MissionFilter.MISSION:
						if (!missionDataClass.is_arena)
						{
							num++;
						}
						break;
					case AchievementEvents.ClearMissionsUnlock.MissionFilter.ARENA:
						if (missionDataClass.is_arena)
						{
							num++;
						}
						break;
					}
				}
			}
			return num;
		}

		// Token: 0x06000F50 RID: 3920 RVA: 0x0006CDAC File Offset: 0x0006AFAC
		private void do_check(AchievementEvents handler)
		{
			if (this.actions_done() >= this.num_missions)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FA9 RID: 4009
		public string location_id;

		// Token: 0x04000FAA RID: 4010
		public AchievementEvents.ClearMissionsUnlock.MissionFilter mission_filter;

		// Token: 0x04000FAB RID: 4011
		public int num_missions;

		// Token: 0x02000221 RID: 545
		public enum MissionFilter
		{
			// Token: 0x04000FAD RID: 4013
			BOTH,
			// Token: 0x04000FAE RID: 4014
			MISSION,
			// Token: 0x04000FAF RID: 4015
			ARENA
		}
	}

	// Token: 0x02000222 RID: 546
	private class ClearSpecificMissionUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F51 RID: 3921 RVA: 0x0006CDCC File Offset: 0x0006AFCC
		public ClearSpecificMissionUnlock(string mission_id)
		{
			this.mission_id = int.Parse(mission_id);
		}

		// Token: 0x06000F52 RID: 3922 RVA: 0x0006CDE0 File Offset: 0x0006AFE0
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			if (globals.player_data.latest_device_data.get_grade(this.mission_id) > 0)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x06000F53 RID: 3923 RVA: 0x0006CE18 File Offset: 0x0006B018
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			if (plr_dev.get_grade(this.mission_id) > 0)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FB0 RID: 4016
		public int mission_id;
	}

	// Token: 0x02000223 RID: 547
	private class FigureLevelUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F54 RID: 3924 RVA: 0x0006CE3C File Offset: 0x0006B03C
		public FigureLevelUnlock(string fig_id, int level = 10)
		{
			this.fig_id = fig_id;
			this.level = level;
		}

		// Token: 0x06000F55 RID: 3925 RVA: 0x0006CE54 File Offset: 0x0006B054
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			int num = globals.sf_level_from_xp(plr_dev.get_sf_rep(this.fig_id));
			if (num >= this.level)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FB1 RID: 4017
		public string fig_id;

		// Token: 0x04000FB2 RID: 4018
		public int level;
	}

	// Token: 0x02000224 RID: 548
	private class FigureLevelRangeUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F56 RID: 3926 RVA: 0x0006CE8C File Offset: 0x0006B08C
		public FigureLevelRangeUnlock(string fig_id, int min_level, int max_level)
		{
			this.fig_id = fig_id;
			this.min_level = min_level;
			this.max_level = max_level;
		}

		// Token: 0x06000F57 RID: 3927 RVA: 0x0006CEAC File Offset: 0x0006B0AC
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			int num = globals.sf_level_from_xp(plr_dev.get_sf_rep(this.fig_id));
			if (num >= this.min_level)
			{
				int num2 = this.min_level;
				while (num2 <= num && num2 <= this.max_level)
				{
					string id = this.id.Replace("#", num2.ToString());
					handler.activate_event(id, -1);
					num2++;
				}
			}
		}

		// Token: 0x04000FB3 RID: 4019
		public string fig_id;

		// Token: 0x04000FB4 RID: 4020
		public int min_level;

		// Token: 0x04000FB5 RID: 4021
		public int max_level;
	}

	// Token: 0x02000225 RID: 549
	private class MultiFigureLevelUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F58 RID: 3928 RVA: 0x0006CF1C File Offset: 0x0006B11C
		public MultiFigureLevelUnlock(int[] fig_ids, int level = 10)
		{
			this.ids = fig_ids;
			this.level = level;
		}

		// Token: 0x06000F59 RID: 3929 RVA: 0x0006CF34 File Offset: 0x0006B134
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			bool flag = true;
			int num = globals.sf_xp_to_level[this.level];
			for (int i = 0; i < this.ids.Length; i++)
			{
				flag = (flag && plr_dev.get_sf_rep(this.ids[i]) >= num);
			}
			if (flag)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FB6 RID: 4022
		public int[] ids;

		// Token: 0x04000FB7 RID: 4023
		public int level;
	}

	// Token: 0x02000226 RID: 550
	private class GearLevelUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F5A RID: 3930 RVA: 0x0006CF9C File Offset: 0x0006B19C
		public GearLevelUnlock(string gear_id, int level)
		{
			this.gear_id = gear_id;
			this.level = level;
		}

		// Token: 0x06000F5B RID: 3931 RVA: 0x0006CFB4 File Offset: 0x0006B1B4
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			if (plr_dev.type.ToString() == this.gear_id)
			{
				int num = globals.gear_level_from_xp(plr_dev.xp);
				if (num >= this.level)
				{
					handler.activate_event(this.id, this.level);
				}
			}
		}

		// Token: 0x04000FB8 RID: 4024
		public string gear_id;

		// Token: 0x04000FB9 RID: 4025
		public int level;
	}

	// Token: 0x02000227 RID: 551
	private class GearLevelRangeUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F5C RID: 3932 RVA: 0x0006D008 File Offset: 0x0006B208
		public GearLevelRangeUnlock(int gear_id, int min_level, int max_level)
		{
			this.gear_id = gear_id;
			this.min_level = min_level;
			this.max_level = max_level;
		}

		// Token: 0x06000F5D RID: 3933 RVA: 0x0006D028 File Offset: 0x0006B228
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			if (plr_dev.type == this.gear_id)
			{
				int num = globals.gear_level_from_xp(plr_dev.xp);
				if (num >= this.min_level)
				{
					int num2 = this.min_level;
					while (num2 <= num && num2 <= this.max_level)
					{
						string id = this.id.Replace("#", num2.ToString());
						handler.activate_event(id, num2);
						num2++;
					}
				}
			}
		}

		// Token: 0x04000FBA RID: 4026
		public int gear_id;

		// Token: 0x04000FBB RID: 4027
		public int min_level;

		// Token: 0x04000FBC RID: 4028
		public int max_level;
	}

	// Token: 0x02000228 RID: 552
	private class StarRatingUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F5E RID: 3934 RVA: 0x0006D0A4 File Offset: 0x0006B2A4
		public StarRatingUnlock(int stars, int rating = 3)
		{
			this.req_stars = stars;
			this.req_rating = rating;
		}

		// Token: 0x06000F5F RID: 3935 RVA: 0x0006D0BC File Offset: 0x0006B2BC
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			this.do_check(globals.player_data.latest_device_data, handler);
		}

		// Token: 0x06000F60 RID: 3936 RVA: 0x0006D0D0 File Offset: 0x0006B2D0
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			this.do_check(plr_dev, handler);
		}

		// Token: 0x06000F61 RID: 3937 RVA: 0x0006D0DC File Offset: 0x0006B2DC
		private void do_check(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			int num = 0;
			for (int i = 0; i < globals.location_data.item.Count; i++)
			{
				List<missionDataClass> missions = globals.location_data.item[i].missions;
				for (int j = 0; j < missions.Count; j++)
				{
					missionDataClass missionDataClass = missions[j];
					if (plr_dev != null && missionDataClass != null && plr_dev.get_grade(missionDataClass.id) >= this.req_rating)
					{
						num++;
					}
				}
			}
			if (num >= this.req_stars)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FBD RID: 4029
		public int req_stars;

		// Token: 0x04000FBE RID: 4030
		public int req_rating;
	}

	// Token: 0x02000229 RID: 553
	private class DeviceConnectUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F62 RID: 3938 RVA: 0x0006D184 File Offset: 0x0006B384
		public DeviceConnectUnlock(int gear_id)
		{
			this.gear_id = gear_id;
		}

		// Token: 0x06000F63 RID: 3939 RVA: 0x0006D194 File Offset: 0x0006B394
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			foreach (missionSummaryClass.DeviceUsedClass deviceUsedClass in msn_sum.devices_used)
			{
				if (deviceUsedClass.id == this.gear_id)
				{
					handler.activate_event(this.id, -1);
				}
			}
		}

		// Token: 0x04000FBF RID: 4031
		public int gear_id;
	}

	// Token: 0x0200022A RID: 554
	private class DeviceTypeUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F64 RID: 3940 RVA: 0x0006D214 File Offset: 0x0006B414
		public DeviceTypeUnlock(int gear_id)
		{
			this.gear_id = gear_id;
		}

		// Token: 0x06000F65 RID: 3941 RVA: 0x0006D224 File Offset: 0x0006B424
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			if (plr_dev.type == this.gear_id)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FC0 RID: 4032
		public int gear_id;
	}

	// Token: 0x0200022B RID: 555
	private class HintUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F66 RID: 3942 RVA: 0x0006D244 File Offset: 0x0006B444
		public HintUnlock(string[] id_pool)
		{
			this.id_pool = id_pool;
		}

		// Token: 0x06000F67 RID: 3943 RVA: 0x0006D254 File Offset: 0x0006B454
		public override void on_app_login(AchievementEvents handler)
		{
			int num = Random.Range(0, this.id_pool.Length);
			handler.activate_event(this.id_pool[num], -1);
		}

		// Token: 0x04000FC1 RID: 4033
		public string[] id_pool;
	}

	// Token: 0x0200022C RID: 556
	private class UsedWeaponUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F68 RID: 3944 RVA: 0x0006D280 File Offset: 0x0006B480
		public UsedWeaponUnlock(string wep_id)
		{
			this.wep_id = wep_id;
		}

		// Token: 0x06000F69 RID: 3945 RVA: 0x0006D290 File Offset: 0x0006B490
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			foreach (missionSummaryClass.WeaponUsedClass weaponUsedClass in msn_sum.weps_used)
			{
				if (weaponUsedClass.wep_id == this.wep_id)
				{
					handler.activate_event(this.id, -1);
				}
			}
		}

		// Token: 0x04000FC2 RID: 4034
		public string wep_id;
	}

	// Token: 0x0200022D RID: 557
	private class HasUnlockUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F6A RID: 3946 RVA: 0x0006D314 File Offset: 0x0006B514
		public HasUnlockUnlock(string unlock_id)
		{
			this.unlock_id = unlock_id;
		}

		// Token: 0x06000F6B RID: 3947 RVA: 0x0006D324 File Offset: 0x0006B524
		public override void on_plr_dev_change(PlayerDeviceClass plr_dev, AchievementEvents handler)
		{
			if (plr_dev.unlocks.Contains(this.unlock_id))
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FC3 RID: 4035
		public string unlock_id;
	}

	// Token: 0x0200022E RID: 558
	private class DefeatInLocationUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F6C RID: 3948 RVA: 0x0006D34C File Offset: 0x0006B54C
		public DefeatInLocationUnlock(string location_id)
		{
			this.location_id = location_id;
		}

		// Token: 0x06000F6D RID: 3949 RVA: 0x0006D35C File Offset: 0x0006B55C
		public override void on_mission_summary(missionSummaryClass msn_sum, AchievementEvents handler)
		{
			if (!msn_sum.completed && msn_sum.location == this.location_id)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x04000FC4 RID: 4036
		private string location_id;
	}

	// Token: 0x0200022F RID: 559
	public class ScavengerHuntUnlock : AchievementEvents.UnlockCriteria
	{
		// Token: 0x06000F6E RID: 3950 RVA: 0x0006D398 File Offset: 0x0006B598
		public ScavengerHuntUnlock(int num_items = 1)
		{
			this.num_items = num_items;
		}

		// Token: 0x06000F6F RID: 3951 RVA: 0x0006D3B0 File Offset: 0x0006B5B0
		public override bool has_count()
		{
			return true;
		}

		// Token: 0x06000F70 RID: 3952 RVA: 0x0006D3B4 File Offset: 0x0006B5B4
		public override int actions_to_complete()
		{
			return this.num_items;
		}

		// Token: 0x06000F71 RID: 3953 RVA: 0x0006D3BC File Offset: 0x0006B5BC
		public override int actions_done()
		{
			int num = 0;
			foreach (KeyValuePair<int, int> keyValuePair in globals.player_data.scavenger_hunt_data())
			{
				if (keyValuePair.Value == -1)
				{
					num++;
				}
			}
			return num;
		}

		// Token: 0x06000F72 RID: 3954 RVA: 0x0006D434 File Offset: 0x0006B634
		private void check_criteria(AchievementEvents handler)
		{
			if (this.actions_done() >= this.num_items)
			{
				handler.activate_event(this.id, -1);
			}
		}

		// Token: 0x06000F73 RID: 3955 RVA: 0x0006D454 File Offset: 0x0006B654
		public override void on_app_login(AchievementEvents handler)
		{
			this.check_criteria(handler);
		}

		// Token: 0x06000F74 RID: 3956 RVA: 0x0006D460 File Offset: 0x0006B660
		public override void on_manual_update(AchievementEvents handler)
		{
			this.check_criteria(handler);
		}

		// Token: 0x04000FC5 RID: 4037
		public int num_items = 1;
	}
}
