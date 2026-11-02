using System;
using UnityEngine;

// Token: 0x02000100 RID: 256
[RequireComponent(typeof(Camera))]
[AddComponentMenu("NGUI/Tween/Tween Field of View")]
public class TweenFOV : UITweener
{
	// Token: 0x170000D1 RID: 209
	// (get) Token: 0x060007BF RID: 1983 RVA: 0x00039938 File Offset: 0x00037B38
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

	// Token: 0x170000D2 RID: 210
	// (get) Token: 0x060007C0 RID: 1984 RVA: 0x00039960 File Offset: 0x00037B60
	// (set) Token: 0x060007C1 RID: 1985 RVA: 0x00039968 File Offset: 0x00037B68
	[Obsolete("Use 'value' instead")]
	public float fov
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

	// Token: 0x170000D3 RID: 211
	// (get) Token: 0x060007C2 RID: 1986 RVA: 0x00039974 File Offset: 0x00037B74
	// (set) Token: 0x060007C3 RID: 1987 RVA: 0x00039984 File Offset: 0x00037B84
	public float value
	{
		get
		{
			return this.cachedCamera.fieldOfView;
		}
		set
		{
			this.cachedCamera.fieldOfView = value;
		}
	}

	// Token: 0x060007C4 RID: 1988 RVA: 0x00039994 File Offset: 0x00037B94
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = this.from * (1f - factor) + this.to * factor;
	}

	// Token: 0x060007C5 RID: 1989 RVA: 0x000399B4 File Offset: 0x00037BB4
	public static TweenFOV Begin(GameObject go, float duration, float to)
	{
		TweenFOV tweenFOV = UITweener.Begin<TweenFOV>(go, duration);
		tweenFOV.from = tweenFOV.value;
		tweenFOV.to = to;
		if (duration <= 0f)
		{
			tweenFOV.Sample(1f, true);
			tweenFOV.enabled = false;
		}
		return tweenFOV;
	}

	// Token: 0x060007C6 RID: 1990 RVA: 0x000399FC File Offset: 0x00037BFC
	[ContextMenu("Set 'From' to current value")]
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x060007C7 RID: 1991 RVA: 0x00039A0C File Offset: 0x00037C0C
	[ContextMenu("Set 'To' to current value")]
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x060007C8 RID: 1992 RVA: 0x00039A1C File Offset: 0x00037C1C
	[ContextMenu("Assume value of 'From'")]
	private void SetCurrentValueToStart()
	{
		this.value = this.from;
	}

	// Token: 0x060007C9 RID: 1993 RVA: 0x00039A2C File Offset: 0x00037C2C
	[ContextMenu("Assume value of 'To'")]
	private void SetCurrentValueToEnd()
	{
		this.value = this.to;
	}

	// Token: 0x04000748 RID: 1864
	public float from = 45f;

	// Token: 0x04000749 RID: 1865
	public float to = 45f;

	// Token: 0x0400074A RID: 1866
	private Camera mCam;
}
