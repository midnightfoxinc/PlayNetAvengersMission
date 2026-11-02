using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Text;
using JsonFx.Json;
using UnityEngine;

// Token: 0x02000013 RID: 19
[ExecuteInEditMode]
public class Kochava : MonoBehaviour
{
	// Token: 0x17000017 RID: 23
	// (get) Token: 0x0600013A RID: 314 RVA: 0x00004E2C File Offset: 0x0000302C
	// (set) Token: 0x0600013B RID: 315 RVA: 0x00004E38 File Offset: 0x00003038
	public static bool DebugMode
	{
		get
		{
			return Kochava._S.debugMode;
		}
		set
		{
			Kochava._S.debugMode = value;
		}
	}

	// Token: 0x17000018 RID: 24
	// (get) Token: 0x0600013C RID: 316 RVA: 0x00004E48 File Offset: 0x00003048
	// (set) Token: 0x0600013D RID: 317 RVA: 0x00004E54 File Offset: 0x00003054
	public static bool IncognitoMode
	{
		get
		{
			return Kochava._S.incognitoMode;
		}
		set
		{
			Kochava._S.incognitoMode = value;
		}
	}

	// Token: 0x17000019 RID: 25
	// (get) Token: 0x0600013E RID: 318 RVA: 0x00004E64 File Offset: 0x00003064
	// (set) Token: 0x0600013F RID: 319 RVA: 0x00004E70 File Offset: 0x00003070
	public static bool RequestAttribution
	{
		get
		{
			return Kochava._S.requestAttribution;
		}
		set
		{
			Kochava._S.requestAttribution = value;
		}
	}

	// Token: 0x1700001A RID: 26
	// (get) Token: 0x06000140 RID: 320 RVA: 0x00004E80 File Offset: 0x00003080
	// (set) Token: 0x06000141 RID: 321 RVA: 0x00004E8C File Offset: 0x0000308C
	public static bool AppLimitAdTracking
	{
		get
		{
			return Kochava._S.appLimitAdTracking;
		}
		set
		{
			Kochava._S.appLimitAdTracking = value;
		}
	}

	// Token: 0x1700001B RID: 27
	// (get) Token: 0x06000142 RID: 322 RVA: 0x00004E9C File Offset: 0x0000309C
	// (set) Token: 0x06000143 RID: 323 RVA: 0x00004EA8 File Offset: 0x000030A8
	public static bool AdidSupressed
	{
		get
		{
			return Kochava._S.adidSupressed;
		}
		set
		{
			Kochava._S.adidSupressed = value;
		}
	}

	// Token: 0x06000144 RID: 324 RVA: 0x00004EB8 File Offset: 0x000030B8
	public static void SetAttributionCallback(Kochava.AttributionCallback callback)
	{
		Kochava.attributionCallback = callback;
	}

	// Token: 0x06000145 RID: 325 RVA: 0x00004EC0 File Offset: 0x000030C0
	public static void SetiBeaconCrossedCallback(Kochava.iBeaconCrossedCallback callback)
	{
		Kochava.iBeaconCallback = callback;
	}

	// Token: 0x1700001C RID: 28
	// (get) Token: 0x06000146 RID: 326 RVA: 0x00004EC8 File Offset: 0x000030C8
	// (set) Token: 0x06000147 RID: 327 RVA: 0x00004ED4 File Offset: 0x000030D4
	public static string AttributionDataStr
	{
		get
		{
			return Kochava._S.attributionDataStr;
		}
		set
		{
			Kochava._S.attributionDataStr = value;
		}
	}

	// Token: 0x1700001D RID: 29
	// (get) Token: 0x06000148 RID: 328 RVA: 0x00004EE4 File Offset: 0x000030E4
	// (set) Token: 0x06000149 RID: 329 RVA: 0x00004EF0 File Offset: 0x000030F0
	public static List<string> DevIdBlacklist
	{
		get
		{
			return Kochava._S.devIdBlacklist;
		}
		set
		{
			Kochava._S.devIdBlacklist = value;
		}
	}

	// Token: 0x1700001E RID: 30
	// (get) Token: 0x0600014A RID: 330 RVA: 0x00004F00 File Offset: 0x00003100
	// (set) Token: 0x0600014B RID: 331 RVA: 0x00004F0C File Offset: 0x0000310C
	public static List<string> EventNameBlacklist
	{
		get
		{
			return Kochava._S.eventNameBlacklist;
		}
		set
		{
			Kochava._S.eventNameBlacklist = value;
		}
	}

	// Token: 0x1700001F RID: 31
	// (get) Token: 0x0600014C RID: 332 RVA: 0x00004F1C File Offset: 0x0000311C
	// (set) Token: 0x0600014D RID: 333 RVA: 0x00004F28 File Offset: 0x00003128
	public static Kochava.KochSessionTracking SessionTracking
	{
		get
		{
			return Kochava._S.sessionTracking;
		}
		set
		{
			Kochava._S.sessionTracking = value;
		}
	}

	// Token: 0x17000020 RID: 32
	// (get) Token: 0x0600014E RID: 334 RVA: 0x00004F38 File Offset: 0x00003138
	public static List<Kochava.LogEvent> EventLog
	{
		get
		{
			return Kochava._S._EventLog;
		}
	}

	// Token: 0x17000021 RID: 33
	// (get) Token: 0x0600014F RID: 335 RVA: 0x00004F44 File Offset: 0x00003144
	public static int eventQueueLength
	{
		get
		{
			return Kochava._S.eventQueue.Count;
		}
	}

	// Token: 0x17000022 RID: 34
	// (get) Token: 0x06000150 RID: 336 RVA: 0x00004F58 File Offset: 0x00003158
	public static float eventPostingTime
	{
		get
		{
			return Kochava._S._eventPostingTime;
		}
	}

	// Token: 0x06000151 RID: 337 RVA: 0x00004F64 File Offset: 0x00003164
	public void Awake()
	{
		if (!Application.isPlaying)
		{
			return;
		}
		if (Kochava._S)
		{
			this.Log("detected two concurrent integration objects - please place your integration object in a scene which will not be reloaded.");
			Object.Destroy(base.gameObject);
			return;
		}
		Object.DontDestroyOnLoad(base.gameObject);
		base.gameObject.name = "_Kochava Analytics";
		this.Log("Kochava SDK Initialized.\nVersion: 20150311\nProtocol Version: 3", Kochava.KochLogLevel.debug);
		if (this.kochavaAppId.Length == 0 && this.kochavaAppIdIOS.Length == 0 && this.kochavaAppIdAndroid.Length == 0 && this.kochavaAppIdKindle.Length == 0 && this.kochavaAppIdBlackberry.Length == 0 && this.kochavaAppIdWindowsPhone.Length == 0 && this.partnerName.Length == 0)
		{
			this.Log("No Kochava App Id or Partner Name - SDK will terminate");
			Object.Destroy(base.gameObject);
		}
		this.loadQueue();
	}

	// Token: 0x06000152 RID: 338 RVA: 0x00005058 File Offset: 0x00003258
	public void Start()
	{
		if (!Application.isPlaying)
		{
			return;
		}
		this.Init();
	}

	// Token: 0x06000153 RID: 339 RVA: 0x0000506C File Offset: 0x0000326C
	public void OnEnable()
	{
		if (!Application.isPlaying)
		{
			return;
		}
		Kochava._S = this;
	}

	// Token: 0x06000154 RID: 340 RVA: 0x00005080 File Offset: 0x00003280
	private void Init()
	{
		try
		{
			try
			{
				AndroidJNIHelper.debug = true;
				using (AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
				{
					AndroidJavaObject @static = androidJavaClass.GetStatic<AndroidJavaObject>("currentActivity");
					AndroidJavaObject androidJavaObject = @static.Call<AndroidJavaObject>("getApplicationContext", new object[0]);
					AndroidJavaClass androidJavaClass2 = new AndroidJavaClass("com.kochava.android.tracker.lite.KochavaSDKLite");
					string text = androidJavaClass2.CallStatic<string>("GetExternalKochavaDeviceIdentifiers_Android", new object[]
					{
						androidJavaObject,
						Kochava.AdidSupressed
					});
					this.Log("Hardware Integration Diagnostics: " + text);
					this.hardwareIdentifierData = JsonReader.Deserialize<Dictionary<string, object>>(text);
					this.Log(string.Concat(new object[]
					{
						"Received (",
						this.hardwareIdentifierData.Count,
						") parameters from Hardware Integration Library (identifiers): ",
						text
					}));
				}
			}
			catch (Exception ex)
			{
				this.Log("Failed GetExternalKochavaDeviceIdentifiers_Android: " + ex, Kochava.KochLogLevel.warning);
			}
			if (this.hardwareIdentifierData.ContainsKey("user_agent"))
			{
				this.userAgent = this.hardwareIdentifierData["user_agent"].ToString();
				this.Log("userAgent set to: " + this.userAgent, Kochava.KochLogLevel.debug);
			}
			if (this.userAgent.Contains("kindle") || this.userAgent.Contains("silk"))
			{
				this.appPlatform = "kindle";
				if (this.kochavaAppIdKindle != string.Empty)
				{
					this.kochavaAppId = this.kochavaAppIdKindle;
				}
			}
			else
			{
				this.appPlatform = "android";
				if (this.kochavaAppIdAndroid != string.Empty)
				{
					this.kochavaAppId = this.kochavaAppIdAndroid;
				}
			}
			if (PlayerPrefs.HasKey("kochava_app_id"))
			{
				this.kochavaAppId = PlayerPrefs.GetString("kochava_app_id");
				this.Log("Loaded kochava_app_id from persistent storage: " + this.kochavaAppId, Kochava.KochLogLevel.debug);
			}
			if (PlayerPrefs.HasKey("kochava_device_id"))
			{
				this.kochavaDeviceId = PlayerPrefs.GetString("kochava_device_id");
				this.Log("Loaded kochava_device_id from persistent storage: " + this.kochavaDeviceId, Kochava.KochLogLevel.debug);
			}
			else if (this.incognitoMode)
			{
				this.kochavaDeviceId = "KA" + Guid.NewGuid().ToString().Replace("-", string.Empty);
				this.Log("Using autogenerated \"incognito\" kochava_device_id: " + this.kochavaDeviceId, Kochava.KochLogLevel.debug);
			}
			else
			{
				string text2 = string.Empty;
				if (PlayerPrefs.HasKey("data_orig_kochava_device_id"))
				{
					text2 = PlayerPrefs.GetString("data_orig_kochava_device_id");
				}
				if (text2 != string.Empty)
				{
					this.kochavaDeviceId = text2;
					this.Log("Using \"orig\" kochava_device_id: " + this.kochavaDeviceId, Kochava.KochLogLevel.debug);
				}
				else if (this.hardwareIdentifierData.ContainsKey("kochava_device_id") && this.hardwareIdentifierData["kochava_device_id"].ToString().Length > 3)
				{
					this.kochavaDeviceId = this.hardwareIdentifierData["kochava_device_id"].ToString();
					this.Log("Using \"hardware integration\" kochava_device_id: " + this.kochavaDeviceId, Kochava.KochLogLevel.debug);
				}
				else
				{
					this.kochavaDeviceId = "KU" + Guid.NewGuid().ToString().Replace("-", string.Empty);
					this.Log("Using autogenerated kochava_device_id: " + this.kochavaDeviceId, Kochava.KochLogLevel.debug);
				}
			}
			if (!PlayerPrefs.HasKey("data_orig_kochava_app_id") && this.kochavaAppId != string.Empty)
			{
				PlayerPrefs.SetString("data_orig_kochava_app_id", this.kochavaAppId);
			}
			if (!PlayerPrefs.HasKey("data_orig_kochava_device_id") && this.kochavaDeviceId != string.Empty)
			{
				PlayerPrefs.SetString("data_orig_kochava_device_id", this.kochavaDeviceId);
			}
			if (!PlayerPrefs.HasKey("data_orig_session_tracking"))
			{
				PlayerPrefs.SetString("data_orig_session_tracking", this.sessionTracking.ToString());
			}
			if (!PlayerPrefs.HasKey("data_orig_currency") && this.appCurrency != string.Empty)
			{
				PlayerPrefs.SetString("data_orig_currency", this.appCurrency);
			}
			if (PlayerPrefs.HasKey("currency"))
			{
				this.appCurrency = PlayerPrefs.GetString("currency");
				this.Log("Loaded currency from persistent storage: " + this.appCurrency, Kochava.KochLogLevel.debug);
			}
			if (PlayerPrefs.HasKey("blacklist"))
			{
				try
				{
					string @string = PlayerPrefs.GetString("blacklist");
					this.devIdBlacklist = new List<string>();
					string[] array = JsonReader.Deserialize<string[]>(@string);
					for (int i = array.Length - 1; i >= 0; i--)
					{
						this.devIdBlacklist.Add(array[i]);
					}
					this.Log("Loaded device_id blacklist from persistent storage: " + @string, Kochava.KochLogLevel.debug);
				}
				catch (Exception ex2)
				{
					this.Log("Failed loading device_id blacklist from persistent storage: " + ex2, Kochava.KochLogLevel.warning);
				}
			}
			if (PlayerPrefs.HasKey("attribution"))
			{
				try
				{
					this.attributionDataStr = PlayerPrefs.GetString("attribution");
					this.Log("Loaded attribution data from persistent storage: " + this.attributionDataStr, Kochava.KochLogLevel.debug);
				}
				catch (Exception ex3)
				{
					this.Log("Failed loading attribution data from persistent storage: " + ex3, Kochava.KochLogLevel.warning);
				}
			}
			if (PlayerPrefs.HasKey("session_tracking"))
			{
				try
				{
					string string2 = PlayerPrefs.GetString("session_tracking");
					this.sessionTracking = (Kochava.KochSessionTracking)((int)Enum.Parse(typeof(Kochava.KochSessionTracking), string2, true));
					this.Log("Loaded session tracking mode from persistent storage: " + string2, Kochava.KochLogLevel.debug);
				}
				catch (Exception ex4)
				{
					this.Log("Failed loading session tracking mode from persistent storage: " + ex4, Kochava.KochLogLevel.warning);
				}
			}
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary.Add("partner_name", this.partnerName);
			dictionary.Add("package_name", this.appIdentifier);
			dictionary.Add("platform", this.appPlatform);
			dictionary.Add("session_tracking", this.sessionTracking.ToString());
			dictionary.Add("currency", this.appCurrency);
			dictionary.Add("os_version", SystemInfo.operatingSystem);
			Dictionary<string, object> dictionary2 = dictionary;
			if (this.requestAttribution && !PlayerPrefs.HasKey("attribution"))
			{
				this.retrieveAttribution = true;
			}
			this.Log("retrieve attrib: " + this.retrieveAttribution);
			if (this.hardwareIdentifierData.ContainsKey("IDFA"))
			{
				dictionary2.Add("idfa", this.hardwareIdentifierData["IDFA"]);
			}
			if (this.hardwareIdentifierData.ContainsKey("IDFV"))
			{
				dictionary2.Add("idfv", this.hardwareIdentifierData["IDFV"]);
			}
			dictionary = new Dictionary<string, object>();
			dictionary.Add("kochava_app_id", PlayerPrefs.GetString("data_orig_kochava_app_id"));
			dictionary.Add("kochava_device_id", PlayerPrefs.GetString("data_orig_kochava_device_id"));
			dictionary.Add("session_tracking", PlayerPrefs.GetString("data_orig_session_tracking"));
			dictionary.Add("currency", PlayerPrefs.GetString("data_orig_currency"));
			Dictionary<string, object> dictionary3 = dictionary;
			dictionary = new Dictionary<string, object>();
			dictionary.Add("action", "init");
			dictionary.Add("data", dictionary2);
			dictionary.Add("data_orig", dictionary3);
			dictionary.Add("kochava_app_id", this.kochavaAppId);
			dictionary.Add("kochava_device_id", this.kochavaDeviceId);
			dictionary.Add("sdk_version", "Unity3D-20150311");
			dictionary.Add("sdk_protocol", "3");
			Dictionary<string, object> dictionary4 = dictionary;
			base.StartCoroutine(this.Init_KV(JsonWriter.Serialize(dictionary4)));
		}
		catch (Exception ex5)
		{
			this.Log("Overall failure in init: " + ex5, Kochava.KochLogLevel.warning);
		}
	}

	// Token: 0x06000155 RID: 341 RVA: 0x0000591C File Offset: 0x00003B1C
	private IEnumerator Init_KV(string postData)
	{
		if (Application.internetReachability == null)
		{
			this.Log("internet not reachable", Kochava.KochLogLevel.warning);
			yield return new WaitForSeconds(30f);
			base.StartCoroutine(this.Init_KV(postData));
			yield return false;
		}
		else
		{
			this.Log("Initiating kvinit handshake...", Kochava.KochLogLevel.debug);
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			dictionary.Add("Content-Type", "application/xml");
			dictionary.Add("User-Agent", this.userAgent);
			Dictionary<string, string> headers = dictionary;
			this.Log(postData, Kochava.KochLogLevel.debug);
			float wwwLoadTime = Time.time;
			WWW www = new WWW("https://control.kochava.com/track/kvinit", Encoding.UTF8.GetBytes(postData), headers);
			yield return www;
			if (!string.IsNullOrEmpty(www.error))
			{
				this.Log(string.Concat(new object[]
				{
					"Kvinit handshake failed: ",
					www.error,
					", seconds: ",
					Time.time - wwwLoadTime,
					")"
				}), Kochava.KochLogLevel.warning);
				yield return new WaitForSeconds(30f);
				base.StartCoroutine(this.Init_KV(postData));
				yield return false;
			}
			Dictionary<string, object> serverResponse = new Dictionary<string, object>();
			if (www.text != string.Empty)
			{
				try
				{
					serverResponse = JsonReader.Deserialize<Dictionary<string, object>>(www.text);
				}
				catch (Exception ex)
				{
					Exception e = ex;
					this.Log("Failed Deserialize JSON response to kvinit: " + e, Kochava.KochLogLevel.warning);
				}
			}
			this.Log(www.text, Kochava.KochLogLevel.debug);
			if (!serverResponse.ContainsKey("success"))
			{
				this.Log("Kvinit handshake parsing failed: " + www.text, Kochava.KochLogLevel.warning);
				yield return new WaitForSeconds(30f);
				base.StartCoroutine(this.Init_KV(postData));
				yield return false;
			}
			else
			{
				this.Log("...kvinit handshake complete, processing response flags...", Kochava.KochLogLevel.debug);
				if (serverResponse.ContainsKey("flags"))
				{
					Dictionary<string, object> serverResponseFlags = (Dictionary<string, object>)serverResponse["flags"];
					if (serverResponseFlags.ContainsKey("kochava_app_id"))
					{
						this.kochavaAppId = serverResponseFlags["kochava_app_id"].ToString();
						PlayerPrefs.SetString("kochava_app_id", this.kochavaAppId);
						this.Log("Saved kochava_app_id to persistent storage: " + this.kochavaAppId, Kochava.KochLogLevel.debug);
					}
					if (serverResponseFlags.ContainsKey("kochava_device_id"))
					{
						this.kochavaDeviceId = serverResponseFlags["kochava_device_id"].ToString();
					}
					if (serverResponseFlags.ContainsKey("resend_initial") && (bool)serverResponseFlags["resend_initial"])
					{
						PlayerPrefs.DeleteKey("watchlistProperties");
						this.Log("Refiring initial event, as requested by kvinit response flag", Kochava.KochLogLevel.debug);
					}
					if (serverResponseFlags.ContainsKey("session_tracking"))
					{
						try
						{
							this.sessionTracking = (Kochava.KochSessionTracking)((int)Enum.Parse(typeof(Kochava.KochSessionTracking), serverResponseFlags["session_tracking"].ToString()));
							PlayerPrefs.SetString("session_tracking", this.sessionTracking.ToString());
							this.Log("Saved session_tracking mode to persistent storage: " + this.sessionTracking.ToString(), Kochava.KochLogLevel.debug);
						}
						catch (Exception ex2)
						{
							Exception e2 = ex2;
							this.Log("Failed System.Enum.Parse of KochSessionTracking: " + e2, Kochava.KochLogLevel.warning);
						}
					}
					if (serverResponseFlags.ContainsKey("currency"))
					{
						this.appCurrency = serverResponseFlags["currency"].ToString();
						PlayerPrefs.SetString("currency", this.appCurrency);
						this.Log("Saved currency to persistent storage: " + this.appCurrency, Kochava.KochLogLevel.debug);
					}
					if (!serverResponseFlags.ContainsKey("ibeacon_enabled") || serverResponseFlags["ibeacon_enabled"].ToString() == "1")
					{
					}
					if (serverResponseFlags.ContainsKey("delay_for_referrer_data"))
					{
						Kochava.device_id_delay = (int)serverResponseFlags["delay_for_referrer_data"];
						this.Log("delay_for_referrer_data received: " + Kochava.device_id_delay, Kochava.KochLogLevel.debug);
						if (Kochava.device_id_delay < 0)
						{
							this.Log("device_id_delay returned was less than 0 (" + Kochava.device_id_delay + "), setting device_id_delay to 0.");
							Kochava.device_id_delay = 0;
						}
						else if (Kochava.device_id_delay > 120)
						{
							this.Log("device_id_delay returned was greater than 120 (" + Kochava.device_id_delay + "), setting device_id_delay to 120.");
							Kochava.device_id_delay = 120;
						}
						else
						{
							this.Log("setting device_id_delay to: " + Kochava.device_id_delay);
						}
					}
				}
				if (serverResponse.ContainsKey("blacklist"))
				{
					this.devIdBlacklist = new List<string>();
					if (serverResponse["blacklist"].GetType().GetElementType() == typeof(string))
					{
						try
						{
							string[] devIdBlacklistArr = (string[])serverResponse["blacklist"];
							for (int i = devIdBlacklistArr.Length - 1; i >= 0; i--)
							{
								this.devIdBlacklist.Add(devIdBlacklistArr[i]);
								if (devIdBlacklistArr[i].ToLower().Equals("adid"))
								{
									Kochava.adidBlacklisted = true;
								}
							}
						}
						catch (Exception ex3)
						{
							Exception e3 = ex3;
							this.Log("Failed parsing device_identifier blacklist received from server: " + e3, Kochava.KochLogLevel.warning);
						}
					}
					try
					{
						string devIdBlacklistStr = JsonWriter.Serialize(this.devIdBlacklist);
						PlayerPrefs.SetString("blacklist", devIdBlacklistStr);
						this.Log(string.Concat(new object[]
						{
							"Saved device_identifier blacklist (",
							this.devIdBlacklist.Count,
							" elements) to persistent storage: ",
							devIdBlacklistStr
						}), Kochava.KochLogLevel.debug);
					}
					catch (Exception ex4)
					{
						Exception e4 = ex4;
						this.Log("Failed saving device_identifier blacklist to persistent storage: " + e4, Kochava.KochLogLevel.warning);
					}
				}
				if (serverResponse.ContainsKey("whitelist") && serverResponse["whitelist"].GetType().GetElementType() == typeof(string))
				{
					string result = "{";
					try
					{
						string[] devIdWhitelistArr = (string[])serverResponse["whitelist"];
						for (int j = devIdWhitelistArr.Length - 1; j >= 0; j--)
						{
							if (j != 0)
							{
								result = result + devIdWhitelistArr[j] + ",";
							}
							else
							{
								result += devIdWhitelistArr[j];
							}
						}
					}
					catch (Exception ex5)
					{
						Exception e5 = ex5;
						this.Log("Failed parsing device_identifier whitelist received from server: " + e5, Kochava.KochLogLevel.warning);
					}
					result += "}";
					this.Log("whitelist string: " + result);
					this.whitelist = result;
				}
				if (serverResponse.ContainsKey("eventname_blacklist"))
				{
					this.eventNameBlacklist = new List<string>();
					if (serverResponse["eventname_blacklist"].GetType().GetElementType() == typeof(string))
					{
						try
						{
							string[] eventNameBlacklistArr = (string[])serverResponse["eventname_blacklist"];
							for (int k = eventNameBlacklistArr.Length - 1; k >= 0; k--)
							{
								this.eventNameBlacklist.Add(eventNameBlacklistArr[k]);
							}
						}
						catch (Exception ex6)
						{
							Exception e6 = ex6;
							this.Log("Failed parsing eventname_blacklist received from server: " + e6, Kochava.KochLogLevel.warning);
						}
					}
				}
				Dictionary<string, object> dictionary2 = new Dictionary<string, object>();
				dictionary2.Add("kochava_app_id", this.kochavaAppId);
				dictionary2.Add("kochava_device_id", this.kochavaDeviceId);
				dictionary2.Add("sdk_version", "Unity3D-20150311");
				dictionary2.Add("sdk_protocol", "3");
				this.appData = dictionary2;
				PlayerPrefs.SetString("kochava_device_id", this.kochavaDeviceId);
				this.Log("Saved kochava_device_id to persistent storage: " + this.kochavaDeviceId, Kochava.KochLogLevel.debug);
				if (this.sessionTracking == Kochava.KochSessionTracking.full || this.sessionTracking == Kochava.KochSessionTracking.basic)
				{
					Kochava s = Kochava._S;
					string eventAction = "session";
					dictionary2 = new Dictionary<string, object>();
					dictionary2.Add("state", "launch");
					s._fireEvent(eventAction, dictionary2);
				}
				AndroidJNIHelper.debug = true;
				using (AndroidJavaClass androidUnityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
				{
					AndroidJavaObject androidActivity = androidUnityPlayer.GetStatic<AndroidJavaObject>("currentActivity");
					AndroidJavaObject androidContext = androidActivity.Call<AndroidJavaObject>("getApplicationContext", new object[0]);
					AndroidJavaClass androidHelperClass = new AndroidJavaClass("com.kochava.android.tracker.lite.KochavaSDKLite");
					androidHelperClass.CallStatic<string>("GetExternalKochavaInfo_Android", new object[]
					{
						androidContext,
						this.whitelist,
						Kochava.device_id_delay,
						Kochava.adidBlacklisted,
						Kochava.AdidSupressed
					});
				}
			}
		}
		yield break;
	}

	// Token: 0x06000156 RID: 342 RVA: 0x00005948 File Offset: 0x00003B48
	private void DeviceInformationCallback(string deviceInfo)
	{
		try
		{
			this.hardwareIntegrationData = JsonReader.Deserialize<Dictionary<string, object>>(deviceInfo);
			this.Log(string.Concat(new object[]
			{
				"Received (",
				this.hardwareIntegrationData.Count,
				") parameters from Hardware Integration Library (device info): ",
				deviceInfo
			}));
		}
		catch (Exception ex)
		{
			this.Log("Failed Deserialize hardwareIntegrationData: " + ex, Kochava.KochLogLevel.warning);
		}
		if (!PlayerPrefs.HasKey("watchlistProperties"))
		{
			this.initInitial();
		}
		else
		{
			this.ScanWatchlistChanges();
		}
	}

	// Token: 0x06000157 RID: 343 RVA: 0x000059F4 File Offset: 0x00003BF4
	public static void InitInitial()
	{
		Kochava._S.initInitial();
	}

	// Token: 0x06000158 RID: 344 RVA: 0x00005A00 File Offset: 0x00003C00
	private void initInitial()
	{
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		try
		{
			dictionary.Add("device", SystemInfo.deviceModel);
			if (this.hardwareIntegrationData.ContainsKey("package_name"))
			{
				dictionary.Add("package_name", this.hardwareIntegrationData["package_name"]);
			}
			else
			{
				dictionary.Add("package_name", this.appIdentifier);
			}
			if (this.hardwareIntegrationData.ContainsKey("app_version"))
			{
				dictionary.Add("app_version", this.hardwareIntegrationData["app_version"]);
			}
			else
			{
				dictionary.Add("app_version", this.appVersion);
			}
			if (this.hardwareIntegrationData.ContainsKey("app_short_string"))
			{
				dictionary.Add("app_short_string", this.hardwareIntegrationData["app_short_string"]);
			}
			else
			{
				dictionary.Add("app_short_string", this.appVersion);
			}
			dictionary.Add("currency", this.appCurrency);
			dictionary.Add("disp_h", Screen.height);
			dictionary.Add("disp_w", Screen.width);
			dictionary.Add("os_version", SystemInfo.operatingSystem);
			dictionary.Add("app_limit_tracking", this.appLimitAdTracking);
			if (!this.devIdBlacklist.Contains("hardware"))
			{
				dictionary.Add("device_processor", SystemInfo.processorType);
				dictionary.Add("device_cores", SystemInfo.processorCount);
				dictionary.Add("device_memory", SystemInfo.systemMemorySize);
				dictionary.Add("graphics_memory_size", SystemInfo.graphicsMemorySize);
				dictionary.Add("graphics_device_name", SystemInfo.graphicsDeviceName);
				dictionary.Add("graphics_device_vendor", SystemInfo.graphicsDeviceVendor);
				dictionary.Add("graphics_device_id", SystemInfo.graphicsDeviceID);
				dictionary.Add("graphics_device_vendor_id", SystemInfo.graphicsDeviceVendorID);
				dictionary.Add("graphics_device_version", SystemInfo.graphicsDeviceVersion);
				dictionary.Add("graphics_shader_level", SystemInfo.graphicsShaderLevel);
			}
			if (!this.devIdBlacklist.Contains("is_genuine") && Application.genuineCheckAvailable)
			{
				dictionary.Add("is_genuine", (!Application.genuine) ? "0" : "1");
			}
			if (!this.devIdBlacklist.Contains("idfa") && this.hardwareIntegrationData.ContainsKey("IDFA"))
			{
				dictionary.Add("idfa", this.hardwareIntegrationData["IDFA"]);
			}
			if (!this.devIdBlacklist.Contains("idfv") && this.hardwareIntegrationData.ContainsKey("IDFV"))
			{
				dictionary.Add("idfv", this.hardwareIntegrationData["IDFV"]);
			}
			if (!this.devIdBlacklist.Contains("udid") && this.hardwareIntegrationData.ContainsKey("UDID"))
			{
				dictionary.Add("udid", this.hardwareIntegrationData["UDID"]);
			}
			if (!this.devIdBlacklist.Contains("iad_attribution") && this.hardwareIntegrationData.ContainsKey("iad_attribution"))
			{
				dictionary.Add("iad_attribution", this.hardwareIntegrationData["iad_attribution"]);
			}
			if (!this.devIdBlacklist.Contains("app_purchase_date") && this.hardwareIntegrationData.ContainsKey("app_purchase_date"))
			{
				dictionary.Add("app_purchase_date", this.hardwareIntegrationData["app_purchase_date"]);
			}
			if (!this.devIdBlacklist.Contains("iad_impression_date") && this.hardwareIntegrationData.ContainsKey("iad_impression_date"))
			{
				dictionary.Add("iad_impression_date", this.hardwareIntegrationData["iad_impression_date"]);
			}
			if (!this.devIdBlacklist.Contains("guid"))
			{
				string text = Guid.NewGuid().ToString();
				if (text != string.Empty)
				{
					dictionary.Add("guid", text);
				}
			}
			if (!this.devIdBlacklist.Contains("android_id") && this.hardwareIntegrationData.ContainsKey("android_id"))
			{
				dictionary.Add("android_id", this.hardwareIntegrationData["android_id"]);
			}
			if (!this.devIdBlacklist.Contains("mac"))
			{
				if (this.appPlatform == "ios")
				{
					if (this.hardwareIntegrationData.ContainsKey("mac"))
					{
						dictionary.Add("mac", this.hardwareIntegrationData["mac"].ToString());
					}
				}
				else
				{
					string text2 = string.Empty;
					if (this.hardwareIntegrationData.ContainsKey("mac"))
					{
						text2 = this.hardwareIntegrationData["mac"].ToString();
					}
					if (text2 == string.Empty)
					{
						try
						{
							NetworkInterface[] allNetworkInterfaces = NetworkInterface.GetAllNetworkInterfaces();
							foreach (NetworkInterface networkInterface in allNetworkInterfaces)
							{
								text2 = networkInterface.GetPhysicalAddress().ToString();
								if (text2 != string.Empty)
								{
									break;
								}
							}
						}
						catch (Exception ex)
						{
							this.Log("Couldn't gather MAC address: " + ex, Kochava.KochLogLevel.warning);
						}
					}
					if (text2 != string.Empty)
					{
						dictionary.Add("mac", text2);
					}
				}
			}
			if (!this.devIdBlacklist.Contains("odin"))
			{
				string text3 = string.Empty;
				if (this.hardwareIntegrationData.ContainsKey("odin"))
				{
					text3 = this.hardwareIntegrationData["odin"].ToString();
				}
				if (text3 != string.Empty)
				{
					dictionary.Add("odin", text3);
				}
			}
			if (!this.devIdBlacklist.Contains("imei") && this.hardwareIntegrationData.ContainsKey("imei"))
			{
				dictionary.Add("imei", this.hardwareIntegrationData["imei"]);
			}
			if (!this.devIdBlacklist.Contains("adid") && this.hardwareIntegrationData.ContainsKey("adid"))
			{
				dictionary.Add("adid", this.hardwareIntegrationData["adid"]);
			}
			if (!this.devIdBlacklist.Contains("fb_attribution_id") && this.hardwareIntegrationData.ContainsKey("fb_attribution_id"))
			{
				dictionary.Add("fb_attribution_id", this.hardwareIntegrationData["fb_attribution_id"]);
			}
			if (this.hardwareIntegrationData.ContainsKey("device_limit_tracking"))
			{
				dictionary.Add("device_limit_tracking", this.hardwareIntegrationData["device_limit_tracking"]);
			}
			if (!this.devIdBlacklist.Contains("affinity_group") && this.hardwareIntegrationData.ContainsKey("affinity_group"))
			{
				dictionary.Add("affinity_group", this.hardwareIntegrationData["affinity_group"]);
			}
			if (this.hardwareIntegrationData.ContainsKey("language"))
			{
				dictionary.Add("language", this.hardwareIntegrationData["language"]);
			}
			if (this.hardwareIntegrationData.ContainsKey("ids"))
			{
				dictionary.Add("ids", this.hardwareIntegrationData["ids"]);
			}
			if (this.hardwareIntegrationData.ContainsKey("conversion_type"))
			{
				dictionary.Add("conversion_type", this.hardwareIntegrationData["conversion_type"]);
			}
			if (this.hardwareIntegrationData.ContainsKey("conversion_data"))
			{
				dictionary.Add("conversion_data", this.hardwareIntegrationData["conversion_data"]);
			}
			dictionary.Add("usertime", (uint)Kochava.CurrentTime());
			if ((uint)Time.time > 0U)
			{
				dictionary.Add("uptime", (uint)Time.time);
			}
			float num = Kochava.UptimeDelta();
			if (num >= 1f)
			{
				dictionary.Add("updelta", (uint)num);
			}
		}
		catch (Exception ex2)
		{
			this.Log("Error preparing initial event: " + ex2, Kochava.KochLogLevel.error);
		}
		finally
		{
			this._fireEvent("initial", dictionary);
			if (this.retrieveAttribution)
			{
				this.Log("invoking attribution call");
				base.StartCoroutine("KochavaAttributionTimerFired", 7);
			}
		}
		try
		{
			Dictionary<string, object> dictionary2 = new Dictionary<string, object>();
			if (this.hardwareIntegrationData.ContainsKey("device_limit_tracking"))
			{
				dictionary2.Add("device_limit_tracking", this.hardwareIntegrationData["device_limit_tracking"].ToString());
			}
			dictionary2.Add("os_version", SystemInfo.operatingSystem);
			dictionary2.Add("app_limit_tracking", this.appLimitAdTracking);
			if (this.hardwareIntegrationData.ContainsKey("language"))
			{
				dictionary2.Add("language", this.hardwareIntegrationData["language"].ToString());
			}
			if (this.hardwareIntegrationData.ContainsKey("app_version"))
			{
				dictionary2.Add("app_version", this.hardwareIntegrationData["app_version"].ToString());
			}
			else
			{
				dictionary2.Add("app_version", this.appVersion);
			}
			if (this.hardwareIntegrationData.ContainsKey("app_short_string"))
			{
				dictionary2.Add("app_short_string", this.hardwareIntegrationData["app_short_string"].ToString());
			}
			else
			{
				dictionary2.Add("app_short_string", this.appVersion);
			}
			if (!this.devIdBlacklist.Contains("idfa") && this.hardwareIntegrationData.ContainsKey("IDFA"))
			{
				dictionary2.Add("idfa", this.hardwareIntegrationData["IDFA"].ToString());
			}
			if (!this.devIdBlacklist.Contains("adid") && this.hardwareIntegrationData.ContainsKey("adid"))
			{
				dictionary2.Add("adid", this.hardwareIntegrationData["adid"]);
			}
			string text4 = JsonWriter.Serialize(dictionary2);
			PlayerPrefs.SetString("watchlistProperties", text4);
			this.Log("watchlistString: " + text4);
		}
		catch (Exception ex3)
		{
			this.Log("Error setting watchlist: " + ex3, Kochava.KochLogLevel.error);
		}
	}

	// Token: 0x06000159 RID: 345 RVA: 0x00006548 File Offset: 0x00004748
	public void ScanWatchlistChanges()
	{
		try
		{
			if (PlayerPrefs.HasKey("watchlistProperties"))
			{
				string @string = PlayerPrefs.GetString("watchlistProperties");
				this.Log("retrieve watchlist: " + @string);
				Dictionary<string, object> dictionary = JsonReader.Deserialize<Dictionary<string, object>>(@string);
				Dictionary<string, object> dictionary2 = new Dictionary<string, object>();
				if (dictionary.ContainsKey("app_version"))
				{
					if (this.hardwareIntegrationData.ContainsKey("app_version"))
					{
						if (dictionary["app_version"].ToString() != this.hardwareIntegrationData["app_version"].ToString())
						{
							dictionary2.Add("app_version", this.hardwareIntegrationData["app_version"].ToString());
							dictionary["app_version"] = this.hardwareIntegrationData["app_version"].ToString();
						}
					}
					else if (dictionary["app_version"].ToString() != this.appVersion)
					{
						dictionary2.Add("app_version", this.appVersion);
						dictionary["app_version"] = this.appVersion;
					}
				}
				if (dictionary.ContainsKey("app_short_string"))
				{
					if (this.hardwareIntegrationData.ContainsKey("app_short_string"))
					{
						if (dictionary["app_short_string"].ToString() != this.hardwareIntegrationData["app_short_string"].ToString())
						{
							dictionary2.Add("app_short_string", this.hardwareIntegrationData["app_short_string"].ToString());
							dictionary["app_short_string"] = this.hardwareIntegrationData["app_short_string"].ToString();
						}
					}
					else if (dictionary["app_short_string"].ToString() != this.appVersion)
					{
						dictionary2.Add("app_short_string", this.appVersion);
						dictionary["app_short_string"] = this.appVersion;
					}
				}
				if (dictionary.ContainsKey("os_version") && dictionary["os_version"].ToString() != SystemInfo.operatingSystem)
				{
					dictionary2.Add("os_version", SystemInfo.operatingSystem);
					dictionary["os_version"] = SystemInfo.operatingSystem;
				}
				if (dictionary.ContainsKey("language") && this.hardwareIntegrationData.ContainsKey("language") && dictionary["language"].ToString() != this.hardwareIntegrationData["language"].ToString())
				{
					dictionary2.Add("language", this.hardwareIntegrationData["language"].ToString());
					dictionary["language"] = this.hardwareIntegrationData["language"].ToString();
				}
				if (dictionary.ContainsKey("device_limit_tracking") && this.hardwareIntegrationData.ContainsKey("device_limit_tracking") && dictionary["device_limit_tracking"].ToString() != this.hardwareIntegrationData["device_limit_tracking"].ToString())
				{
					dictionary2.Add("device_limit_tracking", this.hardwareIntegrationData["device_limit_tracking"].ToString());
					dictionary["device_limit_tracking"] = this.hardwareIntegrationData["device_limit_tracking"].ToString();
				}
				if (dictionary.ContainsKey("app_limit_tracking") && bool.Parse(dictionary["app_limit_tracking"].ToString()) != this.appLimitAdTracking)
				{
					dictionary2.Add("app_limit_tracking", this.appLimitAdTracking);
					dictionary["app_limit_tracking"] = this.appLimitAdTracking;
				}
				if (!this.devIdBlacklist.Contains("idfa") && dictionary.ContainsKey("idfa") && this.hardwareIntegrationData.ContainsKey("IDFA") && dictionary["idfa"].ToString() != this.hardwareIntegrationData["IDFA"].ToString())
				{
					dictionary2.Add("idfa", this.hardwareIntegrationData["IDFA"].ToString());
					dictionary["idfa"] = this.hardwareIntegrationData["IDFA"].ToString();
				}
				if (!this.devIdBlacklist.Contains("adid") && dictionary.ContainsKey("adid") && this.hardwareIntegrationData.ContainsKey("adid") && dictionary["adid"].ToString() != this.hardwareIntegrationData["adid"].ToString())
				{
					dictionary2.Add("adid", this.hardwareIntegrationData["adid"].ToString());
					dictionary["adid"] = this.hardwareIntegrationData["adid"].ToString();
				}
				if (dictionary2.Count > 0)
				{
					string text = JsonWriter.Serialize(dictionary);
					string text2 = JsonWriter.Serialize(dictionary2);
					this.Log("final watchlist: " + text);
					this.Log("changeData: " + text2);
					PlayerPrefs.SetString("watchlistProperties", text);
					Kochava._S._fireEvent("update", dictionary2);
				}
				else
				{
					this.Log("No watchdata changed");
				}
			}
		}
		catch (Exception ex)
		{
			this.Log("Error scanning watchlist: " + ex, Kochava.KochLogLevel.error);
		}
	}

	// Token: 0x0600015A RID: 346 RVA: 0x00006B10 File Offset: 0x00004D10
	public void Update()
	{
		if (Application.isPlaying)
		{
			if (this.processQueueKickstartTime != 0f && Time.time > this.processQueueKickstartTime)
			{
				this.processQueueKickstartTime = 0f;
				base.StartCoroutine("processQueue");
			}
		}
	}

	// Token: 0x0600015B RID: 347 RVA: 0x00006B64 File Offset: 0x00004D64
	public static void SetLimitAdTracking(bool appLimitTracking)
	{
		Kochava.AppLimitAdTracking = appLimitTracking;
		Kochava._S.ScanWatchlistChanges();
	}

	// Token: 0x0600015C RID: 348 RVA: 0x00006B78 File Offset: 0x00004D78
	public static void FireEvent(Dictionary<string, object> properties)
	{
		Kochava._S._fireEvent("event", properties);
	}

	// Token: 0x0600015D RID: 349 RVA: 0x00006B8C File Offset: 0x00004D8C
	public static void FireEvent(Hashtable propHash)
	{
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		foreach (object obj in propHash)
		{
			DictionaryEntry dictionaryEntry = (DictionaryEntry)obj;
			dictionary.Add((string)dictionaryEntry.Key, dictionaryEntry.Value);
		}
		Kochava._S._fireEvent("event", dictionary);
	}

	// Token: 0x0600015E RID: 350 RVA: 0x00006C20 File Offset: 0x00004E20
	public static void FireEvent(string eventName, string eventData)
	{
		if (!Kochava.EventNameBlacklist.Contains(eventName))
		{
			Kochava s = Kochava._S;
			string eventAction = "event";
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary.Add("event_name", eventName);
			dictionary.Add("event_data", eventData);
			s._fireEvent(eventAction, dictionary);
		}
	}

	// Token: 0x0600015F RID: 351 RVA: 0x00006C6C File Offset: 0x00004E6C
	public static void FireSpatialEvent(string eventName, float x, float y)
	{
		Kochava.FireSpatialEvent(eventName, x, y, 0f, string.Empty);
	}

	// Token: 0x06000160 RID: 352 RVA: 0x00006C80 File Offset: 0x00004E80
	public static void FireSpatialEvent(string eventName, float x, float y, string eventData)
	{
		Kochava.FireSpatialEvent(eventName, x, y, 0f, eventData);
	}

	// Token: 0x06000161 RID: 353 RVA: 0x00006C90 File Offset: 0x00004E90
	public static void FireSpatialEvent(string eventName, float x, float y, float z)
	{
		Kochava.FireSpatialEvent(eventName, x, y, z, string.Empty);
	}

	// Token: 0x06000162 RID: 354 RVA: 0x00006CA0 File Offset: 0x00004EA0
	public static void FireSpatialEvent(string eventName, float x, float y, float z, string eventData)
	{
		Kochava s = Kochava._S;
		string eventAction = "spatial";
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("event_name", eventName);
		dictionary.Add("event_data", eventData);
		dictionary.Add("x", x);
		dictionary.Add("y", y);
		dictionary.Add("z", z);
		s._fireEvent(eventAction, dictionary);
	}

	// Token: 0x06000163 RID: 355 RVA: 0x00006D10 File Offset: 0x00004F10
	public static void IdentityLink(string key, string val)
	{
		Kochava s = Kochava._S;
		string eventAction = "identityLink";
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add(key, val);
		s._fireEvent(eventAction, dictionary);
	}

	// Token: 0x06000164 RID: 356 RVA: 0x00006D3C File Offset: 0x00004F3C
	public static void IdentityLink(Dictionary<string, object> identities)
	{
		Kochava._S._fireEvent("identityLink", identities);
	}

	// Token: 0x06000165 RID: 357 RVA: 0x00006D50 File Offset: 0x00004F50
	public static void DeeplinkEvent(string uri, string sourceApp)
	{
		Kochava s = Kochava._S;
		string eventAction = "deeplink";
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("uri", uri);
		dictionary.Add("source_app", sourceApp);
		s._fireEvent(eventAction, dictionary);
	}

	// Token: 0x06000166 RID: 358 RVA: 0x00006D8C File Offset: 0x00004F8C
	private void _fireEvent(string eventAction, Dictionary<string, object> eventData)
	{
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		if (!eventData.ContainsKey("usertime"))
		{
			eventData.Add("usertime", (uint)Kochava.CurrentTime());
		}
		if (!eventData.ContainsKey("uptime") && (uint)Time.time > 0U)
		{
			eventData.Add("uptime", (uint)Time.time);
		}
		float num = Kochava.UptimeDelta();
		if (!eventData.ContainsKey("updelta") && num >= 1f)
		{
			eventData.Add("updelta", (uint)num);
		}
		dictionary.Add("action", eventAction);
		dictionary.Add("data", eventData);
		if (Kochava.eventPostingTime != 0f)
		{
			dictionary.Add("last_post_time", Kochava.eventPostingTime);
		}
		if (this.debugMode)
		{
			dictionary.Add("debug", true);
		}
		if (this.debugServer)
		{
			dictionary.Add("debugServer", true);
		}
		this.postEvent(dictionary);
	}

	// Token: 0x06000167 RID: 359 RVA: 0x00006EA8 File Offset: 0x000050A8
	private void postEvent(Dictionary<string, object> data)
	{
		if (this.eventQueue.Count >= 75)
		{
			this.Log("MAX_QUEUE_SIZE (" + 75 + ") reached, dequeuing first event in queue", Kochava.KochLogLevel.error);
			this.eventQueue.Dequeue();
		}
		Kochava.QueuedEvent queuedEvent = new Kochava.QueuedEvent();
		queuedEvent.eventTime = Time.time;
		queuedEvent.eventData = data;
		this.eventQueue.Enqueue(queuedEvent);
		base.StartCoroutine("processQueue");
	}

	// Token: 0x06000168 RID: 360 RVA: 0x00006F20 File Offset: 0x00005120
	public static void startiBeaconMonitoring(bool debugLogging)
	{
	}

	// Token: 0x06000169 RID: 361 RVA: 0x00006F24 File Offset: 0x00005124
	private IEnumerator iBeaconDeviceLocationCallback(string locationInfo)
	{
		Dictionary<string, object> deviceLocationData = new Dictionary<string, object>();
		Dictionary<string, string> dictionary = new Dictionary<string, string>();
		dictionary.Add("Content-Type", "application/xml");
		dictionary.Add("User-Agent", this.userAgent);
		Dictionary<string, string> headers = dictionary;
		try
		{
			deviceLocationData = JsonReader.Deserialize<Dictionary<string, object>>(locationInfo);
		}
		catch (Exception ex)
		{
			Exception e = ex;
			this.Log("Failed Deserialize locationInfo: " + e, Kochava.KochLogLevel.warning);
			yield break;
		}
		this.Log(string.Concat(new object[]
		{
			"Received (",
			deviceLocationData.Count,
			") location elements (ibeacon callback): ",
			locationInfo
		}), Kochava.KochLogLevel.debug);
		string longitude = string.Empty;
		string latitude = string.Empty;
		if (deviceLocationData.ContainsKey("longitude"))
		{
			longitude = deviceLocationData["longitude"].ToString();
		}
		if (deviceLocationData.ContainsKey("latitude"))
		{
			latitude = deviceLocationData["latitude"].ToString();
		}
		string queryPostData = string.Empty;
		Dictionary<string, object> queryPostDataDictionary = new Dictionary<string, object>();
		Dictionary<string, object> queryDataDictionary = new Dictionary<string, object>();
		queryDataDictionary.Add("longitude", longitude);
		queryDataDictionary.Add("latitude", latitude);
		queryPostDataDictionary.Add("kochava_device_id", this.kochavaDeviceId);
		queryPostDataDictionary.Add("action", "ibeacon_device_location");
		queryPostDataDictionary.Add("data", queryDataDictionary);
		queryPostDataDictionary.Add("kochava_app_id", this.kochavaAppId);
		queryPostDataDictionary.Add("sdk_version", "Unity3D-20150311");
		queryPostDataDictionary.Add("sdk_protocol", "3");
		queryPostData = JsonWriter.Serialize(queryPostDataDictionary);
		this.Log(queryPostData, Kochava.KochLogLevel.debug);
		WWW wwwQuery = new WWW("https://control.kochava.com/track/kvquery", Encoding.UTF8.GetBytes(queryPostData), headers);
		yield return wwwQuery;
		this.Log(wwwQuery.text, Kochava.KochLogLevel.debug);
		Dictionary<string, object> queryServerResponse = new Dictionary<string, object>();
		if (wwwQuery.error == null && wwwQuery.text != string.Empty)
		{
			this.Log("Server Response Received: " + WWW.UnEscapeURL(wwwQuery.text), Kochava.KochLogLevel.debug);
			queryServerResponse = JsonReader.Deserialize<Dictionary<string, object>>(wwwQuery.text);
		}
		if (queryServerResponse.ContainsKey("data"))
		{
			Dictionary<string, object> queryServerResponseData = (Dictionary<string, object>)queryServerResponse["data"];
			string dataString = JsonWriter.Serialize(queryServerResponseData);
			this.monitoriBeacons("[" + dataString.Split(new char[]
			{
				'[',
				']'
			})[1] + "]");
		}
		yield break;
	}

	// Token: 0x0600016A RID: 362 RVA: 0x00006F50 File Offset: 0x00005150
	private void monitoriBeacons(string beaconLocations)
	{
	}

	// Token: 0x0600016B RID: 363 RVA: 0x00006F54 File Offset: 0x00005154
	private IEnumerator iBeaconBarrierCrossedCallback(string ibeaconInformation)
	{
		if (Kochava.iBeaconCallback != null)
		{
			Kochava.iBeaconCallback(ibeaconInformation);
		}
		Dictionary<string, string> dictionary = new Dictionary<string, string>();
		dictionary.Add("Content-Type", "application/xml");
		dictionary.Add("User-Agent", this.userAgent);
		Dictionary<string, string> headers = dictionary;
		string trackerPostData = string.Empty;
		Dictionary<string, object> trackerPostDataDictionary = new Dictionary<string, object>();
		trackerPostDataDictionary.Add("kochava_device_id", this.kochavaDeviceId);
		trackerPostDataDictionary.Add("action", "ibeacon_boundary_crossed");
		trackerPostDataDictionary.Add("data", ibeaconInformation);
		trackerPostDataDictionary.Add("kochava_app_id", this.kochavaAppId);
		trackerPostDataDictionary.Add("sdk_version", "Unity3D-20150311");
		trackerPostDataDictionary.Add("sdk_protocol", "3");
		trackerPostData = JsonWriter.Serialize(trackerPostDataDictionary);
		this.Log(trackerPostData, Kochava.KochLogLevel.debug);
		WWW wwwTracker = new WWW("https://control.kochava.com/track/kvTracker?v3", Encoding.UTF8.GetBytes(trackerPostData), headers);
		yield return wwwTracker;
		if (wwwTracker.error == null && wwwTracker.text != string.Empty)
		{
			this.Log("Server Response Received on iBeacon boundary crossed: " + WWW.UnEscapeURL(wwwTracker.text), Kochava.KochLogLevel.debug);
		}
		yield break;
	}

	// Token: 0x0600016C RID: 364 RVA: 0x00006F80 File Offset: 0x00005180
	private IEnumerator processQueue()
	{
		if (this.queueIsProcessing)
		{
			yield break;
		}
		this.queueIsProcessing = true;
		while (this.appData == null)
		{
			yield return new WaitForSeconds(15f);
			if (this.appData == null)
			{
				this.Log("Event posting delayed (AppData null, kvinit handshake incomplete or Unity reloaded assemblies)", Kochava.KochLogLevel.debug);
			}
		}
		while (this.eventQueue.Count > 0)
		{
			Kochava.QueuedEvent queuedEvent = this.eventQueue.Peek();
			float postTime = Time.time;
			string postData = string.Empty;
			try
			{
				Dictionary<string, object> eventData = queuedEvent.eventData;
				foreach (KeyValuePair<string, object> row in this.appData)
				{
					if (!eventData.ContainsKey(row.Key))
					{
						eventData.Add(row.Key, row.Value);
					}
				}
				postData = JsonWriter.Serialize(eventData);
			}
			catch (Exception ex)
			{
				Exception e = ex;
				this.Log("Event posting failure: " + e, Kochava.KochLogLevel.error);
			}
			if (postData != string.Empty)
			{
				this.Log("Posting event: " + postData.Replace("{", "{\n").Replace(",", ",\n"), Kochava.KochLogLevel.debug);
				Dictionary<string, string> dictionary = new Dictionary<string, string>();
				dictionary.Add("Content-Type", "application/xml");
				dictionary.Add("User-Agent", this.userAgent);
				Dictionary<string, string> headers = dictionary;
				this.Log(postData, Kochava.KochLogLevel.debug);
				WWW www = new WWW("https://control.kochava.com/track/kvTracker?v3", Encoding.UTF8.GetBytes(postData), headers);
				yield return www;
				try
				{
					Dictionary<string, object> serverResponse = new Dictionary<string, object>();
					if (www.error == null && www.text != string.Empty)
					{
						this.Log("Server Response Received: " + WWW.UnEscapeURL(www.text), Kochava.KochLogLevel.debug);
						serverResponse = JsonReader.Deserialize<Dictionary<string, object>>(www.text);
					}
					bool retry = true;
					bool success = serverResponse.ContainsKey("success");
					if (!string.IsNullOrEmpty(www.error) || !success)
					{
						this._eventPostingTime = -1f;
						if (!string.IsNullOrEmpty(www.error))
						{
							this.Log("Event Posting Failed: " + www.error, Kochava.KochLogLevel.error);
						}
						else
						{
							this.Log("Event Posting Did Not Succeed: " + ((!(www.text == string.Empty)) ? www.text : "(Blank response from server)"), Kochava.KochLogLevel.error);
							if (serverResponse.ContainsKey("error") || www.text == string.Empty)
							{
								retry = false;
							}
						}
						if (retry)
						{
							this.processQueueKickstartTime = Time.time + 30f;
							this.queueIsProcessing = false;
							yield break;
						}
						this.eventQueue.Dequeue();
						this.Log("Event posting failure, event dequeued: " + serverResponse["error"], Kochava.KochLogLevel.warning);
					}
					else
					{
						this.eventQueue.Dequeue();
						this._eventPostingTime = Time.time - postTime;
						this.Log("Event Posted (" + this._eventPostingTime + " seconds to upload)");
						if (serverResponse.ContainsKey("cta") && serverResponse["CTA"].ToString() == "1")
						{
							Application.OpenURL(serverResponse["URL"].ToString());
						}
					}
				}
				catch (Exception ex2)
				{
					Exception e2 = ex2;
					this.Log("Event posting response processing failure: " + e2, Kochava.KochLogLevel.error);
				}
			}
		}
		this.queueIsProcessing = false;
		yield break;
	}

	// Token: 0x0600016D RID: 365 RVA: 0x00006F9C File Offset: 0x0000519C
	public void OnApplicationPause(bool didPause)
	{
		if (this.sessionTracking == Kochava.KochSessionTracking.full && this.appData != null)
		{
			Kochava s = Kochava._S;
			string eventAction = "session";
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary.Add("state", (!didPause) ? "resume" : "pause");
			s._fireEvent(eventAction, dictionary);
		}
		if (didPause)
		{
			this.saveQueue();
		}
		else
		{
			this.Log("received - app resume");
			AndroidJNIHelper.debug = true;
			using (AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
			{
				AndroidJavaObject @static = androidJavaClass.GetStatic<AndroidJavaObject>("currentActivity");
				AndroidJavaObject androidJavaObject = @static.Call<AndroidJavaObject>("getApplicationContext", new object[0]);
				AndroidJavaClass androidJavaClass2 = new AndroidJavaClass("com.kochava.android.tracker.lite.KochavaSDKLite");
				androidJavaClass2.CallStatic<string>("GetExternalKochavaInfo_Android", new object[]
				{
					androidJavaObject,
					this.whitelist,
					Kochava.device_id_delay,
					Kochava.adidBlacklisted,
					Kochava.AdidSupressed
				});
			}
		}
	}

	// Token: 0x0600016E RID: 366 RVA: 0x000070C4 File Offset: 0x000052C4
	public void OnApplicationQuit()
	{
		if (this.sessionTracking == Kochava.KochSessionTracking.full || this.sessionTracking == Kochava.KochSessionTracking.basic || this.sessionTracking == Kochava.KochSessionTracking.minimal)
		{
			Kochava s = Kochava._S;
			string eventAction = "session";
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary.Add("state", "quit");
			s._fireEvent(eventAction, dictionary);
		}
		this.saveQueue();
	}

	// Token: 0x0600016F RID: 367 RVA: 0x00007120 File Offset: 0x00005320
	private void saveQueue()
	{
		if (this.eventQueue.Count > 0)
		{
			try
			{
				string text = JsonWriter.Serialize(this.eventQueue);
				PlayerPrefs.SetString("kochava_queue_storage", text);
				this.Log("Event Queue saved: " + text, Kochava.KochLogLevel.debug);
			}
			catch (Exception ex)
			{
				this.Log("Failure saving event queue: " + ex, Kochava.KochLogLevel.error);
			}
		}
	}

	// Token: 0x06000170 RID: 368 RVA: 0x000071A0 File Offset: 0x000053A0
	private void loadQueue()
	{
		try
		{
			if (PlayerPrefs.HasKey("kochava_queue_storage"))
			{
				string @string = PlayerPrefs.GetString("kochava_queue_storage");
				int num = 0;
				Kochava.QueuedEvent[] array = JsonReader.Deserialize<Kochava.QueuedEvent[]>(@string);
				foreach (Kochava.QueuedEvent queuedEvent in array)
				{
					if (!this.eventQueue.Contains(queuedEvent))
					{
						this.eventQueue.Enqueue(queuedEvent);
						num++;
					}
				}
				this.Log("Loaded (" + num + ") events from persistent storage", Kochava.KochLogLevel.debug);
				PlayerPrefs.DeleteKey("kochava_queue_storage");
				base.StartCoroutine("processQueue");
			}
		}
		catch (Exception ex)
		{
			this.Log("Failure loading event queue: " + ex, Kochava.KochLogLevel.debug);
		}
	}

	// Token: 0x06000171 RID: 369 RVA: 0x00007280 File Offset: 0x00005480
	public static void ClearQueue()
	{
		Kochava._S.StartCoroutine("clearQueue");
	}

	// Token: 0x06000172 RID: 370 RVA: 0x00007294 File Offset: 0x00005494
	private IEnumerator clearQueue()
	{
		try
		{
			this.Log("Clearing (" + Kochava.eventQueueLength + ") events from upload queue...");
			Kochava._S.StopCoroutine("processQueue");
		}
		catch (Exception ex)
		{
			Exception e = ex;
			this.Log("Failure clearing event queue: " + e, Kochava.KochLogLevel.error);
		}
		yield return null;
		try
		{
			Kochava._S.queueIsProcessing = false;
			Kochava._S.eventQueue = new Queue<Kochava.QueuedEvent>();
		}
		catch (Exception ex2)
		{
			Exception e2 = ex2;
			this.Log("Failure clearing event queue: " + e2, Kochava.KochLogLevel.error);
		}
		yield break;
	}

	// Token: 0x06000173 RID: 371 RVA: 0x000072B0 File Offset: 0x000054B0
	public void GetAd(int webView, int height, int width)
	{
		this.Log("Adserver Implementation Pending");
	}

	// Token: 0x06000174 RID: 372 RVA: 0x000072C0 File Offset: 0x000054C0
	private void Log(string msg)
	{
		this.Log(msg, Kochava.KochLogLevel.warning);
	}

	// Token: 0x06000175 RID: 373 RVA: 0x000072CC File Offset: 0x000054CC
	private void Log(string msg, Kochava.KochLogLevel level)
	{
		if (level == Kochava.KochLogLevel.error)
		{
			Debug.Log("*** Kochava Error: " + msg + " ***");
		}
		else if (this.debugMode)
		{
			Debug.Log("Kochava: " + msg);
		}
		if (this.debugMode || level == Kochava.KochLogLevel.error || level == Kochava.KochLogLevel.warning)
		{
			this._EventLog.Add(new Kochava.LogEvent(msg, level));
		}
		if (this._EventLog.Count > 50)
		{
			this._EventLog.RemoveAt(0);
		}
	}

	// Token: 0x06000176 RID: 374 RVA: 0x0000735C File Offset: 0x0000555C
	public static void ClearLog()
	{
		Kochava._S._EventLog.Clear();
	}

	// Token: 0x06000177 RID: 375 RVA: 0x00007370 File Offset: 0x00005570
	protected internal static double CurrentTime()
	{
		return (DateTime.UtcNow - Kochava.Jan1st1970).TotalSeconds;
	}

	// Token: 0x06000178 RID: 376 RVA: 0x00007394 File Offset: 0x00005594
	protected internal static float UptimeDelta()
	{
		Kochava.uptimeDelta = Time.time - Kochava.uptimeDeltaUpdate;
		Kochava.uptimeDeltaUpdate = Time.time;
		return Kochava.uptimeDelta;
	}

	// Token: 0x06000179 RID: 377 RVA: 0x000073B8 File Offset: 0x000055B8
	private string CalculateMD5Hash(string input)
	{
		string result;
		try
		{
			MD5 md = MD5.Create();
			byte[] bytes = Encoding.ASCII.GetBytes(input);
			byte[] array = md.ComputeHash(bytes);
			StringBuilder stringBuilder = new StringBuilder();
			for (int i = 0; i < array.Length; i++)
			{
				stringBuilder.Append(array[i].ToString("x2"));
			}
			result = stringBuilder.ToString();
		}
		catch (Exception ex)
		{
			this.Log("Failure calculating MD5 hash: " + ex, Kochava.KochLogLevel.error);
			result = string.Empty;
		}
		return result;
	}

	// Token: 0x0600017A RID: 378 RVA: 0x0000746C File Offset: 0x0000566C
	private string CalculateSHA1Hash(string input)
	{
		string result;
		try
		{
			byte[] array = new SHA1Managed().ComputeHash(Encoding.ASCII.GetBytes(input));
			string text = string.Empty;
			foreach (byte b in array)
			{
				text += b.ToString("x2");
			}
			result = text;
		}
		catch (Exception ex)
		{
			this.Log("Failure calculating SHA1 hash: " + ex, Kochava.KochLogLevel.error);
			result = string.Empty;
		}
		return result;
	}

	// Token: 0x0600017B RID: 379 RVA: 0x00007518 File Offset: 0x00005718
	public IEnumerator KochavaAttributionTimerFired(int delayTime)
	{
		this.Log("attribution timer fired");
		yield return new WaitForSeconds((float)delayTime);
		Dictionary<string, object> dictionary = new Dictionary<string, object>();
		dictionary.Add("action", "get_attribution");
		dictionary.Add("kochava_app_id", this.kochavaAppId);
		dictionary.Add("kochava_device_id", this.kochavaDeviceId);
		dictionary.Add("sdk_version", "Unity3D-20150311");
		dictionary.Add("sdk_protocol", "3");
		Dictionary<string, object> queryData = dictionary;
		string queryString = JsonWriter.Serialize(queryData);
		Dictionary<string, string> dictionary2 = new Dictionary<string, string>();
		dictionary2.Add("Content-Type", "application/xml");
		dictionary2.Add("User-Agent", this.userAgent);
		Dictionary<string, string> headers = dictionary2;
		this.Log(queryString, Kochava.KochLogLevel.debug);
		float wwwLoadTime = Time.time;
		WWW www = new WWW("https://control.kochava.com/track/kvquery", Encoding.UTF8.GetBytes(queryString), headers);
		yield return www;
		if (!string.IsNullOrEmpty(www.error))
		{
			this.Log(string.Concat(new object[]
			{
				"kvquery (attribution) handshake failed: ",
				www.error,
				", seconds: ",
				Time.time - wwwLoadTime,
				")"
			}), Kochava.KochLogLevel.warning);
			base.StartCoroutine("KochavaAttributionTimerFired", 60);
			yield break;
		}
		Dictionary<string, object> serverResponse = new Dictionary<string, object>();
		this.Log("server response: " + www.text);
		if (www.text != string.Empty)
		{
			try
			{
				serverResponse = JsonReader.Deserialize<Dictionary<string, object>>(www.text);
			}
			catch (Exception ex)
			{
				Exception e = ex;
				this.Log("Failed Deserialize JSON response to kvquery (attribution): " + e, Kochava.KochLogLevel.warning);
			}
		}
		this.Log(www.text, Kochava.KochLogLevel.debug);
		if (!serverResponse.ContainsKey("success"))
		{
			this.Log("kvquery (attribution) handshake parsing failed: " + www.text, Kochava.KochLogLevel.warning);
			base.StartCoroutine("KochavaAttributionTimerFired", 60);
			yield break;
		}
		if (int.Parse(serverResponse["success"].ToString()) == 0)
		{
			this.Log("kvquery (attribution) did not return success = true " + www.text, Kochava.KochLogLevel.warning);
			base.StartCoroutine("KochavaAttributionTimerFired", 60);
			yield break;
		}
		if (serverResponse.ContainsKey("data"))
		{
			Dictionary<string, object> attributionDataChunk = new Dictionary<string, object>();
			try
			{
				attributionDataChunk = (Dictionary<string, object>)serverResponse["data"];
			}
			catch (Exception ex2)
			{
				Exception e2 = ex2;
				this.Log("Failed Deserialize JSON attribution data chunk: " + e2, Kochava.KochLogLevel.warning);
			}
			int retry = 0;
			if (attributionDataChunk.ContainsKey("retry"))
			{
				retry = int.Parse(attributionDataChunk["retry"].ToString());
				this.Log("attribution retry: " + retry, Kochava.KochLogLevel.warning);
			}
			if (retry == -1 && attributionDataChunk.ContainsKey("attribution"))
			{
				string attributionString = JsonWriter.Serialize(attributionDataChunk["attribution"]);
				PlayerPrefs.SetString("attribution", attributionString);
				this.attributionDataStr = attributionString;
				this.Log("Saved attribution chunk to persistent storage: " + attributionString, Kochava.KochLogLevel.warning);
				if (Kochava.attributionCallback != null)
				{
					Kochava.attributionCallback(attributionString);
				}
			}
			if (retry == 0)
			{
				base.StartCoroutine("KochavaAttributionTimerFired", 60);
			}
			if (retry > 0)
			{
				base.StartCoroutine("KochavaAttributionTimerFired", retry);
			}
		}
		yield break;
	}

	// Token: 0x0600017C RID: 380 RVA: 0x00007544 File Offset: 0x00005744
	public static string GetAttributionData()
	{
		return Kochava.AttributionDataStr;
	}

	// Token: 0x04000066 RID: 102
	public const string KOCHAVA_VERSION = "20150311";

	// Token: 0x04000067 RID: 103
	public const string KOCHAVA_PROTOCOL_VERSION = "3";

	// Token: 0x04000068 RID: 104
	private const int MAX_LOG_SIZE = 50;

	// Token: 0x04000069 RID: 105
	private const int MAX_QUEUE_SIZE = 75;

	// Token: 0x0400006A RID: 106
	private const int MAX_POST_TIME = 15;

	// Token: 0x0400006B RID: 107
	private const int POST_FAIL_RETRY_DELAY = 30;

	// Token: 0x0400006C RID: 108
	private const int QUEUE_KVINIT_WAIT_DELAY = 15;

	// Token: 0x0400006D RID: 109
	private const string API_URL = "https://control.kochava.com";

	// Token: 0x0400006E RID: 110
	private const string TRACKING_URL = "https://control.kochava.com/track/kvTracker?v3";

	// Token: 0x0400006F RID: 111
	private const string INIT_URL = "https://control.kochava.com/track/kvinit";

	// Token: 0x04000070 RID: 112
	private const string QUERY_URL = "https://control.kochava.com/track/kvquery";

	// Token: 0x04000071 RID: 113
	private const string AD_URL = "http://bidder.kochava.com/adserver/request/";

	// Token: 0x04000072 RID: 114
	private const string KOCHAVA_QUEUE_STORAGE_KEY = "kochava_queue_storage";

	// Token: 0x04000073 RID: 115
	private const int KOCHAVA_ATTRIBUTION_INITIAL_TIMER = 7;

	// Token: 0x04000074 RID: 116
	private const int KOCHAVA_ATTRIBUTION_DEFAULT_TIMER = 60;

	// Token: 0x04000075 RID: 117
	public string kochavaAppId = string.Empty;

	// Token: 0x04000076 RID: 118
	public string kochavaAppIdIOS = string.Empty;

	// Token: 0x04000077 RID: 119
	public string kochavaAppIdAndroid = string.Empty;

	// Token: 0x04000078 RID: 120
	public string kochavaAppIdKindle = string.Empty;

	// Token: 0x04000079 RID: 121
	public string kochavaAppIdBlackberry = string.Empty;

	// Token: 0x0400007A RID: 122
	public string kochavaAppIdWindowsPhone = string.Empty;

	// Token: 0x0400007B RID: 123
	public bool debugMode;

	// Token: 0x0400007C RID: 124
	public bool incognitoMode;

	// Token: 0x0400007D RID: 125
	public bool requestAttribution;

	// Token: 0x0400007E RID: 126
	private bool retrieveAttribution;

	// Token: 0x0400007F RID: 127
	private bool debugServer;

	// Token: 0x04000080 RID: 128
	[HideInInspector]
	public string appVersion = string.Empty;

	// Token: 0x04000081 RID: 129
	[HideInInspector]
	public string appIdentifier = string.Empty;

	// Token: 0x04000082 RID: 130
	[HideInInspector]
	public string partnerName = string.Empty;

	// Token: 0x04000083 RID: 131
	public bool appLimitAdTracking;

	// Token: 0x04000084 RID: 132
	[HideInInspector]
	public string userAgent = string.Empty;

	// Token: 0x04000085 RID: 133
	public bool adidSupressed;

	// Token: 0x04000086 RID: 134
	private static int device_id_delay = 60;

	// Token: 0x04000087 RID: 135
	private string whitelist;

	// Token: 0x04000088 RID: 136
	private static bool adidBlacklisted = false;

	// Token: 0x04000089 RID: 137
	private static Kochava.AttributionCallback attributionCallback;

	// Token: 0x0400008A RID: 138
	private static Kochava.iBeaconCrossedCallback iBeaconCallback;

	// Token: 0x0400008B RID: 139
	private string appPlatform = "desktop";

	// Token: 0x0400008C RID: 140
	private string kochavaDeviceId = string.Empty;

	// Token: 0x0400008D RID: 141
	private string attributionDataStr = string.Empty;

	// Token: 0x0400008E RID: 142
	private List<string> devIdBlacklist = new List<string>();

	// Token: 0x0400008F RID: 143
	private List<string> eventNameBlacklist = new List<string>();

	// Token: 0x04000090 RID: 144
	public string appCurrency = "USD";

	// Token: 0x04000091 RID: 145
	public Kochava.KochSessionTracking sessionTracking;

	// Token: 0x04000092 RID: 146
	private List<Kochava.LogEvent> _EventLog = new List<Kochava.LogEvent>();

	// Token: 0x04000093 RID: 147
	private Dictionary<string, object> hardwareIdentifierData = new Dictionary<string, object>();

	// Token: 0x04000094 RID: 148
	private Dictionary<string, object> hardwareIntegrationData = new Dictionary<string, object>();

	// Token: 0x04000095 RID: 149
	private Dictionary<string, object> appData;

	// Token: 0x04000096 RID: 150
	private Queue<Kochava.QueuedEvent> eventQueue = new Queue<Kochava.QueuedEvent>();

	// Token: 0x04000097 RID: 151
	private float processQueueKickstartTime;

	// Token: 0x04000098 RID: 152
	private bool queueIsProcessing;

	// Token: 0x04000099 RID: 153
	private float _eventPostingTime;

	// Token: 0x0400009A RID: 154
	private static Kochava _S;

	// Token: 0x0400009B RID: 155
	private static readonly DateTime Jan1st1970 = new DateTime(1970, 1, 1, 0, 0, 0, 1);

	// Token: 0x0400009C RID: 156
	private static float uptimeDelta;

	// Token: 0x0400009D RID: 157
	private static float uptimeDeltaUpdate;

	// Token: 0x02000014 RID: 20
	public enum KochSessionTracking
	{
		// Token: 0x0400009F RID: 159
		full,
		// Token: 0x040000A0 RID: 160
		basic,
		// Token: 0x040000A1 RID: 161
		minimal,
		// Token: 0x040000A2 RID: 162
		none
	}

	// Token: 0x02000015 RID: 21
	public enum KochLogLevel
	{
		// Token: 0x040000A4 RID: 164
		error,
		// Token: 0x040000A5 RID: 165
		warning,
		// Token: 0x040000A6 RID: 166
		debug
	}

	// Token: 0x02000016 RID: 22
	public class LogEvent
	{
		// Token: 0x0600017D RID: 381 RVA: 0x0000754C File Offset: 0x0000574C
		public LogEvent(string text, Kochava.KochLogLevel level)
		{
			this.text = text;
			this.time = Time.time;
			this.level = level;
		}

		// Token: 0x040000A7 RID: 167
		public string text;

		// Token: 0x040000A8 RID: 168
		public float time;

		// Token: 0x040000A9 RID: 169
		public Kochava.KochLogLevel level;
	}

	// Token: 0x02000017 RID: 23
	public class QueuedEvent
	{
		// Token: 0x040000AA RID: 170
		public float eventTime;

		// Token: 0x040000AB RID: 171
		public Dictionary<string, object> eventData;
	}

	// Token: 0x0200001D RID: 29
	// (Invoke) Token: 0x0600023A RID: 570
	public delegate void AttributionCallback(string callbackString);

	// Token: 0x0200001E RID: 30
	// (Invoke) Token: 0x0600023E RID: 574
	public delegate void iBeaconCrossedCallback(string callbackString);
}
