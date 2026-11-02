using System;
using UnityEngine;

// Token: 0x020000FE RID: 254
[AddComponentMenu("NGUI/Tween/Tween Alpha")]
public class TweenAlpha : UITweener
{
	// Token: 0x170000CD RID: 205
	// (get) Token: 0x060007A9 RID: 1961 RVA: 0x000393E4 File Offset: 0x000375E4
	// (set) Token: 0x060007AA RID: 1962 RVA: 0x000393EC File Offset: 0x000375EC
	[Obsolete("Use 'value' instead")]
	public float alpha
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

	// Token: 0x060007AB RID: 1963 RVA: 0x000393F8 File Offset: 0x000375F8
	private void Cache()
	{
		this.mCached = true;
		this.mRect = base.GetComponent<UIRect>();
		this.mSr = base.GetComponent<SpriteRenderer>();
		if (this.mRect == null && this.mSr == null)
		{
			Renderer component = base.GetComponent<Renderer>();
			if (component != null)
			{
				this.mMat = component.material;
			}
			if (this.mMat == null)
			{
				this.mRect = base.GetComponentInChildren<UIRect>();
			}
		}
	}

	// Token: 0x170000CE RID: 206
	// (get) Token: 0x060007AC RID: 1964 RVA: 0x00039484 File Offset: 0x00037684
	// (set) Token: 0x060007AD RID: 1965 RVA: 0x00039514 File Offset: 0x00037714
	public float value
	{
		get
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			if (this.mRect != null)
			{
				return this.mRect.alpha;
			}
			if (this.mSr != null)
			{
				return this.mSr.color.a;
			}
			return (!(this.mMat != null)) ? 1f : this.mMat.color.a;
		}
		set
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			if (this.mRect != null)
			{
				this.mRect.alpha = value;
			}
			else if (this.mSr != null)
			{
				Color color = this.mSr.color;
				color.a = value;
				this.mSr.color = color;
			}
			else if (this.mMat != null)
			{
				Color color2 = this.mMat.color;
				color2.a = value;
				this.mMat.color = color2;
			}
		}
	}

	// Token: 0x060007AE RID: 1966 RVA: 0x000395BC File Offset: 0x000377BC
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = Mathf.Lerp(this.from, this.to, factor);
	}

	// Token: 0x060007AF RID: 1967 RVA: 0x000395D8 File Offset: 0x000377D8
	public static TweenAlpha Begin(GameObject go, float duration, float alpha)
	{
		TweenAlpha tweenAlpha = UITweener.Begin<TweenAlpha>(go, duration);
		tweenAlpha.from = tweenAlpha.value;
		tweenAlpha.to = alpha;
		if (duration <= 0f)
		{
			tweenAlpha.Sample(1f, true);
			tweenAlpha.enabled = false;
		}
		return tweenAlpha;
	}

	// Token: 0x060007B0 RID: 1968 RVA: 0x00039620 File Offset: 0x00037820
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x060007B1 RID: 1969 RVA: 0x00039630 File Offset: 0x00037830
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x0400073B RID: 1851
	[Range(0f, 1f)]
	public float from = 1f;

	// Token: 0x0400073C RID: 1852
	[Range(0f, 1f)]
	public float to = 1f;

	// Token: 0x0400073D RID: 1853
	private bool mCached;

	// Token: 0x0400073E RID: 1854
	private UIRect mRect;

	// Token: 0x0400073F RID: 1855
	private Material mMat;

	// Token: 0x04000740 RID: 1856
	private SpriteRenderer mSr;
}
