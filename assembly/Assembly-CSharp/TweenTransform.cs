using System;
using UnityEngine;

// Token: 0x02000107 RID: 263
[AddComponentMenu("NGUI/Tween/Tween Transform")]
public class TweenTransform : UITweener
{
	// Token: 0x0600080F RID: 2063 RVA: 0x0003A374 File Offset: 0x00038574
	protected override void OnUpdate(float factor, bool isFinished)
	{
		if (this.to != null)
		{
			if (this.mTrans == null)
			{
				this.mTrans = base.transform;
				this.mPos = this.mTrans.position;
				this.mRot = this.mTrans.rotation;
				this.mScale = this.mTrans.localScale;
			}
			if (this.from != null)
			{
				this.mTrans.position = this.from.position * (1f - factor) + this.to.position * factor;
				this.mTrans.localScale = this.from.localScale * (1f - factor) + this.to.localScale * factor;
				this.mTrans.rotation = Quaternion.Slerp(this.from.rotation, this.to.rotation, factor);
			}
			else
			{
				this.mTrans.position = this.mPos * (1f - factor) + this.to.position * factor;
				this.mTrans.localScale = this.mScale * (1f - factor) + this.to.localScale * factor;
				this.mTrans.rotation = Quaternion.Slerp(this.mRot, this.to.rotation, factor);
			}
			if (this.parentWhenFinished && isFinished)
			{
				this.mTrans.parent = this.to;
			}
		}
	}

	// Token: 0x06000810 RID: 2064 RVA: 0x0003A53C File Offset: 0x0003873C
	public static TweenTransform Begin(GameObject go, float duration, Transform to)
	{
		return TweenTransform.Begin(go, duration, null, to);
	}

	// Token: 0x06000811 RID: 2065 RVA: 0x0003A548 File Offset: 0x00038748
	public static TweenTransform Begin(GameObject go, float duration, Transform from, Transform to)
	{
		TweenTransform tweenTransform = UITweener.Begin<TweenTransform>(go, duration);
		tweenTransform.from = from;
		tweenTransform.to = to;
		if (duration <= 0f)
		{
			tweenTransform.Sample(1f, true);
			tweenTransform.enabled = false;
		}
		return tweenTransform;
	}

	// Token: 0x04000765 RID: 1893
	public Transform from;

	// Token: 0x04000766 RID: 1894
	public Transform to;

	// Token: 0x04000767 RID: 1895
	public bool parentWhenFinished;

	// Token: 0x04000768 RID: 1896
	private Transform mTrans;

	// Token: 0x04000769 RID: 1897
	private Vector3 mPos;

	// Token: 0x0400076A RID: 1898
	private Quaternion mRot;

	// Token: 0x0400076B RID: 1899
	private Vector3 mScale;
}
