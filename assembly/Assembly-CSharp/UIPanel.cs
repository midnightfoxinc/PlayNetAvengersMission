using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200012A RID: 298
[ExecuteInEditMode]
[AddComponentMenu("NGUI/UI/NGUI Panel")]
public class UIPanel : UIRect
{
	// Token: 0x17000164 RID: 356
	// (get) Token: 0x060009B0 RID: 2480 RVA: 0x000470C0 File Offset: 0x000452C0
	// (set) Token: 0x060009B1 RID: 2481 RVA: 0x000470C8 File Offset: 0x000452C8
	public string sortingLayerName
	{
		get
		{
			return this.mSortingLayerName;
		}
		set
		{
			if (this.mSortingLayerName != value)
			{
				this.mSortingLayerName = value;
				this.UpdateDrawCalls();
			}
		}
	}

	// Token: 0x17000165 RID: 357
	// (get) Token: 0x060009B2 RID: 2482 RVA: 0x000470E8 File Offset: 0x000452E8
	public static int nextUnusedDepth
	{
		get
		{
			int num = int.MinValue;
			int i = 0;
			int count = UIPanel.list.Count;
			while (i < count)
			{
				num = Mathf.Max(num, UIPanel.list[i].depth);
				i++;
			}
			return (num != int.MinValue) ? (num + 1) : 0;
		}
	}

	// Token: 0x17000166 RID: 358
	// (get) Token: 0x060009B3 RID: 2483 RVA: 0x00047144 File Offset: 0x00045344
	public override bool canBeAnchored
	{
		get
		{
			return this.mClipping != UIDrawCall.Clipping.None;
		}
	}

	// Token: 0x17000167 RID: 359
	// (get) Token: 0x060009B4 RID: 2484 RVA: 0x00047154 File Offset: 0x00045354
	// (set) Token: 0x060009B5 RID: 2485 RVA: 0x0004715C File Offset: 0x0004535C
	public override float alpha
	{
		get
		{
			return this.mAlpha;
		}
		set
		{
			float num = Mathf.Clamp01(value);
			if (this.mAlpha != num)
			{
				this.mAlphaFrameID = -1;
				this.mResized = true;
				this.mAlpha = num;
				this.SetDirty();
			}
		}
	}

	// Token: 0x17000168 RID: 360
	// (get) Token: 0x060009B6 RID: 2486 RVA: 0x00047198 File Offset: 0x00045398
	// (set) Token: 0x060009B7 RID: 2487 RVA: 0x000471A0 File Offset: 0x000453A0
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
				this.mDepth = value;
				UIPanel.list.Sort(new Comparison<UIPanel>(UIPanel.CompareFunc));
			}
		}
	}

	// Token: 0x17000169 RID: 361
	// (get) Token: 0x060009B8 RID: 2488 RVA: 0x000471CC File Offset: 0x000453CC
	// (set) Token: 0x060009B9 RID: 2489 RVA: 0x000471D4 File Offset: 0x000453D4
	public int sortingOrder
	{
		get
		{
			return this.mSortingOrder;
		}
		set
		{
			if (this.mSortingOrder != value)
			{
				this.mSortingOrder = value;
				this.UpdateDrawCalls();
			}
		}
	}

	// Token: 0x060009BA RID: 2490 RVA: 0x000471F0 File Offset: 0x000453F0
	public static int CompareFunc(UIPanel a, UIPanel b)
	{
		if (!(a != b) || !(a != null) || !(b != null))
		{
			return 0;
		}
		if (a.mDepth < b.mDepth)
		{
			return -1;
		}
		if (a.mDepth > b.mDepth)
		{
			return 1;
		}
		return (a.GetInstanceID() >= b.GetInstanceID()) ? 1 : -1;
	}

	// Token: 0x1700016A RID: 362
	// (get) Token: 0x060009BB RID: 2491 RVA: 0x00047264 File Offset: 0x00045464
	public float width
	{
		get
		{
			return this.GetViewSize().x;
		}
	}

	// Token: 0x1700016B RID: 363
	// (get) Token: 0x060009BC RID: 2492 RVA: 0x00047280 File Offset: 0x00045480
	public float height
	{
		get
		{
			return this.GetViewSize().y;
		}
	}

	// Token: 0x1700016C RID: 364
	// (get) Token: 0x060009BD RID: 2493 RVA: 0x0004729C File Offset: 0x0004549C
	public bool halfPixelOffset
	{
		get
		{
			return this.mHalfPixelOffset;
		}
	}

	// Token: 0x1700016D RID: 365
	// (get) Token: 0x060009BE RID: 2494 RVA: 0x000472A4 File Offset: 0x000454A4
	public bool usedForUI
	{
		get
		{
			return base.anchorCamera != null && this.mCam.orthographic;
		}
	}

	// Token: 0x1700016E RID: 366
	// (get) Token: 0x060009BF RID: 2495 RVA: 0x000472C8 File Offset: 0x000454C8
	public Vector3 drawCallOffset
	{
		get
		{
			if (base.anchorCamera != null && this.mCam.orthographic)
			{
				Vector2 windowSize = this.GetWindowSize();
				float num = (!(base.root != null)) ? 1f : base.root.pixelSizeAdjustment;
				float num2 = num / windowSize.y / this.mCam.orthographicSize;
				bool flag = this.mHalfPixelOffset;
				bool flag2 = this.mHalfPixelOffset;
				if ((Mathf.RoundToInt(windowSize.x) & 1) == 1)
				{
					flag = !flag;
				}
				if ((Mathf.RoundToInt(windowSize.y) & 1) == 1)
				{
					flag2 = !flag2;
				}
				return new Vector3((!flag) ? 0f : (-num2), (!flag2) ? 0f : num2);
			}
			return Vector3.zero;
		}
	}

	// Token: 0x1700016F RID: 367
	// (get) Token: 0x060009C0 RID: 2496 RVA: 0x000473AC File Offset: 0x000455AC
	// (set) Token: 0x060009C1 RID: 2497 RVA: 0x000473B4 File Offset: 0x000455B4
	public UIDrawCall.Clipping clipping
	{
		get
		{
			return this.mClipping;
		}
		set
		{
			if (this.mClipping != value)
			{
				this.mResized = true;
				this.mClipping = value;
				this.mMatrixFrame = -1;
			}
		}
	}

	// Token: 0x17000170 RID: 368
	// (get) Token: 0x060009C2 RID: 2498 RVA: 0x000473D8 File Offset: 0x000455D8
	public UIPanel parentPanel
	{
		get
		{
			return this.mParentPanel;
		}
	}

	// Token: 0x17000171 RID: 369
	// (get) Token: 0x060009C3 RID: 2499 RVA: 0x000473E0 File Offset: 0x000455E0
	public int clipCount
	{
		get
		{
			int num = 0;
			UIPanel uipanel = this;
			while (uipanel != null)
			{
				if (uipanel.mClipping == UIDrawCall.Clipping.SoftClip || uipanel.mClipping == UIDrawCall.Clipping.TextureMask)
				{
					num++;
				}
				uipanel = uipanel.mParentPanel;
			}
			return num;
		}
	}

	// Token: 0x17000172 RID: 370
	// (get) Token: 0x060009C4 RID: 2500 RVA: 0x00047428 File Offset: 0x00045628
	public bool hasClipping
	{
		get
		{
			return this.mClipping == UIDrawCall.Clipping.SoftClip || this.mClipping == UIDrawCall.Clipping.TextureMask;
		}
	}

	// Token: 0x17000173 RID: 371
	// (get) Token: 0x060009C5 RID: 2501 RVA: 0x00047444 File Offset: 0x00045644
	public bool hasCumulativeClipping
	{
		get
		{
			return this.clipCount != 0;
		}
	}

	// Token: 0x17000174 RID: 372
	// (get) Token: 0x060009C6 RID: 2502 RVA: 0x00047454 File Offset: 0x00045654
	[Obsolete("Use 'hasClipping' or 'hasCumulativeClipping' instead")]
	public bool clipsChildren
	{
		get
		{
			return this.hasCumulativeClipping;
		}
	}

	// Token: 0x17000175 RID: 373
	// (get) Token: 0x060009C7 RID: 2503 RVA: 0x0004745C File Offset: 0x0004565C
	// (set) Token: 0x060009C8 RID: 2504 RVA: 0x00047464 File Offset: 0x00045664
	public Vector2 clipOffset
	{
		get
		{
			return this.mClipOffset;
		}
		set
		{
			if (Mathf.Abs(this.mClipOffset.x - value.x) > 0.001f || Mathf.Abs(this.mClipOffset.y - value.y) > 0.001f)
			{
				this.mClipOffset = value;
				this.InvalidateClipping();
				if (this.onClipMove != null)
				{
					this.onClipMove(this);
				}
			}
		}
	}

	// Token: 0x060009C9 RID: 2505 RVA: 0x000474DC File Offset: 0x000456DC
	private void InvalidateClipping()
	{
		this.mResized = true;
		this.mMatrixFrame = -1;
		int i = 0;
		int count = UIPanel.list.Count;
		while (i < count)
		{
			UIPanel uipanel = UIPanel.list[i];
			if (uipanel != this && uipanel.parentPanel == this)
			{
				uipanel.InvalidateClipping();
			}
			i++;
		}
	}

	// Token: 0x17000176 RID: 374
	// (get) Token: 0x060009CA RID: 2506 RVA: 0x00047544 File Offset: 0x00045744
	// (set) Token: 0x060009CB RID: 2507 RVA: 0x0004754C File Offset: 0x0004574C
	public Texture2D clipTexture
	{
		get
		{
			return this.mClipTexture;
		}
		set
		{
			if (this.mClipTexture != value)
			{
				this.mClipTexture = value;
			}
		}
	}

	// Token: 0x17000177 RID: 375
	// (get) Token: 0x060009CC RID: 2508 RVA: 0x00047568 File Offset: 0x00045768
	// (set) Token: 0x060009CD RID: 2509 RVA: 0x00047570 File Offset: 0x00045770
	[Obsolete("Use 'finalClipRegion' or 'baseClipRegion' instead")]
	public Vector4 clipRange
	{
		get
		{
			return this.baseClipRegion;
		}
		set
		{
			this.baseClipRegion = value;
		}
	}

	// Token: 0x17000178 RID: 376
	// (get) Token: 0x060009CE RID: 2510 RVA: 0x0004757C File Offset: 0x0004577C
	// (set) Token: 0x060009CF RID: 2511 RVA: 0x00047584 File Offset: 0x00045784
	public Vector4 baseClipRegion
	{
		get
		{
			return this.mClipRange;
		}
		set
		{
			if (Mathf.Abs(this.mClipRange.x - value.x) > 0.001f || Mathf.Abs(this.mClipRange.y - value.y) > 0.001f || Mathf.Abs(this.mClipRange.z - value.z) > 0.001f || Mathf.Abs(this.mClipRange.w - value.w) > 0.001f)
			{
				this.mResized = true;
				this.mClipRange = value;
				this.mMatrixFrame = -1;
				UIScrollView component = base.GetComponent<UIScrollView>();
				if (component != null)
				{
					component.UpdatePosition();
				}
				if (this.onClipMove != null)
				{
					this.onClipMove(this);
				}
			}
		}
	}

	// Token: 0x17000179 RID: 377
	// (get) Token: 0x060009D0 RID: 2512 RVA: 0x00047660 File Offset: 0x00045860
	public Vector4 finalClipRegion
	{
		get
		{
			Vector2 viewSize = this.GetViewSize();
			if (this.mClipping != UIDrawCall.Clipping.None)
			{
				return new Vector4(this.mClipRange.x + this.mClipOffset.x, this.mClipRange.y + this.mClipOffset.y, viewSize.x, viewSize.y);
			}
			return new Vector4(0f, 0f, viewSize.x, viewSize.y);
		}
	}

	// Token: 0x1700017A RID: 378
	// (get) Token: 0x060009D1 RID: 2513 RVA: 0x000476E0 File Offset: 0x000458E0
	// (set) Token: 0x060009D2 RID: 2514 RVA: 0x000476E8 File Offset: 0x000458E8
	public Vector2 clipSoftness
	{
		get
		{
			return this.mClipSoftness;
		}
		set
		{
			if (this.mClipSoftness != value)
			{
				this.mClipSoftness = value;
			}
		}
	}

	// Token: 0x1700017B RID: 379
	// (get) Token: 0x060009D3 RID: 2515 RVA: 0x00047704 File Offset: 0x00045904
	public override Vector3[] localCorners
	{
		get
		{
			if (this.mClipping == UIDrawCall.Clipping.None)
			{
				Vector3[] worldCorners = this.worldCorners;
				Transform cachedTransform = base.cachedTransform;
				for (int i = 0; i < 4; i++)
				{
					worldCorners[i] = cachedTransform.InverseTransformPoint(worldCorners[i]);
				}
				return worldCorners;
			}
			float num = this.mClipOffset.x + this.mClipRange.x - 0.5f * this.mClipRange.z;
			float num2 = this.mClipOffset.y + this.mClipRange.y - 0.5f * this.mClipRange.w;
			float num3 = num + this.mClipRange.z;
			float num4 = num2 + this.mClipRange.w;
			UIPanel.mCorners[0] = new Vector3(num, num2);
			UIPanel.mCorners[1] = new Vector3(num, num4);
			UIPanel.mCorners[2] = new Vector3(num3, num4);
			UIPanel.mCorners[3] = new Vector3(num3, num2);
			return UIPanel.mCorners;
		}
	}

	// Token: 0x1700017C RID: 380
	// (get) Token: 0x060009D4 RID: 2516 RVA: 0x00047838 File Offset: 0x00045A38
	public override Vector3[] worldCorners
	{
		get
		{
			if (this.mClipping != UIDrawCall.Clipping.None)
			{
				float num = this.mClipOffset.x + this.mClipRange.x - 0.5f * this.mClipRange.z;
				float num2 = this.mClipOffset.y + this.mClipRange.y - 0.5f * this.mClipRange.w;
				float num3 = num + this.mClipRange.z;
				float num4 = num2 + this.mClipRange.w;
				Transform cachedTransform = base.cachedTransform;
				UIPanel.mCorners[0] = cachedTransform.TransformPoint(num, num2, 0f);
				UIPanel.mCorners[1] = cachedTransform.TransformPoint(num, num4, 0f);
				UIPanel.mCorners[2] = cachedTransform.TransformPoint(num3, num4, 0f);
				UIPanel.mCorners[3] = cachedTransform.TransformPoint(num3, num2, 0f);
			}
			else
			{
				if (base.anchorCamera != null)
				{
					return this.mCam.GetWorldCorners(base.cameraRayDistance);
				}
				Vector2 viewSize = this.GetViewSize();
				float num5 = -0.5f * viewSize.x;
				float num6 = -0.5f * viewSize.y;
				float num7 = num5 + viewSize.x;
				float num8 = num6 + viewSize.y;
				UIPanel.mCorners[0] = new Vector3(num5, num6);
				UIPanel.mCorners[1] = new Vector3(num5, num8);
				UIPanel.mCorners[2] = new Vector3(num7, num8);
				UIPanel.mCorners[3] = new Vector3(num7, num6);
				if (this.anchorOffset && (this.mCam == null || this.mCam.transform.parent != base.cachedTransform))
				{
					Vector3 position = base.cachedTransform.position;
					for (int i = 0; i < 4; i++)
					{
						UIPanel.mCorners[i] += position;
					}
				}
			}
			return UIPanel.mCorners;
		}
	}

	// Token: 0x060009D5 RID: 2517 RVA: 0x00047A90 File Offset: 0x00045C90
	public override Vector3[] GetSides(Transform relativeTo)
	{
		if (this.mClipping != UIDrawCall.Clipping.None)
		{
			float num = this.mClipOffset.x + this.mClipRange.x - 0.5f * this.mClipRange.z;
			float num2 = this.mClipOffset.y + this.mClipRange.y - 0.5f * this.mClipRange.w;
			float num3 = num + this.mClipRange.z;
			float num4 = num2 + this.mClipRange.w;
			float num5 = (num + num3) * 0.5f;
			float num6 = (num2 + num4) * 0.5f;
			Transform cachedTransform = base.cachedTransform;
			UIRect.mSides[0] = cachedTransform.TransformPoint(num, num6, 0f);
			UIRect.mSides[1] = cachedTransform.TransformPoint(num5, num4, 0f);
			UIRect.mSides[2] = cachedTransform.TransformPoint(num3, num6, 0f);
			UIRect.mSides[3] = cachedTransform.TransformPoint(num5, num2, 0f);
			if (relativeTo != null)
			{
				for (int i = 0; i < 4; i++)
				{
					UIRect.mSides[i] = relativeTo.InverseTransformPoint(UIRect.mSides[i]);
				}
			}
			return UIRect.mSides;
		}
		if (base.anchorCamera != null && this.anchorOffset)
		{
			Vector3[] sides = this.mCam.GetSides(base.cameraRayDistance);
			Vector3 position = base.cachedTransform.position;
			for (int j = 0; j < 4; j++)
			{
				sides[j] += position;
			}
			if (relativeTo != null)
			{
				for (int k = 0; k < 4; k++)
				{
					sides[k] = relativeTo.InverseTransformPoint(sides[k]);
				}
			}
			return sides;
		}
		return base.GetSides(relativeTo);
	}

	// Token: 0x060009D6 RID: 2518 RVA: 0x00047CC0 File Offset: 0x00045EC0
	public override void Invalidate(bool includeChildren)
	{
		this.mAlphaFrameID = -1;
		base.Invalidate(includeChildren);
	}

	// Token: 0x060009D7 RID: 2519 RVA: 0x00047CD0 File Offset: 0x00045ED0
	public override float CalculateFinalAlpha(int frameID)
	{
		if (this.mAlphaFrameID != frameID)
		{
			this.mAlphaFrameID = frameID;
			UIRect parent = base.parent;
			this.finalAlpha = ((!(base.parent != null)) ? this.mAlpha : (parent.CalculateFinalAlpha(frameID) * this.mAlpha));
		}
		return this.finalAlpha;
	}

	// Token: 0x060009D8 RID: 2520 RVA: 0x00047D30 File Offset: 0x00045F30
	public override void SetRect(float x, float y, float width, float height)
	{
		int num = Mathf.FloorToInt(width + 0.5f);
		int num2 = Mathf.FloorToInt(height + 0.5f);
		num = num >> 1 << 1;
		num2 = num2 >> 1 << 1;
		Transform transform = base.cachedTransform;
		Vector3 localPosition = transform.localPosition;
		localPosition.x = Mathf.Floor(x + 0.5f);
		localPosition.y = Mathf.Floor(y + 0.5f);
		if (num < 2)
		{
			num = 2;
		}
		if (num2 < 2)
		{
			num2 = 2;
		}
		this.baseClipRegion = new Vector4(localPosition.x, localPosition.y, (float)num, (float)num2);
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

	// Token: 0x060009D9 RID: 2521 RVA: 0x00047E68 File Offset: 0x00046068
	public bool IsVisible(Vector3 a, Vector3 b, Vector3 c, Vector3 d)
	{
		this.UpdateTransformMatrix();
		a = this.worldToLocal.MultiplyPoint3x4(a);
		b = this.worldToLocal.MultiplyPoint3x4(b);
		c = this.worldToLocal.MultiplyPoint3x4(c);
		d = this.worldToLocal.MultiplyPoint3x4(d);
		UIPanel.mTemp[0] = a.x;
		UIPanel.mTemp[1] = b.x;
		UIPanel.mTemp[2] = c.x;
		UIPanel.mTemp[3] = d.x;
		float num = Mathf.Min(UIPanel.mTemp);
		float num2 = Mathf.Max(UIPanel.mTemp);
		UIPanel.mTemp[0] = a.y;
		UIPanel.mTemp[1] = b.y;
		UIPanel.mTemp[2] = c.y;
		UIPanel.mTemp[3] = d.y;
		float num3 = Mathf.Min(UIPanel.mTemp);
		float num4 = Mathf.Max(UIPanel.mTemp);
		return num2 >= this.mMin.x && num4 >= this.mMin.y && num <= this.mMax.x && num3 <= this.mMax.y;
	}

	// Token: 0x060009DA RID: 2522 RVA: 0x00047FA0 File Offset: 0x000461A0
	public bool IsVisible(Vector3 worldPos)
	{
		if (this.mAlpha < 0.001f)
		{
			return false;
		}
		if (this.mClipping == UIDrawCall.Clipping.None || this.mClipping == UIDrawCall.Clipping.ConstrainButDontClip)
		{
			return true;
		}
		this.UpdateTransformMatrix();
		Vector3 vector = this.worldToLocal.MultiplyPoint3x4(worldPos);
		return vector.x >= this.mMin.x && vector.y >= this.mMin.y && vector.x <= this.mMax.x && vector.y <= this.mMax.y;
	}

	// Token: 0x060009DB RID: 2523 RVA: 0x00048050 File Offset: 0x00046250
	public bool IsVisible(UIWidget w)
	{
		UIPanel uipanel = this;
		Vector3[] array = null;
		while (uipanel != null)
		{
			if ((uipanel.mClipping == UIDrawCall.Clipping.None || uipanel.mClipping == UIDrawCall.Clipping.ConstrainButDontClip) && !w.hideIfOffScreen)
			{
				uipanel = uipanel.mParentPanel;
			}
			else
			{
				if (array == null)
				{
					array = w.worldCorners;
				}
				if (!uipanel.IsVisible(array[0], array[1], array[2], array[3]))
				{
					return false;
				}
				uipanel = uipanel.mParentPanel;
			}
		}
		return true;
	}

	// Token: 0x060009DC RID: 2524 RVA: 0x000480F4 File Offset: 0x000462F4
	public bool Affects(UIWidget w)
	{
		if (w == null)
		{
			return false;
		}
		UIPanel panel = w.panel;
		if (panel == null)
		{
			return false;
		}
		UIPanel uipanel = this;
		while (uipanel != null)
		{
			if (uipanel == panel)
			{
				return true;
			}
			if (!uipanel.hasCumulativeClipping)
			{
				return false;
			}
			uipanel = uipanel.mParentPanel;
		}
		return false;
	}

	// Token: 0x060009DD RID: 2525 RVA: 0x0004815C File Offset: 0x0004635C
	[ContextMenu("Force Refresh")]
	public void RebuildAllDrawCalls()
	{
		this.mRebuild = true;
	}

	// Token: 0x060009DE RID: 2526 RVA: 0x00048168 File Offset: 0x00046368
	public void SetDirty()
	{
		int i = 0;
		int count = this.drawCalls.Count;
		while (i < count)
		{
			this.drawCalls[i].isDirty = true;
			i++;
		}
		this.Invalidate(true);
	}

	// Token: 0x060009DF RID: 2527 RVA: 0x000481AC File Offset: 0x000463AC
	protected override void Awake()
	{
		base.Awake();
		this.mHalfPixelOffset = (Application.platform == 2 || Application.platform == 10 || Application.platform == 5 || Application.platform == 7);
		if (this.mHalfPixelOffset && SystemInfo.graphicsDeviceVersion.Contains("Direct3D"))
		{
			this.mHalfPixelOffset = (SystemInfo.graphicsShaderLevel < 40);
		}
	}

	// Token: 0x060009E0 RID: 2528 RVA: 0x00048220 File Offset: 0x00046420
	private void FindParent()
	{
		Transform parent = base.cachedTransform.parent;
		this.mParentPanel = ((!(parent != null)) ? null : NGUITools.FindInParents<UIPanel>(parent.gameObject));
	}

	// Token: 0x060009E1 RID: 2529 RVA: 0x0004825C File Offset: 0x0004645C
	public override void ParentHasChanged()
	{
		base.ParentHasChanged();
		this.FindParent();
	}

	// Token: 0x060009E2 RID: 2530 RVA: 0x0004826C File Offset: 0x0004646C
	protected override void OnStart()
	{
		this.mLayer = base.cachedGameObject.layer;
	}

	// Token: 0x060009E3 RID: 2531 RVA: 0x00048280 File Offset: 0x00046480
	protected override void OnEnable()
	{
		this.mRebuild = true;
		this.mAlphaFrameID = -1;
		this.mMatrixFrame = -1;
		this.OnStart();
		base.OnEnable();
		this.mMatrixFrame = -1;
	}

	// Token: 0x060009E4 RID: 2532 RVA: 0x000482B8 File Offset: 0x000464B8
	protected override void OnInit()
	{
		if (UIPanel.list.Contains(this))
		{
			return;
		}
		base.OnInit();
		this.FindParent();
		if (base.GetComponent<Rigidbody>() == null && this.mParentPanel == null)
		{
			UICamera uicamera = (!(base.anchorCamera != null)) ? null : this.mCam.GetComponent<UICamera>();
			if (uicamera != null && (uicamera.eventType == UICamera.EventType.UI_3D || uicamera.eventType == UICamera.EventType.World_3D))
			{
				Rigidbody rigidbody = base.gameObject.AddComponent<Rigidbody>();
				rigidbody.isKinematic = true;
				rigidbody.useGravity = false;
			}
		}
		this.mRebuild = true;
		this.mAlphaFrameID = -1;
		this.mMatrixFrame = -1;
		UIPanel.list.Add(this);
		UIPanel.list.Sort(new Comparison<UIPanel>(UIPanel.CompareFunc));
	}

	// Token: 0x060009E5 RID: 2533 RVA: 0x0004839C File Offset: 0x0004659C
	protected override void OnDisable()
	{
		int i = 0;
		int count = this.drawCalls.Count;
		while (i < count)
		{
			UIDrawCall uidrawCall = this.drawCalls[i];
			if (uidrawCall != null)
			{
				UIDrawCall.Destroy(uidrawCall);
			}
			i++;
		}
		this.drawCalls.Clear();
		UIPanel.list.Remove(this);
		this.mAlphaFrameID = -1;
		this.mMatrixFrame = -1;
		if (UIPanel.list.Count == 0)
		{
			UIDrawCall.ReleaseAll();
			UIPanel.mUpdateFrame = -1;
		}
		base.OnDisable();
	}

	// Token: 0x060009E6 RID: 2534 RVA: 0x0004842C File Offset: 0x0004662C
	private void UpdateTransformMatrix()
	{
		int frameCount = Time.frameCount;
		if (base.cachedTransform.hasChanged)
		{
			this.mTrans.hasChanged = false;
			this.mMatrixFrame = -1;
		}
		if (this.mMatrixFrame != frameCount)
		{
			this.mMatrixFrame = frameCount;
			this.worldToLocal = this.mTrans.worldToLocalMatrix;
			Vector2 vector = this.GetViewSize() * 0.5f;
			float num = this.mClipOffset.x + this.mClipRange.x;
			float num2 = this.mClipOffset.y + this.mClipRange.y;
			this.mMin.x = num - vector.x;
			this.mMin.y = num2 - vector.y;
			this.mMax.x = num + vector.x;
			this.mMax.y = num2 + vector.y;
		}
	}

	// Token: 0x060009E7 RID: 2535 RVA: 0x00048518 File Offset: 0x00046718
	protected override void OnAnchor()
	{
		if (this.mClipping == UIDrawCall.Clipping.None)
		{
			return;
		}
		Transform cachedTransform = base.cachedTransform;
		Transform parent = cachedTransform.parent;
		Vector2 viewSize = this.GetViewSize();
		Vector2 vector = cachedTransform.localPosition;
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
			}
			else
			{
				Vector2 vector2 = base.GetLocalPos(this.leftAnchor, parent);
				num = vector2.x + (float)this.leftAnchor.absolute;
				num3 = vector2.y + (float)this.bottomAnchor.absolute;
				num2 = vector2.x + (float)this.rightAnchor.absolute;
				num4 = vector2.y + (float)this.topAnchor.absolute;
			}
		}
		else
		{
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
				num = this.mClipRange.x - 0.5f * viewSize.x;
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
				num2 = this.mClipRange.x + 0.5f * viewSize.x;
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
				num3 = this.mClipRange.y - 0.5f * viewSize.y;
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
				num4 = this.mClipRange.y + 0.5f * viewSize.y;
			}
		}
		num -= vector.x + this.mClipOffset.x;
		num2 -= vector.x + this.mClipOffset.x;
		num3 -= vector.y + this.mClipOffset.y;
		num4 -= vector.y + this.mClipOffset.y;
		float num5 = Mathf.Lerp(num, num2, 0.5f);
		float num6 = Mathf.Lerp(num3, num4, 0.5f);
		float num7 = num2 - num;
		float num8 = num4 - num3;
		float num9 = Mathf.Max(2f, this.mClipSoftness.x);
		float num10 = Mathf.Max(2f, this.mClipSoftness.y);
		if (num7 < num9)
		{
			num7 = num9;
		}
		if (num8 < num10)
		{
			num8 = num10;
		}
		this.baseClipRegion = new Vector4(num5, num6, num7, num8);
	}

	// Token: 0x060009E8 RID: 2536 RVA: 0x00048AC0 File Offset: 0x00046CC0
	private void LateUpdate()
	{
		if (UIPanel.mUpdateFrame != Time.frameCount)
		{
			UIPanel.mUpdateFrame = Time.frameCount;
			int i = 0;
			int count = UIPanel.list.Count;
			while (i < count)
			{
				UIPanel.list[i].UpdateSelf();
				i++;
			}
			int num = 3000;
			int j = 0;
			int count2 = UIPanel.list.Count;
			while (j < count2)
			{
				UIPanel uipanel = UIPanel.list[j];
				if (uipanel.renderQueue == UIPanel.RenderQueue.Automatic)
				{
					uipanel.startingRenderQueue = num;
					uipanel.UpdateDrawCalls();
					num += uipanel.drawCalls.Count;
				}
				else if (uipanel.renderQueue == UIPanel.RenderQueue.StartAt)
				{
					uipanel.UpdateDrawCalls();
					if (uipanel.drawCalls.Count != 0)
					{
						num = Mathf.Max(num, uipanel.startingRenderQueue + uipanel.drawCalls.Count);
					}
				}
				else
				{
					uipanel.UpdateDrawCalls();
					if (uipanel.drawCalls.Count != 0)
					{
						num = Mathf.Max(num, uipanel.startingRenderQueue + 1);
					}
				}
				j++;
			}
		}
	}

	// Token: 0x060009E9 RID: 2537 RVA: 0x00048BE4 File Offset: 0x00046DE4
	private void UpdateSelf()
	{
		this.UpdateTransformMatrix();
		this.UpdateLayers();
		this.UpdateWidgets();
		if (this.mRebuild)
		{
			this.mRebuild = false;
			this.FillAllDrawCalls();
		}
		else
		{
			int i = 0;
			while (i < this.drawCalls.Count)
			{
				UIDrawCall uidrawCall = this.drawCalls[i];
				if (uidrawCall.isDirty && !this.FillDrawCall(uidrawCall))
				{
					UIDrawCall.Destroy(uidrawCall);
					this.drawCalls.RemoveAt(i);
				}
				else
				{
					i++;
				}
			}
		}
		if (this.mUpdateScroll)
		{
			this.mUpdateScroll = false;
			UIScrollView component = base.GetComponent<UIScrollView>();
			if (component != null)
			{
				component.UpdateScrollbars();
			}
		}
	}

	// Token: 0x060009EA RID: 2538 RVA: 0x00048CA4 File Offset: 0x00046EA4
	public void SortWidgets()
	{
		this.mSortWidgets = false;
		this.widgets.Sort(new Comparison<UIWidget>(UIWidget.PanelCompareFunc));
	}

	// Token: 0x060009EB RID: 2539 RVA: 0x00048CC4 File Offset: 0x00046EC4
	private void FillAllDrawCalls()
	{
		for (int i = 0; i < this.drawCalls.Count; i++)
		{
			UIDrawCall.Destroy(this.drawCalls[i]);
		}
		this.drawCalls.Clear();
		Material material = null;
		Texture texture = null;
		Shader shader = null;
		UIDrawCall uidrawCall = null;
		int num = 0;
		if (this.mSortWidgets)
		{
			this.SortWidgets();
		}
		for (int j = 0; j < this.widgets.Count; j++)
		{
			UIWidget uiwidget = this.widgets[j];
			if (uiwidget.isVisible && uiwidget.hasVertices)
			{
				Material material2 = uiwidget.material;
				Texture mainTexture = uiwidget.mainTexture;
				Shader shader2 = uiwidget.shader;
				if (material != material2 || texture != mainTexture || shader != shader2)
				{
					if (uidrawCall != null && uidrawCall.verts.size != 0)
					{
						this.drawCalls.Add(uidrawCall);
						uidrawCall.UpdateGeometry(num);
						uidrawCall.onRender = this.mOnRender;
						this.mOnRender = null;
						num = 0;
						uidrawCall = null;
					}
					material = material2;
					texture = mainTexture;
					shader = shader2;
				}
				if (material != null || shader != null || texture != null)
				{
					if (uidrawCall == null)
					{
						uidrawCall = UIDrawCall.Create(this, material, texture, shader);
						uidrawCall.depthStart = uiwidget.depth;
						uidrawCall.depthEnd = uidrawCall.depthStart;
						uidrawCall.panel = this;
					}
					else
					{
						int depth = uiwidget.depth;
						if (depth < uidrawCall.depthStart)
						{
							uidrawCall.depthStart = depth;
						}
						if (depth > uidrawCall.depthEnd)
						{
							uidrawCall.depthEnd = depth;
						}
					}
					uiwidget.drawCall = uidrawCall;
					num++;
					if (this.generateNormals)
					{
						uiwidget.WriteToBuffers(uidrawCall.verts, uidrawCall.uvs, uidrawCall.cols, uidrawCall.norms, uidrawCall.tans);
					}
					else
					{
						uiwidget.WriteToBuffers(uidrawCall.verts, uidrawCall.uvs, uidrawCall.cols, null, null);
					}
					if (uiwidget.mOnRender != null)
					{
						if (this.mOnRender == null)
						{
							this.mOnRender = uiwidget.mOnRender;
						}
						else
						{
							this.mOnRender = (UIDrawCall.OnRenderCallback)Delegate.Combine(this.mOnRender, uiwidget.mOnRender);
						}
					}
				}
			}
			else
			{
				uiwidget.drawCall = null;
			}
		}
		if (uidrawCall != null && uidrawCall.verts.size != 0)
		{
			this.drawCalls.Add(uidrawCall);
			uidrawCall.UpdateGeometry(num);
			uidrawCall.onRender = this.mOnRender;
			this.mOnRender = null;
		}
	}

	// Token: 0x060009EC RID: 2540 RVA: 0x00048FA4 File Offset: 0x000471A4
	public bool FillDrawCall(UIDrawCall dc)
	{
		if (dc != null)
		{
			dc.isDirty = false;
			int num = 0;
			int i = 0;
			while (i < this.widgets.Count)
			{
				UIWidget uiwidget = this.widgets[i];
				if (uiwidget == null)
				{
					this.widgets.RemoveAt(i);
				}
				else
				{
					if (uiwidget.drawCall == dc)
					{
						if (uiwidget.isVisible && uiwidget.hasVertices)
						{
							num++;
							if (this.generateNormals)
							{
								uiwidget.WriteToBuffers(dc.verts, dc.uvs, dc.cols, dc.norms, dc.tans);
							}
							else
							{
								uiwidget.WriteToBuffers(dc.verts, dc.uvs, dc.cols, null, null);
							}
							if (uiwidget.mOnRender != null)
							{
								if (this.mOnRender == null)
								{
									this.mOnRender = uiwidget.mOnRender;
								}
								else
								{
									this.mOnRender = (UIDrawCall.OnRenderCallback)Delegate.Combine(this.mOnRender, uiwidget.mOnRender);
								}
							}
						}
						else
						{
							uiwidget.drawCall = null;
						}
					}
					i++;
				}
			}
			if (dc.verts.size != 0)
			{
				dc.UpdateGeometry(num);
				dc.onRender = this.mOnRender;
				this.mOnRender = null;
				return true;
			}
		}
		return false;
	}

	// Token: 0x060009ED RID: 2541 RVA: 0x00049104 File Offset: 0x00047304
	private void UpdateDrawCalls()
	{
		Transform cachedTransform = base.cachedTransform;
		bool usedForUI = this.usedForUI;
		if (this.clipping != UIDrawCall.Clipping.None)
		{
			this.drawCallClipRange = this.finalClipRegion;
			this.drawCallClipRange.z = this.drawCallClipRange.z * 0.5f;
			this.drawCallClipRange.w = this.drawCallClipRange.w * 0.5f;
		}
		else
		{
			this.drawCallClipRange = Vector4.zero;
		}
		int width = Screen.width;
		int height = Screen.height;
		if (this.drawCallClipRange.z == 0f)
		{
			this.drawCallClipRange.z = (float)width * 0.5f;
		}
		if (this.drawCallClipRange.w == 0f)
		{
			this.drawCallClipRange.w = (float)height * 0.5f;
		}
		if (this.halfPixelOffset)
		{
			this.drawCallClipRange.x = this.drawCallClipRange.x - 0.5f;
			this.drawCallClipRange.y = this.drawCallClipRange.y + 0.5f;
		}
		Vector3 vector;
		if (usedForUI)
		{
			Transform parent = base.cachedTransform.parent;
			vector = base.cachedTransform.localPosition;
			if (this.clipping != UIDrawCall.Clipping.None)
			{
				vector.x = (float)Mathf.RoundToInt(vector.x);
				vector.y = (float)Mathf.RoundToInt(vector.y);
			}
			if (parent != null)
			{
				vector = parent.TransformPoint(vector);
			}
			vector += this.drawCallOffset;
		}
		else
		{
			vector = cachedTransform.position;
		}
		Quaternion rotation = cachedTransform.rotation;
		Vector3 lossyScale = cachedTransform.lossyScale;
		for (int i = 0; i < this.drawCalls.Count; i++)
		{
			UIDrawCall uidrawCall = this.drawCalls[i];
			Transform cachedTransform2 = uidrawCall.cachedTransform;
			cachedTransform2.position = vector;
			cachedTransform2.rotation = rotation;
			cachedTransform2.localScale = lossyScale;
			uidrawCall.renderQueue = ((this.renderQueue != UIPanel.RenderQueue.Explicit) ? (this.startingRenderQueue + i) : this.startingRenderQueue);
			uidrawCall.alwaysOnScreen = (this.alwaysOnScreen && (this.mClipping == UIDrawCall.Clipping.None || this.mClipping == UIDrawCall.Clipping.ConstrainButDontClip));
			uidrawCall.sortingOrder = this.mSortingOrder;
			uidrawCall.sortingLayerName = this.mSortingLayerName;
			uidrawCall.clipTexture = this.mClipTexture;
		}
	}

	// Token: 0x060009EE RID: 2542 RVA: 0x00049370 File Offset: 0x00047570
	private void UpdateLayers()
	{
		if (this.mLayer != base.cachedGameObject.layer)
		{
			this.mLayer = this.mGo.layer;
			int i = 0;
			int count = this.widgets.Count;
			while (i < count)
			{
				UIWidget uiwidget = this.widgets[i];
				if (uiwidget && uiwidget.parent == this)
				{
					uiwidget.gameObject.layer = this.mLayer;
				}
				i++;
			}
			base.ResetAnchors();
			for (int j = 0; j < this.drawCalls.Count; j++)
			{
				this.drawCalls[j].gameObject.layer = this.mLayer;
			}
		}
	}

	// Token: 0x060009EF RID: 2543 RVA: 0x0004943C File Offset: 0x0004763C
	private void UpdateWidgets()
	{
		bool flag = false;
		bool flag2 = false;
		bool hasCumulativeClipping = this.hasCumulativeClipping;
		if (!this.cullWhileDragging)
		{
			for (int i = 0; i < UIScrollView.list.size; i++)
			{
				UIScrollView uiscrollView = UIScrollView.list[i];
				if (uiscrollView.panel == this && uiscrollView.isDragging)
				{
					flag2 = true;
				}
			}
		}
		if (this.mForced != flag2)
		{
			this.mForced = flag2;
			this.mResized = true;
		}
		int frameCount = Time.frameCount;
		int j = 0;
		int count = this.widgets.Count;
		while (j < count)
		{
			UIWidget uiwidget = this.widgets[j];
			if (uiwidget.panel == this && uiwidget.enabled)
			{
				if (uiwidget.UpdateTransform(frameCount) || this.mResized)
				{
					bool visibleByAlpha = flag2 || uiwidget.CalculateCumulativeAlpha(frameCount) > 0.001f;
					uiwidget.UpdateVisibility(visibleByAlpha, flag2 || (!hasCumulativeClipping && !uiwidget.hideIfOffScreen) || this.IsVisible(uiwidget));
				}
				if (uiwidget.UpdateGeometry(frameCount))
				{
					flag = true;
					if (!this.mRebuild)
					{
						if (uiwidget.drawCall != null)
						{
							uiwidget.drawCall.isDirty = true;
						}
						else
						{
							this.FindDrawCall(uiwidget);
						}
					}
				}
			}
			j++;
		}
		if (flag && this.onGeometryUpdated != null)
		{
			this.onGeometryUpdated();
		}
		this.mResized = false;
	}

	// Token: 0x060009F0 RID: 2544 RVA: 0x000495EC File Offset: 0x000477EC
	public UIDrawCall FindDrawCall(UIWidget w)
	{
		Material material = w.material;
		Texture mainTexture = w.mainTexture;
		int depth = w.depth;
		for (int i = 0; i < this.drawCalls.Count; i++)
		{
			UIDrawCall uidrawCall = this.drawCalls[i];
			int num = (i != 0) ? (this.drawCalls[i - 1].depthEnd + 1) : int.MinValue;
			int num2 = (i + 1 != this.drawCalls.Count) ? (this.drawCalls[i + 1].depthStart - 1) : int.MaxValue;
			if (num <= depth && num2 >= depth)
			{
				if (uidrawCall.baseMaterial == material && uidrawCall.mainTexture == mainTexture)
				{
					if (w.isVisible)
					{
						w.drawCall = uidrawCall;
						if (w.hasVertices)
						{
							uidrawCall.isDirty = true;
						}
						return uidrawCall;
					}
				}
				else
				{
					this.mRebuild = true;
				}
				return null;
			}
		}
		this.mRebuild = true;
		return null;
	}

	// Token: 0x060009F1 RID: 2545 RVA: 0x00049708 File Offset: 0x00047908
	public void AddWidget(UIWidget w)
	{
		this.mUpdateScroll = true;
		if (this.widgets.Count == 0)
		{
			this.widgets.Add(w);
		}
		else if (this.mSortWidgets)
		{
			this.widgets.Add(w);
			this.SortWidgets();
		}
		else if (UIWidget.PanelCompareFunc(w, this.widgets[0]) == -1)
		{
			this.widgets.Insert(0, w);
		}
		else
		{
			int i = this.widgets.Count;
			while (i > 0)
			{
				if (UIWidget.PanelCompareFunc(w, this.widgets[--i]) != -1)
				{
					this.widgets.Insert(i + 1, w);
					break;
				}
			}
		}
		this.FindDrawCall(w);
	}

	// Token: 0x060009F2 RID: 2546 RVA: 0x000497E0 File Offset: 0x000479E0
	public void RemoveWidget(UIWidget w)
	{
		if (this.widgets.Remove(w) && w.drawCall != null)
		{
			int depth = w.depth;
			if (depth == w.drawCall.depthStart || depth == w.drawCall.depthEnd)
			{
				this.mRebuild = true;
			}
			w.drawCall.isDirty = true;
			w.drawCall = null;
		}
	}

	// Token: 0x060009F3 RID: 2547 RVA: 0x00049854 File Offset: 0x00047A54
	public void Refresh()
	{
		this.mRebuild = true;
		UIPanel.mUpdateFrame = -1;
		if (UIPanel.list.Count > 0)
		{
			UIPanel.list[0].LateUpdate();
		}
	}

	// Token: 0x060009F4 RID: 2548 RVA: 0x00049884 File Offset: 0x00047A84
	public virtual Vector3 CalculateConstrainOffset(Vector2 min, Vector2 max)
	{
		Vector4 finalClipRegion = this.finalClipRegion;
		float num = finalClipRegion.z * 0.5f;
		float num2 = finalClipRegion.w * 0.5f;
		Vector2 minRect;
		minRect..ctor(min.x, min.y);
		Vector2 maxRect;
		maxRect..ctor(max.x, max.y);
		Vector2 minArea;
		minArea..ctor(finalClipRegion.x - num, finalClipRegion.y - num2);
		Vector2 maxArea;
		maxArea..ctor(finalClipRegion.x + num, finalClipRegion.y + num2);
		if (this.softBorderPadding && this.clipping == UIDrawCall.Clipping.SoftClip)
		{
			minArea.x += this.mClipSoftness.x;
			minArea.y += this.mClipSoftness.y;
			maxArea.x -= this.mClipSoftness.x;
			maxArea.y -= this.mClipSoftness.y;
		}
		return NGUIMath.ConstrainRect(minRect, maxRect, minArea, maxArea);
	}

	// Token: 0x060009F5 RID: 2549 RVA: 0x0004999C File Offset: 0x00047B9C
	public bool ConstrainTargetToBounds(Transform target, ref Bounds targetBounds, bool immediate)
	{
		Vector3 vector = targetBounds.min;
		Vector3 vector2 = targetBounds.max;
		float num = 1f;
		if (this.mClipping == UIDrawCall.Clipping.None)
		{
			UIRoot root = base.root;
			if (root != null)
			{
				num = root.pixelSizeAdjustment;
			}
		}
		if (num != 1f)
		{
			vector /= num;
			vector2 /= num;
		}
		Vector3 vector3 = this.CalculateConstrainOffset(vector, vector2) * num;
		if (vector3.sqrMagnitude > 0f)
		{
			if (immediate)
			{
				target.localPosition += vector3;
				targetBounds.center += vector3;
				SpringPosition component = target.GetComponent<SpringPosition>();
				if (component != null)
				{
					component.enabled = false;
				}
			}
			else
			{
				SpringPosition springPosition = SpringPosition.Begin(target.gameObject, target.localPosition + vector3, 13f);
				springPosition.ignoreTimeScale = true;
				springPosition.worldSpace = false;
			}
			return true;
		}
		return false;
	}

	// Token: 0x060009F6 RID: 2550 RVA: 0x00049AA8 File Offset: 0x00047CA8
	public bool ConstrainTargetToBounds(Transform target, bool immediate)
	{
		Bounds bounds = NGUIMath.CalculateRelativeWidgetBounds(base.cachedTransform, target);
		return this.ConstrainTargetToBounds(target, ref bounds, immediate);
	}

	// Token: 0x060009F7 RID: 2551 RVA: 0x00049ACC File Offset: 0x00047CCC
	public static UIPanel Find(Transform trans)
	{
		return UIPanel.Find(trans, false, -1);
	}

	// Token: 0x060009F8 RID: 2552 RVA: 0x00049AD8 File Offset: 0x00047CD8
	public static UIPanel Find(Transform trans, bool createIfMissing)
	{
		return UIPanel.Find(trans, createIfMissing, -1);
	}

	// Token: 0x060009F9 RID: 2553 RVA: 0x00049AE4 File Offset: 0x00047CE4
	public static UIPanel Find(Transform trans, bool createIfMissing, int layer)
	{
		UIPanel uipanel = NGUITools.FindInParents<UIPanel>(trans);
		if (uipanel != null)
		{
			return uipanel;
		}
		while (trans.parent != null)
		{
			trans = trans.parent;
		}
		return (!createIfMissing) ? null : NGUITools.CreateUI(trans, false, layer);
	}

	// Token: 0x060009FA RID: 2554 RVA: 0x00049B38 File Offset: 0x00047D38
	public Vector2 GetWindowSize()
	{
		UIRoot root = base.root;
		Vector2 vector = NGUITools.screenSize;
		if (root != null)
		{
			vector *= root.GetPixelSizeAdjustment(Mathf.RoundToInt(vector.y));
		}
		return vector;
	}

	// Token: 0x060009FB RID: 2555 RVA: 0x00049B78 File Offset: 0x00047D78
	public Vector2 GetViewSize()
	{
		if (this.mClipping != UIDrawCall.Clipping.None)
		{
			return new Vector2(this.mClipRange.z, this.mClipRange.w);
		}
		return NGUITools.screenSize;
	}

	// Token: 0x040008F4 RID: 2292
	public static List<UIPanel> list = new List<UIPanel>();

	// Token: 0x040008F5 RID: 2293
	public UIPanel.OnGeometryUpdated onGeometryUpdated;

	// Token: 0x040008F6 RID: 2294
	public bool showInPanelTool = true;

	// Token: 0x040008F7 RID: 2295
	public bool generateNormals;

	// Token: 0x040008F8 RID: 2296
	public bool widgetsAreStatic;

	// Token: 0x040008F9 RID: 2297
	public bool cullWhileDragging = true;

	// Token: 0x040008FA RID: 2298
	public bool alwaysOnScreen;

	// Token: 0x040008FB RID: 2299
	public bool anchorOffset;

	// Token: 0x040008FC RID: 2300
	public bool softBorderPadding = true;

	// Token: 0x040008FD RID: 2301
	public UIPanel.RenderQueue renderQueue;

	// Token: 0x040008FE RID: 2302
	public int startingRenderQueue = 3000;

	// Token: 0x040008FF RID: 2303
	[NonSerialized]
	public List<UIWidget> widgets = new List<UIWidget>();

	// Token: 0x04000900 RID: 2304
	[NonSerialized]
	public List<UIDrawCall> drawCalls = new List<UIDrawCall>();

	// Token: 0x04000901 RID: 2305
	[NonSerialized]
	public Matrix4x4 worldToLocal = Matrix4x4.identity;

	// Token: 0x04000902 RID: 2306
	[NonSerialized]
	public Vector4 drawCallClipRange = new Vector4(0f, 0f, 1f, 1f);

	// Token: 0x04000903 RID: 2307
	public UIPanel.OnClippingMoved onClipMove;

	// Token: 0x04000904 RID: 2308
	[SerializeField]
	[HideInInspector]
	private Texture2D mClipTexture;

	// Token: 0x04000905 RID: 2309
	[HideInInspector]
	[SerializeField]
	private float mAlpha = 1f;

	// Token: 0x04000906 RID: 2310
	[SerializeField]
	[HideInInspector]
	private UIDrawCall.Clipping mClipping;

	// Token: 0x04000907 RID: 2311
	[SerializeField]
	[HideInInspector]
	private Vector4 mClipRange = new Vector4(0f, 0f, 300f, 200f);

	// Token: 0x04000908 RID: 2312
	[SerializeField]
	[HideInInspector]
	private Vector2 mClipSoftness = new Vector2(4f, 4f);

	// Token: 0x04000909 RID: 2313
	[HideInInspector]
	[SerializeField]
	private int mDepth;

	// Token: 0x0400090A RID: 2314
	[HideInInspector]
	[SerializeField]
	private int mSortingOrder;

	// Token: 0x0400090B RID: 2315
	[HideInInspector]
	[SerializeField]
	private string mSortingLayerName;

	// Token: 0x0400090C RID: 2316
	private bool mRebuild;

	// Token: 0x0400090D RID: 2317
	private bool mResized;

	// Token: 0x0400090E RID: 2318
	[SerializeField]
	private Vector2 mClipOffset = Vector2.zero;

	// Token: 0x0400090F RID: 2319
	private int mMatrixFrame = -1;

	// Token: 0x04000910 RID: 2320
	private int mAlphaFrameID;

	// Token: 0x04000911 RID: 2321
	private int mLayer = -1;

	// Token: 0x04000912 RID: 2322
	private static float[] mTemp = new float[4];

	// Token: 0x04000913 RID: 2323
	private Vector2 mMin = Vector2.zero;

	// Token: 0x04000914 RID: 2324
	private Vector2 mMax = Vector2.zero;

	// Token: 0x04000915 RID: 2325
	private bool mHalfPixelOffset;

	// Token: 0x04000916 RID: 2326
	private bool mSortWidgets;

	// Token: 0x04000917 RID: 2327
	private bool mUpdateScroll;

	// Token: 0x04000918 RID: 2328
	private UIPanel mParentPanel;

	// Token: 0x04000919 RID: 2329
	private static Vector3[] mCorners = new Vector3[4];

	// Token: 0x0400091A RID: 2330
	private static int mUpdateFrame = -1;

	// Token: 0x0400091B RID: 2331
	private UIDrawCall.OnRenderCallback mOnRender;

	// Token: 0x0400091C RID: 2332
	private bool mForced;

	// Token: 0x0200012B RID: 299
	public enum RenderQueue
	{
		// Token: 0x0400091E RID: 2334
		Automatic,
		// Token: 0x0400091F RID: 2335
		StartAt,
		// Token: 0x04000920 RID: 2336
		Explicit
	}

	// Token: 0x0200035E RID: 862
	// (Invoke) Token: 0x0600159A RID: 5530
	public delegate void OnGeometryUpdated();

	// Token: 0x0200035F RID: 863
	// (Invoke) Token: 0x0600159E RID: 5534
	public delegate void OnClippingMoved(UIPanel panel);
}
