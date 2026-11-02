using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

// Token: 0x0200029A RID: 666
public static class globals
{
	// Token: 0x060011DD RID: 4573 RVA: 0x0007FD9C File Offset: 0x0007DF9C
	public static bool progress_report_pending()
	{
		return !globals.report_items.user_cancelled && (globals.gear_level_from_xp(globals.previous_xp) < globals.gear_level_from_xp(globals.current_xp) || globals.report_items.missions.Count > 0 || globals.report_items.abilities.Count > 0 || globals.report_items.sf.Count > 0 || globals.report_items.achievements.Count > 0);
	}

	// Token: 0x060011DE RID: 4574 RVA: 0x0007FE28 File Offset: 0x0007E028
	public static bool mola_busy(bool log = false)
	{
		return globals.mola_transfer_not_allowed(log) || globals.mola_downloading(log);
	}

	// Token: 0x060011DF RID: 4575 RVA: 0x0007FE40 File Offset: 0x0007E040
	public static bool mola_transfer_not_allowed(bool log = false)
	{
		if (globals.file_transfer_allowed < 1)
		{
			if (log)
			{
				globals.debug("mola busy: file_transfer_allowed = " + globals.file_transfer_allowed.ToString());
			}
			return true;
		}
		return false;
	}

	// Token: 0x060011E0 RID: 4576 RVA: 0x0007FE70 File Offset: 0x0007E070
	public static bool mola_downloading(bool log = false)
	{
		if (globals.packageDownload_manager.current_install != string.Empty)
		{
			if (log)
			{
				globals.debug("mola busy: packageDownload_manager.current_install = " + globals.packageDownload_manager.current_install);
			}
			return true;
		}
		if (globals.player_data.firmwareUpdateStarted)
		{
			if (log)
			{
				globals.debug("mola busy: firmwareUpdateStarted");
			}
			return true;
		}
		return false;
	}

	// Token: 0x060011E1 RID: 4577 RVA: 0x0007FEDC File Offset: 0x0007E0DC
	public static bool touring()
	{
		return globals.current_tour && globals.current_tour.gameObject.activeInHierarchy;
	}

	// Token: 0x060011E2 RID: 4578 RVA: 0x0007FF00 File Offset: 0x0007E100
	public static void resetReport()
	{
		globals.report_items = new sReportItems(true);
	}

	// Token: 0x060011E3 RID: 4579 RVA: 0x0007FF10 File Offset: 0x0007E110
	public static void add_new_ability(string ability)
	{
		globals.new_abilities.Add(ability);
		if (!globals.report_items.user_cancelled)
		{
			globals.report_items.abilities.Add(ability);
		}
	}

	// Token: 0x060011E4 RID: 4580 RVA: 0x0007FF48 File Offset: 0x0007E148
	public static void add_new_sf_rep(SFRepClass rep, bool leveled_up = false)
	{
		if (!globals.report_items.user_cancelled)
		{
			globals.report_items.sf.Add(rep);
		}
		if (leveled_up)
		{
			globals.new_sf_level.Add(rep);
		}
	}

	// Token: 0x17000209 RID: 521
	// (get) Token: 0x060011E5 RID: 4581 RVA: 0x0007FF88 File Offset: 0x0007E188
	public static List<missionSummaryClass> mission_summary
	{
		get
		{
			return globals._mission_summary;
		}
	}

	// Token: 0x1700020A RID: 522
	// (get) Token: 0x060011E6 RID: 4582 RVA: 0x0007FF90 File Offset: 0x0007E190
	public static DatafileRosterBehavior datafile_roster
	{
		get
		{
			if (!globals._datafile_roster)
			{
				globals._datafile_roster = Resources.Load<DatafileRosterBehavior>("datafile roster");
			}
			return globals._datafile_roster;
		}
	}

	// Token: 0x1700020B RID: 523
	// (get) Token: 0x060011E7 RID: 4583 RVA: 0x0007FFB8 File Offset: 0x0007E1B8
	public static string db_icon_prefix
	{
		get
		{
			return globals.datafile_roster.db_icon_prefix;
		}
	}

	// Token: 0x1700020C RID: 524
	// (get) Token: 0x060011E8 RID: 4584 RVA: 0x0007FFC4 File Offset: 0x0007E1C4
	public static locationDataClass location_data
	{
		get
		{
			if (globals._location_data == null)
			{
				globals._location_data = new locationDataClass();
				TextAsset location_data = globals.datafile_roster.location_data;
				if (location_data)
				{
					globals._location_data.parse(location_data.text);
				}
			}
			return globals._location_data;
		}
	}

	// Token: 0x1700020D RID: 525
	// (get) Token: 0x060011E9 RID: 4585 RVA: 0x00080010 File Offset: 0x0007E210
	public static DBDataClass database_data
	{
		get
		{
			if (globals._database_data == null)
			{
				globals._database_data = globals.datafile_roster.parse_datafiles();
			}
			return globals._database_data;
		}
	}

	// Token: 0x1700020E RID: 526
	// (get) Token: 0x060011EA RID: 4586 RVA: 0x00080030 File Offset: 0x0007E230
	public static StoreDataClass store_data
	{
		get
		{
			if (globals._store_data == null)
			{
				globals._store_data = globals.datafile_roster.parse_store_datafiles();
			}
			return globals._store_data;
		}
	}

	// Token: 0x1700020F RID: 527
	// (get) Token: 0x060011EB RID: 4587 RVA: 0x00080050 File Offset: 0x0007E250
	public static AchievementDataClass achievement_data
	{
		get
		{
			if (globals._achievement_data == null)
			{
				globals._achievement_data = globals.datafile_roster.parse_achievement_datafiles();
			}
			return globals._achievement_data;
		}
	}

	// Token: 0x17000210 RID: 528
	// (get) Token: 0x060011EC RID: 4588 RVA: 0x00080070 File Offset: 0x0007E270
	public static NotificationDataClass notification_data
	{
		get
		{
			if (globals._notification_data == null)
			{
				globals._notification_data = globals.datafile_roster.parse_notification_datafile();
			}
			return globals._notification_data;
		}
	}

	// Token: 0x17000211 RID: 529
	// (get) Token: 0x060011ED RID: 4589 RVA: 0x00080090 File Offset: 0x0007E290
	public static EnvironmentManagerBehavior environment_manager
	{
		get
		{
			if (!globals._environment_manager)
			{
				if (Application.isPlaying)
				{
					globals._environment_manager = Object.Instantiate<EnvironmentManagerBehavior>(Resources.Load<EnvironmentManagerBehavior>("environment manager"));
					globals._environment_manager.name = "environment manager";
					Object.DontDestroyOnLoad(globals._environment_manager.gameObject);
				}
				else
				{
					globals._environment_manager = Resources.Load<EnvironmentManagerBehavior>("environment manager");
				}
			}
			return globals._environment_manager;
		}
	}

	// Token: 0x17000212 RID: 530
	// (get) Token: 0x060011EE RID: 4590 RVA: 0x00080104 File Offset: 0x0007E304
	public static NetworkManagerBehavior network_manager
	{
		get
		{
			if (!globals._network_manager)
			{
				if (Application.isPlaying)
				{
					globals._network_manager = Object.Instantiate<NetworkManagerBehavior>(Resources.Load<NetworkManagerBehavior>("network manager"));
					globals._network_manager.name = "network manager";
					Object.DontDestroyOnLoad(globals._network_manager.gameObject);
				}
				else
				{
					globals._network_manager = Resources.Load<NetworkManagerBehavior>("network manager");
				}
			}
			return globals._network_manager;
		}
	}

	// Token: 0x17000213 RID: 531
	// (get) Token: 0x060011EF RID: 4591 RVA: 0x00080178 File Offset: 0x0007E378
	public static BLEManager BLE_manager
	{
		get
		{
			if (!globals._BLE_manager)
			{
				if (Application.isPlaying)
				{
					globals._BLE_manager = Object.Instantiate<BLEManager>(Resources.Load<BLEManager>("BLE manager"));
					globals._BLE_manager.name = "BLE manager";
					Object.DontDestroyOnLoad(globals._BLE_manager.gameObject);
				}
				else
				{
					globals._BLE_manager = Resources.Load<BLEManager>("BLE manager");
				}
			}
			return globals._BLE_manager;
		}
	}

	// Token: 0x17000214 RID: 532
	// (get) Token: 0x060011F0 RID: 4592 RVA: 0x000801EC File Offset: 0x0007E3EC
	public static bool BLE_manager_exists
	{
		get
		{
			return globals._BLE_manager;
		}
	}

	// Token: 0x17000215 RID: 533
	// (get) Token: 0x060011F1 RID: 4593 RVA: 0x000801F8 File Offset: 0x0007E3F8
	public static DisneyIDManager DisneyIDManager
	{
		get
		{
			if (!globals._DisneyIDManager)
			{
				if (Application.isPlaying)
				{
					globals._DisneyIDManager = Object.Instantiate<DisneyIDManager>(Resources.Load<DisneyIDManager>("DisneyID Manager"));
					globals._DisneyIDManager.name = "DisneyID Manager";
					Object.DontDestroyOnLoad(globals._DisneyIDManager.gameObject);
				}
				else
				{
					globals._DisneyIDManager = Resources.Load<DisneyIDManager>("DisneyID Manager");
				}
			}
			return globals._DisneyIDManager;
		}
	}

	// Token: 0x17000216 RID: 534
	// (get) Token: 0x060011F2 RID: 4594 RVA: 0x0008026C File Offset: 0x0007E46C
	public static packageDownloadManager packageDownload_manager
	{
		get
		{
			if (!globals._packageDownload_manager)
			{
				globals._packageDownload_manager = Object.Instantiate<packageDownloadManager>(Resources.Load<packageDownloadManager>("package download manager"));
				globals._packageDownload_manager.name = "package download manager";
				Object.DontDestroyOnLoad(globals._packageDownload_manager.gameObject);
			}
			return globals._packageDownload_manager;
		}
	}

	// Token: 0x17000217 RID: 535
	// (get) Token: 0x060011F3 RID: 4595 RVA: 0x000802C0 File Offset: 0x0007E4C0
	public static FirmwareMainBehavior firmware_manager
	{
		get
		{
			if (!globals._firmware_manager)
			{
				globals._firmware_manager = Object.Instantiate<FirmwareMainBehavior>(Resources.Load<FirmwareMainBehavior>("firmware update manager"));
				globals._firmware_manager.name = "firmware update manager";
				Object.DontDestroyOnLoad(globals._firmware_manager.gameObject);
			}
			return globals._firmware_manager;
		}
	}

	// Token: 0x17000218 RID: 536
	// (get) Token: 0x060011F4 RID: 4596 RVA: 0x00080314 File Offset: 0x0007E514
	public static ScavengerHuntManagerClass scavenger_hunt_manager
	{
		get
		{
			if (!globals._scavenger_hunt_manager)
			{
				globals._scavenger_hunt_manager = globals.datafile_roster.parse_scavenger_hunt_datafile();
			}
			return globals._scavenger_hunt_manager;
		}
	}

	// Token: 0x17000219 RID: 537
	// (get) Token: 0x060011F5 RID: 4597 RVA: 0x0008033C File Offset: 0x0007E53C
	public static SFXJukeboxBehavior sfx_master
	{
		get
		{
			if (!globals._sfx_master)
			{
				globals._sfx_master = Object.Instantiate<SFXJukeboxBehavior>(Resources.Load<SFXJukeboxBehavior>("sfx master"));
				globals._sfx_master.name = "sfx master";
				Object.DontDestroyOnLoad(globals._sfx_master);
			}
			return globals._sfx_master;
		}
	}

	// Token: 0x1700021A RID: 538
	// (get) Token: 0x060011F6 RID: 4598 RVA: 0x0008038C File Offset: 0x0007E58C
	public static MusicJukeboxBehavior music_jukebox
	{
		get
		{
			if (!globals._music_jukebox)
			{
				globals._music_jukebox = Object.Instantiate<MusicJukeboxBehavior>(Resources.Load<MusicJukeboxBehavior>("music jukebox"));
				globals._music_jukebox.name = "music jukebox";
				Object.DontDestroyOnLoad(globals._music_jukebox);
			}
			return globals._music_jukebox;
		}
	}

	// Token: 0x1700021B RID: 539
	// (get) Token: 0x060011F7 RID: 4599 RVA: 0x000803DC File Offset: 0x0007E5DC
	public static URLRosterBehavior URL_roster
	{
		get
		{
			if (!globals._URL_roster)
			{
				globals._URL_roster = Resources.Load<URLRosterBehavior>("URL roster");
			}
			return globals._URL_roster;
		}
	}

	// Token: 0x1700021C RID: 540
	// (get) Token: 0x060011F8 RID: 4600 RVA: 0x00080404 File Offset: 0x0007E604
	public static FTUEManagerBehavior FTUE_manager
	{
		get
		{
			if (!globals._FTUE_manager)
			{
				globals._FTUE_manager = Resources.Load<FTUEManagerBehavior>("ftue manager");
			}
			return globals._FTUE_manager;
		}
	}

	// Token: 0x1700021D RID: 541
	// (get) Token: 0x060011F9 RID: 4601 RVA: 0x0008042C File Offset: 0x0007E62C
	public static PlayerData player_data
	{
		get
		{
			if (globals._player_data == null)
			{
				globals._player_data = new PlayerData();
				globals._player_data.readData();
			}
			return globals._player_data;
		}
	}

	// Token: 0x1700021E RID: 542
	// (get) Token: 0x060011FA RID: 4602 RVA: 0x00080454 File Offset: 0x0007E654
	public static int[] xp_to_level
	{
		get
		{
			if (globals._xp_to_level.Length < 1)
			{
				globals._xp_to_level = globals.datafile_roster.xp_to_level.text.ToIntArray('\n');
			}
			return globals._xp_to_level;
		}
	}

	// Token: 0x1700021F RID: 543
	// (get) Token: 0x060011FB RID: 4603 RVA: 0x00080484 File Offset: 0x0007E684
	public static int[] sf_xp_to_level
	{
		get
		{
			if (globals._sf_xp_to_level.Length < 1)
			{
				globals._sf_xp_to_level = globals.datafile_roster.sf_xp_to_level.text.ToIntArray('\n');
			}
			return globals._sf_xp_to_level;
		}
	}

	// Token: 0x060011FC RID: 4604 RVA: 0x000804B4 File Offset: 0x0007E6B4
	public static int gear_level_from_xp(int xp)
	{
		for (int i = 1; i < globals.xp_to_level.Length; i++)
		{
			if (globals.xp_to_level[i] > xp)
			{
				return i - 1;
			}
		}
		return globals.xp_to_level.Length - 1;
	}

	// Token: 0x060011FD RID: 4605 RVA: 0x000804F4 File Offset: 0x0007E6F4
	public static float gear_xp_to_fill(int xp)
	{
		int num = globals.gear_level_from_xp(xp);
		if (num < globals.xp_to_level.Length - 1)
		{
			int num2 = globals.xp_to_level[num];
			float num3 = (float)(globals.xp_to_level[num + 1] - globals.xp_to_level[num]);
			return (float)(xp - num2) / num3;
		}
		return 1f;
	}

	// Token: 0x060011FE RID: 4606 RVA: 0x00080540 File Offset: 0x0007E740
	public static int current_gear_level()
	{
		if (globals.player_data.latest_device_data)
		{
			return globals.gear_level_from_xp(globals.player_data.latest_device_data.xp);
		}
		return 0;
	}

	// Token: 0x060011FF RID: 4607 RVA: 0x00080578 File Offset: 0x0007E778
	public static int sf_level_from_xp(int xp)
	{
		for (int i = 1; i < globals.sf_xp_to_level.Length; i++)
		{
			if (globals.sf_xp_to_level[i] > xp)
			{
				return i - 1;
			}
		}
		return globals.sf_xp_to_level.Length - 1;
	}

	// Token: 0x06001200 RID: 4608 RVA: 0x000805B8 File Offset: 0x0007E7B8
	public static bool close_top_panel()
	{
		while (globals.top_panel.Count > 0 && (!globals.top_panel.Last<BackButtonCloseBehavior>() || !globals.top_panel.Last<BackButtonCloseBehavior>().gameObject.activeInHierarchy))
		{
			globals.top_panel.Pop<BackButtonCloseBehavior>();
		}
		if (globals.top_panel.Count > 0)
		{
			globals.top_panel.Last<BackButtonCloseBehavior>().close(false);
			return true;
		}
		return false;
	}

	// Token: 0x06001201 RID: 4609 RVA: 0x00080638 File Offset: 0x0007E838
	public static bool base_escape_hit()
	{
		return Input.GetKeyDown(27) && !globals.close_top_panel();
	}

	// Token: 0x06001202 RID: 4610 RVA: 0x00080650 File Offset: 0x0007E850
	public static Vector2 pol2cart(float angle, float radius)
	{
		return new Vector2(Mathf.Sin(angle * 0.017453292f) * radius, -Mathf.Cos(angle * 0.017453292f) * radius);
	}

	// Token: 0x17000220 RID: 544
	// (get) Token: 0x06001203 RID: 4611 RVA: 0x00080684 File Offset: 0x0007E884
	public static bool showing_alert
	{
		get
		{
			return globals.current_alert && globals.current_alert.activeInHierarchy;
		}
	}

	// Token: 0x06001204 RID: 4612 RVA: 0x000806A4 File Offset: 0x0007E8A4
	public static void show_OK_alert(string title, string body, EventDelegate.Callback callback = null)
	{
		GameObject gameObject;
		if (globals.gear_daisy)
		{
			gameObject = NGUITools.GetRoot(globals.gear_daisy.gameObject);
		}
		else
		{
			gameObject = GameObject.Find("UI Root");
		}
		if (!gameObject)
		{
			globals.debugWarning("can't find a viable parent for alert popup");
			return;
		}
		PopupAlert.Show(title, body, Localization.Get("OKAY"), gameObject, callback, 1f);
	}

	// Token: 0x06001205 RID: 4613 RVA: 0x00080710 File Offset: 0x0007E910
	public static void show_localized_OK_alert(string title, string body, EventDelegate.Callback callback = null)
	{
		globals.show_OK_alert(Localization.Get(title), Localization.Get(body), callback);
	}

	// Token: 0x06001206 RID: 4614 RVA: 0x00080724 File Offset: 0x0007E924
	public static void show_confirm_alert(string title, string body, EventDelegate.Callback yes_callback, EventDelegate.Callback no_callback, string yesLabel = "OK", string cancelLabel = "CANCEL", bool addOnUIRoot = false)
	{
		if (!globals.gear_daisy && !addOnUIRoot)
		{
			return;
		}
		if (!addOnUIRoot)
		{
			ConfirmationPopupAlert.Show(title, body, yesLabel, cancelLabel, NGUITools.GetRoot(globals.gear_daisy.gameObject), yes_callback, no_callback);
		}
		else
		{
			ConfirmationPopupAlert.Show(title, body, yesLabel, cancelLabel, GameObject.Find("UI Root"), yes_callback, no_callback);
		}
	}

	// Token: 0x06001207 RID: 4615 RVA: 0x00080788 File Offset: 0x0007E988
	public static void show_localized_confirm_alert(string title, string body, EventDelegate.Callback yes_callback, EventDelegate.Callback no_callback, string yesLabel = "OK", string noLabel = "CANCEL", bool addOnUIRoot = false)
	{
		globals.show_confirm_alert(Localization.Get(title), Localization.Get(body), yes_callback, no_callback, Localization.Get(yesLabel), Localization.Get(noLabel), addOnUIRoot);
	}

	// Token: 0x06001208 RID: 4616 RVA: 0x000807B8 File Offset: 0x0007E9B8
	public static void removeAlertPopup()
	{
		GameObject gameObject = GameObject.Find("PopupAlert");
		if (gameObject != null)
		{
			Object.Destroy(gameObject);
		}
	}

	// Token: 0x06001209 RID: 4617 RVA: 0x000807E4 File Offset: 0x0007E9E4
	public static void show_no_internet_alert(EventDelegate.Callback callback = null)
	{
		globals.show_OK_alert(Localization.Get("CONNECTION_HEADER"), Localization.Get("NO_INTERNET"), callback);
	}

	// Token: 0x0600120A RID: 4618 RVA: 0x00080800 File Offset: 0x0007EA00
	public static void add_mission_summary(missionSummaryClass s)
	{
		missionDataClass missionDataClass = globals.location_data.mission_by_id(s.mission);
		if (missionDataClass && missionDataClass.rated)
		{
			globals._mission_summary.Add(s);
			if (!globals.report_items.user_cancelled)
			{
				globals.report_items.missions.Add(s);
			}
		}
		globals.player_data.parse_enemy_kills(s.enemies_killed);
		AchievementEvents.inst.on_mission_summary(s);
		globals.player_data.saveData(false, false);
	}

	// Token: 0x0600120B RID: 4619 RVA: 0x00080888 File Offset: 0x0007EA88
	public static void clear_mission_summaries()
	{
		globals._mission_summary.Clear();
	}

	// Token: 0x17000221 RID: 545
	// (get) Token: 0x0600120C RID: 4620 RVA: 0x00080894 File Offset: 0x0007EA94
	public static build_type_enum build_type
	{
		get
		{
			return globals.environment_manager.build_type;
		}
	}

	// Token: 0x0600120D RID: 4621 RVA: 0x000808A0 File Offset: 0x0007EAA0
	public static void login()
	{
		globals.logout();
		if (!globals.player_data.isAuthenticated() || !globals.DisneyIDManager.disneyHybridLoginEnable)
		{
			globals.FTUE_manager.login();
		}
	}

	// Token: 0x0600120E RID: 4622 RVA: 0x000808D0 File Offset: 0x0007EAD0
	public static void logout()
	{
		globals.player_data.logout();
		globals.BLE_manager.logout();
		globals.DisneyIDManager.onLogout();
	}

	// Token: 0x0600120F RID: 4623 RVA: 0x000808FC File Offset: 0x0007EAFC
	public static void open_mm_to_location(string id, bool download = true)
	{
		if (!globals.gear_daisy)
		{
			globals.debugWarning("can't open mission manager! no gear daisy!");
			return;
		}
		globals.gear_daisy.open_mm_to_location(id, download);
	}

	// Token: 0x06001210 RID: 4624 RVA: 0x00080930 File Offset: 0x0007EB30
	public static void lowBatteryWarning()
	{
		globals.show_OK_alert(Localization.Get("LOW_BATTERY_WARNING_HEADER"), Localization.Get("LOW_BATTERY_WARNING_MESSAGE"), null);
	}

	// Token: 0x06001211 RID: 4625 RVA: 0x0008094C File Offset: 0x0007EB4C
	public static void add_hide_scav_key(string key)
	{
		if (!globals.hide_scavenger_hunt.Contains(key))
		{
			globals.hide_scavenger_hunt.Add(key);
		}
	}

	// Token: 0x06001212 RID: 4626 RVA: 0x0008096C File Offset: 0x0007EB6C
	public static void remove_hide_scav_key(string key)
	{
		if (globals.hide_scavenger_hunt.Contains(key))
		{
			globals.hide_scavenger_hunt.Remove(key);
		}
	}

	// Token: 0x06001213 RID: 4627 RVA: 0x0008098C File Offset: 0x0007EB8C
	public static void debug(string log)
	{
		if (!globals.environment_manager.log_SDK)
		{
			return;
		}
		if (Application.platform == 8 && !Application.isEditor)
		{
			NativeManager.getNative().unityLog(log);
		}
		else
		{
			Debug.Log(log);
		}
	}

	// Token: 0x06001214 RID: 4628 RVA: 0x000809CC File Offset: 0x0007EBCC
	public static void debug(Exception log)
	{
		if (!globals.environment_manager.log_SDK)
		{
			return;
		}
		Debug.Log(log);
	}

	// Token: 0x06001215 RID: 4629 RVA: 0x000809E4 File Offset: 0x0007EBE4
	public static void debugWarning(string log)
	{
		if (!globals.environment_manager.log_SDK)
		{
			return;
		}
		Debug.LogWarning(log);
	}

	// Token: 0x06001216 RID: 4630 RVA: 0x000809FC File Offset: 0x0007EBFC
	public static void debugWarning(Exception log)
	{
		if (!globals.environment_manager.log_SDK)
		{
			return;
		}
		Debug.LogWarning(log);
	}

	// Token: 0x06001217 RID: 4631 RVA: 0x00080A14 File Offset: 0x0007EC14
	public static void debugError(string log)
	{
		if (!globals.environment_manager.log_SDK)
		{
			return;
		}
		Debug.LogError(log);
	}

	// Token: 0x06001218 RID: 4632 RVA: 0x00080A2C File Offset: 0x0007EC2C
	public static void debugError(Exception log)
	{
		if (!globals.environment_manager.log_SDK)
		{
			return;
		}
		Debug.LogError(log);
	}

	// Token: 0x06001219 RID: 4633 RVA: 0x00080A44 File Offset: 0x0007EC44
	public static void debugException(Exception log)
	{
		if (!globals.environment_manager.log_SDK)
		{
			return;
		}
		Debug.LogException(log);
	}

	// Token: 0x0600121A RID: 4634 RVA: 0x00080A5C File Offset: 0x0007EC5C
	public static void safeFileMove(string fileName, string toFileName)
	{
		if (File.Exists(fileName))
		{
			if (File.Exists(toFileName))
			{
				File.Delete(toFileName);
			}
			File.Move(fileName, toFileName);
		}
	}

	// Token: 0x0600121B RID: 4635 RVA: 0x00080A84 File Offset: 0x0007EC84
	public static string medal_spritename(int grade)
	{
		if (grade < 1 || !globals.player_data.latest_device_data)
		{
			return string.Empty;
		}
		if (grade > globals._max_grade)
		{
			grade = globals._max_grade;
		}
		int type = globals.player_data.latest_device_data.type;
		return globals._medal_sprite_prefix + type.ToString() + "_" + grade.ToString();
	}

	// Token: 0x17000222 RID: 546
	// (get) Token: 0x0600121C RID: 4636 RVA: 0x00080AF4 File Offset: 0x0007ECF4
	public static GameObject selectedObject
	{
		get
		{
			return UICamera.selectedObject;
		}
	}

	// Token: 0x0400124A RID: 4682
	public static HQMainBehavior hq_main;

	// Token: 0x0400124B RID: 4683
	public static StoreMainBehavior store_main;

	// Token: 0x0400124C RID: 4684
	public static GearDaisyBehavior gear_daisy;

	// Token: 0x0400124D RID: 4685
	public static BlastDoorsBehavior blast_doors;

	// Token: 0x0400124E RID: 4686
	public static ArmoryLobbyMainBehavior armory_lobby;

	// Token: 0x0400124F RID: 4687
	public static ArmoryMainBehavior armory_main;

	// Token: 0x04001250 RID: 4688
	public static PosterAlbumBehavior poster_album;

	// Token: 0x04001251 RID: 4689
	public static TourGroup current_tour;

	// Token: 0x04001252 RID: 4690
	public static string store_item_id = string.Empty;

	// Token: 0x04001253 RID: 4691
	public static string location_id = string.Empty;

	// Token: 0x04001254 RID: 4692
	public static AudioClip mission_prompt;

	// Token: 0x04001255 RID: 4693
	public static bool bleInitiated = false;

	// Token: 0x04001256 RID: 4694
	public static int analytics_ready_for_upload = -1;

	// Token: 0x04001257 RID: 4695
	public static int file_transfer_allowed = -1;

	// Token: 0x04001258 RID: 4696
	public static int files_ready_for_upload = -1;

	// Token: 0x04001259 RID: 4697
	public static int mission_to_open = -1;

	// Token: 0x0400125A RID: 4698
	public static AbilityDBItemClass ability_to_test;

	// Token: 0x0400125B RID: 4699
	public static int gear_volume = -1;

	// Token: 0x0400125C RID: 4700
	public static int previous_xp = -1;

	// Token: 0x0400125D RID: 4701
	public static int current_xp = -1;

	// Token: 0x0400125E RID: 4702
	public static bool isFirmwareUpdateAvailable = false;

	// Token: 0x0400125F RID: 4703
	public static bool isFirmwareUptodate = false;

	// Token: 0x04001260 RID: 4704
	public static bool gearMenuActive = false;

	// Token: 0x04001261 RID: 4705
	public static accountDataClass account_data = new accountDataClass();

	// Token: 0x04001262 RID: 4706
	public static string textdump_string = string.Empty;

	// Token: 0x04001263 RID: 4707
	public static bool autoConnect = false;

	// Token: 0x04001264 RID: 4708
	public static string sdkVersion = string.Empty;

	// Token: 0x04001265 RID: 4709
	public static string latestAppVersion = "0.0.0";

	// Token: 0x04001266 RID: 4710
	public static float update_snooze = -1f;

	// Token: 0x04001267 RID: 4711
	public static List<SFRepClass> new_sf_level = new List<SFRepClass>();

	// Token: 0x04001268 RID: 4712
	public static List<string> new_abilities = new List<string>();

	// Token: 0x04001269 RID: 4713
	private static List<missionSummaryClass> _mission_summary = new List<missionSummaryClass>();

	// Token: 0x0400126A RID: 4714
	public static sReportItems report_items = new sReportItems(true);

	// Token: 0x0400126B RID: 4715
	public static bool retinalScan = false;

	// Token: 0x0400126C RID: 4716
	public static List<string> hide_scavenger_hunt = new List<string>();

	// Token: 0x0400126D RID: 4717
	public static List<string> temp_unlocks = new List<string>();

	// Token: 0x0400126E RID: 4718
	private static string _medal_sprite_prefix = "medal_";

	// Token: 0x0400126F RID: 4719
	private static int _max_grade = 3;

	// Token: 0x04001270 RID: 4720
	private static DatafileRosterBehavior _datafile_roster;

	// Token: 0x04001271 RID: 4721
	private static locationDataClass _location_data;

	// Token: 0x04001272 RID: 4722
	private static DBDataClass _database_data;

	// Token: 0x04001273 RID: 4723
	private static StoreDataClass _store_data;

	// Token: 0x04001274 RID: 4724
	private static AchievementDataClass _achievement_data;

	// Token: 0x04001275 RID: 4725
	private static NotificationDataClass _notification_data;

	// Token: 0x04001276 RID: 4726
	private static EnvironmentManagerBehavior _environment_manager;

	// Token: 0x04001277 RID: 4727
	private static NetworkManagerBehavior _network_manager;

	// Token: 0x04001278 RID: 4728
	private static BLEManager _BLE_manager;

	// Token: 0x04001279 RID: 4729
	private static DisneyIDManager _DisneyIDManager;

	// Token: 0x0400127A RID: 4730
	private static packageDownloadManager _packageDownload_manager;

	// Token: 0x0400127B RID: 4731
	private static FirmwareMainBehavior _firmware_manager;

	// Token: 0x0400127C RID: 4732
	private static ScavengerHuntManagerClass _scavenger_hunt_manager;

	// Token: 0x0400127D RID: 4733
	private static SFXJukeboxBehavior _sfx_master;

	// Token: 0x0400127E RID: 4734
	private static MusicJukeboxBehavior _music_jukebox;

	// Token: 0x0400127F RID: 4735
	private static URLRosterBehavior _URL_roster;

	// Token: 0x04001280 RID: 4736
	private static FTUEManagerBehavior _FTUE_manager;

	// Token: 0x04001281 RID: 4737
	private static PlayerData _player_data;

	// Token: 0x04001282 RID: 4738
	private static int[] _xp_to_level = new int[0];

	// Token: 0x04001283 RID: 4739
	private static int[] _sf_xp_to_level = new int[0];

	// Token: 0x04001284 RID: 4740
	public static List<BackButtonCloseBehavior> top_panel = new List<BackButtonCloseBehavior>();

	// Token: 0x04001285 RID: 4741
	public static GameObject current_alert = null;
}
