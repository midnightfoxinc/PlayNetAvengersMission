using System;
using System.Collections;
using UnityEngine;

// Token: 0x020002D8 RID: 728
[AddComponentMenu("Scripts/Progress Report/Progress Report Mission Behavior")]
public class ProgressReportMissionBehavior : MonoBehaviour
{
	// Token: 0x06001331 RID: 4913 RVA: 0x00088BCC File Offset: 0x00086DCC
	public void show(ProgressReportItemBehavior pPrib)
	{
		this._prib = pPrib;
		if (globals.environment_manager.useMedals)
		{
			this.star.spriteName = pPrib.banner_star_icon.spriteName;
		}
		this.icon.atlas = pPrib.mission_icon.atlas;
		this.icon.spriteName = pPrib.mission_icon.spriteName;
		this.star.gameObject.SetActive(false);
		this.star_tp.enabled = false;
		this.star_tp.ResetToBeginning();
		this.star_ts.enabled = false;
		this.star_ts.ResetToBeginning();
		this.anim_out_ts.ResetToBeginning();
		this.anim_out_ts.enabled = false;
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_tp.enabled = false;
		base.gameObject.SetActive(true);
		this.anim_in_tp.ResetToBeginning();
		this.anim_in_tp.PlayForward();
	}

	// Token: 0x06001332 RID: 4914 RVA: 0x00088CC0 File Offset: 0x00086EC0
	private void OnDisable()
	{
		base.StopAllCoroutines();
	}

	// Token: 0x06001333 RID: 4915 RVA: 0x00088CC8 File Offset: 0x00086EC8
	public void on_finished_anim_in()
	{
		this.star.gameObject.SetActive(true);
		this.star_tp.PlayForward();
		this.star_ts.PlayForward();
	}

	// Token: 0x06001334 RID: 4916 RVA: 0x00088CF4 File Offset: 0x00086EF4
	public void on_star_added()
	{
		globals.sfx_master.play("level up", null);
		base.StartCoroutine(this.anim_in_delay());
	}

	// Token: 0x06001335 RID: 4917 RVA: 0x00088D14 File Offset: 0x00086F14
	private IEnumerator anim_in_delay()
	{
		yield return new WaitForSeconds(0.75f);
		this.parent.pushDownItems(this._prib.getBannerHeight(), this._prib.transform);
		Vector3 to_pos = base.transform.parent.transform.InverseTransformPoint(this._prib.mission_icon.transform.TransformPoint(this._prib.mission_icon.transform.localPosition));
		to_pos.y -= this.parent.scroll_view.transform.localPosition.y - this.parent.orig_scroll_pos.y;
		this.anim_out_tp.to = to_pos;
		this.anim_out_ts.PlayForward();
		this.anim_out_tp.duration = this.anim_out_ts.duration;
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_tp.PlayForward();
		yield break;
	}

	// Token: 0x06001336 RID: 4918 RVA: 0x00088D30 File Offset: 0x00086F30
	public void on_finished_anim_out()
	{
		base.gameObject.SetActive(false);
		this._prib.startSlider();
	}

	// Token: 0x04001452 RID: 5202
	public UISprite icon;

	// Token: 0x04001453 RID: 5203
	public TweenPosition anim_in_tp;

	// Token: 0x04001454 RID: 5204
	public TweenScale anim_out_ts;

	// Token: 0x04001455 RID: 5205
	public TweenPosition anim_out_tp;

	// Token: 0x04001456 RID: 5206
	public UISprite star;

	// Token: 0x04001457 RID: 5207
	public TweenPosition star_tp;

	// Token: 0x04001458 RID: 5208
	public TweenScale star_ts;

	// Token: 0x04001459 RID: 5209
	public ProgressReportPanelBehavior parent;

	// Token: 0x0400145A RID: 5210
	private ProgressReportItemBehavior _prib;
}
