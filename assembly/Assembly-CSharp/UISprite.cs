using System;
using UnityEngine;

// Token: 0x0200012F RID: 303
[AddComponentMenu("NGUI/UI/NGUI Sprite")]
[ExecuteInEditMode]
public class UISprite : UIBasicSprite
{
	// Token: 0x17000181 RID: 385
	// (get) Token: 0x06000A0D RID: 2573 RVA: 0x0004A0D0 File Offset: 0x000482D0
	public override Material material
	{
		get
		{
			return (!(this.mAtlas != null)) ? null : this.mAtlas.spriteMaterial;
		}
	}

	// Token: 0x17000182 RID: 386
	// (get) Token: 0x06000A0E RID: 2574 RVA: 0x0004A100 File Offset: 0x00048300
	// (set) Token: 0x06000A0F RID: 2575 RVA: 0x0004A108 File Offset: 0x00048308
	public UIAtlas atlas
	{
		get
		{
			return this.mAtlas;
		}
		set
		{
			if (this.mAtlas != value)
			{
				base.RemoveFromPanel();
				this.mAtlas = value;
				this.mSpriteSet = false;
				this.mSprite = null;
				if (string.IsNullOrEmpty(this.mSpriteName) && this.mAtlas != null && this.mAtlas.spriteList.Count > 0)
				{
					this.SetAtlasSprite(this.mAtlas.spriteList[0]);
					this.mSpriteName = this.mSprite.name;
				}
				if (!string.IsNullOrEmpty(this.mSpriteName))
				{
					string spriteName = this.mSpriteName;
					this.mSpriteName = string.Empty;
					this.spriteName = spriteName;
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x17000183 RID: 387
	// (get) Token: 0x06000A10 RID: 2576 RVA: 0x0004A1D0 File Offset: 0x000483D0
	// (set) Token: 0x06000A11 RID: 2577 RVA: 0x0004A1D8 File Offset: 0x000483D8
	public string spriteName
	{
		get
		{
			return this.mSpriteName;
		}
		set
		{
			if (string.IsNullOrEmpty(value))
			{
				if (string.IsNullOrEmpty(this.mSpriteName))
				{
					return;
				}
				this.mSpriteName = string.Empty;
				this.mSprite = null;
				this.mChanged = true;
				this.mSpriteSet = false;
			}
			else if (this.mSpriteName != value)
			{
				this.mSpriteName = value;
				this.mSprite = null;
				this.mChanged = true;
				this.mSpriteSet = false;
			}
		}
	}

	// Token: 0x17000184 RID: 388
	// (get) Token: 0x06000A12 RID: 2578 RVA: 0x0004A254 File Offset: 0x00048454
	public bool isValid
	{
		get
		{
			return this.GetAtlasSprite() != null;
		}
	}

	// Token: 0x17000185 RID: 389
	// (get) Token: 0x06000A13 RID: 2579 RVA: 0x0004A264 File Offset: 0x00048464
	// (set) Token: 0x06000A14 RID: 2580 RVA: 0x0004A274 File Offset: 0x00048474
	[Obsolete("Use 'centerType' instead")]
	public bool fillCenter
	{
		get
		{
			return this.centerType != UIBasicSprite.AdvancedType.Invisible;
		}
		set
		{
			if (value != (this.centerType != UIBasicSprite.AdvancedType.Invisible))
			{
				this.centerType = ((!value) ? UIBasicSprite.AdvancedType.Invisible : UIBasicSprite.AdvancedType.Sliced);
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000186 RID: 390
	// (get) Token: 0x06000A15 RID: 2581 RVA: 0x0004A2A4 File Offset: 0x000484A4
	// (set) Token: 0x06000A16 RID: 2582 RVA: 0x0004A2AC File Offset: 0x000484AC
	public bool applyGradient
	{
		get
		{
			return this.mApplyGradient;
		}
		set
		{
			if (this.mApplyGradient != value)
			{
				this.mApplyGradient = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000187 RID: 391
	// (get) Token: 0x06000A17 RID: 2583 RVA: 0x0004A2C8 File Offset: 0x000484C8
	// (set) Token: 0x06000A18 RID: 2584 RVA: 0x0004A2D0 File Offset: 0x000484D0
	public Color gradientTop
	{
		get
		{
			return this.mGradientTop;
		}
		set
		{
			if (this.mGradientTop != value)
			{
				this.mGradientTop = value;
				if (this.mApplyGradient)
				{
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x17000188 RID: 392
	// (get) Token: 0x06000A19 RID: 2585 RVA: 0x0004A2FC File Offset: 0x000484FC
	// (set) Token: 0x06000A1A RID: 2586 RVA: 0x0004A304 File Offset: 0x00048504
	public Color gradientBottom
	{
		get
		{
			return this.mGradientBottom;
		}
		set
		{
			if (this.mGradientBottom != value)
			{
				this.mGradientBottom = value;
				if (this.mApplyGradient)
				{
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x17000189 RID: 393
	// (get) Token: 0x06000A1B RID: 2587 RVA: 0x0004A330 File Offset: 0x00048530
	public override Vector4 border
	{
		get
		{
			UISpriteData atlasSprite = this.GetAtlasSprite();
			if (atlasSprite == null)
			{
				return base.border;
			}
			return new Vector4((float)atlasSprite.borderLeft, (float)atlasSprite.borderBottom, (float)atlasSprite.borderRight, (float)atlasSprite.borderTop);
		}
	}

	// Token: 0x1700018A RID: 394
	// (get) Token: 0x06000A1C RID: 2588 RVA: 0x0004A374 File Offset: 0x00048574
	public override float pixelSize
	{
		get
		{
			return (!(this.mAtlas != null)) ? 1f : this.mAtlas.pixelSize;
		}
	}

	// Token: 0x1700018B RID: 395
	// (get) Token: 0x06000A1D RID: 2589 RVA: 0x0004A3A8 File Offset: 0x000485A8
	public override int minWidth
	{
		get
		{
			if (this.type == UIBasicSprite.Type.Sliced || this.type == UIBasicSprite.Type.Advanced)
			{
				float pixelSize = this.pixelSize;
				Vector4 vector = this.border * this.pixelSize;
				int num = Mathf.RoundToInt(vector.x + vector.z);
				UISpriteData atlasSprite = this.GetAtlasSprite();
				if (atlasSprite != null)
				{
					num += Mathf.RoundToInt(pixelSize * (float)(atlasSprite.paddingLeft + atlasSprite.paddingRight));
				}
				return Mathf.Max(base.minWidth, ((num & 1) != 1) ? num : (num + 1));
			}
			return base.minWidth;
		}
	}

	// Token: 0x1700018C RID: 396
	// (get) Token: 0x06000A1E RID: 2590 RVA: 0x0004A444 File Offset: 0x00048644
	public override int minHeight
	{
		get
		{
			if (this.type == UIBasicSprite.Type.Sliced || this.type == UIBasicSprite.Type.Advanced)
			{
				float pixelSize = this.pixelSize;
				Vector4 vector = this.border * this.pixelSize;
				int num = Mathf.RoundToInt(vector.y + vector.w);
				UISpriteData atlasSprite = this.GetAtlasSprite();
				if (atlasSprite != null)
				{
					num += Mathf.RoundToInt(pixelSize * (float)(atlasSprite.paddingTop + atlasSprite.paddingBottom));
				}
				return Mathf.Max(base.minHeight, ((num & 1) != 1) ? num : (num + 1));
			}
			return base.minHeight;
		}
	}

	// Token: 0x1700018D RID: 397
	// (get) Token: 0x06000A1F RID: 2591 RVA: 0x0004A4E0 File Offset: 0x000486E0
	public override Vector4 drawingDimensions
	{
		get
		{
			Vector2 pivotOffset = base.pivotOffset;
			float num = -pivotOffset.x * (float)this.mWidth;
			float num2 = -pivotOffset.y * (float)this.mHeight;
			float num3 = num + (float)this.mWidth;
			float num4 = num2 + (float)this.mHeight;
			if (this.GetAtlasSprite() != null && this.mType != UIBasicSprite.Type.Tiled)
			{
				int num5 = this.mSprite.paddingLeft;
				int num6 = this.mSprite.paddingBottom;
				int num7 = this.mSprite.paddingRight;
				int num8 = this.mSprite.paddingTop;
				if (this.mType != UIBasicSprite.Type.Simple)
				{
					float pixelSize = this.pixelSize;
					if (pixelSize != 1f)
					{
						num5 = Mathf.RoundToInt(pixelSize * (float)num5);
						num6 = Mathf.RoundToInt(pixelSize * (float)num6);
						num7 = Mathf.RoundToInt(pixelSize * (float)num7);
						num8 = Mathf.RoundToInt(pixelSize * (float)num8);
					}
				}
				int num9 = this.mSprite.width + num5 + num7;
				int num10 = this.mSprite.height + num6 + num8;
				float num11 = 1f;
				float num12 = 1f;
				if (num9 > 0 && num10 > 0 && (this.mType == UIBasicSprite.Type.Simple || this.mType == UIBasicSprite.Type.Filled))
				{
					if ((num9 & 1) != 0)
					{
						num7++;
					}
					if ((num10 & 1) != 0)
					{
						num8++;
					}
					num11 = 1f / (float)num9 * (float)this.mWidth;
					num12 = 1f / (float)num10 * (float)this.mHeight;
				}
				if (this.mFlip == UIBasicSprite.Flip.Horizontally || this.mFlip == UIBasicSprite.Flip.Both)
				{
					num += (float)num7 * num11;
					num3 -= (float)num5 * num11;
				}
				else
				{
					num += (float)num5 * num11;
					num3 -= (float)num7 * num11;
				}
				if (this.mFlip == UIBasicSprite.Flip.Vertically || this.mFlip == UIBasicSprite.Flip.Both)
				{
					num2 += (float)num8 * num12;
					num4 -= (float)num6 * num12;
				}
				else
				{
					num2 += (float)num6 * num12;
					num4 -= (float)num8 * num12;
				}
			}
			Vector4 vector = (!(this.mAtlas != null)) ? Vector4.zero : (this.border * this.pixelSize);
			float num13 = vector.x + vector.z;
			float num14 = vector.y + vector.w;
			float num15 = Mathf.Lerp(num, num3 - num13, this.mDrawRegion.x);
			float num16 = Mathf.Lerp(num2, num4 - num14, this.mDrawRegion.y);
			float num17 = Mathf.Lerp(num + num13, num3, this.mDrawRegion.z);
			float num18 = Mathf.Lerp(num2 + num14, num4, this.mDrawRegion.w);
			return new Vector4(num15, num16, num17, num18);
		}
	}

	// Token: 0x1700018E RID: 398
	// (get) Token: 0x06000A20 RID: 2592 RVA: 0x0004A7AC File Offset: 0x000489AC
	public override bool premultipliedAlpha
	{
		get
		{
			return this.mAtlas != null && this.mAtlas.premultipliedAlpha;
		}
	}

	// Token: 0x06000A21 RID: 2593 RVA: 0x0004A7D0 File Offset: 0x000489D0
	public UISpriteData GetAtlasSprite()
	{
		if (!this.mSpriteSet)
		{
			this.mSprite = null;
		}
		if (this.mSprite == null && this.mAtlas != null)
		{
			if (!string.IsNullOrEmpty(this.mSpriteName))
			{
				UISpriteData sprite = this.mAtlas.GetSprite(this.mSpriteName);
				if (sprite == null)
				{
					return null;
				}
				this.SetAtlasSprite(sprite);
			}
			if (this.mSprite == null && this.mAtlas.spriteList.Count > 0)
			{
				UISpriteData uispriteData = this.mAtlas.spriteList[0];
				if (uispriteData == null)
				{
					return null;
				}
				this.SetAtlasSprite(uispriteData);
				if (this.mSprite == null)
				{
					Debug.LogError(this.mAtlas.name + " seems to have a null sprite!");
					return null;
				}
				this.mSpriteName = this.mSprite.name;
			}
		}
		return this.mSprite;
	}

	// Token: 0x06000A22 RID: 2594 RVA: 0x0004A8BC File Offset: 0x00048ABC
	protected void SetAtlasSprite(UISpriteData sp)
	{
		this.mChanged = true;
		this.mSpriteSet = true;
		if (sp != null)
		{
			this.mSprite = sp;
			this.mSpriteName = this.mSprite.name;
		}
		else
		{
			this.mSpriteName = ((this.mSprite == null) ? string.Empty : this.mSprite.name);
			this.mSprite = sp;
		}
	}

	// Token: 0x06000A23 RID: 2595 RVA: 0x0004A928 File Offset: 0x00048B28
	public override void MakePixelPerfect()
	{
		if (!this.isValid)
		{
			return;
		}
		base.MakePixelPerfect();
		if (this.mType == UIBasicSprite.Type.Tiled)
		{
			return;
		}
		UISpriteData atlasSprite = this.GetAtlasSprite();
		if (atlasSprite == null)
		{
			return;
		}
		Texture mainTexture = this.mainTexture;
		if (mainTexture == null)
		{
			return;
		}
		if ((this.mType == UIBasicSprite.Type.Simple || this.mType == UIBasicSprite.Type.Filled || !atlasSprite.hasBorder) && mainTexture != null)
		{
			int num = Mathf.RoundToInt(this.pixelSize * (float)(atlasSprite.width + atlasSprite.paddingLeft + atlasSprite.paddingRight));
			int num2 = Mathf.RoundToInt(this.pixelSize * (float)(atlasSprite.height + atlasSprite.paddingTop + atlasSprite.paddingBottom));
			if ((num & 1) == 1)
			{
				num++;
			}
			if ((num2 & 1) == 1)
			{
				num2++;
			}
			base.width = num;
			base.height = num2;
		}
	}

	// Token: 0x06000A24 RID: 2596 RVA: 0x0004AA10 File Offset: 0x00048C10
	protected override void OnInit()
	{
		if (!this.mFillCenter)
		{
			this.mFillCenter = true;
			this.centerType = UIBasicSprite.AdvancedType.Invisible;
		}
		base.OnInit();
	}

	// Token: 0x06000A25 RID: 2597 RVA: 0x0004AA34 File Offset: 0x00048C34
	protected override void OnUpdate()
	{
		base.OnUpdate();
		if (this.mChanged || !this.mSpriteSet)
		{
			this.mSpriteSet = true;
			this.mSprite = null;
			this.mChanged = true;
		}
	}

	// Token: 0x06000A26 RID: 2598 RVA: 0x0004AA68 File Offset: 0x00048C68
	public override void OnFill(BetterList<Vector3> verts, BetterList<Vector2> uvs, BetterList<Color32> cols)
	{
		Texture mainTexture = this.mainTexture;
		if (mainTexture == null)
		{
			return;
		}
		if (this.mSprite == null)
		{
			this.mSprite = this.atlas.GetSprite(this.spriteName);
		}
		if (this.mSprite == null)
		{
			return;
		}
		Rect rect;
		rect..ctor((float)this.mSprite.x, (float)this.mSprite.y, (float)this.mSprite.width, (float)this.mSprite.height);
		Rect rect2;
		rect2..ctor((float)(this.mSprite.x + this.mSprite.borderLeft), (float)(this.mSprite.y + this.mSprite.borderTop), (float)(this.mSprite.width - this.mSprite.borderLeft - this.mSprite.borderRight), (float)(this.mSprite.height - this.mSprite.borderBottom - this.mSprite.borderTop));
		rect = NGUIMath.ConvertToTexCoords(rect, mainTexture.width, mainTexture.height);
		rect2 = NGUIMath.ConvertToTexCoords(rect2, mainTexture.width, mainTexture.height);
		int size = verts.size;
		base.Fill(verts, uvs, cols, rect, rect2);
		if (this.onPostFill != null)
		{
			this.onPostFill(this, size, verts, uvs, cols);
		}
	}

	// Token: 0x04000935 RID: 2357
	[SerializeField]
	[HideInInspector]
	private UIAtlas mAtlas;

	// Token: 0x04000936 RID: 2358
	[SerializeField]
	[HideInInspector]
	private string mSpriteName;

	// Token: 0x04000937 RID: 2359
	[SerializeField]
	[HideInInspector]
	private bool mFillCenter = true;

	// Token: 0x04000938 RID: 2360
	[NonSerialized]
	protected UISpriteData mSprite;

	// Token: 0x04000939 RID: 2361
	[NonSerialized]
	private bool mSpriteSet;
}
