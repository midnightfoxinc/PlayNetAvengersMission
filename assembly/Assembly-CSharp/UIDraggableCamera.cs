using System;
using UnityEngine;

// Token: 0x020000A8 RID: 168
[RequireComponent(typeof(Camera))]
[AddComponentMenu("NGUI/Interaction/Draggable Camera")]
public class UIDraggableCamera : MonoBehaviour
{
	// Token: 0x1700002F RID: 47
	// (get) Token: 0x06000407 RID: 1031 RVA: 0x0001AB58 File Offset: 0x00018D58
	// (set) Token: 0x06000408 RID: 1032 RVA: 0x0001AB60 File Offset: 0x00018D60
	public Vector2 currentMomentum
	{
		get
		{
			return this.mMomentum;
		}
		set
		{
			this.mMomentum = value;
		}
	}

	// Token: 0x06000409 RID: 1033 RVA: 0x0001AB6C File Offset: 0x00018D6C
	private void Start()
	{
		this.mCam = base.GetComponent<Camera>();
		this.mTrans = base.transform;
		this.mRoot = NGUITools.FindInParents<UIRoot>(base.gameObject);
		if (this.rootForBounds == null)
		{
			Debug.LogError(NGUITools.GetHierarchy(base.gameObject) + " needs the 'Root For Bounds' parameter to be set", this);
			base.enabled = false;
		}
	}

	// Token: 0x0600040A RID: 1034 RVA: 0x0001ABD8 File Offset: 0x00018DD8
	private Vector3 CalculateConstrainOffset()
	{
		if (this.rootForBounds == null || this.rootForBounds.childCount == 0)
		{
			return Vector3.zero;
		}
		Vector3 vector;
		vector..ctor(this.mCam.rect.xMin * (float)Screen.width, this.mCam.rect.yMin * (float)Screen.height, 0f);
		Vector3 vector2;
		vector2..ctor(this.mCam.rect.xMax * (float)Screen.width, this.mCam.rect.yMax * (float)Screen.height, 0f);
		vector = this.mCam.ScreenToWorldPoint(vector);
		vector2 = this.mCam.ScreenToWorldPoint(vector2);
		Vector2 minRect;
		minRect..ctor(this.mBounds.min.x, this.mBounds.min.y);
		Vector2 maxRect;
		maxRect..ctor(this.mBounds.max.x, this.mBounds.max.y);
		return NGUIMath.ConstrainRect(minRect, maxRect, vector, vector2);
	}

	// Token: 0x0600040B RID: 1035 RVA: 0x0001AD20 File Offset: 0x00018F20
	public bool ConstrainToBounds(bool immediate)
	{
		if (this.mTrans != null && this.rootForBounds != null)
		{
			Vector3 vector = this.CalculateConstrainOffset();
			if (vector.sqrMagnitude > 0f)
			{
				if (immediate)
				{
					this.mTrans.position -= vector;
				}
				else
				{
					SpringPosition springPosition = SpringPosition.Begin(base.gameObject, this.mTrans.position - vector, 13f);
					springPosition.ignoreTimeScale = true;
					springPosition.worldSpace = true;
				}
				return true;
			}
		}
		return false;
	}

	// Token: 0x0600040C RID: 1036 RVA: 0x0001ADBC File Offset: 0x00018FBC
	public void Press(bool isPressed)
	{
		if (isPressed)
		{
			this.mDragStarted = false;
		}
		if (this.rootForBounds != null)
		{
			this.mPressed = isPressed;
			if (isPressed)
			{
				this.mBounds = NGUIMath.CalculateAbsoluteWidgetBounds(this.rootForBounds);
				this.mMomentum = Vector2.zero;
				this.mScroll = 0f;
				SpringPosition component = base.GetComponent<SpringPosition>();
				if (component != null)
				{
					component.enabled = false;
				}
			}
			else if (this.dragEffect == UIDragObject.DragEffect.MomentumAndSpring)
			{
				this.ConstrainToBounds(false);
			}
		}
	}

	// Token: 0x0600040D RID: 1037 RVA: 0x0001AE50 File Offset: 0x00019050
	public void Drag(Vector2 delta)
	{
		if (this.smoothDragStart && !this.mDragStarted)
		{
			this.mDragStarted = true;
			return;
		}
		UICamera.currentTouch.clickNotification = UICamera.ClickNotification.BasedOnDelta;
		if (this.mRoot != null)
		{
			delta *= this.mRoot.pixelSizeAdjustment;
		}
		Vector2 vector = Vector2.Scale(delta, -this.scale);
		this.mTrans.localPosition += vector;
		this.mMomentum = Vector2.Lerp(this.mMomentum, this.mMomentum + vector * (0.01f * this.momentumAmount), 0.67f);
		if (this.dragEffect != UIDragObject.DragEffect.MomentumAndSpring && this.ConstrainToBounds(true))
		{
			this.mMomentum = Vector2.zero;
			this.mScroll = 0f;
		}
	}

	// Token: 0x0600040E RID: 1038 RVA: 0x0001AF3C File Offset: 0x0001913C
	public void Scroll(float delta)
	{
		if (base.enabled && NGUITools.GetActive(base.gameObject))
		{
			if (Mathf.Sign(this.mScroll) != Mathf.Sign(delta))
			{
				this.mScroll = 0f;
			}
			this.mScroll += delta * this.scrollWheelFactor;
		}
	}

	// Token: 0x0600040F RID: 1039 RVA: 0x0001AF9C File Offset: 0x0001919C
	private void Update()
	{
		float deltaTime = RealTime.deltaTime;
		if (this.mPressed)
		{
			SpringPosition component = base.GetComponent<SpringPosition>();
			if (component != null)
			{
				component.enabled = false;
			}
			this.mScroll = 0f;
		}
		else
		{
			this.mMomentum += this.scale * (this.mScroll * 20f);
			this.mScroll = NGUIMath.SpringLerp(this.mScroll, 0f, 20f, deltaTime);
			if (this.mMomentum.magnitude > 0.01f)
			{
				this.mTrans.localPosition += NGUIMath.SpringDampen(ref this.mMomentum, 9f, deltaTime);
				this.mBounds = NGUIMath.CalculateAbsoluteWidgetBounds(this.rootForBounds);
				if (!this.ConstrainToBounds(this.dragEffect == UIDragObject.DragEffect.None))
				{
					SpringPosition component2 = base.GetComponent<SpringPosition>();
					if (component2 != null)
					{
						component2.enabled = false;
					}
				}
				return;
			}
			this.mScroll = 0f;
		}
		NGUIMath.SpringDampen(ref this.mMomentum, 9f, deltaTime);
	}

	// Token: 0x04000449 RID: 1097
	public Transform rootForBounds;

	// Token: 0x0400044A RID: 1098
	public Vector2 scale = Vector2.one;

	// Token: 0x0400044B RID: 1099
	public float scrollWheelFactor;

	// Token: 0x0400044C RID: 1100
	public UIDragObject.DragEffect dragEffect = UIDragObject.DragEffect.MomentumAndSpring;

	// Token: 0x0400044D RID: 1101
	public bool smoothDragStart = true;

	// Token: 0x0400044E RID: 1102
	public float momentumAmount = 35f;

	// Token: 0x0400044F RID: 1103
	private Camera mCam;

	// Token: 0x04000450 RID: 1104
	private Transform mTrans;

	// Token: 0x04000451 RID: 1105
	private bool mPressed;

	// Token: 0x04000452 RID: 1106
	private Vector2 mMomentum = Vector2.zero;

	// Token: 0x04000453 RID: 1107
	private Bounds mBounds;

	// Token: 0x04000454 RID: 1108
	private float mScroll;

	// Token: 0x04000455 RID: 1109
	private UIRoot mRoot;

	// Token: 0x04000456 RID: 1110
	private bool mDragStarted;
}
