using System;
using UnityEngine;

// Token: 0x020002C5 RID: 709
public class MessageItemBehavior : MonoBehaviour
{
	// Token: 0x060012C3 RID: 4803 RVA: 0x00086134 File Offset: 0x00084334
	public void set_data(messageItemDataClass d)
	{
		if (d.level > -1)
		{
			this.level_go.gameObject.SetActive(true);
			this.db_item_button.gameObject.SetActive(false);
			this.level_lbl.text = d.level.ToString();
			this.name_label.text = "LEVEL UP!";
		}
		else
		{
			this.db_item_button.gameObject.SetActive(true);
			this.level_go.gameObject.SetActive(false);
			this.db_item_button.set_id(d.id);
			if (this.db_item_button.data != null)
			{
				this.name_label.text = this.db_item_button.data.name;
			}
			else
			{
				this.name_label.text = string.Empty;
			}
		}
		this.message_label.text = d.message;
	}

	// Token: 0x040013B2 RID: 5042
	public UISprite frame;

	// Token: 0x040013B3 RID: 5043
	public DBItemButtonBehavior db_item_button;

	// Token: 0x040013B4 RID: 5044
	public GameObject level_go;

	// Token: 0x040013B5 RID: 5045
	public UILabel level_lbl;

	// Token: 0x040013B6 RID: 5046
	public UILabel name_label;

	// Token: 0x040013B7 RID: 5047
	public UILabel message_label;

	// Token: 0x040013B8 RID: 5048
	internal FeedPanelBehavior panel;
}
