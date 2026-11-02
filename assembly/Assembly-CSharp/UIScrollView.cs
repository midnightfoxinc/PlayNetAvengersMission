using System;
using UnityEngine;

// Token: 0x020000C0 RID: 192
[RequireComponent(typeof(UIPanel))]
[AddComponentMenu("NGUI/Interaction/Scroll View")]
[ExecuteInEditMode]
public class UIScrollView : MonoBehaviour
{
	// Token: 0x1700004E RID: 78
	// (get) Token: 0x060004EB RID: 1259 RVA: 0x000209FC File Offset: 0x0001EBFC
	public UIPanel panel
	{
		get
		{
			return this.mPanel;
		}
	}

	// Token: 0x1700004F RID: 79
	// (get) Token: 0x060004EC RID: 1260 RVA: 0x00020A04 File Offset: 0x0001EC04
	public bool isDragging
	{
		get
		{
			return this.mPressed && this.mDragStarted;
		}
	}

	// Token: 0x17000050 RID: 80
	// (get) Token: 0x060004ED RID: 1261 RVA: 0x00020A1C File Offset: 0x0001EC1C
	public virtual Bounds bounds
	{
		get
		{
			if (!this.mCalculatedBounds)
			{
				this.mCalculatedBounds = true;
				this.mTrans = base.transform;
				this.mBounds = NGUIMath.CalculateRelativeWidgetBounds(this.mTrans, this.mTrans);
			}
			return this.mBounds;
		}
	}

	// Token: 0x17000051 RID: 81
	// (get) Token: 0x060004EE RID: 1262 RVA: 0x00020A5C File Offset: 0x0001EC5C
	public bool canMoveHorizontally
	{
		get
		{
			return this.movement == UIScrollView.Movement.Horizontal || this.movement == UIScrollView.Movement.Unrestricted || (this.movement == UIScrollView.Movement.Custom && this.customMovement.x != 0f);
		}
	}

	// Token: 0x17000052 RID: 82
	// (get) Token: 0x060004EF RID: 1263 RVA: 0x00020AA8 File Offset: 0x0001ECA8
	public bool canMoveVertically
	{
		get
		{
			return this.movement == UIScrollView.Movement.Vertical || this.movement == UIScrollView.Movement.Unrestricted || (this.movement == UIScrollView.Movement.Custom && this.customMovement.y != 0f);
		}
	}

	// Token: 0x17000053 RID: 83
	// (get) Token: 0x060004F0 RID: 1264 RVA: 0x00020AF4 File Offset: 0x0001ECF4
	public virtual bool shouldMoveHorizontally
	{
		get
		{
			float num = this.bounds.size.x;
			if (this.mPanel.clipping == UIDrawCall.Clipping.SoftClip)
			{
				num += this.mPanel.clipSoftness.x * 2f;
			}
			return Mathf.RoundToInt(num - this.mPanel.width) > 0;
		}
	}

	// Token: 0x17000054 RID: 84
	// (get) Token: 0x060004F1 RID: 1265 RVA: 0x00020B5C File Offset: 0x0001ED5C
	public virtual bool shouldMoveVertically
	{
		get
		{
			float num = this.bounds.size.y;
			if (this.mPanel.clipping == UIDrawCall.Clipping.SoftClip)
			{
				num += this.mPanel.clipSoftness.y * 2f;
			}
			return Mathf.RoundToInt(num - this.mPanel.height) > 0;
		}
	}

	// Token: 0x17000055 RID: 85
	// (get) Token: 0x060004F2 RID: 1266 RVA: 0x00020BC4 File Offset: 0x0001EDC4
	protected virtual bool shouldMove
	{
		get
		{
			if (!this.disableDragIfFits)
			{
				return true;
			}
			if (this.mPanel == null)
			{
				this.mPanel = base.GetComponent<UIPanel>();
			}
			Vector4 finalClipRegion = this.mPanel.finalClipRegion;
			Bounds bounds = this.bounds;
			float num = (finalClipRegion.z != 0f) ? (finalClipRegion.z * 0.5f) : ((float)Screen.width);
			float num2 = (finalClipRegion.w != 0f) ? (finalClipRegion.w * 0.5f) : ((float)Screen.height);
			if (this.canMoveHorizontally)
			{
				if (bounds.min.x < finalClipRegion.x - num)
				{
					return true;
				}
				if (bounds.max.x > finalClipRegion.x + num)
				{
					return true;
				}
			}
			if (this.canMoveVertically)
			{
				if (bounds.min.y < finalClipRegion.y - num2)
				{
					return true;
				}
				if (bounds.max.y > finalClipRegion.y + num2)
				{
					return true;
				}
			}
			return false;
		}
	}

	// Token: 0x17000056 RID: 86
	// (get) Token: 0x060004F3 RID: 1267 RVA: 0x00020CFC File Offset: 0x0001EEFC
	// (set) Token: 0x060004F4 RID: 1268 RVA: 0x00020D04 File Offset: 0x0001EF04
	public Vector3 currentMomentum
	{
		get
		{
			return this.mMomentum;
		}
		set
		{
			this.mMomentum = value;
			this.mShouldMove = true;
		}
	}

	// Token: 0x060004F5 RID: 1269 RVA: 0x00020D14 File Offset: 0x0001EF14
	private void Awake()
	{
		this.mTrans = base.transform;
		this.mPanel = base.GetComponent<UIPanel>();
		if (this.mPanel.clipping == UIDrawCall.Clipping.None)
		{
			this.mPanel.clipping = UIDrawCall.Clipping.ConstrainButDontClip;
		}
		if (this.movement != UIScrollView.Movement.Custom && this.scale.sqrMagnitude > 0.001f)
		{
			if (this.scale.x == 1f && this.scale.y == 0f)
			{
				this.movement = UIScrollView.Movement.Horizontal;
			}
			else if (this.scale.x == 0f && this.scale.y == 1f)
			{
				this.movement = UIScrollView.Movement.Vertical;
			}
			else if (this.scale.x == 1f && this.scale.y == 1f)
			{
				this.movement = UIScrollView.Movement.Unrestricted;
			}
			else
			{
				this.movement = UIScrollView.Movement.Custom;
				this.customMovement.x = this.scale.x;
				this.customMovement.y = this.scale.y;
			}
			this.scale = Vector3.zero;
		}
		if (this.contentPivot == UIWidget.Pivot.TopLeft && this.relativePositionOnReset != Vector2.zero)
		{
			this.contentPivot = NGUIMath.GetPivot(new Vector2(this.relativePositionOnReset.x, 1f - this.relativePositionOnReset.y));
			this.relativePositionOnReset = Vector2.zero;
		}
	}

	// Token: 0x060004F6 RID: 1270 RVA: 0x00020EB0 File Offset: 0x0001F0B0
	private void OnEnable()
	{
		UIScrollView.list.Add(this);
		if (this.mStarted && Application.isPlaying)
		{
			this.CheckScrollbars();
		}
	}

	// Token: 0x060004F7 RID: 1271 RVA: 0x00020EE4 File Offset: 0x0001F0E4
	private void Start()
	{
		this.mStarted = true;
		if (Application.isPlaying)
		{
			this.CheckScrollbars();
		}
	}

	// Token: 0x060004F8 RID: 1272 RVA: 0x00020F00 File Offset: 0x0001F100
	private void CheckScrollbars()
	{
		if (this.horizontalScrollBar != null)
		{
			EventDelegate.Add(this.horizontalScrollBar.onChange, new EventDelegate.Callback(this.OnScrollBar));
			this.horizontalScrollBar.BroadcastMessage("CacheDefaultColor", 1);
			this.horizontalScrollBar.alpha = ((this.showScrollBars != UIScrollView.ShowCondition.Always && !this.shouldMoveHorizontally) ? 0f : 1f);
		}
		if (this.verticalScrollBar != null)
		{
			EventDelegate.Add(this.verticalScrollBar.onChange, new EventDelegate.Callback(this.OnScrollBar));
			this.verticalScrollBar.BroadcastMessage("CacheDefaultColor", 1);
			this.verticalScrollBar.alpha = ((this.showScrollBars != UIScrollView.ShowCondition.Always && !this.shouldMoveVertically) ? 0f : 1f);
		}
	}

	// Token: 0x060004F9 RID: 1273 RVA: 0x00020FEC File Offset: 0x0001F1EC
	private void OnDisable()
	{
		UIScrollView.list.Remove(this);
		this.mPressed = false;
	}

	// Token: 0x060004FA RID: 1274 RVA: 0x00021004 File Offset: 0x0001F204
	public bool RestrictWithinBounds(bool instant)
	{
		return this.RestrictWithinBounds(instant, true, true);
	}

	// Token: 0x060004FB RID: 1275 RVA: 0x00021010 File Offset: 0x0001F210
	public bool RestrictWithinBounds(bool instant, bool horizontal, bool vertical)
	{
		if (this.mPanel == null)
		{
			return false;
		}
		Bounds bounds = this.bounds;
		Vector3 vector = this.mPanel.CalculateConstrainOffset(bounds.min, bounds.max);
		if (!horizontal)
		{
			vector.x = 0f;
		}
		if (!vertical)
		{
			vector.y = 0f;
		}
		if (vector.sqrMagnitude > 0.1f)
		{
			if (!instant && this.dragEffect == UIScrollView.DragEffect.MomentumAndSpring)
			{
				Vector3 pos = this.mTrans.localPosition + vector;
				pos.x = Mathf.Round(pos.x);
				pos.y = Mathf.Round(pos.y);
				SpringPanel.Begin(this.mPanel.gameObject, pos, 8f);
			}
			else
			{
				this.MoveRelative(vector);
				if (Mathf.Abs(vector.x) > 0.01f)
				{
					this.mMomentum.x = 0f;
				}
				if (Mathf.Abs(vector.y) > 0.01f)
				{
					this.mMomentum.y = 0f;
				}
				if (Mathf.Abs(vector.z) > 0.01f)
				{
					this.mMomentum.z = 0f;
				}
				this.mScroll = 0f;
			}
			return true;
		}
		return false;
	}

	// Token: 0x060004FC RID: 1276 RVA: 0x00021180 File Offset: 0x0001F380
	public void DisableSpring()
	{
		SpringPanel component = base.GetComponent<SpringPanel>();
		if (component != null)
		{
			component.enabled = false;
		}
	}

	// Token: 0x060004FD RID: 1277 RVA: 0x000211A8 File Offset: 0x0001F3A8
	public void UpdateScrollbars()
	{
		this.UpdateScrollbars(true);
	}

	// Token: 0x060004FE RID: 1278 RVA: 0x000211B4 File Offset: 0x0001F3B4
	public virtual void UpdateScrollbars(bool recalculateBounds)
	{
		if (this.mPanel == null)
		{
			return;
		}
		if (this.horizontalScrollBar != null || this.verticalScrollBar != null)
		{
			if (recalculateBounds)
			{
				this.mCalculatedBounds = false;
				this.mShouldMove = this.shouldMove;
			}
			Bounds bounds = this.bounds;
			Vector2 vector = bounds.min;
			Vector2 vector2 = bounds.max;
			if (this.horizontalScrollBar != null && vector2.x > vector.x)
			{
				Vector4 finalClipRegion = this.mPanel.finalClipRegion;
				int num = Mathf.RoundToInt(finalClipRegion.z);
				if ((num & 1) != 0)
				{
					num--;
				}
				float num2 = (float)num * 0.5f;
				num2 = Mathf.Round(num2);
				if (this.mPanel.clipping == UIDrawCall.Clipping.SoftClip)
				{
					num2 -= this.mPanel.clipSoftness.x;
				}
				float contentSize = vector2.x - vector.x;
				float viewSize = num2 * 2f;
				float num3 = vector.x;
				float num4 = vector2.x;
				float num5 = finalClipRegion.x - num2;
				float num6 = finalClipRegion.x + num2;
				num3 = num5 - num3;
				num4 -= num6;
				this.UpdateScrollbars(this.horizontalScrollBar, num3, num4, contentSize, viewSize, false);
			}
			if (this.verticalScrollBar != null && vector2.y > vector.y)
			{
				Vector4 finalClipRegion2 = this.mPanel.finalClipRegion;
				int num7 = Mathf.RoundToInt(finalClipRegion2.w);
				if ((num7 & 1) != 0)
				{
					num7--;
				}
				float num8 = (float)num7 * 0.5f;
				num8 = Mathf.Round(num8);
				if (this.mPanel.clipping == UIDrawCall.Clipping.SoftClip)
				{
					num8 -= this.mPanel.clipSoftness.y;
				}
				float contentSize2 = vector2.y - vector.y;
				float viewSize2 = num8 * 2f;
				float num9 = vector.y;
				float num10 = vector2.y;
				float num11 = finalClipRegion2.y - num8;
				float num12 = finalClipRegion2.y + num8;
				num9 = num11 - num9;
				num10 -= num12;
				this.UpdateScrollbars(this.verticalScrollBar, num9, num10, contentSize2, viewSize2, true);
			}
		}
		else if (recalculateBounds)
		{
			this.mCalculatedBounds = false;
		}
	}

	// Token: 0x060004FF RID: 1279 RVA: 0x00021428 File Offset: 0x0001F628
	protected void UpdateScrollbars(UIProgressBar slider, float contentMin, float contentMax, float contentSize, float viewSize, bool inverted)
	{
		if (slider == null)
		{
			return;
		}
		this.mIgnoreCallbacks = true;
		float num;
		if (viewSize < contentSize)
		{
			contentMin = Mathf.Clamp01(contentMin / contentSize);
			contentMax = Mathf.Clamp01(contentMax / contentSize);
			num = contentMin + contentMax;
			slider.value = ((!inverted) ? ((num <= 0.001f) ? 1f : (contentMin / num)) : ((num <= 0.001f) ? 0f : (1f - contentMin / num)));
		}
		else
		{
			contentMin = Mathf.Clamp01(-contentMin / contentSize);
			contentMax = Mathf.Clamp01(-contentMax / contentSize);
			num = contentMin + contentMax;
			slider.value = ((!inverted) ? ((num <= 0.001f) ? 1f : (contentMin / num)) : ((num <= 0.001f) ? 0f : (1f - contentMin / num)));
			if (contentSize > 0f)
			{
				contentMin = Mathf.Clamp01(contentMin / contentSize);
				contentMax = Mathf.Clamp01(contentMax / contentSize);
				num = contentMin + contentMax;
			}
		}
		UIScrollBar uiscrollBar = slider as UIScrollBar;
		if (uiscrollBar != null)
		{
			uiscrollBar.barSize = 1f - num;
		}
		this.mIgnoreCallbacks = false;
	}

	// Token: 0x06000500 RID: 1280 RVA: 0x0002156C File Offset: 0x0001F76C
	public virtual void SetDragAmount(float x, float y, bool updateScrollbars)
	{
		if (this.mPanel == null)
		{
			this.mPanel = base.GetComponent<UIPanel>();
		}
		this.DisableSpring();
		Bounds bounds = this.bounds;
		if (bounds.min.x == bounds.max.x || bounds.min.y == bounds.max.y)
		{
			return;
		}
		Vector4 finalClipRegion = this.mPanel.finalClipRegion;
		float num = finalClipRegion.z * 0.5f;
		float num2 = finalClipRegion.w * 0.5f;
		float num3 = bounds.min.x + num;
		float num4 = bounds.max.x - num;
		float num5 = bounds.min.y + num2;
		float num6 = bounds.max.y - num2;
		if (this.mPanel.clipping == UIDrawCall.Clipping.SoftClip)
		{
			num3 -= this.mPanel.clipSoftness.x;
			num4 += this.mPanel.clipSoftness.x;
			num5 -= this.mPanel.clipSoftness.y;
			num6 += this.mPanel.clipSoftness.y;
		}
		float num7 = Mathf.Lerp(num3, num4, x);
		float num8 = Mathf.Lerp(num6, num5, y);
		if (!updateScrollbars)
		{
			Vector3 localPosition = this.mTrans.localPosition;
			if (this.canMoveHorizontally)
			{
				localPosition.x += finalClipRegion.x - num7;
			}
			if (this.canMoveVertically)
			{
				localPosition.y += finalClipRegion.y - num8;
			}
			this.mTrans.localPosition = localPosition;
		}
		if (this.canMoveHorizontally)
		{
			finalClipRegion.x = num7;
		}
		if (this.canMoveVertically)
		{
			finalClipRegion.y = num8;
		}
		Vector4 baseClipRegion = this.mPanel.baseClipRegion;
		this.mPanel.clipOffset = new Vector2(finalClipRegion.x - baseClipRegion.x, finalClipRegion.y - baseClipRegion.y);
		if (updateScrollbars)
		{
			this.UpdateScrollbars(this.mDragID == -10);
		}
	}

	// Token: 0x06000501 RID: 1281 RVA: 0x000217D4 File Offset: 0x0001F9D4
	public void InvalidateBounds()
	{
		this.mCalculatedBounds = false;
	}

	// Token: 0x06000502 RID: 1282 RVA: 0x000217E0 File Offset: 0x0001F9E0
	[ContextMenu("Reset Clipping Position")]
	public void ResetPosition()
	{
		if (NGUITools.GetActive(this))
		{
			this.mCalculatedBounds = false;
			Vector2 pivotOffset = NGUIMath.GetPivotOffset(this.contentPivot);
			this.SetDragAmount(pivotOffset.x, 1f - pivotOffset.y, false);
			this.SetDragAmount(pivotOffset.x, 1f - pivotOffset.y, true);
		}
	}

	// Token: 0x06000503 RID: 1283 RVA: 0x00021844 File Offset: 0x0001FA44
	public void UpdatePosition()
	{
		if (!this.mIgnoreCallbacks && (this.horizontalScrollBar != null || this.verticalScrollBar != null))
		{
			this.mIgnoreCallbacks = true;
			this.mCalculatedBounds = false;
			Vector2 pivotOffset = NGUIMath.GetPivotOffset(this.contentPivot);
			float x = (!(this.horizontalScrollBar != null)) ? pivotOffset.x : this.horizontalScrollBar.value;
			float y = (!(this.verticalScrollBar != null)) ? (1f - pivotOffset.y) : this.verticalScrollBar.value;
			this.SetDragAmount(x, y, false);
			this.UpdateScrollbars(true);
			this.mIgnoreCallbacks = false;
		}
	}

	// Token: 0x06000504 RID: 1284 RVA: 0x00021908 File Offset: 0x0001FB08
	public void OnScrollBar()
	{
		if (!this.mIgnoreCallbacks)
		{
			this.mIgnoreCallbacks = true;
			float x = (!(this.horizontalScrollBar != null)) ? 0f : this.horizontalScrollBar.value;
			float y = (!(this.verticalScrollBar != null)) ? 0f : this.verticalScrollBar.value;
			this.SetDragAmount(x, y, false);
			this.mIgnoreCallbacks = false;
		}
	}

	// Token: 0x06000505 RID: 1285 RVA: 0x00021988 File Offset: 0x0001FB88
	public virtual void MoveRelative(Vector3 relative)
	{
		this.mTrans.localPosition += relative;
		Vector2 clipOffset = this.mPanel.clipOffset;
		clipOffset.x -= relative.x;
		clipOffset.y -= relative.y;
		this.mPanel.clipOffset = clipOffset;
		this.UpdateScrollbars(false);
	}

	// Token: 0x06000506 RID: 1286 RVA: 0x000219F8 File Offset: 0x0001FBF8
	public void MoveAbsolute(Vector3 absolute)
	{
		Vector3 vector = this.mTrans.InverseTransformPoint(absolute);
		Vector3 vector2 = this.mTrans.InverseTransformPoint(Vector3.zero);
		this.MoveRelative(vector - vector2);
	}

	// Token: 0x06000507 RID: 1287 RVA: 0x00021A30 File Offset: 0x0001FC30
	public void Press(bool pressed)
	{
		if (UICamera.currentScheme == UICamera.ControlScheme.Controller)
		{
			return;
		}
		if (this.smoothDragStart && pressed)
		{
			this.mDragStarted = false;
			this.mDragStartOffset = Vector2.zero;
		}
		if (base.enabled && NGUITools.GetActive(base.gameObject))
		{
			if (!pressed && this.mDragID == UICamera.currentTouchID)
			{
				this.mDragID = -10;
			}
			this.mCalculatedBounds = false;
			this.mShouldMove = this.shouldMove;
			if (!this.mShouldMove)
			{
				return;
			}
			this.mPressed = pressed;
			if (pressed)
			{
				this.mMomentum = Vector3.zero;
				this.mScroll = 0f;
				this.DisableSpring();
				this.mLastPos = UICamera.lastWorldPosition;
				this.mPlane = new Plane(this.mTrans.rotation * Vector3.back, this.mLastPos);
				Vector2 clipOffset = this.mPanel.clipOffset;
				clipOffset.x = Mathf.Round(clipOffset.x);
				clipOffset.y = Mathf.Round(clipOffset.y);
				this.mPanel.clipOffset = clipOffset;
				Vector3 localPosition = this.mTrans.localPosition;
				localPosition.x = Mathf.Round(localPosition.x);
				localPosition.y = Mathf.Round(localPosition.y);
				this.mTrans.localPosition = localPosition;
				if (!this.smoothDragStart)
				{
					this.mDragStarted = true;
					this.mDragStartOffset = Vector2.zero;
					if (this.onDragStarted != null)
					{
						this.onDragStarted();
					}
				}
			}
			else if (this.centerOnChild)
			{
				this.centerOnChild.Recenter();
			}
			else
			{
				if (this.restrictWithinPanel && this.mPanel.clipping != UIDrawCall.Clipping.None)
				{
					this.RestrictWithinBounds(this.dragEffect == UIScrollView.DragEffect.None, this.canMoveHorizontally, this.canMoveVertically);
				}
				if (this.mDragStarted && this.onDragFinished != null)
				{
					this.onDragFinished();
				}
				if (!this.mShouldMove && this.onStoppedMoving != null)
				{
					this.onStoppedMoving();
				}
			}
		}
	}

	// Token: 0x06000508 RID: 1288 RVA: 0x00021C6C File Offset: 0x0001FE6C
	public void Drag()
	{
		if (!this.mPressed || UICamera.currentScheme == UICamera.ControlScheme.Controller)
		{
			return;
		}
		if (base.enabled && NGUITools.GetActive(base.gameObject) && this.mShouldMove)
		{
			if (this.mDragID == -10)
			{
				this.mDragID = UICamera.currentTouchID;
			}
			UICamera.currentTouch.clickNotification = UICamera.ClickNotification.BasedOnDelta;
			if (this.smoothDragStart && !this.mDragStarted)
			{
				this.mDragStarted = true;
				this.mDragStartOffset = UICamera.currentTouch.totalDelta;
				if (this.onDragStarted != null)
				{
					this.onDragStarted();
				}
			}
			Ray ray = (!this.smoothDragStart) ? UICamera.currentCamera.ScreenPointToRay(UICamera.currentTouch.pos) : UICamera.currentCamera.ScreenPointToRay(UICamera.currentTouch.pos - this.mDragStartOffset);
			float num = 0f;
			if (this.mPlane.Raycast(ray, ref num))
			{
				Vector3 point = ray.GetPoint(num);
				Vector3 vector = point - this.mLastPos;
				this.mLastPos = point;
				if (vector.x != 0f || vector.y != 0f || vector.z != 0f)
				{
					vector = this.mTrans.InverseTransformDirection(vector);
					if (this.movement == UIScrollView.Movement.Horizontal)
					{
						vector.y = 0f;
						vector.z = 0f;
					}
					else if (this.movement == UIScrollView.Movement.Vertical)
					{
						vector.x = 0f;
						vector.z = 0f;
					}
					else if (this.movement == UIScrollView.Movement.Unrestricted)
					{
						vector.z = 0f;
					}
					else
					{
						vector.Scale(this.customMovement);
					}
					vector = this.mTrans.TransformDirection(vector);
				}
				if (this.dragEffect == UIScrollView.DragEffect.None)
				{
					this.mMomentum = Vector3.zero;
				}
				else
				{
					this.mMomentum = Vector3.Lerp(this.mMomentum, this.mMomentum + vector * (0.01f * this.momentumAmount), 0.67f);
				}
				if (!this.iOSDragEmulation || this.dragEffect != UIScrollView.DragEffect.MomentumAndSpring)
				{
					this.MoveAbsolute(vector);
				}
				else if (this.mPanel.CalculateConstrainOffset(this.bounds.min, this.bounds.max).magnitude > 1f)
				{
					this.MoveAbsolute(vector * 0.5f);
					this.mMomentum *= 0.5f;
				}
				else
				{
					this.MoveAbsolute(vector);
				}
			}
		}
	}

	// Token: 0x06000509 RID: 1289 RVA: 0x00021F58 File Offset: 0x00020158
	public void Scroll(float delta)
	{
		if (base.enabled && NGUITools.GetActive(base.gameObject) && this.scrollWheelFactor != 0f)
		{
			this.DisableSpring();
			this.mShouldMove |= this.shouldMove;
			if (Mathf.Sign(this.mScroll) != Mathf.Sign(delta))
			{
				this.mScroll = 0f;
			}
			this.mScroll += delta * this.scrollWheelFactor;
		}
	}

	// Token: 0x0600050A RID: 1290 RVA: 0x00021FE0 File Offset: 0x000201E0
	private void LateUpdate()
	{
		if (!Application.isPlaying)
		{
			return;
		}
		float deltaTime = RealTime.deltaTime;
		if (this.showScrollBars != UIScrollView.ShowCondition.Always && (this.verticalScrollBar || this.horizontalScrollBar))
		{
			bool flag = false;
			bool flag2 = false;
			if (this.showScrollBars != UIScrollView.ShowCondition.WhenDragging || this.mDragID != -10 || this.mMomentum.magnitude > 0.01f)
			{
				flag = this.shouldMoveVertically;
				flag2 = this.shouldMoveHorizontally;
			}
			if (this.verticalScrollBar)
			{
				float num = this.verticalScrollBar.alpha;
				num += ((!flag) ? (-deltaTime * 3f) : (deltaTime * 6f));
				num = Mathf.Clamp01(num);
				if (this.verticalScrollBar.alpha != num)
				{
					this.verticalScrollBar.alpha = num;
				}
			}
			if (this.horizontalScrollBar)
			{
				float num2 = this.horizontalScrollBar.alpha;
				num2 += ((!flag2) ? (-deltaTime * 3f) : (deltaTime * 6f));
				num2 = Mathf.Clamp01(num2);
				if (this.horizontalScrollBar.alpha != num2)
				{
					this.horizontalScrollBar.alpha = num2;
				}
			}
		}
		if (!this.mShouldMove)
		{
			return;
		}
		if (!this.mPressed)
		{
			if (this.mMomentum.magnitude > 0.0001f || this.mScroll != 0f)
			{
				if (this.movement == UIScrollView.Movement.Horizontal)
				{
					this.mMomentum -= this.mTrans.TransformDirection(new Vector3(this.mScroll * 0.05f, 0f, 0f));
				}
				else if (this.movement == UIScrollView.Movement.Vertical)
				{
					this.mMomentum -= this.mTrans.TransformDirection(new Vector3(0f, this.mScroll * 0.05f, 0f));
				}
				else if (this.movement == UIScrollView.Movement.Unrestricted)
				{
					this.mMomentum -= this.mTrans.TransformDirection(new Vector3(this.mScroll * 0.05f, this.mScroll * 0.05f, 0f));
				}
				else
				{
					this.mMomentum -= this.mTrans.TransformDirection(new Vector3(this.mScroll * this.customMovement.x * 0.05f, this.mScroll * this.customMovement.y * 0.05f, 0f));
				}
				this.mScroll = NGUIMath.SpringLerp(this.mScroll, 0f, 20f, deltaTime);
				Vector3 absolute = NGUIMath.SpringDampen(ref this.mMomentum, this.dampenStrength, deltaTime);
				this.MoveAbsolute(absolute);
				if (this.restrictWithinPanel && this.mPanel.clipping != UIDrawCall.Clipping.None)
				{
					if (NGUITools.GetActive(this.centerOnChild))
					{
						if (this.centerOnChild.nextPageThreshold != 0f)
						{
							this.mMomentum = Vector3.zero;
							this.mScroll = 0f;
						}
						else
						{
							this.centerOnChild.Recenter();
						}
					}
					else
					{
						this.RestrictWithinBounds(false, this.canMoveHorizontally, this.canMoveVertically);
					}
				}
				if (this.onMomentumMove != null)
				{
					this.onMomentumMove();
				}
			}
			else
			{
				this.mScroll = 0f;
				this.mMomentum = Vector3.zero;
				SpringPanel component = base.GetComponent<SpringPanel>();
				if (component != null && component.enabled)
				{
					return;
				}
				this.mShouldMove = false;
				if (this.onStoppedMoving != null)
				{
					this.onStoppedMoving();
				}
			}
		}
		else
		{
			this.mScroll = 0f;
			NGUIMath.SpringDampen(ref this.mMomentum, 9f, deltaTime);
		}
	}

	// Token: 0x0600050B RID: 1291 RVA: 0x000223E4 File Offset: 0x000205E4
	public void OnPan(Vector2 delta)
	{
		if (this.horizontalScrollBar != null)
		{
			this.horizontalScrollBar.OnPan(delta);
		}
		if (this.verticalScrollBar != null)
		{
			this.verticalScrollBar.OnPan(delta);
		}
		if (this.horizontalScrollBar == null && this.verticalScrollBar == null)
		{
			if (this.scale.x != 0f)
			{
				this.Scroll(delta.x);
			}
			else if (this.scale.y != 0f)
			{
				this.Scroll(delta.y);
			}
		}
	}

	// Token: 0x04000534 RID: 1332
	public static BetterList<UIScrollView> list = new BetterList<UIScrollView>();

	// Token: 0x04000535 RID: 1333
	public UIScrollView.Movement movement;

	// Token: 0x04000536 RID: 1334
	public UIScrollView.DragEffect dragEffect = UIScrollView.DragEffect.MomentumAndSpring;

	// Token: 0x04000537 RID: 1335
	public bool restrictWithinPanel = true;

	// Token: 0x04000538 RID: 1336
	public bool disableDragIfFits;

	// Token: 0x04000539 RID: 1337
	public bool smoothDragStart = true;

	// Token: 0x0400053A RID: 1338
	public bool iOSDragEmulation = true;

	// Token: 0x0400053B RID: 1339
	public float scrollWheelFactor = 0.25f;

	// Token: 0x0400053C RID: 1340
	public float momentumAmount = 35f;

	// Token: 0x0400053D RID: 1341
	public float dampenStrength = 9f;

	// Token: 0x0400053E RID: 1342
	public UIProgressBar horizontalScrollBar;

	// Token: 0x0400053F RID: 1343
	public UIProgressBar verticalScrollBar;

	// Token: 0x04000540 RID: 1344
	public UIScrollView.ShowCondition showScrollBars = UIScrollView.ShowCondition.OnlyIfNeeded;

	// Token: 0x04000541 RID: 1345
	public Vector2 customMovement = new Vector2(1f, 0f);

	// Token: 0x04000542 RID: 1346
	public UIWidget.Pivot contentPivot;

	// Token: 0x04000543 RID: 1347
	public UIScrollView.OnDragNotification onDragStarted;

	// Token: 0x04000544 RID: 1348
	public UIScrollView.OnDragNotification onDragFinished;

	// Token: 0x04000545 RID: 1349
	public UIScrollView.OnDragNotification onMomentumMove;

	// Token: 0x04000546 RID: 1350
	public UIScrollView.OnDragNotification onStoppedMoving;

	// Token: 0x04000547 RID: 1351
	[HideInInspector]
	[SerializeField]
	private Vector3 scale = new Vector3(1f, 0f, 0f);

	// Token: 0x04000548 RID: 1352
	[HideInInspector]
	[SerializeField]
	private Vector2 relativePositionOnReset = Vector2.zero;

	// Token: 0x04000549 RID: 1353
	protected Transform mTrans;

	// Token: 0x0400054A RID: 1354
	protected UIPanel mPanel;

	// Token: 0x0400054B RID: 1355
	protected Plane mPlane;

	// Token: 0x0400054C RID: 1356
	protected Vector3 mLastPos;

	// Token: 0x0400054D RID: 1357
	protected bool mPressed;

	// Token: 0x0400054E RID: 1358
	protected Vector3 mMomentum = Vector3.zero;

	// Token: 0x0400054F RID: 1359
	protected float mScroll;

	// Token: 0x04000550 RID: 1360
	protected Bounds mBounds;

	// Token: 0x04000551 RID: 1361
	protected bool mCalculatedBounds;

	// Token: 0x04000552 RID: 1362
	protected bool mShouldMove;

	// Token: 0x04000553 RID: 1363
	protected bool mIgnoreCallbacks;

	// Token: 0x04000554 RID: 1364
	protected int mDragID = -10;

	// Token: 0x04000555 RID: 1365
	protected Vector2 mDragStartOffset = Vector2.zero;

	// Token: 0x04000556 RID: 1366
	protected bool mDragStarted;

	// Token: 0x04000557 RID: 1367
	[NonSerialized]
	private bool mStarted;

	// Token: 0x04000558 RID: 1368
	[HideInInspector]
	public UICenterOnChild centerOnChild;

	// Token: 0x020000C1 RID: 193
	public enum Movement
	{
		// Token: 0x0400055A RID: 1370
		Horizontal,
		// Token: 0x0400055B RID: 1371
		Vertical,
		// Token: 0x0400055C RID: 1372
		Unrestricted,
		// Token: 0x0400055D RID: 1373
		Custom
	}

	// Token: 0x020000C2 RID: 194
	public enum DragEffect
	{
		// Token: 0x0400055F RID: 1375
		None,
		// Token: 0x04000560 RID: 1376
		Momentum,
		// Token: 0x04000561 RID: 1377
		MomentumAndSpring
	}

	// Token: 0x020000C3 RID: 195
	public enum ShowCondition
	{
		// Token: 0x04000563 RID: 1379
		Always,
		// Token: 0x04000564 RID: 1380
		OnlyIfNeeded,
		// Token: 0x04000565 RID: 1381
		WhenDragging
	}

	// Token: 0x02000339 RID: 825
	// (Invoke) Token: 0x06001506 RID: 5382
	public delegate void OnDragNotification();
}
