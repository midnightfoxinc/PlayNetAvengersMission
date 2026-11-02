using System;
using UnityEngine;

// Token: 0x020002AE RID: 686
public class MissionButtonBehavior : buttonBehavior
{
	// Token: 0x06001274 RID: 4724 RVA: 0x00082F68 File Offset: 0x00081168
	public void set_data(missionDataClass d)
	{
		this.data = d;
		if (d.rated)
		{
			UIAtlas uiatlas = Resources.Load<UIAtlas>(this.atlas_name_prefix + d.location.id);
			if (uiatlas)
			{
				this.sprite.atlas = uiatlas;
			}
			else
			{
				globals.debugWarning("can't find atlas at: " + this.atlas_name_prefix + d.location.id);
			}
			this.sprite.spriteName = this.cover_sprite_prefix + d.id.ToString();
			base.gameObject.SetActive(true);
			if (!d.unlocked())
			{
				this._normal_color.a = 0.4f;
				this.medal_sprite.gameObject.SetActive(false);
			}
			else
			{
				this._normal_color.a = 1f;
				int num = globals.player_data.get_grade(d.id);
				if (num > 0 && globals.player_data.latest_device_data)
				{
					if (globals.environment_manager.useMedals)
					{
						this.medal_sprite.spriteName = globals.medal_spritename(num);
					}
					this.medal_sprite.gameObject.SetActive(true);
				}
				else
				{
					this.medal_sprite.gameObject.SetActive(false);
				}
			}
			missionDataClass missionDataClass = globals.location_data.alert_mission();
			if (missionDataClass && missionDataClass.id == this.data.id)
			{
				this.alert.SetActive(true);
				this.medal_sprite.gameObject.SetActive(false);
			}
			else
			{
				this.alert.SetActive(false);
			}
			if (this.label)
			{
				this.label.text = d.name;
			}
			return;
		}
		base.gameObject.SetActive(false);
	}

	// Token: 0x04001306 RID: 4870
	public UILabel label;

	// Token: 0x04001307 RID: 4871
	public UISprite medal_sprite;

	// Token: 0x04001308 RID: 4872
	public string atlas_name_prefix = "mission cover atlas/mission cover atlas ";

	// Token: 0x04001309 RID: 4873
	public string cover_sprite_prefix = "cover_";

	// Token: 0x0400130A RID: 4874
	public string medal_sprite_prefix = "medal_";

	// Token: 0x0400130B RID: 4875
	public missionDataClass data;

	// Token: 0x0400130C RID: 4876
	public GameObject alert;
}
