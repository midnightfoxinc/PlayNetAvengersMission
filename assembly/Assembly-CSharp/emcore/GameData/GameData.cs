using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace emcore.GameData
{
	// Token: 0x0200026F RID: 623
	public class GameData
	{
		// Token: 0x060010C3 RID: 4291 RVA: 0x00077F48 File Offset: 0x00076148
		public GameData()
		{
			this.init();
		}

		// Token: 0x060010C4 RID: 4292 RVA: 0x00077FDC File Offset: 0x000761DC
		public static GameData getInstance()
		{
			if (GameData.instance == null)
			{
				GameData.instance = new GameData();
			}
			return GameData.instance;
		}

		// Token: 0x060010C5 RID: 4293 RVA: 0x00077FF8 File Offset: 0x000761F8
		public bool hasAbility(int cname)
		{
			return this.abilities.ContainsKey(cname);
		}

		// Token: 0x060010C6 RID: 4294 RVA: 0x00078008 File Offset: 0x00076208
		public Ability getAbility(int cname)
		{
			if (!this.abilities.ContainsKey(cname))
			{
				return null;
			}
			return this.abilities[cname];
		}

		// Token: 0x060010C7 RID: 4295 RVA: 0x0007802C File Offset: 0x0007622C
		public Ability getAbility(string toyid)
		{
			foreach (KeyValuePair<int, Ability> keyValuePair in this.abilities)
			{
				if (keyValuePair.Value.toyid == toyid)
				{
					return keyValuePair.Value;
				}
			}
			return null;
		}

		// Token: 0x060010C8 RID: 4296 RVA: 0x000780B4 File Offset: 0x000762B4
		public bool hasCampaign(int cid)
		{
			return this.campaigns.ContainsKey(cid);
		}

		// Token: 0x060010C9 RID: 4297 RVA: 0x000780C4 File Offset: 0x000762C4
		public Campaign getCampaign(int cid)
		{
			if (!this.campaigns.ContainsKey(cid))
			{
				return null;
			}
			return this.campaigns[cid];
		}

		// Token: 0x060010CA RID: 4298 RVA: 0x000780E8 File Offset: 0x000762E8
		public bool hasCharacter(int cid)
		{
			return this.characters.ContainsKey(cid);
		}

		// Token: 0x060010CB RID: 4299 RVA: 0x000780F8 File Offset: 0x000762F8
		public Character getCharacter(int cid)
		{
			if (!this.characters.ContainsKey(cid))
			{
				return null;
			}
			return this.characters[cid];
		}

		// Token: 0x060010CC RID: 4300 RVA: 0x0007811C File Offset: 0x0007631C
		public bool hasDevice(string cname)
		{
			return this.devices.ContainsKey(cname);
		}

		// Token: 0x060010CD RID: 4301 RVA: 0x0007812C File Offset: 0x0007632C
		public Device getDevice(string cname)
		{
			if (!this.devices.ContainsKey(cname))
			{
				return null;
			}
			return this.devices[cname];
		}

		// Token: 0x060010CE RID: 4302 RVA: 0x00078150 File Offset: 0x00076350
		public bool hasEnvironment(int cid)
		{
			return this.environments.ContainsKey(cid);
		}

		// Token: 0x060010CF RID: 4303 RVA: 0x00078160 File Offset: 0x00076360
		public Environment getEnvironment(int cid)
		{
			if (!this.environments.ContainsKey(cid))
			{
				return null;
			}
			return this.environments[cid];
		}

		// Token: 0x060010D0 RID: 4304 RVA: 0x00078184 File Offset: 0x00076384
		public bool hasIngredient(int cid)
		{
			return this.ingredients.ContainsKey(cid);
		}

		// Token: 0x060010D1 RID: 4305 RVA: 0x00078194 File Offset: 0x00076394
		public Ingredient getIngredient(int cid)
		{
			if (!this.ingredients.ContainsKey(cid))
			{
				return null;
			}
			return this.ingredients[cid];
		}

		// Token: 0x060010D2 RID: 4306 RVA: 0x000781B8 File Offset: 0x000763B8
		public bool hasMission(int cid)
		{
			return this.missions.ContainsKey(cid);
		}

		// Token: 0x060010D3 RID: 4307 RVA: 0x000781C8 File Offset: 0x000763C8
		public Mission getMission(int cid)
		{
			if (!this.missions.ContainsKey(cid))
			{
				return null;
			}
			return this.missions[cid];
		}

		// Token: 0x060010D4 RID: 4308 RVA: 0x000781EC File Offset: 0x000763EC
		public bool hasNews(string section)
		{
			return this.news.ContainsKey(section);
		}

		// Token: 0x060010D5 RID: 4309 RVA: 0x000781FC File Offset: 0x000763FC
		public List<News> getNews(string section)
		{
			if (!this.news.ContainsKey(section))
			{
				return null;
			}
			return this.news[section];
		}

		// Token: 0x060010D6 RID: 4310 RVA: 0x00078220 File Offset: 0x00076420
		public PlayerRank getPlayerRank(int goldMedalCount)
		{
			if (this.playerRanks.Count == 0)
			{
				return null;
			}
			PlayerRank playerRank = new PlayerRank();
			playerRank.gmedals = goldMedalCount;
			int num = this.playerRanks.BinarySearch(playerRank);
			if (num < 0)
			{
				num = ((~num <= 0) ? 0 : (~num - 1));
			}
			return this.playerRanks[num];
		}

		// Token: 0x060010D7 RID: 4311 RVA: 0x00078280 File Offset: 0x00076480
		public bool hasUpgrade(string cname)
		{
			return this.upgrades.ContainsKey(cname);
		}

		// Token: 0x060010D8 RID: 4312 RVA: 0x00078290 File Offset: 0x00076490
		public Upgrade getUpgrade(string cname)
		{
			if (!this.upgrades.ContainsKey(cname))
			{
				return null;
			}
			return this.upgrades[cname];
		}

		// Token: 0x060010D9 RID: 4313 RVA: 0x000782B4 File Offset: 0x000764B4
		public Dictionary<int, Mission> getMissionsForCampaign(int campaign)
		{
			Dictionary<int, Mission> dictionary = new Dictionary<int, Mission>();
			foreach (KeyValuePair<int, Mission> keyValuePair in this.missions)
			{
				if (keyValuePair.Value.camp == campaign)
				{
					dictionary.Add(keyValuePair.Key, keyValuePair.Value);
				}
			}
			return dictionary;
		}

		// Token: 0x060010DA RID: 4314 RVA: 0x00078340 File Offset: 0x00076540
		private void init()
		{
			Resources.UnloadUnusedAssets();
		}

		// Token: 0x060010DB RID: 4315 RVA: 0x00078348 File Offset: 0x00076548
		public JSONObject readFromStorage(string filename)
		{
			JSONObject result;
			try
			{
				if (!File.Exists(Application.persistentDataPath + Path.DirectorySeparatorChar + filename))
				{
					result = null;
				}
				else
				{
					StreamReader streamReader = new StreamReader(Application.persistentDataPath + Path.DirectorySeparatorChar + filename);
					string str = streamReader.ReadToEnd();
					streamReader.Close();
					JSONObject jsonobject = new JSONObject(str, -2, false, false);
					result = jsonobject;
				}
			}
			catch (Exception log)
			{
				globals.debugException(log);
				result = null;
			}
			return result;
		}

		// Token: 0x060010DC RID: 4316 RVA: 0x000783F0 File Offset: 0x000765F0
		public DateTime lastWriteTimeOfFile(string filename)
		{
			if (!File.Exists(Application.persistentDataPath + Path.DirectorySeparatorChar + filename))
			{
				return DateTime.FromOADate(0.0);
			}
			return File.GetLastWriteTime(Application.persistentDataPath + Path.DirectorySeparatorChar + filename);
		}

		// Token: 0x060010DD RID: 4317 RVA: 0x00078448 File Offset: 0x00076648
		public JSONObject readFromResources(string filename)
		{
			TextAsset textAsset = (TextAsset)Resources.Load(filename);
			return new JSONObject(textAsset.text, -2, false, false);
		}

		// Token: 0x060010DE RID: 4318 RVA: 0x00078474 File Offset: 0x00076674
		public bool saveToStorage(string filename, JSONObject j, bool safeSave = false)
		{
			StreamWriter streamWriter = null;
			string text = string.Concat(new object[]
			{
				Application.persistentDataPath,
				Path.DirectorySeparatorChar,
				filename,
				".json"
			});
			string text2 = string.Concat(new object[]
			{
				Application.persistentDataPath,
				Path.DirectorySeparatorChar,
				filename,
				"-backup.json"
			});
			try
			{
				if (File.Exists(text))
				{
					if (safeSave)
					{
						globals.safeFileMove(text, text2);
					}
					else
					{
						File.Delete(text);
					}
				}
				string text3 = j.Print(false);
				globals.debug("Write to: " + text);
				streamWriter = new StreamWriter(text);
				streamWriter.Write(text3);
				streamWriter.Close();
				streamWriter = null;
				if (this.fileTimeStamps.ContainsKey(filename))
				{
					this.fileTimeStamps[filename] = this.lastWriteTimeOfFile(filename + ".json");
				}
				else
				{
					this.fileTimeStamps.Add(filename, this.lastWriteTimeOfFile(filename + ".json"));
				}
				if (safeSave && File.Exists(text2))
				{
					File.Delete(text2);
				}
			}
			catch (Exception log)
			{
				globals.debugException(log);
				if (streamWriter != null)
				{
					try
					{
						streamWriter.Close();
					}
					catch (Exception log2)
					{
						globals.debugException(log2);
					}
				}
				try
				{
					if (safeSave)
					{
						globals.safeFileMove(text2, text);
					}
				}
				catch (Exception log3)
				{
					globals.debug("Safe Save failed, may have corrupted file: " + text);
					globals.debugException(log3);
				}
				return false;
			}
			return true;
		}

		// Token: 0x060010DF RID: 4319 RVA: 0x00078650 File Offset: 0x00076850
		public static int[] JsonToArray(JSONObject c, string fieldName)
		{
			int[] array;
			if (c.HasField(fieldName) && c[fieldName].IsArray)
			{
				array = new int[c[fieldName].list.Count];
				int num = 0;
				foreach (JSONObject jsonobject in c[fieldName].list)
				{
					array[num++] = (int)jsonobject.n;
				}
			}
			else
			{
				array = new int[0];
			}
			return array;
		}

		// Token: 0x060010E0 RID: 4320 RVA: 0x00078708 File Offset: 0x00076908
		public static void ArrayToJson(JSONObject parent, int[] array, string fieldName)
		{
			if (array != null && array.Length > 0)
			{
				JSONObject jsonobject = new JSONObject(JSONObject.Type.ARRAY);
				for (int i = 0; i < array.Length; i++)
				{
					jsonobject.Add(array[i]);
				}
				parent.AddField(fieldName, jsonobject);
			}
		}

		// Token: 0x0400112E RID: 4398
		public const string ABILITIES_FILENAME = "abilities";

		// Token: 0x0400112F RID: 4399
		public const string CAMPAIGNS_FILENAME = "campaigns";

		// Token: 0x04001130 RID: 4400
		public const string CHARACTERS_FILENAME = "characters";

		// Token: 0x04001131 RID: 4401
		public const string DEVICES_FILENAME = "devices";

		// Token: 0x04001132 RID: 4402
		public const string ENVIRONMENTS_FILENAME = "environments";

		// Token: 0x04001133 RID: 4403
		public const string INGREDIENTS_FILENAME = "ingredients";

		// Token: 0x04001134 RID: 4404
		public const string MISSIONS_FILENAME = "missions";

		// Token: 0x04001135 RID: 4405
		public const string NEWS_FILENAME = "news";

		// Token: 0x04001136 RID: 4406
		public const string PLAYERRANK_FILENAME = "player_rank";

		// Token: 0x04001137 RID: 4407
		public const string UPGRADES_FILENAME = "upgrades";

		// Token: 0x04001138 RID: 4408
		public const string ABILITY_CREATOR_FILENAME = "abilityCreator";

		// Token: 0x04001139 RID: 4409
		public const string BACKUP_SUFFIX = "-backup";

		// Token: 0x0400113A RID: 4410
		private static GameData instance;

		// Token: 0x0400113B RID: 4411
		public Dictionary<int, Ability> abilities = new Dictionary<int, Ability>();

		// Token: 0x0400113C RID: 4412
		public Dictionary<int, Campaign> campaigns = new Dictionary<int, Campaign>();

		// Token: 0x0400113D RID: 4413
		public Dictionary<int, Character> characters = new Dictionary<int, Character>();

		// Token: 0x0400113E RID: 4414
		public Dictionary<string, Device> devices = new Dictionary<string, Device>();

		// Token: 0x0400113F RID: 4415
		public Dictionary<int, Environment> environments = new Dictionary<int, Environment>();

		// Token: 0x04001140 RID: 4416
		public Dictionary<int, Ingredient> ingredients = new Dictionary<int, Ingredient>();

		// Token: 0x04001141 RID: 4417
		public Dictionary<int, Mission> missions = new Dictionary<int, Mission>();

		// Token: 0x04001142 RID: 4418
		public Dictionary<string, List<News>> news = new Dictionary<string, List<News>>();

		// Token: 0x04001143 RID: 4419
		public List<PlayerRank> playerRanks = new List<PlayerRank>();

		// Token: 0x04001144 RID: 4420
		public Dictionary<string, Upgrade> upgrades = new Dictionary<string, Upgrade>();

		// Token: 0x04001145 RID: 4421
		public Dictionary<string, DateTime> fileTimeStamps = new Dictionary<string, DateTime>();
	}
}
