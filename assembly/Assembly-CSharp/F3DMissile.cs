using System;
using UnityEngine;

// Token: 0x0200000A RID: 10
public class F3DMissile : MonoBehaviour
{
	// Token: 0x0600005D RID: 93 RVA: 0x00004E04 File Offset: 0x00003004
	private void Awake()
	{
		this.transform = base.GetComponent<Transform>();
		this.particles = base.GetComponentsInChildren<ParticleSystem>();
		this.meshRenderer = base.GetComponent<MeshRenderer>();
	}

	// Token: 0x0600005E RID: 94 RVA: 0x00004E38 File Offset: 0x00003038
	public void OnSpawned()
	{
		this.isHit = false;
		this.isFXSpawned = false;
		this.timer = 0f;
		this.targetLastPos = Vector3.zero;
		this.step = Vector3.zero;
		this.meshRenderer.enabled = true;
	}

	// Token: 0x0600005F RID: 95 RVA: 0x00004E78 File Offset: 0x00003078
	public void OnDespawned()
	{
	}

	// Token: 0x06000060 RID: 96 RVA: 0x00004E7C File Offset: 0x0000307C
	private void Delay()
	{
		if (this.particles.Length > 0 && this.delayedParticles.Length > 0)
		{
			for (int i = 0; i < this.particles.Length; i++)
			{
				bool flag = false;
				for (int j = 0; j < this.delayedParticles.Length; j++)
				{
					if (this.particles[i] == this.delayedParticles[j])
					{
						flag = true;
						break;
					}
				}
				this.particles[i].Stop(false);
				if (!flag)
				{
					this.particles[i].Clear(false);
				}
			}
		}
	}

	// Token: 0x06000061 RID: 97 RVA: 0x00004F1C File Offset: 0x0000311C
	private void OnMissileDestroy()
	{
		if (F3DPool.instance != null)
		{
			F3DPool.instance.Despawn(this.transform);
		}
	}

	// Token: 0x06000062 RID: 98 RVA: 0x00004F4C File Offset: 0x0000314C
	private void OnHit()
	{
		this.meshRenderer.enabled = false;
		this.isHit = true;
		if (this.DelayDespawn)
		{
			this.timer = 0f;
			this.Delay();
		}
	}

	// Token: 0x06000063 RID: 99 RVA: 0x00004F80 File Offset: 0x00003180
	private void Update()
	{
		if (this.isHit)
		{
			if (!this.isFXSpawned)
			{
				this.isFXSpawned = true;
			}
			if (!this.DelayDespawn || (this.DelayDespawn && this.timer >= this.despawnDelay))
			{
				this.OnMissileDestroy();
			}
		}
		else
		{
			if (this.target != null)
			{
				if (this.missileType == F3DMissile.MissileType.Predictive)
				{
					Vector3 vector = F3DPredictTrajectory.Predict(this.transform.position, this.target.position, this.targetLastPos, this.velocity);
					this.targetLastPos = this.target.position;
					this.transform.rotation = Quaternion.Lerp(this.transform.rotation, Quaternion.LookRotation(vector - this.transform.position), Time.deltaTime * this.alignSpeed);
				}
				else if (this.missileType == F3DMissile.MissileType.Guided)
				{
					this.transform.rotation = Quaternion.Lerp(this.transform.rotation, Quaternion.LookRotation(this.target.position - this.transform.position), Time.deltaTime * this.alignSpeed);
				}
			}
			this.step = this.transform.forward * Time.deltaTime * this.velocity;
			if (this.target != null && this.missileType != F3DMissile.MissileType.Unguided && Vector3.SqrMagnitude(this.transform.position - this.target.position) <= this.detonationDistance)
			{
				this.OnHit();
			}
			else if (this.missileType == F3DMissile.MissileType.Unguided && Physics.Raycast(this.transform.position, this.transform.forward, this.step.magnitude * this.RaycastAdvance, this.layerMask))
			{
				this.OnHit();
			}
			else if (this.timer >= this.lifeTime)
			{
				this.isFXSpawned = true;
				this.OnHit();
			}
			this.transform.position += this.step;
		}
		this.timer += Time.deltaTime;
	}

	// Token: 0x04000095 RID: 149
	public F3DMissile.MissileType missileType;

	// Token: 0x04000096 RID: 150
	public Transform target;

	// Token: 0x04000097 RID: 151
	public LayerMask layerMask;

	// Token: 0x04000098 RID: 152
	public float detonationDistance;

	// Token: 0x04000099 RID: 153
	public float lifeTime = 5f;

	// Token: 0x0400009A RID: 154
	public float despawnDelay;

	// Token: 0x0400009B RID: 155
	public float velocity = 300f;

	// Token: 0x0400009C RID: 156
	public float alignSpeed = 1f;

	// Token: 0x0400009D RID: 157
	public float RaycastAdvance = 2f;

	// Token: 0x0400009E RID: 158
	public bool DelayDespawn;

	// Token: 0x0400009F RID: 159
	public ParticleSystem[] delayedParticles;

	// Token: 0x040000A0 RID: 160
	private ParticleSystem[] particles;

	// Token: 0x040000A1 RID: 161
	private Transform transform;

	// Token: 0x040000A2 RID: 162
	private bool isHit;

	// Token: 0x040000A3 RID: 163
	private bool isFXSpawned;

	// Token: 0x040000A4 RID: 164
	private float timer;

	// Token: 0x040000A5 RID: 165
	private Vector3 targetLastPos;

	// Token: 0x040000A6 RID: 166
	private Vector3 step;

	// Token: 0x040000A7 RID: 167
	private MeshRenderer meshRenderer;

	// Token: 0x0200000B RID: 11
	public enum MissileType
	{
		// Token: 0x040000A9 RID: 169
		Unguided,
		// Token: 0x040000AA RID: 170
		Guided,
		// Token: 0x040000AB RID: 171
		Predictive
	}
}
