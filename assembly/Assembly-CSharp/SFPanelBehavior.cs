using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002CE RID: 718
public class SFPanelBehavior : ProfileSubpanelBehavior
{
	// Token: 0x060012F3 RID: 4851 RVA: 0x000873F8 File Offset: 0x000855F8
	private void Start()
	{
		List<SFDBItemClass> list = new List<SFDBItemClass>();
		this.button_grid.onCustomSort = new Comparison<Transform>(this.customSort);
		for (int i = 0; i < globals.database_data.item.Count; i++)
		{
			if (globals.database_data.item[i] is SFDBItemClass)
			{
				SFDBItemClass sfdbitemClass = globals.database_data.item[i] as SFDBItemClass;
				if (sfdbitemClass.is_real_SF())
				{
					list.Add(sfdbitemClass);
				}
			}
		}
		while (this.button.Count < list.Count)
		{
			ProfileListSFItemBehavior profileListSFItemBehavior = this.button[0].CopyInPlace() as ProfileListSFItemBehavior;
			profileListSFItemBehavior.name = "SF button " + this.button.Count.ToString();
			this.button.Add(profileListSFItemBehavior);
		}
		int num = 0;
		int num2 = 0;
		for (int j = 0; j < this.button.Count; j++)
		{
			if (j < list.Count)
			{
				this.button[j].gameObject.SetActive(true);
				this.button[j].set_data(list[j]);
				if (this.button[j].getSFLevel() >= 1)
				{
					num2++;
				}
				else
				{
					num++;
				}
			}
			else
			{
				this.button[j].gameObject.SetActive(false);
			}
		}
		this.locked_indicator.SetActive(num > 0);
		this.locked_label.gameObject.SetActive(num2 == 0);
		this.locked_label.text = Localization.Get("PROFILE_SMARTFIGURES_LOCKED");
		this.button_grid.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x060012F4 RID: 4852 RVA: 0x000875E4 File Offset: 0x000857E4
	private int customSort(Transform a, Transform b)
	{
		ProfileListSFItemBehavior component = a.GetComponent<ProfileListSFItemBehavior>();
		ProfileListSFItemBehavior component2 = b.GetComponent<ProfileListSFItemBehavior>();
		if (component != null && component2 != null)
		{
			int sflevel = component.getSFLevel();
			int sflevel2 = component2.getSFLevel();
			return sflevel2 - sflevel;
		}
		if (component != null)
		{
			return (component.getSFLevel() < 1) ? 1 : -1;
		}
		if (component2 != null)
		{
			return (component2.getSFLevel() < 1) ? -1 : 1;
		}
		return 0;
	}

	// Token: 0x060012F5 RID: 4853 RVA: 0x0008766C File Offset: 0x0008586C
	private void update_all_reps()
	{
		int num = 0;
		int num2 = 0;
		for (int i = 0; i < this.button.Count; i++)
		{
			this.button[i].update_rep();
			if (this.button[i].getSFLevel() >= 1)
			{
				num2++;
			}
			else
			{
				num++;
			}
		}
		this.locked_indicator.SetActive(num > 0);
		this.locked_label.gameObject.SetActive(num2 == 0);
	}

	// Token: 0x060012F6 RID: 4854 RVA: 0x000876F4 File Offset: 0x000858F4
	public override void show(bool b)
	{
		base.show(b);
		if (b)
		{
			this.update_all_reps();
			this.button_grid.Reposition();
		}
	}

	// Token: 0x060012F7 RID: 4855 RVA: 0x00087714 File Offset: 0x00085914
	protected override void Update()
	{
		if (!this._dragging && Input.GetMouseButtonUp(0))
		{
			for (int i = 0; i < this.button.Count; i++)
			{
				if (this.button[i].released)
				{
					this.button[i].show_poster();
				}
			}
		}
		base.Update();
	}

	// Token: 0x040013F6 RID: 5110
	public List<ProfileListSFItemBehavior> button;

	// Token: 0x040013F7 RID: 5111
	public UIGrid button_grid;

	// Token: 0x040013F8 RID: 5112
	public GameObject locked_indicator;

	// Token: 0x040013F9 RID: 5113
	public UILabel locked_label;
}
