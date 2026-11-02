using System;
using UnityEngine;

// Token: 0x02000296 RID: 662
public class MissionManagerProgressBar : MonoBehaviour
{
	// Token: 0x060011C4 RID: 4548 RVA: 0x0007F728 File Offset: 0x0007D928
	public void set_title(string title)
	{
		this.title_lbl.text = title;
	}

	// Token: 0x060011C5 RID: 4549 RVA: 0x0007F738 File Offset: 0x0007D938
	public void set_percentage(int percentage)
	{
		percentage = Mathf.Clamp(percentage, 0, 100);
		this.percentage_lbl.text = percentage.ToString() + "%";
		Vector3 localScale;
		localScale..ctor((float)percentage / 100f, 1f, 1f);
		this.progress_bar_sprite.transform.localScale = localScale;
	}

	// Token: 0x04001239 RID: 4665
	public UILabel title_lbl;

	// Token: 0x0400123A RID: 4666
	public UILabel percentage_lbl;

	// Token: 0x0400123B RID: 4667
	public UISprite progress_bar_sprite;
}
