using System;
using UnityEngine;

// Token: 0x020002B4 RID: 692
public class LegalesePanelBehavior : MonoBehaviour
{
	// Token: 0x06001284 RID: 4740 RVA: 0x00083E28 File Offset: 0x00082028
	public void show(string t)
	{
		this.title_label.text = t;
		this.loading_widget.gameObject.SetActive(true);
		this.content_label.text = string.Empty;
	}

	// Token: 0x06001285 RID: 4741 RVA: 0x00083E64 File Offset: 0x00082064
	public void set_content(string s)
	{
		base.gameObject.SetActive(true);
		this.loading_widget.gameObject.SetActive(false);
		this.content_label.text = s;
		this.scroll_view.ResetPosition();
	}

	// Token: 0x06001286 RID: 4742 RVA: 0x00083EA8 File Offset: 0x000820A8
	private void Update()
	{
		if (this.close_button.hit)
		{
			this.close_button.play_sfx();
			base.gameObject.SetActive(false);
		}
	}

	// Token: 0x04001336 RID: 4918
	public UILabel title_label;

	// Token: 0x04001337 RID: 4919
	public UILabel content_label;

	// Token: 0x04001338 RID: 4920
	public UIScrollView scroll_view;

	// Token: 0x04001339 RID: 4921
	public buttonBehavior close_button;

	// Token: 0x0400133A RID: 4922
	public GameObject loading_widget;
}
