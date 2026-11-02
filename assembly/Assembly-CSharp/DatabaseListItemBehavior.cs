using System;

// Token: 0x020002A7 RID: 679
public class DatabaseListItemBehavior : LabelledButtonBehavior
{
	// Token: 0x0600125E RID: 4702 RVA: 0x00082600 File Offset: 0x00080800
	public void set_data(DBItemClass d)
	{
		this._data = d;
		this.label.text = d.name;
		this.class_lbl.text = string.Empty;
		if (d is SFDBItemClass || d is EnemyDBItemClass || d is HazardDBItemClass)
		{
			this.sprite.atlas = this.list.intel_atlas;
		}
		else
		{
			this.sprite.atlas = this.list.tech_atlas;
		}
		string text = globals.db_icon_prefix + d.icon;
		if (this.sprite.atlas.GetSprite(text) != null)
		{
			this.sprite.spriteName = text;
		}
		if (this.rep_label)
		{
			this.rep_label.gameObject.SetActive(false);
		}
		if (this._data is EnemyDBItemClass)
		{
			this.class_lbl.text = (this._data as EnemyDBItemClass).enemy_class;
		}
		if (this._data is HazardDBItemClass)
		{
			this.class_lbl.text = "UNSEEN HAZARD";
		}
		else if (this._data is SFDBItemClass)
		{
			this.update_rep();
			this.class_lbl.text = (this._data as SFDBItemClass).sf_class;
		}
		else if (this._data is ActionDBItemClass)
		{
			this.class_lbl.text = (this._data as ActionDBItemClass).action_step.Count.ToString() + " Steps";
		}
	}

	// Token: 0x0600125F RID: 4703 RVA: 0x000827A4 File Offset: 0x000809A4
	public void show_poster()
	{
		if (globals.poster_album && this._data)
		{
			globals.poster_album.show(this._data);
		}
	}

	// Token: 0x06001260 RID: 4704 RVA: 0x000827D8 File Offset: 0x000809D8
	private bool is_ability_for_mola(string mola_id)
	{
		return this._data && this._data is AbilityDBItemClass && (this._data as AbilityDBItemClass).mola == mola_id;
	}

	// Token: 0x06001261 RID: 4705 RVA: 0x00082820 File Offset: 0x00080A20
	private bool is_action_for_mola(string mola_id)
	{
		return this._data && this._data is ActionDBItemClass && (this._data as ActionDBItemClass).mola == mola_id;
	}

	// Token: 0x06001262 RID: 4706 RVA: 0x00082868 File Offset: 0x00080A68
	public void filter(DatabasePanelBehavior.mode_enum m)
	{
		if (!this._data)
		{
			base.gameObject.SetActive(false);
			return;
		}
		switch (m)
		{
		case DatabasePanelBehavior.mode_enum.heroes:
			if (this._data is SFDBItemClass)
			{
				base.gameObject.SetActive((this._data as SFDBItemClass).hero);
			}
			else
			{
				base.gameObject.SetActive(false);
			}
			break;
		case DatabasePanelBehavior.mode_enum.villains:
			if (this._data is SFDBItemClass)
			{
				base.gameObject.SetActive(!(this._data as SFDBItemClass).hero);
			}
			else
			{
				base.gameObject.SetActive(false);
			}
			break;
		case DatabasePanelBehavior.mode_enum.enemies:
			if (this._data is EnemyDBItemClass)
			{
				base.gameObject.SetActive(true);
			}
			else
			{
				base.gameObject.SetActive(false);
			}
			break;
		case DatabasePanelBehavior.mode_enum.hazard:
			base.gameObject.SetActive(this._data is HazardDBItemClass);
			break;
		case DatabasePanelBehavior.mode_enum.repulsor_actions:
			base.gameObject.SetActive(this.is_action_for_mola("2101"));
			break;
		case DatabasePanelBehavior.mode_enum.repulsor_abilities:
			base.gameObject.SetActive(this.is_ability_for_mola("2101"));
			break;
		case DatabasePanelBehavior.mode_enum.gamma_actions:
			base.gameObject.SetActive(this.is_action_for_mola("2111"));
			break;
		case DatabasePanelBehavior.mode_enum.gamma_abilities:
			base.gameObject.SetActive(this.is_ability_for_mola("2111"));
			break;
		}
	}

	// Token: 0x06001263 RID: 4707 RVA: 0x00082A00 File Offset: 0x00080C00
	public void update_rep()
	{
		if (!this._data || !(this._data is SFDBItemClass) || !this.rep_label)
		{
			return;
		}
		int sflevel = globals.player_data.getSFLevel(this._data.id);
		this.rep_label.text = sflevel.ToString();
		this.rep_label.gameObject.SetActive(sflevel > 0);
	}

	// Token: 0x040012E6 RID: 4838
	public UILabel rep_label;

	// Token: 0x040012E7 RID: 4839
	public UILabel class_lbl;

	// Token: 0x040012E8 RID: 4840
	internal DatabaseListBehavior list;

	// Token: 0x040012E9 RID: 4841
	private DBItemClass _data;
}
