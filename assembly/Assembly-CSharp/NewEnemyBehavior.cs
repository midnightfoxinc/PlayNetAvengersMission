using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001F4 RID: 500
public class NewEnemyBehavior : MonoBehaviour
{
	// Token: 0x06000E6A RID: 3690 RVA: 0x00065134 File Offset: 0x00063334
	private void Start()
	{
		this.CurrentState = NewEnemyBehavior.MyState.Default;
		this.Health = this.MyInfo.Health;
		this.Shielded = this.MyInfo.Shielded;
		this.IceMat = this.IceRenderer.material;
	}

	// Token: 0x06000E6B RID: 3691 RVA: 0x00065174 File Offset: 0x00063374
	private void Update()
	{
		if (Input.GetKeyDown(32))
		{
			this.MovingRigidBody.AddForceAtPosition(Vector3.forward * 50f, this.MovingRigidBody.transform.position + new Vector3(0f, 4f, 0f));
		}
		switch (this.CurrentState)
		{
		case NewEnemyBehavior.MyState.FreezingStart:
			this.CurrentState = NewEnemyBehavior.MyState.Freezing;
			break;
		case NewEnemyBehavior.MyState.Freezing:
			if (this.IceMat.GetColor("_Color").a < 0.99f)
			{
				this.IceMat.SetColor("_Color", new Color(this.IceMat.GetColor("_Color").r, this.IceMat.GetColor("_Color").g, this.IceMat.GetColor("_Color").b, Mathf.Lerp(this.IceMat.GetColor("_Color").a, 1f, Time.deltaTime * 1f)));
			}
			else
			{
				this.IceMat.SetColor("_Color", new Color(this.IceMat.GetColor("_Color").r, this.IceMat.GetColor("_Color").g, this.IceMat.GetColor("_Color").b, 1f));
				this.FrozenTime = Time.time;
				this.CurrentState = NewEnemyBehavior.MyState.Frozen;
			}
			break;
		case NewEnemyBehavior.MyState.Frozen:
			if (Time.time > this.FrozenTime + this.ThawDelay)
			{
				this.CurrentState = NewEnemyBehavior.MyState.ThawingStart;
			}
			break;
		case NewEnemyBehavior.MyState.ThawingStart:
			this.CurrentState = NewEnemyBehavior.MyState.Thawing;
			break;
		case NewEnemyBehavior.MyState.Thawing:
			if (this.IceMat.GetColor("_Color").a > 0.01f)
			{
				this.IceMat.SetColor("_Color", new Color(this.IceMat.GetColor("_Color").r, this.IceMat.GetColor("_Color").g, this.IceMat.GetColor("_Color").b, Mathf.Lerp(this.IceMat.GetColor("_Color").a, 0f, Time.deltaTime * 1f)));
			}
			else
			{
				this.IceMat.SetColor("_Color", new Color(this.IceMat.GetColor("_Color").r, this.IceMat.GetColor("_Color").g, this.IceMat.GetColor("_Color").b, 0f));
				this.FrozenTime = Time.time;
				this.CurrentState = NewEnemyBehavior.MyState.Default;
			}
			break;
		case NewEnemyBehavior.MyState.FireBurningStart:
			this.CurrentState = NewEnemyBehavior.MyState.FireBurning;
			break;
		case NewEnemyBehavior.MyState.FireBurning:
			this.FireParticles.loop = true;
			this.FireParticles.Play();
			this.BurnDown = Mathf.Lerp(this.BurnDown, 1f, Time.deltaTime * 1f);
			this.MeshTopRenderer.material.Lerp(this.MeshTopRenderer.material, this.BurnedMaterial, Time.deltaTime * this.BurnDown);
			if (this.BurnDown > 0.99f)
			{
				this.CurrentState = NewEnemyBehavior.MyState.FireBurned;
			}
			break;
		case NewEnemyBehavior.MyState.FireBurned:
			this.FireParticles.loop = false;
			break;
		}
	}

	// Token: 0x06000E6C RID: 3692 RVA: 0x00065554 File Offset: 0x00063754
	public void Hit(RepulsorTestFireBehavior.WeaponInfo weaponhitwith, Vector3 impactlocation, Vector3 impactdirection, bool hitshield = false)
	{
		if (this.Shielded)
		{
			if (weaponhitwith.ShieldBreaker)
			{
			}
		}
		else
		{
			RepulsorTestFireBehavior.AttackInfoType attackType = weaponhitwith.AttackType;
			if (attackType != RepulsorTestFireBehavior.AttackInfoType.Fire)
			{
				if (attackType == RepulsorTestFireBehavior.AttackInfoType.Ice)
				{
					switch (this.CurrentState)
					{
					case NewEnemyBehavior.MyState.Freezing:
						this.FrozenTime = Time.time;
						break;
					case NewEnemyBehavior.MyState.Thawing:
						this.CurrentState = NewEnemyBehavior.MyState.FreezingStart;
						globals.debug("Trying to change state");
						break;
					case NewEnemyBehavior.MyState.AcidBurning:
						this.CurrentState = NewEnemyBehavior.MyState.FreezingStart;
						globals.debug("Trying to change state");
						break;
					case NewEnemyBehavior.MyState.AcidBurned:
						this.CurrentState = NewEnemyBehavior.MyState.FreezingStart;
						globals.debug("Trying to change state");
						break;
					case NewEnemyBehavior.MyState.FireBurning:
						this.CurrentState = NewEnemyBehavior.MyState.FreezingStart;
						globals.debug("Trying to change state");
						break;
					case NewEnemyBehavior.MyState.FireBurned:
						this.CurrentState = NewEnemyBehavior.MyState.FreezingStart;
						globals.debug("Trying to change state");
						break;
					case NewEnemyBehavior.MyState.Default:
						this.CurrentState = NewEnemyBehavior.MyState.FreezingStart;
						globals.debug("Trying to change state");
						break;
					}
				}
			}
			else
			{
				NewEnemyBehavior.MyState currentState = this.CurrentState;
				if (currentState != NewEnemyBehavior.MyState.FireBurned)
				{
					if (currentState == NewEnemyBehavior.MyState.Default)
					{
						this.CurrentState = NewEnemyBehavior.MyState.FireBurningStart;
						globals.debug("Trying to change state");
					}
				}
				else
				{
					this.CurrentState = NewEnemyBehavior.MyState.FireBurningStart;
					globals.debug("Trying to change state");
				}
			}
			this.MovingRigidBody.AddForceAtPosition(impactdirection.normalized * weaponhitwith.Force, impactlocation);
			this.Health -= weaponhitwith.Damage;
		}
		this.EvaluateHealth(weaponhitwith, impactlocation);
	}

	// Token: 0x06000E6D RID: 3693 RVA: 0x000656FC File Offset: 0x000638FC
	private void EvaluateHealth(RepulsorTestFireBehavior.WeaponInfo weaponhitwith, Vector3 impactlocation)
	{
		if (this.Health <= 0f)
		{
			if (this.MyInfo.Death_Prefab != null)
			{
				Object.Instantiate(this.MyInfo.Death_Prefab, base.transform.position, base.transform.rotation);
			}
			if (this.MyInfo.Death_Shrapnel_Prefabs.Count > 0)
			{
				foreach (GameObject gameObject in this.MyInfo.Death_Shrapnel_Prefabs)
				{
					GameObject gameObject2 = (GameObject)Object.Instantiate(gameObject, base.transform.position, Quaternion.identity);
					Rigidbody component = gameObject2.GetComponent<Rigidbody>();
					component.AddExplosionForce(weaponhitwith.DeathExplosiveForce, impactlocation, 5f);
					component.AddRelativeTorque(new Vector3(Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce), Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce), Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce)));
				}
			}
			NewEnemyBehavior.MyState currentState = this.CurrentState;
			if (currentState != NewEnemyBehavior.MyState.Freezing)
			{
				if (currentState == NewEnemyBehavior.MyState.Frozen)
				{
					if (this.MyInfo.Death_Ice_Shrapnel_Prefabs.Count > 0)
					{
						foreach (GameObject gameObject3 in this.MyInfo.Death_Ice_Shrapnel_Prefabs)
						{
							GameObject gameObject4 = (GameObject)Object.Instantiate(gameObject3, base.transform.position, Quaternion.identity);
							Rigidbody component2 = gameObject4.GetComponent<Rigidbody>();
							component2.AddExplosionForce(weaponhitwith.DeathExplosiveForce, impactlocation, 5f);
							component2.AddRelativeTorque(new Vector3(Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce), Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce), Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce)));
						}
					}
					if (this.MyInfo.Death_Ice_Prefab != null)
					{
						Object.Instantiate(this.MyInfo.Death_Ice_Prefab, base.transform.position, base.transform.rotation);
					}
				}
			}
			else
			{
				if (this.MyInfo.Death_Ice_Shrapnel_Prefabs.Count > 0)
				{
					foreach (GameObject gameObject5 in this.MyInfo.Death_Ice_Shrapnel_Prefabs)
					{
						GameObject gameObject6 = (GameObject)Object.Instantiate(gameObject5, base.transform.position, Quaternion.identity);
						Rigidbody component3 = gameObject6.GetComponent<Rigidbody>();
						component3.AddExplosionForce(weaponhitwith.DeathExplosiveForce, impactlocation, 5f);
						component3.AddRelativeTorque(new Vector3(Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce), Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce), Random.Range(-weaponhitwith.DeathExplosiveForce, weaponhitwith.DeathExplosiveForce)));
					}
				}
				if (this.MyInfo.Death_Ice_Prefab != null)
				{
					Object.Instantiate(this.MyInfo.Death_Ice_Prefab, base.transform.position, base.transform.rotation);
				}
			}
			globals.armory_main.testfire_scene.TargetDestroyed(this.MyInfo.enemy_id);
			ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
			scavenger_hunt_types type = scavenger_hunt_types.DESTROY_ENEMY;
			List<string> list = new List<string>();
			list.Add(this.MyInfo.enemy_id);
			list.Add((!this.MyInfo.Shielded) ? string.Empty : "shield");
			scavenger_hunt_manager.do_action(type, list, 1);
			Object.Destroy(base.gameObject);
		}
	}

	// Token: 0x06000E6E RID: 3694 RVA: 0x00065B1C File Offset: 0x00063D1C
	public void KillQuetly()
	{
		Object.Destroy(base.gameObject);
	}

	// Token: 0x04000E2B RID: 3627
	public RepulsorTestFireBehavior.EnemyInfo MyInfo;

	// Token: 0x04000E2C RID: 3628
	private float Health;

	// Token: 0x04000E2D RID: 3629
	private bool Shielded;

	// Token: 0x04000E2E RID: 3630
	public Rigidbody MovingRigidBody;

	// Token: 0x04000E2F RID: 3631
	private Vector3 MyCenter;

	// Token: 0x04000E30 RID: 3632
	public MeshRenderer MeshTopRenderer;

	// Token: 0x04000E31 RID: 3633
	public MeshRenderer IceRenderer;

	// Token: 0x04000E32 RID: 3634
	public ParticleSystem FireParticles;

	// Token: 0x04000E33 RID: 3635
	public Material BurnedMaterial;

	// Token: 0x04000E34 RID: 3636
	private Material IceMat;

	// Token: 0x04000E35 RID: 3637
	public NewEnemyBehavior.MyState CurrentState;

	// Token: 0x04000E36 RID: 3638
	private float FrozenTime;

	// Token: 0x04000E37 RID: 3639
	private float ThawDelay = 10f;

	// Token: 0x04000E38 RID: 3640
	private bool FreezingBegun;

	// Token: 0x04000E39 RID: 3641
	private float BurnDown;

	// Token: 0x020001F5 RID: 501
	public enum MyState
	{
		// Token: 0x04000E3B RID: 3643
		FreezingStart,
		// Token: 0x04000E3C RID: 3644
		Freezing,
		// Token: 0x04000E3D RID: 3645
		Frozen,
		// Token: 0x04000E3E RID: 3646
		ThawingStart,
		// Token: 0x04000E3F RID: 3647
		Thawing,
		// Token: 0x04000E40 RID: 3648
		AcidBurnStart,
		// Token: 0x04000E41 RID: 3649
		AcidBurning,
		// Token: 0x04000E42 RID: 3650
		AcidBurned,
		// Token: 0x04000E43 RID: 3651
		FireBurningStart,
		// Token: 0x04000E44 RID: 3652
		FireBurning,
		// Token: 0x04000E45 RID: 3653
		FireBurned,
		// Token: 0x04000E46 RID: 3654
		Default
	}
}
