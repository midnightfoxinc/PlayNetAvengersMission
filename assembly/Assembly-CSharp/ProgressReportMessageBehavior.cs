using System;
using System.Collections;
using UnityEngine;

// Token: 0x020002D6 RID: 726
[AddComponentMenu("Scripts/Progress Report/Progress Report Message Behavior")]
public class ProgressReportMessageBehavior : MonoBehaviour
{
	// Token: 0x06001328 RID: 4904 RVA: 0x00088AE8 File Offset: 0x00086CE8
	public void show(ProgressReportItemBehavior pPrib)
	{
		this._prib = pPrib;
		this.anim_out_tp.enabled = false;
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_ts.enabled = false;
		this.anim_out_ts.ResetToBeginning();
		base.gameObject.SetActive(true);
		this.anim_in_tp.ResetToBeginning();
		this.anim_in_tp.PlayForward();
	}

	// Token: 0x06001329 RID: 4905 RVA: 0x00088B4C File Offset: 0x00086D4C
	private void OnDisable()
	{
		base.StopAllCoroutines();
	}

	// Token: 0x0600132A RID: 4906 RVA: 0x00088B54 File Offset: 0x00086D54
	public void on_finished_anim_in()
	{
		base.StartCoroutine("anim_in_delay");
	}

	// Token: 0x0600132B RID: 4907 RVA: 0x00088B64 File Offset: 0x00086D64
	private IEnumerator anim_in_delay()
	{
		yield return new WaitForSeconds(1f);
		this.parent.pushDownItems(this._prib.getBannerHeight(), this._prib.transform);
		Vector3 to_pos = base.transform.parent.InverseTransformPoint(this._prib.message_icon.transform.TransformPoint(this._prib.message_icon.transform.localPosition));
		to_pos.y -= this.parent.scroll_view.transform.localPosition.y - this.parent.orig_scroll_pos.y;
		this.anim_out_tp.to = to_pos;
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_tp.PlayForward();
		this.anim_out_ts.ResetToBeginning();
		this.anim_out_ts.PlayForward();
		yield break;
	}

	// Token: 0x0600132C RID: 4908 RVA: 0x00088B80 File Offset: 0x00086D80
	public void on_finished_anim_out()
	{
		base.gameObject.SetActive(false);
		this._prib.startSlider();
	}

	// Token: 0x0400144B RID: 5195
	public UISprite icon;

	// Token: 0x0400144C RID: 5196
	public TweenPosition anim_in_tp;

	// Token: 0x0400144D RID: 5197
	public TweenPosition anim_out_tp;

	// Token: 0x0400144E RID: 5198
	public TweenScale anim_out_ts;

	// Token: 0x0400144F RID: 5199
	public ProgressReportPanelBehavior parent;

	// Token: 0x04001450 RID: 5200
	private ProgressReportItemBehavior _prib;
}
