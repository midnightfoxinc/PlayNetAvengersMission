using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000DC RID: 220
public static class Localization
{
	// Token: 0x17000078 RID: 120
	// (get) Token: 0x060005B6 RID: 1462 RVA: 0x00026B78 File Offset: 0x00024D78
	// (set) Token: 0x060005B7 RID: 1463 RVA: 0x00026BAC File Offset: 0x00024DAC
	public static Dictionary<string, string[]> dictionary
	{
		get
		{
			if (!Localization.localizationHasBeenSet)
			{
				Localization.LoadDictionary(PlayerPrefs.GetString("Language", "English"));
			}
			return Localization.mDictionary;
		}
		set
		{
			Localization.localizationHasBeenSet = (value != null);
			Localization.mDictionary = value;
		}
	}

	// Token: 0x17000079 RID: 121
	// (get) Token: 0x060005B8 RID: 1464 RVA: 0x00026BC0 File Offset: 0x00024DC0
	public static string[] knownLanguages
	{
		get
		{
			if (!Localization.localizationHasBeenSet)
			{
				Localization.LoadDictionary(PlayerPrefs.GetString("Language", "English"));
			}
			return Localization.mLanguages;
		}
	}

	// Token: 0x1700007A RID: 122
	// (get) Token: 0x060005B9 RID: 1465 RVA: 0x00026BF4 File Offset: 0x00024DF4
	// (set) Token: 0x060005BA RID: 1466 RVA: 0x00026C2C File Offset: 0x00024E2C
	public static string language
	{
		get
		{
			if (string.IsNullOrEmpty(Localization.mLanguage))
			{
				Localization.mLanguage = PlayerPrefs.GetString("Language", "English");
				Localization.LoadAndSelect(Localization.mLanguage);
			}
			return Localization.mLanguage;
		}
		set
		{
			if (Localization.mLanguage != value)
			{
				Localization.mLanguage = value;
				Localization.LoadAndSelect(value);
			}
		}
	}

	// Token: 0x060005BB RID: 1467 RVA: 0x00026C4C File Offset: 0x00024E4C
	private static bool LoadDictionary(string value)
	{
		byte[] array = null;
		if (!Localization.localizationHasBeenSet)
		{
			if (Localization.loadFunction == null)
			{
				TextAsset textAsset = Resources.Load<TextAsset>("Localization");
				if (textAsset != null)
				{
					array = textAsset.bytes;
				}
			}
			else
			{
				array = Localization.loadFunction("Localization");
			}
			Localization.localizationHasBeenSet = true;
		}
		if (Localization.LoadCSV(array, false))
		{
			return true;
		}
		if (string.IsNullOrEmpty(value))
		{
			value = Localization.mLanguage;
		}
		if (string.IsNullOrEmpty(value))
		{
			return false;
		}
		if (Localization.loadFunction == null)
		{
			TextAsset textAsset2 = Resources.Load<TextAsset>(value);
			if (textAsset2 != null)
			{
				array = textAsset2.bytes;
			}
		}
		else
		{
			array = Localization.loadFunction(value);
		}
		if (array != null)
		{
			Localization.Set(value, array);
			return true;
		}
		return false;
	}

	// Token: 0x060005BC RID: 1468 RVA: 0x00026D1C File Offset: 0x00024F1C
	private static bool LoadAndSelect(string value)
	{
		if (!string.IsNullOrEmpty(value))
		{
			if (Localization.mDictionary.Count == 0 && !Localization.LoadDictionary(value))
			{
				return false;
			}
			if (Localization.SelectLanguage(value))
			{
				return true;
			}
		}
		if (Localization.mOldDictionary.Count > 0)
		{
			return true;
		}
		Localization.mOldDictionary.Clear();
		Localization.mDictionary.Clear();
		if (string.IsNullOrEmpty(value))
		{
			PlayerPrefs.DeleteKey("Language");
		}
		return false;
	}

	// Token: 0x060005BD RID: 1469 RVA: 0x00026D9C File Offset: 0x00024F9C
	public static void Load(TextAsset asset)
	{
		ByteReader byteReader = new ByteReader(asset);
		Localization.Set(asset.name, byteReader.ReadDictionary());
	}

	// Token: 0x060005BE RID: 1470 RVA: 0x00026DC4 File Offset: 0x00024FC4
	public static void Set(string languageName, byte[] bytes)
	{
		ByteReader byteReader = new ByteReader(bytes);
		Localization.Set(languageName, byteReader.ReadDictionary());
	}

	// Token: 0x060005BF RID: 1471 RVA: 0x00026DE4 File Offset: 0x00024FE4
	public static void ReplaceKey(string key, string val)
	{
		if (!string.IsNullOrEmpty(val))
		{
			Localization.mReplacement[key] = val;
		}
		else
		{
			Localization.mReplacement.Remove(key);
		}
	}

	// Token: 0x060005C0 RID: 1472 RVA: 0x00026E1C File Offset: 0x0002501C
	public static void ClearReplacements()
	{
		Localization.mReplacement.Clear();
	}

	// Token: 0x060005C1 RID: 1473 RVA: 0x00026E28 File Offset: 0x00025028
	public static bool LoadCSV(TextAsset asset, bool merge = false)
	{
		return Localization.LoadCSV(asset.bytes, asset, merge);
	}

	// Token: 0x060005C2 RID: 1474 RVA: 0x00026E38 File Offset: 0x00025038
	public static bool LoadCSV(byte[] bytes, bool merge = false)
	{
		return Localization.LoadCSV(bytes, null, merge);
	}

	// Token: 0x060005C3 RID: 1475 RVA: 0x00026E44 File Offset: 0x00025044
	private static bool HasLanguage(string languageName)
	{
		int i = 0;
		int num = Localization.mLanguages.Length;
		while (i < num)
		{
			if (Localization.mLanguages[i] == languageName)
			{
				return true;
			}
			i++;
		}
		return false;
	}

	// Token: 0x060005C4 RID: 1476 RVA: 0x00026E80 File Offset: 0x00025080
	private static bool LoadCSV(byte[] bytes, TextAsset asset, bool merge = false)
	{
		if (bytes == null)
		{
			return false;
		}
		ByteReader byteReader = new ByteReader(bytes);
		BetterList<string> betterList = byteReader.ReadCSV();
		if (betterList.size < 2)
		{
			return false;
		}
		betterList.RemoveAt(0);
		string[] array = null;
		if (string.IsNullOrEmpty(Localization.mLanguage))
		{
			Localization.localizationHasBeenSet = false;
		}
		if (!Localization.localizationHasBeenSet || (!merge && !Localization.mMerging) || Localization.mLanguages == null || Localization.mLanguages.Length == 0)
		{
			Localization.mDictionary.Clear();
			Localization.mLanguages = new string[betterList.size];
			if (!Localization.localizationHasBeenSet)
			{
				Localization.mLanguage = PlayerPrefs.GetString("Language", betterList[0]);
				Localization.localizationHasBeenSet = true;
			}
			for (int i = 0; i < betterList.size; i++)
			{
				Localization.mLanguages[i] = betterList[i];
				if (Localization.mLanguages[i] == Localization.mLanguage)
				{
					Localization.mLanguageIndex = i;
				}
			}
		}
		else
		{
			array = new string[betterList.size];
			for (int j = 0; j < betterList.size; j++)
			{
				array[j] = betterList[j];
			}
			for (int k = 0; k < betterList.size; k++)
			{
				if (!Localization.HasLanguage(betterList[k]))
				{
					int num = Localization.mLanguages.Length + 1;
					Array.Resize<string>(ref Localization.mLanguages, num);
					Localization.mLanguages[num - 1] = betterList[k];
					Dictionary<string, string[]> dictionary = new Dictionary<string, string[]>();
					foreach (KeyValuePair<string, string[]> keyValuePair in Localization.mDictionary)
					{
						string[] value = keyValuePair.Value;
						Array.Resize<string>(ref value, num);
						value[num - 1] = value[0];
						dictionary.Add(keyValuePair.Key, value);
					}
					Localization.mDictionary = dictionary;
				}
			}
		}
		Dictionary<string, int> dictionary2 = new Dictionary<string, int>();
		for (int l = 0; l < Localization.mLanguages.Length; l++)
		{
			dictionary2.Add(Localization.mLanguages[l], l);
		}
		for (;;)
		{
			BetterList<string> betterList2 = byteReader.ReadCSV();
			if (betterList2 == null || betterList2.size == 0)
			{
				break;
			}
			if (!string.IsNullOrEmpty(betterList2[0]))
			{
				Localization.AddCSV(betterList2, array, dictionary2);
			}
		}
		if (!Localization.mMerging && Localization.onLocalize != null)
		{
			Localization.mMerging = true;
			Localization.OnLocalizeNotification onLocalizeNotification = Localization.onLocalize;
			Localization.onLocalize = null;
			onLocalizeNotification();
			Localization.onLocalize = onLocalizeNotification;
			Localization.mMerging = false;
		}
		return true;
	}

	// Token: 0x060005C5 RID: 1477 RVA: 0x00027158 File Offset: 0x00025358
	private static void AddCSV(BetterList<string> newValues, string[] newLanguages, Dictionary<string, int> languageIndices)
	{
		if (newValues.size < 2)
		{
			return;
		}
		string text = newValues[0];
		if (string.IsNullOrEmpty(text))
		{
			return;
		}
		string[] array = Localization.ExtractStrings(newValues, newLanguages, languageIndices);
		if (Localization.mDictionary.ContainsKey(text))
		{
			Localization.mDictionary[text] = array;
			if (newLanguages == null)
			{
				Debug.LogWarning("Localization key '" + text + "' is already present");
			}
		}
		else
		{
			try
			{
				Localization.mDictionary.Add(text, array);
			}
			catch (Exception ex)
			{
				Debug.LogError("Unable to add '" + text + "' to the Localization dictionary.\n" + ex.Message);
			}
		}
	}

	// Token: 0x060005C6 RID: 1478 RVA: 0x0002721C File Offset: 0x0002541C
	private static string[] ExtractStrings(BetterList<string> added, string[] newLanguages, Dictionary<string, int> languageIndices)
	{
		if (newLanguages == null)
		{
			string[] array = new string[Localization.mLanguages.Length];
			int i = 1;
			int num = Mathf.Min(added.size, array.Length + 1);
			while (i < num)
			{
				array[i - 1] = added[i];
				i++;
			}
			return array;
		}
		string text = added[0];
		string[] array2;
		if (!Localization.mDictionary.TryGetValue(text, ref array2))
		{
			array2 = new string[Localization.mLanguages.Length];
		}
		int j = 0;
		int num2 = newLanguages.Length;
		while (j < num2)
		{
			string text2 = newLanguages[j];
			int num3 = languageIndices[text2];
			array2[num3] = added[j + 1];
			j++;
		}
		return array2;
	}

	// Token: 0x060005C7 RID: 1479 RVA: 0x000272D4 File Offset: 0x000254D4
	private static bool SelectLanguage(string language)
	{
		Localization.mLanguageIndex = -1;
		if (Localization.mDictionary.Count == 0)
		{
			return false;
		}
		int i = 0;
		int num = Localization.mLanguages.Length;
		while (i < num)
		{
			if (Localization.mLanguages[i] == language)
			{
				Localization.mOldDictionary.Clear();
				Localization.mLanguageIndex = i;
				Localization.mLanguage = language;
				PlayerPrefs.SetString("Language", Localization.mLanguage);
				if (Localization.onLocalize != null)
				{
					Localization.onLocalize();
				}
				UIRoot.Broadcast("OnLocalize");
				return true;
			}
			i++;
		}
		return false;
	}

	// Token: 0x060005C8 RID: 1480 RVA: 0x0002736C File Offset: 0x0002556C
	public static void Set(string languageName, Dictionary<string, string> dictionary)
	{
		Localization.mLanguage = languageName;
		PlayerPrefs.SetString("Language", Localization.mLanguage);
		Localization.mOldDictionary = dictionary;
		Localization.localizationHasBeenSet = true;
		Localization.mLanguageIndex = -1;
		Localization.mLanguages = new string[]
		{
			languageName
		};
		if (Localization.onLocalize != null)
		{
			Localization.onLocalize();
		}
		UIRoot.Broadcast("OnLocalize");
	}

	// Token: 0x060005C9 RID: 1481 RVA: 0x000273D0 File Offset: 0x000255D0
	public static void Set(string key, string value)
	{
		if (Localization.mOldDictionary.ContainsKey(key))
		{
			Localization.mOldDictionary[key] = value;
		}
		else
		{
			Localization.mOldDictionary.Add(key, value);
		}
	}

	// Token: 0x060005CA RID: 1482 RVA: 0x00027400 File Offset: 0x00025600
	public static string Get(string key)
	{
		if (string.IsNullOrEmpty(key))
		{
			return null;
		}
		if (!Localization.localizationHasBeenSet)
		{
			Localization.LoadDictionary(PlayerPrefs.GetString("Language", "English"));
		}
		if (Localization.mLanguages == null)
		{
			Debug.LogError("No localization data present");
			return null;
		}
		string language = Localization.language;
		if (Localization.mLanguageIndex == -1)
		{
			for (int i = 0; i < Localization.mLanguages.Length; i++)
			{
				if (Localization.mLanguages[i] == language)
				{
					Localization.mLanguageIndex = i;
					break;
				}
			}
		}
		if (Localization.mLanguageIndex == -1)
		{
			Localization.mLanguageIndex = 0;
			Localization.mLanguage = Localization.mLanguages[0];
			Debug.LogWarning("Language not found: " + language);
		}
		UICamera.ControlScheme currentScheme = UICamera.currentScheme;
		string result;
		string[] array;
		if (currentScheme == UICamera.ControlScheme.Touch)
		{
			string text = key + " Mobile";
			if (Localization.mReplacement.TryGetValue(text, ref result))
			{
				return result;
			}
			if (Localization.mLanguageIndex != -1 && Localization.mDictionary.TryGetValue(text, ref array) && Localization.mLanguageIndex < array.Length)
			{
				return array[Localization.mLanguageIndex];
			}
			if (Localization.mOldDictionary.TryGetValue(text, ref result))
			{
				return result;
			}
		}
		else if (currentScheme == UICamera.ControlScheme.Controller)
		{
			string text2 = key + " Controller";
			if (Localization.mReplacement.TryGetValue(text2, ref result))
			{
				return result;
			}
			if (Localization.mLanguageIndex != -1 && Localization.mDictionary.TryGetValue(text2, ref array) && Localization.mLanguageIndex < array.Length)
			{
				return array[Localization.mLanguageIndex];
			}
			if (Localization.mOldDictionary.TryGetValue(text2, ref result))
			{
				return result;
			}
		}
		if (Localization.mReplacement.TryGetValue(key, ref result))
		{
			return result;
		}
		if (Localization.mLanguageIndex != -1 && Localization.mDictionary.TryGetValue(key, ref array))
		{
			if (Localization.mLanguageIndex < array.Length)
			{
				string text3 = array[Localization.mLanguageIndex];
				if (string.IsNullOrEmpty(text3))
				{
					text3 = array[0];
				}
				return text3;
			}
			return array[0];
		}
		else
		{
			if (Localization.mOldDictionary.TryGetValue(key, ref result))
			{
				return result;
			}
			return key;
		}
	}

	// Token: 0x060005CB RID: 1483 RVA: 0x00027628 File Offset: 0x00025828
	public static string Format(string key, params object[] parameters)
	{
		return string.Format(Localization.Get(key), parameters);
	}

	// Token: 0x1700007B RID: 123
	// (get) Token: 0x060005CC RID: 1484 RVA: 0x00027638 File Offset: 0x00025838
	[Obsolete("Localization is now always active. You no longer need to check this property.")]
	public static bool isActive
	{
		get
		{
			return true;
		}
	}

	// Token: 0x060005CD RID: 1485 RVA: 0x0002763C File Offset: 0x0002583C
	[Obsolete("Use Localization.Get instead")]
	public static string Localize(string key)
	{
		return Localization.Get(key);
	}

	// Token: 0x060005CE RID: 1486 RVA: 0x00027644 File Offset: 0x00025844
	public static bool Exists(string key)
	{
		if (!Localization.localizationHasBeenSet)
		{
			Localization.language = PlayerPrefs.GetString("Language", "English");
		}
		string text = key + " Mobile";
		return Localization.mDictionary.ContainsKey(text) || Localization.mOldDictionary.ContainsKey(text) || Localization.mDictionary.ContainsKey(key) || Localization.mOldDictionary.ContainsKey(key);
	}

	// Token: 0x060005CF RID: 1487 RVA: 0x000276C0 File Offset: 0x000258C0
	public static void Set(string language, string key, string text)
	{
		string[] knownLanguages = Localization.knownLanguages;
		if (knownLanguages == null)
		{
			Localization.mLanguages = new string[]
			{
				language
			};
			knownLanguages = Localization.mLanguages;
		}
		int i = 0;
		int num = knownLanguages.Length;
		while (i < num)
		{
			if (knownLanguages[i] == language)
			{
				string[] array;
				if (!Localization.mDictionary.TryGetValue(key, ref array))
				{
					array = new string[knownLanguages.Length];
					Localization.mDictionary[key] = array;
					array[0] = text;
				}
				array[i] = text;
				return;
			}
			i++;
		}
		int num2 = Localization.mLanguages.Length + 1;
		Array.Resize<string>(ref Localization.mLanguages, num2);
		Localization.mLanguages[num2 - 1] = language;
		Dictionary<string, string[]> dictionary = new Dictionary<string, string[]>();
		foreach (KeyValuePair<string, string[]> keyValuePair in Localization.mDictionary)
		{
			string[] value = keyValuePair.Value;
			Array.Resize<string>(ref value, num2);
			value[num2 - 1] = value[0];
			dictionary.Add(keyValuePair.Key, value);
		}
		Localization.mDictionary = dictionary;
		string[] array2;
		if (!Localization.mDictionary.TryGetValue(key, ref array2))
		{
			array2 = new string[knownLanguages.Length];
			Localization.mDictionary[key] = array2;
			array2[0] = text;
		}
		array2[num2 - 1] = text;
	}

	// Token: 0x04000608 RID: 1544
	public static Localization.LoadFunction loadFunction;

	// Token: 0x04000609 RID: 1545
	public static Localization.OnLocalizeNotification onLocalize;

	// Token: 0x0400060A RID: 1546
	public static bool localizationHasBeenSet = false;

	// Token: 0x0400060B RID: 1547
	private static string[] mLanguages = null;

	// Token: 0x0400060C RID: 1548
	private static Dictionary<string, string> mOldDictionary = new Dictionary<string, string>();

	// Token: 0x0400060D RID: 1549
	private static Dictionary<string, string[]> mDictionary = new Dictionary<string, string[]>();

	// Token: 0x0400060E RID: 1550
	private static Dictionary<string, string> mReplacement = new Dictionary<string, string>();

	// Token: 0x0400060F RID: 1551
	private static int mLanguageIndex = -1;

	// Token: 0x04000610 RID: 1552
	private static string mLanguage;

	// Token: 0x04000611 RID: 1553
	private static bool mMerging = false;

	// Token: 0x0200033F RID: 831
	// (Invoke) Token: 0x0600151E RID: 5406
	public delegate byte[] LoadFunction(string path);

	// Token: 0x02000340 RID: 832
	// (Invoke) Token: 0x06001522 RID: 5410
	public delegate void OnLocalizeNotification();
}
