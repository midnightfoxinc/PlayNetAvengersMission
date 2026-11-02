using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000306 RID: 774
public class StoreRowBehavior : MonoBehaviour
{
	// Token: 0x17000239 RID: 569
	// (get) Token: 0x06001435 RID: 5173 RVA: 0x0009153C File Offset: 0x0008F73C
	public bool dragged
	{
		get
		{
			return this._dragged;
		}
	}

	// Token: 0x06001436 RID: 5174 RVA: 0x00091544 File Offset: 0x0008F744
	public void button_check()
	{
		for (int i = 0; i < this.item_button.Count; i++)
		{
			if (this.item_button[i].clicked)
			{
				globals.store_main.show_item(this.item_button[i].id);
				DMOManager.LogNavigation(NavigationManager.store_item_panel, "store_item_btn", NavigationManager.store_scene, this.item_button[i].id);
			}
		}
	}

	// Token: 0x06001437 RID: 5175 RVA: 0x000915C4 File Offset: 0x0008F7C4
	public virtual void set_data(StoreRowDataClass data)
	{
		if (this.filter_button)
		{
			this.filter_button.gameObject.SetActive(true);
		}
		if (this.title_label)
		{
			if (string.IsNullOrEmpty(data.name))
			{
				this.title_label.gameObject.SetActive(false);
			}
			else
			{
				this.title_label.gameObject.SetActive(true);
				this.title_label.text = data.name;
			}
		}
		while (this.item_button.Count < data.items.Count)
		{
			StoreItemButtonBehavior storeItemButtonBehavior = this.item_button[0].CopyInPlace() as StoreItemButtonBehavior;
			storeItemButtonBehavior.name = "item button " + this.item_button.Count.ToString();
			this.item_button.Add(storeItemButtonBehavior);
		}
		for (int i = 0; i < this.item_button.Count; i++)
		{
			if (i < data.items.Count)
			{
				StoreItemDataClass storeItemDataClass = globals.store_data.item_by_id(data.items[i], true);
				if (storeItemDataClass)
				{
					this.item_button[i].data = storeItemDataClass;
					this.item_button[i].gameObject.SetActive(true);
					if (storeItemDataClass.type == StoreItemDataClass.type_enum.location && this.filter_button)
					{
						this.filter_button.gameObject.SetActive(false);
					}
				}
				else
				{
					this.item_button[i].gameObject.SetActive(false);
				}
			}
			else
			{
				this.item_button[i].gameObject.SetActive(false);
			}
		}
		base.gameObject.SetActive(true);
		this.button_grid.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x06001438 RID: 5176 RVA: 0x000917B0 File Offset: 0x0008F9B0
	public void update_drag()
	{
		if (!globals.store_main)
		{
			return;
		}
		if (!Input.GetMouseButton(0))
		{
			this._drag_prev_x = this.scroll_view.transform.localPosition.x;
			this._dragged = false;
			this.scroll_view.enabled = true;
		}
		else if (this.scroll_view.enabled && Mathf.Abs(this.scroll_view.transform.localPosition.x - this._drag_prev_x) > globals.store_main.drag_threshold)
		{
			this._dragged = true;
		}
	}

	// Token: 0x06001439 RID: 5177 RVA: 0x00091858 File Offset: 0x0008FA58
	protected virtual void Update()
	{
		if (!globals.store_main)
		{
			return;
		}
		if (this.filter_button && this.filter_button.clicked)
		{
			globals.store_main.filter_panel.show_for_row(this);
		}
	}

	// Token: 0x0400162E RID: 5678
	public UILabel title_label;

	// Token: 0x0400162F RID: 5679
	public UIScrollView scroll_view;

	// Token: 0x04001630 RID: 5680
	public List<StoreItemButtonBehavior> item_button;

	// Token: 0x04001631 RID: 5681
	public UIGrid button_grid;

	// Token: 0x04001632 RID: 5682
	public buttonBehavior filter_button;

	// Token: 0x04001633 RID: 5683
	public RowFilterClass filter = new RowFilterClass();

	// Token: 0x04001634 RID: 5684
	private float _drag_prev_x;

	// Token: 0x04001635 RID: 5685
	private bool _dragged;
}
