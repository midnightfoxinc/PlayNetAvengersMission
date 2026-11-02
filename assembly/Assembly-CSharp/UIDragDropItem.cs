using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000A1 RID: 161
[AddComponentMenu("NGUI/Interaction/Drag and Drop Item")]
public class UIDragDropItem : MonoBehaviour
{
	// Token: 0x060003D7 RID: 983 RVA: 0x00019494 File Offset: 0x00017694
	protected virtual void Awake()
	{
		this.mTrans = base.transform;
		this.mCollider = base.gameObject.GetComponent<Collider>();
		this.mCollider2D = base.gameObject.GetComponent<Collider2D>();
	}

	// Token: 0x060003D8 RID: 984 RVA: 0x000194D0 File Offset: 0x000176D0
	protected virtual void OnEnable()
	{
	}

	// Token: 0x060003D9 RID: 985 RVA: 0x000194D4 File Offset: 0x000176D4
	protected virtual void OnDisable()
	{
		if (this.mDragging)
		{
			this.StopDragging(UICamera.hoveredObject);
		}
	}

	// Token: 0x060003DA RID: 986 RVA: 0x000194EC File Offset: 0x000176EC
	protected virtual void Start()
	{
		this.mButton = base.GetComponent<UIButton>();
		this.mDragScrollView = base.GetComponent<UIDragScrollView>();
	}

	// Token: 0x060003DB RID: 987 RVA: 0x00019508 File Offset: 0x00017708
	protected virtual void OnPress(bool isPressed)
	{
		if (!this.interactable || UICamera.currentTouchID == -2 || UICamera.currentTouchID == -3)
		{
			return;
		}
		if (isPressed)
		{
			if (!this.mPressed)
			{
				this.mTouch = UICamera.currentTouch;
				this.mDragStartTime = RealTime.time + this.pressAndHoldDelay;
				this.mPressed = true;
			}
		}
		else if (this.mPressed && this.mTouch == UICamera.currentTouch)
		{
			this.mPressed = false;
			this.mTouch = null;
		}
	}

	// Token: 0x060003DC RID: 988 RVA: 0x0001959C File Offset: 0x0001779C
	protected virtual void Update()
	{
		if (this.restriction == UIDragDropItem.Restriction.PressAndHold && this.mPressed && !this.mDragging && this.mDragStartTime < RealTime.time)
		{
			this.StartDragging();
		}
	}

	// Token: 0x060003DD RID: 989 RVA: 0x000195E4 File Offset: 0x000177E4
	protected virtual void OnDragStart()
	{
		if (!this.interactable)
		{
			return;
		}
		if (!base.enabled || this.mTouch != UICamera.currentTouch)
		{
			return;
		}
		if (this.restriction != UIDragDropItem.Restriction.None)
		{
			if (this.restriction == UIDragDropItem.Restriction.Horizontal)
			{
				Vector2 totalDelta = this.mTouch.totalDelta;
				if (Mathf.Abs(totalDelta.x) < Mathf.Abs(totalDelta.y))
				{
					return;
				}
			}
			else if (this.restriction == UIDragDropItem.Restriction.Vertical)
			{
				Vector2 totalDelta2 = this.mTouch.totalDelta;
				if (Mathf.Abs(totalDelta2.x) > Mathf.Abs(totalDelta2.y))
				{
					return;
				}
			}
			else if (this.restriction == UIDragDropItem.Restriction.PressAndHold)
			{
				return;
			}
		}
		this.StartDragging();
	}

	// Token: 0x060003DE RID: 990 RVA: 0x000196B0 File Offset: 0x000178B0
	public virtual void StartDragging()
	{
		if (!this.interactable)
		{
			return;
		}
		if (!this.mDragging)
		{
			if (this.cloneOnDrag)
			{
				this.mPressed = false;
				GameObject gameObject = base.transform.parent.gameObject.AddChild(base.gameObject);
				gameObject.transform.localPosition = base.transform.localPosition;
				gameObject.transform.localRotation = base.transform.localRotation;
				gameObject.transform.localScale = base.transform.localScale;
				UIButtonColor component = gameObject.GetComponent<UIButtonColor>();
				if (component != null)
				{
					component.defaultColor = base.GetComponent<UIButtonColor>().defaultColor;
				}
				if (this.mTouch != null && this.mTouch.pressed == base.gameObject)
				{
					this.mTouch.current = gameObject;
					this.mTouch.pressed = gameObject;
					this.mTouch.dragged = gameObject;
					this.mTouch.last = gameObject;
				}
				UIDragDropItem component2 = gameObject.GetComponent<UIDragDropItem>();
				component2.mTouch = this.mTouch;
				component2.mPressed = true;
				component2.mDragging = true;
				component2.Start();
				component2.OnClone(base.gameObject);
				component2.OnDragDropStart();
				if (UICamera.currentTouch == null)
				{
					UICamera.currentTouch = this.mTouch;
				}
				this.mTouch = null;
				UICamera.Notify(base.gameObject, "OnPress", false);
				UICamera.Notify(base.gameObject, "OnHover", false);
			}
			else
			{
				this.mDragging = true;
				this.OnDragDropStart();
			}
		}
	}

	// Token: 0x060003DF RID: 991 RVA: 0x00019854 File Offset: 0x00017A54
	protected virtual void OnClone(GameObject original)
	{
	}

	// Token: 0x060003E0 RID: 992 RVA: 0x00019858 File Offset: 0x00017A58
	protected virtual void OnDrag(Vector2 delta)
	{
		if (!this.interactable)
		{
			return;
		}
		if (!this.mDragging || !base.enabled || this.mTouch != UICamera.currentTouch)
		{
			return;
		}
		if (this.mRoot != null)
		{
			this.OnDragDropMove(delta * this.mRoot.pixelSizeAdjustment);
		}
		else
		{
			this.OnDragDropMove(delta);
		}
	}

	// Token: 0x060003E1 RID: 993 RVA: 0x000198CC File Offset: 0x00017ACC
	protected virtual void OnDragEnd()
	{
		if (!this.interactable)
		{
			return;
		}
		if (!base.enabled || this.mTouch != UICamera.currentTouch)
		{
			return;
		}
		this.StopDragging(UICamera.hoveredObject);
	}

	// Token: 0x060003E2 RID: 994 RVA: 0x00019904 File Offset: 0x00017B04
	public void StopDragging(GameObject go)
	{
		if (this.mDragging)
		{
			this.mDragging = false;
			this.OnDragDropRelease(go);
		}
	}

	// Token: 0x060003E3 RID: 995 RVA: 0x00019920 File Offset: 0x00017B20
	protected virtual void OnDragDropStart()
	{
		if (!UIDragDropItem.draggedItems.Contains(this))
		{
			UIDragDropItem.draggedItems.Add(this);
		}
		if (this.mDragScrollView != null)
		{
			this.mDragScrollView.enabled = false;
		}
		if (this.mButton != null)
		{
			this.mButton.isEnabled = false;
		}
		else if (this.mCollider != null)
		{
			this.mCollider.enabled = false;
		}
		else if (this.mCollider2D != null)
		{
			this.mCollider2D.enabled = false;
		}
		this.mParent = this.mTrans.parent;
		this.mRoot = NGUITools.FindInParents<UIRoot>(this.mParent);
		this.mGrid = NGUITools.FindInParents<UIGrid>(this.mParent);
		this.mTable = NGUITools.FindInParents<UITable>(this.mParent);
		if (UIDragDropRoot.root != null)
		{
			this.mTrans.parent = UIDragDropRoot.root;
		}
		Vector3 localPosition = this.mTrans.localPosition;
		localPosition.z = 0f;
		this.mTrans.localPosition = localPosition;
		TweenPosition component = base.GetComponent<TweenPosition>();
		if (component != null)
		{
			component.enabled = false;
		}
		SpringPosition component2 = base.GetComponent<SpringPosition>();
		if (component2 != null)
		{
			component2.enabled = false;
		}
		NGUITools.MarkParentAsChanged(base.gameObject);
		if (this.mTable != null)
		{
			this.mTable.repositionNow = true;
		}
		if (this.mGrid != null)
		{
			this.mGrid.repositionNow = true;
		}
	}

	// Token: 0x060003E4 RID: 996 RVA: 0x00019AC8 File Offset: 0x00017CC8
	protected virtual void OnDragDropMove(Vector2 delta)
	{
		this.mTrans.localPosition += delta;
	}

	// Token: 0x060003E5 RID: 997 RVA: 0x00019AE8 File Offset: 0x00017CE8
	protected virtual void OnDragDropRelease(GameObject surface)
	{
		if (!this.cloneOnDrag)
		{
			if (this.mButton != null)
			{
				this.mButton.isEnabled = true;
			}
			else if (this.mCollider != null)
			{
				this.mCollider.enabled = true;
			}
			else if (this.mCollider2D != null)
			{
				this.mCollider2D.enabled = true;
			}
			UIDragDropContainer uidragDropContainer = (!surface) ? null : NGUITools.FindInParents<UIDragDropContainer>(surface);
			if (uidragDropContainer != null)
			{
				this.mTrans.parent = ((!(uidragDropContainer.reparentTarget != null)) ? uidragDropContainer.transform : uidragDropContainer.reparentTarget);
				Vector3 localPosition = this.mTrans.localPosition;
				localPosition.z = 0f;
				this.mTrans.localPosition = localPosition;
			}
			else
			{
				this.mTrans.parent = this.mParent;
			}
			this.mParent = this.mTrans.parent;
			this.mGrid = NGUITools.FindInParents<UIGrid>(this.mParent);
			this.mTable = NGUITools.FindInParents<UITable>(this.mParent);
			if (this.mDragScrollView != null)
			{
				base.Invoke("EnableDragScrollView", 0.001f);
			}
			NGUITools.MarkParentAsChanged(base.gameObject);
			if (this.mTable != null)
			{
				this.mTable.repositionNow = true;
			}
			if (this.mGrid != null)
			{
				this.mGrid.repositionNow = true;
			}
		}
		else
		{
			NGUITools.Destroy(base.gameObject);
		}
		this.OnDragDropEnd();
	}

	// Token: 0x060003E6 RID: 998 RVA: 0x00019C9C File Offset: 0x00017E9C
	protected virtual void OnDragDropEnd()
	{
		UIDragDropItem.draggedItems.Remove(this);
	}

	// Token: 0x060003E7 RID: 999 RVA: 0x00019CAC File Offset: 0x00017EAC
	protected void EnableDragScrollView()
	{
		if (this.mDragScrollView != null)
		{
			this.mDragScrollView.enabled = true;
		}
	}

	// Token: 0x04000408 RID: 1032
	public UIDragDropItem.Restriction restriction;

	// Token: 0x04000409 RID: 1033
	public bool cloneOnDrag;

	// Token: 0x0400040A RID: 1034
	[HideInInspector]
	public float pressAndHoldDelay = 1f;

	// Token: 0x0400040B RID: 1035
	public bool interactable = true;

	// Token: 0x0400040C RID: 1036
	[NonSerialized]
	protected Transform mTrans;

	// Token: 0x0400040D RID: 1037
	[NonSerialized]
	protected Transform mParent;

	// Token: 0x0400040E RID: 1038
	[NonSerialized]
	protected Collider mCollider;

	// Token: 0x0400040F RID: 1039
	[NonSerialized]
	protected Collider2D mCollider2D;

	// Token: 0x04000410 RID: 1040
	[NonSerialized]
	protected UIButton mButton;

	// Token: 0x04000411 RID: 1041
	[NonSerialized]
	protected UIRoot mRoot;

	// Token: 0x04000412 RID: 1042
	[NonSerialized]
	protected UIGrid mGrid;

	// Token: 0x04000413 RID: 1043
	[NonSerialized]
	protected UITable mTable;

	// Token: 0x04000414 RID: 1044
	[NonSerialized]
	protected float mDragStartTime;

	// Token: 0x04000415 RID: 1045
	[NonSerialized]
	protected UIDragScrollView mDragScrollView;

	// Token: 0x04000416 RID: 1046
	[NonSerialized]
	protected bool mPressed;

	// Token: 0x04000417 RID: 1047
	[NonSerialized]
	protected bool mDragging;

	// Token: 0x04000418 RID: 1048
	[NonSerialized]
	protected UICamera.MouseOrTouch mTouch;

	// Token: 0x04000419 RID: 1049
	public static List<UIDragDropItem> draggedItems = new List<UIDragDropItem>();

	// Token: 0x020000A2 RID: 162
	public enum Restriction
	{
		// Token: 0x0400041B RID: 1051
		None,
		// Token: 0x0400041C RID: 1052
		Horizontal,
		// Token: 0x0400041D RID: 1053
		Vertical,
		// Token: 0x0400041E RID: 1054
		PressAndHold
	}
}
