using System;

// Token: 0x02000131 RID: 305
[Serializable]
public class UISpriteData
{
	// Token: 0x17000194 RID: 404
	// (get) Token: 0x06000A37 RID: 2615 RVA: 0x0004AEE8 File Offset: 0x000490E8
	public bool hasBorder
	{
		get
		{
			return (this.borderLeft | this.borderRight | this.borderTop | this.borderBottom) != 0;
		}
	}

	// Token: 0x17000195 RID: 405
	// (get) Token: 0x06000A38 RID: 2616 RVA: 0x0004AF0C File Offset: 0x0004910C
	public bool hasPadding
	{
		get
		{
			return (this.paddingLeft | this.paddingRight | this.paddingTop | this.paddingBottom) != 0;
		}
	}

	// Token: 0x06000A39 RID: 2617 RVA: 0x0004AF30 File Offset: 0x00049130
	public void SetRect(int x, int y, int width, int height)
	{
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}

	// Token: 0x06000A3A RID: 2618 RVA: 0x0004AF50 File Offset: 0x00049150
	public void SetPadding(int left, int bottom, int right, int top)
	{
		this.paddingLeft = left;
		this.paddingBottom = bottom;
		this.paddingRight = right;
		this.paddingTop = top;
	}

	// Token: 0x06000A3B RID: 2619 RVA: 0x0004AF70 File Offset: 0x00049170
	public void SetBorder(int left, int bottom, int right, int top)
	{
		this.borderLeft = left;
		this.borderBottom = bottom;
		this.borderRight = right;
		this.borderTop = top;
	}

	// Token: 0x06000A3C RID: 2620 RVA: 0x0004AF90 File Offset: 0x00049190
	public void CopyFrom(UISpriteData sd)
	{
		this.name = sd.name;
		this.x = sd.x;
		this.y = sd.y;
		this.width = sd.width;
		this.height = sd.height;
		this.borderLeft = sd.borderLeft;
		this.borderRight = sd.borderRight;
		this.borderTop = sd.borderTop;
		this.borderBottom = sd.borderBottom;
		this.paddingLeft = sd.paddingLeft;
		this.paddingRight = sd.paddingRight;
		this.paddingTop = sd.paddingTop;
		this.paddingBottom = sd.paddingBottom;
	}

	// Token: 0x06000A3D RID: 2621 RVA: 0x0004B03C File Offset: 0x0004923C
	public void CopyBorderFrom(UISpriteData sd)
	{
		this.borderLeft = sd.borderLeft;
		this.borderRight = sd.borderRight;
		this.borderTop = sd.borderTop;
		this.borderBottom = sd.borderBottom;
	}

	// Token: 0x04000943 RID: 2371
	public string name = "Sprite";

	// Token: 0x04000944 RID: 2372
	public int x;

	// Token: 0x04000945 RID: 2373
	public int y;

	// Token: 0x04000946 RID: 2374
	public int width;

	// Token: 0x04000947 RID: 2375
	public int height;

	// Token: 0x04000948 RID: 2376
	public int borderLeft;

	// Token: 0x04000949 RID: 2377
	public int borderRight;

	// Token: 0x0400094A RID: 2378
	public int borderTop;

	// Token: 0x0400094B RID: 2379
	public int borderBottom;

	// Token: 0x0400094C RID: 2380
	public int paddingLeft;

	// Token: 0x0400094D RID: 2381
	public int paddingRight;

	// Token: 0x0400094E RID: 2382
	public int paddingTop;

	// Token: 0x0400094F RID: 2383
	public int paddingBottom;
}
