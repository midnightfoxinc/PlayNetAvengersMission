using System;
using UnityEngine;

// Token: 0x020002C7 RID: 711
public class ProfileListAbilityItemBehavior : LabelledButtonBehavior
{
	// Token: 0x060012CD RID: 4813 RVA: 0x000866F0 File Offset: 0x000848F0
	public void set_data(AbilityDBItemClass d)
	{
		this._data = d;
		this.label.text = d.name;
		this.desc_label.text = d.description;
		this.unlocked_by_label.text = d.unlock_text();
		string text = globals.db_icon_prefix + d.icon;
		if (this.sprite.atlas.GetSprite(text) != null)
		{
			this.sprite.spriteName = text;
		}
		this.refresh();
	}

	// Token: 0x060012CE RID: 4814 RVA: 0x00086770 File Offset: 0x00084970
	public void refresh()
	{
		if (globals.player_data.has_unlock(this._data.id))
		{
			this.tint_sprite.color = new Color(0f, 0.5686275f, 0.42745098f);
			this.pressed_color = Color.white;
		}
		else
		{
			Color white = Color.white;
			white.a = 0.6f;
			this.tint_sprite.color = white;
			this.pressed_color = Color.black;
		}
		this.sprite.color = this.pressed_color;
		this._normal_color = this.pressed_color;
		this.disabled_color = this.pressed_color;
	}

	// Token: 0x060012CF RID: 4815 RVA: 0x00086818 File Offset: 0x00084A18
	public bool getAbilUnlocked()
	{
		return this._data != null && globals.player_data.has_unlock(this._data.id);
	}

	// Token: 0x060012D0 RID: 4816 RVA: 0x0008684C File Offset: 0x00084A4C
	public void show_poster()
	{
		if (globals.poster_album && this._data)
		{
			globals.poster_album.show(this._data);
		}
	}

	// Token: 0x040013C8 RID: 5064
	public UILabel desc_label;

	// Token: 0x040013C9 RID: 5065
	public UILabel unlocked_by_label;

	// Token: 0x040013CA RID: 5066
	public UISprite tint_sprite;

	// Token: 0x040013CB RID: 5067
	private AbilityDBItemClass _data;
}
