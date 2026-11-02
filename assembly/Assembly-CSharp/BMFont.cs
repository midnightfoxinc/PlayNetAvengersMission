using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000D5 RID: 213
[Serializable]
public class BMFont
{
	// Token: 0x17000060 RID: 96
	// (get) Token: 0x06000556 RID: 1366 RVA: 0x00024DC0 File Offset: 0x00022FC0
	public bool isValid
	{
		get
		{
			return this.mSaved.Count > 0;
		}
	}

	// Token: 0x17000061 RID: 97
	// (get) Token: 0x06000557 RID: 1367 RVA: 0x00024DD0 File Offset: 0x00022FD0
	// (set) Token: 0x06000558 RID: 1368 RVA: 0x00024DD8 File Offset: 0x00022FD8
	public int charSize
	{
		get
		{
			return this.mSize;
		}
		set
		{
			this.mSize = value;
		}
	}

	// Token: 0x17000062 RID: 98
	// (get) Token: 0x06000559 RID: 1369 RVA: 0x00024DE4 File Offset: 0x00022FE4
	// (set) Token: 0x0600055A RID: 1370 RVA: 0x00024DEC File Offset: 0x00022FEC
	public int baseOffset
	{
		get
		{
			return this.mBase;
		}
		set
		{
			this.mBase = value;
		}
	}

	// Token: 0x17000063 RID: 99
	// (get) Token: 0x0600055B RID: 1371 RVA: 0x00024DF8 File Offset: 0x00022FF8
	// (set) Token: 0x0600055C RID: 1372 RVA: 0x00024E00 File Offset: 0x00023000
	public int texWidth
	{
		get
		{
			return this.mWidth;
		}
		set
		{
			this.mWidth = value;
		}
	}

	// Token: 0x17000064 RID: 100
	// (get) Token: 0x0600055D RID: 1373 RVA: 0x00024E0C File Offset: 0x0002300C
	// (set) Token: 0x0600055E RID: 1374 RVA: 0x00024E14 File Offset: 0x00023014
	public int texHeight
	{
		get
		{
			return this.mHeight;
		}
		set
		{
			this.mHeight = value;
		}
	}

	// Token: 0x17000065 RID: 101
	// (get) Token: 0x0600055F RID: 1375 RVA: 0x00024E20 File Offset: 0x00023020
	public int glyphCount
	{
		get
		{
			return (!this.isValid) ? 0 : this.mSaved.Count;
		}
	}

	// Token: 0x17000066 RID: 102
	// (get) Token: 0x06000560 RID: 1376 RVA: 0x00024E40 File Offset: 0x00023040
	// (set) Token: 0x06000561 RID: 1377 RVA: 0x00024E48 File Offset: 0x00023048
	public string spriteName
	{
		get
		{
			return this.mSpriteName;
		}
		set
		{
			this.mSpriteName = value;
		}
	}

	// Token: 0x17000067 RID: 103
	// (get) Token: 0x06000562 RID: 1378 RVA: 0x00024E54 File Offset: 0x00023054
	public List<BMGlyph> glyphs
	{
		get
		{
			return this.mSaved;
		}
	}

	// Token: 0x06000563 RID: 1379 RVA: 0x00024E5C File Offset: 0x0002305C
	public BMGlyph GetGlyph(int index, bool createIfMissing)
	{
		BMGlyph bmglyph = null;
		if (this.mDict.Count == 0)
		{
			int i = 0;
			int count = this.mSaved.Count;
			while (i < count)
			{
				BMGlyph bmglyph2 = this.mSaved[i];
				this.mDict.Add(bmglyph2.index, bmglyph2);
				i++;
			}
		}
		if (!this.mDict.TryGetValue(index, ref bmglyph) && createIfMissing)
		{
			bmglyph = new BMGlyph();
			bmglyph.index = index;
			this.mSaved.Add(bmglyph);
			this.mDict.Add(index, bmglyph);
		}
		return bmglyph;
	}

	// Token: 0x06000564 RID: 1380 RVA: 0x00024EF8 File Offset: 0x000230F8
	public BMGlyph GetGlyph(int index)
	{
		return this.GetGlyph(index, false);
	}

	// Token: 0x06000565 RID: 1381 RVA: 0x00024F04 File Offset: 0x00023104
	public void Clear()
	{
		this.mDict.Clear();
		this.mSaved.Clear();
	}

	// Token: 0x06000566 RID: 1382 RVA: 0x00024F1C File Offset: 0x0002311C
	public void Trim(int xMin, int yMin, int xMax, int yMax)
	{
		if (this.isValid)
		{
			int i = 0;
			int count = this.mSaved.Count;
			while (i < count)
			{
				BMGlyph bmglyph = this.mSaved[i];
				if (bmglyph != null)
				{
					bmglyph.Trim(xMin, yMin, xMax, yMax);
				}
				i++;
			}
		}
	}

	// Token: 0x040005D5 RID: 1493
	[HideInInspector]
	[SerializeField]
	private int mSize = 16;

	// Token: 0x040005D6 RID: 1494
	[HideInInspector]
	[SerializeField]
	private int mBase;

	// Token: 0x040005D7 RID: 1495
	[HideInInspector]
	[SerializeField]
	private int mWidth;

	// Token: 0x040005D8 RID: 1496
	[SerializeField]
	[HideInInspector]
	private int mHeight;

	// Token: 0x040005D9 RID: 1497
	[SerializeField]
	[HideInInspector]
	private string mSpriteName;

	// Token: 0x040005DA RID: 1498
	[SerializeField]
	[HideInInspector]
	private List<BMGlyph> mSaved = new List<BMGlyph>();

	// Token: 0x040005DB RID: 1499
	private Dictionary<int, BMGlyph> mDict = new Dictionary<int, BMGlyph>();
}
