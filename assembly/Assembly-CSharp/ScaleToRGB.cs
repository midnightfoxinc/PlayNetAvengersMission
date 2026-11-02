using System;
using UnityEngine;

// Token: 0x020001D5 RID: 469
public class ScaleToRGB : TransformToMaterialEffect
{
	// Token: 0x06000DE4 RID: 3556 RVA: 0x00062C0C File Offset: 0x00060E0C
	private void Update()
	{
		if (!this._material)
		{
			return;
		}
		Color color = this._material.color;
		this._material.color = new Color(this.effect_transform.localScale.x, this.effect_transform.localScale.y, this.effect_transform.localScale.z, color.a);
	}
}
