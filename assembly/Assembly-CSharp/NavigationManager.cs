using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x020001CF RID: 463
public class NavigationManager
{
	// Token: 0x06000DAC RID: 3500 RVA: 0x00061FC4 File Offset: 0x000601C4
	public static string current_scene()
	{
		return SceneManager.GetActiveScene().name;
	}

	// Token: 0x06000DAD RID: 3501 RVA: 0x00061FE0 File Offset: 0x000601E0
	public static void load_scene(string scene_name)
	{
		NavigationManager._loading_op = null;
		DMOManager.LogScenePlayTime(AnalyticsStrings.GetAnalyticsTranslationName(NavigationManager.current_scene()), Time.timeSinceLevelLoad.ToString(), DMOManager.LEVEL_TIME_CHANGE_REASON.PLAYERINITIALIZED);
		SceneManager.LoadScene(scene_name);
		Resources.UnloadUnusedAssets();
	}

	// Token: 0x06000DAE RID: 3502 RVA: 0x0006201C File Offset: 0x0006021C
	public static void load_scene_additive(string scene_name)
	{
		NavigationManager._loading_op = null;
		DMOManager.LogScenePlayTime(AnalyticsStrings.GetAnalyticsTranslationName(NavigationManager.current_scene()), Time.timeSinceLevelLoad.ToString(), DMOManager.LEVEL_TIME_CHANGE_REASON.PLAYERINITIALIZED);
		SceneManager.LoadScene(scene_name, 1);
	}

	// Token: 0x06000DAF RID: 3503 RVA: 0x00062054 File Offset: 0x00060254
	public static void load_scene_async(string scene_name)
	{
		DMOManager.LogScenePlayTime(AnalyticsStrings.GetAnalyticsTranslationName(NavigationManager.current_scene()), Time.timeSinceLevelLoad.ToString(), DMOManager.LEVEL_TIME_CHANGE_REASON.PLAYERINITIALIZED);
		NavigationManager._loading_op = SceneManager.LoadSceneAsync(scene_name);
	}

	// Token: 0x06000DB0 RID: 3504 RVA: 0x0006208C File Offset: 0x0006028C
	public static void reload_current_scene()
	{
		SceneManager.LoadScene(SceneManager.GetActiveScene().name);
	}

	// Token: 0x06000DB1 RID: 3505 RVA: 0x000620AC File Offset: 0x000602AC
	public static void unload_scene(string scene_name)
	{
		SceneManager.UnloadScene(scene_name);
		Resources.UnloadUnusedAssets();
	}

	// Token: 0x06000DB2 RID: 3506 RVA: 0x000620BC File Offset: 0x000602BC
	public static void set_active_scene(string scene_name)
	{
		SceneManager.SetActiveScene(SceneManager.GetSceneByName(scene_name));
	}

	// Token: 0x06000DB3 RID: 3507 RVA: 0x000620CC File Offset: 0x000602CC
	public static bool is_loading()
	{
		if (NavigationManager._loading_op != null && NavigationManager._loading_op.isDone)
		{
			NavigationManager._loading_op = null;
		}
		return NavigationManager._loading_op != null;
	}

	// Token: 0x04000D63 RID: 3427
	public static string store_scene = "store menu";

	// Token: 0x04000D64 RID: 3428
	public static string armory_lobby_scene = "armory lobby menu";

	// Token: 0x04000D65 RID: 3429
	public static string gtm_scene = "GTM menu";

	// Token: 0x04000D66 RID: 3430
	public static string location_scene = "location menu";

	// Token: 0x04000D67 RID: 3431
	public static string hq_scene = "HQ menu";

	// Token: 0x04000D68 RID: 3432
	public static string store_item_panel = "store item";

	// Token: 0x04000D69 RID: 3433
	public static string mission_manager_panel = "mission manager menu";

	// Token: 0x04000D6A RID: 3434
	public static string database_panel = "database menu";

	// Token: 0x04000D6B RID: 3435
	public static string profile_panel = "profile menu";

	// Token: 0x04000D6C RID: 3436
	public static string settings_panel = "settings menu";

	// Token: 0x04000D6D RID: 3437
	public static string progress_report_panel = "progress report";

	// Token: 0x04000D6E RID: 3438
	private static AsyncOperation _loading_op;
}
