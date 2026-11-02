using System;
using System.Collections.Generic;

// Token: 0x02000169 RID: 361
public class ConnectedDevice
{
	// Token: 0x06000BB6 RID: 2998 RVA: 0x0005627C File Offset: 0x0005447C
	public ConnectedDevice(int deviceId, int deviceType, string owner)
	{
		this.mDeviceId = deviceId;
		this.mOwner = owner;
		if (Enum.IsDefined(typeof(Constants.PlaymationDeviceType), deviceType))
		{
			this.mDeviceType = (Constants.PlaymationDeviceType)deviceType;
		}
		else
		{
			globals.debugWarning("Unknown device type: " + deviceType);
		}
	}

	// Token: 0x170001B1 RID: 433
	// (get) Token: 0x06000BB7 RID: 2999 RVA: 0x0005631C File Offset: 0x0005451C
	public int deviceId
	{
		get
		{
			return this.mDeviceId;
		}
	}

	// Token: 0x170001B2 RID: 434
	// (get) Token: 0x06000BB8 RID: 3000 RVA: 0x00056324 File Offset: 0x00054524
	// (set) Token: 0x06000BB9 RID: 3001 RVA: 0x0005632C File Offset: 0x0005452C
	public int spaceAvailable
	{
		get
		{
			return this.mSpaceAvailable;
		}
		set
		{
			this.mSpaceAvailable = value;
		}
	}

	// Token: 0x170001B3 RID: 435
	// (get) Token: 0x06000BBA RID: 3002 RVA: 0x00056338 File Offset: 0x00054538
	public Constants.PlaymationDeviceType deviceType
	{
		get
		{
			return this.mDeviceType;
		}
	}

	// Token: 0x06000BBB RID: 3003 RVA: 0x00056340 File Offset: 0x00054540
	public void SetContent(string contentList)
	{
		try
		{
			this.mContent = new Dictionary<string, int>();
			JSONObject jsonobject = new JSONObject(contentList, -2, false, false);
			if (jsonobject.HasField("payload"))
			{
				this.SetContent(jsonobject["payload"]);
			}
			else
			{
				this.SetContent(jsonobject);
			}
		}
		catch (Exception log)
		{
			globals.debugException(log);
		}
	}

	// Token: 0x06000BBC RID: 3004 RVA: 0x000563C0 File Offset: 0x000545C0
	public void SetContent(JSONObject j)
	{
		foreach (string text in j.keys)
		{
			if (text == "DOWNLOADING")
			{
				JSONObject jsonobject = j["DOWNLOADING"];
				if (jsonobject.type == JSONObject.Type.OBJECT)
				{
					foreach (string text2 in jsonobject.keys)
					{
						this.mDownLoadState.Add(text2, (int)jsonobject[text2].n);
					}
				}
				if (jsonobject.type == JSONObject.Type.ARRAY)
				{
					for (int i = 0; i < jsonobject.list.Count; i++)
					{
						if (!this.mDownLoadState.ContainsKey(jsonobject.list[i][0].str))
						{
							this.mDownLoadState.Add(jsonobject.list[i][0].str, (int)jsonobject.list[i][1].n);
						}
					}
				}
			}
			else if (text == "INSTALLING")
			{
				JSONObject jsonobject2 = j["INSTALLING"];
				foreach (string text3 in jsonobject2.keys)
				{
					this.mInstallState.Add(text3, (int)jsonobject2[text3].n);
				}
			}
			else if (text == "INSTALLED")
			{
				JSONObject jsonobject3 = j["INSTALLED"];
				foreach (string text4 in jsonobject3.keys)
				{
					if (jsonobject3[text4].type == JSONObject.Type.ARRAY)
					{
						List<int> list = new List<int>();
						for (int k = 0; k < jsonobject3[text4].list.Count; k++)
						{
							list.Add((int)jsonobject3[text4].list[k].n);
						}
						if (!this.mInstalledWithVersion.ContainsKey(text4))
						{
							this.mInstalledWithVersion.Add(text4, list);
						}
					}
					else if (!this.mInstalledState.ContainsKey(text4))
					{
						this.mInstalledState.Add(text4, (int)jsonobject3[text4].n);
					}
				}
			}
			else
			{
				this.mContent.Add(text, (int)j[text].n);
			}
		}
	}

	// Token: 0x06000BBD RID: 3005 RVA: 0x0005671C File Offset: 0x0005491C
	public void setCachedPackage(JSONObject data)
	{
		JSONObject jsonobject = data["payload"];
		foreach (string text in jsonobject.keys)
		{
			if (jsonobject[text].type == JSONObject.Type.ARRAY)
			{
				List<int> list = new List<int>();
				for (int i = 0; i < jsonobject[text].list.Count; i++)
				{
					list.Add((int)jsonobject[text].list[i].n);
				}
				if (!this.mCachedPackages.ContainsKey(text))
				{
					this.mCachedPackages.Add(text, list);
				}
			}
		}
	}

	// Token: 0x06000BBE RID: 3006 RVA: 0x00056804 File Offset: 0x00054A04
	public bool contentUnderDownloadState(string entitlement)
	{
		return this.mDownLoadState.ContainsKey(entitlement);
	}

	// Token: 0x06000BBF RID: 3007 RVA: 0x00056814 File Offset: 0x00054A14
	public bool content_installed(string entitlement)
	{
		return this.GetInstalledContentList().ContainsKey(entitlement) || this.GetInstalledContentListWithVersionInfo().ContainsKey(entitlement);
	}

	// Token: 0x06000BC0 RID: 3008 RVA: 0x00056844 File Offset: 0x00054A44
	public Dictionary<string, int> GetContentList()
	{
		return this.mContent;
	}

	// Token: 0x06000BC1 RID: 3009 RVA: 0x0005684C File Offset: 0x00054A4C
	public Dictionary<string, int> GetInstalledContentList()
	{
		return this.mInstalledState;
	}

	// Token: 0x06000BC2 RID: 3010 RVA: 0x00056854 File Offset: 0x00054A54
	public Dictionary<string, List<int>> GetInstalledContentListWithVersionInfo()
	{
		return this.mInstalledWithVersion;
	}

	// Token: 0x06000BC3 RID: 3011 RVA: 0x0005685C File Offset: 0x00054A5C
	public bool isContentInstalledWithLatestVersion(string contentID)
	{
		return this.mInstalledWithVersion.ContainsKey(contentID);
	}

	// Token: 0x06000BC4 RID: 3012 RVA: 0x00056874 File Offset: 0x00054A74
	public bool isContentInstalledWithThisVersion(string contentID, int version)
	{
		foreach (KeyValuePair<string, List<int>> keyValuePair in this.mInstalledWithVersion)
		{
			if (keyValuePair.Key == contentID && keyValuePair.Value.Contains(version))
			{
				return true;
			}
		}
		return false;
	}

	// Token: 0x06000BC5 RID: 3013 RVA: 0x00056904 File Offset: 0x00054B04
	public List<int> getInstalledVersions(string contentID)
	{
		foreach (KeyValuePair<string, List<int>> keyValuePair in this.mInstalledWithVersion)
		{
			if (keyValuePair.Key == contentID)
			{
				return keyValuePair.Value;
			}
		}
		return new List<int>();
	}

	// Token: 0x06000BC6 RID: 3014 RVA: 0x0005698C File Offset: 0x00054B8C
	public bool isContentCachedWithThisVersion(string contentID, int version)
	{
		foreach (KeyValuePair<string, List<int>> keyValuePair in this.mCachedPackages)
		{
			if (keyValuePair.Key == contentID && keyValuePair.Value.Contains(version))
			{
				return true;
			}
		}
		return false;
	}

	// Token: 0x06000BC7 RID: 3015 RVA: 0x00056A1C File Offset: 0x00054C1C
	public string getPackageCachedButNotInstalled()
	{
		foreach (KeyValuePair<string, List<int>> keyValuePair in this.mCachedPackages)
		{
			if (!this.mInstalledWithVersion.ContainsKey(keyValuePair.Key))
			{
				return keyValuePair.Key;
			}
		}
		return null;
	}

	// Token: 0x06000BC8 RID: 3016 RVA: 0x00056AA4 File Offset: 0x00054CA4
	public void ClearContent(string contentId)
	{
		if (this.mContent.ContainsKey(contentId))
		{
			globals.BLE_manager.clearContent(this.deviceId, contentId);
		}
	}

	// Token: 0x06000BC9 RID: 3017 RVA: 0x00056AD4 File Offset: 0x00054CD4
	public void ContentCleared(JSONObject data)
	{
		if (data.HasField("name"))
		{
			this.mContent.Remove(data["name"].str);
		}
	}

	// Token: 0x06000BCA RID: 3018 RVA: 0x00056B10 File Offset: 0x00054D10
	public bool IsUnowned()
	{
		return this.mOwner == null;
	}

	// Token: 0x06000BCB RID: 3019 RVA: 0x00056B1C File Offset: 0x00054D1C
	public void resetDownloadState()
	{
		this.mDownLoadState.Clear();
	}

	// Token: 0x06000BCC RID: 3020 RVA: 0x00056B2C File Offset: 0x00054D2C
	public bool IsOwnedBy(string playerId)
	{
		return playerId != null && this.mOwner != null && playerId.Equals(this.mOwner);
	}

	// Token: 0x06000BCD RID: 3021 RVA: 0x00056B5C File Offset: 0x00054D5C
	public string getDeviceTypeLiteral()
	{
		if (this.mDeviceType == Constants.PlaymationDeviceType.DEVICE_REPULSOR)
		{
			return "Repulsor";
		}
		if (this.mDeviceType == Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			return "Hulk Hands";
		}
		return "unknown";
	}

	// Token: 0x06000BCE RID: 3022 RVA: 0x00056B90 File Offset: 0x00054D90
	public static implicit operator bool(ConnectedDevice d)
	{
		return d != null;
	}

	// Token: 0x04000B27 RID: 2855
	private int mDeviceId;

	// Token: 0x04000B28 RID: 2856
	private string mOwner;

	// Token: 0x04000B29 RID: 2857
	private Constants.PlaymationDeviceType mDeviceType;

	// Token: 0x04000B2A RID: 2858
	private Dictionary<string, int> mContent = new Dictionary<string, int>();

	// Token: 0x04000B2B RID: 2859
	private int mSpaceAvailable;

	// Token: 0x04000B2C RID: 2860
	public int eventId;

	// Token: 0x04000B2D RID: 2861
	public Dictionary<string, int> mDownLoadState = new Dictionary<string, int>();

	// Token: 0x04000B2E RID: 2862
	public Dictionary<string, int> mInstallState = new Dictionary<string, int>();

	// Token: 0x04000B2F RID: 2863
	public Dictionary<string, int> mInstalledState = new Dictionary<string, int>();

	// Token: 0x04000B30 RID: 2864
	public Dictionary<string, List<int>> mInstalledWithVersion = new Dictionary<string, List<int>>();

	// Token: 0x04000B31 RID: 2865
	public Dictionary<string, List<int>> mCachedPackages = new Dictionary<string, List<int>>();
}
