using System;
using UnityEngine;

// Token: 0x0200000F RID: 15
public class F3DProjectile : MonoBehaviour
{
	// Token: 0x06000072 RID: 114 RVA: 0x00005604 File Offset: 0x00003804
	private void Awake()
	{
		this.transform = base.GetComponent<Transform>();
		this.particles = base.GetComponentsInChildren<ParticleSystem>();
	}

	// Token: 0x06000073 RID: 115 RVA: 0x00005620 File Offset: 0x00003820
	public void OnSpawned()
	{
		this.isHit = false;
		this.isFXSpawned = false;
		this.timer = 0f;
		this.hitPoint = default(RaycastHit);
	}

	// Token: 0x06000074 RID: 116 RVA: 0x00005658 File Offset: 0x00003858
	public void OnDespawned()
	{
	}

	// Token: 0x06000075 RID: 117 RVA: 0x0000565C File Offset: 0x0000385C
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

	// Token: 0x06000076 RID: 118 RVA: 0x000056FC File Offset: 0x000038FC
	private void OnProjectileDestroy()
	{
		F3DPool.instance.Despawn(this.transform);
	}

	// Token: 0x06000077 RID: 119 RVA: 0x00005710 File Offset: 0x00003910
	private void ApplyForce(float force)
	{
		if (this.hitPoint.rigidbody != null)
		{
			this.hitPoint.rigidbody.AddForceAtPosition(this.transform.forward * force, this.hitPoint.point, 2);
		}
	}

	// Token: 0x06000078 RID: 120 RVA: 0x00005760 File Offset: 0x00003960
	private void Update()
	{
		if (this.isHit)
		{
			if (!this.isFXSpawned)
			{
				F3DFXType f3DFXType = this.fxType;
				switch (f3DFXType)
				{
				case F3DFXType.Vulcan:
					F3DFXController.instance.VulcanImpact(this.hitPoint.point + this.hitPoint.normal * 0.2f);
					this.ApplyForce(2.5f);
					break;
				case F3DFXType.SoloGun:
					F3DFXController.instance.SoloGunImpact(this.hitPoint.point + this.hitPoint.normal * 0.2f);
					this.ApplyForce(25f);
					break;
				default:
					if (f3DFXType == F3DFXType.LaserImpulse)
					{
						F3DFXController.instance.LaserImpulseImpact(this.hitPoint.point + this.hitPoint.normal * 0.2f);
						this.ApplyForce(25f);
					}
					break;
				case F3DFXType.Seeker:
					F3DFXController.instance.SeekerImpact(this.hitPoint.point + this.hitPoint.normal * 1f);
					this.ApplyForce(30f);
					break;
				case F3DFXType.PlasmaGun:
					F3DFXController.instance.PlasmaGunImpact(this.hitPoint.point + this.hitPoint.normal * 0.2f);
					this.ApplyForce(25f);
					break;
				}
				this.isFXSpawned = true;
			}
			if (!this.DelayDespawn || (this.DelayDespawn && this.timer >= this.despawnDelay))
			{
				this.OnProjectileDestroy();
			}
		}
		else
		{
			Vector3 vector = this.transform.forward * Time.deltaTime * this.velocity;
			if (Physics.Raycast(this.transform.position, this.transform.forward, ref this.hitPoint, vector.magnitude * this.RaycastAdvance, this.layerMask))
			{
				this.isHit = true;
				if (this.DelayDespawn)
				{
					this.timer = 0f;
					this.Delay();
				}
			}
			else if (this.timer >= this.lifeTime)
			{
				this.OnProjectileDestroy();
			}
			this.transform.position += vector;
		}
		this.timer += Time.deltaTime;
	}

	// Token: 0x040000B7 RID: 183
	public F3DFXType fxType;

	// Token: 0x040000B8 RID: 184
	public LayerMask layerMask;

	// Token: 0x040000B9 RID: 185
	public float lifeTime = 5f;

	// Token: 0x040000BA RID: 186
	public float despawnDelay;

	// Token: 0x040000BB RID: 187
	public float velocity = 300f;

	// Token: 0x040000BC RID: 188
	public float RaycastAdvance = 2f;

	// Token: 0x040000BD RID: 189
	public bool DelayDespawn;

	// Token: 0x040000BE RID: 190
	public ParticleSystem[] delayedParticles;

	// Token: 0x040000BF RID: 191
	private ParticleSystem[] particles;

	// Token: 0x040000C0 RID: 192
	private Transform transform;

	// Token: 0x040000C1 RID: 193
	private RaycastHit hitPoint;

	// Token: 0x040000C2 RID: 194
	private bool isHit;

	// Token: 0x040000C3 RID: 195
	private bool isFXSpawned;

	// Token: 0x040000C4 RID: 196
	private float timer;
}
