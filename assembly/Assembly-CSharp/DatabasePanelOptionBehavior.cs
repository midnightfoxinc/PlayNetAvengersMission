using System;
using UnityEngine;

// Token: 0x020002AB RID: 683
public class DatabasePanelOptionBehavior : MonoBehaviour
{
	// Token: 0x17000228 RID: 552
	// (get) Token: 0x0600126D RID: 4717 RVA: 0x00082DF0 File Offset: 0x00080FF0
	public bool released
	{
		get
		{
			return this.button.released;
		}
	}

	// Token: 0x0600126E RID: 4718 RVA: 0x00082E00 File Offset: 0x00081000
	private void Start()
	{
		this.selected_label.text = this.label.text;
	}

	// Token: 0x0600126F RID: 4719 RVA: 0x00082E18 File Offset: 0x00081018
	public void select(bool b)
	{
		this.button.gameObject.SetActive(!b);
		this.selected_sprite.gameObject.SetActive(b);
		if (b && this.database_panel)
		{
			this.database_panel.selection_pointer.bottomAnchor.target = base.transform;
			this.database_panel.data_list.title_label.text = this.label.text.Replace("\n", " ");
			this.category.mode = this.mode;
		}
	}

	// Token: 0x040012FC RID: 4860
	public buttonBehavior button;

	// Token: 0x040012FD RID: 4861
	public UISprite selected_sprite;

	// Token: 0x040012FE RID: 4862
	public UILabel label;

	// Token: 0x040012FF RID: 4863
	public UILabel selected_label;

	// Token: 0x04001300 RID: 4864
	public DatabasePanelBehavior.mode_enum mode;

	// Token: 0x04001301 RID: 4865
	internal DatabasePanelBehavior database_panel;

	// Token: 0x04001302 RID: 4866
	public DatabaseCategoryBehavior category;
}
