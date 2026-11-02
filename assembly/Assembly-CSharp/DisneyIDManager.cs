using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000261 RID: 609
public class DisneyIDManager : MonoBehaviour
{
	// Token: 0x06001076 RID: 4214 RVA: 0x00075618 File Offset: 0x00073818
	private void Start()
	{
		globals.debug(this.country.ToString());
		this.DIDWebSessionenableWithConfig();
	}

	// Token: 0x170001F5 RID: 501
	// (get) Token: 0x06001077 RID: 4215 RVA: 0x00075638 File Offset: 0x00073838
	public static string clientID
	{
		get
		{
			return "DCP-PLAYMATION.AVENGERS.AND";
		}
	}

	// Token: 0x06001078 RID: 4216 RVA: 0x00075640 File Offset: 0x00073840
	public void DIDWebSessionenableWithConfig()
	{
		string text = (!globals.environment_manager.isProd) ? "stg" : "prod";
		NativeManager.getNative().setupDisneyId(base.name, DisneyIDManager.clientID, this.country.ToString(), (this.languageSelection != languageSelection_enum.US) ? "en-CN" : "en-US", text, text, this.javascriptDebugState);
		this.isConfigured = true;
	}

	// Token: 0x06001079 RID: 4217 RVA: 0x000756BC File Offset: 0x000738BC
	public void setup()
	{
	}

	// Token: 0x0600107A RID: 4218 RVA: 0x000756C0 File Offset: 0x000738C0
	public void onLogout()
	{
		this.safeToSkip = true;
		NativeManager.getNative().onDisidLogout();
	}

	// Token: 0x0600107B RID: 4219 RVA: 0x000756D4 File Offset: 0x000738D4
	private void logOutResetHack()
	{
	}

	// Token: 0x0600107C RID: 4220 RVA: 0x000756D8 File Offset: 0x000738D8
	public void onLaunchLogin()
	{
		this.safeToSkip = true;
		if (!this.isConfigured)
		{
			this.DIDWebSessionenableWithConfig();
		}
		NativeManager.getNative().launchDisIdLoginPage();
	}

	// Token: 0x0600107D RID: 4221 RVA: 0x00075708 File Offset: 0x00073908
	public void onSilentLogin()
	{
		this.DIDWebSessionenableWithConfig();
		NativeManager.getNative().onSilentLogin();
	}

	// Token: 0x0600107E RID: 4222 RVA: 0x0007571C File Offset: 0x0007391C
	public void onForceRefreshToken()
	{
		NativeManager.getNative().onForceRefreshToken();
	}

	// Token: 0x0600107F RID: 4223 RVA: 0x00075728 File Offset: 0x00073928
	public void onLoginSuccess(string jsonData)
	{
		globals.debug("onLoginSuccess Data received: " + jsonData);
		try
		{
			this.updatePlaymationLogin(jsonData);
		}
		catch (Exception ex)
		{
			globals.debug("onLoginSuccess exception: " + ex.ToString());
		}
	}

	// Token: 0x06001080 RID: 4224 RVA: 0x00075788 File Offset: 0x00073988
	private void updatePlaymationLogin(string jsonData)
	{
		JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
		if (jsonobject.HasField("tokenData") || jsonobject.HasField("access_token"))
		{
			this.safeToSkip = false;
			string text = (!jsonobject.HasField("access_token")) ? jsonobject["tokenData"]["access_token"].str : jsonobject["access_token"].str;
			WebHandler.instance.setTokens(text);
			globals.BLE_manager.loginWithAccessToken(WebHandler.instance.token, WebHandler.instance.cellophaneKey);
			globals.network_manager.DisIDLogin(text, globals.player_data, new WebHandler.HttpResultDelegate(this.login_successful), new WebHandler.HttpErrorDelegate(this.login_failed));
			globals.network_manager.FetchDeviceInfoAll(globals.player_data, delegate(JSONObject jsonResponse)
			{
			}, new WebHandler.HttpErrorDelegate(this.GeneralFetchError));
		}
	}

	// Token: 0x06001081 RID: 4225 RVA: 0x00075890 File Offset: 0x00073A90
	public void GeneralFetchError(string url, string err)
	{
		globals.debug(url + ":" + err);
	}

	// Token: 0x06001082 RID: 4226 RVA: 0x000758A4 File Offset: 0x00073AA4
	private void login_successful(JSONObject obj)
	{
		globals.account_data.parse(obj);
		if (this.login_main)
		{
			this.login_main.load_next_scene();
		}
		DMOManager.LogloginSuccess();
	}

	// Token: 0x06001083 RID: 4227 RVA: 0x000758D4 File Offset: 0x00073AD4
	private void login_failed(string url, string errText)
	{
		globals.show_confirm_alert(string.Empty, Localization.Get("LOGIN_FAIL"), new EventDelegate.Callback(this.OnSkip), new EventDelegate.Callback(this.OnOK), Localization.Get("SKIP"), Localization.Get("OKAY"), true);
	}

	// Token: 0x06001084 RID: 4228 RVA: 0x00075924 File Offset: 0x00073B24
	public void OnOK()
	{
		globals.logout();
		globals.FTUE_manager.login();
	}

	// Token: 0x06001085 RID: 4229 RVA: 0x00075938 File Offset: 0x00073B38
	public void OnSkip()
	{
		globals.debug("Login Fail.... doing nothing");
		this.login_main.load_skip_scene();
	}

	// Token: 0x06001086 RID: 4230 RVA: 0x00075950 File Offset: 0x00073B50
	public void onRegistrationSuccess(string jsonData)
	{
		globals.debug("onRegistrationSuccess Data received: " + jsonData);
		try
		{
		}
		catch (Exception ex)
		{
			globals.debug("onLoginSuccess exception: " + ex.ToString());
		}
	}

	// Token: 0x06001087 RID: 4231 RVA: 0x000759AC File Offset: 0x00073BAC
	public void onSilentLoginError(string jsonData)
	{
		globals.debug("onSilentLoginError Data received: " + jsonData);
		try
		{
			globals.player_data.logout();
		}
		catch (Exception ex)
		{
			globals.debug("onLoginSuccess exception: " + ex.ToString());
		}
	}

	// Token: 0x06001088 RID: 4232 RVA: 0x00075A10 File Offset: 0x00073C10
	public void onSilentLoginSuccess(string jsonData)
	{
		globals.debug("onSilentLoginSuccess Data received: " + jsonData);
		try
		{
			this.updatePlaymationLogin(jsonData);
		}
		catch (Exception ex)
		{
			globals.debug("onLoginSuccess exception: " + ex.ToString());
		}
	}

	// Token: 0x06001089 RID: 4233 RVA: 0x00075A70 File Offset: 0x00073C70
	public void onWebConnectivityErrorWithError(string jsonData)
	{
		globals.debug("onWebConnectivityErrorWithError Data received: " + jsonData);
		try
		{
			PopupAlert.Show("Internet Connection", "Internet down", Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, null, 1f);
		}
		catch (Exception ex)
		{
			globals.debug("onWebConnectivityErrorWithError exception: " + ex.ToString());
		}
	}

	// Token: 0x0600108A RID: 4234 RVA: 0x00075AFC File Offset: 0x00073CFC
	public void onRefreshTokenSuccess(string jsonData)
	{
		globals.debug("onRefreshTokenSuccess Data received: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			string str = jsonobject["access_token"].str;
			WebHandler.instance.setTokens(str);
			globals.BLE_manager.loginWithAccessToken(WebHandler.instance.token, WebHandler.instance.cellophaneKey);
			globals.network_manager.DisIDLogin(str, globals.player_data, new WebHandler.HttpResultDelegate(this.login_successful), new WebHandler.HttpErrorDelegate(this.login_failed));
		}
		catch (Exception ex)
		{
			globals.debug("onRefreshTokenSuccess exception: " + ex.ToString());
		}
	}

	// Token: 0x0600108B RID: 4235 RVA: 0x00075BC4 File Offset: 0x00073DC4
	public void onRefreshTokenError(string jsonData)
	{
		globals.debug("onRefreshTokenError Data received: " + jsonData);
		try
		{
			PopupAlert.Show("Internet Connection", "Internet down", Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, null, 1f);
		}
		catch (Exception ex)
		{
			globals.debug("onRefreshTokenError exception: " + ex.ToString());
		}
	}

	// Token: 0x0600108C RID: 4236 RVA: 0x00075C50 File Offset: 0x00073E50
	public void onGetGuestLoginGenericError(string jsonData)
	{
		globals.debug("onGetGuestLoginGenericError Data received: " + jsonData);
		try
		{
			PopupAlert.Show(string.Empty, "Login Fail, Please try again", Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, null, 1f);
		}
		catch (Exception ex)
		{
			globals.debug("onGetGuestLoginGenericError exception: " + ex.ToString());
		}
	}

	// Token: 0x0600108D RID: 4237 RVA: 0x00075CDC File Offset: 0x00073EDC
	public void onWebViewDidFailLoadWithError(string jsonData)
	{
		globals.debug("onWebViewDidFailLoadWithError Data received: " + jsonData);
		try
		{
			PopupAlert.Show(string.Empty, "Fail to connect to server, Please try again", Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, new EventDelegate.Callback(this.onLaunchLogin), 1f);
		}
		catch (Exception ex)
		{
			globals.debug("onWebViewDidFailLoadWithError exception: " + ex.ToString());
		}
	}

	// Token: 0x0600108E RID: 4238 RVA: 0x00075D74 File Offset: 0x00073F74
	public void addDeviceEventCallback(DisneyIDManager.DisneyIDeEvent eventType, DisneyIDManager.DataReceivedDelegate callback)
	{
		if (!this.disneyIDeEventDelegates.ContainsKey(eventType))
		{
			this.disneyIDeEventDelegates.Add(eventType, new List<DisneyIDManager.DataReceivedDelegate>());
		}
		this.disneyIDeEventDelegates[eventType].Add(callback);
	}

	// Token: 0x0600108F RID: 4239 RVA: 0x00075DB8 File Offset: 0x00073FB8
	public void removeDeviceEventCallback(DisneyIDManager.DisneyIDeEvent eventType, DisneyIDManager.DataReceivedDelegate callback)
	{
		if (this.disneyIDeEventDelegates.ContainsKey(eventType))
		{
			this.disneyIDeEventDelegates[eventType].Remove(callback);
		}
	}

	// Token: 0x06001090 RID: 4240 RVA: 0x00075DEC File Offset: 0x00073FEC
	public void SendDeviceEventDataToDelegates(DisneyIDManager.DisneyIDeEvent dEvent, JSONObject data)
	{
		try
		{
			if (this.disneyIDeEventDelegates.ContainsKey(dEvent))
			{
				for (int i = 0; i < this.disneyIDeEventDelegates[dEvent].Count; i++)
				{
					this.disneyIDeEventDelegates[dEvent][i](data);
				}
			}
		}
		catch (Exception ex)
		{
			globals.debug("probably a bad callback: " + ex.ToString());
		}
	}

	// Token: 0x06001091 RID: 4241 RVA: 0x00075E80 File Offset: 0x00074080
	public void onLogOutSuccess(string jsonData)
	{
		globals.debug("onLogOutSuccess Data received: " + jsonData);
		try
		{
			if (this.safeToSkip)
			{
				globals.debug("onLogOutSuccess going to login FTUE state ");
				globals.FTUE_manager.set_state("login", false);
				this.safeToSkip = false;
			}
		}
		catch (Exception ex)
		{
			globals.debug("onLogOutSuccess exception: " + ex.ToString());
		}
	}

	// Token: 0x06001092 RID: 4242 RVA: 0x00075F08 File Offset: 0x00074108
	public void onDisneyIdUIClose(string jsonData = "")
	{
		if (this.login_main && this.safeToSkip)
		{
			this.login_main.load_skip_scene();
			this.safeToSkip = false;
		}
	}

	// Token: 0x06001093 RID: 4243 RVA: 0x00075F38 File Offset: 0x00074138
	public void onInternetDown()
	{
		globals.show_no_internet_alert(null);
	}

	// Token: 0x040010DB RID: 4315
	private static string stagingID = "DCP-PLAYMATION.AVENGERS.IOS";

	// Token: 0x040010DC RID: 4316
	private static string productionID = "DCP-PLAYMATION.AVENGERS.IOS";

	// Token: 0x040010DD RID: 4317
	public country_enum country;

	// Token: 0x040010DE RID: 4318
	public languageSelection_enum languageSelection;

	// Token: 0x040010DF RID: 4319
	public bool javascriptDebugState = true;

	// Token: 0x040010E0 RID: 4320
	public bool disneyHybridLoginEnable = true;

	// Token: 0x040010E1 RID: 4321
	private bool isConfigured;

	// Token: 0x040010E2 RID: 4322
	internal LoginMainBehavior login_main;

	// Token: 0x040010E3 RID: 4323
	private Dictionary<DisneyIDManager.DisneyIDeEvent, List<DisneyIDManager.DataReceivedDelegate>> disneyIDeEventDelegates = new Dictionary<DisneyIDManager.DisneyIDeEvent, List<DisneyIDManager.DataReceivedDelegate>>();

	// Token: 0x040010E4 RID: 4324
	private bool safeToSkip;

	// Token: 0x02000262 RID: 610
	public enum DisneyIDeEvent
	{
		// Token: 0x040010E7 RID: 4327
		LOGIN_SUCCESS,
		// Token: 0x040010E8 RID: 4328
		REGISTRATIO_SUCCESS
	}

	// Token: 0x02000365 RID: 869
	// (Invoke) Token: 0x060015B6 RID: 5558
	public delegate void DataReceivedDelegate(JSONObject data);
}
