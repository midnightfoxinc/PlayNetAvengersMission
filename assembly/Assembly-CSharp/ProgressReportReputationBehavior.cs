using System;
using UnityEngine;

// Token: 0x020002D9 RID: 729
[AddComponentMenu("Scripts/Progress Report/Progress Report Reputation Behavior")]
public class ProgressReportReputationBehavior : MonoBehaviour
{
	// Token: 0x06001338 RID: 4920 RVA: 0x00088D84 File Offset: 0x00086F84
	public void show(ProgressReportItemBehavior pPrib)
	{
		this._prib = pPrib;
		this.level_up_lbl.gameObject.SetActive(false);
		this.starting_xp = pPrib.sf_rep.prev_xp;
		this.final_xp = pPrib.sf_rep.xp;
		this._current_level = globals.sf_level_from_xp(pPrib.sf_rep.prev_xp);
		this._current_xp = (float)this.starting_xp;
		this.xp_tally_loop.gameObject.SetActive(false);
		this.icon.spriteName = pPrib.reputation_icon.spriteName;
		this.anim_tp.ResetToBeginning();
		this.anim_ts.ResetToBeginning();
		this.anim_ts.from = new Vector3(8f, 8f, 8f);
		if (globals.sf_level_from_xp(pPrib.sf_rep.xp) == this._current_level)
		{
			this._current_xp = (float)this.final_xp;
			if (this._current_level < globals.sf_xp_to_level.Length - 1)
			{
				int num = globals.sf_xp_to_level[this._current_level];
				this.set_fill(this._current_xp - (float)num);
			}
			else
			{
				this.fill_sprite.fillAmount = 1f;
			}
			this.anim_ts.to = new Vector3(1f, 1f, 1f);
			this._doing_level_up_show = false;
			this._wait_time = 0f;
		}
		else
		{
			this.fill_sprite.fillAmount = 0f;
			this.anim_ts.to = new Vector3(2.5f, 2.5f, 2.5f);
			this._doing_level_up_show = true;
			this._wait_time = -1f;
		}
		this.level_lbl.text = this._current_level.ToString();
		this._do_fill = false;
		this.anim_ts.PlayForward();
		base.gameObject.SetActive(true);
	}

	// Token: 0x06001339 RID: 4921 RVA: 0x00088F64 File Offset: 0x00087164
	private void set_fill(float left)
	{
		int num;
		if (this._current_level < globals.sf_xp_to_level.Length - 1)
		{
			num = globals.sf_xp_to_level[this._current_level + 1] - globals.sf_xp_to_level[this._current_level];
		}
		else
		{
			num = globals.sf_xp_to_level[this._current_level];
			left = (float)num;
		}
		if (left > (float)num)
		{
			left = (float)num;
		}
		this.fill_sprite.fillAmount = left / (float)num;
		this.level_lbl.text = this._current_level.ToString();
	}

	// Token: 0x0600133A RID: 4922 RVA: 0x00088FE8 File Offset: 0x000871E8
	private void OnDisable()
	{
	}

	// Token: 0x0600133B RID: 4923 RVA: 0x00088FEC File Offset: 0x000871EC
	public void on_scale_finished()
	{
		if (this._doing_level_up_show)
		{
			this._do_fill = true;
		}
	}

	// Token: 0x0600133C RID: 4924 RVA: 0x00089000 File Offset: 0x00087200
	public void on_finished_anim()
	{
		globals.sfx_master.play("level up", null);
		base.gameObject.SetActive(false);
		this._prib.startSlider();
	}

	// Token: 0x0600133D RID: 4925 RVA: 0x00089034 File Offset: 0x00087234
	public void on_level_up_scale_finished()
	{
		this.level_up_ts.gameObject.SetActive(false);
		this.shake.play();
		globals.sfx_master.play("level up", null);
		this.level_lbl.text = this._current_level.ToString();
		this.level_tc.ResetToBeginning();
		this.level_tc.enabled = false;
	}

	// Token: 0x0600133E RID: 4926 RVA: 0x0008909C File Offset: 0x0008729C
	public void Update()
	{
		if (this._wait_time >= 0f)
		{
			this._wait_time -= Time.deltaTime;
			if (this._wait_time < 0f)
			{
				this.parent.pushDownItems(this._prib.getBannerHeight(), this._prib.transform);
				Vector3 to = base.transform.parent.InverseTransformPoint(this._prib.reputation_icon.transform.TransformPoint(this._prib.reputation_icon.transform.localPosition));
				to.y -= this.parent.scroll_view.transform.localPosition.y - this.parent.orig_scroll_pos.y;
				this.anim_tp.to = to;
				this.anim_ts.ResetToBeginning();
				this.anim_ts.PlayForward();
				this.anim_tp.PlayForward();
			}
		}
		if (this._current_xp > (float)this.final_xp || Input.GetMouseButtonDown(0))
		{
			this._current_xp = (float)this.final_xp;
			while (this._current_level < globals.sf_xp_to_level.Length - 1 && this._current_xp >= (float)globals.sf_xp_to_level[this._current_level + 1])
			{
				this._current_level++;
			}
			this.level_up_lbl.text = this._current_level.ToString();
		}
		if (this._do_fill && !this.level_up_ts.enabled && !this.shake.isShaking())
		{
			if (this._current_xp < (float)this.final_xp)
			{
				if (this._current_level < globals.sf_xp_to_level.Length - 1)
				{
					if (!this.level_tc.enabled && this._current_level < globals.sf_level_from_xp(this.final_xp))
					{
						this.level_tc.enabled = true;
						this.level_tc.ResetToBeginning();
						this.level_tc.PlayForward();
					}
					this.xp_tally_loop.gameObject.SetActive(true);
					int num = globals.sf_xp_to_level[this._current_level];
					int num2 = globals.sf_xp_to_level[this._current_level + 1];
					float num3 = (float)(num2 - num) / this.count_time;
					this._current_xp += num3 * Time.deltaTime;
					this.xp_tally_loop.audio.pitch = Mathf.Log((float)num2, 20f);
					this.set_fill(this._current_xp - (float)num);
					bool flag = false;
					while (this._current_level < globals.sf_xp_to_level.Length - 1 && this._current_xp >= (float)globals.sf_xp_to_level[this._current_level + 1])
					{
						this._current_level++;
						flag = true;
					}
					if (flag)
					{
						this.level_up_ts.gameObject.SetActive(true);
						this.level_up_ts.ResetToBeginning();
						this.level_up_ts.PlayForward();
						this.level_up_lbl.text = this._current_level.ToString();
						this.xp_tally_loop.gameObject.SetActive(false);
					}
				}
				else
				{
					this.fill_sprite.fillAmount = 1f;
					this._current_xp = (float)this.final_xp;
				}
			}
			else
			{
				this._doing_level_up_show = false;
				this._do_fill = false;
				this._wait_time = 1f;
				this.xp_tally_loop.gameObject.SetActive(false);
				this.set_fill(this._current_xp - (float)globals.sf_xp_to_level[this._current_level]);
				this.anim_ts.from = new Vector3(2.5f, 2.5f, 2.5f);
				this.anim_ts.to = new Vector3(1f, 1f, 1f);
			}
		}
	}

	// Token: 0x0400145B RID: 5211
	public UISprite icon;

	// Token: 0x0400145C RID: 5212
	public TweenScale anim_ts;

	// Token: 0x0400145D RID: 5213
	public TweenPosition anim_tp;

	// Token: 0x0400145E RID: 5214
	public UISprite fill_sprite;

	// Token: 0x0400145F RID: 5215
	public UILabel level_lbl;

	// Token: 0x04001460 RID: 5216
	public TweenScale level_up_ts;

	// Token: 0x04001461 RID: 5217
	public UILabel level_up_lbl;

	// Token: 0x04001462 RID: 5218
	public ShakeBehavior shake;

	// Token: 0x04001463 RID: 5219
	public TweenColor level_tc;

	// Token: 0x04001464 RID: 5220
	public ProgressReportPanelBehavior parent;

	// Token: 0x04001465 RID: 5221
	private ProgressReportItemBehavior _prib;

	// Token: 0x04001466 RID: 5222
	public LoopingSoundBehavior xp_tally_loop;

	// Token: 0x04001467 RID: 5223
	public float count_time = 1f;

	// Token: 0x04001468 RID: 5224
	public int starting_xp = 30;

	// Token: 0x04001469 RID: 5225
	public int final_xp = 120;

	// Token: 0x0400146A RID: 5226
	private float _current_xp;

	// Token: 0x0400146B RID: 5227
	private int _current_level = 1;

	// Token: 0x0400146C RID: 5228
	private bool _do_fill;

	// Token: 0x0400146D RID: 5229
	private bool _doing_level_up_show;

	// Token: 0x0400146E RID: 5230
	private float _wait_time = -1f;
}
