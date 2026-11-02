using System;
using UnityEngine;

// Token: 0x020001F7 RID: 503
public class PalmCannonShot : MonoBehaviour
{
	// Token: 0x06000E73 RID: 3699 RVA: 0x00065B78 File Offset: 0x00063D78
	private void Start()
	{
		if (!this.AnimateUV && this.BeamFrames.Length > 0)
		{
			this.MyLineRenderer.material.mainTexture = this.BeamFrames[0];
		}
		this.initialBeamOffset = Random.Range(0f, 5f);
		this.MyShotBehavior = base.transform.GetComponent<ShotBehavior>();
		this.BeamDistanceCheckIncrement = this.MyShotBehavior.MyWeaponInfo.Velocity;
	}

	// Token: 0x06000E74 RID: 3700 RVA: 0x00065BF4 File Offset: 0x00063DF4
	private void MoveBeam()
	{
		this.hitPoint = default(RaycastHit);
		Ray ray;
		ray..ctor(base.transform.position, base.transform.forward);
		float num = this.MaxBeamLength * (this.beamScale / 10f);
		if (Physics.Raycast(ray, ref this.hitPoint, this.BeamLengthCheck, this.layerMask))
		{
			this.BeamLength = Vector3.Distance(base.transform.position, this.hitPoint.point);
			num = this.BeamLength * (this.beamScale / 10f);
			this.MyShotBehavior.HitSomething(this.hitPoint.collider, false);
			if (!this.HitSomething)
			{
				this.HitSomething = true;
				this.FirstHitTime = Time.time;
			}
		}
		else if (this.BeamLengthCheck < this.MaxBeamLength)
		{
			this.BeamLengthCheck += Time.deltaTime * this.BeamDistanceCheckIncrement;
			this.BeamLength = this.BeamLengthCheck;
		}
		this.MyLineRenderer.SetPosition(1, new Vector3(0f, 0f, this.BeamLength));
		this.MyLineRenderer.material.SetTextureScale("_MainTex", new Vector2(num, 1f));
	}

	// Token: 0x06000E75 RID: 3701 RVA: 0x00065D48 File Offset: 0x00063F48
	private void OnFrameStep()
	{
		this.MyLineRenderer.material.mainTexture = this.BeamFrames[this.frameNo];
		this.frameNo++;
		if (this.frameNo == this.BeamFrames.Length)
		{
			this.frameNo = 0;
		}
	}

	// Token: 0x06000E76 RID: 3702 RVA: 0x00065D9C File Offset: 0x00063F9C
	private void Animate()
	{
		if (this.BeamFrames.Length > 1)
		{
			this.frameNo = 0;
			this.MyLineRenderer.material.mainTexture = this.BeamFrames[this.frameNo];
			this.FrameTimerID = F3DTime.time.AddTimer(this.FrameStep, this.BeamFrames.Length - 1, new Action(this.OnFrameStep));
			this.frameNo = 1;
		}
	}

	// Token: 0x06000E77 RID: 3703 RVA: 0x00065E10 File Offset: 0x00064010
	private void ApplyForce(float force)
	{
		if (this.hitPoint.rigidbody != null)
		{
			this.hitPoint.rigidbody.AddForceAtPosition(base.transform.forward * force, this.hitPoint.point, 2);
		}
	}

	// Token: 0x06000E78 RID: 3704 RVA: 0x00065E60 File Offset: 0x00064060
	private void Update()
	{
		if (this.AnimateUV)
		{
			this.MyLineRenderer.material.SetTextureOffset("_MainTex", new Vector2(Time.time * this.UVTime + this.initialBeamOffset, 0f));
		}
		this.MoveBeam();
		if (this.HitSomething && Time.time > this.FirstHitTime + this.ShrinkBeamDelay)
		{
			base.transform.Translate(Vector3.forward * Time.deltaTime * this.MyShotBehavior.MyWeaponInfo.Velocity);
			Color color = Color.Lerp(this.EndStartColor, new Color(1f, 1f, 1f, 0f), Time.deltaTime * this.MyShotBehavior.MyWeaponInfo.Velocity);
			this.MyLineRenderer.SetColors(color, Color.white);
		}
	}

	// Token: 0x04000E49 RID: 3657
	public LayerMask layerMask;

	// Token: 0x04000E4A RID: 3658
	public bool OneShot;

	// Token: 0x04000E4B RID: 3659
	public Texture[] BeamFrames;

	// Token: 0x04000E4C RID: 3660
	public float FrameStep;

	// Token: 0x04000E4D RID: 3661
	public float beamScale;

	// Token: 0x04000E4E RID: 3662
	public float MaxBeamLength;

	// Token: 0x04000E4F RID: 3663
	public bool AnimateUV;

	// Token: 0x04000E50 RID: 3664
	public float UVTime;

	// Token: 0x04000E51 RID: 3665
	public LineRenderer MyLineRenderer;

	// Token: 0x04000E52 RID: 3666
	private RaycastHit hitPoint;

	// Token: 0x04000E53 RID: 3667
	private int frameNo;

	// Token: 0x04000E54 RID: 3668
	private int FrameTimerID;

	// Token: 0x04000E55 RID: 3669
	private float BeamLength;

	// Token: 0x04000E56 RID: 3670
	private float initialBeamOffset;

	// Token: 0x04000E57 RID: 3671
	private float PreviousBeamLength;

	// Token: 0x04000E58 RID: 3672
	private float BeamLengthCheck;

	// Token: 0x04000E59 RID: 3673
	private float BeamDistanceCheckIncrement = 25f;

	// Token: 0x04000E5A RID: 3674
	private ShotBehavior MyShotBehavior;

	// Token: 0x04000E5B RID: 3675
	public float ShrinkBeamDelay = 0.5f;

	// Token: 0x04000E5C RID: 3676
	private float FirstHitTime;

	// Token: 0x04000E5D RID: 3677
	private bool HitSomething;

	// Token: 0x04000E5E RID: 3678
	private Color EndStartColor = Color.white;
}
