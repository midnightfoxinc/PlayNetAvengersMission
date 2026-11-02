using System;
using UnityEngine;

// Token: 0x02000101 RID: 257
[RequireComponent(typeof(UIBasicSprite))]
[AddComponentMenu("NGUI/Tween/Tween Fill")]
public class TweenFill : UITweener
{
	// Token: 0x060007CB RID: 1995 RVA: 0x00039A5C File Offset: 0x00037C5C
	private void Cache()
	{
		this.mCached = true;
		this.mSprite = base.GetComponent<UISprite>();
	}

	// Token: 0x170000D4 RID: 212
	// (get) Token: 0x060007CC RID: 1996 RVA: 0x00039A74 File Offset: 0x00037C74
	// (set) Token: 0x060007CD RID: 1997 RVA: 0x00039AAC File Offset: 0x00037CAC
	public float value
	{
		get
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			if (this.mSprite != null)
			{
				return this.mSprite.fillAmount;
			}
			return 0f;
		}
		set
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			if (this.mSprite != null)
			{
				this.mSprite.fillAmount = value;
			}
		}
	}

	// Token: 0x060007CE RID: 1998 RVA: 0x00039AE8 File Offset: 0x00037CE8
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = Mathf.Lerp(this.from, this.to, factor);
	}

	// Token: 0x060007CF RID: 1999 RVA: 0x00039B04 File Offset: 0x00037D04
	public static TweenFill Begin(GameObject go, float duration, float fill)
	{
		TweenFill tweenFill = UITweener.Begin<TweenFill>(go, duration);
		tweenFill.from = tweenFill.value;
		tweenFill.to = fill;
		if (duration <= 0f)
		{
			tweenFill.Sample(1f, true);
			tweenFill.enabled = false;
		}
		return tweenFill;
	}

	// Token: 0x060007D0 RID: 2000 RVA: 0x00039B4C File Offset: 0x00037D4C
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x060007D1 RID: 2001 RVA: 0x00039B5C File Offset: 0x00037D5C
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x0400074B RID: 1867
	[Range(0f, 1f)]
	public float from = 1f;

	// Token: 0x0400074C RID: 1868
	[Range(0f, 1f)]
	public float to = 1f;

	// Token: 0x0400074D RID: 1869
	private bool mCached;

	// Token: 0x0400074E RID: 1870
	private UIBasicSprite mSprite;
}
