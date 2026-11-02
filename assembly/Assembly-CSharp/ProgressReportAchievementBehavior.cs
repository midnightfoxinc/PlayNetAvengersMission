using System;
using System.Collections;
using UnityEngine;

// Token: 0x020002D0 RID: 720
[AddComponentMenu("Scripts/Progress Report/Progress Report Achievement Behavior")]
public class ProgressReportAchievementBehavior : MonoBehaviour
{
	// Token: 0x060012FF RID: 4863 RVA: 0x00087994 File Offset: 0x00085B94
	public void show(ProgressReportItemBehavior pPrib)
	{
		this._prib = pPrib;
		this.achievement_sprite.spriteName = pPrib.achievement_sprite.spriteName;
		this.anim_out_tp.enabled = false;
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_ts.enabled = false;
		this.anim_out_ts.ResetToBeginning();
		base.gameObject.SetActive(true);
		this.anim_in_ts.ResetToBeginning();
		this.anim_in_ts.PlayForward();
		this.anim_in_ta.ResetToBeginning();
		this.anim_in_ta.PlayForward();
	}

	// Token: 0x06001300 RID: 4864 RVA: 0x00087A24 File Offset: 0x00085C24
	private void OnDisable()
	{
		base.StopAllCoroutines();
	}

	// Token: 0x06001301 RID: 4865 RVA: 0x00087A2C File Offset: 0x00085C2C
	public void on_finished_anim_in()
	{
		globals.sfx_master.play("level up", null);
		base.StartCoroutine("anim_in_delay");
	}

	// Token: 0x06001302 RID: 4866 RVA: 0x00087A4C File Offset: 0x00085C4C
	private IEnumerator anim_in_delay()
	{
		yield return new WaitForSeconds(0.75f);
		this.parent.pushDownItems(this._prib.getBannerHeight(), this._prib.transform);
		Vector3 to_pos = base.transform.parent.InverseTransformPoint(this._prib.ability_icon.transform.TransformPoint(this._prib.ability_icon.transform.localPosition));
		to_pos.y -= this.parent.scroll_view.transform.localPosition.y - this.parent.orig_scroll_pos.y;
		this.anim_out_tp.to = to_pos;
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_tp.PlayForward();
		this.anim_out_ts.ResetToBeginning();
		this.anim_out_ts.PlayForward();
		yield break;
	}

	// Token: 0x06001303 RID: 4867 RVA: 0x00087A68 File Offset: 0x00085C68
	public void on_finished_anim_out()
	{
		base.gameObject.SetActive(false);
		this._prib.startSlider();
	}

	// Token: 0x04001403 RID: 5123
	public UISprite achievement_sprite;

	// Token: 0x04001404 RID: 5124
	public TweenScale anim_in_ts;

	// Token: 0x04001405 RID: 5125
	public TweenAlpha anim_in_ta;

	// Token: 0x04001406 RID: 5126
	public TweenPosition anim_out_tp;

	// Token: 0x04001407 RID: 5127
	public TweenScale anim_out_ts;

	// Token: 0x04001408 RID: 5128
	public ProgressReportPanelBehavior parent;

	// Token: 0x04001409 RID: 5129
	private ProgressReportItemBehavior _prib;
}
