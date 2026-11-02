using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000219 RID: 537
public class ArmoryOptionBehavior : MonoBehaviour
{
	// Token: 0x06000F22 RID: 3874 RVA: 0x0006C0C8 File Offset: 0x0006A2C8
	public void init()
	{
		for (int i = 0; i < globals.database_data.item.Count; i++)
		{
			if (globals.database_data.item[i] is AbilityDBItemClass)
			{
				AbilityDBItemClass abilityDBItemClass = globals.database_data.item[i] as AbilityDBItemClass;
				if (abilityDBItemClass.mola == this.ability_type_panel.mola && abilityDBItemClass.slot == this.slot)
				{
					this.ability.Add(abilityDBItemClass);
				}
			}
		}
		if (this.ability.Count > 0)
		{
			this.ability_type_panel.ability_directory.ability_select_panel.set_ability(this.ability[0]);
		}
		this.equipped_icon.gameObject.SetActive(false);
	}

	// Token: 0x06000F23 RID: 3875 RVA: 0x0006C1A0 File Offset: 0x0006A3A0
	public void set_equipped(string id)
	{
		if (!this.equipped_icon)
		{
			return;
		}
		if (!string.IsNullOrEmpty(id))
		{
			DBItemClass dbitemClass = globals.database_data.item_by_id(id, true);
			if (dbitemClass)
			{
				this.equipped_icon.spriteName = globals.db_icon_prefix + dbitemClass.icon;
				this.equipped_icon.gameObject.SetActive(true);
			}
			else
			{
				this.equipped_icon.gameObject.SetActive(false);
			}
		}
		else
		{
			this.equipped_icon.gameObject.SetActive(false);
		}
	}

	// Token: 0x06000F24 RID: 3876 RVA: 0x0006C23C File Offset: 0x0006A43C
	public void advance(bool forward)
	{
		this.current_index += ((!forward) ? -1 : 1);
		if (this.current_index < 0)
		{
			this.current_index = 0;
		}
		else if (this.current_index >= this.ability.Count)
		{
			this.current_index = this.ability.Count - 1;
		}
	}

	// Token: 0x06000F25 RID: 3877 RVA: 0x0006C2A4 File Offset: 0x0006A4A4
	public AbilityDBItemClass ability_at(int n)
	{
		if (n < 0 || n >= this.ability.Count)
		{
			return null;
		}
		return this.ability[n];
	}

	// Token: 0x06000F26 RID: 3878 RVA: 0x0006C2D8 File Offset: 0x0006A4D8
	public bool first_selected()
	{
		return this.current_index == 0;
	}

	// Token: 0x06000F27 RID: 3879 RVA: 0x0006C2E4 File Offset: 0x0006A4E4
	public bool last_selected()
	{
		return this.current_index == this.ability.Count - 1;
	}

	// Token: 0x04000F98 RID: 3992
	public buttonBehavior button;

	// Token: 0x04000F99 RID: 3993
	public UISprite selected_sprite;

	// Token: 0x04000F9A RID: 3994
	public UISprite equipped_icon;

	// Token: 0x04000F9B RID: 3995
	public UIAtlas atlas;

	// Token: 0x04000F9C RID: 3996
	public AbilityDBItemClass.slot_enum slot;

	// Token: 0x04000F9D RID: 3997
	internal List<AbilityDBItemClass> ability = new List<AbilityDBItemClass>();

	// Token: 0x04000F9E RID: 3998
	internal AbilityTypePanelBehavior ability_type_panel;

	// Token: 0x04000F9F RID: 3999
	public int current_index;
}
