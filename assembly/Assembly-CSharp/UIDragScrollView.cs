using System;
using UnityEngine;

// Token: 0x020000A7 RID: 167
[AddComponentMenu("NGUI/Interaction/Drag Scroll View")]
public class UIDragScrollView : MonoBehaviour
{
	// Token: 0x060003FE RID: 1022 RVA: 0x0001A898 File Offset: 0x00018A98
	private void OnEnable()
	{
		this.mTrans = base.transform;
		if (this.scrollView == null && this.draggablePanel != null)
		{
			this.scrollView = this.draggablePanel;
			this.draggablePanel = null;
		}
		if (this.mStarted && (this.mAutoFind || this.mScroll == null))
		{
			this.FindScrollView();
		}
	}

	// Token: 0x060003FF RID: 1023 RVA: 0x0001A914 File Offset: 0x00018B14
	private void Start()
	{
		this.mStarted = true;
		this.FindScrollView();
	}

	// Token: 0x06000400 RID: 1024 RVA: 0x0001A924 File Offset: 0x00018B24
	private void FindScrollView()
	{
		UIScrollView uiscrollView = NGUITools.FindInParents<UIScrollView>(this.mTrans);
		if (this.scrollView == null || (this.mAutoFind && uiscrollView != this.scrollView))
		{
			this.scrollView = uiscrollView;
			this.mAutoFind = true;
		}
		else if (this.scrollView == uiscrollView)
		{
			this.mAutoFind = true;
		}
		this.mScroll = this.scrollView;
	}

	// Token: 0x06000401 RID: 1025 RVA: 0x0001A9A4 File Offset: 0x00018BA4
	private void OnDisable()
	{
		if (this.mScroll != null && this.mScroll.GetComponentInChildren<UIWrapContent>() == null)
		{
			this.mScroll.Press(false);
			this.mScroll = null;
		}
	}

	// Token: 0x06000402 RID: 1026 RVA: 0x0001A9EC File Offset: 0x00018BEC
	private void OnPress(bool pressed)
	{
		if (this.mAutoFind && this.mScroll != this.scrollView)
		{
			this.mScroll = this.scrollView;
			this.mAutoFind = false;
		}
		if (this.scrollView && base.enabled && NGUITools.GetActive(base.gameObject))
		{
			this.scrollView.Press(pressed);
			if (!pressed && this.mAutoFind)
			{
				this.scrollView = NGUITools.FindInParents<UIScrollView>(this.mTrans);
				this.mScroll = this.scrollView;
			}
		}
	}

	// Token: 0x06000403 RID: 1027 RVA: 0x0001AA94 File Offset: 0x00018C94
	private void OnDrag(Vector2 delta)
	{
		if (this.scrollView && NGUITools.GetActive(this))
		{
			this.scrollView.Drag();
		}
	}

	// Token: 0x06000404 RID: 1028 RVA: 0x0001AAC8 File Offset: 0x00018CC8
	private void OnScroll(float delta)
	{
		if (this.scrollView && NGUITools.GetActive(this))
		{
			this.scrollView.Scroll(delta);
		}
	}

	// Token: 0x06000405 RID: 1029 RVA: 0x0001AAF4 File Offset: 0x00018CF4
	public void OnPan(Vector2 delta)
	{
		if (this.scrollView && NGUITools.GetActive(this))
		{
			this.scrollView.OnPan(delta);
		}
	}

	// Token: 0x04000443 RID: 1091
	public UIScrollView scrollView;

	// Token: 0x04000444 RID: 1092
	[SerializeField]
	[HideInInspector]
	private UIScrollView draggablePanel;

	// Token: 0x04000445 RID: 1093
	private Transform mTrans;

	// Token: 0x04000446 RID: 1094
	private UIScrollView mScroll;

	// Token: 0x04000447 RID: 1095
	private bool mAutoFind;

	// Token: 0x04000448 RID: 1096
	private bool mStarted;
}
