using System;
using UnityEngine;

// Token: 0x02000009 RID: 9
[RequireComponent(typeof(LineRenderer))]
public class F3DLightning : MonoBehaviour
{
	// Token: 0x06000052 RID: 82 RVA: 0x000047F4 File Offset: 0x000029F4
	private void Awake()
	{
		this.lineRenderer = base.GetComponent<LineRenderer>();
		if (!this.AnimateUV && this.BeamFrames.Length > 0)
		{
			this.lineRenderer.material.mainTexture = this.BeamFrames[0];
		}
		this.initialBeamOffset = Random.Range(0f, 5f);
	}

	// Token: 0x06000053 RID: 83 RVA: 0x00004854 File Offset: 0x00002A54
	private void OnSpawned()
	{
		if (this.BeamFrames.Length > 1)
		{
			this.Animate();
		}
		if (this.Oscillate && this.Points > 0)
		{
			this.OscillateTimerID = F3DTime.time.AddTimer(this.OscillateTime, new Action(this.OnOscillate));
		}
		if (F3DAudioController.instance)
		{
			F3DAudioController.instance.LightningGunLoop(base.transform.position, base.transform);
		}
	}

	// Token: 0x06000054 RID: 84 RVA: 0x000048D8 File Offset: 0x00002AD8
	private void OnDespawned()
	{
		this.frameNo = 0;
		if (this.FrameTimerID != -1)
		{
			F3DTime.time.RemoveTimer(this.FrameTimerID);
			this.FrameTimerID = -1;
		}
		if (this.OscillateTimerID != -1)
		{
			F3DTime.time.RemoveTimer(this.OscillateTimerID);
			this.OscillateTimerID = -1;
		}
		if (F3DAudioController.instance)
		{
			F3DAudioController.instance.LightningGunClose(base.transform.position);
		}
	}

	// Token: 0x06000055 RID: 85 RVA: 0x00004958 File Offset: 0x00002B58
	private void Raycast()
	{
		this.hitPoint = default(RaycastHit);
		Ray ray;
		ray..ctor(base.transform.position, base.transform.forward);
		float num = this.MaxBeamLength * (this.beamScale / 10f);
		if (Physics.Raycast(ray, ref this.hitPoint, this.MaxBeamLength, this.layerMask))
		{
			this.beamLength = Vector3.Distance(base.transform.position, this.hitPoint.point);
			if (!this.Oscillate)
			{
				this.lineRenderer.SetPosition(1, new Vector3(0f, 0f, this.beamLength));
			}
			num = this.beamLength * (this.beamScale / 10f);
			this.ApplyForce(0.1f);
			if (this.rayImpact)
			{
				this.rayImpact.position = this.hitPoint.point - base.transform.forward * 0.5f;
			}
		}
		else
		{
			this.beamLength = this.MaxBeamLength;
			if (!this.Oscillate)
			{
				this.lineRenderer.SetPosition(1, new Vector3(0f, 0f, this.beamLength));
			}
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

	// Token: 0x06000056 RID: 86 RVA: 0x00004B54 File Offset: 0x00002D54
	private float GetRandomNoise()
	{
		return Random.Range(-this.Amplitude, this.Amplitude);
	}

	// Token: 0x06000057 RID: 87 RVA: 0x00004B68 File Offset: 0x00002D68
	private void OnFrameStep()
	{
		if (this.RandomizeFrames)
		{
			this.frameNo = Random.Range(0, this.BeamFrames.Length);
		}
		this.lineRenderer.material.mainTexture = this.BeamFrames[this.frameNo];
		this.frameNo++;
		if (this.frameNo == this.BeamFrames.Length)
		{
			this.frameNo = 0;
		}
	}

	// Token: 0x06000058 RID: 88 RVA: 0x00004BDC File Offset: 0x00002DDC
	private void OnOscillate()
	{
		int num = (int)(this.beamLength / 10f * (float)this.Points);
		if (num < 2)
		{
			this.lineRenderer.SetVertexCount(2);
			this.lineRenderer.SetPosition(0, Vector3.zero);
			this.lineRenderer.SetPosition(1, new Vector3(0f, 0f, this.beamLength));
		}
		else
		{
			this.lineRenderer.SetVertexCount(num);
			this.lineRenderer.SetPosition(0, Vector3.zero);
			for (int i = 1; i < num - 1; i++)
			{
				this.lineRenderer.SetPosition(i, new Vector3(this.GetRandomNoise(), this.GetRandomNoise(), this.beamLength / (float)(num - 1) * (float)i));
			}
			this.lineRenderer.SetPosition(num - 1, new Vector3(0f, 0f, this.beamLength));
		}
	}

	// Token: 0x06000059 RID: 89 RVA: 0x00004CC8 File Offset: 0x00002EC8
	private void Animate()
	{
		this.frameNo = 0;
		this.lineRenderer.material.mainTexture = this.BeamFrames[this.frameNo];
		this.FrameTimerID = F3DTime.time.AddTimer(this.FrameStep, new Action(this.OnFrameStep));
		this.frameNo = 1;
	}

	// Token: 0x0600005A RID: 90 RVA: 0x00004D24 File Offset: 0x00002F24
	private void ApplyForce(float force)
	{
		if (this.hitPoint.rigidbody != null)
		{
			this.hitPoint.rigidbody.AddForceAtPosition(base.transform.forward * force, this.hitPoint.point, 2);
		}
	}

	// Token: 0x0600005B RID: 91 RVA: 0x00004D74 File Offset: 0x00002F74
	private void Update()
	{
		if (this.AnimateUV)
		{
			this.lineRenderer.material.SetTextureOffset("_MainTex", new Vector2(Time.time * this.UVTime + this.initialBeamOffset, 0f));
		}
		this.Raycast();
	}

	// Token: 0x04000080 RID: 128
	public LayerMask layerMask;

	// Token: 0x04000081 RID: 129
	public Texture[] BeamFrames;

	// Token: 0x04000082 RID: 130
	public float FrameStep;

	// Token: 0x04000083 RID: 131
	public bool RandomizeFrames;

	// Token: 0x04000084 RID: 132
	public int Points;

	// Token: 0x04000085 RID: 133
	public float MaxBeamLength;

	// Token: 0x04000086 RID: 134
	public float beamScale;

	// Token: 0x04000087 RID: 135
	public bool AnimateUV;

	// Token: 0x04000088 RID: 136
	public float UVTime;

	// Token: 0x04000089 RID: 137
	public bool Oscillate;

	// Token: 0x0400008A RID: 138
	public float Amplitude;

	// Token: 0x0400008B RID: 139
	public float OscillateTime;

	// Token: 0x0400008C RID: 140
	public Transform rayImpact;

	// Token: 0x0400008D RID: 141
	public Transform rayMuzzle;

	// Token: 0x0400008E RID: 142
	private LineRenderer lineRenderer;

	// Token: 0x0400008F RID: 143
	private RaycastHit hitPoint;

	// Token: 0x04000090 RID: 144
	private int frameNo;

	// Token: 0x04000091 RID: 145
	private int FrameTimerID;

	// Token: 0x04000092 RID: 146
	private int OscillateTimerID;

	// Token: 0x04000093 RID: 147
	private float beamLength;

	// Token: 0x04000094 RID: 148
	private float initialBeamOffset;
}
