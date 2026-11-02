using System;
using UnityEngine;

// Token: 0x020002C9 RID: 713
public class ProfileListSFItemBehavior : LabelledButtonBehavior
{
	// Token: 0x060012D7 RID: 4823 RVA: 0x00086AB4 File Offset: 0x00084CB4
	public void set_data(SFDBItemClass d)
	{
		this._data = d;
		this.label.text = d.name;
		if (globals.BLE_manager.connectedDevice_data)
		{
			this.rewards_label.text = d.unlock_10(globals.BLE_manager.connectedDevice_data.deviceType);
		}
		else
		{
			this.rewards_label.text = d.unlock_10(Constants.PlaymationDeviceType.DEVICE_REPULSOR);
		}
		this.update_rep();
		DBItemClass dbitemClass = globals.database_data.item_by_id(d.id.ToString(), true);
		string text = globals.db_icon_prefix + dbitemClass.icon;
		if (this.sprite.atlas.GetSprite(text) != null)
		{
			this.sprite.spriteName = text;
		}
	}

	// Token: 0x060012D8 RID: 4824 RVA: 0x00086B78 File Offset: 0x00084D78
	public int getSFLevel()
	{
		int result = 0;
		if (this._data != null)
		{
			result = globals.player_data.getSFLevel(this._data.id);
		}
		return result;
	}

	// Token: 0x060012D9 RID: 4825 RVA: 0x00086BAC File Offset: 0x00084DAC
	private void set_rep_fill()
	{
		int sflevel = globals.player_data.getSFLevel(this._data.id);
		if (sflevel > 0)
		{
			this.level_label.text = sflevel.ToString() + "/10";
		}
		else
		{
			this.level_label.text = string.Empty;
		}
		if (globals.player_data.getSFRep(this._data.id) < 1)
		{
			this.fill_sprite.fillAmount = 0f;
		}
		else if (sflevel >= 10)
		{
			this.fill_sprite.fillAmount = 1f;
		}
		else
		{
			float num = (float)(globals.player_data.getSFRep(this._data.id) - globals.sf_xp_to_level[sflevel]);
			float num2 = (float)(globals.sf_xp_to_level[sflevel + 1] - globals.sf_xp_to_level[sflevel]);
			this.fill_sprite.fillAmount = num / num2;
		}
	}

	// Token: 0x060012DA RID: 4826 RVA: 0x00086C94 File Offset: 0x00084E94
	public void update_rep()
	{
		if (!this._data || !(this._data is SFDBItemClass) || !this.rep_label)
		{
			return;
		}
		int sflevel = globals.player_data.getSFLevel(this._data.id);
		this.rep_label.text = sflevel.ToString();
		this.rep_label.gameObject.SetActive(sflevel > 0);
		Color white = Color.white;
		white.a = 0.6f;
		this.tint_sprite.color = ((sflevel <= 0) ? white : new Color(0f, 0.5686275f, 0.42745098f));
		this.pressed_color = ((sflevel <= 0) ? Color.black : Color.white);
		this.sprite.color = this.pressed_color;
		this._normal_color = this.pressed_color;
		this.disabled_color = this.pressed_color;
		this.set_rep_fill();
	}

	// Token: 0x060012DB RID: 4827 RVA: 0x00086D98 File Offset: 0x00084F98
	public void show_poster()
	{
		if (globals.poster_album && this._data)
		{
			globals.poster_album.show(this._data);
		}
	}

	// Token: 0x040013D2 RID: 5074
	public UILabel rep_label;

	// Token: 0x040013D3 RID: 5075
	public UISprite fill_sprite;

	// Token: 0x040013D4 RID: 5076
	public UILabel rewards_label;

	// Token: 0x040013D5 RID: 5077
	public UILabel level_label;

	// Token: 0x040013D6 RID: 5078
	private SFDBItemClass _data;

	// Token: 0x040013D7 RID: 5079
	public UISprite tint_sprite;
}
