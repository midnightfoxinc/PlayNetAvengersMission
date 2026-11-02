using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine;

// Token: 0x02000279 RID: 633
public class WebHandler
{
	// Token: 0x06001101 RID: 4353 RVA: 0x00079C14 File Offset: 0x00077E14
	public static WebHandler getInstance()
	{
		if (WebHandler._instance == null)
		{
			WebHandler._instance = new WebHandler();
		}
		return WebHandler._instance;
	}

	// Token: 0x170001F8 RID: 504
	// (get) Token: 0x06001102 RID: 4354 RVA: 0x00079C30 File Offset: 0x00077E30
	public static WebHandler instance
	{
		get
		{
			return WebHandler.getInstance();
		}
	}

	// Token: 0x06001103 RID: 4355 RVA: 0x00079C38 File Offset: 0x00077E38
	public void setHttpBase(string baseStr)
	{
		this.webApiBase = baseStr;
	}

	// Token: 0x06001104 RID: 4356 RVA: 0x00079C44 File Offset: 0x00077E44
	public void setCellophane(string key)
	{
		this.cellophaneKey = key;
	}

	// Token: 0x06001105 RID: 4357 RVA: 0x00079C50 File Offset: 0x00077E50
	public string getHttpBase()
	{
		return this.webApiBase;
	}

	// Token: 0x170001F9 RID: 505
	// (get) Token: 0x06001106 RID: 4358 RVA: 0x00079C58 File Offset: 0x00077E58
	public string token
	{
		get
		{
			return this.loginToken;
		}
	}

	// Token: 0x06001107 RID: 4359 RVA: 0x00079C60 File Offset: 0x00077E60
	public void setTokens(string lToken)
	{
		globals.debug("---------- setTokens");
		this.loginToken = lToken;
	}

	// Token: 0x06001108 RID: 4360 RVA: 0x00079C74 File Offset: 0x00077E74
	public IEnumerator httpGetRequest(string url, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate failure, DateTime ifModifiedSince, bool addTokens = false, string apiBase = "")
	{
		if (Application.internetReachability == null)
		{
			failure(url, "Network unavailable");
		}
		else
		{
			string baseURL = this.webApiBase;
			if (apiBase != string.Empty)
			{
				baseURL = apiBase;
			}
			Dictionary<string, string> headers = new Dictionary<string, string>();
			if (ifModifiedSince.Year > 1900)
			{
				headers.Add("If-Modified-Since", ifModifiedSince.ToUniversalTime().ToString("r"));
			}
			headers.Add("Authorization", "BEARER " + this.loginToken + ", " + this.cellophaneKey);
			WWW www = new WWW(baseURL + url, null, headers);
			yield return www;
			if (!string.IsNullOrEmpty(www.error))
			{
				failure(url, string.IsNullOrEmpty(www.text) ? www.error : www.text);
			}
			else if (www.responseHeaders.ContainsKey("STATUS") && www.responseHeaders["STATUS"].Contains("304 Not Modified"))
			{
				success(null);
			}
			else
			{
				JSONObject i = new JSONObject(www.text, -2, false, false);
				if (i == null)
				{
					failure(url, "Invalid JSON");
				}
				else if (i.HasField("error"))
				{
					failure(url, i["error"]["desc"].str);
				}
				else
				{
					if (i.HasField("accessToken"))
					{
						this.loginToken = i["accessToken"].str;
					}
					success(i);
				}
			}
		}
		yield break;
	}

	// Token: 0x06001109 RID: 4361 RVA: 0x00079CDC File Offset: 0x00077EDC
	public IEnumerator httpPostJson(string url, string jsonString, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate failure, bool addTokens = false, bool isUnitTest = false)
	{
		byte[] data = this.encoding.GetBytes(jsonString);
		Dictionary<string, string> postHeader = new Dictionary<string, string>();
		postHeader.Add("Content-Type", "application/json");
		postHeader.Add("Authorization", "BEARER " + this.loginToken + ", " + this.cellophaneKey);
		postHeader.Add("Content-Length", data.Length.ToString());
		globals.debug(string.Concat(new string[]
		{
			"JSON Post to ",
			this.webApiBase,
			url,
			":cellophaneKey",
			this.cellophaneKey,
			" : ",
			this.loginToken
		}));
		globals.debug("JSON Post of " + jsonString);
		WWW www = new WWW(this.webApiBase + url, data, postHeader);
		yield return www;
		string headers = "{ ";
		foreach (KeyValuePair<string, string> kv in www.responseHeaders)
		{
			string text = headers;
			headers = string.Concat(new string[]
			{
				text,
				kv.Key,
				":",
				kv.Value,
				", "
			});
		}
		headers += "}";
		globals.debug(string.Concat(new string[]
		{
			"SERVER RESPONSE: text = ",
			www.text,
			" | error = ",
			www.error,
			" | headers = ",
			headers
		}));
		if (!string.IsNullOrEmpty(www.error))
		{
			failure(url, string.IsNullOrEmpty(www.text) ? www.error : www.text);
		}
		else
		{
			JSONObject i = new JSONObject(www.text, -2, false, false);
			if (i == null)
			{
				failure(url, "Invalid JSON");
			}
			else if (i.HasField("error"))
			{
				failure(url, www.text);
			}
			else if (i.HasField("statusCode") && (int)i["statusCode"].n >= 400)
			{
				failure(url, i["errorDescription"].str);
			}
			else
			{
				globals.debug("JSON Response: " + www.text);
				if (!isUnitTest)
				{
					if (i.HasField("accessToken") && !string.IsNullOrEmpty(i["accessToken"].str))
					{
						this.loginToken = i["accessToken"].str;
					}
					globals.debug("loginToken  :" + this.loginToken + " : " + WebHandler.getInstance().token);
					if (this.loginToken != WebHandler.getInstance().token)
					{
						WebHandler.getInstance().setTokens(this.loginToken);
						if (globals.player_data.isAuthenticated())
						{
							bool callCompeteFlag = false;
							globals.network_manager.RenewToken(globals.player_data, delegate(JSONObject jsonResponse)
							{
								callCompeteFlag = true;
							}, new WebHandler.HttpErrorDelegate(this.GeneralFetchError));
							if (callCompeteFlag)
							{
							}
							globals.debug("RENEW THE TOKEN");
						}
					}
				}
				success(i);
			}
		}
		yield break;
	}

	// Token: 0x0600110A RID: 4362 RVA: 0x00079D44 File Offset: 0x00077F44
	public void GeneralFetchError(string url, string err)
	{
		globals.debugError("Fetch error for " + url + ": " + err);
	}

	// Token: 0x0600110B RID: 4363 RVA: 0x00079D5C File Offset: 0x00077F5C
	public IEnumerator httpPostZlib(string url, byte[] data, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate failure, bool addTokens = false)
	{
		Dictionary<string, string> postHeader = new Dictionary<string, string>();
		if (addTokens)
		{
			url = url + ((url.IndexOf('?') <= 0) ? "?accessToken=" : "&accessToken=") + this.loginToken;
		}
		postHeader.Add("Content-Type", "application/json");
		postHeader.Add("Content-Encoding", "gzip");
		postHeader.Add("Content-Length", data.Length.ToString());
		globals.debug("GZIP Post to " + this.webApiBase + url);
		WWW www = new WWW(this.webApiBase + url, data, postHeader);
		yield return www;
		if (!string.IsNullOrEmpty(www.error))
		{
			failure(url, www.error);
		}
		else
		{
			globals.debug(www.text);
			JSONObject i = new JSONObject(www.text, -2, false, false);
			if (i == null)
			{
				failure(url, "Invalid JSON");
			}
			else if (i.HasField("error"))
			{
				failure(url, i["error"]["desc"].str);
			}
			else if (i.HasField("statusCode") && (int)i["statusCode"].n >= 400)
			{
				failure(url, i["errorDescription"].str);
			}
			else
			{
				globals.debug("JSON Response: " + www.text);
				if (i.HasField("accessToken"))
				{
					this.loginToken = i["accessToken"].str;
				}
				success(i);
			}
		}
		yield break;
	}

	// Token: 0x0600110C RID: 4364 RVA: 0x00079DC4 File Offset: 0x00077FC4
	public IEnumerator httpPostRequest(string url, WWWForm form, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate failure, string apiBase = "")
	{
		string baseURL = this.webApiBase;
		if (apiBase != string.Empty)
		{
			baseURL = apiBase;
		}
		WWW www = new WWW(baseURL + url, form);
		globals.debug("Form Post to " + baseURL + url);
		yield return www;
		if (!string.IsNullOrEmpty(www.error))
		{
			failure(url, www.error);
		}
		else
		{
			JSONObject i = new JSONObject(www.text, -2, false, false);
			if (i == null)
			{
				failure(url, "Invalid JSON");
			}
			else if (i.HasField("error"))
			{
				failure(url, i["error"]["desc"].str);
			}
			else
			{
				if (i.HasField("accessToken"))
				{
					this.loginToken = i["accessToken"].str;
				}
				success(i);
			}
		}
		yield break;
	}

	// Token: 0x0600110D RID: 4365 RVA: 0x00079E2C File Offset: 0x0007802C
	public IEnumerator httpSimpleGetRequest(string url, WebHandler.HttpResultDelegate success, WebHandler.HttpErrorDelegate failure)
	{
		WWW www = new WWW(url);
		globals.debug("Form Post to " + url);
		yield return www;
		if (!string.IsNullOrEmpty(www.error))
		{
			failure(url, www.error);
		}
		else
		{
			JSONObject i = new JSONObject(www.text, -2, false, false);
			if (i == null)
			{
				failure(url, "Invalid JSON");
			}
			else if (i.HasField("error"))
			{
				failure(url, i["error"]["desc"].str);
			}
			else
			{
				success(i);
			}
		}
		yield break;
	}

	// Token: 0x04001170 RID: 4464
	private static WebHandler _instance;

	// Token: 0x04001171 RID: 4465
	private string webApiBase;

	// Token: 0x04001172 RID: 4466
	private string loginToken = string.Empty;

	// Token: 0x04001173 RID: 4467
	private UTF8Encoding encoding = new UTF8Encoding();

	// Token: 0x04001174 RID: 4468
	public string cellophaneKey = string.Empty;

	// Token: 0x02000367 RID: 871
	// (Invoke) Token: 0x060015BE RID: 5566
	public delegate void HttpResultDelegate(JSONObject s);

	// Token: 0x02000368 RID: 872
	// (Invoke) Token: 0x060015C2 RID: 5570
	public delegate void HttpErrorDelegate(string url, string err);
}
