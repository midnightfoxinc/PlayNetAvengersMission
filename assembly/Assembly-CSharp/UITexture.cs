using System;
using UnityEngine;

// Token: 0x02000137 RID: 311
[ExecuteInEditMode]
[AddComponentMenu("NGUI/UI/NGUI Texture")]
public class UITexture : UIBasicSprite
{
	// Token: 0x1700019B RID: 411
	// (get) Token: 0x06000A58 RID: 2648 RVA: 0x0004C068 File Offset: 0x0004A268
	// (set) Token: 0x06000A59 RID: 2649 RVA: 0x0004C0AC File Offset: 0x0004A2AC
	public override Texture mainTexture
	{
		get
		{
			if (this.mTexture != null)
			{
				return this.mTexture;
			}
			if (this.mMat != null)
			{
				return this.mMat.mainTexture;
			}
			return null;
		}
		set
		{
			if (this.mTexture != value)
			{
				if (this.drawCall != null && this.drawCall.widgetCount == 1 && this.mMat == null)
				{
					this.mTexture = value;
					this.drawCall.mainTexture = value;
				}
				else
				{
					base.RemoveFromPanel();
					this.mTexture = value;
					this.mPMA = -1;
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x1700019C RID: 412
	// (get) Token: 0x06000A5A RID: 2650 RVA: 0x0004C130 File Offset: 0x0004A330
	// (set) Token: 0x06000A5B RID: 2651 RVA: 0x0004C138 File Offset: 0x0004A338
	public override Material material
	{
		get
		{
			return this.mMat;
		}
		set
		{
			if (this.mMat != value)
			{
				base.RemoveFromPanel();
				this.mShader = null;
				this.mMat = value;
				this.mPMA = -1;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x1700019D RID: 413
	// (get) Token: 0x06000A5C RID: 2652 RVA: 0x0004C178 File Offset: 0x0004A378
	// (set) Token: 0x06000A5D RID: 2653 RVA: 0x0004C1CC File Offset: 0x0004A3CC
	public override Shader shader
	{
		get
		{
			if (this.mMat != null)
			{
				return this.mMat.shader;
			}
			if (this.mShader == null)
			{
				this.mShader = Shader.Find("Unlit/Transparent Colored");
			}
			return this.mShader;
		}
		set
		{
			if (this.mShader != value)
			{
				if (this.drawCall != null && this.drawCall.widgetCount == 1 && this.mMat == null)
				{
					this.mShader = value;
					this.drawCall.shader = value;
				}
				else
				{
					base.RemoveFromPanel();
					this.mShader = value;
					this.mPMA = -1;
					this.mMat = null;
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x1700019E RID: 414
	// (get) Token: 0x06000A5E RID: 2654 RVA: 0x0004C258 File Offset: 0x0004A458
	public override bool premultipliedAlpha
	{
		get
		{
			if (this.mPMA == -1)
			{
				Material material = this.material;
				this.mPMA = ((!(material != null) || !(material.shader != null) || !material.shader.name.Contains("Premultiplied")) ? 0 : 1);
			}
			return this.mPMA == 1;
		}
	}

	// Token: 0x1700019F RID: 415
	// (get) Token: 0x06000A5F RID: 2655 RVA: 0x0004C2C8 File Offset: 0x0004A4C8
	// (set) Token: 0x06000A60 RID: 2656 RVA: 0x0004C2D0 File Offset: 0x0004A4D0
	public override Vector4 border
	{
		get
		{
			return this.mBorder;
		}
		set
		{
			if (this.mBorder != value)
			{
				this.mBorder = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x170001A0 RID: 416
	// (get) Token: 0x06000A61 RID: 2657 RVA: 0x0004C2F0 File Offset: 0x0004A4F0
	// (set) Token: 0x06000A62 RID: 2658 RVA: 0x0004C2F8 File Offset: 0x0004A4F8
	public Rect uvRect
	{
		get
		{
			return this.mRect;
		}
		set
		{
			if (this.mRect != value)
			{
				this.mRect = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x170001A1 RID: 417
	// (get) Token: 0x06000A63 RID: 2659 RVA: 0x0004C318 File Offset: 0x0004A518
	public override Vector4 drawingDimensions
	{
		get
		{
			Vector2 pivotOffset = base.pivotOffset;
			float num = -pivotOffset.x * (float)this.mWidth;
			float num2 = -pivotOffset.y * (float)this.mHeight;
			float num3 = num + (float)this.mWidth;
			float num4 = num2 + (float)this.mHeight;
			if (this.mTexture != null && this.mType != UIBasicSprite.Type.Tiled)
			{
				int width = this.mTexture.width;
				int height = this.mTexture.height;
				int num5 = 0;
				int num6 = 0;
				float num7 = 1f;
				float num8 = 1f;
				if (width > 0 && height > 0 && (this.mType == UIBasicSprite.Type.Simple || this.mType == UIBasicSprite.Type.Filled))
				{
					if ((width & 1) != 0)
					{
						num5++;
					}
					if ((height & 1) != 0)
					{
						num6++;
					}
					num7 = 1f / (float)width * (float)this.mWidth;
					num8 = 1f / (float)height * (float)this.mHeight;
				}
				if (this.mFlip == UIBasicSprite.Flip.Horizontally || this.mFlip == UIBasicSprite.Flip.Both)
				{
					num += (float)num5 * num7;
				}
				else
				{
					num3 -= (float)num5 * num7;
				}
				if (this.mFlip == UIBasicSprite.Flip.Vertically || this.mFlip == UIBasicSprite.Flip.Both)
				{
					num2 += (float)num6 * num8;
				}
				else
				{
					num4 -= (float)num6 * num8;
				}
			}
			float num9;
			float num10;
			if (this.mFixedAspect)
			{
				num9 = 0f;
				num10 = 0f;
			}
			else
			{
				Vector4 border = this.border;
				num9 = border.x + border.z;
				num10 = border.y + border.w;
			}
			float num11 = Mathf.Lerp(num, num3 - num9, this.mDrawRegion.x);
			float num12 = Mathf.Lerp(num2, num4 - num10, this.mDrawRegion.y);
			float num13 = Mathf.Lerp(num + num9, num3, this.mDrawRegion.z);
			float num14 = Mathf.Lerp(num2 + num10, num4, this.mDrawRegion.w);
			return new Vector4(num11, num12, num13, num14);
		}
	}

	// Token: 0x170001A2 RID: 418
	// (get) Token: 0x06000A64 RID: 2660 RVA: 0x0004C52C File Offset: 0x0004A72C
	// (set) Token: 0x06000A65 RID: 2661 RVA: 0x0004C534 File Offset: 0x0004A734
	public bool fixedAspect
	{
		get
		{
			return this.mFixedAspect;
		}
		set
		{
			if (this.mFixedAspect != value)
			{
				this.mFixedAspect = value;
				this.mDrawRegion = new Vector4(0f, 0f, 1f, 1f);
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x06000A66 RID: 2662 RVA: 0x0004C57C File Offset: 0x0004A77C
	public override void MakePixelPerfect()
	{
		base.MakePixelPerfect();
		if (this.mType == UIBasicSprite.Type.Tiled)
		{
			return;
		}
		Texture mainTexture = this.mainTexture;
		if (mainTexture == null)
		{
			return;
		}
		if ((this.mType == UIBasicSprite.Type.Simple || this.mType == UIBasicSprite.Type.Filled || !base.hasBorder) && mainTexture != null)
		{
			int num = mainTexture.width;
			int num2 = mainTexture.height;
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

	// Token: 0x06000A67 RID: 2663 RVA: 0x0004C614 File Offset: 0x0004A814
	protected override void OnUpdate()
	{
		base.OnUpdate();
		if (this.mFixedAspect)
		{
			Texture mainTexture = this.mainTexture;
			if (mainTexture != null)
			{
				int num = mainTexture.width;
				int num2 = mainTexture.height;
				if ((num & 1) == 1)
				{
					num++;
				}
				if ((num2 & 1) == 1)
				{
					num2++;
				}
				float num3 = (float)this.mWidth;
				float num4 = (float)this.mHeight;
				float num5 = num3 / num4;
				float num6 = (float)num / (float)num2;
				if (num6 < num5)
				{
					float num7 = (num3 - num4 * num6) / num3 * 0.5f;
					base.drawRegion = new Vector4(num7, 0f, 1f - num7, 1f);
				}
				else
				{
					float num8 = (num4 - num3 / num6) / num4 * 0.5f;
					base.drawRegion = new Vector4(0f, num8, 1f, 1f - num8);
				}
			}
		}
	}

	// Token: 0x06000A68 RID: 2664 RVA: 0x0004C6FC File Offset: 0x0004A8FC
	public override void OnFill(BetterList<Vector3> verts, BetterList<Vector2> uvs, BetterList<Color32> cols)
	{
		Texture mainTexture = this.mainTexture;
		if (mainTexture == null)
		{
			return;
		}
		Rect rect;
		rect..ctor(this.mRect.x * (float)mainTexture.width, this.mRect.y * (float)mainTexture.height, (float)mainTexture.width * this.mRect.width, (float)mainTexture.height * this.mRect.height);
		Rect inner = rect;
		Vector4 border = this.border;
		inner.xMin += border.x;
		inner.yMin += border.y;
		inner.xMax -= border.z;
		inner.yMax -= border.w;
		float num = 1f / (float)mainTexture.width;
		float num2 = 1f / (float)mainTexture.height;
		rect.xMin *= num;
		rect.xMax *= num;
		rect.yMin *= num2;
		rect.yMax *= num2;
		inner.xMin *= num;
		inner.xMax *= num;
		inner.yMin *= num2;
		inner.yMax *= num2;
		int size = verts.size;
		base.Fill(verts, uvs, cols, rect, inner);
		if (this.onPostFill != null)
		{
			this.onPostFill(this, size, verts, uvs, cols);
		}
	}

	// Token: 0x04000978 RID: 2424
	[HideInInspector]
	[SerializeField]
	private Rect mRect = new Rect(0f, 0f, 1f, 1f);

	// Token: 0x04000979 RID: 2425
	[HideInInspector]
	[SerializeField]
	private Texture mTexture;

	// Token: 0x0400097A RID: 2426
	[SerializeField]
	[HideInInspector]
	private Material mMat;

	// Token: 0x0400097B RID: 2427
	[HideInInspector]
	[SerializeField]
	private Shader mShader;

	// Token: 0x0400097C RID: 2428
	[HideInInspector]
	[SerializeField]
	private Vector4 mBorder = Vector4.zero;

	// Token: 0x0400097D RID: 2429
	[HideInInspector]
	[SerializeField]
	private bool mFixedAspect;

	// Token: 0x0400097E RID: 2430
	[NonSerialized]
	private int mPMA = -1;
}
