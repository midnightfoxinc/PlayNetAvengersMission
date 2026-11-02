using System;
using UnityEngine;

// Token: 0x020002D4 RID: 724
[RequireComponent(typeof(TweenScale))]
public class ProgressReportLevelWidgetBehavior : MonoBehaviour
{
	// Token: 0x06001320 RID: 4896 RVA: 0x0008899C File Offset: 0x00086B9C
	public void set_type(int t)
	{
		this.repulsor_bg_texture.gameObject.SetActive(t == 2101);
		this.gamma_bg_texture.gameObject.SetActive(t == 2111);
	}

	// Token: 0x04001441 RID: 5185
	public UITexture repulsor_bg_texture;

	// Token: 0x04001442 RID: 5186
	public UITexture gamma_bg_texture;

	// Token: 0x04001443 RID: 5187
	public UILabel level_lbl;
}
