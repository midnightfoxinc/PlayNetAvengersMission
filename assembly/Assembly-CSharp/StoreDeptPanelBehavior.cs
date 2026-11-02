using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002FF RID: 767
public class StoreDeptPanelBehavior : MonoBehaviour
{
	// Token: 0x0600141C RID: 5148 RVA: 0x0009091C File Offset: 0x0008EB1C
	public void set_data(StoreDepartmentDataClass data)
	{
		this.title_label.text = data.name;
		while (this.store_row.Count < data.row.Count)
		{
			StoreRowBehavior storeRowBehavior = this.store_row[0].CopyInPlace() as StoreRowBehavior;
			storeRowBehavior.name = "row " + this.store_row.Count.ToString();
			this.store_row.Add(storeRowBehavior);
		}
		for (int i = 0; i < this.store_row.Count; i++)
		{
			if (i < data.row.Count)
			{
				this.store_row[i].set_data(data.row[i]);
			}
			else
			{
				this.store_row[i].gameObject.SetActive(false);
			}
		}
		this.row_grid.Reposition();
		this.vertical_scroll.ResetPosition();
	}

	// Token: 0x0600141D RID: 5149 RVA: 0x00090A1C File Offset: 0x0008EC1C
	private void update_drag()
	{
		if (!globals.store_main)
		{
			return;
		}
		if (globals.store_main.any_subpanel_open())
		{
			this._dragging = true;
		}
		if (!Input.GetMouseButton(0))
		{
			this._v_drag_prev_y = this.vertical_scroll.transform.localPosition.y;
			this._v_dragged = false;
			this.vertical_scroll.enabled = true;
			if (!Input.GetMouseButtonUp(0))
			{
				this._dragging = false;
			}
		}
		else if (this.vertical_scroll.enabled && Mathf.Abs(this.vertical_scroll.transform.localPosition.y - this._v_drag_prev_y) > globals.store_main.drag_threshold)
		{
			this._v_dragged = true;
			this._dragging = true;
		}
		for (int i = 0; i < this.store_row.Count; i++)
		{
			this.store_row[i].update_drag();
			if (this.store_row[i].dragged)
			{
				this._dragging = true;
			}
		}
	}

	// Token: 0x0600141E RID: 5150 RVA: 0x00090B40 File Offset: 0x0008ED40
	private void Update()
	{
		if (!globals.store_main)
		{
			return;
		}
		this.update_drag();
		if (this._v_dragged)
		{
			for (int i = 0; i < this.store_row.Count; i++)
			{
				this.store_row[i].scroll_view.enabled = false;
			}
		}
		else
		{
			for (int j = 0; j < this.store_row.Count; j++)
			{
				if (this.store_row[j].dragged)
				{
					this.vertical_scroll.enabled = false;
				}
			}
		}
		if (!this._dragging)
		{
			for (int k = 0; k < this.store_row.Count; k++)
			{
				this.store_row[k].button_check();
			}
		}
	}

	// Token: 0x04001605 RID: 5637
	public UILabel title_label;

	// Token: 0x04001606 RID: 5638
	public UIScrollView vertical_scroll;

	// Token: 0x04001607 RID: 5639
	public List<StoreRowBehavior> store_row;

	// Token: 0x04001608 RID: 5640
	public UIGrid row_grid;

	// Token: 0x04001609 RID: 5641
	private float _v_drag_prev_y;

	// Token: 0x0400160A RID: 5642
	private bool _v_dragged;

	// Token: 0x0400160B RID: 5643
	private bool _dragging = true;
}
