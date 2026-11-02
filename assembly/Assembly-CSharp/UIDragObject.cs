using System;
using UnityEngine;

// Token: 0x020000A4 RID: 164
[AddComponentMenu("NGUI/Interaction/Drag Object")]
[ExecuteInEditMode]
public class UIDragObject : MonoBehaviour
{
	// Token: 0x1700002E RID: 46
	// (get) Token: 0x060003EC RID: 1004 RVA: 0x00019D64 File Offset: 0x00017F64
	// (set) Token: 0x060003ED RID: 1005 RVA: 0x00019D6C File Offset: 0x00017F6C
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

	// Token: 0x060003EE RID: 1006 RVA: 0x00019D78 File Offset: 0x00017F78
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

	// Token: 0x060003EF RID: 1007 RVA: 0x00019E30 File Offset: 0x00018030
	private void OnDisable()
	{
		this.mStarted = false;
	}

	// Token: 0x060003F0 RID: 1008 RVA: 0x00019E3C File Offset: 0x0001803C
	private void FindPanel()
	{
		this.panelRegion = ((!(this.target != null)) ? null : UIPanel.Find(this.target.transform.parent));
		if (this.panelRegion == null)
		{
			this.restrictWithinPanel = false;
		}
	}

	// Token: 0x060003F1 RID: 1009 RVA: 0x00019E94 File Offset: 0x00018094
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

	// Token: 0x060003F2 RID: 1010 RVA: 0x00019F6C File Offset: 0x0001816C
	private void OnPress(bool pressed)
	{
		if (UICamera.currentTouchID == -2 || UICamera.currentTouchID == -3)
		{
			return;
		}
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
				if (this.restrictWithinPanel && this.dragEffect == UIDragObject.DragEffect.MomentumAndSpring && this.panelRegion.ConstrainTargetToBounds(this.target, ref this.mBounds, false))
				{
					this.CancelMovement();
				}
			}
		}
	}

	// Token: 0x060003F3 RID: 1011 RVA: 0x0001A0F8 File Offset: 0x000182F8
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
				if (this.dragEffect != UIDragObject.DragEffect.None)
				{
					this.mMomentum = Vector3.Lerp(this.mMomentum, this.mMomentum + vector * (0.01f * this.momentumAmount), 0.67f);
				}
				Vector3 localPosition = this.target.localPosition;
				this.Move(vector);
				if (this.restrictWithinPanel)
				{
					this.mBounds.center = this.mBounds.center + (this.target.localPosition - localPosition);
					if (this.dragEffect != UIDragObject.DragEffect.MomentumAndSpring && this.panelRegion.ConstrainTargetToBounds(this.target, ref this.mBounds, true))
					{
						this.CancelMovement();
					}
				}
			}
		}
	}

	// Token: 0x060003F4 RID: 1012 RVA: 0x0001A2C4 File Offset: 0x000184C4
	private void Move(Vector3 worldDelta)
	{
		if (this.panelRegion != null)
		{
			this.mTargetPos += worldDelta;
			Transform parent = this.target.parent;
			Rigidbody component = this.target.GetComponent<Rigidbody>();
			if (parent != null)
			{
				Vector3 vector = parent.worldToLocalMatrix.MultiplyPoint3x4(this.mTargetPos);
				vector.x = Mathf.Round(vector.x);
				vector.y = Mathf.Round(vector.y);
				if (component != null)
				{
					vector = parent.localToWorldMatrix.MultiplyPoint3x4(vector);
					component.position = vector;
				}
				else
				{
					this.target.localPosition = vector;
				}
			}
			else if (component != null)
			{
				component.position = this.mTargetPos;
			}
			else
			{
				this.target.position = this.mTargetPos;
			}
			UIScrollView component2 = this.panelRegion.GetComponent<UIScrollView>();
			if (component2 != null)
			{
				component2.UpdateScrollbars(true);
			}
		}
		else
		{
			this.target.position += worldDelta;
		}
	}

	// Token: 0x060003F5 RID: 1013 RVA: 0x0001A3F8 File Offset: 0x000185F8
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
				if (this.panelRegion.ConstrainTargetToBounds(this.target, ref this.mBounds, this.dragEffect == UIDragObject.DragEffect.None))
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

	// Token: 0x060003F6 RID: 1014 RVA: 0x0001A53C File Offset: 0x0001873C
	public void CancelMovement()
	{
		if (this.target != null)
		{
			Vector3 localPosition = this.target.localPosition;
			localPosition.x = (float)Mathf.RoundToInt(localPosition.x);
			localPosition.y = (float)Mathf.RoundToInt(localPosition.y);
			localPosition.z = (float)Mathf.RoundToInt(localPosition.z);
			this.target.localPosition = localPosition;
		}
		this.mTargetPos = ((!(this.target != null)) ? Vector3.zero : this.target.position);
		this.mMomentum = Vector3.zero;
		this.mScroll = Vector3.zero;
	}

	// Token: 0x060003F7 RID: 1015 RVA: 0x0001A5F0 File Offset: 0x000187F0
	public void CancelSpring()
	{
		SpringPosition component = this.target.GetComponent<SpringPosition>();
		if (component != null)
		{
			component.enabled = false;
		}
	}

	// Token: 0x060003F8 RID: 1016 RVA: 0x0001A61C File Offset: 0x0001881C
	private void OnScroll(float delta)
	{
		if (base.enabled && NGUITools.GetActive(base.gameObject))
		{
			this.mScroll -= this.scrollMomentum * (delta * 0.05f);
		}
	}

	// Token: 0x04000420 RID: 1056
	public Transform target;

	// Token: 0x04000421 RID: 1057
	public UIPanel panelRegion;

	// Token: 0x04000422 RID: 1058
	public Vector3 scrollMomentum = Vector3.zero;

	// Token: 0x04000423 RID: 1059
	public bool restrictWithinPanel;

	// Token: 0x04000424 RID: 1060
	public UIRect contentRect;

	// Token: 0x04000425 RID: 1061
	public UIDragObject.DragEffect dragEffect = UIDragObject.DragEffect.MomentumAndSpring;

	// Token: 0x04000426 RID: 1062
	public float momentumAmount = 35f;

	// Token: 0x04000427 RID: 1063
	[SerializeField]
	protected Vector3 scale = new Vector3(1f, 1f, 0f);

	// Token: 0x04000428 RID: 1064
	[HideInInspector]
	[SerializeField]
	private float scrollWheelFactor;

	// Token: 0x04000429 RID: 1065
	private Plane mPlane;

	// Token: 0x0400042A RID: 1066
	private Vector3 mTargetPos;

	// Token: 0x0400042B RID: 1067
	private Vector3 mLastPos;

	// Token: 0x0400042C RID: 1068
	private Vector3 mMomentum = Vector3.zero;

	// Token: 0x0400042D RID: 1069
	private Vector3 mScroll = Vector3.zero;

	// Token: 0x0400042E RID: 1070
	private Bounds mBounds;

	// Token: 0x0400042F RID: 1071
	private int mTouchID;

	// Token: 0x04000430 RID: 1072
	private bool mStarted;

	// Token: 0x04000431 RID: 1073
	private bool mPressed;

	// Token: 0x020000A5 RID: 165
	public enum DragEffect
	{
		// Token: 0x04000433 RID: 1075
		None,
		// Token: 0x04000434 RID: 1076
		Momentum,
		// Token: 0x04000435 RID: 1077
		MomentumAndSpring
	}
}
