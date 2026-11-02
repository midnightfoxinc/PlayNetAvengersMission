using System;

// Token: 0x020001D2 RID: 466
public class PositionToSecondaryUV : TransformToMaterialEffect
{
	// Token: 0x06000DDE RID: 3550 RVA: 0x00062AE8 File Offset: 0x00060CE8
	private void Update()
	{
		if (!this._material)
		{
			return;
		}
		this._material.SetTextureOffset(this.property_name, -this.effect_transform.localPosition * this.pos_scale);
	}

	// Token: 0x04000D8A RID: 3466
	public float pos_scale = 1f;

	// Token: 0x04000D8B RID: 3467
	public string property_name = "_MaskTex";
}
