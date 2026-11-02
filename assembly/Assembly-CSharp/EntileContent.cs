using System;
using System.Collections.Generic;

// Token: 0x0200017C RID: 380
public class EntileContent
{
	// Token: 0x06000BDB RID: 3035 RVA: 0x00056E48 File Offset: 0x00055048
	public static Dictionary<string, EntileContent> fromJSON(JSONObject j)
	{
		Dictionary<string, EntileContent> dictionary = new Dictionary<string, EntileContent>();
		foreach (JSONObject jsonobject in j.list)
		{
			try
			{
				EntileContent entileContent = new EntileContent();
				entileContent.priority = (int)jsonobject["priority"].n;
				entileContent.packageName = jsonobject["packageName"].str;
				entileContent.packageId = jsonobject["packageId"].str;
				entileContent.description = jsonobject["description"].str;
				entileContent.version = jsonobject["version"].str;
				dictionary.Add(entileContent.packageId, entileContent);
			}
			catch (Exception log)
			{
				globals.debugException(log);
			}
		}
		return dictionary;
	}

	// Token: 0x04000BAB RID: 2987
	public int priority;

	// Token: 0x04000BAC RID: 2988
	public string packageName;

	// Token: 0x04000BAD RID: 2989
	public string packageId;

	// Token: 0x04000BAE RID: 2990
	public string description;

	// Token: 0x04000BAF RID: 2991
	public string version;
}
