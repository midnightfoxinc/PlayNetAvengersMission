using System;
using UnityEngine;

// Token: 0x020000FD RID: 253
[AddComponentMenu("NGUI/Tween/Spring Position")]
public class SpringPosition : MonoBehaviour
{
	// Token: 0x060007A4 RID: 1956 RVA: 0x00039124 File Offset: 0x00037324
	private void Start()
	{
		this.mTrans = base.transform;
		if (this.updateScrollView)
		{
			this.mSv = NGUITools.FindInParents<UIScrollView>(base.gameObject);
		}
	}

	// Token: 0x060007A5 RID: 1957 RVA: 0x0003915C File Offset: 0x0003735C
	private void Update()
	{
		float deltaTime = (!this.ignoreTimeScale) ? Time.deltaTime : RealTime.deltaTime;
		if (this.worldSpace)
		{
			if (this.mThreshold == 0f)
			{
				this.mThreshold = (this.target - this.mTrans.position).sqrMagnitude * 0.001f;
			}
			this.mTrans.position = NGUIMath.SpringLerp(this.mTrans.position, this.target, this.strength, deltaTime);
			if (this.mThreshold >= (this.target - this.mTrans.position).sqrMagnitude)
			{
				this.mTrans.position = this.target;
				this.NotifyListeners();
				base.enabled = false;
			}
		}
		else
		{
			if (this.mThreshold == 0f)
			{
				this.mThreshold = (this.target - this.mTrans.localPosition).sqrMagnitude * 1E-05f;
			}
			this.mTrans.localPosition = NGUIMath.SpringLerp(this.mTrans.localPosition, this.target, this.strength, deltaTime);
			if (this.mThreshold >= (this.target - this.mTrans.localPosition).sqrMagnitude)
			{
				this.mTrans.localPosition = this.target;
				this.NotifyListeners();
				base.enabled = false;
			}
		}
		if (this.mSv != null)
		{
			this.mSv.UpdateScrollbars(true);
		}
	}

	// Token: 0x060007A6 RID: 1958 RVA: 0x00039304 File Offset: 0x00037504
	private void NotifyListeners()
	{
		SpringPosition.current = this;
		if (this.onFinished != null)
		{
			this.onFinished();
		}
		if (this.eventReceiver != null && !string.IsNullOrEmpty(this.callWhenFinished))
		{
			this.eventReceiver.SendMessage(this.callWhenFinished, this, 1);
		}
		SpringPosition.current = null;
	}

	// Token: 0x060007A7 RID: 1959 RVA: 0x00039368 File Offset: 0x00037568
	public static SpringPosition Begin(GameObject go, Vector3 pos, float strength)
	{
		SpringPosition springPosition = go.GetComponent<SpringPosition>();
		if (springPosition == null)
		{
			springPosition = go.AddComponent<SpringPosition>();
		}
		springPosition.target = pos;
		springPosition.strength = strength;
		springPosition.onFinished = null;
		if (!springPosition.enabled)
		{
			springPosition.mThreshold = 0f;
			springPosition.enabled = true;
		}
		return springPosition;
	}

	// Token: 0x0400072F RID: 1839
	public static SpringPosition current;

	// Token: 0x04000730 RID: 1840
	public Vector3 target = Vector3.zero;

	// Token: 0x04000731 RID: 1841
	public float strength = 10f;

	// Token: 0x04000732 RID: 1842
	public bool worldSpace;

	// Token: 0x04000733 RID: 1843
	public bool ignoreTimeScale;

	// Token: 0x04000734 RID: 1844
	public bool updateScrollView;

	// Token: 0x04000735 RID: 1845
	public SpringPosition.OnFinished onFinished;

	// Token: 0x04000736 RID: 1846
	[HideInInspector]
	[SerializeField]
	private GameObject eventReceiver;

	// Token: 0x04000737 RID: 1847
	[HideInInspector]
	[SerializeField]
	public string callWhenFinished;

	// Token: 0x04000738 RID: 1848
	private Transform mTrans;

	// Token: 0x04000739 RID: 1849
	private float mThreshold;

	// Token: 0x0400073A RID: 1850
	private UIScrollView mSv;

	// Token: 0x0200034D RID: 845
	// (Invoke) Token: 0x06001556 RID: 5462
	public delegate void OnFinished();
}
