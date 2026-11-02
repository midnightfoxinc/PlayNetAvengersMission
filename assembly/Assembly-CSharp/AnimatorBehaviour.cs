using System;
using UnityEngine;

// Token: 0x0200013B RID: 315
public class AnimatorBehaviour : MonoBehaviour
{
	// Token: 0x06000A7C RID: 2684 RVA: 0x0004D338 File Offset: 0x0004B538
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

	// Token: 0x06000A7D RID: 2685 RVA: 0x0004D384 File Offset: 0x0004B584
	private void Start()
	{
		this.oldSpeed = this.anim.speed;
		this.GetEffectSettingsComponent(base.transform);
		if (this.effectSettings != null)
		{
			this.effectSettings.CollisionEnter += new EventHandler<CollisionInfo>(this.prefabSettings_CollisionEnter);
		}
		this.isInitialized = true;
	}

	// Token: 0x06000A7E RID: 2686 RVA: 0x0004D3E0 File Offset: 0x0004B5E0
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.anim.speed = this.oldSpeed;
		}
	}

	// Token: 0x06000A7F RID: 2687 RVA: 0x0004D400 File Offset: 0x0004B600
	private void prefabSettings_CollisionEnter(object sender, CollisionInfo e)
	{
		this.anim.speed = 0f;
	}

	// Token: 0x06000A80 RID: 2688 RVA: 0x0004D414 File Offset: 0x0004B614
	private void Update()
	{
	}

	// Token: 0x0400099C RID: 2460
	public Animator anim;

	// Token: 0x0400099D RID: 2461
	private EffectSettings effectSettings;

	// Token: 0x0400099E RID: 2462
	private bool isInitialized;

	// Token: 0x0400099F RID: 2463
	private float oldSpeed;
}
