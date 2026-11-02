using System;
using UnityEngine;

// Token: 0x02000302 RID: 770
public class StoreOptionBehavior : MonoBehaviour
{
	// Token: 0x0600142B RID: 5163 RVA: 0x000911CC File Offset: 0x0008F3CC
	public void set_data(StoreDepartmentDataClass data)
	{
		this.name_label.text = data.name;
		this.dept_icon.spriteName = "icon_" + data.icon;
		this.subpanel.set_data(data);
		this.count_label.gameObject.SetActive(false);
	}

	// Token: 0x0600142C RID: 5164 RVA: 0x00091224 File Offset: 0x0008F424
	private void Update()
	{
	}

	// Token: 0x0400161B RID: 5659
	public UILabel name_label;

	// Token: 0x0400161C RID: 5660
	public buttonBehavior button;

	// Token: 0x0400161D RID: 5661
	public UISprite selected_sprite;

	// Token: 0x0400161E RID: 5662
	public UILabel count_label;

	// Token: 0x0400161F RID: 5663
	public UISprite dept_icon;

	// Token: 0x04001620 RID: 5664
	public StoreDeptPanelBehavior subpanel;

	// Token: 0x04001621 RID: 5665
	internal StoreOptionPanelBehavior option_panel;
}
