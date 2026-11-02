using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

// Token: 0x02000009 RID: 9
public class HockeyAppAndroid : MonoBehaviour
{
	// Token: 0x0600007A RID: 122 RVA: 0x000034F8 File Offset: 0x000016F8
	private string Transmorph(string input)
	{
		StringBuilder stringBuilder = new StringBuilder(input.Length);
		for (int i = 0; i < input.Length; i++)
		{
			char c = input.get_Chars(i);
			int num = (int)(c ^ 'ª');
			stringBuilder.Append((char)num);
		}
		return stringBuilder.ToString();
	}

	// Token: 0x0600007B RID: 123 RVA: 0x0000354C File Offset: 0x0000174C
	private void Awake()
	{
		Object.DontDestroyOnLoad(base.gameObject);
		if (!this.manualInit)
		{
			this.init();
		}
	}

	// Token: 0x0600007C RID: 124 RVA: 0x0000356C File Offset: 0x0000176C
	public void init()
	{
		if (this.exceptionLogging && this.IsConnected())
		{
			List<string> logFiles = this.GetLogFiles();
			if (logFiles.Count > 0)
			{
				base.StartCoroutine(this.SendLogs(this.GetLogFiles()));
			}
		}
		string baseURL = this.GetBaseURL();
		Debug.Log("Calling StartCrashManager with appID " + this.appID);
		this.StartCrashManager(baseURL, this.appID, this.updateManager, this.autoUpload);
	}

	// Token: 0x0600007D RID: 125 RVA: 0x000035EC File Offset: 0x000017EC
	public void OnEnable()
	{
		if (this.exceptionLogging)
		{
			AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(this.OnHandleUnresolvedException);
			Application.logMessageReceived += new Application.LogCallback(this.OnHandleLogCallback);
		}
	}

	// Token: 0x0600007E RID: 126 RVA: 0x0000362C File Offset: 0x0000182C
	public void OnDisable()
	{
		Application.logMessageReceived -= new Application.LogCallback(this.OnHandleLogCallback);
	}

	// Token: 0x0600007F RID: 127 RVA: 0x00003640 File Offset: 0x00001840
	private void OnDestroy()
	{
		Application.logMessageReceived -= new Application.LogCallback(this.OnHandleLogCallback);
	}

	// Token: 0x06000080 RID: 128 RVA: 0x00003654 File Offset: 0x00001854
	protected void StartCrashManager(string urlString, string appID, bool updateManagerEnabled, bool autoSendEnabled)
	{
		AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
		AndroidJavaObject @static = androidJavaClass.GetStatic<AndroidJavaObject>("currentActivity");
		AndroidJavaClass androidJavaClass2 = new AndroidJavaClass("net.hockeyapp.unity.HockeyUnityPlugin");
		Debug.LogError("Calling native startHockeyAppManager");
		androidJavaClass2.CallStatic("startHockeyAppManager", new object[]
		{
			@static,
			urlString,
			appID,
			updateManagerEnabled,
			autoSendEnabled
		});
	}

	// Token: 0x06000081 RID: 129 RVA: 0x000036C0 File Offset: 0x000018C0
	private string GetVersion()
	{
		AndroidJavaClass androidJavaClass = new AndroidJavaClass("net.hockeyapp.unity.HockeyUnityPlugin");
		return androidJavaClass.CallStatic<string>("getAppVersion", new object[0]);
	}

	// Token: 0x06000082 RID: 130 RVA: 0x000036F0 File Offset: 0x000018F0
	protected virtual List<string> GetLogHeaders()
	{
		List<string> list = new List<string>();
		list.Add("Package: " + this.packageID);
		string version = this.GetVersion();
		list.Add("Version: " + version);
		string[] array = SystemInfo.operatingSystem.Split(new char[]
		{
			'/'
		});
		string text = "Android: " + array[0].Replace("Android OS ", string.Empty);
		list.Add(text);
		list.Add("Model: " + SystemInfo.deviceModel);
		list.Add("Date: " + DateTime.UtcNow.ToString("ddd MMM dd HH:mm:ss {}zzzz yyyy").Replace("{}", "GMT"));
		return list;
	}

	// Token: 0x06000083 RID: 131 RVA: 0x000037B4 File Offset: 0x000019B4
	protected virtual WWWForm CreateForm(string log)
	{
		WWWForm wwwform = new WWWForm();
		byte[] array = null;
		using (FileStream fileStream = File.OpenRead(log))
		{
			if (fileStream.Length > 199800L)
			{
				string text = null;
				using (StreamReader streamReader = new StreamReader(fileStream))
				{
					streamReader.BaseStream.Seek(fileStream.Length - 199800L, 0);
					text = streamReader.ReadToEnd();
				}
				List<string> logHeaders = this.GetLogHeaders();
				string text2 = string.Empty;
				foreach (string text3 in logHeaders)
				{
					text2 = text2 + text3 + "\n";
				}
				text = text2 + "\n[...]" + text;
				try
				{
					array = Encoding.Default.GetBytes(text);
				}
				catch (ArgumentException ex)
				{
					if (Debug.isDebugBuild)
					{
						Debug.Log("Failed to read bytes of log file: " + ex);
					}
				}
			}
			else
			{
				try
				{
					array = File.ReadAllBytes(log);
				}
				catch (SystemException ex2)
				{
					if (Debug.isDebugBuild)
					{
						Debug.Log("Failed to read bytes of log file: " + ex2);
					}
				}
			}
		}
		if (array != null)
		{
			wwwform.AddBinaryData("log", array, log, "text/plain");
		}
		return wwwform;
	}

	// Token: 0x06000084 RID: 132 RVA: 0x00003994 File Offset: 0x00001B94
	protected virtual List<string> GetLogFiles()
	{
		List<string> list = new List<string>();
		string text = Application.persistentDataPath + "/logs/";
		try
		{
			if (!Directory.Exists(text))
			{
				Directory.CreateDirectory(text);
			}
			DirectoryInfo directoryInfo = new DirectoryInfo(text);
			FileInfo[] files = directoryInfo.GetFiles();
			if (files.Length > 0)
			{
				foreach (FileInfo fileInfo in files)
				{
					if (fileInfo.Extension == ".log")
					{
						list.Add(fileInfo.FullName);
					}
					else
					{
						File.Delete(fileInfo.FullName);
					}
				}
			}
		}
		catch (Exception ex)
		{
			if (Debug.isDebugBuild)
			{
				Debug.Log("Failed to write exception log to file: " + ex);
			}
		}
		return list;
	}

	// Token: 0x06000085 RID: 133 RVA: 0x00003A7C File Offset: 0x00001C7C
	protected virtual IEnumerator SendLogs(List<string> logs)
	{
		string crashPath = "apps/[APPID]/crashes/upload";
		string url = this.GetBaseURL() + crashPath.Replace("[APPID]", this.appID);
		foreach (string log in logs)
		{
			WWWForm postForm = this.CreateForm(log);
			string lContent = postForm.headers["Content-Type"].ToString();
			lContent = lContent.Replace("\"", string.Empty);
			Dictionary<string, string> headers = new Dictionary<string, string>();
			headers.Add("Authorization", this.Transmorph("\u008aìî\u008a\u009fì\u0098\u009aî\u0092ì\u0092\u0087\u0093\u009e\u009b\u009b\u0087\u009e\u009fî\u009d\u0087ëîëé\u0087ì\u009b\u0092\u009cé\u009fè\u0099\u009f\u009d\u009eé\u0090\u009d\u0098é\u009c\u0093\u009c\u009d\u0093\u009b\u009aì\u009cè\u0099ìî\u009a\u0099îì\u009aëëì\u0093é\u009c\u0093\u0098\u0092\u009c\u009a\u009e\u009a\u0093\u0093\u009a\u0092î\u0092ëî\u0092ééé\u0093ï"));
			headers.Add("Content-Type", lContent);
			WWW www = new WWW(url, postForm.data, headers);
			yield return www;
			if (string.IsNullOrEmpty(www.error))
			{
				try
				{
					File.Delete(log);
				}
				catch (Exception ex)
				{
					Exception e = ex;
					if (Debug.isDebugBuild)
					{
						Debug.Log("Failed to delete exception log: " + e);
					}
				}
			}
		}
		yield break;
	}

	// Token: 0x06000086 RID: 134 RVA: 0x00003AA8 File Offset: 0x00001CA8
	protected virtual void WriteLogToDisk(string logString, string stackTrace)
	{
		string text = DateTime.Now.ToString("yyyy-MM-dd-HH_mm_ss_fff");
		string text2 = logString.Replace("\n", " ");
		string[] array = stackTrace.Split(new char[]
		{
			'\n'
		});
		text2 = "\n" + text2 + "\n";
		foreach (string text3 in array)
		{
			if (text3.Length > 0)
			{
				text2 = text2 + "  at " + text3 + "\n";
			}
		}
		List<string> logHeaders = this.GetLogHeaders();
		using (StreamWriter streamWriter = new StreamWriter(Application.persistentDataPath + "/logs/LogFile_" + text + ".log", true))
		{
			foreach (string text4 in logHeaders)
			{
				streamWriter.WriteLine(text4);
			}
			streamWriter.WriteLine(text2);
		}
	}

	// Token: 0x06000087 RID: 135 RVA: 0x00003BF0 File Offset: 0x00001DF0
	protected virtual string GetBaseURL()
	{
		string text = string.Empty;
		string text2 = this.serverURL.Trim();
		if (text2.Length > 0)
		{
			text = text2;
			if (!text.get_Chars(text.Length - 1).Equals("/"))
			{
				text += "/";
			}
		}
		else
		{
			text = "https://api.disney.com/dmn/crash/v2";
		}
		return text;
	}

	// Token: 0x06000088 RID: 136 RVA: 0x00003C58 File Offset: 0x00001E58
	protected virtual bool IsConnected()
	{
		bool result = false;
		if (Application.internetReachability == 2 || Application.internetReachability == 1)
		{
			result = true;
		}
		return result;
	}

	// Token: 0x06000089 RID: 137 RVA: 0x00003C80 File Offset: 0x00001E80
	protected virtual void HandleException(string logString, string stackTrace)
	{
		this.WriteLogToDisk(logString, stackTrace);
	}

	// Token: 0x0600008A RID: 138 RVA: 0x00003C8C File Offset: 0x00001E8C
	public void OnHandleLogCallback(string logString, string stackTrace, LogType type)
	{
		if (type != 1 && type != 4)
		{
			return;
		}
		this.HandleException(logString, stackTrace);
	}

	// Token: 0x0600008B RID: 139 RVA: 0x00003CA8 File Offset: 0x00001EA8
	public void OnHandleUnresolvedException(object sender, UnhandledExceptionEventArgs args)
	{
		if (args == null || args.ExceptionObject == null)
		{
			return;
		}
		if (args.ExceptionObject.GetType() != typeof(Exception))
		{
			return;
		}
		Exception ex = (Exception)args.ExceptionObject;
		this.HandleException(ex.Source, ex.StackTrace);
	}

	// Token: 0x04000021 RID: 33
	private const string HOCKEYAPP_BASEURL = "https://api.disney.com/dmn/crash/v2";

	// Token: 0x04000022 RID: 34
	protected const string HEADER_HK = "\u008aìî\u008a\u009fì\u0098\u009aî\u0092ì\u0092\u0087\u0093\u009e\u009b\u009b\u0087\u009e\u009fî\u009d\u0087ëîëé\u0087ì\u009b\u0092\u009cé\u009fè\u0099\u009f\u009d\u009eé\u0090\u009d\u0098é\u009c\u0093\u009c\u009d\u0093\u009b\u009aì\u009cè\u0099ìî\u009a\u0099îì\u009aëëì\u0093é\u009c\u0093\u0098\u0092\u009c\u009a\u009e\u009a\u0093\u0093\u009a\u0092î\u0092ëî\u0092ééé\u0093ï";

	// Token: 0x04000023 RID: 35
	private const string HOCKEYAPP_CRASHESPATH = "apps/[APPID]/crashes/upload";

	// Token: 0x04000024 RID: 36
	private const int MAX_CHARS = 199800;

	// Token: 0x04000025 RID: 37
	protected const string LOG_FILE_DIR = "/logs/";

	// Token: 0x04000026 RID: 38
	public string appID = "your-hockey-app-id";

	// Token: 0x04000027 RID: 39
	public string packageID = "your-package-identifier";

	// Token: 0x04000028 RID: 40
	public bool autoUpload;

	// Token: 0x04000029 RID: 41
	public bool exceptionLogging;

	// Token: 0x0400002A RID: 42
	public bool updateManager;

	// Token: 0x0400002B RID: 43
	public bool manualInit = true;

	// Token: 0x0400002C RID: 44
	private string serverURL = "https://api.disney.com/dmn/crash/v2";
}
