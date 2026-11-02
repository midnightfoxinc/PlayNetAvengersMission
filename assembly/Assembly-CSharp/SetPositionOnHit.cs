using System;
using UnityEngine;

// Token: 0x02000153 RID: 339
public class SetPositionOnHit : MonoBehaviour
{
	// Token: 0x06000B00 RID: 2816 RVA: 0x0004FFAC File Offset: 0x0004E1AC
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

	// Token: 0x06000B01 RID: 2817 RVA: 0x0004FFF8 File Offset: 0x0004E1F8
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		if (this.effectSettings == null)
		{
			Debug.Log("Prefab root or children have not script \"PrefabSettings\"");
		}
		this.tRoot = this.effectSettings.transform;
	}

	// Token: 0x06000B02 RID: 2818 RVA: 0x00050040 File Offset: 0x0004E240
	private void effectSettings_CollisionEnter(object sender, CollisionInfo e)
	{
		Vector3 normalized = (this.tRoot.position + Vector3.Normalize(e.Hit.point - this.tRoot.position) * (this.effectSettings.MoveDistance + 1f)).normalized;
		base.transform.position = e.Hit.point - normalized * this.OffsetPosition;
	}

	// Token: 0x06000B03 RID: 2819 RVA: 0x000500C4 File Offset: 0x0004E2C4
	private void Update()
	{
		if (!this.isInitialized)
		{
			this.isInitialized = true;
			this.effectSettings.CollisionEnter += new EventHandler<CollisionInfo>(this.effectSettings_CollisionEnter);
		}
	}

	// Token: 0x06000B04 RID: 2820 RVA: 0x000500F0 File Offset: 0x0004E2F0
	private void OnDisable()
	{
		base.transform.position = Vector3.zero;
	}

	// Token: 0x04000A78 RID: 2680
	public float OffsetPosition;

	// Token: 0x04000A79 RID: 2681
	private EffectSettings effectSettings;

	// Token: 0x04000A7A RID: 2682
	private Transform tRoot;

	// Token: 0x04000A7B RID: 2683
	private bool isInitialized;
}
