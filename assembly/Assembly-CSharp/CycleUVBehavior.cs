using System;
using UnityEngine;

// Token: 0x020001B4 RID: 436
public class CycleUVBehavior : MonoBehaviour
{
	// Token: 0x06000CE8 RID: 3304 RVA: 0x0005D814 File Offset: 0x0005BA14
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
			globals.debugWarning("no material found!");
		}
	}

	// Token: 0x06000CE9 RID: 3305 RVA: 0x0005D89C File Offset: 0x0005BA9C
	private void Update()
	{
		if (!this._material)
		{
			return;
		}
		this._material.mainTextureOffset = this._material.mainTextureOffset + this.speed * Time.deltaTime;
	}

	// Token: 0x04000CE6 RID: 3302
	public Vector2 speed;

	// Token: 0x04000CE7 RID: 3303
	protected MeshRenderer _mesh_renderer;

	// Token: 0x04000CE8 RID: 3304
	protected SkinnedMeshRenderer _skinned_mr;

	// Token: 0x04000CE9 RID: 3305
	protected Material _material;
}
