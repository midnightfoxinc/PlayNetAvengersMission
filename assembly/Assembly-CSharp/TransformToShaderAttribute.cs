using System;

// Token: 0x020001D8 RID: 472
public class TransformToShaderAttribute : ChooseTransformToMaterialEffect
{
	// Token: 0x06000DEA RID: 3562 RVA: 0x00062D38 File Offset: 0x00060F38
	private void Update()
	{
		if (!this._material)
		{
			return;
		}
		this._material.SetFloat(this.attribute, base.get_value());
	}

	// Token: 0x04000D8D RID: 3469
	public string attribute = "_MaskStrength";
}
