using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002BF RID: 703
public class AchievementsPanelBehavior : ProfileSubpanelBehavior
{
	// Token: 0x060012AF RID: 4783 RVA: 0x00085828 File Offset: 0x00083A28
	private void Start()
	{
		this.button_grid.onCustomSort = new Comparison<Transform>(this.customSort);
		while (this.button.Count < globals.achievement_data.item.Count)
		{
			ProfileListAchievementItemBehavior profileListAchievementItemBehavior = this.button[0].CopyInPlace() as ProfileListAchievementItemBehavior;
			profileListAchievementItemBehavior.name = "Achievement button " + this.button.Count.ToString();
			this.button.Add(profileListAchievementItemBehavior);
		}
		int num = 0;
		for (int i = 0; i < this.button.Count; i++)
		{
			if (i < globals.achievement_data.item.Count)
			{
				this.button[i].set_data(globals.achievement_data.item[i]);
				this.button[i].gameObject.SetActive(true);
				if (this.button[i].getAchievementUnlocked())
				{
					num++;
				}
			}
			else
			{
				this.button[i].gameObject.SetActive(false);
			}
		}
		this.setLockedLabel(num);
		this.button_grid.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x060012B0 RID: 4784 RVA: 0x00085974 File Offset: 0x00083B74
	protected int customSort(Transform a, Transform b)
	{
		ProfileListAchievementItemBehavior component = a.GetComponent<ProfileListAchievementItemBehavior>();
		ProfileListAchievementItemBehavior component2 = b.GetComponent<ProfileListAchievementItemBehavior>();
		if (component != null && component2 != null)
		{
			int num = (!component.getAchievementUnlocked()) ? 0 : 1;
			int num2 = (!component2.getAchievementUnlocked()) ? 0 : 1;
			return num2 - num;
		}
		if (component != null)
		{
			return (!component.getAchievementUnlocked()) ? 1 : -1;
		}
		if (component2 != null)
		{
			return (!component2.getAchievementUnlocked()) ? -1 : 1;
		}
		return 0;
	}

	// Token: 0x060012B1 RID: 4785 RVA: 0x00085A10 File Offset: 0x00083C10
	private void setLockedLabel(int unlockedCount)
	{
		this.locked_label.gameObject.SetActive(unlockedCount == 0);
		PlayerDeviceClass latest_device_data = globals.player_data.latest_device_data;
		int num = 2101;
		string text = Localization.Get("PROFILE_ACHIEVEMENTS_LOCKED_REPULSOR");
		if (latest_device_data != null)
		{
			num = latest_device_data.type;
		}
		else
		{
			text = Localization.Get("PROFILE_ACHIEVEMENTS_LOCKED");
		}
		if (num == 2111)
		{
			text = Localization.Get("PROFILE_ACHIEVEMENTS_LOCKED_GAMMA");
		}
		this.locked_label.text = text;
	}

	// Token: 0x060012B2 RID: 4786 RVA: 0x00085A8C File Offset: 0x00083C8C
	public override void show(bool b)
	{
		base.show(b);
		if (b)
		{
			int num = 0;
			int num2 = 0;
			for (int i = 0; i < this.button.Count; i++)
			{
				this.button[i].refresh();
				if (this.button[i].getAchievementUnlocked())
				{
					num2++;
				}
				else
				{
					num++;
				}
			}
			this.button_grid.Reposition();
			this.locked_indicator.SetActive(num > 0);
			this.setLockedLabel(num2);
		}
	}

	// Token: 0x060012B3 RID: 4787 RVA: 0x00085B1C File Offset: 0x00083D1C
	protected override void Update()
	{
		base.Update();
	}

	// Token: 0x0400139A RID: 5018
	public List<ProfileListAchievementItemBehavior> button;

	// Token: 0x0400139B RID: 5019
	public UIGrid button_grid;

	// Token: 0x0400139C RID: 5020
	public GameObject locked_indicator;

	// Token: 0x0400139D RID: 5021
	public UILabel locked_label;
}
