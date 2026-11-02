using System;
using System.Collections.Generic;
using System.IO;
using emcore.GameData;
using PlayMation;
using UnityEngine;

// Token: 0x02000233 RID: 563
public class PlayerData
{
	// Token: 0x06000F79 RID: 3961 RVA: 0x0006D580 File Offset: 0x0006B780
	public PlayerData()
	{
		this.guestLogin();
	}

	// Token: 0x170001DD RID: 477
	// (get) Token: 0x06000F7A RID: 3962 RVA: 0x0006D61C File Offset: 0x0006B81C
	public List<PlayerDeviceClass> device_list
	{
		get
		{
			return new List<PlayerDeviceClass>(this.mDevices.Values);
		}
	}

	// Token: 0x170001DE RID: 478
	// (get) Token: 0x06000F7B RID: 3963 RVA: 0x0006D630 File Offset: 0x0006B830
	public string ckey
	{
		get
		{
			string text = PlayerPrefs.GetString("ckey", string.Empty);
			if (string.IsNullOrEmpty(text) && !string.IsNullOrEmpty(this.id))
			{
				PlayerPrefs.SetString("ckey", this.id + "x");
				text = this.id;
			}
			return text;
		}
	}

	// Token: 0x06000F7C RID: 3964 RVA: 0x0006D68C File Offset: 0x0006B88C
	private string encrypt(string plain)
	{
		return Crypt.Encrypt(plain, this.ckey);
	}

	// Token: 0x06000F7D RID: 3965 RVA: 0x0006D69C File Offset: 0x0006B89C
	private string decrypt(string crypto)
	{
		return Crypt.Decrypt(crypto, this.ckey);
	}

	// Token: 0x06000F7E RID: 3966 RVA: 0x0006D6AC File Offset: 0x0006B8AC
	private void saveEncrypt(string file, string plain)
	{
		StreamWriter streamWriter = null;
		try
		{
			streamWriter = new StreamWriter(file);
			streamWriter.Write(this.encrypt(plain));
			streamWriter.Close();
			streamWriter = null;
		}
		finally
		{
			if (streamWriter != null)
			{
				streamWriter.Close();
			}
		}
	}

	// Token: 0x06000F7F RID: 3967 RVA: 0x0006D708 File Offset: 0x0006B908
	private string readDecrypt(string file)
	{
		StreamReader streamReader = null;
		string result;
		try
		{
			streamReader = new StreamReader(file);
			string text = this.decrypt(streamReader.ReadToEnd());
			streamReader.Close();
			streamReader = null;
			result = text;
		}
		finally
		{
			if (streamReader != null)
			{
				streamReader.Close();
			}
		}
		return result;
	}

	// Token: 0x170001DF RID: 479
	// (get) Token: 0x06000F80 RID: 3968 RVA: 0x0006D76C File Offset: 0x0006B96C
	// (set) Token: 0x06000F81 RID: 3969 RVA: 0x0006D774 File Offset: 0x0006B974
	public string id
	{
		get
		{
			return this.mId;
		}
		set
		{
			this.mId = value;
		}
	}

	// Token: 0x170001E0 RID: 480
	// (get) Token: 0x06000F82 RID: 3970 RVA: 0x0006D780 File Offset: 0x0006B980
	// (set) Token: 0x06000F83 RID: 3971 RVA: 0x0006D788 File Offset: 0x0006B988
	public string aToken
	{
		get
		{
			return this.mLToken;
		}
		set
		{
			this.mLToken = value;
		}
	}

	// Token: 0x170001E1 RID: 481
	// (get) Token: 0x06000F84 RID: 3972 RVA: 0x0006D794 File Offset: 0x0006B994
	// (set) Token: 0x06000F85 RID: 3973 RVA: 0x0006D79C File Offset: 0x0006B99C
	public string rToken
	{
		get
		{
			return this.mRToken;
		}
		set
		{
			this.mRToken = value;
		}
	}

	// Token: 0x170001E2 RID: 482
	// (get) Token: 0x06000F86 RID: 3974 RVA: 0x0006D7A8 File Offset: 0x0006B9A8
	public string gameFileName
	{
		get
		{
			return Application.persistentDataPath + Path.DirectorySeparatorChar + "CGame.txt";
		}
	}

	// Token: 0x170001E3 RID: 483
	// (get) Token: 0x06000F87 RID: 3975 RVA: 0x0006D7C4 File Offset: 0x0006B9C4
	public string gameFileNameBackup
	{
		get
		{
			return Application.persistentDataPath + Path.DirectorySeparatorChar + "CGame-backup.txt";
		}
	}

	// Token: 0x170001E4 RID: 484
	// (get) Token: 0x06000F88 RID: 3976 RVA: 0x0006D7E0 File Offset: 0x0006B9E0
	public string playerFileName
	{
		get
		{
			string text = (this.mId != null) ? this.mId.Trim(new char[]
			{
				'{',
				'}'
			}) : string.Empty;
			return string.Concat(new object[]
			{
				Application.persistentDataPath,
				Path.DirectorySeparatorChar,
				"CGame_",
				text,
				".txt"
			});
		}
	}

	// Token: 0x170001E5 RID: 485
	// (get) Token: 0x06000F89 RID: 3977 RVA: 0x0006D854 File Offset: 0x0006BA54
	public string playerFileNameBackup
	{
		get
		{
			string text = (this.mId != null) ? this.mId.Trim(new char[]
			{
				'{',
				'}'
			}) : string.Empty;
			return string.Concat(new object[]
			{
				Application.persistentDataPath,
				Path.DirectorySeparatorChar,
				"CGame_",
				text,
				"-backup.txt"
			});
		}
	}

	// Token: 0x170001E6 RID: 486
	// (get) Token: 0x06000F8A RID: 3978 RVA: 0x0006D8C8 File Offset: 0x0006BAC8
	public string missionFileName
	{
		get
		{
			string text = (this.mId != null) ? this.mId.Trim(new char[]
			{
				'{',
				'}'
			}) : string.Empty;
			return string.Concat(new object[]
			{
				Application.persistentDataPath,
				Path.DirectorySeparatorChar,
				"CMiss_",
				text,
				".txt"
			});
		}
	}

	// Token: 0x170001E7 RID: 487
	// (get) Token: 0x06000F8B RID: 3979 RVA: 0x0006D93C File Offset: 0x0006BB3C
	public string missionFileNameBackup
	{
		get
		{
			string text = (this.mId != null) ? this.mId.Trim(new char[]
			{
				'{',
				'}'
			}) : string.Empty;
			return string.Concat(new object[]
			{
				Application.persistentDataPath,
				Path.DirectorySeparatorChar,
				"CMiss_",
				text,
				"-backup.txt"
			});
		}
	}

	// Token: 0x06000F8C RID: 3980 RVA: 0x0006D9B0 File Offset: 0x0006BBB0
	public bool isGuestLogin()
	{
		return this.mPlayerState == PlayerState.Guest;
	}

	// Token: 0x06000F8D RID: 3981 RVA: 0x0006D9BC File Offset: 0x0006BBBC
	public bool isAuthenticated()
	{
		return this.mPlayerState == PlayerState.LoggedIn;
	}

	// Token: 0x170001E8 RID: 488
	// (get) Token: 0x06000F8E RID: 3982 RVA: 0x0006D9C8 File Offset: 0x0006BBC8
	// (set) Token: 0x06000F8F RID: 3983 RVA: 0x0006D9D0 File Offset: 0x0006BBD0
	public List<string> testFired
	{
		get
		{
			return this.mTestfired;
		}
		set
		{
			this.mTestfired = value;
		}
	}

	// Token: 0x170001E9 RID: 489
	// (get) Token: 0x06000F90 RID: 3984 RVA: 0x0006D9DC File Offset: 0x0006BBDC
	// (set) Token: 0x06000F91 RID: 3985 RVA: 0x0006D9E4 File Offset: 0x0006BBE4
	public List<string> achievements
	{
		get
		{
			return this.mAchievements;
		}
		set
		{
			this.mAchievements = value;
		}
	}

	// Token: 0x06000F92 RID: 3986 RVA: 0x0006D9F0 File Offset: 0x0006BBF0
	public void clear()
	{
		this.mEntitlements.Clear();
		this.mDevices.Clear();
		this.mAchievements.Clear();
		this.mPlayerState = PlayerState.Guest;
		this.mLToken = (this.mRToken = null);
		this.mId = string.Empty;
		this.display_name = string.Empty;
		globals.clear_mission_summaries();
		globals.new_sf_level.Clear();
		globals.new_abilities.Clear();
		this.mScavengerHuntData.Clear();
		this.mShowScavengerHunt = false;
	}

	// Token: 0x06000F93 RID: 3987 RVA: 0x0006DA78 File Offset: 0x0006BC78
	public void logout()
	{
		globals.debug("logging out player");
		this.saveData(true, false);
		this.clear();
		this.guestLogin();
		this.saveData(false, false);
	}

	// Token: 0x06000F94 RID: 3988 RVA: 0x0006DAB0 File Offset: 0x0006BCB0
	public void GeneralFetchError(string url, string err)
	{
	}

	// Token: 0x06000F95 RID: 3989 RVA: 0x0006DAB4 File Offset: 0x0006BCB4
	public void guestLogin()
	{
		this.mPlayerState = PlayerState.Guest;
		this.mId = ".guest";
	}

	// Token: 0x06000F96 RID: 3990 RVA: 0x0006DAC8 File Offset: 0x0006BCC8
	public void fromJson(JSONObject j)
	{
		if (j.HasField("accessToken"))
		{
			this.mLToken = j["accessToken"].str;
		}
		string text = null;
		if (j.HasField("id"))
		{
			text = j["id"].str;
		}
		if (this.mLToken != null && this.mLToken != WebHandler.getInstance().token)
		{
			WebHandler.getInstance().setTokens(this.mLToken);
			globals.BLE_manager.loginWithAccessToken(WebHandler.instance.token, WebHandler.instance.cellophaneKey);
			globals.debug("isAuthenticated() " + this.isAuthenticated());
			if (this.isAuthenticated())
			{
				globals.debug(" PLAYERDATA is RENEW THE TOKEN");
			}
		}
		if (text == null && j.HasField("id"))
		{
			text = j["id"].str;
		}
		if (text != null)
		{
			if (this.isGuestLogin() || string.IsNullOrEmpty(this.mId))
			{
				this.mId = text;
			}
			else if (!text.Equals(this.mId))
			{
				return;
			}
		}
		globals.debug(" Json from server" + j.Print(true));
		if (j.HasField("playerData") && j["playerData"].IsObject)
		{
			JSONObject jsonobject = j["playerData"];
			if (jsonobject.HasField("entitlements"))
			{
				foreach (JSONObject jsonobject2 in jsonobject["entitlements"].list)
				{
					if (!this.mEntitlements.Contains(jsonobject2.str))
					{
						this.mEntitlements.Add(jsonobject2.str);
					}
				}
			}
			if (jsonobject.HasField("player"))
			{
				JSONObject jsonobject3 = jsonobject["player"];
				if (jsonobject3.HasField("avatar"))
				{
					this.avatar = jsonobject3["avatar"].str;
				}
				if (jsonobject3.HasField("devices"))
				{
					foreach (JSONObject obj in jsonobject3["devices"].list)
					{
						PlayerDeviceClass playerDeviceClass = new PlayerDeviceClass(obj);
						if (!this.mDevices.ContainsKey(playerDeviceClass.id) && playerDeviceClass.id > 0)
						{
							this.mDevices.Add(playerDeviceClass.id, playerDeviceClass);
						}
					}
				}
				if (jsonobject3.HasField("typeCounts"))
				{
					JSONObject jsonobject4 = jsonobject3["typeCounts"];
					for (int i = 0; i < jsonobject4.list.Count; i += 2)
					{
						this.mTypeCounts[(int)jsonobject4.list[i].n] = (int)jsonobject4.list[i + 1].n;
					}
				}
				if (jsonobject3.HasField("achievements"))
				{
					foreach (JSONObject jsonobject5 in jsonobject3["achievements"].list)
					{
						this.addAchievement(jsonobject5.str, false);
					}
				}
				if (jsonobject3.HasField("testFired"))
				{
					foreach (JSONObject jsonobject6 in jsonobject3["testFired"].list)
					{
						this.addTestFired(jsonobject6.str);
					}
				}
				if (jsonobject3.HasField("enemies"))
				{
					foreach (JSONObject jsonobject7 in jsonobject3["enemies"].list)
					{
						this.enemies_killed[(int)jsonobject7["id"].n] = (int)jsonobject7["count"].n;
					}
				}
				if (jsonobject3.HasField("scavengerHunt"))
				{
					foreach (JSONObject jsonobject8 in jsonobject3["scavengerHunt"].list)
					{
						this.mScavengerHuntData[(int)jsonobject8["id"].n] = (int)jsonobject8["count"].n;
					}
				}
				if (jsonobject3.HasField("showScavengerHunt"))
				{
					this.mShowScavengerHunt = jsonobject3["showScavengerHunt"].b;
				}
			}
		}
		if (j.HasField("displayName") && j["displayName"].IsString)
		{
			this.display_name = j["displayName"].str;
		}
	}

	// Token: 0x06000F97 RID: 3991 RVA: 0x0006E0D8 File Offset: 0x0006C2D8
	public JSONObject toJsonForToy(int deviceId)
	{
		if (!globals.BLE_manager.mConnectedDevices.ContainsKey(deviceId))
		{
			globals.debug("Unknown toy");
			return null;
		}
		if (!this.mDevices.ContainsKey(deviceId))
		{
			globals.debugWarning("gear not owned by player");
			return null;
		}
		PlayerDeviceClass playerDeviceClass = this.mDevices[deviceId];
		JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
		jsonobject.AddField("characters", playerDeviceClass.sf_rep_for_toy());
		jsonobject.AddField("devxp", playerDeviceClass.xp);
		return jsonobject;
	}

	// Token: 0x06000F98 RID: 3992 RVA: 0x0006E15C File Offset: 0x0006C35C
	public JSONObject toJson()
	{
		JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
		if (this.mLToken != null)
		{
			jsonobject.AddField("accessToken", this.mLToken);
		}
		JSONObject jsonobject2 = new JSONObject(JSONObject.Type.OBJECT);
		jsonobject.AddField("playerData", jsonobject2);
		jsonobject2.AddField("appVer", BundleVersion.get(true));
		JSONObject jsonobject3 = new JSONObject(JSONObject.Type.ARRAY);
		jsonobject2.AddField("entitlements", jsonobject3);
		foreach (string text in this.mEntitlements)
		{
			if (!string.IsNullOrEmpty(text))
			{
				jsonobject3.Add(text);
			}
		}
		JSONObject jsonobject4 = new JSONObject(JSONObject.Type.OBJECT);
		jsonobject2.AddField("player", jsonobject4);
		jsonobject4.AddField("id", this.mId);
		jsonobject4.AddField("avatar", this.avatar);
		JSONObject jsonobject5 = new JSONObject(JSONObject.Type.OBJECT);
		jsonobject4.AddField("devices", jsonobject5);
		foreach (KeyValuePair<int, PlayerDeviceClass> keyValuePair in this.mDevices)
		{
			if (keyValuePair.Value.type > 0)
			{
				jsonobject5.Add(keyValuePair.Value.to_json());
			}
		}
		JSONObject jsonobject6 = new JSONObject(JSONObject.Type.ARRAY);
		jsonobject4.AddField("achievements", jsonobject6);
		foreach (string str in this.mAchievements)
		{
			jsonobject6.Add(str);
		}
		JSONObject jsonobject7 = new JSONObject(JSONObject.Type.ARRAY);
		jsonobject4.AddField("testFired", jsonobject7);
		foreach (string str2 in this.mTestfired)
		{
			jsonobject7.Add(str2);
		}
		JSONObject jsonobject8 = new JSONObject(JSONObject.Type.ARRAY);
		jsonobject4.AddField("enemies", jsonobject8);
		foreach (KeyValuePair<int, int> keyValuePair2 in this.enemies_killed)
		{
			JSONObject jsonobject9 = new JSONObject(JSONObject.Type.OBJECT);
			jsonobject9.AddField("id", keyValuePair2.Key);
			jsonobject9.AddField("count", keyValuePair2.Value);
			jsonobject8.Add(jsonobject9);
		}
		JSONObject jsonobject10 = new JSONObject(JSONObject.Type.ARRAY);
		jsonobject4.AddField("scavengerHunt", jsonobject10);
		foreach (KeyValuePair<int, int> keyValuePair3 in this.mScavengerHuntData)
		{
			JSONObject jsonobject11 = new JSONObject(JSONObject.Type.OBJECT);
			jsonobject11.AddField("id", keyValuePair3.Key);
			jsonobject11.AddField("count", keyValuePair3.Value);
			jsonobject10.Add(jsonobject11);
		}
		jsonobject4.AddField("showScavengerHunt", this.mShowScavengerHunt);
		jsonobject.AddField("displayName", this.display_name);
		globals.debug(jsonobject.Print(false));
		return jsonobject;
	}

	// Token: 0x06000F99 RID: 3993 RVA: 0x0006E53C File Offset: 0x0006C73C
	public void setSFRep(int cid, int xp)
	{
		if (this.latest_device_data)
		{
			this.latest_device_data.set_sf_rep(cid, xp);
		}
	}

	// Token: 0x06000F9A RID: 3994 RVA: 0x0006E568 File Offset: 0x0006C768
	public int getSFRep(string cid)
	{
		if (this.latest_device_data)
		{
			return this.latest_device_data.get_sf_rep(cid);
		}
		return -1;
	}

	// Token: 0x06000F9B RID: 3995 RVA: 0x0006E594 File Offset: 0x0006C794
	public int getSFLevel(string cid)
	{
		if (!this.latest_device_data)
		{
			return 0;
		}
		int num = this.latest_device_data.get_sf_rep(cid);
		for (int i = 1; i < globals.sf_xp_to_level.Length; i++)
		{
			if (num < globals.sf_xp_to_level[i])
			{
				return i - 1;
			}
		}
		return globals.sf_xp_to_level.Length - 1;
	}

	// Token: 0x06000F9C RID: 3996 RVA: 0x0006E5F4 File Offset: 0x0006C7F4
	public int SFRepCount()
	{
		if (this.latest_device_data)
		{
			return this.latest_device_data.sf_rep_count();
		}
		return 0;
	}

	// Token: 0x06000F9D RID: 3997 RVA: 0x0006E620 File Offset: 0x0006C820
	public int avengers_level()
	{
		Dictionary<int, int> dictionary = new Dictionary<int, int>();
		for (int i = 0; i < this.device_list.Count; i++)
		{
			if (!dictionary.ContainsKey(this.device_list[i].type))
			{
				dictionary.Add(this.device_list[i].type, this.device_list[i].xp);
			}
			else if (dictionary[this.device_list[i].type] < this.device_list[i].xp)
			{
				dictionary[this.device_list[i].type] = this.device_list[i].xp;
			}
		}
		int num = 0;
		foreach (KeyValuePair<int, int> keyValuePair in dictionary)
		{
			num += globals.gear_level_from_xp(keyValuePair.Value);
		}
		return num;
	}

	// Token: 0x06000F9E RID: 3998 RVA: 0x0006E750 File Offset: 0x0006C950
	public void parse_enemy_kills(List<missionSummaryClass.EnemiesKilledClass> kills)
	{
		for (int i = 0; i < kills.Count; i++)
		{
			if (this.enemies_killed.ContainsKey(kills[i].type))
			{
				Dictionary<int, int> dictionary2;
				Dictionary<int, int> dictionary = dictionary2 = this.enemies_killed;
				int num2;
				int num = num2 = kills[i].type;
				num2 = dictionary2[num2];
				dictionary[num] = num2 + kills[i].count;
			}
			else
			{
				this.enemies_killed.Add(kills[i].type, kills[i].count);
			}
		}
	}

	// Token: 0x06000F9F RID: 3999 RVA: 0x0006E7EC File Offset: 0x0006C9EC
	public bool saveData(bool updateServer = false, bool ignoreDelta = false)
	{
		return globals.build_type != build_type_enum.no_gear_demo && (this.savePlayerFile(updateServer && !this.isGuestLogin(), ignoreDelta) && this.saveGameFile());
	}

	// Token: 0x06000FA0 RID: 4000 RVA: 0x0006E834 File Offset: 0x0006CA34
	public bool savePlayerFile(bool updateServer = false, bool ignoreDelta = false)
	{
		string playerFileName = this.playerFileName;
		string playerFileNameBackup = this.playerFileNameBackup;
		globals.safeFileMove(playerFileName, playerFileNameBackup);
		try
		{
			JSONObject jsonobject = this.toJson();
			string plain = jsonobject.Print(false);
			globals.debug("Write to: " + playerFileName + "\n" + jsonobject.Print(true));
			this.saveEncrypt(playerFileName, plain);
			if (File.Exists(playerFileNameBackup))
			{
				File.Delete(playerFileNameBackup);
			}
		}
		catch (Exception log)
		{
			globals.debugException(log);
			globals.safeFileMove(playerFileNameBackup, playerFileName);
			return false;
		}
		if (updateServer)
		{
			this.updateLocalData();
		}
		return true;
	}

	// Token: 0x06000FA1 RID: 4001 RVA: 0x0006E8E8 File Offset: 0x0006CAE8
	private void refreshPlayerDataFromWebAndUpdateServer()
	{
		if (this.isAuthenticated())
		{
			globals.network_manager.FetchPlayerData(this, delegate(JSONObject jsonResponse)
			{
				this.updateLocalData();
			}, new WebHandler.HttpErrorDelegate(this.GeneralFetchError));
		}
	}

	// Token: 0x06000FA2 RID: 4002 RVA: 0x0006E924 File Offset: 0x0006CB24
	private void updateLocalData()
	{
		globals.network_manager.updatePlayerData(globals.player_data);
	}

	// Token: 0x06000FA3 RID: 4003 RVA: 0x0006E938 File Offset: 0x0006CB38
	public bool saveGameFile()
	{
		string gameFileName = this.gameFileName;
		string gameFileNameBackup = this.gameFileNameBackup;
		globals.safeFileMove(gameFileName, gameFileNameBackup);
		try
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			jsonobject.AddField("id", this.mId);
			jsonobject.AddField("firmwareUpdateStarted", this.firmwareUpdateStarted);
			jsonobject.AddField("firmwareUpdateFinished", this.firmwareUpdateFinished);
			string plain = jsonobject.Print(false);
			globals.debug("Write to: " + gameFileName);
			this.saveEncrypt(gameFileName, plain);
			if (File.Exists(gameFileNameBackup))
			{
				File.Delete(gameFileNameBackup);
			}
		}
		catch (Exception log)
		{
			globals.debugException(log);
			globals.safeFileMove(gameFileNameBackup, gameFileName);
			return false;
		}
		return true;
	}

	// Token: 0x06000FA4 RID: 4004 RVA: 0x0006EA08 File Offset: 0x0006CC08
	public void readData()
	{
		string gameFileName = this.gameFileName;
		if (this.isGuestLogin())
		{
			globals.debug("Was guest " + gameFileName);
			if (!File.Exists(gameFileName))
			{
				return;
			}
			globals.debug("Found file " + gameFileName);
			JSONObject jsonobject;
			try
			{
				jsonobject = new JSONObject(this.readDecrypt(gameFileName), -2, false, false);
			}
			catch (Exception log)
			{
				globals.debug(log);
				jsonobject = null;
			}
			if (jsonobject == null)
			{
				return;
			}
			if (jsonobject.HasField("firmwareUpdateStarted"))
			{
				this.firmwareUpdateStarted = jsonobject["firmwareUpdateStarted"].b;
			}
			if (jsonobject.HasField("firmwareUpdateFinished"))
			{
				this.firmwareUpdateFinished = jsonobject["firmwareUpdateFinished"].b;
			}
			globals.debug(string.Concat(new object[]
			{
				"firmwareUpdateStarted",
				this.firmwareUpdateStarted,
				":",
				this.firmwareUpdateFinished
			}));
			if (jsonobject.HasField("id"))
			{
				this.mId = jsonobject["id"].str;
			}
		}
		if (string.IsNullOrEmpty(this.mId))
		{
			return;
		}
		this.readPlayerData(false);
	}

	// Token: 0x06000FA5 RID: 4005 RVA: 0x0006EB60 File Offset: 0x0006CD60
	private void readPlayerData(bool login)
	{
		string playerFileName = this.playerFileName;
		if (!File.Exists(playerFileName))
		{
			return;
		}
		JSONObject jsonobject;
		try
		{
			jsonobject = new JSONObject(this.readDecrypt(playerFileName), -2, false, false);
		}
		catch (Exception log)
		{
			globals.debug(log);
			jsonobject = null;
		}
		if (jsonobject == null || !jsonobject.HasField("playerData"))
		{
			return;
		}
		this.fromJson(jsonobject);
		if (this.mLToken != null && !login)
		{
			this.mPlayerState = PlayerState.LoggedIn;
			globals.DisneyIDManager.onSilentLogin();
		}
	}

	// Token: 0x06000FA6 RID: 4006 RVA: 0x0006EC00 File Offset: 0x0006CE00
	public void reconcileFromWeb(PlayerData webData, bool login = false)
	{
		globals.debug("Reconciling web data");
		if (login)
		{
			this.mId = webData.mId;
			this.mLToken = webData.mLToken;
			this.mRToken = webData.mRToken;
		}
		this.avatar = webData.avatar;
		foreach (string text in webData.mEntitlements)
		{
			if (!this.mEntitlements.Contains(text))
			{
				this.mEntitlements.Add(text);
			}
		}
		foreach (KeyValuePair<int, PlayerDeviceClass> keyValuePair in webData.mDevices)
		{
			if (this.mDevices.ContainsKey(keyValuePair.Key))
			{
				this.mDevices[keyValuePair.Key].reconcile(keyValuePair.Value);
			}
			else
			{
				this.mDevices.Add(keyValuePair.Key, keyValuePair.Value);
			}
		}
		foreach (KeyValuePair<int, int> keyValuePair2 in webData.scavenger_hunt_data())
		{
			this.set_scavenger_hunt_data(keyValuePair2.Key, keyValuePair2.Value);
		}
		foreach (KeyValuePair<int, int> keyValuePair3 in webData.enemies_killed)
		{
			if (this.enemies_killed.ContainsKey(keyValuePair3.Key))
			{
				if (this.enemies_killed[keyValuePair3.Key] < keyValuePair3.Value)
				{
					this.enemies_killed[keyValuePair3.Key] = keyValuePair3.Value;
				}
			}
			else
			{
				this.enemies_killed.Add(keyValuePair3.Key, keyValuePair3.Value);
			}
		}
		if (!this.mShowScavengerHunt)
		{
			this.mShowScavengerHunt = webData.mShowScavengerHunt;
		}
		this.saveData(false, false);
	}

	// Token: 0x06000FA7 RID: 4007 RVA: 0x0006EEA0 File Offset: 0x0006D0A0
	public void reconcileToyPlayerData(int deviceId, JSONObject j)
	{
		try
		{
			if (!globals.BLE_manager.mConnectedDevices.ContainsKey(deviceId))
			{
				globals.debug("Unknown toy");
			}
			else if (!this.mDevices.ContainsKey(deviceId))
			{
				globals.debugWarning("gear not owned by player");
			}
			else
			{
				PlayerDeviceClass playerDeviceClass = this.mDevices[deviceId];
				if (!j.HasField("id"))
				{
					globals.debug("Missing id field");
				}
				else if (!j["id"].str.Equals(this.id))
				{
					globals.debug("Id field mismatch " + j["id"].str + " != " + this.id);
				}
				else
				{
					foreach (string text in j.keys)
					{
						if (text.StartsWith("u.") && j[text].b)
						{
							this.add_unlock(text.Substring(2));
						}
						else if (text == "Telaser" && j[text].b && !this.has_unlock("IMShield"))
						{
							this.add_unlock("IMShield");
						}
						if (text.StartsWith("achieve.") && j[text].b && j[text].n == 0.0)
						{
							this.addAchievement(text.Substring(8), false);
						}
					}
					if (j.HasField("dxp"))
					{
						int num = (int)j["dxp"].n;
						if (num > playerDeviceClass.xp)
						{
							playerDeviceClass.xp = num;
						}
					}
					if (j.HasField("sf") && j["sf"].IsObject)
					{
						JSONObject jsonobject = j["sf"];
						foreach (string text2 in jsonobject.keys)
						{
							int num2 = 0;
							int.TryParse(text2.Substring(2), ref num2);
							if (num2 == 0)
							{
								globals.debug("Character key 0 ignored - " + text2);
							}
							else
							{
								int num3 = (int)jsonobject[text2].n;
								if (num3 > playerDeviceClass.get_sf_rep(num2))
								{
									playerDeviceClass.set_sf_rep(num2, num3);
								}
							}
						}
					}
					this.saveData(false, false);
				}
			}
		}
		catch (Exception log)
		{
			globals.debugException(log);
		}
	}

	// Token: 0x06000FA8 RID: 4008 RVA: 0x0006F1C0 File Offset: 0x0006D3C0
	public bool reconcileToyPlayResult(int deviceId, JSONObject j)
	{
		bool result;
		try
		{
			if (!globals.BLE_manager.mConnectedDevices.ContainsKey(deviceId))
			{
				globals.debug("Unknown toy");
				result = false;
			}
			else if (!j.HasField("mission"))
			{
				result = false;
			}
			else
			{
				if (j.HasField("unlock"))
				{
					if (j["unlock"].type == JSONObject.Type.STRING)
					{
						string[] array = j["unlock"].str.Split(new char[]
						{
							','
						});
						foreach (string s in array)
						{
							this.add_unlock(s);
						}
					}
					else
					{
						foreach (JSONObject jsonobject in j["unlock"].list)
						{
							this.add_unlock(jsonobject.str);
						}
					}
				}
				this.saveData(false, false);
				result = true;
			}
		}
		catch (Exception log)
		{
			globals.debugException(log);
			result = false;
		}
		return result;
	}

	// Token: 0x06000FA9 RID: 4009 RVA: 0x0006F32C File Offset: 0x0006D52C
	public void reconcileToyTypes(Dictionary<int, int> typeCounts)
	{
		foreach (KeyValuePair<int, int> keyValuePair in typeCounts)
		{
			if (!this.mTypeCounts.ContainsKey(keyValuePair.Key) || keyValuePair.Value > this.mTypeCounts[keyValuePair.Key])
			{
				this.mTypeCounts[keyValuePair.Key] = keyValuePair.Value;
			}
		}
	}

	// Token: 0x170001EA RID: 490
	// (get) Token: 0x06000FAA RID: 4010 RVA: 0x0006F3D4 File Offset: 0x0006D5D4
	public PlayerDeviceClass latest_device_data
	{
		get
		{
			if (this.connected_device_data)
			{
				return this.connected_device_data;
			}
			if (this.mDevices.ContainsKey(this.getPrimaryDevice()))
			{
				return this.mDevices[this.getPrimaryDevice()];
			}
			return null;
		}
	}

	// Token: 0x170001EB RID: 491
	// (get) Token: 0x06000FAB RID: 4011 RVA: 0x0006F424 File Offset: 0x0006D624
	public PlayerDeviceClass connected_device_data
	{
		get
		{
			if (globals.BLE_manager_exists && this.mDevices.ContainsKey(globals.BLE_manager.connectedDevice))
			{
				return this.mDevices[globals.BLE_manager.connectedDevice];
			}
			return null;
		}
	}

	// Token: 0x06000FAC RID: 4012 RVA: 0x0006F46C File Offset: 0x0006D66C
	public void clear_progress()
	{
		foreach (KeyValuePair<int, PlayerDeviceClass> keyValuePair in this.mDevices)
		{
			keyValuePair.Value.xp = 0;
			keyValuePair.Value.clear_sf_rep();
			keyValuePair.Value.clear_unlocks();
			keyValuePair.Value.clear_grades();
		}
		this.testFired.Clear();
		this.achievements.Clear();
		this.enemies_killed.Clear();
	}

	// Token: 0x06000FAD RID: 4013 RVA: 0x0006F520 File Offset: 0x0006D720
	public void add_unlock(string s)
	{
		if (this.latest_device_data)
		{
			this.latest_device_data.add_unlock(s);
		}
	}

	// Token: 0x06000FAE RID: 4014 RVA: 0x0006F540 File Offset: 0x0006D740
	public bool has_unlock(string s)
	{
		return string.IsNullOrEmpty(s) || (this.latest_device_data && this.latest_device_data.unlocks.Contains(s));
	}

	// Token: 0x06000FAF RID: 4015 RVA: 0x0006F580 File Offset: 0x0006D780
	public void set_grade(int mission, int grade)
	{
		if (this.latest_device_data)
		{
			this.latest_device_data.set_grade(mission, grade);
		}
	}

	// Token: 0x06000FB0 RID: 4016 RVA: 0x0006F5AC File Offset: 0x0006D7AC
	public int get_grade(int mission)
	{
		if (this.latest_device_data)
		{
			return this.latest_device_data.get_grade(mission);
		}
		return -1;
	}

	// Token: 0x06000FB1 RID: 4017 RVA: 0x0006F5D8 File Offset: 0x0006D7D8
	public void addAchievement(string uval, bool isNew = false)
	{
		if (!this.mAchievements.Contains(uval))
		{
			this.mAchievements.Add(uval);
			if (isNew && !globals.report_items.user_cancelled)
			{
				globals.report_items.achievements.Add(uval);
			}
		}
	}

	// Token: 0x06000FB2 RID: 4018 RVA: 0x0006F628 File Offset: 0x0006D828
	public void addTestFired(string uval)
	{
		if (!this.mTestfired.Contains(uval))
		{
			this.mTestfired.Add(uval);
		}
	}

	// Token: 0x06000FB3 RID: 4019 RVA: 0x0006F648 File Offset: 0x0006D848
	public void unlockCharacter(int charId)
	{
		if (this.latest_device_data && this.latest_device_data.get_sf_rep(charId) < 1)
		{
			this.latest_device_data.set_sf_rep(charId, 0);
		}
	}

	// Token: 0x06000FB4 RID: 4020 RVA: 0x0006F688 File Offset: 0x0006D888
	public void addRegisterDevice(int deviceId, int deviceType)
	{
		globals.debug(string.Concat(new object[]
		{
			"addRegisterDevice ",
			deviceId,
			":",
			deviceType,
			":",
			this.mDevices.ContainsKey(deviceId)
		}));
		if (this.mDevices.ContainsKey(deviceId))
		{
			this.mDevices[deviceId].isRegister = true;
			this.mDevices[deviceId].type = deviceType;
			this.mDevices[deviceId].downloadQueu.Clear();
		}
		else
		{
			PlayerDeviceClass playerDeviceClass = new PlayerDeviceClass();
			playerDeviceClass.id = deviceId;
			playerDeviceClass.type = deviceType;
			playerDeviceClass.isRegister = true;
			this.mDevices.Add(deviceId, playerDeviceClass);
		}
		if (this.getPrimaryDevice() == 0)
		{
			this.setPrimaryDevice(deviceId);
		}
		this.missionDownloadProgressState = Constants.ContentDownLoadState.NULL;
		this.firmwareDownloadProgressState = Constants.FirmwareDownLoadState.NULL;
		this.firmwareUpdateStarted = false;
		this.firmwareUpdateFinished = true;
		globals.debug("addRegisterDevice");
		this.saveData(true, false);
	}

	// Token: 0x06000FB5 RID: 4021 RVA: 0x0006F79C File Offset: 0x0006D99C
	public void clear_device_progress(int id)
	{
		if (this.mDevices.ContainsKey(id))
		{
			int type = this.mDevices[id].type;
			this.mDevices[id] = new PlayerDeviceClass();
			this.mDevices[id].id = id;
			this.mDevices[id].type = type;
			globals.debug("clear_device_progress: progress cleared for device " + id.ToString());
		}
		else
		{
			globals.debug("clear_device_progress: no progress found for device " + id.ToString());
		}
	}

	// Token: 0x06000FB6 RID: 4022 RVA: 0x0006F834 File Offset: 0x0006DA34
	public void removeRegisterDevice(int deviceId)
	{
		if (this.mDevices.ContainsKey(deviceId))
		{
			globals.debug("removeRegisterDevice #" + deviceId.ToString());
			this.mDevices.Remove(deviceId);
			this.saveData(true, true);
		}
	}

	// Token: 0x06000FB7 RID: 4023 RVA: 0x0006F880 File Offset: 0x0006DA80
	public void addDLCContent(int deviceId, string missionId)
	{
		if (this.mDevices.ContainsKey(deviceId))
		{
			this.mDevices[deviceId].addContent(missionId);
		}
		this.saveData(true, false);
	}

	// Token: 0x06000FB8 RID: 4024 RVA: 0x0006F8BC File Offset: 0x0006DABC
	public bool removeDLCContent(int deviceId, string contentId)
	{
		bool result = false;
		if (this.mDevices.ContainsKey(deviceId))
		{
			result = this.mDevices[deviceId].removeContent(contentId);
		}
		this.saveData(true, false);
		return result;
	}

	// Token: 0x06000FB9 RID: 4025 RVA: 0x0006F8FC File Offset: 0x0006DAFC
	public void removeAllDLCContent(int deviceId)
	{
		this.mEntitlements.Clear();
		if (this.mDevices.ContainsKey(deviceId))
		{
			for (int i = 0; i < this.mDevices[deviceId].content.Count; i++)
			{
				DLCData dlcdata = this.mDevices[deviceId].content[i];
				this.mDevices[deviceId].content.Remove(dlcdata);
				i--;
			}
		}
		globals.network_manager.updatePlayerData(globals.player_data);
	}

	// Token: 0x06000FBA RID: 4026 RVA: 0x0006F990 File Offset: 0x0006DB90
	public bool owns_device(int id)
	{
		return this.mDevices.ContainsKey(id);
	}

	// Token: 0x06000FBB RID: 4027 RVA: 0x0006F9A0 File Offset: 0x0006DBA0
	public List<int> device_ids()
	{
		List<int> list = new List<int>();
		foreach (KeyValuePair<int, PlayerDeviceClass> keyValuePair in this.mDevices)
		{
			list.Add(keyValuePair.Key);
		}
		return list;
	}

	// Token: 0x06000FBC RID: 4028 RVA: 0x0006FA14 File Offset: 0x0006DC14
	public int getPrimaryDevice()
	{
		foreach (KeyValuePair<int, PlayerDeviceClass> keyValuePair in this.mDevices)
		{
			if (keyValuePair.Value.isPrimary)
			{
				return keyValuePair.Key;
			}
		}
		return 0;
	}

	// Token: 0x06000FBD RID: 4029 RVA: 0x0006FA94 File Offset: 0x0006DC94
	public void setPrimaryDevice(int deviceId)
	{
		foreach (KeyValuePair<int, PlayerDeviceClass> keyValuePair in this.mDevices)
		{
			if (keyValuePair.Key == deviceId)
			{
				keyValuePair.Value.setPrimary(true);
			}
			else
			{
				keyValuePair.Value.setPrimary(false);
			}
		}
		this.saveData(true, false);
	}

	// Token: 0x06000FBE RID: 4030 RVA: 0x0006FB28 File Offset: 0x0006DD28
	public void updateRegisterflag(int deviceId, bool flag)
	{
		if (this.mDevices.ContainsKey(deviceId))
		{
			this.mDevices[deviceId].isRegister = flag;
		}
	}

	// Token: 0x06000FBF RID: 4031 RVA: 0x0006FB50 File Offset: 0x0006DD50
	public bool isContentPushedToCurrentDevice(string entitlement)
	{
		if (this.latest_device_data)
		{
			for (int i = 0; i < this.latest_device_data.content.Count; i++)
			{
				if (this.latest_device_data.content[i].missionId == entitlement)
				{
					return true;
				}
			}
		}
		return false;
	}

	// Token: 0x06000FC0 RID: 4032 RVA: 0x0006FBB4 File Offset: 0x0006DDB4
	public bool can_play_mission(missionDataClass m)
	{
		return this.mission_entitled(m) && m.location.unlocked() && this.has_unlock(m.requires);
	}

	// Token: 0x06000FC1 RID: 4033 RVA: 0x0006FBF0 File Offset: 0x0006DDF0
	public bool mission_entitled(missionDataClass d)
	{
		if (this.mEntitlements.Contains(d.entitlements))
		{
			return true;
		}
		if (globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(globals.BLE_manager.connectedDevice))
		{
			Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[globals.BLE_manager.connectedDevice];
			if (dictionary.ContainsKey(d.entitlements))
			{
				globals.debug("Adding entitlement: " + d.entitlements);
				this.mEntitlements.Add(d.entitlements);
				this.saveData(false, false);
				return true;
			}
		}
		return false;
	}

	// Token: 0x06000FC2 RID: 4034 RVA: 0x0006FC90 File Offset: 0x0006DE90
	public void updateFirmwareVersion(int deviceId, string firmwareId)
	{
		if (this.mDevices.ContainsKey(deviceId) && this.mDevices[deviceId].firmwareVersion != firmwareId)
		{
			this.mDevices[deviceId].setFirmwareVersion(firmwareId);
			this.saveData(true, false);
		}
	}

	// Token: 0x06000FC3 RID: 4035 RVA: 0x0006FCE8 File Offset: 0x0006DEE8
	public string getFirmwareVersion(int deviceId)
	{
		if (!this.mDevices.ContainsKey(deviceId))
		{
			return null;
		}
		if (this.mDevices[deviceId].firmwareVersion == null)
		{
			return null;
		}
		return this.mDevices[deviceId].firmwareVersion.Replace("PORTAL_LIBRARY_VERSION_", string.Empty);
	}

	// Token: 0x06000FC4 RID: 4036 RVA: 0x0006FD40 File Offset: 0x0006DF40
	public bool isDeviceRegistered(int deviceId)
	{
		return this.mDevices.ContainsKey(deviceId) && this.mDevices[deviceId].isRegister;
	}

	// Token: 0x06000FC5 RID: 4037 RVA: 0x0006FD74 File Offset: 0x0006DF74
	public List<string> getDownloadQueu(int deviceId)
	{
		if (this.mDevices.ContainsKey(deviceId))
		{
			return this.mDevices[deviceId].downloadQueu;
		}
		return new List<string>();
	}

	// Token: 0x06000FC6 RID: 4038 RVA: 0x0006FDAC File Offset: 0x0006DFAC
	public void enqueueDownloadQueu(int deviceId, List<string> packageIDs)
	{
		if (this.mDevices.ContainsKey(deviceId))
		{
			foreach (string contentId in packageIDs)
			{
				this.mDevices[deviceId].addPackageinDownloadQueu(contentId);
			}
		}
		this.saveData(true, false);
	}

	// Token: 0x06000FC7 RID: 4039 RVA: 0x0006FE34 File Offset: 0x0006E034
	public void dequeueDownloadQueu(int deviceId, string packageID)
	{
		if (this.mDevices.ContainsKey(deviceId))
		{
			this.mDevices[deviceId].removePackagefromDownloadQueu(packageID);
		}
		this.saveData(true, false);
	}

	// Token: 0x06000FC8 RID: 4040 RVA: 0x0006FE70 File Offset: 0x0006E070
	public void clearDownloadQueu(int deviceId)
	{
		if (this.mDevices.ContainsKey(deviceId))
		{
			this.mDevices[deviceId].downloadQueu.Clear();
		}
		this.saveData(true, false);
	}

	// Token: 0x06000FC9 RID: 4041 RVA: 0x0006FEB0 File Offset: 0x0006E0B0
	public Dictionary<int, PlayerDeviceClass> getOwnedDevice()
	{
		return this.mDevices;
	}

	// Token: 0x170001EC RID: 492
	// (get) Token: 0x06000FCA RID: 4042 RVA: 0x0006FEB8 File Offset: 0x0006E0B8
	// (set) Token: 0x06000FCB RID: 4043 RVA: 0x0006FED8 File Offset: 0x0006E0D8
	public bool show_scavenger_hunt
	{
		get
		{
			return this.mShowScavengerHunt && globals.hide_scavenger_hunt.Count == 0;
		}
		set
		{
			this.mShowScavengerHunt = value;
		}
	}

	// Token: 0x06000FCC RID: 4044 RVA: 0x0006FEE4 File Offset: 0x0006E0E4
	public Dictionary<int, int> scavenger_hunt_data()
	{
		return this.mScavengerHuntData;
	}

	// Token: 0x06000FCD RID: 4045 RVA: 0x0006FEEC File Offset: 0x0006E0EC
	public int get_scavenger_hunt_data(int id)
	{
		if (this.mScavengerHuntData.ContainsKey(id))
		{
			return this.mScavengerHuntData[id];
		}
		return 0;
	}

	// Token: 0x06000FCE RID: 4046 RVA: 0x0006FF10 File Offset: 0x0006E110
	public void set_scavenger_hunt_data(int id, int count)
	{
		if (this.mScavengerHuntData.ContainsKey(id))
		{
			if (count == -1 || (this.mScavengerHuntData[id] != -1 && this.mScavengerHuntData[id] < count))
			{
				this.mScavengerHuntData[id] = count;
			}
		}
		else
		{
			this.mScavengerHuntData.Add(id, count);
		}
	}

	// Token: 0x06000FCF RID: 4047 RVA: 0x0006FF78 File Offset: 0x0006E178
	public void parse_player_data_from_gear(JSONObject data, PlayerDeviceClass device_data_override = null)
	{
		if (this.latest_device_data == null && device_data_override == null)
		{
			globals.debugWarning("no gear detected!");
			return;
		}
		PlayerDeviceClass playerDeviceClass = this.latest_device_data;
		if (device_data_override)
		{
			playerDeviceClass = device_data_override;
		}
		if (playerDeviceClass != null)
		{
			globals.previous_xp = playerDeviceClass.xp;
		}
		globals.textdump_string += "[ff8888]";
		if (!data.HasField("dxp"))
		{
			globals.textdump_string += "no dxp in gearDataUpdate!\n";
		}
		else if (globals.BLE_manager.connectedDevice < 0)
		{
			globals.textdump_string += "no connected device!\n";
		}
		else
		{
			globals.current_xp = (int)data["dxp"].n;
			if (playerDeviceClass != null)
			{
				playerDeviceClass.xp = (int)data["dxp"].n;
			}
			string textdump_string = globals.textdump_string;
			globals.textdump_string = string.Concat(new string[]
			{
				textdump_string,
				"XP = ",
				globals.previous_xp.ToString(),
				" => ",
				globals.current_xp.ToString(),
				"\n"
			});
		}
		if (data.HasField("sf") && playerDeviceClass != null)
		{
			playerDeviceClass.sf_rep_from_toy(data["sf"]);
		}
		if (data.HasField("vol"))
		{
			globals.gear_volume = (int)data["vol"].n;
		}
		List<string> list = new List<string>();
		if (this.connected_device_data)
		{
			list = this.connected_device_data.unlocks;
		}
		globals.textdump_string += "Prev Unlocks = ";
		for (int i = 0; i < list.Count; i++)
		{
			globals.textdump_string = globals.textdump_string + list[i] + ", ";
		}
		globals.textdump_string += "\n";
		this.add_unlock("VC");
		globals.textdump_string += "Unlocks = VC, ";
		if (data.HasField("TIPPROWLERON") && data["TIPPROWLERON"].b)
		{
			this.add_unlock("TIPPROWLERON");
			globals.textdump_string += "TIPPROWLERON, ";
		}
		for (int j = 0; j < data.list.Count; j++)
		{
			if (data.keys[j].Substring(0, 2) == "u." && data.list[j].b)
			{
				this.add_unlock(data.keys[j].Substring(2));
				globals.textdump_string = globals.textdump_string + data.keys[j].Substring(2) + ", ";
			}
			else if (data.keys[j] == "Telaser" && data.list[j].b)
			{
				if (!list.Contains("IMShield") && (!this.connected_device_data || this.connected_device_data.type != 2111))
				{
					globals.add_new_ability("IMShield");
				}
				this.add_unlock("IMShield");
				globals.textdump_string += "IMShield, ";
			}
		}
		globals.textdump_string += " | ";
		if (data.HasField("abil") && data["abil"].IsArray)
		{
			for (int k = 0; k < data["abil"].Count; k++)
			{
				string text = data["abil"][k].str;
				if (this.connected_device_data && this.connected_device_data.type == 2111 && !text.Contains("Hulk."))
				{
					text = "Hulk." + text;
				}
				if (!list.Contains(text) && globals.database_data.item_by_id(text, true))
				{
					if (text != "HomMis")
					{
						globals.add_new_ability(text);
					}
					this.add_unlock(text);
					globals.textdump_string = globals.textdump_string + "[ffff00]" + text + "[-], ";
				}
				else
				{
					globals.textdump_string = globals.textdump_string + text + ", ";
				}
			}
		}
		globals.textdump_string += "\n";
		globals.textdump_string += "[-]";
		this.saveData(true, false);
		AchievementEvents.inst.on_plr_dev_change(playerDeviceClass);
	}

	// Token: 0x06000FD0 RID: 4048 RVA: 0x00070470 File Offset: 0x0006E670
	public void OnDeviceInfoAll(JSONObject data)
	{
		globals.debug("OnDeviceInfoAll " + data.Print(false));
		this.deviceInfoAll = DeviceInfoAll.fromJSON(data);
		bool flag = false;
		foreach (KeyValuePair<int, DeviceInfoAll> keyValuePair in this.deviceInfoAll)
		{
			if (!this.mDevices.ContainsKey(keyValuePair.Key))
			{
				PlayerDeviceClass playerDeviceClass = new PlayerDeviceClass();
				playerDeviceClass.id = keyValuePair.Key;
				playerDeviceClass.firmwareVersion = Convert.ToString(this.deviceInfoAll[keyValuePair.Key].availableFirmwareVersion);
				playerDeviceClass.type = this.deviceInfoAll[keyValuePair.Key].deviceType;
				DBItemClass dbitemClass = globals.database_data.item_by_id(playerDeviceClass.type.ToString(), true);
				if (dbitemClass)
				{
					playerDeviceClass.nickname = dbitemClass.name;
				}
				else
				{
					playerDeviceClass.nickname = "New Gear";
				}
				this.mDevices.Add(keyValuePair.Key, playerDeviceClass);
				this.updateRegisterflag(keyValuePair.Key, true);
				flag = true;
			}
			else if (this.mDevices.ContainsKey(keyValuePair.Key) && !this.mDevices[keyValuePair.Key].isRegister)
			{
				globals.debug("if some how this flag is off. turn this on");
				this.updateRegisterflag(keyValuePair.Key, true);
				flag = true;
			}
		}
		List<int> list = new List<int>(this.mDevices.Keys);
		foreach (int num in list)
		{
			if (!this.deviceInfoAll.ContainsKey(num))
			{
				globals.debug("hiding this device " + num);
				this.updateRegisterflag(num, false);
				flag = true;
			}
		}
		if (flag)
		{
			this.saveData(true, false);
		}
	}

	// Token: 0x06000FD1 RID: 4049 RVA: 0x000706B4 File Offset: 0x0006E8B4
	public void clearFirmwareflags()
	{
		if (this.firmwareUpdateStarted)
		{
			this.firmwareUpdateStarted = false;
			this.firmwareUpdateFinished = true;
			this.saveData(false, false);
		}
	}

	// Token: 0x04000FCC RID: 4044
	private const string _shield_unlock = "Telaser";

	// Token: 0x04000FCD RID: 4045
	private const string _shield_ID = "IMShield";

	// Token: 0x04000FCE RID: 4046
	public PlayerState mPlayerState;

	// Token: 0x04000FCF RID: 4047
	public string firmwareToDownload;

	// Token: 0x04000FD0 RID: 4048
	public string display_name;

	// Token: 0x04000FD1 RID: 4049
	public string avatar = "327";

	// Token: 0x04000FD2 RID: 4050
	private string mId = string.Empty;

	// Token: 0x04000FD3 RID: 4051
	private string mLToken;

	// Token: 0x04000FD4 RID: 4052
	private string mRToken;

	// Token: 0x04000FD5 RID: 4053
	private Dictionary<int, int> mTypeCounts = new Dictionary<int, int>();

	// Token: 0x04000FD6 RID: 4054
	private Dictionary<int, PlayerDeviceClass> mDevices = new Dictionary<int, PlayerDeviceClass>();

	// Token: 0x04000FD7 RID: 4055
	private List<string> mEntitlements = new List<string>();

	// Token: 0x04000FD8 RID: 4056
	public Constants.ContentDownLoadState missionDownloadProgressState;

	// Token: 0x04000FD9 RID: 4057
	public Constants.FirmwareDownLoadState firmwareDownloadProgressState;

	// Token: 0x04000FDA RID: 4058
	public bool firmwareUpdateStarted;

	// Token: 0x04000FDB RID: 4059
	public bool firmwareUpdateFinished = true;

	// Token: 0x04000FDC RID: 4060
	public string firmwarefwpFilename;

	// Token: 0x04000FDD RID: 4061
	public Dictionary<string, List<int>> mAvailablePatch = new Dictionary<string, List<int>>();

	// Token: 0x04000FDE RID: 4062
	private List<string> mTestfired = new List<string>();

	// Token: 0x04000FDF RID: 4063
	private List<string> mAchievements = new List<string>();

	// Token: 0x04000FE0 RID: 4064
	public Dictionary<int, int> enemies_killed = new Dictionary<int, int>();

	// Token: 0x04000FE1 RID: 4065
	private bool mShowScavengerHunt;

	// Token: 0x04000FE2 RID: 4066
	private Dictionary<int, int> mScavengerHuntData = new Dictionary<int, int>();

	// Token: 0x04000FE3 RID: 4067
	public Dictionary<int, DeviceInfoAll> deviceInfoAll = new Dictionary<int, DeviceInfoAll>();
}
