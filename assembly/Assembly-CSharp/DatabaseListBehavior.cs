using System;
using System.Collections.Generic;

// Token: 0x020002A6 RID: 678
public class DatabaseListBehavior : ProfileSubpanelBehavior
{
	// Token: 0x06001259 RID: 4697 RVA: 0x000823BC File Offset: 0x000805BC
	public void init()
	{
		while (this.list_item.Count < globals.database_data.item.Count)
		{
			DatabaseListItemBehavior databaseListItemBehavior = this.list_item[0].CopyInPlace() as DatabaseListItemBehavior;
			databaseListItemBehavior.name = "list item " + this.list_item.Count.ToString();
			this.list_item.Add(databaseListItemBehavior);
		}
		for (int i = 0; i < this.list_item.Count; i++)
		{
			this.list_item[i].list = this;
			if (i < globals.database_data.item.Count)
			{
				this.list_item[i].gameObject.SetActive(true);
				this.list_item[i].set_data(globals.database_data.item[i]);
			}
			else
			{
				this.list_item[i].gameObject.SetActive(false);
			}
		}
		this.item_grid.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x0600125A RID: 4698 RVA: 0x000824E0 File Offset: 0x000806E0
	public void update_all_reps()
	{
		for (int i = 0; i < this.list_item.Count; i++)
		{
			this.list_item[i].update_rep();
		}
	}

	// Token: 0x0600125B RID: 4699 RVA: 0x0008251C File Offset: 0x0008071C
	public void filter(DatabasePanelBehavior.mode_enum m)
	{
		for (int i = 0; i < this.list_item.Count; i++)
		{
			this.list_item[i].filter(m);
		}
		this.item_grid.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x0600125C RID: 4700 RVA: 0x00082570 File Offset: 0x00080770
	protected override void Update()
	{
		if (this.database_panel && this.database_panel.dragging)
		{
			this._dragging = true;
		}
		if (!this._dragging)
		{
			for (int i = 0; i < this.list_item.Count; i++)
			{
				if (this.list_item[i].released)
				{
					this.list_item[i].show_poster();
				}
			}
		}
		base.Update();
	}

	// Token: 0x040012E0 RID: 4832
	public UILabel title_label;

	// Token: 0x040012E1 RID: 4833
	public List<DatabaseListItemBehavior> list_item;

	// Token: 0x040012E2 RID: 4834
	public UIGrid item_grid;

	// Token: 0x040012E3 RID: 4835
	public UIAtlas intel_atlas;

	// Token: 0x040012E4 RID: 4836
	public UIAtlas tech_atlas;

	// Token: 0x040012E5 RID: 4837
	internal DatabasePanelBehavior database_panel;
}
