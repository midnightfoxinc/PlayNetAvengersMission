using System;

// Token: 0x020001D3 RID: 467
public class PositionToUV : TransformToMaterialEffect
{
	// Token: 0x06000DE0 RID: 3552 RVA: 0x00062B4C File Offset: 0x00060D4C
	private void Update()
	{
		if (!this._material)
		{
			return;
		}
		this._material.mainTextureOffset = -this.effect_transform.localPosition * this.pos_scale;
	}

	// Token: 0x04000D8C RID: 3468
	public float pos_scale = 1f;
}
