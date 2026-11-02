using System;
using UnityEngine;

// Token: 0x02000147 RID: 327
public class FadeInOutLight : MonoBehaviour
{
	// Token: 0x06000AB5 RID: 2741 RVA: 0x0004E7C4 File Offset: 0x0004C9C4
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

	// Token: 0x06000AB6 RID: 2742 RVA: 0x0004E810 File Offset: 0x0004CA10
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		if (this.effectSettings != null)
		{
			this.effectSettings.CollisionEnter += new EventHandler<CollisionInfo>(this.prefabSettings_CollisionEnter);
		}
		this.goLight = base.GetComponent<Light>();
		this.startIntensity = this.goLight.intensity;
		this.isStartDelay = (this.StartDelay > 0.001f);
		this.isIn = (this.FadeInSpeed > 0.001f);
		this.isOut = (this.FadeOutSpeed > 0.001f);
		this.InitDefaultVariables();
		this.isInitialized = true;
	}

	// Token: 0x06000AB7 RID: 2743 RVA: 0x0004E8B4 File Offset: 0x0004CAB4
	private void InitDefaultVariables()
	{
		this.fadeInComplited = false;
		this.fadeOutComplited = false;
		this.allComplited = false;
		this.canStartFadeOut = false;
		this.isCollisionEnter = false;
		this.oldIntensity = 0f;
		this.currentIntensity = 0f;
		this.canStart = false;
		this.goLight.intensity = ((!this.isIn) ? this.startIntensity : 0f);
		if (this.isStartDelay)
		{
			base.Invoke("SetupStartDelay", this.StartDelay);
		}
		else
		{
			this.canStart = true;
		}
		if (!this.isIn)
		{
			if (!this.FadeOutAfterCollision)
			{
				base.Invoke("SetupFadeOutDelay", this.FadeOutDelay);
			}
			this.oldIntensity = this.startIntensity;
		}
	}

	// Token: 0x06000AB8 RID: 2744 RVA: 0x0004E984 File Offset: 0x0004CB84
	private void prefabSettings_CollisionEnter(object sender, CollisionInfo e)
	{
		this.isCollisionEnter = true;
		if (!this.isIn && this.FadeOutAfterCollision)
		{
			base.Invoke("SetupFadeOutDelay", this.FadeOutDelay);
		}
	}

	// Token: 0x06000AB9 RID: 2745 RVA: 0x0004E9C0 File Offset: 0x0004CBC0
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.InitDefaultVariables();
		}
	}

	// Token: 0x06000ABA RID: 2746 RVA: 0x0004E9D4 File Offset: 0x0004CBD4
	private void SetupStartDelay()
	{
		this.canStart = true;
	}

	// Token: 0x06000ABB RID: 2747 RVA: 0x0004E9E0 File Offset: 0x0004CBE0
	private void SetupFadeOutDelay()
	{
		this.canStartFadeOut = true;
	}

	// Token: 0x06000ABC RID: 2748 RVA: 0x0004E9EC File Offset: 0x0004CBEC
	private void Update()
	{
		if (!this.canStart)
		{
			return;
		}
		if (this.effectSettings != null && this.UseHideStatus && this.allComplited && this.effectSettings.IsVisible)
		{
			this.allComplited = false;
			this.fadeInComplited = false;
			this.fadeOutComplited = false;
			this.InitDefaultVariables();
		}
		if (this.isIn && !this.fadeInComplited)
		{
			if (this.effectSettings == null)
			{
				this.FadeIn();
			}
			else if ((this.UseHideStatus && this.effectSettings.IsVisible) || !this.UseHideStatus)
			{
				this.FadeIn();
			}
		}
		if (!this.isOut || this.fadeOutComplited || !this.canStartFadeOut)
		{
			return;
		}
		if (this.effectSettings == null || (!this.UseHideStatus && !this.FadeOutAfterCollision))
		{
			this.FadeOut();
		}
		else if ((this.UseHideStatus && !this.effectSettings.IsVisible) || this.isCollisionEnter)
		{
			this.FadeOut();
		}
	}

	// Token: 0x06000ABD RID: 2749 RVA: 0x0004EB38 File Offset: 0x0004CD38
	private void FadeIn()
	{
		this.currentIntensity = this.oldIntensity + Time.deltaTime / this.FadeInSpeed * this.startIntensity;
		if (this.currentIntensity >= this.startIntensity)
		{
			this.fadeInComplited = true;
			if (!this.isOut)
			{
				this.allComplited = true;
			}
			this.currentIntensity = this.startIntensity;
			base.Invoke("SetupFadeOutDelay", this.FadeOutDelay);
		}
		this.goLight.intensity = this.currentIntensity;
		this.oldIntensity = this.currentIntensity;
	}

	// Token: 0x06000ABE RID: 2750 RVA: 0x0004EBCC File Offset: 0x0004CDCC
	private void FadeOut()
	{
		this.currentIntensity = this.oldIntensity - Time.deltaTime / this.FadeOutSpeed * this.startIntensity;
		if (this.currentIntensity <= 0f)
		{
			this.currentIntensity = 0f;
			this.fadeOutComplited = true;
			this.allComplited = true;
		}
		this.goLight.intensity = this.currentIntensity;
		this.oldIntensity = this.currentIntensity;
	}

	// Token: 0x040009F9 RID: 2553
	public float StartDelay;

	// Token: 0x040009FA RID: 2554
	public float FadeInSpeed;

	// Token: 0x040009FB RID: 2555
	public float FadeOutDelay;

	// Token: 0x040009FC RID: 2556
	public float FadeOutSpeed;

	// Token: 0x040009FD RID: 2557
	public bool FadeOutAfterCollision;

	// Token: 0x040009FE RID: 2558
	public bool UseHideStatus;

	// Token: 0x040009FF RID: 2559
	private Light goLight;

	// Token: 0x04000A00 RID: 2560
	private float oldIntensity;

	// Token: 0x04000A01 RID: 2561
	private float currentIntensity;

	// Token: 0x04000A02 RID: 2562
	private float startIntensity;

	// Token: 0x04000A03 RID: 2563
	private bool canStart;

	// Token: 0x04000A04 RID: 2564
	private bool canStartFadeOut;

	// Token: 0x04000A05 RID: 2565
	private bool fadeInComplited;

	// Token: 0x04000A06 RID: 2566
	private bool fadeOutComplited;

	// Token: 0x04000A07 RID: 2567
	private bool isCollisionEnter;

	// Token: 0x04000A08 RID: 2568
	private bool allComplited;

	// Token: 0x04000A09 RID: 2569
	private bool isStartDelay;

	// Token: 0x04000A0A RID: 2570
	private bool isIn;

	// Token: 0x04000A0B RID: 2571
	private bool isOut;

	// Token: 0x04000A0C RID: 2572
	private EffectSettings effectSettings;

	// Token: 0x04000A0D RID: 2573
	private bool isInitialized;
}
