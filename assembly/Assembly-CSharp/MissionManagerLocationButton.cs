using System;
using UnityEngine;

// Token: 0x02000293 RID: 659
public class MissionManagerLocationButton : buttonBehavior
{
	// Token: 0x060011BB RID: 4539 RVA: 0x0007F29C File Offset: 0x0007D49C
	public void set_button(location_button_states_enum state, bool disable = false)
	{
		this.button_state = state;
		if (state == location_button_states_enum.MM_OFF)
		{
			base.gameObject.SetActive(false);
		}
		else
		{
			this.disabled = disable;
			base.gameObject.SetActive(true);
			if (disable)
			{
				this.button_sprite.color = Color.white;
				base.gameObject.GetComponent<UIWidget>().alpha = 0.25f;
			}
			else
			{
				this.button_sprite.color = this.button_colors[(int)state];
				base.gameObject.GetComponent<UIWidget>().alpha = 1f;
			}
			this.button_lbl.text = this.button_string[(int)state];
			this.button_outline_sprite.gameObject.SetActive(!disable);
		}
	}

	// Token: 0x04001220 RID: 4640
	public UISprite button_sprite;

	// Token: 0x04001221 RID: 4641
	public UISprite button_outline_sprite;

	// Token: 0x04001222 RID: 4642
	public UILabel button_lbl;

	// Token: 0x04001223 RID: 4643
	private string[] button_string = new string[]
	{
		"ADD TO GEAR",
		"NOT ENOUGH ROOM",
		"CANCEL",
		"REMOVE FROM GEAR",
		"PLAY NOW",
		"UPDATE"
	};

	// Token: 0x04001224 RID: 4644
	private Color[] button_colors = new Color[]
	{
		MissionManagerBehavior.MM_blue,
		MissionManagerBehavior.MM_red,
		MissionManagerBehavior.MM_red,
		MissionManagerBehavior.MM_red,
		MissionManagerBehavior.MM_blue,
		MissionManagerBehavior.MM_blue
	};

	// Token: 0x04001225 RID: 4645
	public location_button_states_enum button_state = location_button_states_enum.MM_OFF;
}
