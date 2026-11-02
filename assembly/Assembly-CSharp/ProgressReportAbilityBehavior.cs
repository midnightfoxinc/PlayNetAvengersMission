using System;
using System.Collections;
using UnityEngine;

// Token: 0x020002CF RID: 719
[AddComponentMenu("Scripts/Progress Report/Progress Report Ability Behavior")]
public class ProgressReportAbilityBehavior : MonoBehaviour
{
	// Token: 0x060012F9 RID: 4857 RVA: 0x00087788 File Offset: 0x00085988
	public void show(ProgressReportItemBehavior pPrib)
	{
		this._prib = pPrib;
		if (this.ability_icon.atlas.GetSprite(pPrib.icon_name) != null)
		{
			this.ability_icon.gameObject.SetActive(true);
			this.gesture_icon.gameObject.SetActive(false);
			this.hulk_icon.gameObject.SetActive(false);
			this.ability_icon.spriteName = pPrib.icon_name;
		}
		else if (this.gesture_icon.atlas.GetSprite(pPrib.icon_name) != null)
		{
			this.ability_icon.gameObject.SetActive(false);
			this.gesture_icon.gameObject.SetActive(true);
			this.hulk_icon.gameObject.SetActive(false);
			this.gesture_icon.spriteName = pPrib.icon_name;
		}
		else if (this.hulk_icon.atlas.GetSprite(pPrib.icon_name) != null)
		{
			this.ability_icon.gameObject.SetActive(false);
			this.gesture_icon.gameObject.SetActive(false);
			this.hulk_icon.gameObject.SetActive(true);
			this.hulk_icon.spriteName = pPrib.icon_name;
		}
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

	// Token: 0x060012FA RID: 4858 RVA: 0x0008792C File Offset: 0x00085B2C
	private void OnDisable()
	{
		base.StopAllCoroutines();
	}

	// Token: 0x060012FB RID: 4859 RVA: 0x00087934 File Offset: 0x00085B34
	public void on_finished_anim_in()
	{
		globals.sfx_master.play("level up", null);
		base.StartCoroutine("anim_in_delay");
	}

	// Token: 0x060012FC RID: 4860 RVA: 0x00087954 File Offset: 0x00085B54
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

	// Token: 0x060012FD RID: 4861 RVA: 0x00087970 File Offset: 0x00085B70
	public void on_finished_anim_out()
	{
		base.gameObject.SetActive(false);
		this._prib.startSlider();
	}

	// Token: 0x040013FA RID: 5114
	public UISprite ability_icon;

	// Token: 0x040013FB RID: 5115
	public UISprite gesture_icon;

	// Token: 0x040013FC RID: 5116
	public UISprite hulk_icon;

	// Token: 0x040013FD RID: 5117
	public TweenScale anim_in_ts;

	// Token: 0x040013FE RID: 5118
	public TweenAlpha anim_in_ta;

	// Token: 0x040013FF RID: 5119
	public TweenPosition anim_out_tp;

	// Token: 0x04001400 RID: 5120
	public TweenScale anim_out_ts;

	// Token: 0x04001401 RID: 5121
	public ProgressReportPanelBehavior parent;

	// Token: 0x04001402 RID: 5122
	private ProgressReportItemBehavior _prib;
}
