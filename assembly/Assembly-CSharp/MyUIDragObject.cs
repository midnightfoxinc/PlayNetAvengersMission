using System;
using UnityEngine;

// Token: 0x020001BB RID: 443
[ExecuteInEditMode]
[AddComponentMenu("NGUI/Interaction/My Drag Object")]
public class MyUIDragObject : MonoBehaviour
{
	// Token: 0x170001B8 RID: 440
	// (get) Token: 0x06000CFB RID: 3323 RVA: 0x0005DDD8 File Offset: 0x0005BFD8
	// (set) Token: 0x06000CFC RID: 3324 RVA: 0x0005DDE0 File Offset: 0x0005BFE0
	public Vector3 dragMovement
	{
		get
		{
			return this.scale;
		}
		set
		{
			this.scale = value;
		}
	}

	// Token: 0x06000CFD RID: 3325 RVA: 0x0005DDEC File Offset: 0x0005BFEC
	private void OnEnable()
	{
		if (this.scrollWheelFactor != 0f)
		{
			this.scrollMomentum = this.scale * this.scrollWheelFactor;
			this.scrollWheelFactor = 0f;
		}
		if (this.contentRect == null && this.target != null && Application.isPlaying)
		{
			UIWidget component = this.target.GetComponent<UIWidget>();
			if (component != null)
			{
				this.contentRect = component;
			}
		}
		this.mTargetPos = ((!(this.target != null)) ? Vector3.zero : this.target.position);
	}

	// Token: 0x06000CFE RID: 3326 RVA: 0x0005DEA4 File Offset: 0x0005C0A4
	private void OnDisable()
	{
		this.mStarted = false;
	}

	// Token: 0x06000CFF RID: 3327 RVA: 0x0005DEB0 File Offset: 0x0005C0B0
	private void FindPanel()
	{
		this.panelRegion = ((!(this.target != null)) ? null : UIPanel.Find(this.target.transform.parent));
		if (this.panelRegion == null)
		{
			this.restrictWithinPanel = false;
		}
	}

	// Token: 0x06000D00 RID: 3328 RVA: 0x0005DF08 File Offset: 0x0005C108
	private void UpdateBounds()
	{
		if (this.contentRect)
		{
			Transform cachedTransform = this.panelRegion.cachedTransform;
			Matrix4x4 worldToLocalMatrix = cachedTransform.worldToLocalMatrix;
			Vector3[] worldCorners = this.contentRect.worldCorners;
			for (int i = 0; i < 4; i++)
			{
				worldCorners[i] = worldToLocalMatrix.MultiplyPoint3x4(worldCorners[i]);
			}
			this.mBounds = new Bounds(worldCorners[0], Vector3.zero);
			for (int j = 1; j < 4; j++)
			{
				this.mBounds.Encapsulate(worldCorners[j]);
			}
		}
		else
		{
			this.mBounds = NGUIMath.CalculateRelativeWidgetBounds(this.panelRegion.cachedTransform, this.target);
		}
	}

	// Token: 0x06000D01 RID: 3329 RVA: 0x0005DFE0 File Offset: 0x0005C1E0
	private void OnPress(bool pressed)
	{
		float timeScale = Time.timeScale;
		if (timeScale < 0.01f && timeScale != 0f)
		{
			return;
		}
		if (base.enabled && NGUITools.GetActive(base.gameObject) && this.target != null)
		{
			if (pressed)
			{
				if (!this.mPressed)
				{
					this.mTouchID = UICamera.currentTouchID;
					this.mPressed = true;
					this.mStarted = false;
					this.CancelMovement();
					if (this.restrictWithinPanel && this.panelRegion == null)
					{
						this.FindPanel();
					}
					if (this.restrictWithinPanel)
					{
						this.UpdateBounds();
					}
					this.CancelSpring();
					Transform transform = UICamera.currentCamera.transform;
					this.mPlane = new Plane(((!(this.panelRegion != null)) ? transform.rotation : this.panelRegion.cachedTransform.rotation) * Vector3.back, UICamera.lastWorldPosition);
				}
			}
			else if (this.mPressed && this.mTouchID == UICamera.currentTouchID)
			{
				this.mPressed = false;
				if (this.restrictWithinPanel && this.dragEffect == MyUIDragObject.DragEffect.MomentumAndSpring && this.panelRegion.ConstrainTargetToBounds(this.target, ref this.mBounds, false))
				{
					this.CancelMovement();
				}
			}
		}
	}

	// Token: 0x06000D02 RID: 3330 RVA: 0x0005E154 File Offset: 0x0005C354
	private void OnDrag(Vector2 delta)
	{
		if (this.mPressed && this.mTouchID == UICamera.currentTouchID && base.enabled && NGUITools.GetActive(base.gameObject) && this.target != null)
		{
			UICamera.currentTouch.clickNotification = UICamera.ClickNotification.BasedOnDelta;
			Ray ray = UICamera.currentCamera.ScreenPointToRay(UICamera.currentTouch.pos);
			float num = 0f;
			if (this.mPlane.Raycast(ray, ref num))
			{
				Vector3 point = ray.GetPoint(num);
				Vector3 vector = point - this.mLastPos;
				this.mLastPos = point;
				if (!this.mStarted)
				{
					this.mStarted = true;
					vector = Vector3.zero;
				}
				if (vector.x != 0f || vector.y != 0f)
				{
					vector = this.target.InverseTransformDirection(vector);
					vector.Scale(this.scale);
					vector = this.target.TransformDirection(vector);
				}
				if (this.dragEffect != MyUIDragObject.DragEffect.None)
				{
					this.mMomentum = Vector3.Lerp(this.mMomentum, this.mMomentum + vector * (0.01f * this.momentumAmount), 0.67f);
				}
				Vector3 localPosition = this.target.localPosition;
				this.Move(vector);
				if (this.restrictWithinPanel)
				{
					this.mBounds.center = this.mBounds.center + (this.target.localPosition - localPosition);
					if (this.dragEffect != MyUIDragObject.DragEffect.MomentumAndSpring && this.panelRegion.ConstrainTargetToBounds(this.target, ref this.mBounds, true))
					{
						this.CancelMovement();
					}
				}
			}
		}
	}

	// Token: 0x06000D03 RID: 3331 RVA: 0x0005E320 File Offset: 0x0005C520
	private void Move(Vector3 worldDelta)
	{
		if (this.panelRegion != null)
		{
			this.mTargetPos += worldDelta;
			this.target.position = this.mTargetPos;
			Vector3 localPosition = this.target.localPosition;
			localPosition.x = Mathf.Round(localPosition.x);
			localPosition.y = Mathf.Round(localPosition.y);
			this.target.localPosition = localPosition;
			UIScrollView component = this.panelRegion.GetComponent<UIScrollView>();
			if (component != null)
			{
				component.UpdateScrollbars(true);
			}
		}
		else
		{
			this.target.position += worldDelta;
		}
	}

	// Token: 0x06000D04 RID: 3332 RVA: 0x0005E3DC File Offset: 0x0005C5DC
	private void LateUpdate()
	{
		if (this.target == null)
		{
			return;
		}
		float deltaTime = RealTime.deltaTime;
		this.mMomentum -= this.mScroll;
		this.mScroll = NGUIMath.SpringLerp(this.mScroll, Vector3.zero, 20f, deltaTime);
		if (this.mMomentum.magnitude < 0.0001f)
		{
			return;
		}
		if (!this.mPressed)
		{
			if (this.panelRegion == null)
			{
				this.FindPanel();
			}
			this.Move(NGUIMath.SpringDampen(ref this.mMomentum, 9f, deltaTime));
			if (this.restrictWithinPanel && this.panelRegion != null)
			{
				this.UpdateBounds();
				if (this.panelRegion.ConstrainTargetToBounds(this.target, ref this.mBounds, this.dragEffect == MyUIDragObject.DragEffect.None))
				{
					this.CancelMovement();
				}
				else
				{
					this.CancelSpring();
				}
			}
			NGUIMath.SpringDampen(ref this.mMomentum, 9f, deltaTime);
			if (this.mMomentum.magnitude < 0.0001f)
			{
				this.CancelMovement();
			}
		}
		else
		{
			NGUIMath.SpringDampen(ref this.mMomentum, 9f, deltaTime);
		}
	}

	// Token: 0x06000D05 RID: 3333 RVA: 0x0005E520 File Offset: 0x0005C720
	public void CancelMovement()
	{
		this.mTargetPos = ((!(this.target != null)) ? Vector3.zero : this.target.position);
		this.mMomentum = Vector3.zero;
		this.mScroll = Vector3.zero;
	}

	// Token: 0x06000D06 RID: 3334 RVA: 0x0005E570 File Offset: 0x0005C770
	public void CancelSpring()
	{
		SpringPosition component = this.target.GetComponent<SpringPosition>();
		if (component != null)
		{
			component.enabled = false;
		}
	}

	// Token: 0x06000D07 RID: 3335 RVA: 0x0005E59C File Offset: 0x0005C79C
	private void OnScroll(float delta)
	{
		if (base.enabled && NGUITools.GetActive(base.gameObject))
		{
			this.mScroll -= this.scrollMomentum * (delta * 0.05f);
		}
	}

	// Token: 0x06000D08 RID: 3336 RVA: 0x0005E5E8 File Offset: 0x0005C7E8
	public bool IsBeingDragged()
	{
		return this.mPressed;
	}

	// Token: 0x04000D02 RID: 3330
	public Transform target;

	// Token: 0x04000D03 RID: 3331
	public UIPanel panelRegion;

	// Token: 0x04000D04 RID: 3332
	public Vector3 scrollMomentum = Vector3.zero;

	// Token: 0x04000D05 RID: 3333
	public bool restrictWithinPanel;

	// Token: 0x04000D06 RID: 3334
	public UIRect contentRect;

	// Token: 0x04000D07 RID: 3335
	public MyUIDragObject.DragEffect dragEffect = MyUIDragObject.DragEffect.MomentumAndSpring;

	// Token: 0x04000D08 RID: 3336
	public float momentumAmount = 35f;

	// Token: 0x04000D09 RID: 3337
	[SerializeField]
	protected Vector3 scale = new Vector3(1f, 1f, 0f);

	// Token: 0x04000D0A RID: 3338
	[SerializeField]
	[HideInInspector]
	private float scrollWheelFactor;

	// Token: 0x04000D0B RID: 3339
	private Plane mPlane;

	// Token: 0x04000D0C RID: 3340
	private Vector3 mTargetPos;

	// Token: 0x04000D0D RID: 3341
	private Vector3 mLastPos;

	// Token: 0x04000D0E RID: 3342
	private Vector3 mMomentum = Vector3.zero;

	// Token: 0x04000D0F RID: 3343
	private Vector3 mScroll = Vector3.zero;

	// Token: 0x04000D10 RID: 3344
	private Bounds mBounds;

	// Token: 0x04000D11 RID: 3345
	private int mTouchID;

	// Token: 0x04000D12 RID: 3346
	private bool mStarted;

	// Token: 0x04000D13 RID: 3347
	private bool mPressed;

	// Token: 0x020001BC RID: 444
	public enum DragEffect
	{
		// Token: 0x04000D15 RID: 3349
		None,
		// Token: 0x04000D16 RID: 3350
		Momentum,
		// Token: 0x04000D17 RID: 3351
		MomentumAndSpring
	}
}
