using System;
using System.Collections.Generic;

// Token: 0x020002A8 RID: 680
public class DatabasePanelBehavior : HQMenuPanelBehavior
{
	// Token: 0x17000227 RID: 551
	// (get) Token: 0x06001265 RID: 4709 RVA: 0x00082A84 File Offset: 0x00080C84
	public bool dragging
	{
		get
		{
			return this._dragging;
		}
	}

	// Token: 0x06001266 RID: 4710 RVA: 0x00082A8C File Offset: 0x00080C8C
	private void set_mode(DatabasePanelBehavior.mode_enum m)
	{
		for (int i = 0; i < this.option.Count; i++)
		{
			this.option[i].select(m == this.option[i].mode);
		}
		this.data_list.filter(m);
	}

	// Token: 0x06001267 RID: 4711 RVA: 0x00082AE8 File Offset: 0x00080CE8
	private void Start()
	{
		this.data_list.database_panel = this;
		this.data_list.init();
		for (int i = 0; i < this.option.Count; i++)
		{
			this.option[i].database_panel = this;
		}
		this.set_mode(DatabasePanelBehavior.mode_enum.heroes);
		this.data_list.gameObject.SetActive(true);
		for (int j = 0; j < this.category.Count; j++)
		{
			if (j == 0)
			{
				this.category[j].open(true);
			}
			else
			{
				this.category[j].close(true);
			}
		}
		this.log_from = NavigationManager.database_panel;
	}

	// Token: 0x06001268 RID: 4712 RVA: 0x00082BA8 File Offset: 0x00080DA8
	public override void show(bool b)
	{
		base.show(b);
		if (b && globals.new_sf_level.Count > 0)
		{
			this.rep_up_panel.show();
			this.data_list.update_all_reps();
		}
		else
		{
			this.rep_up_panel.gameObject.SetActive(false);
		}
		if (b)
		{
			ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
			scavenger_hunt_types type = scavenger_hunt_types.VIEW_SCENE;
			List<string> list = new List<string>();
			list.Add("database");
			scavenger_hunt_manager.do_action(type, list, 1);
		}
	}

	// Token: 0x06001269 RID: 4713 RVA: 0x00082C24 File Offset: 0x00080E24
	private bool category_tweening()
	{
		for (int i = 0; i < this.category.Count; i++)
		{
			if (this.category[i].tweening)
			{
				return true;
			}
		}
		return false;
	}

	// Token: 0x0600126A RID: 4714 RVA: 0x00082C68 File Offset: 0x00080E68
	private void option_check()
	{
		if (this._dragging || this.category_tweening())
		{
			return;
		}
		for (int i = 0; i < this.option.Count; i++)
		{
			if (this.option[i].released)
			{
				this.set_mode(this.option[i].mode);
			}
		}
		for (int j = 0; j < this.category.Count; j++)
		{
			if (this.category[j].released)
			{
				this.set_mode(this.category[j].mode);
				this.category[j].open(false);
				for (int k = 0; k < this.category.Count; k++)
				{
					if (j != k)
					{
						this.category[k].close(false);
					}
				}
			}
		}
	}

	// Token: 0x0600126B RID: 4715 RVA: 0x00082D68 File Offset: 0x00080F68
	protected override void Update()
	{
		if (this.scroll_view && this.scroll_view.isDragging)
		{
			this._dragging = true;
		}
		else if (this.data_list.dragging)
		{
			this._dragging = true;
		}
		else if (this.rep_up_panel.gameObject.activeInHierarchy)
		{
			this._dragging = true;
		}
		this.option_check();
		base.Update();
	}

	// Token: 0x040012EA RID: 4842
	public RepUpPanelBehavior rep_up_panel;

	// Token: 0x040012EB RID: 4843
	public UISprite selection_pointer;

	// Token: 0x040012EC RID: 4844
	public List<DatabasePanelOptionBehavior> option;

	// Token: 0x040012ED RID: 4845
	public List<DatabaseCategoryBehavior> category;

	// Token: 0x040012EE RID: 4846
	public DatabaseListBehavior data_list;

	// Token: 0x020002A9 RID: 681
	public enum category_enum
	{
		// Token: 0x040012F0 RID: 4848
		intel,
		// Token: 0x040012F1 RID: 4849
		video,
		// Token: 0x040012F2 RID: 4850
		tech
	}

	// Token: 0x020002AA RID: 682
	public enum mode_enum
	{
		// Token: 0x040012F4 RID: 4852
		heroes,
		// Token: 0x040012F5 RID: 4853
		villains,
		// Token: 0x040012F6 RID: 4854
		enemies,
		// Token: 0x040012F7 RID: 4855
		hazard,
		// Token: 0x040012F8 RID: 4856
		repulsor_actions,
		// Token: 0x040012F9 RID: 4857
		repulsor_abilities,
		// Token: 0x040012FA RID: 4858
		gamma_actions,
		// Token: 0x040012FB RID: 4859
		gamma_abilities
	}
}
