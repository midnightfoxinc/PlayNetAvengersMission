using System;
using System.Diagnostics;
using UnityEngine;

// Token: 0x020000F7 RID: 247
[AddComponentMenu("NGUI/UI/NGUI Widget")]
[ExecuteInEditMode]
public class UIWidget : UIRect
{
	// Token: 0x170000B2 RID: 178
	// (get) Token: 0x06000751 RID: 1873 RVA: 0x00036F74 File Offset: 0x00035174
	// (set) Token: 0x06000752 RID: 1874 RVA: 0x00036F7C File Offset: 0x0003517C
	public UIDrawCall.OnRenderCallback onRender
	{
		get
		{
			return this.mOnRender;
		}
		set
		{
			if (this.mOnRender != value)
			{
				if (this.drawCall != null && this.drawCall.onRender != null && this.mOnRender != null)
				{
					UIDrawCall uidrawCall = this.drawCall;
					uidrawCall.onRender = (UIDrawCall.OnRenderCallback)Delegate.Remove(uidrawCall.onRender, this.mOnRender);
				}
				this.mOnRender = value;
				if (this.drawCall != null)
				{
					UIDrawCall uidrawCall2 = this.drawCall;
					uidrawCall2.onRender = (UIDrawCall.OnRenderCallback)Delegate.Combine(uidrawCall2.onRender, value);
				}
			}
		}
	}

	// Token: 0x170000B3 RID: 179
	// (get) Token: 0x06000753 RID: 1875 RVA: 0x0003701C File Offset: 0x0003521C
	// (set) Token: 0x06000754 RID: 1876 RVA: 0x00037024 File Offset: 0x00035224
	public Vector4 drawRegion
	{
		get
		{
			return this.mDrawRegion;
		}
		set
		{
			if (this.mDrawRegion != value)
			{
				this.mDrawRegion = value;
				if (this.autoResizeBoxCollider)
				{
					this.ResizeCollider();
				}
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x170000B4 RID: 180
	// (get) Token: 0x06000755 RID: 1877 RVA: 0x00037058 File Offset: 0x00035258
	public Vector2 pivotOffset
	{
		get
		{
			return NGUIMath.GetPivotOffset(this.pivot);
		}
	}

	// Token: 0x170000B5 RID: 181
	// (get) Token: 0x06000756 RID: 1878 RVA: 0x00037068 File Offset: 0x00035268
	// (set) Token: 0x06000757 RID: 1879 RVA: 0x00037070 File Offset: 0x00035270
	public int width
	{
		get
		{
			return this.mWidth;
		}
		set
		{
			int minWidth = this.minWidth;
			if (value < minWidth)
			{
				value = minWidth;
			}
			if (this.mWidth != value && this.keepAspectRatio != UIWidget.AspectRatioSource.BasedOnHeight)
			{
				if (this.isAnchoredHorizontally)
				{
					if (this.leftAnchor.target != null && this.rightAnchor.target != null)
					{
						if (this.mPivot == UIWidget.Pivot.BottomLeft || this.mPivot == UIWidget.Pivot.Left || this.mPivot == UIWidget.Pivot.TopLeft)
						{
							NGUIMath.AdjustWidget(this, 0f, 0f, (float)(value - this.mWidth), 0f);
						}
						else if (this.mPivot == UIWidget.Pivot.BottomRight || this.mPivot == UIWidget.Pivot.Right || this.mPivot == UIWidget.Pivot.TopRight)
						{
							NGUIMath.AdjustWidget(this, (float)(this.mWidth - value), 0f, 0f, 0f);
						}
						else
						{
							int num = value - this.mWidth;
							num -= (num & 1);
							if (num != 0)
							{
								NGUIMath.AdjustWidget(this, (float)(-(float)num) * 0.5f, 0f, (float)num * 0.5f, 0f);
							}
						}
					}
					else if (this.leftAnchor.target != null)
					{
						NGUIMath.AdjustWidget(this, 0f, 0f, (float)(value - this.mWidth), 0f);
					}
					else
					{
						NGUIMath.AdjustWidget(this, (float)(this.mWidth - value), 0f, 0f, 0f);
					}
				}
				else
				{
					this.SetDimensions(value, this.mHeight);
				}
			}
		}
	}

	// Token: 0x170000B6 RID: 182
	// (get) Token: 0x06000758 RID: 1880 RVA: 0x00037210 File Offset: 0x00035410
	// (set) Token: 0x06000759 RID: 1881 RVA: 0x00037218 File Offset: 0x00035418
	public int height
	{
		get
		{
			return this.mHeight;
		}
		set
		{
			int minHeight = this.minHeight;
			if (value < minHeight)
			{
				value = minHeight;
			}
			if (this.mHeight != value && this.keepAspectRatio != UIWidget.AspectRatioSource.BasedOnWidth)
			{
				if (this.isAnchoredVertically)
				{
					if (this.bottomAnchor.target != null && this.topAnchor.target != null)
					{
						if (this.mPivot == UIWidget.Pivot.BottomLeft || this.mPivot == UIWidget.Pivot.Bottom || this.mPivot == UIWidget.Pivot.BottomRight)
						{
							NGUIMath.AdjustWidget(this, 0f, 0f, 0f, (float)(value - this.mHeight));
						}
						else if (this.mPivot == UIWidget.Pivot.TopLeft || this.mPivot == UIWidget.Pivot.Top || this.mPivot == UIWidget.Pivot.TopRight)
						{
							NGUIMath.AdjustWidget(this, 0f, (float)(this.mHeight - value), 0f, 0f);
						}
						else
						{
							int num = value - this.mHeight;
							num -= (num & 1);
							if (num != 0)
							{
								NGUIMath.AdjustWidget(this, 0f, (float)(-(float)num) * 0.5f, 0f, (float)num * 0.5f);
							}
						}
					}
					else if (this.bottomAnchor.target != null)
					{
						NGUIMath.AdjustWidget(this, 0f, 0f, 0f, (float)(value - this.mHeight));
					}
					else
					{
						NGUIMath.AdjustWidget(this, 0f, (float)(this.mHeight - value), 0f, 0f);
					}
				}
				else
				{
					this.SetDimensions(this.mWidth, value);
				}
			}
		}
	}

	// Token: 0x170000B7 RID: 183
	// (get) Token: 0x0600075A RID: 1882 RVA: 0x000373B8 File Offset: 0x000355B8
	// (set) Token: 0x0600075B RID: 1883 RVA: 0x000373C0 File Offset: 0x000355C0
	public Color color
	{
		get
		{
			return this.mColor;
		}
		set
		{
			if (this.mColor != value)
			{
				bool includeChildren = this.mColor.a != value.a;
				this.mColor = value;
				this.Invalidate(includeChildren);
			}
		}
	}

	// Token: 0x170000B8 RID: 184
	// (get) Token: 0x0600075C RID: 1884 RVA: 0x00037404 File Offset: 0x00035604
	// (set) Token: 0x0600075D RID: 1885 RVA: 0x00037414 File Offset: 0x00035614
	public override float alpha
	{
		get
		{
			return this.mColor.a;
		}
		set
		{
			if (this.mColor.a != value)
			{
				this.mColor.a = value;
				this.Invalidate(true);
			}
		}
	}

	// Token: 0x170000B9 RID: 185
	// (get) Token: 0x0600075E RID: 1886 RVA: 0x00037448 File Offset: 0x00035648
	public bool isVisible
	{
		get
		{
			return this.mIsVisibleByPanel && this.mIsVisibleByAlpha && this.mIsInFront && this.finalAlpha > 0.001f && NGUITools.GetActive(this);
		}
	}

	// Token: 0x170000BA RID: 186
	// (get) Token: 0x0600075F RID: 1887 RVA: 0x00037490 File Offset: 0x00035690
	public bool hasVertices
	{
		get
		{
			return this.geometry != null && this.geometry.hasVertices;
		}
	}

	// Token: 0x170000BB RID: 187
	// (get) Token: 0x06000760 RID: 1888 RVA: 0x000374AC File Offset: 0x000356AC
	// (set) Token: 0x06000761 RID: 1889 RVA: 0x000374B4 File Offset: 0x000356B4
	public UIWidget.Pivot rawPivot
	{
		get
		{
			return this.mPivot;
		}
		set
		{
			if (this.mPivot != value)
			{
				this.mPivot = value;
				if (this.autoResizeBoxCollider)
				{
					this.ResizeCollider();
				}
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x170000BC RID: 188
	// (get) Token: 0x06000762 RID: 1890 RVA: 0x000374EC File Offset: 0x000356EC
	// (set) Token: 0x06000763 RID: 1891 RVA: 0x000374F4 File Offset: 0x000356F4
	public UIWidget.Pivot pivot
	{
		get
		{
			return this.mPivot;
		}
		set
		{
			if (this.mPivot != value)
			{
				Vector3 vector = this.worldCorners[0];
				this.mPivot = value;
				this.mChanged = true;
				Vector3 vector2 = this.worldCorners[0];
				Transform cachedTransform = base.cachedTransform;
				Vector3 vector3 = cachedTransform.position;
				float z = cachedTransform.localPosition.z;
				vector3.x += vector.x - vector2.x;
				vector3.y += vector.y - vector2.y;
				base.cachedTransform.position = vector3;
				vector3 = base.cachedTransform.localPosition;
				vector3.x = Mathf.Round(vector3.x);
				vector3.y = Mathf.Round(vector3.y);
				vector3.z = z;
				base.cachedTransform.localPosition = vector3;
			}
		}
	}

	// Token: 0x170000BD RID: 189
	// (get) Token: 0x06000764 RID: 1892 RVA: 0x000375EC File Offset: 0x000357EC
	// (set) Token: 0x06000765 RID: 1893 RVA: 0x000375F4 File Offset: 0x000357F4
	public int depth
	{
		get
		{
			return this.mDepth;
		}
		set
		{
			if (this.mDepth != value)
			{
				if (this.panel != null)
				{
					this.panel.RemoveWidget(this);
				}
				this.mDepth = value;
				if (this.panel != null)
				{
					this.panel.AddWidget(this);
					if (!Application.isPlaying)
					{
						this.panel.SortWidgets();
						this.panel.RebuildAllDrawCalls();
					}
				}
			}
		}
	}

	// Token: 0x170000BE RID: 190
	// (get) Token: 0x06000766 RID: 1894 RVA: 0x00037670 File Offset: 0x00035870
	public int raycastDepth
	{
		get
		{
			if (this.panel == null)
			{
				this.CreatePanel();
			}
			return (!(this.panel != null)) ? this.mDepth : (this.mDepth + this.panel.depth * 1000);
		}
	}

	// Token: 0x170000BF RID: 191
	// (get) Token: 0x06000767 RID: 1895 RVA: 0x000376CC File Offset: 0x000358CC
	public override Vector3[] localCorners
	{
		get
		{
			Vector2 pivotOffset = this.pivotOffset;
			float num = -pivotOffset.x * (float)this.mWidth;
			float num2 = -pivotOffset.y * (float)this.mHeight;
			float num3 = num + (float)this.mWidth;
			float num4 = num2 + (float)this.mHeight;
			this.mCorners[0] = new Vector3(num, num2);
			this.mCorners[1] = new Vector3(num, num4);
			this.mCorners[2] = new Vector3(num3, num4);
			this.mCorners[3] = new Vector3(num3, num2);
			return this.mCorners;
		}
	}

	// Token: 0x170000C0 RID: 192
	// (get) Token: 0x06000768 RID: 1896 RVA: 0x00037780 File Offset: 0x00035980
	public virtual Vector2 localSize
	{
		get
		{
			Vector3[] localCorners = this.localCorners;
			return localCorners[2] - localCorners[0];
		}
	}

	// Token: 0x170000C1 RID: 193
	// (get) Token: 0x06000769 RID: 1897 RVA: 0x000377B8 File Offset: 0x000359B8
	public Vector3 localCenter
	{
		get
		{
			Vector3[] localCorners = this.localCorners;
			return Vector3.Lerp(localCorners[0], localCorners[2], 0.5f);
		}
	}

	// Token: 0x170000C2 RID: 194
	// (get) Token: 0x0600076A RID: 1898 RVA: 0x000377F0 File Offset: 0x000359F0
	public override Vector3[] worldCorners
	{
		get
		{
			Vector2 pivotOffset = this.pivotOffset;
			float num = -pivotOffset.x * (float)this.mWidth;
			float num2 = -pivotOffset.y * (float)this.mHeight;
			float num3 = num + (float)this.mWidth;
			float num4 = num2 + (float)this.mHeight;
			Transform cachedTransform = base.cachedTransform;
			this.mCorners[0] = cachedTransform.TransformPoint(num, num2, 0f);
			this.mCorners[1] = cachedTransform.TransformPoint(num, num4, 0f);
			this.mCorners[2] = cachedTransform.TransformPoint(num3, num4, 0f);
			this.mCorners[3] = cachedTransform.TransformPoint(num3, num2, 0f);
			return this.mCorners;
		}
	}

	// Token: 0x170000C3 RID: 195
	// (get) Token: 0x0600076B RID: 1899 RVA: 0x000378C8 File Offset: 0x00035AC8
	public Vector3 worldCenter
	{
		get
		{
			return base.cachedTransform.TransformPoint(this.localCenter);
		}
	}

	// Token: 0x170000C4 RID: 196
	// (get) Token: 0x0600076C RID: 1900 RVA: 0x000378DC File Offset: 0x00035ADC
	public virtual Vector4 drawingDimensions
	{
		get
		{
			Vector2 pivotOffset = this.pivotOffset;
			float num = -pivotOffset.x * (float)this.mWidth;
			float num2 = -pivotOffset.y * (float)this.mHeight;
			float num3 = num + (float)this.mWidth;
			float num4 = num2 + (float)this.mHeight;
			return new Vector4((this.mDrawRegion.x != 0f) ? Mathf.Lerp(num, num3, this.mDrawRegion.x) : num, (this.mDrawRegion.y != 0f) ? Mathf.Lerp(num2, num4, this.mDrawRegion.y) : num2, (this.mDrawRegion.z != 1f) ? Mathf.Lerp(num, num3, this.mDrawRegion.z) : num3, (this.mDrawRegion.w != 1f) ? Mathf.Lerp(num2, num4, this.mDrawRegion.w) : num4);
		}
	}

	// Token: 0x170000C5 RID: 197
	// (get) Token: 0x0600076D RID: 1901 RVA: 0x000379E4 File Offset: 0x00035BE4
	// (set) Token: 0x0600076E RID: 1902 RVA: 0x000379E8 File Offset: 0x00035BE8
	public virtual Material material
	{
		get
		{
			return null;
		}
		set
		{
			throw new NotImplementedException(base.GetType() + " has no material setter");
		}
	}

	// Token: 0x170000C6 RID: 198
	// (get) Token: 0x0600076F RID: 1903 RVA: 0x00037A00 File Offset: 0x00035C00
	// (set) Token: 0x06000770 RID: 1904 RVA: 0x00037A2C File Offset: 0x00035C2C
	public virtual Texture mainTexture
	{
		get
		{
			Material material = this.material;
			return (!(material != null)) ? null : material.mainTexture;
		}
		set
		{
			throw new NotImplementedException(base.GetType() + " has no mainTexture setter");
		}
	}

	// Token: 0x170000C7 RID: 199
	// (get) Token: 0x06000771 RID: 1905 RVA: 0x00037A44 File Offset: 0x00035C44
	// (set) Token: 0x06000772 RID: 1906 RVA: 0x00037A70 File Offset: 0x00035C70
	public virtual Shader shader
	{
		get
		{
			Material material = this.material;
			return (!(material != null)) ? null : material.shader;
		}
		set
		{
			throw new NotImplementedException(base.GetType() + " has no shader setter");
		}
	}

	// Token: 0x170000C8 RID: 200
	// (get) Token: 0x06000773 RID: 1907 RVA: 0x00037A88 File Offset: 0x00035C88
	[Obsolete("There is no relative scale anymore. Widgets now have width and height instead")]
	public Vector2 relativeSize
	{
		get
		{
			return Vector2.one;
		}
	}

	// Token: 0x170000C9 RID: 201
	// (get) Token: 0x06000774 RID: 1908 RVA: 0x00037A90 File Offset: 0x00035C90
	public bool hasBoxCollider
	{
		get
		{
			BoxCollider boxCollider = base.GetComponent<Collider>() as BoxCollider;
			return boxCollider != null || base.GetComponent<BoxCollider2D>() != null;
		}
	}

	// Token: 0x06000775 RID: 1909 RVA: 0x00037AC4 File Offset: 0x00035CC4
	public void SetDimensions(int w, int h)
	{
		if (this.mWidth != w || this.mHeight != h)
		{
			this.mWidth = w;
			this.mHeight = h;
			if (this.keepAspectRatio == UIWidget.AspectRatioSource.BasedOnWidth)
			{
				this.mHeight = Mathf.RoundToInt((float)this.mWidth / this.aspectRatio);
			}
			else if (this.keepAspectRatio == UIWidget.AspectRatioSource.BasedOnHeight)
			{
				this.mWidth = Mathf.RoundToInt((float)this.mHeight * this.aspectRatio);
			}
			else if (this.keepAspectRatio == UIWidget.AspectRatioSource.Free)
			{
				this.aspectRatio = (float)this.mWidth / (float)this.mHeight;
			}
			this.mMoved = true;
			if (this.autoResizeBoxCollider)
			{
				this.ResizeCollider();
			}
			this.MarkAsChanged();
		}
	}

	// Token: 0x06000776 RID: 1910 RVA: 0x00037B8C File Offset: 0x00035D8C
	public override Vector3[] GetSides(Transform relativeTo)
	{
		Vector2 pivotOffset = this.pivotOffset;
		float num = -pivotOffset.x * (float)this.mWidth;
		float num2 = -pivotOffset.y * (float)this.mHeight;
		float num3 = num + (float)this.mWidth;
		float num4 = num2 + (float)this.mHeight;
		float num5 = (num + num3) * 0.5f;
		float num6 = (num2 + num4) * 0.5f;
		Transform cachedTransform = base.cachedTransform;
		this.mCorners[0] = cachedTransform.TransformPoint(num, num6, 0f);
		this.mCorners[1] = cachedTransform.TransformPoint(num5, num4, 0f);
		this.mCorners[2] = cachedTransform.TransformPoint(num3, num6, 0f);
		this.mCorners[3] = cachedTransform.TransformPoint(num5, num2, 0f);
		if (relativeTo != null)
		{
			for (int i = 0; i < 4; i++)
			{
				this.mCorners[i] = relativeTo.InverseTransformPoint(this.mCorners[i]);
			}
		}
		return this.mCorners;
	}

	// Token: 0x06000777 RID: 1911 RVA: 0x00037CCC File Offset: 0x00035ECC
	public override float CalculateFinalAlpha(int frameID)
	{
		if (this.mAlphaFrameID != frameID)
		{
			this.mAlphaFrameID = frameID;
			this.UpdateFinalAlpha(frameID);
		}
		return this.finalAlpha;
	}

	// Token: 0x06000778 RID: 1912 RVA: 0x00037CFC File Offset: 0x00035EFC
	protected void UpdateFinalAlpha(int frameID)
	{
		if (!this.mIsVisibleByAlpha || !this.mIsInFront)
		{
			this.finalAlpha = 0f;
		}
		else
		{
			UIRect parent = base.parent;
			this.finalAlpha = ((!(parent != null)) ? this.mColor.a : (parent.CalculateFinalAlpha(frameID) * this.mColor.a));
		}
	}

	// Token: 0x06000779 RID: 1913 RVA: 0x00037D6C File Offset: 0x00035F6C
	public override void Invalidate(bool includeChildren)
	{
		this.mChanged = true;
		this.mAlphaFrameID = -1;
		if (this.panel != null)
		{
			bool visibleByPanel = (!this.hideIfOffScreen && !this.panel.hasCumulativeClipping) || this.panel.IsVisible(this);
			this.UpdateVisibility(this.CalculateCumulativeAlpha(Time.frameCount) > 0.001f, visibleByPanel);
			this.UpdateFinalAlpha(Time.frameCount);
			if (includeChildren)
			{
				base.Invalidate(true);
			}
		}
	}

	// Token: 0x0600077A RID: 1914 RVA: 0x00037DF8 File Offset: 0x00035FF8
	public float CalculateCumulativeAlpha(int frameID)
	{
		UIRect parent = base.parent;
		return (!(parent != null)) ? this.mColor.a : (parent.CalculateFinalAlpha(frameID) * this.mColor.a);
	}

	// Token: 0x0600077B RID: 1915 RVA: 0x00037E3C File Offset: 0x0003603C
	public override void SetRect(float x, float y, float width, float height)
	{
		Vector2 pivotOffset = this.pivotOffset;
		float num = Mathf.Lerp(x, x + width, pivotOffset.x);
		float num2 = Mathf.Lerp(y, y + height, pivotOffset.y);
		int num3 = Mathf.FloorToInt(width + 0.5f);
		int num4 = Mathf.FloorToInt(height + 0.5f);
		if (pivotOffset.x == 0.5f)
		{
			num3 = num3 >> 1 << 1;
		}
		if (pivotOffset.y == 0.5f)
		{
			num4 = num4 >> 1 << 1;
		}
		Transform transform = base.cachedTransform;
		Vector3 localPosition = transform.localPosition;
		localPosition.x = Mathf.Floor(num + 0.5f);
		localPosition.y = Mathf.Floor(num2 + 0.5f);
		if (num3 < this.minWidth)
		{
			num3 = this.minWidth;
		}
		if (num4 < this.minHeight)
		{
			num4 = this.minHeight;
		}
		transform.localPosition = localPosition;
		this.width = num3;
		this.height = num4;
		if (base.isAnchored)
		{
			transform = transform.parent;
			if (this.leftAnchor.target)
			{
				this.leftAnchor.SetHorizontal(transform, x);
			}
			if (this.rightAnchor.target)
			{
				this.rightAnchor.SetHorizontal(transform, x + width);
			}
			if (this.bottomAnchor.target)
			{
				this.bottomAnchor.SetVertical(transform, y);
			}
			if (this.topAnchor.target)
			{
				this.topAnchor.SetVertical(transform, y + height);
			}
		}
	}

	// Token: 0x0600077C RID: 1916 RVA: 0x00037FDC File Offset: 0x000361DC
	public void ResizeCollider()
	{
		if (NGUITools.GetActive(this))
		{
			NGUITools.UpdateWidgetCollider(base.gameObject);
		}
	}

	// Token: 0x0600077D RID: 1917 RVA: 0x00037FF4 File Offset: 0x000361F4
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static int FullCompareFunc(UIWidget left, UIWidget right)
	{
		int num = UIPanel.CompareFunc(left.panel, right.panel);
		return (num != 0) ? num : UIWidget.PanelCompareFunc(left, right);
	}

	// Token: 0x0600077E RID: 1918 RVA: 0x00038028 File Offset: 0x00036228
	[DebuggerStepThrough]
	[DebuggerHidden]
	public static int PanelCompareFunc(UIWidget left, UIWidget right)
	{
		if (left.mDepth < right.mDepth)
		{
			return -1;
		}
		if (left.mDepth > right.mDepth)
		{
			return 1;
		}
		Material material = left.material;
		Material material2 = right.material;
		if (material == material2)
		{
			return 0;
		}
		if (material == null)
		{
			return 1;
		}
		if (material2 == null)
		{
			return -1;
		}
		return (material.GetInstanceID() >= material2.GetInstanceID()) ? 1 : -1;
	}

	// Token: 0x0600077F RID: 1919 RVA: 0x000380AC File Offset: 0x000362AC
	public Bounds CalculateBounds()
	{
		return this.CalculateBounds(null);
	}

	// Token: 0x06000780 RID: 1920 RVA: 0x000380B8 File Offset: 0x000362B8
	public Bounds CalculateBounds(Transform relativeParent)
	{
		if (relativeParent == null)
		{
			Vector3[] localCorners = this.localCorners;
			Bounds result;
			result..ctor(localCorners[0], Vector3.zero);
			for (int i = 1; i < 4; i++)
			{
				result.Encapsulate(localCorners[i]);
			}
			return result;
		}
		Matrix4x4 worldToLocalMatrix = relativeParent.worldToLocalMatrix;
		Vector3[] worldCorners = this.worldCorners;
		Bounds result2;
		result2..ctor(worldToLocalMatrix.MultiplyPoint3x4(worldCorners[0]), Vector3.zero);
		for (int j = 1; j < 4; j++)
		{
			result2.Encapsulate(worldToLocalMatrix.MultiplyPoint3x4(worldCorners[j]));
		}
		return result2;
	}

	// Token: 0x06000781 RID: 1921 RVA: 0x0003817C File Offset: 0x0003637C
	public void SetDirty()
	{
		if (this.drawCall != null)
		{
			this.drawCall.isDirty = true;
		}
		else if (this.isVisible && this.hasVertices)
		{
			this.CreatePanel();
		}
	}

	// Token: 0x06000782 RID: 1922 RVA: 0x000381C8 File Offset: 0x000363C8
	public void RemoveFromPanel()
	{
		if (this.panel != null)
		{
			this.panel.RemoveWidget(this);
			this.panel = null;
		}
		this.drawCall = null;
	}

	// Token: 0x06000783 RID: 1923 RVA: 0x000381F8 File Offset: 0x000363F8
	public virtual void MarkAsChanged()
	{
		if (NGUITools.GetActive(this))
		{
			this.mChanged = true;
			if (this.panel != null && base.enabled && NGUITools.GetActive(base.gameObject) && !this.mPlayMode)
			{
				this.SetDirty();
				this.CheckLayer();
			}
		}
	}

	// Token: 0x06000784 RID: 1924 RVA: 0x0003825C File Offset: 0x0003645C
	public UIPanel CreatePanel()
	{
		if (this.mStarted && this.panel == null && base.enabled && NGUITools.GetActive(base.gameObject))
		{
			this.panel = UIPanel.Find(base.cachedTransform, true, base.cachedGameObject.layer);
			if (this.panel != null)
			{
				this.mParentFound = false;
				this.panel.AddWidget(this);
				this.CheckLayer();
				this.Invalidate(true);
			}
		}
		return this.panel;
	}

	// Token: 0x06000785 RID: 1925 RVA: 0x000382F4 File Offset: 0x000364F4
	public void CheckLayer()
	{
		if (this.panel != null && this.panel.gameObject.layer != base.gameObject.layer)
		{
			Debug.LogWarning("You can't place widgets on a layer different than the UIPanel that manages them.\nIf you want to move widgets to a different layer, parent them to a new panel instead.", this);
			base.gameObject.layer = this.panel.gameObject.layer;
		}
	}

	// Token: 0x06000786 RID: 1926 RVA: 0x00038358 File Offset: 0x00036558
	public override void ParentHasChanged()
	{
		base.ParentHasChanged();
		if (this.panel != null)
		{
			UIPanel uipanel = UIPanel.Find(base.cachedTransform, true, base.cachedGameObject.layer);
			if (this.panel != uipanel)
			{
				this.RemoveFromPanel();
				this.CreatePanel();
			}
		}
	}

	// Token: 0x06000787 RID: 1927 RVA: 0x000383B4 File Offset: 0x000365B4
	protected override void Awake()
	{
		base.Awake();
		this.mPlayMode = Application.isPlaying;
	}

	// Token: 0x06000788 RID: 1928 RVA: 0x000383C8 File Offset: 0x000365C8
	protected override void OnInit()
	{
		base.OnInit();
		this.RemoveFromPanel();
		this.mMoved = true;
		base.Update();
	}

	// Token: 0x06000789 RID: 1929 RVA: 0x000383E4 File Offset: 0x000365E4
	protected virtual void UpgradeFrom265()
	{
		Vector3 localScale = base.cachedTransform.localScale;
		this.mWidth = Mathf.Abs(Mathf.RoundToInt(localScale.x));
		this.mHeight = Mathf.Abs(Mathf.RoundToInt(localScale.y));
		NGUITools.UpdateWidgetCollider(base.gameObject, true);
	}

	// Token: 0x0600078A RID: 1930 RVA: 0x00038438 File Offset: 0x00036638
	protected override void OnStart()
	{
		this.CreatePanel();
	}

	// Token: 0x0600078B RID: 1931 RVA: 0x00038444 File Offset: 0x00036644
	protected override void OnAnchor()
	{
		Transform cachedTransform = base.cachedTransform;
		Transform parent = cachedTransform.parent;
		Vector3 localPosition = cachedTransform.localPosition;
		Vector2 pivotOffset = this.pivotOffset;
		float num;
		float num2;
		float num3;
		float num4;
		if (this.leftAnchor.target == this.bottomAnchor.target && this.leftAnchor.target == this.rightAnchor.target && this.leftAnchor.target == this.topAnchor.target)
		{
			Vector3[] sides = this.leftAnchor.GetSides(parent);
			if (sides != null)
			{
				num = NGUIMath.Lerp(sides[0].x, sides[2].x, this.leftAnchor.relative) + (float)this.leftAnchor.absolute;
				num2 = NGUIMath.Lerp(sides[0].x, sides[2].x, this.rightAnchor.relative) + (float)this.rightAnchor.absolute;
				num3 = NGUIMath.Lerp(sides[3].y, sides[1].y, this.bottomAnchor.relative) + (float)this.bottomAnchor.absolute;
				num4 = NGUIMath.Lerp(sides[3].y, sides[1].y, this.topAnchor.relative) + (float)this.topAnchor.absolute;
				this.mIsInFront = true;
			}
			else
			{
				Vector3 localPos = base.GetLocalPos(this.leftAnchor, parent);
				num = localPos.x + (float)this.leftAnchor.absolute;
				num3 = localPos.y + (float)this.bottomAnchor.absolute;
				num2 = localPos.x + (float)this.rightAnchor.absolute;
				num4 = localPos.y + (float)this.topAnchor.absolute;
				this.mIsInFront = (!this.hideIfOffScreen || localPos.z >= 0f);
			}
		}
		else
		{
			this.mIsInFront = true;
			if (this.leftAnchor.target)
			{
				Vector3[] sides2 = this.leftAnchor.GetSides(parent);
				if (sides2 != null)
				{
					num = NGUIMath.Lerp(sides2[0].x, sides2[2].x, this.leftAnchor.relative) + (float)this.leftAnchor.absolute;
				}
				else
				{
					num = base.GetLocalPos(this.leftAnchor, parent).x + (float)this.leftAnchor.absolute;
				}
			}
			else
			{
				num = localPosition.x - pivotOffset.x * (float)this.mWidth;
			}
			if (this.rightAnchor.target)
			{
				Vector3[] sides3 = this.rightAnchor.GetSides(parent);
				if (sides3 != null)
				{
					num2 = NGUIMath.Lerp(sides3[0].x, sides3[2].x, this.rightAnchor.relative) + (float)this.rightAnchor.absolute;
				}
				else
				{
					num2 = base.GetLocalPos(this.rightAnchor, parent).x + (float)this.rightAnchor.absolute;
				}
			}
			else
			{
				num2 = localPosition.x - pivotOffset.x * (float)this.mWidth + (float)this.mWidth;
			}
			if (this.bottomAnchor.target)
			{
				Vector3[] sides4 = this.bottomAnchor.GetSides(parent);
				if (sides4 != null)
				{
					num3 = NGUIMath.Lerp(sides4[3].y, sides4[1].y, this.bottomAnchor.relative) + (float)this.bottomAnchor.absolute;
				}
				else
				{
					num3 = base.GetLocalPos(this.bottomAnchor, parent).y + (float)this.bottomAnchor.absolute;
				}
			}
			else
			{
				num3 = localPosition.y - pivotOffset.y * (float)this.mHeight;
			}
			if (this.topAnchor.target)
			{
				Vector3[] sides5 = this.topAnchor.GetSides(parent);
				if (sides5 != null)
				{
					num4 = NGUIMath.Lerp(sides5[3].y, sides5[1].y, this.topAnchor.relative) + (float)this.topAnchor.absolute;
				}
				else
				{
					num4 = base.GetLocalPos(this.topAnchor, parent).y + (float)this.topAnchor.absolute;
				}
			}
			else
			{
				num4 = localPosition.y - pivotOffset.y * (float)this.mHeight + (float)this.mHeight;
			}
		}
		Vector3 vector;
		vector..ctor(Mathf.Lerp(num, num2, pivotOffset.x), Mathf.Lerp(num3, num4, pivotOffset.y), localPosition.z);
		vector.x = Mathf.Round(vector.x);
		vector.y = Mathf.Round(vector.y);
		int num5 = Mathf.FloorToInt(num2 - num + 0.5f);
		int num6 = Mathf.FloorToInt(num4 - num3 + 0.5f);
		if (this.keepAspectRatio != UIWidget.AspectRatioSource.Free && this.aspectRatio != 0f)
		{
			if (this.keepAspectRatio == UIWidget.AspectRatioSource.BasedOnHeight)
			{
				num5 = Mathf.RoundToInt((float)num6 * this.aspectRatio);
			}
			else
			{
				num6 = Mathf.RoundToInt((float)num5 / this.aspectRatio);
			}
		}
		if (num5 < this.minWidth)
		{
			num5 = this.minWidth;
		}
		if (num6 < this.minHeight)
		{
			num6 = this.minHeight;
		}
		if (Vector3.SqrMagnitude(localPosition - vector) > 0.001f)
		{
			base.cachedTransform.localPosition = vector;
			if (this.mIsInFront)
			{
				this.mChanged = true;
			}
		}
		if (this.mWidth != num5 || this.mHeight != num6)
		{
			this.mWidth = num5;
			this.mHeight = num6;
			if (this.mIsInFront)
			{
				this.mChanged = true;
			}
			if (this.autoResizeBoxCollider)
			{
				this.ResizeCollider();
			}
		}
	}

	// Token: 0x0600078C RID: 1932 RVA: 0x00038A90 File Offset: 0x00036C90
	protected override void OnUpdate()
	{
		if (this.panel == null)
		{
			this.CreatePanel();
		}
	}

	// Token: 0x0600078D RID: 1933 RVA: 0x00038AAC File Offset: 0x00036CAC
	private void OnApplicationPause(bool paused)
	{
		if (!paused)
		{
			this.MarkAsChanged();
		}
	}

	// Token: 0x0600078E RID: 1934 RVA: 0x00038ABC File Offset: 0x00036CBC
	protected override void OnDisable()
	{
		this.RemoveFromPanel();
		base.OnDisable();
	}

	// Token: 0x0600078F RID: 1935 RVA: 0x00038ACC File Offset: 0x00036CCC
	private void OnDestroy()
	{
		this.RemoveFromPanel();
	}

	// Token: 0x06000790 RID: 1936 RVA: 0x00038AD4 File Offset: 0x00036CD4
	public bool UpdateVisibility(bool visibleByAlpha, bool visibleByPanel)
	{
		if (this.mIsVisibleByAlpha != visibleByAlpha || this.mIsVisibleByPanel != visibleByPanel)
		{
			this.mChanged = true;
			this.mIsVisibleByAlpha = visibleByAlpha;
			this.mIsVisibleByPanel = visibleByPanel;
			return true;
		}
		return false;
	}

	// Token: 0x06000791 RID: 1937 RVA: 0x00038B14 File Offset: 0x00036D14
	public bool UpdateTransform(int frame)
	{
		Transform cachedTransform = base.cachedTransform;
		this.mPlayMode = Application.isPlaying;
		if (this.mMoved)
		{
			this.mMoved = true;
			this.mMatrixFrame = -1;
			cachedTransform.hasChanged = false;
			Vector2 pivotOffset = this.pivotOffset;
			float num = -pivotOffset.x * (float)this.mWidth;
			float num2 = -pivotOffset.y * (float)this.mHeight;
			float num3 = num + (float)this.mWidth;
			float num4 = num2 + (float)this.mHeight;
			this.mOldV0 = this.panel.worldToLocal.MultiplyPoint3x4(cachedTransform.TransformPoint(num, num2, 0f));
			this.mOldV1 = this.panel.worldToLocal.MultiplyPoint3x4(cachedTransform.TransformPoint(num3, num4, 0f));
		}
		else if (!this.panel.widgetsAreStatic && cachedTransform.hasChanged)
		{
			this.mMatrixFrame = -1;
			cachedTransform.hasChanged = false;
			Vector2 pivotOffset2 = this.pivotOffset;
			float num5 = -pivotOffset2.x * (float)this.mWidth;
			float num6 = -pivotOffset2.y * (float)this.mHeight;
			float num7 = num5 + (float)this.mWidth;
			float num8 = num6 + (float)this.mHeight;
			Vector3 vector = this.panel.worldToLocal.MultiplyPoint3x4(cachedTransform.TransformPoint(num5, num6, 0f));
			Vector3 vector2 = this.panel.worldToLocal.MultiplyPoint3x4(cachedTransform.TransformPoint(num7, num8, 0f));
			if (Vector3.SqrMagnitude(this.mOldV0 - vector) > 1E-06f || Vector3.SqrMagnitude(this.mOldV1 - vector2) > 1E-06f)
			{
				this.mMoved = true;
				this.mOldV0 = vector;
				this.mOldV1 = vector2;
			}
		}
		if (this.mMoved && this.onChange != null)
		{
			this.onChange();
		}
		return this.mMoved || this.mChanged;
	}

	// Token: 0x06000792 RID: 1938 RVA: 0x00038D14 File Offset: 0x00036F14
	public bool UpdateGeometry(int frame)
	{
		float num = this.CalculateFinalAlpha(frame);
		if (this.mIsVisibleByAlpha && this.mLastAlpha != num)
		{
			this.mChanged = true;
		}
		this.mLastAlpha = num;
		if (this.mChanged)
		{
			if (this.mIsVisibleByAlpha && num > 0.001f && this.shader != null)
			{
				bool hasVertices = this.geometry.hasVertices;
				if (this.fillGeometry)
				{
					this.geometry.Clear();
					this.OnFill(this.geometry.verts, this.geometry.uvs, this.geometry.cols);
				}
				if (this.geometry.hasVertices)
				{
					if (this.mMatrixFrame != frame)
					{
						this.mLocalToPanel = this.panel.worldToLocal * base.cachedTransform.localToWorldMatrix;
						this.mMatrixFrame = frame;
					}
					this.geometry.ApplyTransform(this.mLocalToPanel, this.panel.generateNormals);
					this.mMoved = false;
					this.mChanged = false;
					return true;
				}
				this.mChanged = false;
				return hasVertices;
			}
			else if (this.geometry.hasVertices)
			{
				if (this.fillGeometry)
				{
					this.geometry.Clear();
				}
				this.mMoved = false;
				this.mChanged = false;
				return true;
			}
		}
		else if (this.mMoved && this.geometry.hasVertices)
		{
			if (this.mMatrixFrame != frame)
			{
				this.mLocalToPanel = this.panel.worldToLocal * base.cachedTransform.localToWorldMatrix;
				this.mMatrixFrame = frame;
			}
			this.geometry.ApplyTransform(this.mLocalToPanel, this.panel.generateNormals);
			this.mMoved = false;
			this.mChanged = false;
			return true;
		}
		this.mMoved = false;
		this.mChanged = false;
		return false;
	}

	// Token: 0x06000793 RID: 1939 RVA: 0x00038F08 File Offset: 0x00037108
	public void WriteToBuffers(BetterList<Vector3> v, BetterList<Vector2> u, BetterList<Color32> c, BetterList<Vector3> n, BetterList<Vector4> t)
	{
		this.geometry.WriteToBuffers(v, u, c, n, t);
	}

	// Token: 0x06000794 RID: 1940 RVA: 0x00038F1C File Offset: 0x0003711C
	public virtual void MakePixelPerfect()
	{
		Vector3 localPosition = base.cachedTransform.localPosition;
		localPosition.z = Mathf.Round(localPosition.z);
		localPosition.x = Mathf.Round(localPosition.x);
		localPosition.y = Mathf.Round(localPosition.y);
		base.cachedTransform.localPosition = localPosition;
		Vector3 localScale = base.cachedTransform.localScale;
		base.cachedTransform.localScale = new Vector3(Mathf.Sign(localScale.x), Mathf.Sign(localScale.y), 1f);
	}

	// Token: 0x170000CA RID: 202
	// (get) Token: 0x06000795 RID: 1941 RVA: 0x00038FB4 File Offset: 0x000371B4
	public virtual int minWidth
	{
		get
		{
			return 2;
		}
	}

	// Token: 0x170000CB RID: 203
	// (get) Token: 0x06000796 RID: 1942 RVA: 0x00038FB8 File Offset: 0x000371B8
	public virtual int minHeight
	{
		get
		{
			return 2;
		}
	}

	// Token: 0x170000CC RID: 204
	// (get) Token: 0x06000797 RID: 1943 RVA: 0x00038FBC File Offset: 0x000371BC
	// (set) Token: 0x06000798 RID: 1944 RVA: 0x00038FC4 File Offset: 0x000371C4
	public virtual Vector4 border
	{
		get
		{
			return Vector4.zero;
		}
		set
		{
		}
	}

	// Token: 0x06000799 RID: 1945 RVA: 0x00038FC8 File Offset: 0x000371C8
	public virtual void OnFill(BetterList<Vector3> verts, BetterList<Vector2> uvs, BetterList<Color32> cols)
	{
	}

	// Token: 0x040006FB RID: 1787
	[SerializeField]
	[HideInInspector]
	protected Color mColor = Color.white;

	// Token: 0x040006FC RID: 1788
	[HideInInspector]
	[SerializeField]
	protected UIWidget.Pivot mPivot = UIWidget.Pivot.Center;

	// Token: 0x040006FD RID: 1789
	[HideInInspector]
	[SerializeField]
	protected int mWidth = 100;

	// Token: 0x040006FE RID: 1790
	[HideInInspector]
	[SerializeField]
	protected int mHeight = 100;

	// Token: 0x040006FF RID: 1791
	[HideInInspector]
	[SerializeField]
	protected int mDepth;

	// Token: 0x04000700 RID: 1792
	public UIWidget.OnDimensionsChanged onChange;

	// Token: 0x04000701 RID: 1793
	public UIWidget.OnPostFillCallback onPostFill;

	// Token: 0x04000702 RID: 1794
	public UIDrawCall.OnRenderCallback mOnRender;

	// Token: 0x04000703 RID: 1795
	public bool autoResizeBoxCollider;

	// Token: 0x04000704 RID: 1796
	public bool hideIfOffScreen;

	// Token: 0x04000705 RID: 1797
	public UIWidget.AspectRatioSource keepAspectRatio;

	// Token: 0x04000706 RID: 1798
	public float aspectRatio = 1f;

	// Token: 0x04000707 RID: 1799
	public UIWidget.HitCheck hitCheck;

	// Token: 0x04000708 RID: 1800
	[NonSerialized]
	public UIPanel panel;

	// Token: 0x04000709 RID: 1801
	[NonSerialized]
	public UIGeometry geometry = new UIGeometry();

	// Token: 0x0400070A RID: 1802
	[NonSerialized]
	public bool fillGeometry = true;

	// Token: 0x0400070B RID: 1803
	[NonSerialized]
	protected bool mPlayMode = true;

	// Token: 0x0400070C RID: 1804
	[NonSerialized]
	protected Vector4 mDrawRegion = new Vector4(0f, 0f, 1f, 1f);

	// Token: 0x0400070D RID: 1805
	[NonSerialized]
	private Matrix4x4 mLocalToPanel;

	// Token: 0x0400070E RID: 1806
	[NonSerialized]
	private bool mIsVisibleByAlpha = true;

	// Token: 0x0400070F RID: 1807
	[NonSerialized]
	private bool mIsVisibleByPanel = true;

	// Token: 0x04000710 RID: 1808
	[NonSerialized]
	private bool mIsInFront = true;

	// Token: 0x04000711 RID: 1809
	[NonSerialized]
	private float mLastAlpha;

	// Token: 0x04000712 RID: 1810
	[NonSerialized]
	private bool mMoved;

	// Token: 0x04000713 RID: 1811
	[NonSerialized]
	public UIDrawCall drawCall;

	// Token: 0x04000714 RID: 1812
	[NonSerialized]
	protected Vector3[] mCorners = new Vector3[4];

	// Token: 0x04000715 RID: 1813
	[NonSerialized]
	private int mAlphaFrameID = -1;

	// Token: 0x04000716 RID: 1814
	private int mMatrixFrame = -1;

	// Token: 0x04000717 RID: 1815
	private Vector3 mOldV0;

	// Token: 0x04000718 RID: 1816
	private Vector3 mOldV1;

	// Token: 0x020000F8 RID: 248
	public enum Pivot
	{
		// Token: 0x0400071A RID: 1818
		TopLeft,
		// Token: 0x0400071B RID: 1819
		Top,
		// Token: 0x0400071C RID: 1820
		TopRight,
		// Token: 0x0400071D RID: 1821
		Left,
		// Token: 0x0400071E RID: 1822
		Center,
		// Token: 0x0400071F RID: 1823
		Right,
		// Token: 0x04000720 RID: 1824
		BottomLeft,
		// Token: 0x04000721 RID: 1825
		Bottom,
		// Token: 0x04000722 RID: 1826
		BottomRight
	}

	// Token: 0x020000F9 RID: 249
	public enum AspectRatioSource
	{
		// Token: 0x04000724 RID: 1828
		Free,
		// Token: 0x04000725 RID: 1829
		BasedOnWidth,
		// Token: 0x04000726 RID: 1830
		BasedOnHeight
	}

	// Token: 0x02000343 RID: 835
	// (Invoke) Token: 0x0600152E RID: 5422
	public delegate void OnDimensionsChanged();

	// Token: 0x02000344 RID: 836
	// (Invoke) Token: 0x06001532 RID: 5426
	public delegate void OnPostFillCallback(UIWidget widget, int bufferOffset, BetterList<Vector3> verts, BetterList<Vector2> uvs, BetterList<Color32> cols);

	// Token: 0x02000345 RID: 837
	// (Invoke) Token: 0x06001536 RID: 5430
	public delegate bool HitCheck(Vector3 worldPos);
}
