using System;
using System.Collections.Generic;
using Disney.DMOAnalytics;
using UnityEngine;

// Token: 0x02000183 RID: 387
public class DMOManager
{
	// Token: 0x06000BF0 RID: 3056 RVA: 0x00057474 File Offset: 0x00055674
	public static void LogDeviceInfo()
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("context", "disney_id");
		dictionary.Add("action", "device_info");
		dictionary.Add("type", string.Concat(new object[]
		{
			SystemInfo.deviceModel,
			"_",
			SystemInfo.deviceName,
			"_",
			SystemInfo.deviceType,
			"_",
			SystemInfo.operatingSystem
		}));
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BF1 RID: 3057 RVA: 0x00057528 File Offset: 0x00055728
	public static void LogloginStart()
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("context", "disney_id");
		dictionary.Add("action", "login_start");
		dictionary.Add("type", globals.player_data.id);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BF2 RID: 3058 RVA: 0x0005759C File Offset: 0x0005579C
	public static void LogloginSuccess()
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("context", "disney_id");
		dictionary.Add("action", "login_complete");
		dictionary.Add("type", globals.player_data.id);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
		DMOManager.LogUserInfo();
	}

	// Token: 0x06000BF3 RID: 3059 RVA: 0x00057614 File Offset: 0x00055814
	public static void LogUserInfo()
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("user_id", globals.player_data.id);
		dictionary.Add("user_id_domain", "DisneyID");
		DMOAnalytics.SharedAnalytics.LogAnalyticsEventWithContext("user_info", dictionary);
	}

	// Token: 0x06000BF4 RID: 3060 RVA: 0x0005767C File Offset: 0x0005587C
	public static void LogloginFail(string error)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("context", "disney_id");
		dictionary.Add("action", "login_error");
		dictionary.Add("type", error);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BF5 RID: 3061 RVA: 0x000576E8 File Offset: 0x000558E8
	public static void LogloginScreen(string type)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("context", "disney_id");
		dictionary.Add("action", "screen");
		dictionary.Add("type", type);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BF6 RID: 3062 RVA: 0x00057754 File Offset: 0x00055954
	public static void LogDISIDRegistration(DMOManager.DISID_REGISTRATION_PROGRESS st, string error = "")
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		string text = string.Empty;
		if (st == DMOManager.DISID_REGISTRATION_PROGRESS.START)
		{
			text = "registration_start";
		}
		else if (st == DMOManager.DISID_REGISTRATION_PROGRESS.CANCEL)
		{
			text = "registration_cancel";
		}
		else if (st == DMOManager.DISID_REGISTRATION_PROGRESS.SUCCESS)
		{
			text = "registration_success";
			dictionary.Add("type", globals.player_data.id);
		}
		else if (st == DMOManager.DISID_REGISTRATION_PROGRESS.ERROR)
		{
			text = "registration_error";
			dictionary.Add("type", error);
		}
		dictionary.Add("action", text);
		dictionary.Add("context", "disney_id");
		dictionary.Add("player_id", globals.player_data.id);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BF7 RID: 3063 RVA: 0x00057818 File Offset: 0x00055A18
	public static void LogToyRegistration(int deviceid, DMOManager.REGISTRATION_PROGRESS st, string error = "")
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		string text = string.Empty;
		if (st == DMOManager.REGISTRATION_PROGRESS.START)
		{
			text = "registration_start";
		}
		else if (st == DMOManager.REGISTRATION_PROGRESS.CANCEL)
		{
			text = "registration_cancel";
		}
		else if (st == DMOManager.REGISTRATION_PROGRESS.SUCCESS)
		{
			text = "registration_success";
		}
		else if (st == DMOManager.REGISTRATION_PROGRESS.ERROR)
		{
			text = "registration_error";
			dictionary.Add("message", error);
		}
		globals.debug("LogToyRegistration " + deviceid);
		if (deviceid > 0 && globals.BLE_manager.connectedDevice_data != null)
		{
			string deviceTypeLiteral = globals.BLE_manager.connectedDevice_data.getDeviceTypeLiteral();
			dictionary.Add("type", deviceTypeLiteral + "_" + globals.BLE_manager.connectedDevice.ToString());
		}
		dictionary.Add("action", text);
		dictionary.Add("context", "device");
		dictionary.Add("player_id", globals.player_data.id);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BF8 RID: 3064 RVA: 0x0005792C File Offset: 0x00055B2C
	public static void LogDeviceConnected()
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("context", "connection");
		dictionary.Add("action", "complete");
		dictionary.Add("player_id", globals.player_data.id);
		string deviceTypeLiteral = globals.BLE_manager.connectedDevice_data.getDeviceTypeLiteral();
		dictionary.Add("type", deviceTypeLiteral + "_" + globals.BLE_manager.connectedDevice);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BF9 RID: 3065 RVA: 0x000579C0 File Offset: 0x00055BC0
	public static void LogDeviceConnectionFail(int deviceid)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("context", "connection");
		dictionary.Add("action", "fail");
		dictionary.Add("player_id", globals.player_data.id);
		if (globals.BLE_manager.connectedDevice_data)
		{
			string deviceTypeLiteral = globals.BLE_manager.connectedDevice_data.getDeviceTypeLiteral();
			dictionary.Add("type", deviceTypeLiteral + "_" + deviceid);
		}
		else
		{
			dictionary.Add("type", "unknown_" + deviceid);
		}
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BFA RID: 3066 RVA: 0x00057A80 File Offset: 0x00055C80
	public static void LogFTUEProgress(string ftue)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("context", "app_FTUE");
		dictionary.Add("action", "ftue");
		dictionary.Add("type", ftue);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BFB RID: 3067 RVA: 0x00057AEC File Offset: 0x00055CEC
	public static void LogNavigation(string to_location, string UISource, string from_location, string URL = null)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("button_pressed", UISource);
		dictionary.Add("from_location", from_location);
		dictionary.Add("to_location", to_location);
		if (!string.IsNullOrEmpty(URL))
		{
			dictionary.Add("target_url", URL);
		}
		DMOAnalytics.SharedAnalytics.LogAnalyticsEventWithContext("navigation_action", dictionary);
	}

	// Token: 0x06000BFC RID: 3068 RVA: 0x00057B6C File Offset: 0x00055D6C
	public static void LogWithContext(string eventName, Dictionary<string, object> data = null)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		if (data == null)
		{
			data = new Dictionary<string, object>();
		}
		data.Add("player_id", globals.player_data.id);
		DMOAnalytics.SharedAnalytics.LogAnalyticsEventWithContext(eventName, data);
	}

	// Token: 0x06000BFD RID: 3069 RVA: 0x00057BB4 File Offset: 0x00055DB4
	public static void LogPaymentAction(string item, string currency = "", string amount_paid = "")
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		Dictionary<string, object> dictionary2 = new Dictionary<string, object>();
		if (!amount_paid.StartsWith("-"))
		{
			amount_paid = "-" + amount_paid;
		}
		dictionary.Add("currency", currency);
		dictionary.Add("amount_paid", amount_paid);
		dictionary.Add("type", "location");
		dictionary.Add("subtype", "durable");
		dictionary2.Add("item_id", item);
		dictionary2.Add("item_count", "1");
		dictionary.Add("item", dictionary2);
		dictionary.Add("player_id", globals.player_data.id);
		DMOAnalytics.SharedAnalytics.LogAnalyticsEventWithContext("payment_action", dictionary);
	}

	// Token: 0x06000BFE RID: 3070 RVA: 0x00057C7C File Offset: 0x00055E7C
	public static void LogGameAction(string context, string action, string type, string message = null)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("context", context);
		dictionary.Add("action", action);
		dictionary.Add("type", type);
		if (!string.IsNullOrEmpty(message))
		{
			dictionary.Add("message", message);
		}
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000BFF RID: 3071 RVA: 0x00057CF8 File Offset: 0x00055EF8
	public static void LogGameActionWithToyId(string context, string action, string type, string message = null)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		if (globals.BLE_manager.connectedDevice_data != null)
		{
			string deviceTypeLiteral = globals.BLE_manager.connectedDevice_data.getDeviceTypeLiteral();
			dictionary.Add("player_id", deviceTypeLiteral + "_" + globals.BLE_manager.connectedDevice.ToString());
		}
		dictionary.Add("context", context);
		dictionary.Add("action", action);
		dictionary.Add("type", type);
		if (!string.IsNullOrEmpty(message))
		{
			dictionary.Add("message", message);
		}
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x06000C00 RID: 3072 RVA: 0x00057DA4 File Offset: 0x00055FA4
	public static void LogScenePlayTime(string location, string playtime, DMOManager.LEVEL_TIME_CHANGE_REASON reason)
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		if (reason != DMOManager.LEVEL_TIME_CHANGE_REASON.PLAYERINITIALIZED)
		{
			if (reason == DMOManager.LEVEL_TIME_CHANGE_REASON.QUITAPPLICATION)
			{
				dictionary.Add("result", "quit");
			}
		}
		else
		{
			dictionary.Add("result", "forced");
		}
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("elapsed_time", playtime);
		dictionary.Add("location", location);
		dictionary.Add("context", "page_view_time");
		DMOAnalytics.SharedAnalytics.LogAnalyticsEventWithContext("step_timing", dictionary);
	}

	// Token: 0x06000C01 RID: 3073 RVA: 0x00057E50 File Offset: 0x00056050
	public static void LogDLCProgress(string DLCID, DMOManager.DOWNLOAD_PROGRESS st, float download_time = -1f, string error = "")
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		string text = string.Empty;
		if (st == DMOManager.DOWNLOAD_PROGRESS.START)
		{
			text = "start_download";
		}
		else if (st == DMOManager.DOWNLOAD_PROGRESS.COMPLETE)
		{
			text = "complete_download";
		}
		else if (st == DMOManager.DOWNLOAD_PROGRESS.FAIL)
		{
			text = "fail_download";
		}
		else if (st == DMOManager.DOWNLOAD_PROGRESS.ERROR)
		{
			text = "error_download";
		}
		dictionary.Add("action", text);
		dictionary.Add("context", "DLC");
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("message", error);
		dictionary.Add("type", DLCID);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
		if (download_time > -1f)
		{
			Dictionary<string, object> dictionary2 = new Dictionary<string, object>();
			dictionary2.Add("player_id", globals.player_data.id);
			dictionary2.Add("context", "DLC");
			dictionary2.Add("location", DLCID);
			dictionary2.Add("elapsed_time", (int)download_time);
			dictionary2.Add("result", st.ToString());
			DMOAnalytics.SharedAnalytics.LogAnalyticsEventWithContext("step_timing", dictionary2);
		}
	}

	// Token: 0x06000C02 RID: 3074 RVA: 0x00057F84 File Offset: 0x00056184
	public static void LogFirmwarerProgress(string firmawareID, DMOManager.DOWNLOAD_PROGRESS st, string error = "")
	{
		if (!DMOManager.use_dmo_analytics)
		{
			return;
		}
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		string text = string.Empty;
		if (st == DMOManager.DOWNLOAD_PROGRESS.START)
		{
			text = "start_download";
		}
		else if (st == DMOManager.DOWNLOAD_PROGRESS.COMPLETE)
		{
			text = "complete_download";
		}
		else if (st == DMOManager.DOWNLOAD_PROGRESS.FAIL)
		{
			text = "fail_download";
		}
		else if (st == DMOManager.DOWNLOAD_PROGRESS.ERROR)
		{
			text = "error_download";
		}
		dictionary.Add("action", text);
		dictionary.Add("context", "firmware");
		dictionary.Add("player_id", globals.player_data.id);
		dictionary.Add("message", error);
		dictionary.Add("type", firmawareID);
		DMOAnalytics.SharedAnalytics.LogGameAction(dictionary);
	}

	// Token: 0x04000BC5 RID: 3013
	public static bool use_dmo_analytics;

	// Token: 0x02000184 RID: 388
	public enum DOWNLOAD_PROGRESS
	{
		// Token: 0x04000BC7 RID: 3015
		START,
		// Token: 0x04000BC8 RID: 3016
		COMPLETE,
		// Token: 0x04000BC9 RID: 3017
		FAIL,
		// Token: 0x04000BCA RID: 3018
		ERROR
	}

	// Token: 0x02000185 RID: 389
	public enum REGISTRATION_PROGRESS
	{
		// Token: 0x04000BCC RID: 3020
		START,
		// Token: 0x04000BCD RID: 3021
		CANCEL,
		// Token: 0x04000BCE RID: 3022
		SUCCESS,
		// Token: 0x04000BCF RID: 3023
		ERROR
	}

	// Token: 0x02000186 RID: 390
	public enum DISID_REGISTRATION_PROGRESS
	{
		// Token: 0x04000BD1 RID: 3025
		START,
		// Token: 0x04000BD2 RID: 3026
		CANCEL,
		// Token: 0x04000BD3 RID: 3027
		SUCCESS,
		// Token: 0x04000BD4 RID: 3028
		ERROR
	}

	// Token: 0x02000187 RID: 391
	public enum LEVEL_TIME_CHANGE_REASON
	{
		// Token: 0x04000BD6 RID: 3030
		PLAYERINITIALIZED,
		// Token: 0x04000BD7 RID: 3031
		QUITAPPLICATION
	}
}
