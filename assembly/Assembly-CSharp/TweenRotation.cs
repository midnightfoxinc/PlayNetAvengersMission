using System;
using UnityEngine;

// Token: 0x02000105 RID: 261
[AddComponentMenu("NGUI/Tween/Tween Rotation")]
public class TweenRotation : UITweener
{
	// Token: 0x170000DE RID: 222
	// (get) Token: 0x060007F7 RID: 2039 RVA: 0x0003A01C File Offset: 0x0003821C
	public Transform cachedTransform
	{
		get
		{
			if (this.mTrans == null)
			{
				this.mTrans = base.transform;
			}
			return this.mTrans;
		}
	}

	// Token: 0x170000DF RID: 223
	// (get) Token: 0x060007F8 RID: 2040 RVA: 0x0003A044 File Offset: 0x00038244
	// (set) Token: 0x060007F9 RID: 2041 RVA: 0x0003A04C File Offset: 0x0003824C
	[Obsolete("Use 'value' instead")]
	public Quaternion rotation
	{
		get
		{
			return this.value;
		}
		set
		{
			this.value = value;
		}
	}

	// Token: 0x170000E0 RID: 224
	// (get) Token: 0x060007FA RID: 2042 RVA: 0x0003A058 File Offset: 0x00038258
	// (set) Token: 0x060007FB RID: 2043 RVA: 0x0003A068 File Offset: 0x00038268
	public Quaternion value
	{
		get
		{
			return this.cachedTransform.localRotation;
		}
		set
		{
			this.cachedTransform.localRotation = value;
		}
	}

	// Token: 0x060007FC RID: 2044 RVA: 0x0003A078 File Offset: 0x00038278
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = ((!this.quaternionLerp) ? Quaternion.Euler(new Vector3(Mathf.Lerp(this.from.x, this.to.x, factor), Mathf.Lerp(this.from.y, this.to.y, factor), Mathf.Lerp(this.from.z, this.to.z, factor))) : Quaternion.Slerp(Quaternion.Euler(this.from), Quaternion.Euler(this.to), factor));
	}

	// Token: 0x060007FD RID: 2045 RVA: 0x0003A118 File Offset: 0x00038318
	public static TweenRotation Begin(GameObject go, float duration, Quaternion rot)
	{
		TweenRotation tweenRotation = UITweener.Begin<TweenRotation>(go, duration);
		tweenRotation.from = tweenRotation.value.eulerAngles;
		tweenRotation.to = rot.eulerAngles;
		if (duration <= 0f)
		{
			tweenRotation.Sample(1f, true);
			tweenRotation.enabled = false;
		}
		return tweenRotation;
	}

	// Token: 0x060007FE RID: 2046 RVA: 0x0003A170 File Offset: 0x00038370
	[ContextMenu("Set 'From' to current value")]
	public override void SetStartToCurrentValue()
	{
		this.from = this.value.eulerAngles;
	}

	// Token: 0x060007FF RID: 2047 RVA: 0x0003A194 File Offset: 0x00038394
	[ContextMenu("Set 'To' to current value")]
	public override void SetEndToCurrentValue()
	{
		this.to = this.value.eulerAngles;
	}

	// Token: 0x06000800 RID: 2048 RVA: 0x0003A1B8 File Offset: 0x000383B8
	[ContextMenu("Assume value of 'From'")]
	private void SetCurrentValueToStart()
	{
		this.value = Quaternion.Euler(this.from);
	}

	// Token: 0x06000801 RID: 2049 RVA: 0x0003A1CC File Offset: 0x000383CC
	[ContextMenu("Assume value of 'To'")]
	private void SetCurrentValueToEnd()
	{
		this.value = Quaternion.Euler(this.to);
	}

	// Token: 0x0400075C RID: 1884
	public Vector3 from;

	// Token: 0x0400075D RID: 1885
	public Vector3 to;

	// Token: 0x0400075E RID: 1886
	public bool quaternionLerp;

	// Token: 0x0400075F RID: 1887
	private Transform mTrans;
}
