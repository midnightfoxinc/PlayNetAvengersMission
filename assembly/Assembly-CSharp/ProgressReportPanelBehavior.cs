using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002A1 RID: 673
[AddComponentMenu("Scripts/Progress Report/Progress Report Panel Behavior")]
public class ProgressReportPanelBehavior : HQMenuPanelBehavior
{
	// Token: 0x0600122F RID: 4655 RVA: 0x0008140C File Offset: 0x0007F60C
	private void Awake()
	{
		this.orig_scroll_pos = this.scroll_view.transform.localPosition;
		this.level_up_anim.gameObject.SetActive(false);
		this.mission_anim.gameObject.SetActive(false);
		this.ability_anim.gameObject.SetActive(false);
		this.message_anim.gameObject.SetActive(false);
		this.location_anim.gameObject.SetActive(false);
		this.reputation_anim.gameObject.SetActive(false);
		this.achievement_anim.gameObject.SetActive(false);
	}

	// Token: 0x06001230 RID: 4656 RVA: 0x000814A8 File Offset: 0x0007F6A8
	private ProgressReportItemBehavior create_new_item()
	{
		GameObject gameObject = Object.Instantiate(Resources.Load("progress report item")) as GameObject;
		gameObject.SetActive(false);
		this.progress_report_items.Add(gameObject);
		return gameObject.GetComponent<ProgressReportItemBehavior>();
	}

	// Token: 0x06001231 RID: 4657 RVA: 0x000814E4 File Offset: 0x0007F6E4
	private void setup_items()
	{
		while (globals.report_items.missions.Count > 0)
		{
			this.create_new_item().setup_mission(this, globals.report_items.missions.Pop<missionSummaryClass>());
		}
		if (globals.gear_level_from_xp(globals.previous_xp) < globals.gear_level_from_xp(globals.current_xp))
		{
			this.create_new_item().setup_level(this);
			globals.previous_xp = globals.current_xp;
		}
		while (globals.report_items.abilities.Count > 0)
		{
			this.create_new_item().setup_ability(this, globals.report_items.abilities.Pop<string>());
		}
		while (globals.report_items.sf.Count > 0)
		{
			this.create_new_item().setup_reputation(this, globals.report_items.sf.Pop<SFRepClass>());
		}
		while (globals.report_items.achievements.Count > 0)
		{
			this.create_new_item().setup_achievement(this, globals.report_items.achievements.Pop<string>());
		}
	}

	// Token: 0x06001232 RID: 4658 RVA: 0x000815F4 File Offset: 0x0007F7F4
	public bool show_check()
	{
		if (globals.touring() || !globals.FTUE_manager.done)
		{
			base.enabled = false;
			return false;
		}
		return !globals.gear_daisy.submenu_open() && !globals.scavenger_hunt_manager.panel.OpenOrOpening() && globals.progress_report_pending();
	}

	// Token: 0x06001233 RID: 4659 RVA: 0x00081650 File Offset: 0x0007F850
	public override void show(bool b)
	{
		base.show(b && !globals.report_items.user_cancelled);
		if (!b)
		{
			this.level_up_anim.gameObject.SetActive(false);
			this.mission_anim.gameObject.SetActive(false);
			this.ability_anim.gameObject.SetActive(false);
			this.message_anim.gameObject.SetActive(false);
			this.location_anim.gameObject.SetActive(false);
			this.reputation_anim.gameObject.SetActive(false);
			this.timestamp_lbl.gameObject.SetActive(false);
			this.removeAll();
			return;
		}
		this.setup_items();
		this.timestamp_lbl.text = string.Empty;
		this.scroll_view.transform.localPosition = this.orig_scroll_pos;
		this.progress_tp.ResetToBeginning();
		this.progress_tp.enabled = false;
		this.close_button.gameObject.SetActive(false);
		if (globals.report_items.user_cancelled)
		{
			base.StartCoroutine("send_back_to_main_menu");
			return;
		}
		this.jarvis_controller.SetBool("report_done", false);
		this.jarvis_controller.enabled = true;
		this.jarvis_controller.Play("on screen");
	}

	// Token: 0x06001234 RID: 4660 RVA: 0x0008179C File Offset: 0x0007F99C
	public void on_jarvis_in_finished()
	{
		this.timestamp_lbl.text = "PROGRESS\nREPORT\n" + DateTime.Now.ToString("M.d.yy") + "\n" + DateTime.Now.ToString("h:mm tt");
		this.timestamp_lbl.gameObject.SetActive(true);
		this.close_button.gameObject.SetActive(true);
		this.showing = null;
		this.show_next_item();
	}

	// Token: 0x06001235 RID: 4661 RVA: 0x00081818 File Offset: 0x0007FA18
	private IEnumerator send_back_to_main_menu()
	{
		yield return new WaitForSeconds(0.01f);
		globals.hq_main.set_state(hq_menu_state_enum.main);
		yield break;
	}

	// Token: 0x06001236 RID: 4662 RVA: 0x0008182C File Offset: 0x0007FA2C
	private void removeAll()
	{
		while (this.scroll_view.transform.childCount > 0)
		{
			Transform child = this.scroll_view.transform.GetChild(0);
			child.parent = null;
			Object.Destroy(child.gameObject);
		}
		if (this.progress_report_items != null)
		{
			while (this.progress_report_items.Count > 0)
			{
				Object.Destroy(this.progress_report_items.Pop<GameObject>());
			}
		}
	}

	// Token: 0x06001237 RID: 4663 RVA: 0x000818AC File Offset: 0x0007FAAC
	public void show_next_item()
	{
		this.showing = null;
		if (!this.close_button.gameObject.activeSelf)
		{
			return;
		}
		if (this.progress_report_items.Count < 1)
		{
			this.setScrollColliderActive();
			return;
		}
		if (this.scroll_view.transform.childCount == 0)
		{
			this.scroll_view.ResetPosition();
			this.scroll_view.InvalidateBounds();
			this.scroll_bar.value = 0f;
		}
		this.showing = this.progress_report_items.Shift<GameObject>();
		ProgressReportItemBehavior component = this.showing.GetComponent<ProgressReportItemBehavior>();
		component.transform.parent = this.scroll_view.transform;
		component.transform.localPosition = new Vector3(0f, 0f, 0f);
		component.transform.localScale = new Vector3(1f, 1f, 1f);
		if (this.scroll_view.transform.childCount == 1)
		{
			this.scroll_view.ResetPosition();
		}
		this.setScrollColliderActive();
		component.play();
	}

	// Token: 0x06001238 RID: 4664 RVA: 0x000819C8 File Offset: 0x0007FBC8
	private void setScrollColliderActive()
	{
		ProgressReportItemBehavior[] componentsInChildren = this.scroll_view.GetComponentsInChildren<ProgressReportItemBehavior>();
		float num = 0f;
		foreach (ProgressReportItemBehavior progressReportItemBehavior in componentsInChildren)
		{
			num += progressReportItemBehavior.getBannerHeight();
		}
		this.scroll_collider.SetActive(num > this.scroll_view.gameObject.GetComponent<UIPanel>().finalClipRegion.w);
	}

	// Token: 0x06001239 RID: 4665 RVA: 0x00081A3C File Offset: 0x0007FC3C
	public void pushDownItems(float amount, Transform except)
	{
		this.scroll_collider.SetActive(false);
		this.scroll_view.SetDragAmount(0f, 0f, true);
		for (int i = 0; i < this.scroll_view.transform.childCount; i++)
		{
			Transform child = this.scroll_view.transform.GetChild(i);
			if (child != except)
			{
				TweenPosition tweenPosition = child.gameObject.AddComponent<TweenPosition>();
				tweenPosition.from = child.localPosition;
				tweenPosition.to = new Vector3(child.localPosition.x, child.localPosition.y - amount, child.localPosition.z);
				tweenPosition.duration = 0.3f;
				tweenPosition.PlayForward();
			}
		}
	}

	// Token: 0x0600123A RID: 4666 RVA: 0x00081B0C File Offset: 0x0007FD0C
	public void show_level_up(ProgressReportItemBehavior pPrib, int pFrom, int pTo)
	{
		this.level_up_anim.show(pPrib, pFrom, pTo);
	}

	// Token: 0x0600123B RID: 4667 RVA: 0x00081B1C File Offset: 0x0007FD1C
	public void show_mission(ProgressReportItemBehavior pPrib)
	{
		this.mission_anim.show(pPrib);
	}

	// Token: 0x0600123C RID: 4668 RVA: 0x00081B2C File Offset: 0x0007FD2C
	public void show_ability(ProgressReportItemBehavior pPrib)
	{
		this.ability_anim.show(pPrib);
	}

	// Token: 0x0600123D RID: 4669 RVA: 0x00081B3C File Offset: 0x0007FD3C
	public void show_message(ProgressReportItemBehavior pPrib)
	{
		this.message_anim.show(pPrib);
	}

	// Token: 0x0600123E RID: 4670 RVA: 0x00081B4C File Offset: 0x0007FD4C
	public void show_location(ProgressReportItemBehavior pPrib)
	{
		this.location_anim.show(pPrib);
	}

	// Token: 0x0600123F RID: 4671 RVA: 0x00081B5C File Offset: 0x0007FD5C
	public void show_reputation(ProgressReportItemBehavior pPrib)
	{
		this.reputation_anim.show(pPrib);
	}

	// Token: 0x06001240 RID: 4672 RVA: 0x00081B6C File Offset: 0x0007FD6C
	public void show_achievement(ProgressReportItemBehavior pPrib)
	{
		this.achievement_anim.show(pPrib);
	}

	// Token: 0x06001241 RID: 4673 RVA: 0x00081B7C File Offset: 0x0007FD7C
	public void on_transition_out_complete()
	{
		this.jarvis_controller.SetBool("report_done", true);
	}

	// Token: 0x06001242 RID: 4674 RVA: 0x00081B90 File Offset: 0x0007FD90
	public void on_jarvis_out_finished()
	{
		globals.hq_main.set_state(hq_menu_state_enum.main);
		this.progress_tp.ResetToBeginning();
		this.progress_tp.enabled = false;
		this.timestamp_lbl.gameObject.SetActive(false);
	}

	// Token: 0x06001243 RID: 4675 RVA: 0x00081BD0 File Offset: 0x0007FDD0
	protected override void Update()
	{
		if (this.progress_tp.enabled)
		{
			return;
		}
		this.setup_items();
		if (this.showing == null && this.progress_report_items.Count > 0)
		{
			this.show_next_item();
		}
		if (this.close_button.clicked)
		{
			if (this.progress_report_items.Count > 0 && this.showing != null)
			{
				globals.report_items.user_cancelled = true;
				ProgressReportItemBehavior component = this.showing.GetComponent<ProgressReportItemBehavior>();
				if (component.main_holder.gameObject.activeSelf)
				{
					component.snap();
				}
				else
				{
					this.level_up_anim.gameObject.SetActive(false);
					this.mission_anim.gameObject.SetActive(false);
					this.ability_anim.gameObject.SetActive(false);
					this.message_anim.gameObject.SetActive(false);
					this.location_anim.gameObject.SetActive(false);
					this.reputation_anim.gameObject.SetActive(false);
				}
			}
			this.close_button.gameObject.SetActive(false);
			this.fwResume.setFirmwareUI();
			this.progress_tp.enabled = true;
			this.progress_tp.PlayForward();
			DMOManager.LogNavigation(NavigationManager.hq_scene, "back_btn", NavigationManager.progress_report_panel, null);
		}
		if (this._dragging && !Input.GetMouseButton(0))
		{
			this._dragging = false;
		}
	}

	// Token: 0x040012AF RID: 4783
	private GameObject showing;

	// Token: 0x040012B0 RID: 4784
	private List<GameObject> progress_report_items = new List<GameObject>();

	// Token: 0x040012B1 RID: 4785
	public ProgressReportLevelUpBehavior level_up_anim;

	// Token: 0x040012B2 RID: 4786
	public ProgressReportMissionBehavior mission_anim;

	// Token: 0x040012B3 RID: 4787
	public ProgressReportAbilityBehavior ability_anim;

	// Token: 0x040012B4 RID: 4788
	public ProgressReportMessageBehavior message_anim;

	// Token: 0x040012B5 RID: 4789
	public ProgressReportLocationBehavior location_anim;

	// Token: 0x040012B6 RID: 4790
	public ProgressReportReputationBehavior reputation_anim;

	// Token: 0x040012B7 RID: 4791
	public ProgressReportAchievementBehavior achievement_anim;

	// Token: 0x040012B8 RID: 4792
	public FirmwareResumeManager fwResume;

	// Token: 0x040012B9 RID: 4793
	public TweenPosition progress_tp;

	// Token: 0x040012BA RID: 4794
	public UILabel timestamp_lbl;

	// Token: 0x040012BB RID: 4795
	public Animator jarvis_controller;

	// Token: 0x040012BC RID: 4796
	public UIScrollBar scroll_bar;

	// Token: 0x040012BD RID: 4797
	public GameObject scroll_collider;

	// Token: 0x040012BE RID: 4798
	public Vector3 orig_scroll_pos;
}
