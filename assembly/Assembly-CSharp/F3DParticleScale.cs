using System;
using UnityEngine;

// Token: 0x0200000C RID: 12
[ExecuteInEditMode]
public class F3DParticleScale : MonoBehaviour
{
	// Token: 0x06000065 RID: 101 RVA: 0x000051FC File Offset: 0x000033FC
	private void Start()
	{
		this.prevScale = this.ParticleScale;
	}

	// Token: 0x06000066 RID: 102 RVA: 0x0000520C File Offset: 0x0000340C
	private void ScaleShurikenSystems(float scaleFactor)
	{
	}

	// Token: 0x06000067 RID: 103 RVA: 0x00005210 File Offset: 0x00003410
	private void ScaleTrailRenderers(float scaleFactor)
	{
		TrailRenderer[] componentsInChildren = base.GetComponentsInChildren<TrailRenderer>();
		foreach (TrailRenderer trailRenderer in componentsInChildren)
		{
			trailRenderer.startWidth *= scaleFactor;
			trailRenderer.endWidth *= scaleFactor;
		}
	}

	// Token: 0x06000068 RID: 104 RVA: 0x0000525C File Offset: 0x0000345C
	private void Update()
	{
	}

	// Token: 0x040000AC RID: 172
	[Range(0f, 20f)]
	public float ParticleScale = 1f;

	// Token: 0x040000AD RID: 173
	public bool ScaleGameobject = true;

	// Token: 0x040000AE RID: 174
	private float prevScale;
}
