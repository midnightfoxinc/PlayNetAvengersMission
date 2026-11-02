using System;
using UnityEngine;

// Token: 0x02000141 RID: 321
public class MoveOnGround : MonoBehaviour
{
	// Token: 0x06000A96 RID: 2710 RVA: 0x0004DA80 File Offset: 0x0004BC80
	private void GetEffectSettingsComponent(Transform tr)
	{
		Transform parent = tr.parent;
		if (parent != null)
		{
			this.effectSettings = parent.GetComponentInChildren<EffectSettings>();
			if (this.effectSettings == null)
			{
				this.GetEffectSettingsComponent(parent.transform);
			}
		}
	}

	// Token: 0x06000A97 RID: 2711 RVA: 0x0004DACC File Offset: 0x0004BCCC
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		if (this.effectSettings == null)
		{
			Debug.Log("Prefab root have not script \"PrefabSettings\"");
		}
		this.particles = this.effectSettings.GetComponentsInChildren<ParticleSystem>();
		this.InitDefaultVariables();
		this.isInitialized = true;
	}

	// Token: 0x06000A98 RID: 2712 RVA: 0x0004DB20 File Offset: 0x0004BD20
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.InitDefaultVariables();
		}
	}

	// Token: 0x06000A99 RID: 2713 RVA: 0x0004DB34 File Offset: 0x0004BD34
	private void InitDefaultVariables()
	{
		foreach (ParticleSystem particleSystem in this.particles)
		{
			particleSystem.Stop();
		}
		this.isFinished = false;
		this.tTarget = this.effectSettings.Target.transform;
		if (this.IsRootMove)
		{
			this.tRoot = this.effectSettings.transform;
		}
		else
		{
			this.tRoot = base.transform.parent;
			this.tRoot.localPosition = Vector3.zero;
		}
		this.targetPos = this.tRoot.position + Vector3.Normalize(this.tTarget.position - this.tRoot.position) * this.effectSettings.MoveDistance;
		RaycastHit raycastHit;
		Physics.Raycast(this.tRoot.position, Vector3.down, ref raycastHit);
		this.tRoot.position = raycastHit.point;
		foreach (ParticleSystem particleSystem2 in this.particles)
		{
			particleSystem2.Play();
		}
	}

	// Token: 0x06000A9A RID: 2714 RVA: 0x0004DC64 File Offset: 0x0004BE64
	private void Update()
	{
		if (this.tTarget == null || this.isFinished)
		{
			return;
		}
		Vector3 position = this.tRoot.position;
		RaycastHit raycastHit;
		Physics.Raycast(new Vector3(position.x, 0.5f, position.z), Vector3.down, ref raycastHit);
		this.tRoot.position = raycastHit.point;
		position = this.tRoot.position;
		Vector3 vector = (!this.effectSettings.IsHomingMove) ? this.targetPos : this.tTarget.position;
		Vector3 vector2;
		vector2..ctor(vector.x, 0f, vector.z);
		if (Vector3.Distance(new Vector3(position.x, 0f, position.z), vector2) <= this.effectSettings.ColliderRadius)
		{
			this.effectSettings.OnCollisionHandler(new CollisionInfo());
			this.isFinished = true;
		}
		this.tRoot.position = Vector3.MoveTowards(position, vector2, this.effectSettings.MoveSpeed * Time.deltaTime);
	}

	// Token: 0x040009BF RID: 2495
	public bool IsRootMove = true;

	// Token: 0x040009C0 RID: 2496
	private EffectSettings effectSettings;

	// Token: 0x040009C1 RID: 2497
	private Transform tRoot;

	// Token: 0x040009C2 RID: 2498
	private Transform tTarget;

	// Token: 0x040009C3 RID: 2499
	private Vector3 targetPos;

	// Token: 0x040009C4 RID: 2500
	private bool isInitialized;

	// Token: 0x040009C5 RID: 2501
	private bool isFinished;

	// Token: 0x040009C6 RID: 2502
	private ParticleSystem[] particles;
}
