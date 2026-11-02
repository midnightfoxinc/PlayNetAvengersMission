using System;
using UnityEngine;

// Token: 0x020001DB RID: 475
public class TransformToMaterialEffect : MonoBehaviour
{
	// Token: 0x06000DEE RID: 3566 RVA: 0x00062EC8 File Offset: 0x000610C8
	private void Start()
	{
		this._mesh_renderer = base.GetComponent<MeshRenderer>();
		this._skinned_mr = base.GetComponent<SkinnedMeshRenderer>();
		if (this._mesh_renderer)
		{
			this._material = this._mesh_renderer.material;
		}
		else if (this._skinned_mr)
		{
			this._material = this._skinned_mr.material;
		}
		if (!this._material)
		{
			globals.debugWarning("no material found! @ " + NGUITools.GetHierarchy(base.gameObject));
		}
	}

	// Token: 0x04000D9A RID: 3482
	public Transform effect_transform;

	// Token: 0x04000D9B RID: 3483
	protected MeshRenderer _mesh_renderer;

	// Token: 0x04000D9C RID: 3484
	protected SkinnedMeshRenderer _skinned_mr;

	// Token: 0x04000D9D RID: 3485
	protected Material _material;
}
