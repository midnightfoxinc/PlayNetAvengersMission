using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001EA RID: 490
public class BeamBehavior : MonoBehaviour
{
	// Token: 0x06000E47 RID: 3655 RVA: 0x0006436C File Offset: 0x0006256C
	private void Awake()
	{
		this.LineRenderer = base.GetComponent<LineRenderer>();
		this.MyShotBehavior = base.transform.GetComponent<ShotBehavior>();
		this.initialBeamOffset = Random.Range(0f, 5f);
		this.RandomStartTime = Random.Range(0f, 50f);
	}

	// Token: 0x06000E48 RID: 3656 RVA: 0x000643C0 File Offset: 0x000625C0
	private void OnSpawned()
	{
		if (this.OneShot)
		{
			this.Raycast();
		}
	}

	// Token: 0x06000E49 RID: 3657 RVA: 0x000643D4 File Offset: 0x000625D4
	private void Raycast()
	{
		this.hitPoint = default(RaycastHit);
		Ray ray;
		ray..ctor(base.transform.position, base.transform.forward);
		float num = this.MaxBeamLength * (this.beamScale / 10f);
		if (Physics.Raycast(ray, ref this.hitPoint, this.MaxBeamLength, this.layerMask))
		{
			this.beamLength = Vector3.Distance(base.transform.position, this.hitPoint.point);
			float num2 = this.beamLength / (float)this.PositionCount;
			for (int i = 0; i < this.PositionCount; i++)
			{
				this.LineRenderer.SetPosition(i, new Vector3(0f, 0f, (float)i * num2));
			}
			num = this.beamLength * (this.beamScale / 10f);
			if (!this.SupportBeam)
			{
				this.MyShotBehavior.HitSomethingBeam(this.hitPoint.collider, this.hitPoint.point);
			}
		}
		else
		{
			this.beamLength = this.MaxBeamLength;
			float num3 = this.beamLength / (float)this.PositionCount;
			for (int j = 0; j < this.PositionCount; j++)
			{
				this.LineRenderer.SetPosition(j, new Vector3(0f, 0f, (float)j * num3));
			}
			if (this.rayImpact)
			{
				this.rayImpact.position = base.transform.position + base.transform.forward * this.beamLength;
			}
		}
		if (this.UseCurves)
		{
			float num4 = this.beamLength / (float)this.PositionCount;
			this.XSpeedCount += Time.deltaTime * this.XSpeed;
			this.YSpeedCount += Time.deltaTime * this.YSpeed;
			for (int k = 1; k < this.PositionCount - 1; k++)
			{
				float num5 = (float)k * num4 / this.beamLength;
				num5 += this.RandomStartTime;
				float num6 = this.XCurve.Evaluate((num5 + this.XSpeedCount) * (float)this.CurveLoopThroughLength);
				num6 *= this.XScale;
				float num7 = this.YCurve.Evaluate((num5 + this.YSpeedCount) * (float)this.CurveLoopThroughLength);
				num7 *= this.YScale;
				this.LineRenderer.SetPosition(k, new Vector3(num6, num7, (float)k * num4));
			}
		}
		if (this.Oscillate)
		{
			float num8 = this.beamLength / (float)this.PositionCount;
			for (int l = 1; l < this.PositionCount - 1; l++)
			{
				this.LineRenderer.SetPosition(l, new Vector3(this.GetRandomNoise(), this.GetRandomNoise(), (float)l * num8));
			}
		}
		this.LineRenderer.material.SetTextureScale("_MainTex", new Vector2(num, 1f));
		if (this.UseRotation)
		{
			base.transform.Rotate(0f, 0f, this.RotationSpeed * Time.deltaTime);
		}
	}

	// Token: 0x06000E4A RID: 3658 RVA: 0x00064724 File Offset: 0x00062924
	private void Update()
	{
		if (this.AnimateUV)
		{
			this.LineRenderer.material.SetTextureOffset("_MainTex", new Vector2(Time.time * this.UVTime + this.initialBeamOffset, 0f));
		}
		if (this.AnimateThroughFrames && Time.time > this.LastTimeFrameChange + this.FrameChangeInterval)
		{
			this.LineRenderer.material.SetTexture("_MainTex", this.BeamFrames[Random.Range(0, this.BeamFrames.Count - 1)]);
			this.LastTimeFrameChange = Time.time;
		}
		if (!this.OneShot)
		{
			this.Raycast();
		}
	}

	// Token: 0x06000E4B RID: 3659 RVA: 0x000647E0 File Offset: 0x000629E0
	private float GetRandomNoise()
	{
		return Random.Range(-this.Amplitude, this.Amplitude);
	}

	// Token: 0x04000DDD RID: 3549
	public bool SupportBeam;

	// Token: 0x04000DDE RID: 3550
	public LayerMask layerMask;

	// Token: 0x04000DDF RID: 3551
	public int PositionCount;

	// Token: 0x04000DE0 RID: 3552
	public bool UseRotation;

	// Token: 0x04000DE1 RID: 3553
	public float RotationSpeed;

	// Token: 0x04000DE2 RID: 3554
	public bool UseCurves;

	// Token: 0x04000DE3 RID: 3555
	public AnimationCurve XCurve;

	// Token: 0x04000DE4 RID: 3556
	public AnimationCurve YCurve;

	// Token: 0x04000DE5 RID: 3557
	public float XScale;

	// Token: 0x04000DE6 RID: 3558
	public float YScale;

	// Token: 0x04000DE7 RID: 3559
	public float XSpeed = 1f;

	// Token: 0x04000DE8 RID: 3560
	public float YSpeed = 1f;

	// Token: 0x04000DE9 RID: 3561
	private float XSpeedCount;

	// Token: 0x04000DEA RID: 3562
	private float YSpeedCount;

	// Token: 0x04000DEB RID: 3563
	public int CurveLoopThroughLength;

	// Token: 0x04000DEC RID: 3564
	public bool Oscillate;

	// Token: 0x04000DED RID: 3565
	public float Amplitude;

	// Token: 0x04000DEE RID: 3566
	public float OscillateTime;

	// Token: 0x04000DEF RID: 3567
	public bool OneShot;

	// Token: 0x04000DF0 RID: 3568
	public bool AnimateThroughFrames;

	// Token: 0x04000DF1 RID: 3569
	public float FrameChangeInterval;

	// Token: 0x04000DF2 RID: 3570
	public List<Texture> BeamFrames;

	// Token: 0x04000DF3 RID: 3571
	private float LastTimeFrameChange;

	// Token: 0x04000DF4 RID: 3572
	private float RandomStartTime;

	// Token: 0x04000DF5 RID: 3573
	private float LastTimeOcillated;

	// Token: 0x04000DF6 RID: 3574
	public float beamScale;

	// Token: 0x04000DF7 RID: 3575
	public float MaxBeamLength;

	// Token: 0x04000DF8 RID: 3576
	public bool AnimateUV;

	// Token: 0x04000DF9 RID: 3577
	public float UVTime;

	// Token: 0x04000DFA RID: 3578
	public Transform rayImpact;

	// Token: 0x04000DFB RID: 3579
	public Transform rayMuzzle;

	// Token: 0x04000DFC RID: 3580
	private LineRenderer LineRenderer;

	// Token: 0x04000DFD RID: 3581
	private RaycastHit hitPoint;

	// Token: 0x04000DFE RID: 3582
	private ShotBehavior MyShotBehavior;

	// Token: 0x04000DFF RID: 3583
	private int frameNo;

	// Token: 0x04000E00 RID: 3584
	private int FrameTimerID;

	// Token: 0x04000E01 RID: 3585
	private float beamLength;

	// Token: 0x04000E02 RID: 3586
	private float initialBeamOffset;

	// Token: 0x04000E03 RID: 3587
	private int SegmentCounter;
}
