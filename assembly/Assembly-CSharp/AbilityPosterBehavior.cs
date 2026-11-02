using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002EF RID: 751
public class AbilityPosterBehavior : DetailsPanelBehavior
{
	// Token: 0x060013D2 RID: 5074 RVA: 0x0008ED0C File Offset: 0x0008CF0C
	protected override void cleanup()
	{
		Resources.UnloadAsset(this.large_portrait.mainTexture);
	}

	// Token: 0x060013D3 RID: 5075 RVA: 0x0008ED20 File Offset: 0x0008CF20
	public void show(AbilityDBItemClass data)
	{
		this.cleanup();
		this._data = data;
		this.large_portrait.mainTexture = Resources.Load<Texture>(this.portrait_prefix + data.id);
		this.deploy_icon.SetActive(data.slot == AbilityDBItemClass.slot_enum.Deploy);
		this.gesture_icon.SetActive(data.slot == AbilityDBItemClass.slot_enum.Gesture);
		this.name_label.text = data.name;
		this.description_label.text = data.description;
		this.instructions_label.text = "[91ffff]INSTRUCTIONS:[-]\n" + data.instructions;
		this.unlocked_label.text = data.unlock_text();
		this.level_widget.hide();
		this.sf_button.gameObject.SetActive(false);
		this.action_button.gameObject.SetActive(false);
		switch (data.unlock.type)
		{
		case AbilityDBItemClass.unlock_enum.level:
			this.level_widget.number_label.text = data.unlock.value;
			this.level_widget.set_gear_type(data.mola);
			this.level_widget.gameObject.SetActive(true);
			break;
		case AbilityDBItemClass.unlock_enum.sf:
			this.sf_button.set_id(data.unlock.value);
			this.sf_button.gameObject.SetActive(true);
			break;
		case AbilityDBItemClass.unlock_enum.action:
			this.action_button.set_id(data.unlock.value);
			this.action_button.gameObject.SetActive(true);
			break;
		}
		base.gameObject.SetActive(true);
		this.scrollView.ResetPosition();
		this.see_also.set_buttons(data.see_also);
		globals.sfx_master.play(this.show_sfx, null);
		ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
		scavenger_hunt_types type = scavenger_hunt_types.VIEW_DATABASE_ENTRY;
		List<string> list = new List<string>();
		list.Add("ability");
		list.Add(data.id);
		list.Add(data.slot.ToString());
		list.Add((!data.stun) ? string.Empty : "stun");
		list.Add(data.slot.ToString().ToLower());
		list.Add((!data.shield_break) ? string.Empty : "shield_break");
		scavenger_hunt_manager.do_action(type, list, 1);
	}

	// Token: 0x060013D4 RID: 5076 RVA: 0x0008EF90 File Offset: 0x0008D190
	protected override void Update()
	{
		base.Update();
		if (this.sf_button.clicked)
		{
			globals.poster_album.show(this.sf_button.data);
		}
		if (this.action_button.clicked)
		{
			globals.poster_album.show(this.action_button.data);
		}
		if (this.test_button.clicked)
		{
			globals.sfx_master.play(this.armory_sfx, null);
			if (globals.armory_main && globals.armory_main.mola() == this._data.mola)
			{
				this.close(false);
			}
			else
			{
				globals.ability_to_test = this._data;
				NavigationManager.load_scene(NavigationManager.armory_lobby_scene);
			}
		}
	}

	// Token: 0x04001590 RID: 5520
	public UITexture large_portrait;

	// Token: 0x04001591 RID: 5521
	public UILabel description_label;

	// Token: 0x04001592 RID: 5522
	public UILabel instructions_label;

	// Token: 0x04001593 RID: 5523
	public UILabel unlocked_label;

	// Token: 0x04001594 RID: 5524
	public GameObject deploy_icon;

	// Token: 0x04001595 RID: 5525
	public GameObject gesture_icon;

	// Token: 0x04001596 RID: 5526
	public LevelWidgetBehavior level_widget;

	// Token: 0x04001597 RID: 5527
	public DBItemButtonBehavior sf_button;

	// Token: 0x04001598 RID: 5528
	public DBItemButtonBehavior action_button;

	// Token: 0x04001599 RID: 5529
	public buttonBehavior test_button;

	// Token: 0x0400159A RID: 5530
	public string armory_sfx = "click forward";

	// Token: 0x0400159B RID: 5531
	private string portrait_prefix = "db portraits/ability/DBportrait_";

	// Token: 0x0400159C RID: 5532
	private AbilityDBItemClass _data;

	// Token: 0x0400159D RID: 5533
	public UIScrollView scrollView;
}
