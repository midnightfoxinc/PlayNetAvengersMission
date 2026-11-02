using System;
using UnityEngine;

// Token: 0x020000FF RID: 255
[AddComponentMenu("NGUI/Tween/Tween Color")]
public class TweenColor : UITweener
{
	// Token: 0x060007B3 RID: 1971 RVA: 0x00039660 File Offset: 0x00037860
	private void Cache()
	{
		this.mCached = true;
		this.mWidget = base.GetComponent<UIWidget>();
		if (this.mWidget != null)
		{
			return;
		}
		this.mSr = base.GetComponent<SpriteRenderer>();
		if (this.mSr != null)
		{
			return;
		}
		Renderer component = base.GetComponent<Renderer>();
		if (component != null)
		{
			this.mMat = component.material;
			return;
		}
		this.mLight = base.GetComponent<Light>();
		if (this.mLight == null)
		{
			this.mWidget = base.GetComponentInChildren<UIWidget>();
		}
	}

	// Token: 0x170000CF RID: 207
	// (get) Token: 0x060007B4 RID: 1972 RVA: 0x000396FC File Offset: 0x000378FC
	// (set) Token: 0x060007B5 RID: 1973 RVA: 0x00039704 File Offset: 0x00037904
	[Obsolete("Use 'value' instead")]
	public Color color
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

	// Token: 0x170000D0 RID: 208
	// (get) Token: 0x060007B6 RID: 1974 RVA: 0x00039710 File Offset: 0x00037910
	// (set) Token: 0x060007B7 RID: 1975 RVA: 0x000397A8 File Offset: 0x000379A8
	public Color value
	{
		get
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			if (this.mWidget != null)
			{
				return this.mWidget.color;
			}
			if (this.mMat != null)
			{
				return this.mMat.color;
			}
			if (this.mSr != null)
			{
				return this.mSr.color;
			}
			if (this.mLight != null)
			{
				return this.mLight.color;
			}
			return Color.black;
		}
		set
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			if (this.mWidget != null)
			{
				this.mWidget.color = value;
			}
			else if (this.mMat != null)
			{
				this.mMat.color = value;
			}
			else if (this.mSr != null)
			{
				this.mSr.color = value;
			}
			else if (this.mLight != null)
			{
				this.mLight.color = value;
				this.mLight.enabled = (value.r + value.g + value.b > 0.01f);
			}
		}
	}

	// Token: 0x060007B8 RID: 1976 RVA: 0x00039874 File Offset: 0x00037A74
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = Color.Lerp(this.from, this.to, factor);
	}

	// Token: 0x060007B9 RID: 1977 RVA: 0x00039890 File Offset: 0x00037A90
	public static TweenColor Begin(GameObject go, float duration, Color color)
	{
		TweenColor tweenColor = UITweener.Begin<TweenColor>(go, duration);
		tweenColor.from = tweenColor.value;
		tweenColor.to = color;
		if (duration <= 0f)
		{
			tweenColor.Sample(1f, true);
			tweenColor.enabled = false;
		}
		return tweenColor;
	}

	// Token: 0x060007BA RID: 1978 RVA: 0x000398D8 File Offset: 0x00037AD8
	[ContextMenu("Set 'From' to current value")]
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x060007BB RID: 1979 RVA: 0x000398E8 File Offset: 0x00037AE8
	[ContextMenu("Set 'To' to current value")]
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x060007BC RID: 1980 RVA: 0x000398F8 File Offset: 0x00037AF8
	[ContextMenu("Assume value of 'From'")]
	private void SetCurrentValueToStart()
	{
		this.value = this.from;
	}

	// Token: 0x060007BD RID: 1981 RVA: 0x00039908 File Offset: 0x00037B08
	[ContextMenu("Assume value of 'To'")]
	private void SetCurrentValueToEnd()
	{
		this.value = this.to;
	}

	// Token: 0x04000741 RID: 1857
	public Color from = Color.white;

	// Token: 0x04000742 RID: 1858
	public Color to = Color.white;

	// Token: 0x04000743 RID: 1859
	private bool mCached;

	// Token: 0x04000744 RID: 1860
	private UIWidget mWidget;

	// Token: 0x04000745 RID: 1861
	private Material mMat;

	// Token: 0x04000746 RID: 1862
	private Light mLight;

	// Token: 0x04000747 RID: 1863
	private SpriteRenderer mSr;
}
