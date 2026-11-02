using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

// Token: 0x02000263 RID: 611
public class Analytics
{
	// Token: 0x06001095 RID: 4245 RVA: 0x00075F44 File Offset: 0x00074144
	private Analytics()
	{
	}

	// Token: 0x170001F6 RID: 502
	// (get) Token: 0x06001096 RID: 4246 RVA: 0x00075F64 File Offset: 0x00074164
	public static Analytics instance
	{
		get
		{
			if (Analytics._instance == null)
			{
				Analytics._instance = new Analytics();
			}
			return Analytics._instance;
		}
	}

	// Token: 0x06001097 RID: 4247 RVA: 0x00075F80 File Offset: 0x00074180
	public void init()
	{
		this.analyticsDir = Application.persistentDataPath;
		string[] array = Directory.GetFiles(this.analyticsDir, "analytics.*");
		for (int i = 0; i < array.Length; i++)
		{
			this.files.AddLast(array[i]);
		}
		this.purgeFiles();
	}

	// Token: 0x06001098 RID: 4248 RVA: 0x00075FD4 File Offset: 0x000741D4
	public bool hasFiles()
	{
		return this.files != null && this.files.Count > 0;
	}

	// Token: 0x06001099 RID: 4249 RVA: 0x00075FF4 File Offset: 0x000741F4
	private void purgeFiles()
	{
		while (this.files.Count > 100)
		{
			this.purgeOldest();
		}
	}

	// Token: 0x0600109A RID: 4250 RVA: 0x00076014 File Offset: 0x00074214
	private void purgeOldest()
	{
		if (this.files.Count == 0)
		{
			return;
		}
		string value = this.files.First.Value;
		this.files.RemoveFirst();
		if (File.Exists(value))
		{
			File.Delete(value);
		}
	}

	// Token: 0x0600109B RID: 4251 RVA: 0x00076060 File Offset: 0x00074260
	public void purgeLoaded()
	{
		if (this.loadedFile == null || this.files.Count == 0)
		{
			return;
		}
		if (this.files.First.Value == this.loadedFile)
		{
			this.purgeOldest();
		}
	}

	// Token: 0x0600109C RID: 4252 RVA: 0x000760B0 File Offset: 0x000742B0
	public void dump()
	{
		string text = "analytics." + DateTime.Now.Ticks / 10000000L;
		string text2 = this.analyticsDir + Path.DirectorySeparatorChar + text;
		if (File.Exists(text2))
		{
			File.Delete(text2);
		}
		StreamWriter streamWriter = null;
		try
		{
			streamWriter = new StreamWriter(text2);
			for (int i = 0; i < this.lines.Count; i++)
			{
				Analytics.AnalyticsLine analyticsLine = (Analytics.AnalyticsLine)this.lines[i];
				streamWriter.WriteLine(analyticsLine.timeStamp.Ticks);
				streamWriter.WriteLine(analyticsLine.data);
			}
			streamWriter.Close();
			streamWriter = null;
			this.lines.Clear();
			this.files.AddLast(text2);
			this.purgeFiles();
		}
		catch (Exception log)
		{
			if (streamWriter != null)
			{
				streamWriter.Close();
			}
			globals.debugException(log);
		}
	}

	// Token: 0x0600109D RID: 4253 RVA: 0x000761C4 File Offset: 0x000743C4
	public void putString(string line)
	{
		Analytics.AnalyticsLine analyticsLine = default(Analytics.AnalyticsLine);
		if (this.lines.Count >= 100)
		{
			this.dump();
		}
		analyticsLine.data = line;
		analyticsLine.timeStamp = DateTime.Now;
		this.lines.Add(analyticsLine);
	}

	// Token: 0x0600109E RID: 4254 RVA: 0x00076218 File Offset: 0x00074418
	public void putJson(JSONObject j)
	{
		this.putString(j.Print(false));
	}

	// Token: 0x0600109F RID: 4255 RVA: 0x00076228 File Offset: 0x00074428
	public void putDictionary(Dictionary<string, string> dataStr, Dictionary<string, int> dataInt, Dictionary<string, bool> dataBool)
	{
		StringBuilder stringBuilder = new StringBuilder(256);
		stringBuilder.Append("{");
		bool flag = true;
		if (dataStr != null)
		{
			foreach (KeyValuePair<string, string> keyValuePair in dataStr)
			{
				if (!flag)
				{
					stringBuilder.Append(',');
				}
				else
				{
					flag = false;
				}
				stringBuilder.Append('"');
				stringBuilder.Append(keyValuePair.Key);
				stringBuilder.Append("\":\"");
				stringBuilder.Append(keyValuePair.Value);
				stringBuilder.Append('"');
			}
		}
		if (dataInt != null)
		{
			foreach (KeyValuePair<string, int> keyValuePair2 in dataInt)
			{
				if (!flag)
				{
					stringBuilder.Append(',');
				}
				else
				{
					flag = false;
				}
				stringBuilder.Append('"');
				stringBuilder.Append(keyValuePair2.Key);
				stringBuilder.Append("\":");
				stringBuilder.Append(keyValuePair2.Value);
			}
		}
		if (dataBool != null)
		{
			foreach (KeyValuePair<string, bool> keyValuePair3 in dataBool)
			{
				if (!flag)
				{
					stringBuilder.Append(',');
				}
				else
				{
					flag = false;
				}
				stringBuilder.Append('"');
				stringBuilder.Append(keyValuePair3.Key);
				stringBuilder.Append("\":");
				stringBuilder.Append(keyValuePair3.Value);
			}
		}
		stringBuilder.Append("}");
		this.putString(stringBuilder.ToString());
	}

	// Token: 0x060010A0 RID: 4256 RVA: 0x0007643C File Offset: 0x0007463C
	public bool hasAnything()
	{
		return this.lines.Count > 0;
	}

	// Token: 0x060010A1 RID: 4257 RVA: 0x0007644C File Offset: 0x0007464C
	public string loadOldest()
	{
		if (this.files == null || this.files.Count == 0)
		{
			globals.debug("No files");
			return null;
		}
		this.loadedFile = this.files.First.Value;
		StreamReader streamReader = null;
		try
		{
			if (!File.Exists(this.loadedFile))
			{
				globals.debug("Loaded file does not exist: " + this.loadedFile);
				return null;
			}
			streamReader = new StreamReader(this.loadedFile);
			StringBuilder stringBuilder = new StringBuilder(32000);
			stringBuilder.Append('[');
			for (int i = 0; i < 100; i++)
			{
				string text = streamReader.ReadLine();
				if (text == null)
				{
					break;
				}
				DateTime dateTime;
				dateTime..ctor(Convert.ToInt64(text));
				string text2 = streamReader.ReadLine();
				if (text2 == null)
				{
					break;
				}
				StringBuilder stringBuilder2 = new StringBuilder(320);
				if (i > 0)
				{
					stringBuilder2.Append(',');
				}
				stringBuilder2.Append("{\"eventId\":\"");
				stringBuilder2.Append(text);
				stringBuilder2.Append('-');
				stringBuilder2.Append(i);
				stringBuilder2.Append("\",\"eventTimestamp\":\"");
				stringBuilder2.Append(dateTime.ToString("yyyy-MM-ddTHH:mm:sszzz"));
				stringBuilder2.Append("\",\"data\":");
				stringBuilder2.Append(text2);
				stringBuilder2.Append('}');
				stringBuilder.Append(stringBuilder2);
			}
			streamReader.Close();
			streamReader = null;
			stringBuilder.Append(']');
			return stringBuilder.ToString();
		}
		catch (Exception log)
		{
			if (streamReader != null)
			{
				streamReader.Close();
			}
			globals.debugException(log);
		}
		globals.debug("Got nowhere");
		return null;
	}

	// Token: 0x040010E9 RID: 4329
	public const int MAX_ANALYTICS_FILES = 100;

	// Token: 0x040010EA RID: 4330
	public const int ANALYTICS_ARRAY_SIZE = 100;

	// Token: 0x040010EB RID: 4331
	public const string ANALYTICS_FILE = "analytics.";

	// Token: 0x040010EC RID: 4332
	public const string iso8601format = "yyyy-MM-ddTHH:mm:sszzz";

	// Token: 0x040010ED RID: 4333
	private static Analytics _instance;

	// Token: 0x040010EE RID: 4334
	private LinkedList<string> files = new LinkedList<string>();

	// Token: 0x040010EF RID: 4335
	private ArrayList lines = new ArrayList(101);

	// Token: 0x040010F0 RID: 4336
	private string analyticsDir;

	// Token: 0x040010F1 RID: 4337
	private string loadedFile;

	// Token: 0x02000264 RID: 612
	private struct AnalyticsLine
	{
		// Token: 0x040010F2 RID: 4338
		public DateTime timeStamp;

		// Token: 0x040010F3 RID: 4339
		public string data;
	}
}
