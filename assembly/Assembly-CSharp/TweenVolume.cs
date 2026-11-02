using System;
using UnityEngine;

// Token: 0x02000108 RID: 264
[RequireComponent(typeof(AudioSource))]
[AddComponentMenu("NGUI/Tween/Tween Volume")]
public class TweenVolume : UITweener
{
	// Token: 0x170000E4 RID: 228
	// (get) Token: 0x06000813 RID: 2067 RVA: 0x0003A5AC File Offset: 0x000387AC
	public AudioSource audioSource
	{
		get
		{
			if (this.mSource == null)
			{
				this.mSource = base.GetComponent<AudioSource>();
				if (this.mSource == null)
				{
					this.mSource = base.GetComponent<AudioSource>();
					if (this.mSource == null)
					{
						Debug.LogError("TweenVolume needs an AudioSource to work with", this);
						base.enabled = false;
					}
				}
			}
			return this.mSource;
		}
	}

	// Token: 0x170000E5 RID: 229
	// (get) Token: 0x06000814 RID: 2068 RVA: 0x0003A61C File Offset: 0x0003881C
	// (set) Token: 0x06000815 RID: 2069 RVA: 0x0003A624 File Offset: 0x00038824
	[Obsolete("Use 'value' instead")]
	public float volume
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

	// Token: 0x170000E6 RID: 230
	// (get) Token: 0x06000816 RID: 2070 RVA: 0x0003A630 File Offset: 0x00038830
	// (set) Token: 0x06000817 RID: 2071 RVA: 0x0003A664 File Offset: 0x00038864
	public float value
	{
		get
		{
			return (!(this.audioSource != null)) ? 0f : this.mSource.volume;
		}
		set
		{
			if (this.audioSource != null)
			{
				this.mSource.volume = value;
			}
		}
	}

	// Token: 0x06000818 RID: 2072 RVA: 0x0003A684 File Offset: 0x00038884
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = this.from * (1f - factor) + this.to * factor;
		this.mSource.enabled = (this.mSource.volume > 0.01f);
	}

	// Token: 0x06000819 RID: 2073 RVA: 0x0003A6CC File Offset: 0x000388CC
	public static TweenVolume Begin(GameObject go, float duration, float targetVolume)
	{
		TweenVolume tweenVolume = UITweener.Begin<TweenVolume>(go, duration);
		tweenVolume.from = tweenVolume.value;
		tweenVolume.to = targetVolume;
		if (targetVolume > 0f)
		{
			AudioSource audioSource = tweenVolume.audioSource;
			audioSource.enabled = true;
			audioSource.Play();
		}
		return tweenVolume;
	}

	// Token: 0x0600081A RID: 2074 RVA: 0x0003A714 File Offset: 0x00038914
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x0600081B RID: 2075 RVA: 0x0003A724 File Offset: 0x00038924
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x0400076C RID: 1900
	[Range(0f, 1f)]
	public float from = 1f;

	// Token: 0x0400076D RID: 1901
	[Range(0f, 1f)]
	public float to = 1f;

	// Token: 0x0400076E RID: 1902
	private AudioSource mSource;
}
