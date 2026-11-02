using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002C2 RID: 706
public class FeedPanelBehavior : ProfileSubpanelBehavior
{
	// Token: 0x060012BA RID: 4794 RVA: 0x00085F20 File Offset: 0x00084120
	private void Start()
	{
	}

	// Token: 0x060012BB RID: 4795 RVA: 0x00085F24 File Offset: 0x00084124
	private void populate()
	{
		if (this.fake_message_data)
		{
			this.data = new messageDataClass(this.fake_message_data.text);
		}
		while (this.message_item.Count < this.data.item.Count)
		{
			MessageItemBehavior messageItemBehavior = this.message_item[0].CopyInPlace() as MessageItemBehavior;
			messageItemBehavior.name = "message item " + this.message_item.Count.ToString();
			this.message_item.Add(messageItemBehavior);
		}
		for (int i = 0; i < this.message_item.Count; i++)
		{
			if (i < this.data.item.Count)
			{
				this.message_item[i].panel = this;
				this.message_item[i].set_data(this.data.item[this.data.item.Count - i - 1]);
				this.message_item[i].gameObject.SetActive(true);
			}
			else
			{
				this.message_item[i].gameObject.SetActive(false);
			}
		}
		this.message_table.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x060012BC RID: 4796 RVA: 0x00086084 File Offset: 0x00084284
	public override void show(bool b)
	{
		base.show(b);
		if (b)
		{
			this.populate();
		}
	}

	// Token: 0x060012BD RID: 4797 RVA: 0x0008609C File Offset: 0x0008429C
	protected override void Update()
	{
		if (!this._dragging)
		{
			for (int i = 0; i < this.message_item.Count; i++)
			{
				if (this.message_item[i].db_item_button.released)
				{
					globals.poster_album.show(this.message_item[i].db_item_button.data);
				}
			}
		}
		base.Update();
	}

	// Token: 0x040013AA RID: 5034
	public UITable message_table;

	// Token: 0x040013AB RID: 5035
	public List<MessageItemBehavior> message_item;

	// Token: 0x040013AC RID: 5036
	public TextAsset fake_message_data;

	// Token: 0x040013AD RID: 5037
	public messageDataClass data;

	// Token: 0x040013AE RID: 5038
	public Color hero_color = Color.blue;

	// Token: 0x040013AF RID: 5039
	public Color villain_color = Color.red;

	// Token: 0x040013B0 RID: 5040
	public Color friend_color = Color.green;
}
