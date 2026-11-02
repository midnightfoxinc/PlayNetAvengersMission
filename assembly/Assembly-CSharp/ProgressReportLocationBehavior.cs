using System;
using System.Collections;
using UnityEngine;

// Token: 0x020002D5 RID: 725
[AddComponentMenu("Scripts/Progress Report/Progress Report Location Behavior")]
public class ProgressReportLocationBehavior : MonoBehaviour
{
	// Token: 0x06001322 RID: 4898 RVA: 0x000889E4 File Offset: 0x00086BE4
	public void show(ProgressReportItemBehavior pPrib)
	{
		this._prib = pPrib;
		this.anim_out_tp.enabled = false;
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_ts.enabled = false;
		this.anim_out_ts.ResetToBeginning();
		base.gameObject.SetActive(true);
		this.anim_in_ts.ResetToBeginning();
		this.anim_in_ts.PlayForward();
		this.anim_in_tr.ResetToBeginning();
		this.anim_in_tr.PlayForward();
	}

	// Token: 0x06001323 RID: 4899 RVA: 0x00088A60 File Offset: 0x00086C60
	private void OnDisable()
	{
		base.StopAllCoroutines();
	}

	// Token: 0x06001324 RID: 4900 RVA: 0x00088A68 File Offset: 0x00086C68
	public void on_finished_anim_in()
	{
		globals.sfx_master.play("level up", null);
		this.anim_in_tr.ResetToBeginning();
		this.anim_in_tr.enabled = false;
		base.StartCoroutine("anim_in_delay");
	}

	// Token: 0x06001325 RID: 4901 RVA: 0x00088AA8 File Offset: 0x00086CA8
	private IEnumerator anim_in_delay()
	{
		yield return new WaitForSeconds(1f);
		this.parent.pushDownItems(this._prib.getBannerHeight(), this._prib.transform);
		Vector3 to_pos = base.transform.parent.InverseTransformPoint(this._prib.location_icon.transform.TransformPoint(this._prib.location_icon.transform.localPosition));
		to_pos.y -= this.parent.scroll_view.transform.localPosition.y - this.parent.orig_scroll_pos.y;
		this.anim_out_tp.to = to_pos;
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_tp.PlayForward();
		this.anim_out_ts.ResetToBeginning();
		this.anim_out_ts.PlayForward();
		yield break;
	}

	// Token: 0x06001326 RID: 4902 RVA: 0x00088AC4 File Offset: 0x00086CC4
	public void on_finished_anim_out()
	{
		base.gameObject.SetActive(false);
		this._prib.startSlider();
	}

	// Token: 0x04001444 RID: 5188
	public UISprite icon;

	// Token: 0x04001445 RID: 5189
	public TweenScale anim_in_ts;

	// Token: 0x04001446 RID: 5190
	public TweenRotation anim_in_tr;

	// Token: 0x04001447 RID: 5191
	public TweenPosition anim_out_tp;

	// Token: 0x04001448 RID: 5192
	public TweenScale anim_out_ts;

	// Token: 0x04001449 RID: 5193
	public ProgressReportPanelBehavior parent;

	// Token: 0x0400144A RID: 5194
	private ProgressReportItemBehavior _prib;
}
