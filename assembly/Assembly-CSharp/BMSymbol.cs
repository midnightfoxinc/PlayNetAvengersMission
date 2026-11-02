using System;
using UnityEngine;

// Token: 0x020000D7 RID: 215
[Serializable]
public class BMSymbol
{
	// Token: 0x17000068 RID: 104
	// (get) Token: 0x0600056C RID: 1388 RVA: 0x00025134 File Offset: 0x00023334
	public int length
	{
		get
		{
			if (this.mLength == 0)
			{
				this.mLength = this.sequence.Length;
			}
			return this.mLength;
		}
	}

	// Token: 0x17000069 RID: 105
	// (get) Token: 0x0600056D RID: 1389 RVA: 0x00025164 File Offset: 0x00023364
	public int offsetX
	{
		get
		{
			return this.mOffsetX;
		}
	}

	// Token: 0x1700006A RID: 106
	// (get) Token: 0x0600056E RID: 1390 RVA: 0x0002516C File Offset: 0x0002336C
	public int offsetY
	{
		get
		{
			return this.mOffsetY;
		}
	}

	// Token: 0x1700006B RID: 107
	// (get) Token: 0x0600056F RID: 1391 RVA: 0x00025174 File Offset: 0x00023374
	public int width
	{
		get
		{
			return this.mWidth;
		}
	}

	// Token: 0x1700006C RID: 108
	// (get) Token: 0x06000570 RID: 1392 RVA: 0x0002517C File Offset: 0x0002337C
	public int height
	{
		get
		{
			return this.mHeight;
		}
	}

	// Token: 0x1700006D RID: 109
	// (get) Token: 0x06000571 RID: 1393 RVA: 0x00025184 File Offset: 0x00023384
	public int advance
	{
		get
		{
			return this.mAdvance;
		}
	}

	// Token: 0x1700006E RID: 110
	// (get) Token: 0x06000572 RID: 1394 RVA: 0x0002518C File Offset: 0x0002338C
	public Rect uvRect
	{
		get
		{
			return this.mUV;
		}
	}

	// Token: 0x06000573 RID: 1395 RVA: 0x00025194 File Offset: 0x00023394
	public void MarkAsChanged()
	{
		this.mIsValid = false;
	}

	// Token: 0x06000574 RID: 1396 RVA: 0x000251A0 File Offset: 0x000233A0
	public bool Validate(UIAtlas atlas)
	{
		if (atlas == null)
		{
			return false;
		}
		if (!this.mIsValid)
		{
			if (string.IsNullOrEmpty(this.spriteName))
			{
				return false;
			}
			this.mSprite = ((!(atlas != null)) ? null : atlas.GetSprite(this.spriteName));
			if (this.mSprite != null)
			{
				Texture texture = atlas.texture;
				if (texture == null)
				{
					this.mSprite = null;
				}
				else
				{
					this.mUV = new Rect((float)this.mSprite.x, (float)this.mSprite.y, (float)this.mSprite.width, (float)this.mSprite.height);
					this.mUV = NGUIMath.ConvertToTexCoords(this.mUV, texture.width, texture.height);
					this.mOffsetX = this.mSprite.paddingLeft;
					this.mOffsetY = this.mSprite.paddingTop;
					this.mWidth = this.mSprite.width;
					this.mHeight = this.mSprite.height;
					this.mAdvance = this.mSprite.width + (this.mSprite.paddingLeft + this.mSprite.paddingRight);
					this.mIsValid = true;
				}
			}
		}
		return this.mSprite != null;
	}

	// Token: 0x040005E6 RID: 1510
	public string sequence;

	// Token: 0x040005E7 RID: 1511
	public string spriteName;

	// Token: 0x040005E8 RID: 1512
	private UISpriteData mSprite;

	// Token: 0x040005E9 RID: 1513
	private bool mIsValid;

	// Token: 0x040005EA RID: 1514
	private int mLength;

	// Token: 0x040005EB RID: 1515
	private int mOffsetX;

	// Token: 0x040005EC RID: 1516
	private int mOffsetY;

	// Token: 0x040005ED RID: 1517
	private int mWidth;

	// Token: 0x040005EE RID: 1518
	private int mHeight;

	// Token: 0x040005EF RID: 1519
	private int mAdvance;

	// Token: 0x040005F0 RID: 1520
	private Rect mUV;
}
