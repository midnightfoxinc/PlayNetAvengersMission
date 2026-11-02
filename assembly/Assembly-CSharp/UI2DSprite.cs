using System;
using UnityEngine;

// Token: 0x0200010D RID: 269
[ExecuteInEditMode]
[AddComponentMenu("NGUI/UI/NGUI Unity2D Sprite")]
public class UI2DSprite : UIBasicSprite
{
	// Token: 0x170000ED RID: 237
	// (get) Token: 0x06000843 RID: 2115 RVA: 0x0003B224 File Offset: 0x00039424
	// (set) Token: 0x06000844 RID: 2116 RVA: 0x0003B22C File Offset: 0x0003942C
	public Sprite sprite2D
	{
		get
		{
			return this.mSprite;
		}
		set
		{
			if (this.mSprite != value)
			{
				base.RemoveFromPanel();
				this.mSprite = value;
				this.nextSprite = null;
				base.CreatePanel();
			}
		}
	}

	// Token: 0x170000EE RID: 238
	// (get) Token: 0x06000845 RID: 2117 RVA: 0x0003B268 File Offset: 0x00039468
	// (set) Token: 0x06000846 RID: 2118 RVA: 0x0003B270 File Offset: 0x00039470
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
				this.mMat = value;
				this.mPMA = -1;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x170000EF RID: 239
	// (get) Token: 0x06000847 RID: 2119 RVA: 0x0003B2A0 File Offset: 0x000394A0
	// (set) Token: 0x06000848 RID: 2120 RVA: 0x0003B2F4 File Offset: 0x000394F4
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
				base.RemoveFromPanel();
				this.mShader = value;
				if (this.mMat == null)
				{
					this.mPMA = -1;
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x170000F0 RID: 240
	// (get) Token: 0x06000849 RID: 2121 RVA: 0x0003B340 File Offset: 0x00039540
	public override Texture mainTexture
	{
		get
		{
			if (this.mSprite != null)
			{
				return this.mSprite.texture;
			}
			if (this.mMat != null)
			{
				return this.mMat.mainTexture;
			}
			return null;
		}
	}

	// Token: 0x170000F1 RID: 241
	// (get) Token: 0x0600084A RID: 2122 RVA: 0x0003B388 File Offset: 0x00039588
	public override bool premultipliedAlpha
	{
		get
		{
			if (this.mPMA == -1)
			{
				Shader shader = this.shader;
				this.mPMA = ((!(shader != null) || !shader.name.Contains("Premultiplied")) ? 0 : 1);
			}
			return this.mPMA == 1;
		}
	}

	// Token: 0x170000F2 RID: 242
	// (get) Token: 0x0600084B RID: 2123 RVA: 0x0003B3E0 File Offset: 0x000395E0
	public override float pixelSize
	{
		get
		{
			return this.mPixelSize;
		}
	}

	// Token: 0x170000F3 RID: 243
	// (get) Token: 0x0600084C RID: 2124 RVA: 0x0003B3E8 File Offset: 0x000395E8
	public override Vector4 drawingDimensions
	{
		get
		{
			Vector2 pivotOffset = base.pivotOffset;
			float num = -pivotOffset.x * (float)this.mWidth;
			float num2 = -pivotOffset.y * (float)this.mHeight;
			float num3 = num + (float)this.mWidth;
			float num4 = num2 + (float)this.mHeight;
			if (this.mSprite != null && this.mType != UIBasicSprite.Type.Tiled)
			{
				int num5 = Mathf.RoundToInt(this.mSprite.rect.width);
				int num6 = Mathf.RoundToInt(this.mSprite.rect.height);
				int num7 = Mathf.RoundToInt(this.mSprite.textureRectOffset.x);
				int num8 = Mathf.RoundToInt(this.mSprite.textureRectOffset.y);
				int num9 = Mathf.RoundToInt(this.mSprite.rect.width - this.mSprite.textureRect.width - this.mSprite.textureRectOffset.x);
				int num10 = Mathf.RoundToInt(this.mSprite.rect.height - this.mSprite.textureRect.height - this.mSprite.textureRectOffset.y);
				float num11 = 1f;
				float num12 = 1f;
				if (num5 > 0 && num6 > 0 && (this.mType == UIBasicSprite.Type.Simple || this.mType == UIBasicSprite.Type.Filled))
				{
					if ((num5 & 1) != 0)
					{
						num9++;
					}
					if ((num6 & 1) != 0)
					{
						num10++;
					}
					num11 = 1f / (float)num5 * (float)this.mWidth;
					num12 = 1f / (float)num6 * (float)this.mHeight;
				}
				if (this.mFlip == UIBasicSprite.Flip.Horizontally || this.mFlip == UIBasicSprite.Flip.Both)
				{
					num += (float)num9 * num11;
					num3 -= (float)num7 * num11;
				}
				else
				{
					num += (float)num7 * num11;
					num3 -= (float)num9 * num11;
				}
				if (this.mFlip == UIBasicSprite.Flip.Vertically || this.mFlip == UIBasicSprite.Flip.Both)
				{
					num2 += (float)num10 * num12;
					num4 -= (float)num8 * num12;
				}
				else
				{
					num2 += (float)num8 * num12;
					num4 -= (float)num10 * num12;
				}
			}
			float num13;
			float num14;
			if (this.mFixedAspect)
			{
				num13 = 0f;
				num14 = 0f;
			}
			else
			{
				Vector4 vector = this.border * this.pixelSize;
				num13 = vector.x + vector.z;
				num14 = vector.y + vector.w;
			}
			float num15 = Mathf.Lerp(num, num3 - num13, this.mDrawRegion.x);
			float num16 = Mathf.Lerp(num2, num4 - num14, this.mDrawRegion.y);
			float num17 = Mathf.Lerp(num + num13, num3, this.mDrawRegion.z);
			float num18 = Mathf.Lerp(num2 + num14, num4, this.mDrawRegion.w);
			return new Vector4(num15, num16, num17, num18);
		}
	}

	// Token: 0x170000F4 RID: 244
	// (get) Token: 0x0600084D RID: 2125 RVA: 0x0003B704 File Offset: 0x00039904
	// (set) Token: 0x0600084E RID: 2126 RVA: 0x0003B70C File Offset: 0x0003990C
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

	// Token: 0x0600084F RID: 2127 RVA: 0x0003B72C File Offset: 0x0003992C
	protected override void OnUpdate()
	{
		if (this.nextSprite != null)
		{
			if (this.nextSprite != this.mSprite)
			{
				this.sprite2D = this.nextSprite;
			}
			this.nextSprite = null;
		}
		base.OnUpdate();
		if (this.mFixedAspect)
		{
			Texture mainTexture = this.mainTexture;
			if (mainTexture != null)
			{
				int num = Mathf.RoundToInt(this.mSprite.rect.width);
				int num2 = Mathf.RoundToInt(this.mSprite.rect.height);
				int num3 = Mathf.RoundToInt(this.mSprite.textureRectOffset.x);
				int num4 = Mathf.RoundToInt(this.mSprite.textureRectOffset.y);
				int num5 = Mathf.RoundToInt(this.mSprite.rect.width - this.mSprite.textureRect.width - this.mSprite.textureRectOffset.x);
				int num6 = Mathf.RoundToInt(this.mSprite.rect.height - this.mSprite.textureRect.height - this.mSprite.textureRectOffset.y);
				num += num3 + num5;
				num2 += num6 + num4;
				float num7 = (float)this.mWidth;
				float num8 = (float)this.mHeight;
				float num9 = num7 / num8;
				float num10 = (float)num / (float)num2;
				if (num10 < num9)
				{
					float num11 = (num7 - num8 * num10) / num7 * 0.5f;
					base.drawRegion = new Vector4(num11, 0f, 1f - num11, 1f);
				}
				else
				{
					float num12 = (num8 - num7 / num10) / num8 * 0.5f;
					base.drawRegion = new Vector4(0f, num12, 1f, 1f - num12);
				}
			}
		}
	}

	// Token: 0x06000850 RID: 2128 RVA: 0x0003B92C File Offset: 0x00039B2C
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
			Rect rect = this.mSprite.rect;
			int num = Mathf.RoundToInt(rect.width);
			int num2 = Mathf.RoundToInt(rect.height);
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

	// Token: 0x06000851 RID: 2129 RVA: 0x0003B9DC File Offset: 0x00039BDC
	public override void OnFill(BetterList<Vector3> verts, BetterList<Vector2> uvs, BetterList<Color32> cols)
	{
		Texture mainTexture = this.mainTexture;
		if (mainTexture == null)
		{
			return;
		}
		Rect rect = (!(this.mSprite != null)) ? new Rect(0f, 0f, (float)mainTexture.width, (float)mainTexture.height) : this.mSprite.textureRect;
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

	// Token: 0x04000791 RID: 1937
	[HideInInspector]
	[SerializeField]
	private Sprite mSprite;

	// Token: 0x04000792 RID: 1938
	[HideInInspector]
	[SerializeField]
	private Material mMat;

	// Token: 0x04000793 RID: 1939
	[HideInInspector]
	[SerializeField]
	private Shader mShader;

	// Token: 0x04000794 RID: 1940
	[HideInInspector]
	[SerializeField]
	private Vector4 mBorder = Vector4.zero;

	// Token: 0x04000795 RID: 1941
	[HideInInspector]
	[SerializeField]
	private bool mFixedAspect;

	// Token: 0x04000796 RID: 1942
	[SerializeField]
	[HideInInspector]
	private float mPixelSize = 1f;

	// Token: 0x04000797 RID: 1943
	public Sprite nextSprite;

	// Token: 0x04000798 RID: 1944
	[NonSerialized]
	private int mPMA = -1;
}
