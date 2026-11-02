using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000278 RID: 632
public class ResourceManager
{
	// Token: 0x170001F7 RID: 503
	// (get) Token: 0x060010FC RID: 4348 RVA: 0x00079B4C File Offset: 0x00077D4C
	public static ResourceManager instance
	{
		get
		{
			if (ResourceManager._instance == null)
			{
				ResourceManager._instance = new ResourceManager();
			}
			return ResourceManager._instance;
		}
	}

	// Token: 0x060010FD RID: 4349 RVA: 0x00079B68 File Offset: 0x00077D68
	private void scaleSkinFonts(ref GUISkin skin)
	{
	}

	// Token: 0x060010FE RID: 4350 RVA: 0x00079B6C File Offset: 0x00077D6C
	public GUISkin getSkin(string skin)
	{
		if (!this.skins.ContainsKey(skin))
		{
			GUISkin guiskin = Resources.Load<GUISkin>(skin);
			this.scaleSkinFonts(ref guiskin);
			this.skins.Add(skin, guiskin);
		}
		return this.skins[skin];
	}

	// Token: 0x060010FF RID: 4351 RVA: 0x00079BB4 File Offset: 0x00077DB4
	public void unloadSkin(string skin)
	{
		if (this.skins.ContainsKey(skin))
		{
			Resources.UnloadAsset(this.skins[skin]);
			this.skins.Remove(skin);
		}
	}

	// Token: 0x0400116E RID: 4462
	private static ResourceManager _instance;

	// Token: 0x0400116F RID: 4463
	private Dictionary<string, GUISkin> skins = new Dictionary<string, GUISkin>();
}
