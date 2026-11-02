using System;

// Token: 0x020001D6 RID: 470
public class ScaleToUV : TransformToMaterialEffect
{
	// Token: 0x06000DE6 RID: 3558 RVA: 0x00062C90 File Offset: 0x00060E90
	private void Update()
	{
		if (!this._material)
		{
			return;
		}
		this._material.mainTextureOffset = -this.effect_transform.localScale;
	}
}
