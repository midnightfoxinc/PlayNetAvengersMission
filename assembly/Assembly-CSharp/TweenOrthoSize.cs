using System;
using UnityEngine;

// Token: 0x02000103 RID: 259
[RequireComponent(typeof(Camera))]
[AddComponentMenu("NGUI/Tween/Tween Orthographic Size")]
public class TweenOrthoSize : UITweener
{
	// Token: 0x170000D8 RID: 216
	// (get) Token: 0x060007DF RID: 2015 RVA: 0x00039D10 File Offset: 0x00037F10
	public Camera cachedCamera
	{
		get
		{
			if (this.mCam == null)
			{
				this.mCam = base.GetComponent<Camera>();
			}
			return this.mCam;
		}
	}

	// Token: 0x170000D9 RID: 217
	// (get) Token: 0x060007E0 RID: 2016 RVA: 0x00039D38 File Offset: 0x00037F38
	// (set) Token: 0x060007E1 RID: 2017 RVA: 0x00039D40 File Offset: 0x00037F40
	[Obsolete("Use 'value' instead")]
	public float orthoSize
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

	// Token: 0x170000DA RID: 218
	// (get) Token: 0x060007E2 RID: 2018 RVA: 0x00039D4C File Offset: 0x00037F4C
	// (set) Token: 0x060007E3 RID: 2019 RVA: 0x00039D5C File Offset: 0x00037F5C
	public float value
	{
		get
		{
			return this.cachedCamera.orthographicSize;
		}
		set
		{
			this.cachedCamera.orthographicSize = value;
		}
	}

	// Token: 0x060007E4 RID: 2020 RVA: 0x00039D6C File Offset: 0x00037F6C
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = this.from * (1f - factor) + this.to * factor;
	}

	// Token: 0x060007E5 RID: 2021 RVA: 0x00039D8C File Offset: 0x00037F8C
	public static TweenOrthoSize Begin(GameObject go, float duration, float to)
	{
		TweenOrthoSize tweenOrthoSize = UITweener.Begin<TweenOrthoSize>(go, duration);
		tweenOrthoSize.from = tweenOrthoSize.value;
		tweenOrthoSize.to = to;
		if (duration <= 0f)
		{
			tweenOrthoSize.Sample(1f, true);
			tweenOrthoSize.enabled = false;
		}
		return tweenOrthoSize;
	}

	// Token: 0x060007E6 RID: 2022 RVA: 0x00039DD4 File Offset: 0x00037FD4
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x060007E7 RID: 2023 RVA: 0x00039DE4 File Offset: 0x00037FE4
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x04000754 RID: 1876
	public float from = 1f;

	// Token: 0x04000755 RID: 1877
	public float to = 1f;

	// Token: 0x04000756 RID: 1878
	private Camera mCam;
}
