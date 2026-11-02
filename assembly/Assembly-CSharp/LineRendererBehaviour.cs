using System;
using UnityEngine;

// Token: 0x02000142 RID: 322
public class LineRendererBehaviour : MonoBehaviour
{
	// Token: 0x06000A9C RID: 2716 RVA: 0x0004DDC8 File Offset: 0x0004BFC8
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

	// Token: 0x06000A9D RID: 2717 RVA: 0x0004DE14 File Offset: 0x0004C014
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		if (this.effectSettings == null)
		{
			Debug.Log("Prefab root have not script \"PrefabSettings\"");
		}
		this.tRoot = this.effectSettings.transform;
		this.line = base.GetComponent<LineRenderer>();
		this.InitializeDefault();
		this.isInitializedOnStart = true;
	}

	// Token: 0x06000A9E RID: 2718 RVA: 0x0004DE74 File Offset: 0x0004C074
	private void InitializeDefault()
	{
		base.GetComponent<Renderer>().material.SetFloat("_Chanel", (float)this.currentShaderIndex);
		this.currentShaderIndex++;
		if (this.currentShaderIndex == 3)
		{
			this.currentShaderIndex = 0;
		}
		this.line.SetPosition(0, this.tRoot.position);
		if (this.IsVertical)
		{
			if (Physics.Raycast(this.tRoot.position, Vector3.down, ref this.hit))
			{
				this.line.SetPosition(1, this.hit.point);
				if (this.StartGlow != null)
				{
					this.StartGlow.transform.position = this.tRoot.position;
				}
				if (this.HitGlow != null)
				{
					this.HitGlow.transform.position = this.hit.point;
				}
				if (this.GoLight != null)
				{
					this.GoLight.transform.position = this.hit.point + new Vector3(0f, this.LightHeightOffset, 0f);
				}
				if (this.Particles != null)
				{
					this.Particles.transform.position = this.hit.point + new Vector3(0f, this.ParticlesHeightOffset, 0f);
				}
				if (this.Explosion != null)
				{
					this.Explosion.transform.position = this.hit.point + new Vector3(0f, this.ParticlesHeightOffset, 0f);
				}
			}
		}
		else
		{
			this.tTarget = this.effectSettings.Target.transform;
			Vector3 normalized = (this.tTarget.position - this.tRoot.position).normalized;
			Vector3 vector = this.tRoot.position + normalized * this.effectSettings.MoveDistance;
			if (Physics.Raycast(this.tRoot.position, normalized, ref this.hit, this.effectSettings.MoveDistance + 1f, this.effectSettings.LayerMask))
			{
				vector = (this.tRoot.position + Vector3.Normalize(this.hit.point - this.tRoot.position) * (this.effectSettings.MoveDistance + 1f)).normalized;
			}
			this.line.SetPosition(1, this.hit.point - this.effectSettings.ColliderRadius * vector);
			Vector3 position = this.hit.point - vector * this.ParticlesHeightOffset;
			if (this.StartGlow != null)
			{
				this.StartGlow.transform.position = this.tRoot.position;
			}
			if (this.HitGlow != null)
			{
				this.HitGlow.transform.position = position;
			}
			if (this.GoLight != null)
			{
				this.GoLight.transform.position = this.hit.point - vector * this.LightHeightOffset;
			}
			if (this.Particles != null)
			{
				this.Particles.transform.position = position;
			}
			if (this.Explosion != null)
			{
				this.Explosion.transform.position = position;
			}
		}
		CollisionInfo e = new CollisionInfo
		{
			Hit = this.hit
		};
		this.effectSettings.OnCollisionHandler(e);
		if (this.hit.transform != null)
		{
			ShieldCollisionBehaviour component = this.hit.transform.GetComponent<ShieldCollisionBehaviour>();
			if (component != null)
			{
				component.ShieldCollisionEnter(e);
			}
		}
	}

	// Token: 0x06000A9F RID: 2719 RVA: 0x0004E2AC File Offset: 0x0004C4AC
	private void OnEnable()
	{
		if (this.isInitializedOnStart)
		{
			this.InitializeDefault();
		}
	}

	// Token: 0x040009C7 RID: 2503
	public bool IsVertical;

	// Token: 0x040009C8 RID: 2504
	public float LightHeightOffset = 0.3f;

	// Token: 0x040009C9 RID: 2505
	public float ParticlesHeightOffset = 0.2f;

	// Token: 0x040009CA RID: 2506
	public float TimeDestroyLightAfterCollision = 4f;

	// Token: 0x040009CB RID: 2507
	public float TimeDestroyThisAfterCollision = 4f;

	// Token: 0x040009CC RID: 2508
	public float TimeDestroyRootAfterCollision = 4f;

	// Token: 0x040009CD RID: 2509
	public GameObject EffectOnHitObject;

	// Token: 0x040009CE RID: 2510
	public GameObject Explosion;

	// Token: 0x040009CF RID: 2511
	public GameObject StartGlow;

	// Token: 0x040009D0 RID: 2512
	public GameObject HitGlow;

	// Token: 0x040009D1 RID: 2513
	public GameObject Particles;

	// Token: 0x040009D2 RID: 2514
	public GameObject GoLight;

	// Token: 0x040009D3 RID: 2515
	private EffectSettings effectSettings;

	// Token: 0x040009D4 RID: 2516
	private Transform tRoot;

	// Token: 0x040009D5 RID: 2517
	private Transform tTarget;

	// Token: 0x040009D6 RID: 2518
	private bool isInitializedOnStart;

	// Token: 0x040009D7 RID: 2519
	private LineRenderer line;

	// Token: 0x040009D8 RID: 2520
	private int currentShaderIndex;

	// Token: 0x040009D9 RID: 2521
	private RaycastHit hit;
}
