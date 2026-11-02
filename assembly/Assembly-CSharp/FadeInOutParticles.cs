using System;
using UnityEngine;

// Token: 0x02000148 RID: 328
public class FadeInOutParticles : MonoBehaviour
{
	// Token: 0x06000AC0 RID: 2752 RVA: 0x0004EC48 File Offset: 0x0004CE48
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

	// Token: 0x06000AC1 RID: 2753 RVA: 0x0004EC94 File Offset: 0x0004CE94
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		this.particles = this.effectSettings.GetComponentsInChildren<ParticleSystem>();
		this.oldVisibleStat = this.effectSettings.IsVisible;
	}

	// Token: 0x06000AC2 RID: 2754 RVA: 0x0004ECD0 File Offset: 0x0004CED0
	private void Update()
	{
		if (this.effectSettings.IsVisible != this.oldVisibleStat)
		{
			if (this.effectSettings.IsVisible)
			{
				foreach (ParticleSystem particleSystem in this.particles)
				{
					if (this.effectSettings.IsVisible)
					{
						particleSystem.Play();
						particleSystem.enableEmission = true;
					}
				}
			}
			else
			{
				foreach (ParticleSystem particleSystem2 in this.particles)
				{
					if (!this.effectSettings.IsVisible)
					{
						particleSystem2.Stop();
						particleSystem2.enableEmission = false;
					}
				}
			}
		}
		this.oldVisibleStat = this.effectSettings.IsVisible;
	}

	// Token: 0x04000A0E RID: 2574
	private EffectSettings effectSettings;

	// Token: 0x04000A0F RID: 2575
	private ParticleSystem[] particles;

	// Token: 0x04000A10 RID: 2576
	private bool oldVisibleStat;
}
