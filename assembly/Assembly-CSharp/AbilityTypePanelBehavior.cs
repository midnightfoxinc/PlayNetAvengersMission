using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000218 RID: 536
public class AbilityTypePanelBehavior : MonoBehaviour
{
	// Token: 0x06000F1C RID: 3868 RVA: 0x0006BE88 File Offset: 0x0006A088
	public void init()
	{
		for (int i = 0; i < this.option.Count; i++)
		{
			this.option[i].selected_sprite.alpha = 0.5f;
			this.option[i].ability_type_panel = this;
			this.option[i].init();
		}
		this.set_current(0);
	}

	// Token: 0x06000F1D RID: 3869 RVA: 0x0006BEF8 File Offset: 0x0006A0F8
	public void select_ability_by_id(string id)
	{
		for (int i = 0; i < this.option.Count; i++)
		{
			for (int j = 0; j < this.option[i].ability.Count; j++)
			{
				if (this.option[i].ability[j].id == id)
				{
					this.set_current(i);
					this.option[i].current_index = j;
					return;
				}
			}
		}
	}

	// Token: 0x06000F1E RID: 3870 RVA: 0x0006BF8C File Offset: 0x0006A18C
	private void set_current(int n)
	{
		this.current = n;
		for (int i = 0; i < this.option.Count; i++)
		{
			this.option[i].selected_sprite.alpha = ((i != n) ? 0.5f : 1f);
			this.option[i].button.disabled = (i != n);
		}
	}

	// Token: 0x06000F1F RID: 3871 RVA: 0x0006C008 File Offset: 0x0006A208
	public ArmoryOptionBehavior current_option()
	{
		if (this.current > -1 && this.current < this.option.Count && this.option[this.current])
		{
			return this.option[this.current];
		}
		return null;
	}

	// Token: 0x06000F20 RID: 3872 RVA: 0x0006C068 File Offset: 0x0006A268
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

	// Token: 0x04000F94 RID: 3988
	public List<ArmoryOptionBehavior> option;

	// Token: 0x04000F95 RID: 3989
	public string mola;

	// Token: 0x04000F96 RID: 3990
	public int current;

	// Token: 0x04000F97 RID: 3991
	internal AbilityDirectoryBehavior ability_directory;
}
