using System;
using System.Collections;
using UnityEngine;

// Token: 0x020002D3 RID: 723
[AddComponentMenu("Scripts/Progress Report/Progress Report Level Up Behavior")]
public class ProgressReportLevelUpBehavior : MonoBehaviour
{
	// Token: 0x06001315 RID: 4885 RVA: 0x0008843C File Offset: 0x0008663C
	private void Awake()
	{
		this._level_tween = this.level_widget.GetComponent<TweenScale>();
		this._level_tween.enabled = false;
		this.do_anim_check = false;
	}

	// Token: 0x06001316 RID: 4886 RVA: 0x00088470 File Offset: 0x00086670
	public void show(ProgressReportItemBehavior pPrib, int pFrom, int pTo)
	{
		this._prib = pPrib;
		this.starting_xp = pFrom;
		this.final_xp = pTo;
		this._current_xp = (float)this.starting_xp;
		this._current_level = 1;
		for (int i = 0; i < globals.xp_to_level.Length; i++)
		{
			if (globals.xp_to_level[i] > this.starting_xp)
			{
				break;
			}
			this._current_level = i;
		}
		this.set_level_texture();
		this.count_label.text = string.Empty;
		this.gear_level_label.text = "GEAR LEVEL!";
		this.fill_sprite.fillAmount = 0f;
		this.level_anim_tp.ResetToBeginning();
		this.level_anim_ts.ResetToBeginning();
		base.gameObject.SetActive(true);
		this._level_tween.ResetToBeginning();
		this._level_tween.PlayForward();
		this.do_anim_check = true;
	}

	// Token: 0x06001317 RID: 4887 RVA: 0x00088554 File Offset: 0x00086754
	public void set_level_texture()
	{
		this.level_tc.enabled = false;
		this.level_tc.ResetToBeginning();
		this.level_widget.level_lbl.text = this._current_level.ToString();
		if (globals.player_data.latest_device_data)
		{
			this.level_widget.set_type(globals.player_data.latest_device_data.type);
		}
	}

	// Token: 0x06001318 RID: 4888 RVA: 0x000885C4 File Offset: 0x000867C4
	public void start_screen_crack()
	{
		if (this.screen_crack)
		{
			this.screen_crack.transform.localEulerAngles = new Vector3(0f, 0f, Random.Range(0f, 360f));
			this.screen_crack.ResetToBeginning();
			this.screen_crack.PlayForward();
		}
		this.level_tc.ResetToBeginning();
		this.level_tc.enabled = false;
		this.shake.play();
		globals.sfx_master.play(this.screen_crack_sfx, null);
	}

	// Token: 0x06001319 RID: 4889 RVA: 0x00088658 File Offset: 0x00086858
	private void set_fill(float left)
	{
		int num;
		if (this._current_level < globals.xp_to_level.Length - 1)
		{
			num = globals.xp_to_level[this._current_level + 1] - globals.xp_to_level[this._current_level];
		}
		else
		{
			num = globals.xp_to_level[this._current_level];
			left = (float)num;
		}
		if (left > (float)num)
		{
			left = (float)num;
		}
		this.count_label.text = left.ToString("0") + " / " + num.ToString();
		this.fill_sprite.fillAmount = left / (float)num;
	}

	// Token: 0x0600131A RID: 4890 RVA: 0x000886F0 File Offset: 0x000868F0
	private void OnDisable()
	{
		base.StopAllCoroutines();
	}

	// Token: 0x0600131B RID: 4891 RVA: 0x000886F8 File Offset: 0x000868F8
	public void on_finished_anim_in()
	{
		this.do_anim_check = false;
		base.StartCoroutine("anim_in_delay");
	}

	// Token: 0x0600131C RID: 4892 RVA: 0x00088710 File Offset: 0x00086910
	private IEnumerator anim_in_delay()
	{
		yield return new WaitForSeconds(0.75f);
		this.parent.pushDownItems(this._prib.getBannerHeight(), this._prib.transform);
		Vector3 to_pos = this.fill_sprite.transform.parent.InverseTransformPoint(this._prib.level_widget.transform.TransformPoint(this._prib.level_widget.transform.localPosition));
		to_pos.y -= this.parent.scroll_view.transform.localPosition.y - this.parent.orig_scroll_pos.y;
		this.level_anim_tp.to = to_pos;
		this.level_anim_tp.ResetToBeginning();
		this.level_anim_tp.PlayForward();
		this.level_anim_ts.ResetToBeginning();
		this.level_anim_ts.PlayForward();
		this.count_label.text = string.Empty;
		this.gear_level_label.text = string.Empty;
		yield break;
	}

	// Token: 0x0600131D RID: 4893 RVA: 0x0008872C File Offset: 0x0008692C
	public void on_finished_anim_out()
	{
		base.gameObject.SetActive(false);
		this._prib.startSlider();
	}

	// Token: 0x0600131E RID: 4894 RVA: 0x00088748 File Offset: 0x00086948
	protected void Update()
	{
		if (this.do_anim_check)
		{
			if (this._current_xp < (float)this.final_xp && !this._level_tween.enabled && !this.screen_crack.enabled)
			{
				if (this._current_level < globals.xp_to_level.Length - 1)
				{
					if (!this.level_tc.enabled && this._current_level < globals.gear_level_from_xp(this.final_xp))
					{
						this.level_tc.enabled = true;
						this.level_tc.PlayForward();
					}
					this.xp_tally_loop.gameObject.SetActive(true);
					int num = globals.xp_to_level[this._current_level];
					int num2 = globals.xp_to_level[this._current_level + 1];
					float num3 = (float)(num2 - num) / this.count_time;
					this._current_xp += num3 * Time.deltaTime;
					this.xp_tally_loop.audio.pitch = Mathf.Log((float)num2, 20f);
					if (this._current_xp > (float)this.final_xp || Input.GetMouseButtonDown(0))
					{
						this._current_xp = (float)this.final_xp;
					}
					this.set_fill(this._current_xp - (float)num);
					bool flag = false;
					while (this._current_level < globals.xp_to_level.Length - 1 && this._current_xp >= (float)globals.xp_to_level[this._current_level + 1])
					{
						this._current_level++;
						flag = true;
					}
					if (flag)
					{
						this.set_level_texture();
						this._level_tween.ResetToBeginning();
						this._level_tween.PlayForward();
					}
				}
				else if (this._current_level >= globals.xp_to_level.Length - 1)
				{
					this.count_label.text = "MAX!";
					this.fill_sprite.fillAmount = 1f;
					this._current_xp = (float)this.final_xp;
				}
			}
			else
			{
				this.xp_tally_loop.gameObject.SetActive(false);
				if (this._current_xp >= (float)this.final_xp)
				{
					this.level_tc.enabled = false;
					this.level_tc.ResetToBeginning();
					this.set_fill(this._current_xp - (float)globals.xp_to_level[this._current_level]);
					this.on_finished_anim_in();
				}
			}
		}
	}

	// Token: 0x0400142D RID: 5165
	public UILabel count_label;

	// Token: 0x0400142E RID: 5166
	public UISprite fill_sprite;

	// Token: 0x0400142F RID: 5167
	public TweenPosition level_anim_tp;

	// Token: 0x04001430 RID: 5168
	public TweenScale level_anim_ts;

	// Token: 0x04001431 RID: 5169
	public UILabel gear_level_label;

	// Token: 0x04001432 RID: 5170
	public TweenColor level_tc;

	// Token: 0x04001433 RID: 5171
	public LoopingSoundBehavior xp_tally_loop;

	// Token: 0x04001434 RID: 5172
	public ProgressReportLevelWidgetBehavior level_widget;

	// Token: 0x04001435 RID: 5173
	public TweenAlpha screen_crack;

	// Token: 0x04001436 RID: 5174
	public string screen_crack_sfx = "LevelUp";

	// Token: 0x04001437 RID: 5175
	public ShakeBehavior shake;

	// Token: 0x04001438 RID: 5176
	public float count_time = 2f;

	// Token: 0x04001439 RID: 5177
	public int starting_xp = 30;

	// Token: 0x0400143A RID: 5178
	public int final_xp = 120;

	// Token: 0x0400143B RID: 5179
	private float _current_xp;

	// Token: 0x0400143C RID: 5180
	private int _current_level = 1;

	// Token: 0x0400143D RID: 5181
	private TweenScale _level_tween;

	// Token: 0x0400143E RID: 5182
	private bool do_anim_check;

	// Token: 0x0400143F RID: 5183
	public ProgressReportPanelBehavior parent;

	// Token: 0x04001440 RID: 5184
	private ProgressReportItemBehavior _prib;
}
