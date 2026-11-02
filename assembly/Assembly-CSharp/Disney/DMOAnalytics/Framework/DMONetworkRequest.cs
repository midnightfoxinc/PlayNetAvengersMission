using System;
using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using UnityEngine;

namespace Disney.DMOAnalytics.Framework
{
	// Token: 0x02000037 RID: 55
	public class DMONetworkRequest : IDMONetworkRequest
	{
		// Token: 0x06000190 RID: 400 RVA: 0x0000B740 File Offset: 0x00009940
		private DMONetworkRequest()
		{
		}

		// Token: 0x1700001C RID: 28
		// (set) Token: 0x06000192 RID: 402 RVA: 0x0000B760 File Offset: 0x00009960
		public MonoBehaviour GameObj
		{
			set
			{
				if (this.mGameObj == null)
				{
					this.mGameObj = value;
				}
			}
		}

		// Token: 0x1700001D RID: 29
		// (get) Token: 0x06000193 RID: 403 RVA: 0x0000B77C File Offset: 0x0000997C
		public static IDMONetworkRequest Instance
		{
			get
			{
				if (DMONetworkRequest.mInstance == null)
				{
					DMONetworkRequest.mInstance = new DMONetworkRequest();
				}
				return DMONetworkRequest.mInstance;
			}
		}

		// Token: 0x06000194 RID: 404 RVA: 0x0000B798 File Offset: 0x00009998
		public void FlushQueue()
		{
			if (!DMOAnalyticsHelper.ICanUseNetwork)
			{
				return;
			}
			if (this.mEventQueue.Count <= 0)
			{
				return;
			}
			DMOAnalyticsHelper.Log("Flush the analytics queue");
			while (this.mEventQueue.Count > 0)
			{
				Dictionary<string, object> gameData = this.mEventQueue.Peek();
				this.StartCoroutine(gameData);
				this.mEventQueue.Dequeue();
			}
		}

		// Token: 0x06000195 RID: 405 RVA: 0x0000B804 File Offset: 0x00009A04
		public void StartCoroutine(Dictionary<string, object> GameData)
		{
			if (this.mGameObj == null)
			{
				GameObject gameObject = new GameObject("DMOAnalytics Coroutines");
				Object.DontDestroyOnLoad(gameObject);
				this.mGameObj = gameObject.AddComponent<MonoBehaviour>();
			}
			if (GameData == null)
			{
				return;
			}
			bool flag = Application.internetReachability != null && DMOAnalyticsHelper.ICanUseNetwork;
			if (flag)
			{
				this.mGameObj.StartCoroutine(this._runEventRequest(GameData));
			}
			else
			{
				this._addGameDataToEventQueue(GameData);
			}
		}

		// Token: 0x06000196 RID: 406 RVA: 0x0000B880 File Offset: 0x00009A80
		private string getTimeStamp()
		{
			DateTime utcNow = DateTime.UtcNow;
			DateTime dateTime = Convert.ToDateTime("1/1/1970 0:00:00 AM");
			TimeSpan timeSpan = utcNow.Subtract(dateTime);
			return ((long)(((timeSpan.Days * 24 + timeSpan.Hours) * 60 + timeSpan.Minutes) * 60 + timeSpan.Seconds)).ToString();
		}

		// Token: 0x06000197 RID: 407 RVA: 0x0000B8D8 File Offset: 0x00009AD8
		private string getHostURL()
		{
			return DMOAnalyticsSysInfo.getAnalyticsURL();
		}

		// Token: 0x06000198 RID: 408 RVA: 0x0000B8E0 File Offset: 0x00009AE0
		private bool _compareTwoDictionary(Dictionary<string, object> GameData, Dictionary<string, object> CollectData)
		{
			bool result = false;
			object obj = GameData["method"];
			object obj2 = GameData["timestamp"];
			bool flag = GameData.ContainsKey("data");
			if (obj.Equals(CollectData["method"]) && obj2.Equals(CollectData["timestamp"]))
			{
				if (!flag)
				{
					result = true;
				}
				else
				{
					object obj3 = GameData["data"];
					if (obj3.Equals(CollectData["data"]))
					{
						result = true;
					}
				}
			}
			return result;
		}

		// Token: 0x06000199 RID: 409 RVA: 0x0000B974 File Offset: 0x00009B74
		private void _addGameDataToEventQueue(Dictionary<string, object> GameData)
		{
			bool flag = true;
			foreach (Dictionary<string, object> collectData in this.mEventQueue)
			{
				if (this._compareTwoDictionary(GameData, collectData))
				{
					flag = false;
					DMOAnalyticsHelper.Log("GameData is duplicate, no need to add again: " + GameData["method"]);
					break;
				}
			}
			if (flag)
			{
				this.mEventQueue.Enqueue(GameData);
			}
		}

		// Token: 0x0600019A RID: 410 RVA: 0x0000BA18 File Offset: 0x00009C18
		private IEnumerator _runEventRequest(Dictionary<string, object> postData)
		{
			Dictionary<string, string> dictHeaders = new Dictionary<string, string>();
			string authorizationField = string.Format("FD {0}:{1}", DMOAnalyticsSysInfo.getCellophaneKey(), DMOAnalyticsSysInfo.getCellophaneSecret());
			dictHeaders.Add("Authorization", authorizationField);
			string contentType = "multipart/form-data; boundary=" + DMONetworkRequest.multipartSeparator;
			dictHeaders.Add("Content-Type", contentType);
			string apiSer = this._signatureFromPostData(postData);
			postData.Add("api_sig", apiSer);
			string dataStr = this.getDataBodyStr(postData);
			string hostURL = this.getHostURL();
			DMOAnalyticsHelper.Log("Connecting to Server: " + hostURL);
			WWW www = new WWW(hostURL, Encoding.UTF8.GetBytes(dataStr), dictHeaders);
			yield return www;
			bool isPosted = www.isDone && www.error == null && www.text != null;
			if (!isPosted)
			{
				DMOAnalyticsHelper.Log("Errr in WWW request:" + www.error);
			}
			if (isPosted)
			{
				try
				{
					string contentLen = www.responseHeaders["CONTENT-LENGTH"];
					int textLen = Convert.ToInt32(contentLen);
					if (textLen < 1)
					{
						isPosted = false;
					}
				}
				catch (Exception ex2)
				{
					Exception ex = ex2;
					isPosted = false;
					DMOAnalyticsHelper.Log("Errr in WWW response: " + ex.ToString());
				}
			}
			DMOAnalyticsHelper.Log("WWW request is posted");
			yield break;
		}

		// Token: 0x0600019B RID: 411 RVA: 0x0000BA44 File Offset: 0x00009C44
		private string getDataBodyStr(Dictionary<string, object> postData)
		{
			string text = string.Empty;
			foreach (KeyValuePair<string, object> keyValuePair in postData)
			{
				object value = keyValuePair.Value;
				if (value != null)
				{
					text += string.Format("--{0}\r\nContent-Disposition: form-data; name=\"{1}\"\r\n\r\n{2}\r\n", DMONetworkRequest.multipartSeparator, keyValuePair.Key, (string)value);
				}
			}
			text += "--";
			text += DMONetworkRequest.multipartSeparator;
			text += "--\r\n";
			return text;
		}

		// Token: 0x0600019C RID: 412 RVA: 0x0000BAFC File Offset: 0x00009CFC
		private string _signatureFromPostData(Dictionary<string, object> postData)
		{
			string[] array = new string[postData.Keys.Count];
			string[] array2 = new string[postData.Keys.Count];
			postData.Keys.CopyTo(array2, 0);
			Array.Sort<string>(array2, StringComparer.Ordinal);
			int num = 0;
			foreach (string text in array2)
			{
				string text2 = (string)postData[text];
				if (string.IsNullOrEmpty(text2))
				{
					array[num] = text + "=null";
				}
				else
				{
					string text3 = text2.Replace(" ", "+");
					array[num] = text + "=" + Uri.EscapeDataString(text3);
				}
				num++;
			}
			string inString = Uri.EscapeDataString(string.Join("&", array));
			string text4 = this._tempFixForDoubleEncoding(inString);
			string text5 = string.Format("{0}&", DMOAnalyticsSysInfo.getAnalyticsSecret());
			byte[] bytes = Encoding.UTF8.GetBytes(text5);
			byte[] bytes2 = Encoding.UTF8.GetBytes(text4);
			HMACSHA1 hmacsha = new HMACSHA1(bytes);
			hmacsha.Initialize();
			byte[] array4 = hmacsha.ComputeHash(bytes2);
			return Convert.ToBase64String(array4);
		}

		// Token: 0x0600019D RID: 413 RVA: 0x0000BC30 File Offset: 0x00009E30
		private string _tempFixForDoubleEncoding(string inString)
		{
			string text = inString.Replace("(", "%2528");
			return text.Replace(")", "%2529");
		}

		// Token: 0x040001BD RID: 445
		private const int mTimeOut = 60000;

		// Token: 0x040001BE RID: 446
		private MonoBehaviour mGameObj;

		// Token: 0x040001BF RID: 447
		private Queue<Dictionary<string, object>> mEventQueue = new Queue<Dictionary<string, object>>();

		// Token: 0x040001C0 RID: 448
		private static string multipartSeparator = "GOGO-87dae883c6039b244c0d341f45f8-SEP";

		// Token: 0x040001C1 RID: 449
		private static IDMONetworkRequest mInstance;
	}
}
