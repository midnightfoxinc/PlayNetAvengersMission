using System;
using UnityEngine;

// Token: 0x0200014F RID: 335
public class OnStartSendCollision : MonoBehaviour
{
	// Token: 0x06000AEE RID: 2798 RVA: 0x0004FC98 File Offset: 0x0004DE98
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

	// Token: 0x06000AEF RID: 2799 RVA: 0x0004FCE4 File Offset: 0x0004DEE4
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		this.effectSettings.OnCollisionHandler(new CollisionInfo());
		this.isInitialized = true;
	}

	// Token: 0x06000AF0 RID: 2800 RVA: 0x0004FD0C File Offset: 0x0004DF0C
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.effectSettings.OnCollisionHandler(new CollisionInfo());
		}
	}

	// Token: 0x04000A5C RID: 2652
	private EffectSettings effectSettings;

	// Token: 0x04000A5D RID: 2653
	private bool isInitialized;
}
