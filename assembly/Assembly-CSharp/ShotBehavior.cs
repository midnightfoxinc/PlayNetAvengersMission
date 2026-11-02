using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200020E RID: 526
public class ShotBehavior : MonoBehaviour
{
	// Token: 0x06000ED6 RID: 3798 RVA: 0x00069688 File Offset: 0x00067888
	private void Start()
	{
		this.BornTime = Time.time;
		this.Trail = base.transform.GetComponentInChildren<TrailRenderer>();
		this.ParticleSystems = new List<ParticleSystem>();
		this.ParticleSystems.AddRange(base.transform.GetComponentsInChildren<ParticleSystem>());
		if (this.MyWeaponInfo.TypeOfAnimation == RepulsorTestFireBehavior.AnimationUsed.DeployBeam)
		{
			AudioSource audioSource = base.gameObject.AddComponent<AudioSource>();
			audioSource.loop = true;
			audioSource.clip = this.MyWeaponInfo.LoopingShootSound;
			audioSource.playOnAwake = true;
			audioSource.Play();
			audioSource.mute = SFXJukeboxBehavior.muted;
		}
		if (this.MyWeaponInfo.AbilityName.Equals("HYDRAMOONLASER", 5) || this.MyWeaponInfo.AbilityName.Equals("AIRSTRIKE", 5))
		{
			this.FailSafeSelfDestructTime = this.MyWeaponInfo.ShotTime;
		}
	}

	// Token: 0x06000ED7 RID: 3799 RVA: 0x00069768 File Offset: 0x00067968
	private void Update()
	{
		if (this.MyWeaponInfo.ShouldMoveAtStart)
		{
			base.transform.Translate(Vector3.forward * Time.deltaTime * this.MyWeaponInfo.Velocity);
		}
		if (!this.HitOneShot && this.MyWeaponInfo.AbilityName.Equals("HYDRAMOONLASER", 5) && Time.time > this.BornTime + (this.FailSafeSelfDestructTime - 0.5f))
		{
			globals.debug("Should be hitting the target!");
			List<ParticleSystem> list = new List<ParticleSystem>(base.transform.GetComponentsInChildren<ParticleSystem>());
			foreach (ParticleSystem particleSystem in list)
			{
				particleSystem.transform.parent = null;
				particleSystem.emissionRate = 0f;
				Object.Destroy(particleSystem.gameObject, 5f);
			}
			this.HitOneShot = true;
			this.PlayBulletHole();
			this.HitSomething(globals.armory_main.testfire_scene.CurrentEnemy.EnemyGameObject.GetComponent<NewEnemyBehavior>());
		}
		if (Time.time > this.BornTime + this.FailSafeSelfDestructTime)
		{
			Object.Destroy(base.gameObject);
		}
		if (this.MyWeaponInfo.RaycastType)
		{
			if (this.MyWeaponInfo.RaycastOneShot)
			{
				if (!this.BeamFired)
				{
					globals.debug("Fired Raycast Oneshot");
					this.BeamFired = true;
					RaycastHit raycastHit = default(RaycastHit);
					Ray ray;
					ray..ctor(base.transform.position, base.transform.forward);
					this.LastTimeBeamFired = Time.time;
					if (Physics.Raycast(ray, ref raycastHit, this.MyWeaponInfo.RaycastDistance, this.MyWeaponInfo.RaycaseLayerMask))
					{
						this.HitSomethingBeam(raycastHit.collider, raycastHit.point);
						this.hitcount++;
						if (this.MyWeaponInfo.AbilityName.Equals("EMP", 5) || this.MyWeaponInfo.AbilityName.Equals("POWERLEACH", 5))
						{
							CallLightning component = base.transform.GetComponent<CallLightning>();
							component.GetLightning(new Vector3(1E-05f, 1E-05f, 0.0001f), raycastHit.point);
							this.EMPLightningDuration = component.SystemDuration;
						}
					}
				}
			}
			else if (Time.time > this.LastTimeBeamFired + this.BeamEffectInterval)
			{
				this.LastTimeBeamFired = Time.time;
				RaycastHit raycastHit2 = default(RaycastHit);
				Ray ray2;
				ray2..ctor(base.transform.position, base.transform.forward);
				if (Physics.Raycast(ray2, ref raycastHit2, this.MyWeaponInfo.RaycastDistance, this.MyWeaponInfo.RaycaseLayerMask))
				{
					this.HitSomethingBeam(raycastHit2.collider, raycastHit2.point);
					this.hitcount++;
				}
			}
		}
		if (this.MyWeaponInfo.AbilityName.Equals("EMP", 5) && Time.time > this.LastTimeBeamFired + this.EMPLightningDuration)
		{
			Object.Destroy(base.gameObject);
		}
	}

	// Token: 0x06000ED8 RID: 3800 RVA: 0x00069ACC File Offset: 0x00067CCC
	private void OnTriggerEnter(Collider col)
	{
		this.HitSomething(col, true);
	}

	// Token: 0x06000ED9 RID: 3801 RVA: 0x00069AD8 File Offset: 0x00067CD8
	public void HitSomething(Collider col, bool destroyshot = true)
	{
		this.ChangeScreenState();
		if (this.MyWeaponInfo.ImpactSound != null && this.MyWeaponInfo.ImpactSound.Count > 0)
		{
			globals.armory_main.play_sfx(this.MyWeaponInfo.ImpactSound[Random.Range(0, this.MyWeaponInfo.ImpactSound.Count - 1)]);
		}
		NewEnemyBehavior component = col.transform.GetComponent<NewEnemyBehavior>();
		if (!(component == null))
		{
			if (component.MyInfo.Shielded)
			{
				Object.Instantiate(this.MyWeaponInfo.ShieldedImpactPrefab, base.transform.position, Quaternion.Euler(-base.transform.forward));
				component.Hit(this.MyWeaponInfo, base.transform.position, base.transform.eulerAngles, true);
			}
			else
			{
				component.Hit(this.MyWeaponInfo, base.transform.position, base.transform.eulerAngles, false);
				this.PlayImpact(col.transform);
			}
		}
		if (destroyshot)
		{
			if (this.MyWeaponInfo.DelayDestroyParticleSystem && this.ParticleSystems.Count > 0)
			{
				foreach (ParticleSystem particleSystem in this.ParticleSystems)
				{
					particleSystem.transform.parent = null;
					particleSystem.enableEmission = false;
					Object.Destroy(particleSystem.gameObject, 5f);
				}
			}
			Object.Destroy(base.gameObject);
		}
	}

	// Token: 0x06000EDA RID: 3802 RVA: 0x00069CA0 File Offset: 0x00067EA0
	public void HitSomething(NewEnemyBehavior enemy)
	{
		this.ChangeScreenState();
		if (enemy == null)
		{
			this.PlayImpact(enemy.transform);
		}
		else if (enemy.MyInfo.Shielded)
		{
			Object.Instantiate(this.MyWeaponInfo.ShieldedImpactPrefab, base.transform.position, Quaternion.Euler(-base.transform.forward));
			enemy.Hit(this.MyWeaponInfo, base.transform.position, base.transform.eulerAngles, true);
		}
		else
		{
			enemy.Hit(this.MyWeaponInfo, base.transform.position, base.transform.eulerAngles, false);
			this.PlayImpact(enemy.transform);
		}
	}

	// Token: 0x06000EDB RID: 3803 RVA: 0x00069D6C File Offset: 0x00067F6C
	public void HitSomethingBeam(Collider col, Vector3 impactpostition)
	{
		if ((this.MyWeaponInfo.AbilityName.Equals("DISRUPTORBEAM", 5) || this.MyWeaponInfo.AbilityName.Equals("TRANSFUSER", 5)) && this.hitcount >= 1)
		{
			return;
		}
		this.ChangeScreenState();
		NewEnemyBehavior component = col.transform.GetComponent<NewEnemyBehavior>();
		if (component == null)
		{
			this.PlayBeamImpact(col.transform, impactpostition);
		}
		else if (component.MyInfo.Shielded)
		{
			Object.Instantiate(this.MyWeaponInfo.ShieldedImpactPrefab, impactpostition, Quaternion.Euler(-base.transform.forward));
			component.Hit(this.MyWeaponInfo, impactpostition, base.transform.eulerAngles, true);
		}
		else
		{
			component.Hit(this.MyWeaponInfo, impactpostition, base.transform.eulerAngles, false);
			this.PlayBeamImpact(col.transform, impactpostition);
		}
	}

	// Token: 0x06000EDC RID: 3804 RVA: 0x00069E68 File Offset: 0x00068068
	private void ChangeScreenState()
	{
		switch (this.MyWeaponInfo.WeaponScreenEffect)
		{
		case RepulsorTestFireBehavior.ScreenEffect.Static:
			globals.armory_main.testfire_scene.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.StaticStart;
			break;
		case RepulsorTestFireBehavior.ScreenEffect.Frost:
			globals.armory_main.testfire_scene.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.FreezingStart;
			break;
		case RepulsorTestFireBehavior.ScreenEffect.GeneticScrambler:
			if (globals.armory_main.testfire_scene.CurrentScreenState == RepulsorTestFireBehavior.ScreenState.None)
			{
				globals.armory_main.testfire_scene.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.ScrambleStart;
			}
			break;
		}
	}

	// Token: 0x06000EDD RID: 3805 RVA: 0x00069EF0 File Offset: 0x000680F0
	private void PlayImpact(Transform col)
	{
		if (this.Trail != null)
		{
			this.Trail.transform.parent = null;
			this.Trail.autodestruct = true;
		}
		if (this.MyWeaponInfo.ImpactPrefab != null)
		{
			Quaternion quaternion = Quaternion.identity;
			if (this.MyWeaponInfo.AbilityName.Equals("SONICWAVE", 5))
			{
				quaternion = Quaternion.Euler(new Vector3(0f, 180f, 0f));
			}
			else
			{
				quaternion = Quaternion.Euler(new Vector3(0f, 180f, Random.Range(0f, 360f)));
			}
			Object.Instantiate(this.MyWeaponInfo.ImpactPrefab, new Vector3(base.transform.position.x, base.transform.position.y, col.transform.position.z - 0.1f), quaternion);
			if (this.MyWeaponInfo.BulletHolePrefab != null)
			{
				NewEnemyBehavior component = col.transform.GetComponent<NewEnemyBehavior>();
				if (component != null)
				{
					GameObject gameObject = (GameObject)Object.Instantiate(this.MyWeaponInfo.BulletHolePrefab, new Vector3(base.transform.position.x, base.transform.position.y, col.transform.position.z - 0.1f), Quaternion.identity);
					Ray ray;
					ray..ctor(gameObject.transform.position, gameObject.transform.forward);
					RaycastHit raycastHit;
					if (Physics.Raycast(ray, ref raycastHit, 10f, LayerMask.NameToLayer("PhysicsEnemy")))
					{
						gameObject.transform.position = raycastHit.point;
						gameObject.transform.rotation = component.MovingRigidBody.transform.rotation;
						Transform transform = gameObject.transform.FindChild("BulletHoleMesh");
						transform.transform.localEulerAngles = new Vector3(transform.transform.localEulerAngles.x, transform.transform.localEulerAngles.y, Random.Range(0f, 360f));
					}
					gameObject.transform.parent = component.MovingRigidBody.transform;
					gameObject.transform.localPosition = new Vector3(gameObject.transform.localPosition.x, gameObject.transform.localPosition.y, -0.001f);
				}
				else
				{
					GameObject gameObject2 = (GameObject)Object.Instantiate(this.MyWeaponInfo.BulletHolePrefab, new Vector3(base.transform.position.x, base.transform.position.y, col.transform.position.z - 0.1f), Quaternion.Euler(new Vector3(0f, 0f, Random.Range(0f, 360f))));
					gameObject2.transform.parent = col.transform;
				}
			}
		}
	}

	// Token: 0x06000EDE RID: 3806 RVA: 0x0006A23C File Offset: 0x0006843C
	public void PlayBulletHole()
	{
		if (this.MyWeaponInfo.BulletHolePrefab != null)
		{
			Object.Instantiate(this.MyWeaponInfo.BulletHolePrefab, base.transform.position, base.transform.rotation);
		}
	}

	// Token: 0x06000EDF RID: 3807 RVA: 0x0006A288 File Offset: 0x00068488
	private void PlayBeamImpact(Transform col, Vector3 position)
	{
		if (this.Trail != null)
		{
			this.Trail.transform.parent = null;
			this.Trail.autodestruct = true;
		}
		if (this.MyWeaponInfo.BeamImpactPrefab != null)
		{
			Vector3 vector;
			if (this.MyWeaponInfo.AbilityName.Equals("TRANSFUSER", 5))
			{
				vector..ctor(0f, 180f, 0f);
			}
			else
			{
				vector..ctor(0f, 180f, Random.Range(0f, 360f));
			}
			GameObject currentReturnAttack = (GameObject)Object.Instantiate(this.MyWeaponInfo.BeamImpactPrefab, new Vector3(position.x, position.y, col.transform.position.z - 0.1f), Quaternion.Euler(vector));
			if (this.MyWeaponInfo.AbilityName.Equals("TRANSFUSER", 5))
			{
				globals.armory_main.testfire_scene.CurrentReturnAttack = currentReturnAttack;
			}
			if (this.MyWeaponInfo.BeamScorchMarkPrefab != null)
			{
				NewEnemyBehavior component = col.transform.GetComponent<NewEnemyBehavior>();
				if (component != null)
				{
					if (this.MyWeaponInfo.BeamScorchMarkPrefab != null)
					{
						GameObject gameObject = (GameObject)Object.Instantiate(this.MyWeaponInfo.BeamScorchMarkPrefab, new Vector3(position.x, position.y, col.transform.position.z - 0.1f), Quaternion.identity);
						Ray ray;
						ray..ctor(gameObject.transform.position, gameObject.transform.forward);
						RaycastHit raycastHit;
						if (Physics.Raycast(ray, ref raycastHit, 10f, LayerMask.NameToLayer("PhysicsEnemy")))
						{
							gameObject.transform.position = raycastHit.point;
							gameObject.transform.rotation = component.MovingRigidBody.transform.rotation;
							Transform transform = gameObject.transform.FindChild("BulletHoleMesh");
							transform.transform.localEulerAngles = new Vector3(transform.transform.localEulerAngles.x, transform.transform.localEulerAngles.y, Random.Range(0f, 360f));
						}
						gameObject.transform.parent = component.MovingRigidBody.transform;
						gameObject.transform.localPosition = new Vector3(gameObject.transform.localPosition.x, gameObject.transform.localPosition.y, -0.025f);
					}
				}
				else
				{
					GameObject gameObject2 = (GameObject)Object.Instantiate(this.MyWeaponInfo.BulletHolePrefab, new Vector3(position.x, position.y, col.transform.position.z - 0.1f), Quaternion.Euler(new Vector3(0f, 0f, Random.Range(0f, 360f))));
					gameObject2.transform.parent = col.transform;
				}
			}
		}
	}

	// Token: 0x04000F47 RID: 3911
	public RepulsorTestFireBehavior.WeaponInfo MyWeaponInfo;

	// Token: 0x04000F48 RID: 3912
	public RepulsorTestFireBehavior.AttackInfoType AttackType;

	// Token: 0x04000F49 RID: 3913
	public float FailSafeSelfDestructTime = 60f;

	// Token: 0x04000F4A RID: 3914
	private float BornTime;

	// Token: 0x04000F4B RID: 3915
	private TrailRenderer Trail;

	// Token: 0x04000F4C RID: 3916
	private bool FadeParticles;

	// Token: 0x04000F4D RID: 3917
	private List<ParticleSystem> ParticleSystems;

	// Token: 0x04000F4E RID: 3918
	private float BeamEffectInterval = 0.01f;

	// Token: 0x04000F4F RID: 3919
	private float LastTimeBeamFired;

	// Token: 0x04000F50 RID: 3920
	private bool BeamFired;

	// Token: 0x04000F51 RID: 3921
	private float EMPLightningDuration;

	// Token: 0x04000F52 RID: 3922
	private int hitcount;

	// Token: 0x04000F53 RID: 3923
	private bool HitOneShot;
}
