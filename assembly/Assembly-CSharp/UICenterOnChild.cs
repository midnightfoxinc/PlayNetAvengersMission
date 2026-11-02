using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200009D RID: 157
[AddComponentMenu("NGUI/Interaction/Center Scroll View on Child")]
public class UICenterOnChild : MonoBehaviour
{
	// Token: 0x1700002D RID: 45
	// (get) Token: 0x060003C3 RID: 963 RVA: 0x00018AC4 File Offset: 0x00016CC4
	public GameObject centeredObject
	{
		get
		{
			return this.mCenteredObject;
		}
	}

	// Token: 0x060003C4 RID: 964 RVA: 0x00018ACC File Offset: 0x00016CCC
	private void Start()
	{
		this.Recenter();
	}

	// Token: 0x060003C5 RID: 965 RVA: 0x00018AD4 File Offset: 0x00016CD4
	private void OnEnable()
	{
		if (this.mScrollView)
		{
			this.mScrollView.centerOnChild = this;
			this.Recenter();
		}
	}

	// Token: 0x060003C6 RID: 966 RVA: 0x00018B04 File Offset: 0x00016D04
	private void OnDisable()
	{
		if (this.mScrollView)
		{
			this.mScrollView.centerOnChild = null;
		}
	}

	// Token: 0x060003C7 RID: 967 RVA: 0x00018B24 File Offset: 0x00016D24
	private void OnDragFinished()
	{
		if (base.enabled)
		{
			this.Recenter();
		}
	}

	// Token: 0x060003C8 RID: 968 RVA: 0x00018B38 File Offset: 0x00016D38
	private void OnValidate()
	{
		this.nextPageThreshold = Mathf.Abs(this.nextPageThreshold);
	}

	// Token: 0x060003C9 RID: 969 RVA: 0x00018B4C File Offset: 0x00016D4C
	[ContextMenu("Execute")]
	public void Recenter()
	{
		if (this.mScrollView == null)
		{
			this.mScrollView = NGUITools.FindInParents<UIScrollView>(base.gameObject);
			if (this.mScrollView == null)
			{
				Debug.LogWarning(string.Concat(new object[]
				{
					base.GetType(),
					" requires ",
					typeof(UIScrollView),
					" on a parent object in order to work"
				}), this);
				base.enabled = false;
				return;
			}
			if (this.mScrollView)
			{
				this.mScrollView.centerOnChild = this;
				UIScrollView uiscrollView = this.mScrollView;
				uiscrollView.onDragFinished = (UIScrollView.OnDragNotification)Delegate.Combine(uiscrollView.onDragFinished, new UIScrollView.OnDragNotification(this.OnDragFinished));
			}
			if (this.mScrollView.horizontalScrollBar != null)
			{
				UIProgressBar horizontalScrollBar = this.mScrollView.horizontalScrollBar;
				horizontalScrollBar.onDragFinished = (UIProgressBar.OnDragFinished)Delegate.Combine(horizontalScrollBar.onDragFinished, new UIProgressBar.OnDragFinished(this.OnDragFinished));
			}
			if (this.mScrollView.verticalScrollBar != null)
			{
				UIProgressBar verticalScrollBar = this.mScrollView.verticalScrollBar;
				verticalScrollBar.onDragFinished = (UIProgressBar.OnDragFinished)Delegate.Combine(verticalScrollBar.onDragFinished, new UIProgressBar.OnDragFinished(this.OnDragFinished));
			}
		}
		if (this.mScrollView.panel == null)
		{
			return;
		}
		Transform transform = base.transform;
		if (transform.childCount == 0)
		{
			return;
		}
		Vector3[] worldCorners = this.mScrollView.panel.worldCorners;
		Vector3 vector = (worldCorners[2] + worldCorners[0]) * 0.5f;
		Vector3 vector2 = this.mScrollView.currentMomentum * this.mScrollView.momentumAmount;
		Vector3 vector3 = NGUIMath.SpringDampen(ref vector2, 9f, 2f);
		Vector3 vector4 = vector - vector3 * 0.01f;
		float num = float.MaxValue;
		Transform target = null;
		int num2 = 0;
		int num3 = 0;
		UIGrid component = base.GetComponent<UIGrid>();
		List<Transform> list = null;
		if (component != null)
		{
			list = component.GetChildList();
			int i = 0;
			int count = list.Count;
			int num4 = 0;
			while (i < count)
			{
				Transform transform2 = list[i];
				if (transform2.gameObject.activeInHierarchy)
				{
					float num5 = Vector3.SqrMagnitude(transform2.position - vector4);
					if (num5 < num)
					{
						num = num5;
						target = transform2;
						num2 = i;
						num3 = num4;
					}
					num4++;
				}
				i++;
			}
		}
		else
		{
			int j = 0;
			int childCount = transform.childCount;
			int num6 = 0;
			while (j < childCount)
			{
				Transform child = transform.GetChild(j);
				if (child.gameObject.activeInHierarchy)
				{
					float num7 = Vector3.SqrMagnitude(child.position - vector4);
					if (num7 < num)
					{
						num = num7;
						target = child;
						num2 = j;
						num3 = num6;
					}
					num6++;
				}
				j++;
			}
		}
		if (this.nextPageThreshold > 0f && UICamera.currentTouch != null && this.mCenteredObject != null && this.mCenteredObject.transform == ((list == null) ? transform.GetChild(num2) : list[num2]))
		{
			Vector3 vector5 = UICamera.currentTouch.totalDelta;
			vector5 = base.transform.rotation * vector5;
			UIScrollView.Movement movement = this.mScrollView.movement;
			float num8;
			if (movement != UIScrollView.Movement.Horizontal)
			{
				if (movement != UIScrollView.Movement.Vertical)
				{
					num8 = vector5.magnitude;
				}
				else
				{
					num8 = vector5.y;
				}
			}
			else
			{
				num8 = vector5.x;
			}
			if (Mathf.Abs(num8) > this.nextPageThreshold)
			{
				if (num8 > this.nextPageThreshold)
				{
					if (list != null)
					{
						if (num3 > 0)
						{
							target = list[num3 - 1];
						}
						else
						{
							target = ((!(base.GetComponent<UIWrapContent>() == null)) ? list[list.Count - 1] : list[0]);
						}
					}
					else if (num3 > 0)
					{
						target = transform.GetChild(num3 - 1);
					}
					else
					{
						target = ((!(base.GetComponent<UIWrapContent>() == null)) ? transform.GetChild(transform.childCount - 1) : transform.GetChild(0));
					}
				}
				else if (num8 < -this.nextPageThreshold)
				{
					if (list != null)
					{
						if (num3 < list.Count - 1)
						{
							target = list[num3 + 1];
						}
						else
						{
							target = ((!(base.GetComponent<UIWrapContent>() == null)) ? list[0] : list[list.Count - 1]);
						}
					}
					else if (num3 < transform.childCount - 1)
					{
						target = transform.GetChild(num3 + 1);
					}
					else
					{
						target = ((!(base.GetComponent<UIWrapContent>() == null)) ? transform.GetChild(0) : transform.GetChild(transform.childCount - 1));
					}
				}
			}
		}
		this.CenterOn(target, vector);
	}

	// Token: 0x060003CA RID: 970 RVA: 0x000190B4 File Offset: 0x000172B4
	private void CenterOn(Transform target, Vector3 panelCenter)
	{
		if (target != null && this.mScrollView != null && this.mScrollView.panel != null)
		{
			Transform cachedTransform = this.mScrollView.panel.cachedTransform;
			this.mCenteredObject = target.gameObject;
			Vector3 vector = cachedTransform.InverseTransformPoint(target.position);
			Vector3 vector2 = cachedTransform.InverseTransformPoint(panelCenter);
			Vector3 vector3 = vector - vector2;
			if (!this.mScrollView.canMoveHorizontally)
			{
				vector3.x = 0f;
			}
			if (!this.mScrollView.canMoveVertically)
			{
				vector3.y = 0f;
			}
			vector3.z = 0f;
			SpringPanel.Begin(this.mScrollView.panel.cachedGameObject, cachedTransform.localPosition - vector3, this.springStrength).onFinished = this.onFinished;
		}
		else
		{
			this.mCenteredObject = null;
		}
		if (this.onCenter != null)
		{
			this.onCenter(this.mCenteredObject);
		}
	}

	// Token: 0x060003CB RID: 971 RVA: 0x000191CC File Offset: 0x000173CC
	public void CenterOn(Transform target)
	{
		if (this.mScrollView != null && this.mScrollView.panel != null)
		{
			Vector3[] worldCorners = this.mScrollView.panel.worldCorners;
			Vector3 panelCenter = (worldCorners[2] + worldCorners[0]) * 0.5f;
			this.CenterOn(target, panelCenter);
		}
	}

	// Token: 0x04000400 RID: 1024
	public float springStrength = 8f;

	// Token: 0x04000401 RID: 1025
	public float nextPageThreshold;

	// Token: 0x04000402 RID: 1026
	public SpringPanel.OnFinished onFinished;

	// Token: 0x04000403 RID: 1027
	public UICenterOnChild.OnCenterCallback onCenter;

	// Token: 0x04000404 RID: 1028
	private UIScrollView mScrollView;

	// Token: 0x04000405 RID: 1029
	private GameObject mCenteredObject;

	// Token: 0x02000335 RID: 821
	// (Invoke) Token: 0x060014F6 RID: 5366
	public delegate void OnCenterCallback(GameObject centeredObject);
}
