using System;
using UnityEngine;

// Token: 0x0200014B RID: 331
public class FadeInOutShaderFloat : MonoBehaviour
{
	// Token: 0x06000AD6 RID: 2774 RVA: 0x0004F4E8 File Offset: 0x0004D6E8
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

	// Token: 0x06000AD7 RID: 2775 RVA: 0x0004F534 File Offset: 0x0004D734
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		if (this.effectSettings != null)
		{
			this.effectSettings.CollisionEnter += new EventHandler<CollisionInfo>(this.prefabSettings_CollisionEnter);
		}
		this.InitMaterial();
	}

	// Token: 0x06000AD8 RID: 2776 RVA: 0x0004F57C File Offset: 0x0004D77C
	public void UpdateMaterial(Material instanceMaterial)
	{
		this.mat = instanceMaterial;
		this.InitMaterial();
	}

	// Token: 0x06000AD9 RID: 2777 RVA: 0x0004F58C File Offset: 0x0004D78C
	private void InitMaterial()
	{
		if (this.isInitialized)
		{
			return;
		}
		if (base.GetComponent<Renderer>() != null)
		{
			this.mat = base.GetComponent<Renderer>().material;
		}
		else if (this.mat == null)
		{
			return;
		}
		this.isStartDelay = (this.StartDelay > 0.001f);
		this.isIn = (this.FadeInSpeed > 0.001f);
		this.isOut = (this.FadeOutSpeed > 0.001f);
		this.InitDefaultVariables();
		this.isInitialized = true;
	}

	// Token: 0x06000ADA RID: 2778 RVA: 0x0004F624 File Offset: 0x0004D824
	private void InitDefaultVariables()
	{
		this.fadeInComplited = false;
		this.fadeOutComplited = false;
		this.allComplited = false;
		this.canStartFadeOut = false;
		this.isCollisionEnter = false;
		this.oldFloat = 0f;
		this.currentFloat = this.MaxFloat;
		if (this.isIn)
		{
			this.currentFloat = 0f;
		}
		this.mat.SetFloat(this.PropertyName, this.currentFloat);
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
			this.oldFloat = this.MaxFloat;
		}
	}

	// Token: 0x06000ADB RID: 2779 RVA: 0x0004F6F4 File Offset: 0x0004D8F4
	private void prefabSettings_CollisionEnter(object sender, CollisionInfo e)
	{
		this.isCollisionEnter = true;
		if (!this.isIn && this.FadeOutAfterCollision)
		{
			base.Invoke("SetupFadeOutDelay", this.FadeOutDelay);
		}
	}

	// Token: 0x06000ADC RID: 2780 RVA: 0x0004F730 File Offset: 0x0004D930
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.InitDefaultVariables();
		}
	}

	// Token: 0x06000ADD RID: 2781 RVA: 0x0004F744 File Offset: 0x0004D944
	private void SetupStartDelay()
	{
		this.canStart = true;
	}

	// Token: 0x06000ADE RID: 2782 RVA: 0x0004F750 File Offset: 0x0004D950
	private void SetupFadeOutDelay()
	{
		this.canStartFadeOut = true;
	}

	// Token: 0x06000ADF RID: 2783 RVA: 0x0004F75C File Offset: 0x0004D95C
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

	// Token: 0x06000AE0 RID: 2784 RVA: 0x0004F8A8 File Offset: 0x0004DAA8
	private void FadeIn()
	{
		this.currentFloat = this.oldFloat + Time.deltaTime / this.FadeInSpeed * this.MaxFloat;
		if (this.currentFloat >= this.MaxFloat)
		{
			this.fadeInComplited = true;
			if (!this.isOut)
			{
				this.allComplited = true;
			}
			this.currentFloat = this.MaxFloat;
			base.Invoke("SetupFadeOutDelay", this.FadeOutDelay);
		}
		this.mat.SetFloat(this.PropertyName, this.currentFloat);
		this.oldFloat = this.currentFloat;
	}

	// Token: 0x06000AE1 RID: 2785 RVA: 0x0004F940 File Offset: 0x0004DB40
	private void FadeOut()
	{
		this.currentFloat = this.oldFloat - Time.deltaTime / this.FadeOutSpeed * this.MaxFloat;
		if (this.currentFloat <= 0f)
		{
			this.currentFloat = 0f;
			this.fadeOutComplited = true;
			this.allComplited = true;
		}
		this.mat.SetFloat(this.PropertyName, this.currentFloat);
		this.oldFloat = this.currentFloat;
	}

	// Token: 0x04000A33 RID: 2611
	public string PropertyName = "_CutOut";

	// Token: 0x04000A34 RID: 2612
	public float MaxFloat = 1f;

	// Token: 0x04000A35 RID: 2613
	public float StartDelay;

	// Token: 0x04000A36 RID: 2614
	public float FadeInSpeed;

	// Token: 0x04000A37 RID: 2615
	public float FadeOutDelay;

	// Token: 0x04000A38 RID: 2616
	public float FadeOutSpeed;

	// Token: 0x04000A39 RID: 2617
	public bool FadeOutAfterCollision;

	// Token: 0x04000A3A RID: 2618
	public bool UseHideStatus;

	// Token: 0x04000A3B RID: 2619
	private Material OwnMaterial;

	// Token: 0x04000A3C RID: 2620
	private Material mat;

	// Token: 0x04000A3D RID: 2621
	private float oldFloat;

	// Token: 0x04000A3E RID: 2622
	private float currentFloat;

	// Token: 0x04000A3F RID: 2623
	private float startFloat;

	// Token: 0x04000A40 RID: 2624
	private bool canStart;

	// Token: 0x04000A41 RID: 2625
	private bool canStartFadeOut;

	// Token: 0x04000A42 RID: 2626
	private bool fadeInComplited;

	// Token: 0x04000A43 RID: 2627
	private bool fadeOutComplited;

	// Token: 0x04000A44 RID: 2628
	private bool isCollisionEnter;

	// Token: 0x04000A45 RID: 2629
	private bool allComplited;

	// Token: 0x04000A46 RID: 2630
	private bool isStartDelay;

	// Token: 0x04000A47 RID: 2631
	private bool isIn;

	// Token: 0x04000A48 RID: 2632
	private bool isOut;

	// Token: 0x04000A49 RID: 2633
	private EffectSettings effectSettings;

	// Token: 0x04000A4A RID: 2634
	private bool isInitialized;
}
