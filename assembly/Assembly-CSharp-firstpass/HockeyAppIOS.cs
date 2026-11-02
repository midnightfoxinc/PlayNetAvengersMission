using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

// Token: 0x0200000A RID: 10
public class HockeyAppIOS : MonoBehaviour
{
	// Token: 0x0600008D RID: 141 RVA: 0x00003D14 File Offset: 0x00001F14
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

	// Token: 0x0600008E RID: 142 RVA: 0x00003D68 File Offset: 0x00001F68
	protected virtual List<string> GetLogHeaders()
	{
		return new List<string>();
	}

	// Token: 0x0600008F RID: 143 RVA: 0x00003D7C File Offset: 0x00001F7C
	protected virtual WWWForm CreateForm(string log)
	{
		return new WWWForm();
	}

	// Token: 0x06000090 RID: 144 RVA: 0x00003D90 File Offset: 0x00001F90
	protected virtual List<string> GetLogFiles()
	{
		return new List<string>();
	}

	// Token: 0x06000091 RID: 145 RVA: 0x00003DA4 File Offset: 0x00001FA4
	protected virtual IEnumerator SendLogs(List<string> logs)
	{
		foreach (string log in logs)
		{
			string crashPath = "apps/[APPID]/crashes/upload";
			string url = this.GetBaseURL() + crashPath.Replace("[APPID]", this.appID);
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

	// Token: 0x06000092 RID: 146 RVA: 0x00003DD0 File Offset: 0x00001FD0
	protected virtual void WriteLogToDisk(string logString, string stackTrace)
	{
	}

	// Token: 0x06000093 RID: 147 RVA: 0x00003DD4 File Offset: 0x00001FD4
	protected virtual string GetBaseURL()
	{
		return string.Empty;
	}

	// Token: 0x06000094 RID: 148 RVA: 0x00003DE8 File Offset: 0x00001FE8
	protected virtual bool IsConnected()
	{
		return false;
	}

	// Token: 0x06000095 RID: 149 RVA: 0x00003DF8 File Offset: 0x00001FF8
	protected virtual void HandleException(string logString, string stackTrace)
	{
	}

	// Token: 0x06000096 RID: 150 RVA: 0x00003DFC File Offset: 0x00001FFC
	public void OnHandleLogCallback(string logString, string stackTrace, LogType type)
	{
	}

	// Token: 0x06000097 RID: 151 RVA: 0x00003E00 File Offset: 0x00002000
	public void OnHandleUnresolvedException(object sender, UnhandledExceptionEventArgs args)
	{
	}

	// Token: 0x0400002D RID: 45
	protected const string HOCKEYAPP_BASEURL = "https://api.disney.com/dmn/crash/v2";

	// Token: 0x0400002E RID: 46
	protected const string HOCKEYAPP_CRASHESPATH = "apps/[APPID]/crashes/upload";

	// Token: 0x0400002F RID: 47
	protected const string HEADER_HK = "\u008aìî\u008a\u009fì\u0098\u009aî\u0092ì\u0092\u0087\u0093\u009e\u009b\u009b\u0087\u009e\u009fî\u009d\u0087ëîëé\u0087ì\u009b\u0092\u009cé\u009fè\u0099\u009f\u009d\u009eé\u0090\u009d\u0098é\u009c\u0093\u009c\u009d\u0093\u009b\u009aì\u009cè\u0099ìî\u009a\u0099îì\u009aëëì\u0093é\u009c\u0093\u0098\u0092\u009c\u009a\u009e\u009a\u0093\u0093\u009a\u0092î\u0092ëî\u0092ééé\u0093ï";

	// Token: 0x04000030 RID: 48
	protected const int MAX_CHARS = 199800;

	// Token: 0x04000031 RID: 49
	protected const string LOG_FILE_DIR = "/logs/";

	// Token: 0x04000032 RID: 50
	public string appID = "your-hockey-app-id";

	// Token: 0x04000033 RID: 51
	public bool autoUpload;

	// Token: 0x04000034 RID: 52
	public bool exceptionLogging;

	// Token: 0x04000035 RID: 53
	public bool updateManager;
}
