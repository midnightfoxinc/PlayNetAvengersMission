using System;
using System.Collections;
using System.Collections.Generic;
using emcore.GameData;
using UnityEngine;

// Token: 0x020001D0 RID: 464
public class NetworkManagerBehavior : MonoBehaviour
{
	// Token: 0x170001C9 RID: 457
	// (get) Token: 0x06000DB5 RID: 3509 RVA: 0x000621A8 File Offset: 0x000603A8
	public string server
	{
		get
		{
			return (!globals.environment_manager.isProd) ? this.staging_server : this.production_server;
		}
	}

	// Token: 0x170001CA RID: 458
	// (get) Token: 0x06000DB6 RID: 3510 RVA: 0x000621D8 File Offset: 0x000603D8
	public string webApiBase
	{
		get
		{
			return "https://" + this.server + this.webApiDirectory;
		}
	}

	// Token: 0x170001CB RID: 459
	// (get) Token: 0x06000DB7 RID: 3511 RVA: 0x000621F0 File Offset: 0x000603F0
	public string RTOBase
	{
		get
		{
			return "https://" + this.server + this.RTODirectory;
		}
	}

	// Token: 0x170001CC RID: 460
	// (get) Token: 0x06000DB8 RID: 3512 RVA: 0x00062208 File Offset: 0x00060408
	public string validateReceiptURL
	{
		get
		{
			return this.androidReceiptURL;
		}
	}

	// Token: 0x06000DB9 RID: 3513 RVA: 0x00062210 File Offset: 0x00060410
	private void Awake()
	{
		TextAsset textAsset = Resources.Load<TextAsset>("secrets/cellophaneAuthProd");
		if (textAsset == null || textAsset.text == string.Empty)
		{
			globals.debugError("cellophane Token is missing.");
		}
		this.mWebHandler = WebHandler.getInstance();
		this.mWebHandler.setHttpBase(this.webApiBase);
		this.mWebHandler.setCellophane(textAsset.text);
		globals.debug("authKey.text = " + textAsset.text);
		if (globals.environment_manager.log_SDK)
		{
			NativeManager.getNative().enable_unity_logging();
		}
	}

	// Token: 0x06000DBA RID: 3514 RVA: 0x000622B0 File Offset: 0x000604B0
	private void Start()
	{
		NativeManager.getNative().getBuildNumber(base.name);
	}

	// Token: 0x06000DBB RID: 3515 RVA: 0x000622C4 File Offset: 0x000604C4
	public void Register(bool child, string username, string password, string birthday, string parent_email, string display_name, string first_name, string last_name, gender_enum gender, PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
		JSONObject jsonobject2 = new JSONObject(JSONObject.Type.OBJECT);
		JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
		jsonobject3.AddField("proposedDisplayName", display_name);
		jsonobject.AddField("profile", jsonobject2);
		jsonobject2.AddField("username", username);
		jsonobject2.AddField("password", password);
		jsonobject2.AddField("displayName", jsonobject3);
		jsonobject2.AddField("firstName", first_name);
		if (child)
		{
			jsonobject2.AddField("parentEmail", parent_email);
		}
		else
		{
			jsonobject2.AddField("email", username);
			jsonobject2.AddField("lastName", last_name);
		}
		jsonobject2.AddField("dateOfBirth", birthday);
		jsonobject2.AddField("gender", (int)gender);
		string text = jsonobject.Print(false);
		password = string.Empty;
		globals.debug(text);
		base.StartCoroutine(WebHandler.instance.httpPostJson(this.registerUrl, text, delegate(JSONObject jsonResponse)
		{
			globals.debug("Login success");
			PlayerData playerData2 = new PlayerData();
			playerData2.fromJson(jsonResponse);
			if (!playerData.isGuestLogin() && !playerData2.id.Equals(playerData.id))
			{
				globals.logout();
			}
			playerData.mPlayerState = PlayerState.LoggedIn;
			playerData.reconcileFromWeb(playerData2, true);
			globals.BLE_manager.loginWithAccessToken(WebHandler.instance.token, WebHandler.instance.cellophaneKey);
			success(jsonResponse);
		}, error, false, false));
	}

	// Token: 0x06000DBC RID: 3516 RVA: 0x000623D4 File Offset: 0x000605D4
	public void Login(string username, string password, PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
		jsonobject.AddField("username", username);
		jsonobject.AddField("password", password);
		string jsonString = jsonobject.Print(false);
		password = string.Empty;
		globals.debug("loginUrl" + this.loginUrl);
		base.StartCoroutine(WebHandler.instance.httpPostJson(this.loginUrl, jsonString, delegate(JSONObject jsonResponse)
		{
			globals.debug("Login success" + jsonResponse);
			PlayerData playerData2 = new PlayerData();
			playerData2.fromJson(jsonResponse);
			if (!playerData.isGuestLogin() && !playerData2.id.Equals(playerData.id))
			{
				globals.logout();
			}
			playerData.mPlayerState = PlayerState.LoggedIn;
			playerData.reconcileFromWeb(playerData2, true);
			globals.BLE_manager.loginWithAccessToken(WebHandler.instance.token, WebHandler.instance.cellophaneKey);
			success(jsonResponse);
		}, error, false, false));
	}

	// Token: 0x06000DBD RID: 3517 RVA: 0x00062464 File Offset: 0x00060664
	public void DisIDLogin(string accessToekn, PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
		string jsonString = jsonobject.Print(false);
		base.StartCoroutine(WebHandler.instance.httpPostJson(this.userLogin, jsonString, delegate(JSONObject jsonResponse)
		{
			PlayerData playerData2 = new PlayerData();
			if (jsonResponse.HasField("accessToken"))
			{
				if (string.IsNullOrEmpty(jsonResponse["accessToken"].str) || jsonResponse["accessToken"].str == "null")
				{
					jsonResponse.SetField("accessToken", JSONObject.StringObject(WebHandler.instance.token));
				}
			}
			else
			{
				jsonResponse.AddField("accessToken", WebHandler.instance.token);
			}
			playerData2.fromJson(jsonResponse);
			if (!playerData.isGuestLogin() && !playerData2.id.Equals(playerData.id))
			{
				globals.logout();
			}
			playerData.mPlayerState = PlayerState.LoggedIn;
			playerData.reconcileFromWeb(playerData2, true);
			globals.BLE_manager.loginWithAccessToken(WebHandler.instance.token, WebHandler.instance.cellophaneKey);
			success(jsonResponse);
		}, delegate(string errUrl, string errTxt)
		{
			if (!string.IsNullOrEmpty(errTxt) && errTxt.ToUpper().StartsWith("401 UNAUTH"))
			{
				playerData.logout();
			}
			error(errUrl, errTxt);
		}, false, false));
	}

	// Token: 0x06000DBE RID: 3518 RVA: 0x000624D0 File Offset: 0x000606D0
	public void RenewToken(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
		jsonobject.AddField("action", "tokenLogin");
		JSONObject jsonobject2 = new JSONObject(JSONObject.Type.OBJECT);
		jsonobject.AddField("tokenObj", jsonobject2);
		jsonobject2.AddField("access_token", this.mWebHandler.token);
		string jsonString = jsonobject.Print(false);
		base.StartCoroutine(WebHandler.instance.httpPostJson(this.loginUrl, jsonString, delegate(JSONObject jsonResponse)
		{
			globals.debug("Renew success");
			globals.BLE_manager.loginWithAccessToken(WebHandler.instance.token, WebHandler.instance.cellophaneKey);
			success(jsonResponse);
		}, delegate(string errUrl, string errTxt)
		{
			if (!string.IsNullOrEmpty(errTxt))
			{
				globals.debugWarning("RenewToken error: " + errTxt + " | Are you missing your cellophane tokens?");
				if (errTxt.Length >= 3 && errTxt.StartsWith("401"))
				{
					playerData.logout();
				}
			}
			error(errUrl, errTxt);
		}, false, false));
	}

	// Token: 0x06000DBF RID: 3519 RVA: 0x00062574 File Offset: 0x00060774
	public void FetchWebPlayerData(string url, PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		globals.debug("In FetchWebPlayerData");
		if (WebHandler.instance == null)
		{
			globals.debug("is null");
		}
		base.StartCoroutine(WebHandler.instance.httpGetRequest(url, delegate(JSONObject jsonResponse)
		{
			globals.debug("PLAYER DATA" + jsonResponse);
			string id = globals.player_data.id;
			string aToken = globals.player_data.aToken;
			PlayerData playerData2 = new PlayerData();
			if (!jsonResponse.HasField("playerData"))
			{
				JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject.AddField("playerData", jsonResponse);
				playerData2.fromJson(jsonobject);
			}
			else
			{
				playerData2.fromJson(jsonResponse);
			}
			if (!jsonResponse.HasField("id"))
			{
				playerData2.id = id;
			}
			if (!jsonResponse.HasField("accessToken"))
			{
				playerData2.aToken = aToken;
			}
			playerData.reconcileFromWeb(playerData2, globals.player_data.isAuthenticated());
			globals.debug(string.Concat(new string[]
			{
				globals.player_data.id,
				":",
				globals.player_data.aToken,
				":",
				globals.player_data.rToken
			}));
			success(jsonResponse);
		}, delegate(string errUrl, string errTxt)
		{
			if (string.IsNullOrEmpty(errTxt) && errTxt.ToUpper().StartsWith("401 UNAUTH"))
			{
				playerData.logout();
			}
			error(errUrl, errTxt);
		}, DateTime.FromOADate(0.0), true, string.Empty));
	}

	// Token: 0x06000DC0 RID: 3520 RVA: 0x000625FC File Offset: 0x000607FC
	public void ValidateReceipt(string product_id, string receipt, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate failure)
	{
		JSONObject jsonobject = new JSONObject();
		jsonobject.AddField("receipt", receipt);
		jsonobject.AddField("productId", product_id);
		jsonobject.AddField("appId", Application.bundleIdentifier);
		jsonobject.AddField("platform", "googlePlayV3");
		base.StartCoroutine(WebHandler.instance.httpPostJson(this.validateReceiptURL, jsonobject.ToString(), success, failure, false, false));
	}

	// Token: 0x06000DC1 RID: 3521 RVA: 0x0006266C File Offset: 0x0006086C
	public void FetchPlayerData(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		globals.debug("In FetchPlayerData");
		this.FetchWebPlayerData(this.dataUrl, playerData, success, error);
	}

	// Token: 0x06000DC2 RID: 3522 RVA: 0x00062688 File Offset: 0x00060888
	public void FetchPlayerSocialData(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		this.FetchWebPlayerData(this.dataUrl, playerData, success, error);
	}

	// Token: 0x06000DC3 RID: 3523 RVA: 0x0006269C File Offset: 0x0006089C
	public void FetchNews(WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
	}

	// Token: 0x06000DC4 RID: 3524 RVA: 0x000626A0 File Offset: 0x000608A0
	public void FetchCurrentAppVersion(WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		base.StartCoroutine(WebHandler.instance.httpGetRequest(this.currentVersionURL, delegate(JSONObject jsonResponse)
		{
			success(jsonResponse);
		}, error, DateTime.FromOADate(0.0), true, string.Empty));
	}

	// Token: 0x06000DC5 RID: 3525 RVA: 0x000626F4 File Offset: 0x000608F4
	public void SetPlayerData(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		JSONObject jsonobject = playerData.toJson();
		string text = jsonobject["playerData"].Print(false);
		globals.debug("playerdata to save" + text);
		base.StartCoroutine(WebHandler.instance.httpPostJson(this.dataUrl, text, delegate(JSONObject jsonResponse)
		{
			globals.debug("Set player data success");
			success(jsonResponse);
		}, delegate(string errUrl, string errTxt)
		{
			if (string.IsNullOrEmpty(errTxt) && errTxt.ToUpper().StartsWith("401 UNAUTH"))
			{
				playerData.logout();
			}
			error(errUrl, errTxt);
		}, true, false));
	}

	// Token: 0x06000DC6 RID: 3526 RVA: 0x0006277C File Offset: 0x0006097C
	public void RegisterDevice(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
	}

	// Token: 0x06000DC7 RID: 3527 RVA: 0x00062780 File Offset: 0x00060980
	public void FetchDeviceInfo(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
	}

	// Token: 0x06000DC8 RID: 3528 RVA: 0x00062784 File Offset: 0x00060984
	public void AddFriend(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
	}

	// Token: 0x06000DC9 RID: 3529 RVA: 0x00062788 File Offset: 0x00060988
	public void FetchFriendList(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
	}

	// Token: 0x06000DCA RID: 3530 RVA: 0x0006278C File Offset: 0x0006098C
	public void FetchFriendDetail(string friendId, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
	}

	// Token: 0x06000DCB RID: 3531 RVA: 0x00062790 File Offset: 0x00060990
	public void FetchLeaderboard(string leaderBoardId, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
	}

	// Token: 0x06000DCC RID: 3532 RVA: 0x00062794 File Offset: 0x00060994
	public void PostPlayResult(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
	}

	// Token: 0x06000DCD RID: 3533 RVA: 0x00062798 File Offset: 0x00060998
	public void PostAnalytics(string analyticsData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		globals.debug("Analytics upload");
		base.StartCoroutine(WebHandler.instance.httpPostJson(this.analyticsUrl, analyticsData, delegate(JSONObject jsonResponse)
		{
			globals.debug("Analytics post success");
			success(jsonResponse);
		}, error, true, false));
	}

	// Token: 0x06000DCE RID: 3534 RVA: 0x000627E4 File Offset: 0x000609E4
	public void PostAnalyticsZlib(byte[] analyticsData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		globals.debug("Analytics upload - zlib not yet supported");
	}

	// Token: 0x06000DCF RID: 3535 RVA: 0x000627F0 File Offset: 0x000609F0
	public void SetDisplayName(PlayerData playerData, string desiredName, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		JSONObject jsonobject = new JSONObject();
		JSONObject jsonobject2 = new JSONObject();
		JSONObject jsonobject3 = new JSONObject();
		JSONObject jsonobject4 = new JSONObject();
		jsonobject.AddField("tokenObj", jsonobject2);
		jsonobject.AddField("updateFields", jsonobject3);
		jsonobject3.AddField("displayName", jsonobject4);
		jsonobject4.AddField("proposedDisplayName", desiredName);
		jsonobject2.AddField("access_token", this.mWebHandler.token);
		string text = jsonobject.Print(false);
		globals.debug(text);
		base.StartCoroutine(WebHandler.instance.httpPostJson(this.displayNameUrl, text, delegate(JSONObject jsonResponse)
		{
			globals.debug("Set player data success");
			success(jsonResponse);
		}, error, false, false));
	}

	// Token: 0x06000DD0 RID: 3536 RVA: 0x000628A4 File Offset: 0x00060AA4
	private void preloadLogin()
	{
		this.mGameData = GameData.getInstance();
		this.mPlayerData = globals.player_data;
		this.mPlayerData.readData();
		base.StartCoroutine(this.refreshFromNet());
	}

	// Token: 0x06000DD1 RID: 3537 RVA: 0x000628E0 File Offset: 0x00060AE0
	public IEnumerator refreshFromNet()
	{
		yield return new WaitForSeconds(5f);
		for (;;)
		{
			bool doit = true;
			while (doit)
			{
				globals.debug("FETCHING FROM NET");
				if (WebHandler.instance == null)
				{
					globals.debug("It is null");
				}
				if (this.mPlayerData.isAuthenticated())
				{
					if (Application.internetReachability == null)
					{
						break;
					}
					this.callCompeteFlag = false;
					globals.debug("Renewing Token:");
					globals.network_manager.RenewToken(this.mPlayerData, delegate(JSONObject jsonResponse)
					{
						this.callCompeteFlag = true;
					}, new WebHandler.HttpErrorDelegate(this.GeneralFetchError));
					while (!this.callCompeteFlag)
					{
						yield return new WaitForSeconds(1f);
					}
				}
				if (this.mPlayerData.isAuthenticated())
				{
					if (Application.internetReachability == null)
					{
						break;
					}
					this.callCompeteFlag = false;
					globals.network_manager.FetchPlayerData(this.mPlayerData, delegate(JSONObject jsonResponse)
					{
						this.callCompeteFlag = true;
					}, new WebHandler.HttpErrorDelegate(this.GeneralFetchError));
					while (!this.callCompeteFlag)
					{
						yield return new WaitForSeconds(1f);
					}
					if (Application.internetReachability == null)
					{
						break;
					}
					this.callCompeteFlag = false;
					globals.network_manager.SetPlayerData(this.mPlayerData, delegate(JSONObject jsonResponse)
					{
						this.callCompeteFlag = true;
					}, new WebHandler.HttpErrorDelegate(this.GeneralFetchError));
					while (!this.callCompeteFlag)
					{
						yield return new WaitForSeconds(1f);
					}
				}
				else if (!this.mPlayerData.isGuestLogin())
				{
				}
				bool breakOut = false;
				Dictionary<string, DateTime> fileStamps = new Dictionary<string, DateTime>(this.mGameData.fileTimeStamps);
				foreach (KeyValuePair<string, DateTime> kvp in fileStamps)
				{
					if (Application.internetReachability == null)
					{
						breakOut = true;
						break;
					}
					if (!(kvp.Key != "abilities") || !(kvp.Key != "environments") || !(kvp.Key != "missions"))
					{
						base.StartCoroutine(WebHandler.instance.httpGetRequest("cms/" + kvp.Key + "info", delegate(JSONObject jsonResponse)
						{
							try
							{
								if (jsonResponse != null)
								{
									string key = kvp.Key;
									if (key != null)
									{
										if (NetworkManagerBehavior.<>f__switch$mapA == null)
										{
											Dictionary<string, int> dictionary = new Dictionary<string, int>(10);
											dictionary.Add("abilities", 0);
											dictionary.Add("campaigns", 1);
											dictionary.Add("characters", 2);
											dictionary.Add("devices", 3);
											dictionary.Add("environments", 4);
											dictionary.Add("ingredients", 5);
											dictionary.Add("missions", 6);
											dictionary.Add("news", 7);
											dictionary.Add("player_rank", 8);
											dictionary.Add("upgrades", 9);
											NetworkManagerBehavior.<>f__switch$mapA = dictionary;
										}
										int num;
										if (NetworkManagerBehavior.<>f__switch$mapA.TryGetValue(key, ref num))
										{
											switch (num)
											{
											case 0:
												this.mGameData.abilities = Ability.fromJSON(jsonResponse);
												break;
											case 1:
												this.mGameData.campaigns = Campaign.fromJSON(jsonResponse);
												break;
											case 2:
												this.mGameData.characters = Character.fromJSON(jsonResponse);
												break;
											case 3:
												this.mGameData.devices = Device.fromJSON(jsonResponse);
												break;
											case 4:
												this.mGameData.environments = Environment.fromJSON(jsonResponse);
												break;
											case 5:
												this.mGameData.ingredients = Ingredient.fromJSON(jsonResponse);
												break;
											case 6:
												this.mGameData.missions = Mission.fromJSON(jsonResponse);
												break;
											case 7:
												this.mGameData.news = News.fromJSON(jsonResponse);
												break;
											case 8:
												this.mGameData.playerRanks = PlayerRank.fromJSON(jsonResponse);
												break;
											case 9:
												this.mGameData.upgrades = Upgrade.fromJSON(jsonResponse);
												break;
											}
										}
									}
									this.mGameData.saveToStorage(kvp.Key, jsonResponse, false);
								}
							}
							catch (Exception log)
							{
								globals.debugException(log);
							}
						}, new WebHandler.HttpErrorDelegate(this.GeneralFetchError), kvp.Value, false, string.Empty));
						yield return new WaitForSeconds(30f);
					}
				}
				if (breakOut)
				{
					break;
				}
				yield return new WaitForSeconds(3600f);
			}
			do
			{
				yield return new WaitForSeconds(60f);
			}
			while (Application.internetReachability == null);
		}
		yield break;
	}

	// Token: 0x06000DD2 RID: 3538 RVA: 0x000628FC File Offset: 0x00060AFC
	public void FetchHasNewFirmware(int deviceId, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		base.StartCoroutine(WebHandler.instance.httpGetRequest(this.hasNewFirmwareURL + deviceId.ToString(), delegate(JSONObject jsonResponse)
		{
			success(jsonResponse);
		}, error, DateTime.FromOADate(0.0), false, this.RTOBase));
	}

	// Token: 0x06000DD3 RID: 3539 RVA: 0x0006295C File Offset: 0x00060B5C
	public void FetchHasNewFirmwareEntitled(int deviceId, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		base.StartCoroutine(WebHandler.instance.httpGetRequest(this.hasNewFirmwareEntitledURL + deviceId.ToString(), delegate(JSONObject jsonResponse)
		{
			success(jsonResponse);
		}, error, DateTime.FromOADate(0.0), false, this.RTOBase));
	}

	// Token: 0x06000DD4 RID: 3540 RVA: 0x000629BC File Offset: 0x00060BBC
	public void FetchDeviceInfoAll(PlayerData playerData, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate error)
	{
		base.StartCoroutine(WebHandler.instance.httpGetRequest(this.deviceInfoAll, delegate(JSONObject jsonResponse)
		{
			success(jsonResponse);
			playerData.OnDeviceInfoAll(jsonResponse);
		}, error, DateTime.FromOADate(0.0), false, string.Empty));
	}

	// Token: 0x06000DD5 RID: 3541 RVA: 0x00062A18 File Offset: 0x00060C18
	public void GeneralFetchError(string url, string err)
	{
		globals.debug(url + ":" + err);
		this.callCompeteFlag = true;
	}

	// Token: 0x06000DD6 RID: 3542 RVA: 0x00062A34 File Offset: 0x00060C34
	public void updatePlayerData(PlayerData mPlayerData)
	{
		globals.network_manager.SetPlayerData(mPlayerData, delegate(JSONObject jsonResponse)
		{
			this.callCompeteFlag = true;
		}, new WebHandler.HttpErrorDelegate(this.GeneralFetchError));
	}

	// Token: 0x06000DD7 RID: 3543 RVA: 0x00062A5C File Offset: 0x00060C5C
	public bool connected()
	{
		return Application.internetReachability != 0;
	}

	// Token: 0x04000D6F RID: 3439
	private const float kNETWORK_FILE_FETCH_WAIT = 30f;

	// Token: 0x04000D70 RID: 3440
	public string production_server;

	// Token: 0x04000D71 RID: 3441
	public string staging_server;

	// Token: 0x04000D72 RID: 3442
	public string webApiDirectory;

	// Token: 0x04000D73 RID: 3443
	public string RTODirectory;

	// Token: 0x04000D74 RID: 3444
	public string registerUrl = "register/player";

	// Token: 0x04000D75 RID: 3445
	public string loginUrl = "login";

	// Token: 0x04000D76 RID: 3446
	public string displayNameUrl = "register/displayname";

	// Token: 0x04000D77 RID: 3447
	public string dataUrl = "players/data";

	// Token: 0x04000D78 RID: 3448
	public string analyticsUrl = "logEvent";

	// Token: 0x04000D79 RID: 3449
	public string hasNewFirmwareURL = "experience/hasNewFirmware/";

	// Token: 0x04000D7A RID: 3450
	public string hasNewFirmwareEntitledURL = "experience/getNewFirmwareMetadata/";

	// Token: 0x04000D7B RID: 3451
	public string entitlementPostURL = "heartbeat/entitlements/";

	// Token: 0x04000D7C RID: 3452
	public string userLogin = "user/login";

	// Token: 0x04000D7D RID: 3453
	public string iOSReceiptURL = "iap/platform/apple/verifyReceipt";

	// Token: 0x04000D7E RID: 3454
	public string androidReceiptURL = "iap/platform/android/verifyReceipt";

	// Token: 0x04000D7F RID: 3455
	public string currentVersionURL = "cms/PlaymationAppVersion";

	// Token: 0x04000D80 RID: 3456
	public string deviceInfoAll = "deviceinfo/all";

	// Token: 0x04000D81 RID: 3457
	private WebHandler mWebHandler;

	// Token: 0x04000D82 RID: 3458
	private GameData mGameData;

	// Token: 0x04000D83 RID: 3459
	private PlayerData mPlayerData;

	// Token: 0x04000D84 RID: 3460
	private bool callCompeteFlag;
}
