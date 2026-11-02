using System;

// Token: 0x020001D9 RID: 473
public class ChooseTransformToMaterialEffect : TransformToMaterialEffect
{
	// Token: 0x06000DEC RID: 3564 RVA: 0x00062D84 File Offset: 0x00060F84
	protected float get_value()
	{
		float num = 0f;
		switch (this.transform_type)
		{
		case ChooseTransformToMaterialEffect.TransformType.POS_X:
			num = this.effect_transform.localPosition.x;
			break;
		case ChooseTransformToMaterialEffect.TransformType.POS_Y:
			num = this.effect_transform.localPosition.y;
			break;
		case ChooseTransformToMaterialEffect.TransformType.POS_Z:
			num = this.effect_transform.localPosition.z;
			break;
		case ChooseTransformToMaterialEffect.TransformType.ROT_X:
			num = this.effect_transform.eulerAngles.x;
			break;
		case ChooseTransformToMaterialEffect.TransformType.ROT_Y:
			num = this.effect_transform.eulerAngles.y;
			break;
		case ChooseTransformToMaterialEffect.TransformType.ROT_Z:
			num = this.effect_transform.eulerAngles.z;
			break;
		case ChooseTransformToMaterialEffect.TransformType.SCA_X:
			num = this.effect_transform.localScale.x;
			break;
		case ChooseTransformToMaterialEffect.TransformType.SCA_Y:
			num = this.effect_transform.localScale.y;
			break;
		case ChooseTransformToMaterialEffect.TransformType.SCA_Z:
			num = this.effect_transform.localScale.z;
			break;
		}
		return num * this.transform_scale;
	}

	// Token: 0x04000D8E RID: 3470
	public ChooseTransformToMaterialEffect.TransformType transform_type;

	// Token: 0x04000D8F RID: 3471
	public float transform_scale = 1f;

	// Token: 0x020001DA RID: 474
	public enum TransformType
	{
		// Token: 0x04000D91 RID: 3473
		POS_X,
		// Token: 0x04000D92 RID: 3474
		POS_Y,
		// Token: 0x04000D93 RID: 3475
		POS_Z,
		// Token: 0x04000D94 RID: 3476
		ROT_X,
		// Token: 0x04000D95 RID: 3477
		ROT_Y,
		// Token: 0x04000D96 RID: 3478
		ROT_Z,
		// Token: 0x04000D97 RID: 3479
		SCA_X,
		// Token: 0x04000D98 RID: 3480
		SCA_Y,
		// Token: 0x04000D99 RID: 3481
		SCA_Z
	}
}
