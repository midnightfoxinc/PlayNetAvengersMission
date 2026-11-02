using System;
using UnityEngine;

// Token: 0x020001D4 RID: 468
public class ScaleToAlpha : TransformToMaterialEffect
{
	// Token: 0x06000DE2 RID: 3554 RVA: 0x00062BA0 File Offset: 0x00060DA0
	private void Update()
	{
		if (!this._material)
		{
			return;
		}
		Color color = this._material.color;
		this._material.color = new Color(color.r, color.g, color.b, this.effect_transform.localScale.x);
	}
}
