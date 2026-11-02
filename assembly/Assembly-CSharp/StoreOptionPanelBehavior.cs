using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000303 RID: 771
public class StoreOptionPanelBehavior : MonoBehaviour
{
	// Token: 0x0600142E RID: 5166 RVA: 0x00091238 File Offset: 0x0008F438
	public void init()
	{
		while (this.option.Count < globals.store_data.department.Count)
		{
			StoreOptionBehavior storeOptionBehavior = this.option[0].CopyInPlace() as StoreOptionBehavior;
			StoreDeptPanelBehavior storeDeptPanelBehavior = this.option[0].subpanel.CopyInPlace() as StoreDeptPanelBehavior;
			storeOptionBehavior.subpanel = storeDeptPanelBehavior;
			storeOptionBehavior.name = "option " + this.option.Count.ToString();
			storeDeptPanelBehavior.name = "department " + this.option.Count.ToString();
			this.option.Add(storeOptionBehavior);
		}
		for (int i = 0; i < this.option.Count; i++)
		{
			this.option[i].selected_sprite.gameObject.SetActive(false);
			this.option[i].option_panel = this;
			if (i < globals.store_data.department.Count)
			{
				this.option[i].set_data(globals.store_data.department[i]);
				this.option[i].gameObject.SetActive(true);
			}
			else
			{
				this.option[i].gameObject.SetActive(false);
			}
		}
		this.option_grid.Reposition();
		this.set_current(0);
	}

	// Token: 0x0600142F RID: 5167 RVA: 0x000913BC File Offset: 0x0008F5BC
	public void set_physical()
	{
		this.set_current(this.physical_index);
	}

	// Token: 0x06001430 RID: 5168 RVA: 0x000913CC File Offset: 0x0008F5CC
	private void set_current(int n)
	{
		this.current = n;
		this.selection_pointer.bottomAnchor.target = this.option[n].transform;
		for (int i = 0; i < this.option.Count; i++)
		{
			this.option[i].selected_sprite.gameObject.SetActive(i == n);
			this.option[i].subpanel.gameObject.SetActive(i == n);
		}
	}

	// Token: 0x06001431 RID: 5169 RVA: 0x0009145C File Offset: 0x0008F65C
	public StoreOptionBehavior current_option()
	{
		if (this.current > -1 && this.current < this.option.Count && this.option[this.current])
		{
			return this.option[this.current];
		}
		return null;
	}

	// Token: 0x06001432 RID: 5170 RVA: 0x000914BC File Offset: 0x0008F6BC
	private void Update()
	{
		for (int i = 0; i < this.option.Count; i++)
		{
			if (this.option[i].button.hit)
			{
				this.set_current(i);
			}
		}
	}

	// Token: 0x04001622 RID: 5666
	public List<StoreOptionBehavior> option;

	// Token: 0x04001623 RID: 5667
	public UIGrid option_grid;

	// Token: 0x04001624 RID: 5668
	public UISprite selection_pointer;

	// Token: 0x04001625 RID: 5669
	public int physical_index = 1;

	// Token: 0x04001626 RID: 5670
	public int current;
}
