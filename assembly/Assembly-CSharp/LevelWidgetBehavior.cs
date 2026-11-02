using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001B9 RID: 441
public class LevelWidgetBehavior : MonoBehaviour
{
	// Token: 0x06000CF5 RID: 3317 RVA: 0x0005DC20 File Offset: 0x0005BE20
	public void set_level(int level, float fill, int gear_type)
	{
		base.gameObject.SetActive(true);
		this.number_label.text = level.ToString();
		if (this.fill_sprite)
		{
			this.fill_sprite.fillAmount = fill;
		}
		this.set_gear_type(gear_type.ToString());
	}

	// Token: 0x06000CF6 RID: 3318 RVA: 0x0005DC74 File Offset: 0x0005BE74
	public void set_gear_type(string gear_type)
	{
		if (!this.bg_sprite)
		{
			return;
		}
		if (gear_type != null)
		{
			if (LevelWidgetBehavior.<>f__switch$map5 == null)
			{
				Dictionary<string, int> dictionary = new Dictionary<string, int>(2);
				dictionary.Add("2101", 0);
				dictionary.Add("2111", 1);
				LevelWidgetBehavior.<>f__switch$map5 = dictionary;
			}
			int num;
			if (LevelWidgetBehavior.<>f__switch$map5.TryGetValue(gear_type, ref num))
			{
				if (num != 0)
				{
					if (num == 1)
					{
						this.bg_sprite.spriteName = this.gamma_bg;
					}
				}
				else
				{
					this.bg_sprite.spriteName = this.repulsor_bg;
				}
			}
		}
	}

	// Token: 0x06000CF7 RID: 3319 RVA: 0x0005DD1C File Offset: 0x0005BF1C
	public void hide()
	{
		base.gameObject.SetActive(false);
	}

	// Token: 0x04000CFB RID: 3323
	public UISprite bg_sprite;

	// Token: 0x04000CFC RID: 3324
	public UISprite fill_sprite;

	// Token: 0x04000CFD RID: 3325
	public UILabel number_label;

	// Token: 0x04000CFE RID: 3326
	public string repulsor_bg = "repulsor level BG";

	// Token: 0x04000CFF RID: 3327
	public string gamma_bg = "gamma level BG";
}
