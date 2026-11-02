using System;
using UnityEngine;

// Token: 0x02000003 RID: 3
[RequireComponent(typeof(LineRenderer))]
public class F3DBeam : MonoBehaviour
{
	// Token: 0x0600001D RID: 29 RVA: 0x00002F80 File Offset: 0x00001180
	private void Awake()
	{
		this.lineRenderer = base.GetComponent<LineRenderer>();
		if (!this.AnimateUV && this.BeamFrames.Length > 0)
		{
			this.lineRenderer.material.mainTexture = this.BeamFrames[0];
		}
		this.initialBeamOffset = Random.Range(0f, 5f);
	}

	// Token: 0x0600001E RID: 30 RVA: 0x00002FE0 File Offset: 0x000011E0
	private void OnSpawned()
	{
		if (this.OneShot)
		{
			this.Raycast();
		}
		if (this.BeamFrames.Length > 1)
		{
			this.Animate();
		}
		F3DFXType f3DFXType = this.fxType;
		if (f3DFXType != F3DFXType.PlasmaBeam)
		{
			if (f3DFXType == F3DFXType.PlasmaBeamHeavy)
			{
				F3DAudioController.instance.PlasmaBeamHeavyLoop(base.transform.position, base.transform.parent);
			}
		}
		else
		{
			F3DAudioController.instance.PlasmaBeamLoop(base.transform.position, base.transform.parent);
		}
	}

	// Token: 0x0600001F RID: 31 RVA: 0x0000307C File Offset: 0x0000127C
	private void OnDespawned()
	{
		this.frameNo = 0;
		if (this.FrameTimerID != -1)
		{
			F3DTime.time.RemoveTimer(this.FrameTimerID);
			this.FrameTimerID = -1;
		}
		F3DFXType f3DFXType = this.fxType;
		if (f3DFXType != F3DFXType.PlasmaBeam)
		{
			if (f3DFXType == F3DFXType.PlasmaBeamHeavy)
			{
				F3DAudioController.instance.PlasmaBeamHeavyClose(base.transform.position);
			}
		}
		else
		{
			F3DAudioController.instance.PlasmaBeamClose(base.transform.position);
		}
	}

	// Token: 0x06000020 RID: 32 RVA: 0x00003108 File Offset: 0x00001308
	private void Raycast()
	{
		this.hitPoint = default(RaycastHit);
		Ray ray;
		ray..ctor(base.transform.position, base.transform.forward);
		float num = this.MaxBeamLength * (this.beamScale / 10f);
		if (Physics.Raycast(ray, ref this.hitPoint, this.MaxBeamLength, this.layerMask))
		{
			this.beamLength = Vector3.Distance(base.transform.position, this.hitPoint.point);
			this.lineRenderer.SetPosition(1, new Vector3(0f, 0f, this.beamLength));
			num = this.beamLength * (this.beamScale / 10f);
			switch (this.fxType)
			{
			case F3DFXType.Sniper:
				F3DFXController.instance.SniperImpact(this.hitPoint.point + this.hitPoint.normal * 0.2f);
				this.ApplyForce(4f);
				break;
			case F3DFXType.RailGun:
				F3DFXController.instance.RailgunImpact(this.hitPoint.point + this.hitPoint.normal * 0.2f);
				this.ApplyForce(7f);
				break;
			case F3DFXType.PlasmaBeam:
				this.ApplyForce(0.5f);
				break;
			case F3DFXType.PlasmaBeamHeavy:
				this.ApplyForce(2f);
				break;
			}
			if (this.rayImpact)
			{
				this.rayImpact.position = this.hitPoint.point - base.transform.forward * 0.5f;
			}
		}
		else
		{
			this.beamLength = this.MaxBeamLength;
			this.lineRenderer.SetPosition(1, new Vector3(0f, 0f, this.beamLength));
			if (this.rayImpact)
			{
				this.rayImpact.position = base.transform.position + base.transform.forward * this.beamLength;
			}
		}
		if (this.rayMuzzle)
		{
			this.rayMuzzle.position = base.transform.position + base.transform.forward * 0.1f;
		}
		this.lineRenderer.material.SetTextureScale("_MainTex", new Vector2(num, 1f));
	}

	// Token: 0x06000021 RID: 33 RVA: 0x000033B4 File Offset: 0x000015B4
	private void OnFrameStep()
	{
		this.lineRenderer.material.mainTexture = this.BeamFrames[this.frameNo];
		this.frameNo++;
		if (this.frameNo == this.BeamFrames.Length)
		{
			this.frameNo = 0;
		}
	}

	// Token: 0x06000022 RID: 34 RVA: 0x00003408 File Offset: 0x00001608
	private void Animate()
	{
		if (this.BeamFrames.Length > 1)
		{
			this.frameNo = 0;
			this.lineRenderer.material.mainTexture = this.BeamFrames[this.frameNo];
			this.FrameTimerID = F3DTime.time.AddTimer(this.FrameStep, this.BeamFrames.Length - 1, new Action(this.OnFrameStep));
			this.frameNo = 1;
		}
	}

	// Token: 0x06000023 RID: 35 RVA: 0x0000347C File Offset: 0x0000167C
	private void ApplyForce(float force)
	{
		if (this.hitPoint.rigidbody != null)
		{
			this.hitPoint.rigidbody.AddForceAtPosition(base.transform.forward * force, this.hitPoint.point, 2);
		}
	}

	// Token: 0x06000024 RID: 36 RVA: 0x000034CC File Offset: 0x000016CC
	private void Update()
	{
		if (this.AnimateUV)
		{
			this.lineRenderer.material.SetTextureOffset("_MainTex", new Vector2(Time.time * this.UVTime + this.initialBeamOffset, 0f));
		}
		if (!this.OneShot)
		{
			this.Raycast();
		}
	}

	// Token: 0x04000030 RID: 48
	public LayerMask layerMask;

	// Token: 0x04000031 RID: 49
	public F3DFXType fxType;

	// Token: 0x04000032 RID: 50
	public bool OneShot;

	// Token: 0x04000033 RID: 51
	public Texture[] BeamFrames;

	// Token: 0x04000034 RID: 52
	public float FrameStep;

	// Token: 0x04000035 RID: 53
	public float beamScale;

	// Token: 0x04000036 RID: 54
	public float MaxBeamLength;

	// Token: 0x04000037 RID: 55
	public bool AnimateUV;

	// Token: 0x04000038 RID: 56
	public float UVTime;

	// Token: 0x04000039 RID: 57
	public Transform rayImpact;

	// Token: 0x0400003A RID: 58
	public Transform rayMuzzle;

	// Token: 0x0400003B RID: 59
	private LineRenderer lineRenderer;

	// Token: 0x0400003C RID: 60
	private RaycastHit hitPoint;

	// Token: 0x0400003D RID: 61
	private int frameNo;

	// Token: 0x0400003E RID: 62
	private int FrameTimerID;

	// Token: 0x0400003F RID: 63
	private float beamLength;

	// Token: 0x04000040 RID: 64
	private float initialBeamOffset;
}
