using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002BD RID: 701
public class AbilitiesPanelBehavior : ProfileSubpanelBehavior
{
	// Token: 0x060012A6 RID: 4774 RVA: 0x000852D8 File Offset: 0x000834D8
	private void Start()
	{
		this.button_grid.onCustomSort = new Comparison<Transform>(this.customSort);
		this.latestMola = "2101";
		PlayerDeviceClass latest_device_data = globals.player_data.latest_device_data;
		if (latest_device_data != null)
		{
			this.latestMola = string.Empty + latest_device_data.type;
		}
		this.populateList();
		this.setAbilitiesLabel();
		this.button_grid.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x060012A7 RID: 4775 RVA: 0x00085358 File Offset: 0x00083558
	protected int customSort(Transform a, Transform b)
	{
		ProfileListAbilityItemBehavior component = a.GetComponent<ProfileListAbilityItemBehavior>();
		ProfileListAbilityItemBehavior component2 = b.GetComponent<ProfileListAbilityItemBehavior>();
		if (component != null && component2 != null)
		{
			int num = (!component.getAbilUnlocked()) ? 0 : 1;
			int num2 = (!component2.getAbilUnlocked()) ? 0 : 1;
			return num2 - num;
		}
		if (component != null)
		{
			return (!component.getAbilUnlocked()) ? 1 : -1;
		}
		if (component2 != null)
		{
			return (!component2.getAbilUnlocked()) ? -1 : 1;
		}
		return 0;
	}

	// Token: 0x060012A8 RID: 4776 RVA: 0x000853F4 File Offset: 0x000835F4
	protected void populateList()
	{
		List<AbilityDBItemClass> list = new List<AbilityDBItemClass>();
		for (int i = 0; i < globals.database_data.item.Count; i++)
		{
			if (globals.database_data.item[i] is AbilityDBItemClass)
			{
				AbilityDBItemClass abilityDBItemClass = globals.database_data.item[i] as AbilityDBItemClass;
				if (abilityDBItemClass.mola == this.latestMola)
				{
					list.Add(abilityDBItemClass);
				}
			}
		}
		while (this.button.Count < list.Count)
		{
			ProfileListAbilityItemBehavior profileListAbilityItemBehavior = this.button[0].CopyInPlace() as ProfileListAbilityItemBehavior;
			profileListAbilityItemBehavior.name = "ability button " + this.button.Count.ToString();
			this.button.Add(profileListAbilityItemBehavior);
		}
		int num = 0;
		int num2 = 0;
		for (int j = 0; j < this.button.Count; j++)
		{
			if (j < list.Count)
			{
				this.button[j].gameObject.SetActive(true);
				this.button[j].set_data(list[j]);
				if (globals.player_data.has_unlock(list[j].id))
				{
					num2++;
					this.button[j].disabled = false;
				}
				else
				{
					num++;
					this.button[j].disabled = true;
					this.button[j].transform.SetAsLastSibling();
				}
			}
			else
			{
				this.button[j].gameObject.SetActive(false);
			}
		}
		this.locked_indicator.SetActive(num > 0);
		this.locked_label.gameObject.SetActive(num2 == 0);
	}

	// Token: 0x060012A9 RID: 4777 RVA: 0x000855E8 File Offset: 0x000837E8
	protected void refreshList()
	{
		int num = 0;
		int num2 = 0;
		for (int i = 0; i < this.button.Count; i++)
		{
			this.button[i].gameObject.SetActive(true);
			this.button[i].refresh();
			if (this.button[i].getAbilUnlocked())
			{
				num2++;
				this.button[i].disabled = false;
			}
			else
			{
				num++;
				this.button[i].disabled = true;
				this.button[i].transform.SetAsLastSibling();
			}
		}
		this.locked_indicator.SetActive(num > 0);
		this.locked_label.gameObject.SetActive(num2 == 0);
	}

	// Token: 0x060012AA RID: 4778 RVA: 0x000856C0 File Offset: 0x000838C0
	private void setAbilitiesLabel()
	{
		string text = Localization.Get("PROFILE_ABILITY_HEADER");
		string text2 = Localization.Get("PROFILE_ABILITY_LOCKED");
		if (this.latestMola == "2111")
		{
			text = Localization.Get("PROFILE_ABILITY_HEADER_GAMMA");
			text2 = Localization.Get("PROFILE_ABILITY_LOCKED_GAMMA");
		}
		this.abilitiesLabel.text = text;
		this.locked_label.text = text2;
	}

	// Token: 0x060012AB RID: 4779 RVA: 0x00085728 File Offset: 0x00083928
	public override void show(bool b)
	{
		base.show(b);
		if (b)
		{
			PlayerDeviceClass latest_device_data = globals.player_data.latest_device_data;
			string text = "2101";
			if (latest_device_data != null)
			{
				text = string.Empty + latest_device_data.type;
			}
			if (text != this.latestMola)
			{
				this.latestMola = text;
				this.populateList();
				this.setAbilitiesLabel();
			}
			else
			{
				this.refreshList();
			}
			this.button_grid.Reposition();
		}
	}

	// Token: 0x060012AC RID: 4780 RVA: 0x000857AC File Offset: 0x000839AC
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

	// Token: 0x04001394 RID: 5012
	public List<ProfileListAbilityItemBehavior> button;

	// Token: 0x04001395 RID: 5013
	public UIGrid button_grid;

	// Token: 0x04001396 RID: 5014
	public UILabel abilitiesLabel;

	// Token: 0x04001397 RID: 5015
	protected string latestMola;

	// Token: 0x04001398 RID: 5016
	public GameObject locked_indicator;

	// Token: 0x04001399 RID: 5017
	public UILabel locked_label;
}
