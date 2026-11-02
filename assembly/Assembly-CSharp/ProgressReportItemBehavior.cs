using System;
using UnityEngine;

// Token: 0x020002D1 RID: 721
[AddComponentMenu("Scripts/Progress Report/Progress Report Item Behavior")]
public class ProgressReportItemBehavior : MonoBehaviour
{
	// Token: 0x06001305 RID: 4869 RVA: 0x00087AC4 File Offset: 0x00085CC4
	private void Start()
	{
	}

	// Token: 0x06001306 RID: 4870 RVA: 0x00087AC8 File Offset: 0x00085CC8
	private void Awake()
	{
	}

	// Token: 0x06001307 RID: 4871 RVA: 0x00087ACC File Offset: 0x00085CCC
	public void setup_location(ProgressReportPanelBehavior pPanel, locationDataItemClass pLDIC)
	{
		this.type = ProgressReportItemBehavior.eProgressReportType.LOCATION;
		this.location_icon.spriteName = "loc_title_" + pLDIC.id;
		this.title_lbl.text = "LOCATION UNLOCKED!";
		this.message_lbl.text = "You have unlocked " + pLDIC.name;
		this.setup(pPanel);
	}

	// Token: 0x06001308 RID: 4872 RVA: 0x00087B30 File Offset: 0x00085D30
	public void setup_mission(ProgressReportPanelBehavior pPanel, missionSummaryClass pMSC)
	{
		this.type = ProgressReportItemBehavior.eProgressReportType.MISSION;
		locationDataItemClass locationDataItemClass = globals.location_data.location_of_mission(pMSC.mission);
		if (locationDataItemClass != null)
		{
			UIAtlas uiatlas = Resources.Load<UIAtlas>(this.atlas_name_prefix + locationDataItemClass.id);
			if (uiatlas)
			{
				this.mission_icon.atlas = uiatlas;
			}
			else
			{
				globals.debugWarning("can't find atlas at: " + this.atlas_name_prefix + locationDataItemClass.id);
			}
		}
		this.mission_icon.spriteName = this.cover_sprite_prefix + pMSC.mission.ToString();
		if (globals.environment_manager.useMedals)
		{
			this.mission_star_icon.spriteName = globals.medal_spritename(pMSC.grade);
			this.banner_star_icon.spriteName = this.mission_star_icon.spriteName;
		}
		missionDataClass missionDataClass = globals.location_data.mission_by_id(pMSC.mission);
		if (missionDataClass)
		{
			this.title_lbl.text = "MISSION COMPLETE!";
			this.message_lbl.text = "You have completed " + missionDataClass.name + ".";
		}
		this.setup(pPanel);
	}

	// Token: 0x06001309 RID: 4873 RVA: 0x00087C58 File Offset: 0x00085E58
	public void setup_level(ProgressReportPanelBehavior pPanel)
	{
		this.type = ProgressReportItemBehavior.eProgressReportType.LEVEL;
		this.starting_xp = globals.previous_xp;
		this.current_xp = globals.current_xp;
		int level = globals.gear_level_from_xp(this.current_xp);
		int gear_type = 0;
		if (globals.player_data.latest_device_data)
		{
			gear_type = globals.player_data.latest_device_data.type;
		}
		this.level_widget.set_level(level, globals.gear_xp_to_fill(this.current_xp), gear_type);
		this.title_lbl.text = "LEVEL UP!";
		this.message_lbl.text = "Your current level is " + level.ToString() + ".";
		this.setup(pPanel);
	}

	// Token: 0x0600130A RID: 4874 RVA: 0x00087D04 File Offset: 0x00085F04
	public void setup_ability(ProgressReportPanelBehavior pPanel, string pAbility)
	{
		this.type = ProgressReportItemBehavior.eProgressReportType.ABILITY;
		DBItemClass dbitemClass = globals.database_data.item_by_id(pAbility, true);
		this.icon_name = dbitemClass.icon;
		this.ability_icon.spriteName = globals.db_icon_prefix + dbitemClass.icon;
		if (globals.BLE_manager.connectedDevice_data && globals.BLE_manager.connectedDevice_data.deviceType == Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			this.title_lbl.text = "FINISHING MOVE UNLOCKED!";
		}
		else
		{
			this.title_lbl.text = "ABILITY UNLOCKED!";
		}
		this.message_lbl.text = "You have unlocked " + dbitemClass.name + ".";
		this.setup(pPanel);
	}

	// Token: 0x0600130B RID: 4875 RVA: 0x00087DC8 File Offset: 0x00085FC8
	public void setup_achievement(ProgressReportPanelBehavior pPanel, string pAchievement)
	{
		this.type = ProgressReportItemBehavior.eProgressReportType.ACHIEVEMENT;
		AchievementItemClass achievementItemClass = globals.achievement_data.item_by_id(pAchievement);
		if (achievementItemClass)
		{
			this.achievement_sprite.spriteName = "ACHIEVEMENT_" + pAchievement;
			this.title_lbl.text = "ACHIEVEMENT COMPLETED!";
			this.message_lbl.text = achievementItemClass.name;
		}
		this.setup(pPanel);
	}

	// Token: 0x0600130C RID: 4876 RVA: 0x00087E34 File Offset: 0x00086034
	public void setup_reputation(ProgressReportPanelBehavior pPanel, SFRepClass pRep)
	{
		this.type = ProgressReportItemBehavior.eProgressReportType.REPUTATION;
		this.sf_rep = pRep;
		this.set_rep_fill();
		DBItemClass dbitemClass = globals.database_data.item_by_id(pRep.sf.ToString(), true);
		this.reputation_icon.spriteName = globals.db_icon_prefix + dbitemClass.icon;
		this.title_lbl.text = "REPUTATION INCREASE!";
		this.message_lbl.text = dbitemClass.name + " has gained " + (this.sf_rep.xp - this.sf_rep.prev_xp).ToString() + " reputation points.";
		this.setup(pPanel);
	}

	// Token: 0x0600130D RID: 4877 RVA: 0x00087EE0 File Offset: 0x000860E0
	private void setup(ProgressReportPanelBehavior pPanel)
	{
		this.panel = pPanel;
		this.level_widget.gameObject.SetActive(this.type == ProgressReportItemBehavior.eProgressReportType.LEVEL);
		this.mission_icon.gameObject.SetActive(this.type == ProgressReportItemBehavior.eProgressReportType.MISSION);
		this.ability_icon.gameObject.SetActive(this.type == ProgressReportItemBehavior.eProgressReportType.ABILITY);
		this.message_icon.gameObject.SetActive(this.type == ProgressReportItemBehavior.eProgressReportType.MESSAGE);
		this.location_icon.gameObject.SetActive(this.type == ProgressReportItemBehavior.eProgressReportType.LOCATION);
		this.reputation_icon.gameObject.SetActive(this.type == ProgressReportItemBehavior.eProgressReportType.REPUTATION);
		this.achievement_sprite.gameObject.SetActive(this.type == ProgressReportItemBehavior.eProgressReportType.ACHIEVEMENT);
	}

	// Token: 0x0600130E RID: 4878 RVA: 0x00087FA4 File Offset: 0x000861A4
	private void Update()
	{
		if (this.delay_time >= 0f)
		{
			this.delay_time += Time.deltaTime;
		}
		if (this.slider_sprite.gameObject.activeSelf)
		{
			if (this.slider_tp.enabled)
			{
				this.item_panel.clipOffset = new Vector2(Mathf.Min(0f, -this.item_panel.baseClipRegion.z + (float)(this.slider_sprite.width / 2) + (this.slider_sprite.transform.localPosition.x - this.slider_tp.from.x)), 0f);
			}
			else
			{
				this.item_panel.clipOffset = new Vector2(0f, 0f);
				this.delay_time = 0f;
				this.slider_sprite.gameObject.SetActive(false);
			}
		}
		if (this.delay_time >= this.delay_next)
		{
			this.panel.show_next_item();
			this.delay_time = -1f;
		}
	}

	// Token: 0x0600130F RID: 4879 RVA: 0x000880C8 File Offset: 0x000862C8
	public float getBannerHeight()
	{
		Bounds bounds = NGUIMath.CalculateRelativeWidgetBounds(this.main_holder, true);
		Vector3 localScale = this.main_holder.localScale;
		bounds.min = Vector3.Scale(bounds.min, localScale);
		bounds.max = Vector3.Scale(bounds.max, localScale);
		return bounds.size.y;
	}

	// Token: 0x06001310 RID: 4880 RVA: 0x00088128 File Offset: 0x00086328
	private void set_rep_fill()
	{
		int num = this.sf_rep.xp;
		int num2 = 1;
		for (int i = 0; i < globals.sf_xp_to_level.Length; i++)
		{
			if (globals.sf_xp_to_level[i] > this.sf_rep.xp)
			{
				break;
			}
			num2 = i;
		}
		num -= globals.sf_xp_to_level[num2];
		int num3;
		if (num2 < globals.sf_xp_to_level.Length - 1)
		{
			num3 = globals.sf_xp_to_level[num2 + 1] - globals.sf_xp_to_level[num2];
		}
		else
		{
			num3 = globals.sf_xp_to_level[num2];
			num = num3;
		}
		if (num > num3)
		{
			num = num3;
		}
		this.rep_fill_sprite.fillAmount = (float)num / (float)num3;
		this.rep_level_lbl.text = globals.sf_level_from_xp(this.sf_rep.xp).ToString();
	}

	// Token: 0x06001311 RID: 4881 RVA: 0x000881F4 File Offset: 0x000863F4
	public void startSlider()
	{
		this.main_holder.gameObject.SetActive(true);
		this.slider_sprite.gameObject.SetActive(true);
		this.slider_tp.enabled = true;
	}

	// Token: 0x06001312 RID: 4882 RVA: 0x00088230 File Offset: 0x00086430
	public void snap()
	{
		this.main_holder.gameObject.SetActive(true);
		this.slider_sprite.gameObject.SetActive(false);
		this.slider_sprite.transform.localPosition = this.slider_tp.to;
		this.slider_tp.enabled = false;
		this.item_panel.clipOffset = new Vector2(Mathf.Min(0f, -this.item_panel.baseClipRegion.z + (float)(this.slider_sprite.width / 2) + (this.slider_sprite.transform.localPosition.x - this.slider_tp.from.x)), 0f);
	}

	// Token: 0x06001313 RID: 4883 RVA: 0x000882F4 File Offset: 0x000864F4
	public void play()
	{
		base.gameObject.SetActive(true);
		this.main_holder.gameObject.SetActive(false);
		this.slider_sprite.gameObject.SetActive(false);
		switch (this.type)
		{
		case ProgressReportItemBehavior.eProgressReportType.MISSION:
			this.panel.show_mission(this);
			break;
		case ProgressReportItemBehavior.eProgressReportType.LEVEL:
			this.panel.show_level_up(this, this.starting_xp, this.current_xp);
			break;
		case ProgressReportItemBehavior.eProgressReportType.ABILITY:
			this.panel.show_ability(this);
			break;
		case ProgressReportItemBehavior.eProgressReportType.MESSAGE:
			this.panel.show_message(this);
			break;
		case ProgressReportItemBehavior.eProgressReportType.LOCATION:
			this.panel.show_location(this);
			break;
		case ProgressReportItemBehavior.eProgressReportType.ACHIEVEMENT:
			this.panel.show_achievement(this);
			break;
		case ProgressReportItemBehavior.eProgressReportType.REPUTATION:
			this.panel.show_reputation(this);
			break;
		default:
			this.startSlider();
			this.panel.pushDownItems(this.getBannerHeight(), base.transform);
			break;
		}
	}

	// Token: 0x0400140A RID: 5130
	public UISprite slider_sprite;

	// Token: 0x0400140B RID: 5131
	public TweenPosition slider_tp;

	// Token: 0x0400140C RID: 5132
	public UIPanel item_panel;

	// Token: 0x0400140D RID: 5133
	public LevelWidgetBehavior level_widget;

	// Token: 0x0400140E RID: 5134
	public UISprite mission_icon;

	// Token: 0x0400140F RID: 5135
	public UISprite mission_star_icon;

	// Token: 0x04001410 RID: 5136
	public UISprite banner_star_icon;

	// Token: 0x04001411 RID: 5137
	public UISprite ability_icon;

	// Token: 0x04001412 RID: 5138
	public UISprite message_icon;

	// Token: 0x04001413 RID: 5139
	public UISprite location_icon;

	// Token: 0x04001414 RID: 5140
	public UISprite reputation_icon;

	// Token: 0x04001415 RID: 5141
	public UISprite rep_fill_sprite;

	// Token: 0x04001416 RID: 5142
	public UILabel rep_level_lbl;

	// Token: 0x04001417 RID: 5143
	public UISprite achievement_sprite;

	// Token: 0x04001418 RID: 5144
	public UILabel title_lbl;

	// Token: 0x04001419 RID: 5145
	public UILabel message_lbl;

	// Token: 0x0400141A RID: 5146
	public Transform main_holder;

	// Token: 0x0400141B RID: 5147
	private ProgressReportPanelBehavior panel;

	// Token: 0x0400141C RID: 5148
	public int starting_xp;

	// Token: 0x0400141D RID: 5149
	public int current_xp;

	// Token: 0x0400141E RID: 5150
	public string icon_name;

	// Token: 0x0400141F RID: 5151
	public SFRepClass sf_rep;

	// Token: 0x04001420 RID: 5152
	public float delay_next = 2.5f;

	// Token: 0x04001421 RID: 5153
	private float delay_time = -1f;

	// Token: 0x04001422 RID: 5154
	public string atlas_name_prefix = "mission cover atlas/mission cover atlas ";

	// Token: 0x04001423 RID: 5155
	public string cover_sprite_prefix = "cover_";

	// Token: 0x04001424 RID: 5156
	private ProgressReportItemBehavior.eProgressReportType type;

	// Token: 0x020002D2 RID: 722
	public enum eProgressReportType
	{
		// Token: 0x04001426 RID: 5158
		MISSION,
		// Token: 0x04001427 RID: 5159
		LEVEL,
		// Token: 0x04001428 RID: 5160
		ABILITY,
		// Token: 0x04001429 RID: 5161
		MESSAGE,
		// Token: 0x0400142A RID: 5162
		LOCATION,
		// Token: 0x0400142B RID: 5163
		ACHIEVEMENT,
		// Token: 0x0400142C RID: 5164
		REPUTATION
	}
}
