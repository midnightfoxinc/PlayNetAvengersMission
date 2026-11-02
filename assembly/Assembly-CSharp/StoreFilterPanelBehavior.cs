using System;
using UnityEngine;

// Token: 0x02000300 RID: 768
public class StoreFilterPanelBehavior : MonoBehaviour
{
	// Token: 0x06001420 RID: 5152 RVA: 0x00090C3C File Offset: 0x0008EE3C
	public void show(bool b)
	{
		base.gameObject.SetActive(b);
		globals.sfx_master.play((!b) ? this.close_sfx : this.open_sfx, null);
	}

	// Token: 0x06001421 RID: 5153 RVA: 0x00090C78 File Offset: 0x0008EE78
	public void show_for_row(StoreRowBehavior r)
	{
		this.row = r;
		this.hero_toggle.value = r.filter.hero;
		this.villain_toggle.value = r.filter.villain;
		this.gear_toggle.value = r.filter.gear;
		this.sort_toggle_group.set_value((int)r.filter.sort);
		this.show(true);
	}

	// Token: 0x06001422 RID: 5154 RVA: 0x00090CEC File Offset: 0x0008EEEC
	private void filter_row()
	{
		if (!this.row)
		{
			return;
		}
		this.row.filter.hero = this.hero_toggle.value;
		this.row.filter.villain = this.villain_toggle.value;
		this.row.filter.gear = this.gear_toggle.value;
		this.row.filter.sort = (RowFilterClass.sort_enum)this.sort_toggle_group.current_value();
		for (int i = 0; i < this.row.item_button.Count; i++)
		{
			if (this.row.item_button[i].data)
			{
				if (this.row.item_button[i].data.db_item() is SFDBItemClass)
				{
					if ((this.row.item_button[i].data.db_item() as SFDBItemClass).hero)
					{
						this.row.item_button[i].gameObject.SetActive(this.hero_toggle.value);
					}
					else
					{
						this.row.item_button[i].gameObject.SetActive(this.villain_toggle.value);
					}
				}
				else if (this.row.item_button[i].data.db_item() is GearDBItemClass)
				{
					this.row.item_button[i].gameObject.SetActive(this.gear_toggle.value);
				}
			}
		}
		if (this.sort_toggle_group.current_value() == 0)
		{
			this.row.item_button.Sort(delegate(StoreItemButtonBehavior x, StoreItemButtonBehavior y)
			{
				if (!x.data || !y.data)
				{
					return -1;
				}
				return x.data.name.CompareTo(y.data.name);
			});
		}
		else
		{
			this.row.item_button.Sort(delegate(StoreItemButtonBehavior x, StoreItemButtonBehavior y)
			{
				if (!x.data || !y.data)
				{
					return -1;
				}
				return y.data.name.CompareTo(x.data.name);
			});
		}
		for (int j = 1; j < this.row.item_button.Count; j++)
		{
			this.row.item_button[j].transform.SetAsLastSibling();
		}
		this.row.button_grid.Reposition();
		this.row.scroll_view.ResetPosition();
	}

	// Token: 0x06001423 RID: 5155 RVA: 0x00090F74 File Offset: 0x0008F174
	private void Update()
	{
		if (this.close_button.clicked)
		{
			this.show(false);
		}
		else if (this.apply_button.clicked)
		{
			this.filter_row();
			this.show(false);
		}
		else if (this.toggle_all.clicked)
		{
			this.hero_toggle.value = true;
			this.villain_toggle.value = true;
			this.gear_toggle.value = true;
		}
	}

	// Token: 0x0400160C RID: 5644
	public buttonBehavior close_button;

	// Token: 0x0400160D RID: 5645
	public UIToggle hero_toggle;

	// Token: 0x0400160E RID: 5646
	public UIToggle villain_toggle;

	// Token: 0x0400160F RID: 5647
	public UIToggle gear_toggle;

	// Token: 0x04001610 RID: 5648
	public buttonBehavior toggle_all;

	// Token: 0x04001611 RID: 5649
	public buttonBehavior apply_button;

	// Token: 0x04001612 RID: 5650
	public ToggleGroupBehavior sort_toggle_group;

	// Token: 0x04001613 RID: 5651
	public StoreRowBehavior row;

	// Token: 0x04001614 RID: 5652
	public string open_sfx = "beep";

	// Token: 0x04001615 RID: 5653
	public string close_sfx = "button press";
}
