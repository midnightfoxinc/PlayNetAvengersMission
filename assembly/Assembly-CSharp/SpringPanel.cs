using System;
using UnityEngine;

// Token: 0x020000E9 RID: 233
[AddComponentMenu("NGUI/Internal/Spring Panel")]
[RequireComponent(typeof(UIPanel))]
public class SpringPanel : MonoBehaviour
{
	// Token: 0x060006B7 RID: 1719 RVA: 0x00031600 File Offset: 0x0002F800
	private void Start()
	{
		this.mPanel = base.GetComponent<UIPanel>();
		this.mDrag = base.GetComponent<UIScrollView>();
		this.mTrans = base.transform;
	}

	// Token: 0x060006B8 RID: 1720 RVA: 0x00031634 File Offset: 0x0002F834
	private void Update()
	{
		this.AdvanceTowardsPosition();
	}

	// Token: 0x060006B9 RID: 1721 RVA: 0x0003163C File Offset: 0x0002F83C
	protected virtual void AdvanceTowardsPosition()
	{
		float deltaTime = RealTime.deltaTime;
		bool flag = false;
		Vector3 localPosition = this.mTrans.localPosition;
		Vector3 vector = NGUIMath.SpringLerp(this.mTrans.localPosition, this.target, this.strength, deltaTime);
		if ((vector - this.target).sqrMagnitude < 0.01f)
		{
			vector = this.target;
			base.enabled = false;
			flag = true;
		}
		this.mTrans.localPosition = vector;
		Vector3 vector2 = vector - localPosition;
		Vector2 clipOffset = this.mPanel.clipOffset;
		clipOffset.x -= vector2.x;
		clipOffset.y -= vector2.y;
		this.mPanel.clipOffset = clipOffset;
		if (this.mDrag != null)
		{
			this.mDrag.UpdateScrollbars(false);
		}
		if (flag && this.onFinished != null)
		{
			SpringPanel.current = this;
			this.onFinished();
			SpringPanel.current = null;
		}
	}

	// Token: 0x060006BA RID: 1722 RVA: 0x00031748 File Offset: 0x0002F948
	public static SpringPanel Begin(GameObject go, Vector3 pos, float strength)
	{
		SpringPanel springPanel = go.GetComponent<SpringPanel>();
		if (springPanel == null)
		{
			springPanel = go.AddComponent<SpringPanel>();
		}
		springPanel.target = pos;
		springPanel.strength = strength;
		springPanel.onFinished = null;
		springPanel.enabled = true;
		return springPanel;
	}

	// Token: 0x0400066D RID: 1645
	public static SpringPanel current;

	// Token: 0x0400066E RID: 1646
	public Vector3 target = Vector3.zero;

	// Token: 0x0400066F RID: 1647
	public float strength = 10f;

	// Token: 0x04000670 RID: 1648
	public SpringPanel.OnFinished onFinished;

	// Token: 0x04000671 RID: 1649
	private UIPanel mPanel;

	// Token: 0x04000672 RID: 1650
	private Transform mTrans;

	// Token: 0x04000673 RID: 1651
	private UIScrollView mDrag;

	// Token: 0x02000342 RID: 834
	// (Invoke) Token: 0x0600152A RID: 5418
	public delegate void OnFinished();
}
