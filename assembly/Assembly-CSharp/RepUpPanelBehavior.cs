using System;
using UnityEngine;

// Token: 0x020002DB RID: 731
public class RepUpPanelBehavior : MonoBehaviour
{
	// Token: 0x06001346 RID: 4934 RVA: 0x00089864 File Offset: 0x00087A64
	public void show()
	{
		base.gameObject.SetActive(true);
		this.current_sf = 0;
		this.display();
	}

	// Token: 0x06001347 RID: 4935 RVA: 0x00089880 File Offset: 0x00087A80
	private void display()
	{
		if (globals.new_sf_level.Count > 0)
		{
			SFDBItemClass sfdbitemClass = globals.database_data.item_by_id(globals.new_sf_level[this.current_sf].sf.ToString(), true) as SFDBItemClass;
			if (this.name_label)
			{
				this.name_label.text = sfdbitemClass.name;
			}
			if (sfdbitemClass.hero)
			{
				this.bg_outline.color = this.hero_bg_color;
			}
			else
			{
				this.bg_outline.color = this.villain_bg_color;
			}
			int level = globals.new_sf_level[this.current_sf].level;
			this.portrait.mainTexture = Resources.Load<Texture>(this.portrait_prefix + sfdbitemClass.id);
			DBItemClass dbitemClass;
			if (globals.BLE_manager.connectedDevice_data)
			{
				this.ability_button.set_id(sfdbitemClass.ability(globals.BLE_manager.connectedDevice_data.deviceType));
				this.level_widget.set_level(level, 0f, (int)globals.BLE_manager.connectedDevice_data.deviceType);
				this.set_colors(globals.BLE_manager.connectedDevice_data.deviceType);
				dbitemClass = globals.database_data.item_by_id(sfdbitemClass.ability(globals.BLE_manager.connectedDevice_data.deviceType), true);
			}
			else
			{
				this.ability_button.set_id(sfdbitemClass.ability(Constants.PlaymationDeviceType.DEVICE_REPULSOR));
				this.level_widget.set_level(level, 0f, 2101);
				this.set_colors(Constants.PlaymationDeviceType.DEVICE_REPULSOR);
				dbitemClass = globals.database_data.item_by_id(sfdbitemClass.ability(Constants.PlaymationDeviceType.DEVICE_REPULSOR), true);
			}
			if (!this.ability_button.data)
			{
				this.ability_button.sprite.spriteName = string.Empty;
			}
			if (level < 10)
			{
				if (dbitemClass)
				{
					this.description_label.text = "At level 10 you receive " + dbitemClass.name.ToUpper() + ":";
				}
				else
				{
					this.description_label.text = "At level 10 you receive:";
				}
			}
			else if (globals.BLE_manager.connectedDevice_data && globals.BLE_manager.connectedDevice_data.deviceType == Constants.PlaymationDeviceType.DEVICE_HULKHAND)
			{
				this.description_label.text = "LEVEL MAX! Finishing move unlocked!";
			}
			else
			{
				this.description_label.text = "LEVEL MAX! Ability unlocked!";
			}
			if (!this._level_texture_tween)
			{
				this._level_texture_tween = this.level_widget.GetComponent<UITweener>();
			}
			this._level_texture_tween.ResetToBeginning();
			this._level_texture_tween.PlayForward();
			this.prev_btn.gameObject.SetActive(this.current_sf > 0);
			this.next_btn.gameObject.SetActive(this.current_sf < globals.new_sf_level.Count - 1);
			this.next_btn_lbl.text = (globals.new_sf_level.Count - this.current_sf - 1).ToString();
			this.prev_btn_lbl.text = this.current_sf.ToString();
		}
		else
		{
			this.close();
		}
	}

	// Token: 0x06001348 RID: 4936 RVA: 0x00089BB8 File Offset: 0x00087DB8
	private void set_colors(Constants.PlaymationDeviceType type)
	{
		if (type == Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			this.glow.color = this.gamma_bg_color;
		}
		else
		{
			this.glow.color = this.repulsor_bg_color;
		}
	}

	// Token: 0x06001349 RID: 4937 RVA: 0x00089BF8 File Offset: 0x00087DF8
	private void close()
	{
		globals.new_sf_level.Clear();
		base.gameObject.SetActive(false);
		globals.sfx_master.play(this.close_sfx, null);
	}

	// Token: 0x0600134A RID: 4938 RVA: 0x00089C2C File Offset: 0x00087E2C
	private void Update()
	{
		if (this.ok_btn.clicked)
		{
			this.close();
		}
		else if (this.ability_button.clicked)
		{
			globals.poster_album.show(this.ability_button.data);
		}
		else if (this.prev_btn.clicked && this.current_sf > 0)
		{
			this.current_sf--;
			this.display();
		}
		else if (this.next_btn.clicked && this.current_sf < globals.new_sf_level.Count - 1)
		{
			this.current_sf++;
			this.display();
		}
	}

	// Token: 0x04001482 RID: 5250
	public buttonBehavior ok_btn;

	// Token: 0x04001483 RID: 5251
	public UITexture portrait;

	// Token: 0x04001484 RID: 5252
	public UILabel name_label;

	// Token: 0x04001485 RID: 5253
	public UILabel description_label;

	// Token: 0x04001486 RID: 5254
	public UISprite bg_outline;

	// Token: 0x04001487 RID: 5255
	public UISprite glow;

	// Token: 0x04001488 RID: 5256
	public DBItemButtonBehavior ability_button;

	// Token: 0x04001489 RID: 5257
	public Color hero_bg_color = Color.blue;

	// Token: 0x0400148A RID: 5258
	public Color villain_bg_color = Color.red;

	// Token: 0x0400148B RID: 5259
	public Color repulsor_bg_color = Color.red;

	// Token: 0x0400148C RID: 5260
	public Color gamma_bg_color = Color.green;

	// Token: 0x0400148D RID: 5261
	public Color shield_bg_color = Color.blue;

	// Token: 0x0400148E RID: 5262
	public buttonBehavior prev_btn;

	// Token: 0x0400148F RID: 5263
	public buttonBehavior next_btn;

	// Token: 0x04001490 RID: 5264
	public string advance_sfx = "advance";

	// Token: 0x04001491 RID: 5265
	public string close_sfx = "db hide";

	// Token: 0x04001492 RID: 5266
	public int current_sf;

	// Token: 0x04001493 RID: 5267
	private UITweener _level_texture_tween;

	// Token: 0x04001494 RID: 5268
	public LevelWidgetBehavior level_widget;

	// Token: 0x04001495 RID: 5269
	public UILabel next_btn_lbl;

	// Token: 0x04001496 RID: 5270
	public UILabel prev_btn_lbl;

	// Token: 0x04001497 RID: 5271
	private string portrait_prefix = "db portraits/SF/DBportrait_";
}
