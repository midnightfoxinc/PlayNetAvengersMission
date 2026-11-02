using System;
using UnityEngine;

// Token: 0x02000189 RID: 393
public class DownloadProgressPanelBehavior : MonoBehaviour
{
	// Token: 0x06000C0C RID: 3084 RVA: 0x0005839C File Offset: 0x0005659C
	private void Start()
	{
		if (this.type_indicator)
		{
			this.type_indicator.SetActive(globals.build_type == build_type_enum.development);
		}
	}

	// Token: 0x06000C0D RID: 3085 RVA: 0x000583C4 File Offset: 0x000565C4
	public void set_completion(int percent)
	{
		this.fill_sprite.fillAmount = (float)percent / 100f;
		this.fill_sprite.gameObject.SetActive(true);
		if (percent < 0)
		{
			this.percent_label.gameObject.SetActive(false);
			this.complete_label.gameObject.SetActive(false);
			this.fill_sprite.gameObject.SetActive(false);
		}
		else if (percent < 100)
		{
			this.percent_label.text = percent.ToString() + "%";
			this.percent_label.gameObject.SetActive(true);
			this.complete_label.gameObject.SetActive(false);
		}
		else
		{
			this.percent_label.gameObject.SetActive(false);
			this.complete_label.gameObject.SetActive(true);
		}
	}

	// Token: 0x04000BDB RID: 3035
	public UISprite fill_sprite;

	// Token: 0x04000BDC RID: 3036
	public UILabel percent_label;

	// Token: 0x04000BDD RID: 3037
	public UILabel complete_label;

	// Token: 0x04000BDE RID: 3038
	public GameObject type_indicator;
}
