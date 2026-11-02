using System;
using UnityEngine;

// Token: 0x020001D7 RID: 471
public class TransformToAlpha : ChooseTransformToMaterialEffect
{
	// Token: 0x06000DE8 RID: 3560 RVA: 0x00062CCC File Offset: 0x00060ECC
	private void Update()
	{
		if (!this._material)
		{
			return;
		}
		Color color = this._material.color;
		this._material.color = new Color(color.r, color.g, color.b, base.get_value());
	}
}
