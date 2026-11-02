using System;
using System.Collections.Generic;
using AnimationOrTween;
using UnityEngine;

// Token: 0x02000289 RID: 649
[AddComponentMenu("Scripts/Gear Menu/Scavenger Hunt Panel Behavior")]
public class ScavengerHuntPanelBehavior : MonoBehaviour
{
	// Token: 0x06001150 RID: 4432 RVA: 0x0007B70C File Offset: 0x0007990C
	private void Awake()
	{
		globals.scavenger_hunt_manager.panel = this;
		globals.hide_scavenger_hunt = new List<string>();
		this.slide_tp.PlayReverse();
	}

	// Token: 0x06001151 RID: 4433 RVA: 0x0007B73C File Offset: 0x0007993C
	private void Start()
	{
		this.setup();
	}

	// Token: 0x06001152 RID: 4434 RVA: 0x0007B744 File Offset: 0x00079944
	public bool showing()
	{
		return this.container.activeInHierarchy && this.slide_tp.tweenFactor > 0f;
	}

	// Token: 0x06001153 RID: 4435 RVA: 0x0007B76C File Offset: 0x0007996C
	public void start_scavenger_hunt()
	{
		globals.player_data.show_scavenger_hunt = true;
		this.container.SetActive(true);
		if (!this.slide_tp.enabled && this.slide_tp.direction == Direction.Reverse)
		{
			this.whole_screen_closer.gameObject.SetActive(true);
			this.slide_tp.Toggle();
			this.tab_sprite.flip = UIBasicSprite.Flip.Nothing;
			this.setup();
		}
	}

	// Token: 0x06001154 RID: 4436 RVA: 0x0007B7E0 File Offset: 0x000799E0
	public void update_items()
	{
		foreach (ScavengerHuntItemBehavior scavengerHuntItemBehavior in this.items)
		{
			if (scavengerHuntItemBehavior.gameObject.activeSelf)
			{
				scavengerHuntItemBehavior.update();
			}
		}
	}

	// Token: 0x06001155 RID: 4437 RVA: 0x0007B858 File Offset: 0x00079A58
	public void on_item_shifted_up()
	{
		this.waiting_for_items--;
		if (this.waiting_for_items <= 0)
		{
			this.setup();
			ScavengerHuntItemBehavior scavengerHuntItemBehavior = this.items[this.items.Count - 1];
			if (scavengerHuntItemBehavior.gameObject.activeSelf)
			{
				scavengerHuntItemBehavior.slide_in();
				this.input_blocker.SetActive(true);
			}
		}
	}

	// Token: 0x06001156 RID: 4438 RVA: 0x0007B8C0 File Offset: 0x00079AC0
	private string to_roman(int num)
	{
		switch (num)
		{
		case 1:
			return "I";
		case 2:
			return "II";
		case 3:
			return "III";
		case 4:
			return "IV";
		case 5:
			return "V";
		case 6:
			return "VI";
		case 7:
			return "VII";
		default:
			return string.Empty;
		}
	}

	// Token: 0x06001157 RID: 4439 RVA: 0x0007B92C File Offset: 0x00079B2C
	private void setup()
	{
		this.input_blocker.SetActive(false);
		this.waiting_for_items = 0;
		int num = 0;
		int num2 = 0;
		foreach (ScavengerHuntDataClass scavengerHuntDataClass in globals.scavenger_hunt_manager.items)
		{
			if (scavengerHuntDataClass.acknowledged)
			{
				num2++;
			}
			else if (num < globals.scavenger_hunt_manager.max_active)
			{
				ScavengerHuntItemBehavior scavengerHuntItemBehavior = this.items[num];
				scavengerHuntItemBehavior.setup(scavengerHuntDataClass, true);
				this.items[num].gameObject.SetActive(true);
				num++;
			}
		}
		for (int i = num; i < globals.scavenger_hunt_manager.max_active; i++)
		{
			this.items[i].gameObject.SetActive(false);
		}
		int num3 = num2 / 10;
		if (num3 > 0)
		{
			this.readiness_level_lbl.text = "Readiness Level " + this.to_roman(num3);
		}
		else
		{
			this.readiness_level_lbl.text = "Complete the AvengersNet app objectives to earn an achievement.";
		}
		if (num2 < globals.scavenger_hunt_manager.items.Count)
		{
			this.done_count_lbl.text = (num2 % 10).ToString() + "/10";
		}
		else
		{
			this.done_count_lbl.text = string.Empty;
		}
		AchievementEvents.ScavengerHuntUnlock scavengerHuntUnlock = null;
		foreach (AchievementEvents.UnlockCriteria unlockCriteria in AchievementEvents.inst.unlockCriterias)
		{
			if (unlockCriteria is AchievementEvents.ScavengerHuntUnlock)
			{
				AchievementEvents.ScavengerHuntUnlock scavengerHuntUnlock2 = (AchievementEvents.ScavengerHuntUnlock)unlockCriteria;
				if (num2 < scavengerHuntUnlock2.num_items && scavengerHuntUnlock2.num_items > num2)
				{
					scavengerHuntUnlock = scavengerHuntUnlock2;
					break;
				}
			}
		}
		this.achievement_icon.gameObject.SetActive(scavengerHuntUnlock != null);
		this.achievement_check.gameObject.SetActive(scavengerHuntUnlock == null);
		if (scavengerHuntUnlock != null)
		{
			AchievementItemClass achievementItemClass = globals.achievement_data.item_by_id(scavengerHuntUnlock.id);
			if (achievementItemClass)
			{
				this.achievement_icon.spriteName = "ACHIEVEMENT_" + achievementItemClass.id;
			}
		}
	}

	// Token: 0x06001158 RID: 4440 RVA: 0x0007BBC4 File Offset: 0x00079DC4
	public bool OpenOrOpening()
	{
		return this.whole_screen_closer.gameObject.activeInHierarchy;
	}

	// Token: 0x06001159 RID: 4441 RVA: 0x0007BBD8 File Offset: 0x00079DD8
	private void Update()
	{
		if (Application.isEditor && this.test)
		{
			globals.player_data.show_scavenger_hunt = true;
		}
		if (this.container.activeSelf != globals.player_data.show_scavenger_hunt)
		{
			this.container.SetActive(globals.player_data.show_scavenger_hunt);
			this.setup();
		}
		if (this.container.activeSelf && this.tab.clicked && !this.slide_tp.enabled)
		{
			this.slide_tp.Toggle();
			if (this.slide_tp.direction == Direction.Forward)
			{
				this.setup();
				if (globals.gear_daisy)
				{
					globals.gear_daisy.mode = GearDaisyBehavior.mode_enum.none;
				}
				this.whole_screen_closer.gameObject.SetActive(true);
				this.tab_sprite.flip = UIBasicSprite.Flip.Nothing;
				globals.sfx_master.play_sfx(this.open_sfx);
			}
			else
			{
				this.whole_screen_closer.gameObject.SetActive(false);
				this.tab_sprite.flip = UIBasicSprite.Flip.Horizontally;
				globals.sfx_master.play_sfx(this.close_sfx);
			}
		}
		if (this.whole_screen_closer.released && this.slide_tp.direction == Direction.Forward)
		{
			this.slide_tp.Toggle();
			this.whole_screen_closer.gameObject.SetActive(false);
			this.tab_sprite.flip = UIBasicSprite.Flip.Horizontally;
			globals.sfx_master.play_sfx(this.close_sfx);
		}
		int num = 0;
		foreach (ScavengerHuntItemBehavior scavengerHuntItemBehavior in this.items)
		{
			if (scavengerHuntItemBehavior.gameObject.activeSelf && scavengerHuntItemBehavior.done)
			{
				num++;
			}
		}
		this.alert_lbl.gameObject.SetActive(num > 0);
		this.alert_lbl.text = num.ToString();
	}

	// Token: 0x040011BE RID: 4542
	public GameObject container;

	// Token: 0x040011BF RID: 4543
	public buttonBehavior tab;

	// Token: 0x040011C0 RID: 4544
	public UISprite tab_sprite;

	// Token: 0x040011C1 RID: 4545
	public TweenPosition slide_tp;

	// Token: 0x040011C2 RID: 4546
	public List<ScavengerHuntItemBehavior> items;

	// Token: 0x040011C3 RID: 4547
	public UISprite achievement_icon;

	// Token: 0x040011C4 RID: 4548
	public UISprite achievement_check;

	// Token: 0x040011C5 RID: 4549
	public int waiting_for_items;

	// Token: 0x040011C6 RID: 4550
	public GameObject input_blocker;

	// Token: 0x040011C7 RID: 4551
	public buttonBehavior whole_screen_closer;

	// Token: 0x040011C8 RID: 4552
	public UILabel alert_lbl;

	// Token: 0x040011C9 RID: 4553
	public bool test;

	// Token: 0x040011CA RID: 4554
	public UILabel done_count_lbl;

	// Token: 0x040011CB RID: 4555
	public UILabel readiness_level_lbl;

	// Token: 0x040011CC RID: 4556
	public string open_sfx = "SideMenuOpen";

	// Token: 0x040011CD RID: 4557
	public string close_sfx = "SideMenuClose";

	// Token: 0x040011CE RID: 4558
	public string out_sfx = "SideMenuOut";

	// Token: 0x040011CF RID: 4559
	public string in_sfx = "SideMenuIn";
}
