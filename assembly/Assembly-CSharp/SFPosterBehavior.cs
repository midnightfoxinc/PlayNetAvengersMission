using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002F6 RID: 758
public class SFPosterBehavior : DetailsPanelBehavior
{
	// Token: 0x060013EF RID: 5103 RVA: 0x0008F95C File Offset: 0x0008DB5C
	private float rep_fill()
	{
		int sflevel = globals.player_data.getSFLevel(this._data.id);
		if (globals.player_data.getSFRep(this._data.id) < 1)
		{
			return 0f;
		}
		if (sflevel >= 10)
		{
			return 1f;
		}
		float num = (float)(globals.player_data.getSFRep(this._data.id) - globals.sf_xp_to_level[sflevel]);
		float num2 = (float)(globals.sf_xp_to_level[sflevel + 1] - globals.sf_xp_to_level[sflevel]);
		return num / num2;
	}

	// Token: 0x060013F0 RID: 5104 RVA: 0x0008F9E4 File Offset: 0x0008DBE4
	protected override void cleanup()
	{
		Resources.UnloadAsset(this.large_portrait.mainTexture);
		Resources.UnloadAsset(this.bg.mainTexture);
	}

	// Token: 0x060013F1 RID: 5105 RVA: 0x0008FA14 File Offset: 0x0008DC14
	public void show(SFDBItemClass d)
	{
		this.cleanup();
		this._data = d;
		this.name_label.text = d.name + ": " + d.sf_class;
		this.large_portrait.mainTexture = Resources.Load<Texture>(this.portrait_prefix + d.id);
		if (this.bio_label)
		{
			this.bio_label.text = d.bio;
		}
		if (d.is_real_SF())
		{
			this.ability_container.SetActive(true);
			this.base_attack_label.text = d.attack;
			this.repulsor_10_label.text = d.unlock_10(Constants.PlaymationDeviceType.DEVICE_REPULSOR);
			this.gamma_10_label.text = d.unlock_10(Constants.PlaymationDeviceType.DEVICE_HULKHAND);
			DBItemClass dbitemClass = globals.database_data.item_by_id(d.ability(Constants.PlaymationDeviceType.DEVICE_REPULSOR), true);
			if (dbitemClass)
			{
				this.l10_ability_repulsor.set_id(dbitemClass.id);
			}
			dbitemClass = globals.database_data.item_by_id(d.ability(Constants.PlaymationDeviceType.DEVICE_HULKHAND), true);
			if (dbitemClass)
			{
				this.l10_ability_gamma.set_id(dbitemClass.id);
			}
		}
		else
		{
			this.ability_container.SetActive(false);
		}
		if (globals.player_data.getSFLevel(d.id) >= 0)
		{
			int sflevel = globals.player_data.getSFLevel(d.id);
			int gear_type = 0;
			if (globals.player_data.latest_device_data)
			{
				gear_type = globals.player_data.latest_device_data.type;
			}
			this.rep_widget.set_level(sflevel, this.rep_fill(), gear_type);
		}
		else
		{
			this.rep_widget.hide();
		}
		this.bg.mainTexture = Resources.Load<Texture>("db details bgs/" + d.bg);
		this.store_button_container.SetActive(globals.environment_manager.enableStore && globals.store_data.item_by_id(d.id, false));
		base.gameObject.SetActive(true);
		this.see_also.set_buttons(d.see_also);
		globals.sfx_master.play(this.show_sfx, null);
		ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
		scavenger_hunt_types type = scavenger_hunt_types.VIEW_DATABASE_ENTRY;
		List<string> list = new List<string>();
		list.Add(d.id);
		list.Add(d.item_type.ToString());
		list.Add(d.sf_class);
		list.Add((!d.hero) ? "enemy" : "hero");
		scavenger_hunt_manager.do_action(type, list, 1);
		this.table.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x060013F2 RID: 5106 RVA: 0x0008FCC4 File Offset: 0x0008DEC4
	protected override void Update()
	{
		base.Update();
		if (this.store_button.clicked)
		{
			globals.store_item_id = this._data.id;
			globals.sfx_master.play(this.store_sfx, null);
			NavigationManager.load_scene(NavigationManager.store_scene);
			DMOManager.LogNavigation(NavigationManager.store_item_panel, "database_store_btn", "database_poster", this._data.id);
		}
		if (this.l10_ability_repulsor && this.l10_ability_repulsor.clicked && this.l10_ability_repulsor.data)
		{
			globals.poster_album.show(this.l10_ability_repulsor.data);
		}
		if (this.l10_ability_gamma && this.l10_ability_gamma.clicked && this.l10_ability_gamma.data)
		{
			globals.poster_album.show(this.l10_ability_gamma.data);
		}
	}

	// Token: 0x040015B9 RID: 5561
	public UITexture bg;

	// Token: 0x040015BA RID: 5562
	public UITexture large_portrait;

	// Token: 0x040015BB RID: 5563
	public buttonBehavior store_button;

	// Token: 0x040015BC RID: 5564
	public GameObject store_button_container;

	// Token: 0x040015BD RID: 5565
	public UILabel bio_label;

	// Token: 0x040015BE RID: 5566
	public GameObject ability_container;

	// Token: 0x040015BF RID: 5567
	public UILabel base_attack_label;

	// Token: 0x040015C0 RID: 5568
	public UILabel repulsor_10_label;

	// Token: 0x040015C1 RID: 5569
	public UILabel gamma_10_label;

	// Token: 0x040015C2 RID: 5570
	public DBItemButtonBehavior l10_ability_repulsor;

	// Token: 0x040015C3 RID: 5571
	public DBItemButtonBehavior l10_ability_gamma;

	// Token: 0x040015C4 RID: 5572
	public LevelWidgetBehavior rep_widget;

	// Token: 0x040015C5 RID: 5573
	public UITable table;

	// Token: 0x040015C6 RID: 5574
	public UIScrollView scroll_view;

	// Token: 0x040015C7 RID: 5575
	public string store_sfx = "SFX_BackButton";

	// Token: 0x040015C8 RID: 5576
	private string portrait_prefix = "db portraits/SF/DBportrait_";

	// Token: 0x040015C9 RID: 5577
	private SFDBItemClass _data;
}
