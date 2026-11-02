using System;
using UnityEngine;

// Token: 0x020002F1 RID: 753
public class ActionPosterStepBehavior : MonoBehaviour
{
	// Token: 0x060013D9 RID: 5081 RVA: 0x0008F264 File Offset: 0x0008D464
	public void cleanup()
	{
		Resources.UnloadAsset(this.texture.mainTexture);
	}

	// Token: 0x060013DA RID: 5082 RVA: 0x0008F278 File Offset: 0x0008D478
	public void set_data(ActionDBItemClass.ActionStepClass d)
	{
		this.texture.mainTexture = Resources.Load<Texture>(this.panel_name_prefix + d.image.ToLower());
		this.instruction_label.text = d.text;
		base.gameObject.SetActive(true);
	}

	// Token: 0x040015A1 RID: 5537
	public UITexture texture;

	// Token: 0x040015A2 RID: 5538
	public UILabel instruction_label;

	// Token: 0x040015A3 RID: 5539
	public UILabel number_label;

	// Token: 0x040015A4 RID: 5540
	private string panel_name_prefix = "db action panels/data_action_";
}
