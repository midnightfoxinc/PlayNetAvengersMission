using System;
using UnityEngine;

// Token: 0x020002DC RID: 732
public class ResultsPanelBehavior : MonoBehaviour
{
	// Token: 0x0600134C RID: 4940 RVA: 0x00089D1C File Offset: 0x00087F1C
	public void show(bool b)
	{
		base.gameObject.SetActive(b);
		if (b)
		{
			this.current_summary = 0;
			if (globals.BLE_manager.connectedDevice_data)
			{
				this.set_color(globals.BLE_manager.connectedDevice_data.deviceType);
			}
			else
			{
				this.set_color(Constants.PlaymationDeviceType.DEVICE_REPULSOR);
			}
			this.set_mission(globals.mission_summary[0]);
			this._previous_count = globals.mission_summary.Count;
			globals.sfx_master.play(this.sting_sfx, null);
		}
	}

	// Token: 0x0600134D RID: 4941 RVA: 0x00089DB0 File Offset: 0x00087FB0
	private void set_color(Constants.PlaymationDeviceType type)
	{
		if (type == Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			this.glow.color = this.gamma_color;
		}
		else
		{
			this.glow.color = this.repulsor_color;
		}
	}

	// Token: 0x0600134E RID: 4942 RVA: 0x00089DF0 File Offset: 0x00087FF0
	private void set_mission(missionSummaryClass s)
	{
		missionDataClass missionDataClass = globals.location_data.mission_by_id(s.mission);
		if (missionDataClass)
		{
			this.mission_texture.mainTexture = Resources.Load<Texture>(this.comics_bg_prefix + missionDataClass.id.ToString());
			this.mission_title_label.text = missionDataClass.name;
			if (missionDataClass.rated)
			{
				if (globals.environment_manager.useMedals)
				{
					this.medal_sprite.spriteName = globals.medal_spritename(s.grade);
				}
				this.medal_sprite.gameObject.SetActive(true);
				this.medal_tween.ResetToBeginning();
				this.medal_tween.PlayForward();
			}
			else
			{
				this.medal_sprite.gameObject.SetActive(false);
			}
			if (this.current_summary < globals.mission_summary.Count - 1)
			{
				this.next_summary_count.text = (globals.mission_summary.Count - 1 - this.current_summary).ToString();
				this.right_button.gameObject.SetActive(true);
			}
			else
			{
				this.right_button.gameObject.SetActive(false);
			}
			if (this.current_summary > 0)
			{
				this.prev_summary_count.text = this.current_summary.ToString();
				this.left_button.gameObject.SetActive(true);
			}
			else
			{
				this.left_button.gameObject.SetActive(false);
			}
			if (globals.mission_summary.Count > this._previous_count)
			{
				if (!this._next_summary_count_tween)
				{
					this._next_summary_count_tween = this.next_summary_count.GetComponent<UITweener>();
				}
				this._next_summary_count_tween.ResetToBeginning();
				this._next_summary_count_tween.PlayForward();
				this._previous_count = globals.mission_summary.Count;
			}
		}
	}

	// Token: 0x0600134F RID: 4943 RVA: 0x00089FC8 File Offset: 0x000881C8
	private void Update()
	{
		if (this.left_button.hit)
		{
			this.current_summary--;
			this.set_mission(globals.mission_summary[this.current_summary]);
			globals.sfx_master.play(this.advance_sfx, null);
		}
		else if (this.right_button.hit)
		{
			this.current_summary++;
			this.set_mission(globals.mission_summary[this.current_summary]);
			globals.sfx_master.play(this.advance_sfx, null);
		}
		if (this.close_button.clicked)
		{
			globals.clear_mission_summaries();
			this.show(false);
		}
	}

	// Token: 0x04001498 RID: 5272
	public buttonBehavior close_button;

	// Token: 0x04001499 RID: 5273
	public UITexture mission_texture;

	// Token: 0x0400149A RID: 5274
	public UISprite medal_sprite;

	// Token: 0x0400149B RID: 5275
	public UITweener medal_tween;

	// Token: 0x0400149C RID: 5276
	public UILabel mission_title_label;

	// Token: 0x0400149D RID: 5277
	public UILabel prev_summary_count;

	// Token: 0x0400149E RID: 5278
	public UILabel next_summary_count;

	// Token: 0x0400149F RID: 5279
	public buttonBehavior left_button;

	// Token: 0x040014A0 RID: 5280
	public buttonBehavior right_button;

	// Token: 0x040014A1 RID: 5281
	public string comics_bg_prefix = "mission comics/comic_";

	// Token: 0x040014A2 RID: 5282
	public string sting_sfx = "results sting";

	// Token: 0x040014A3 RID: 5283
	public string advance_sfx = "advance";

	// Token: 0x040014A4 RID: 5284
	public int current_summary;

	// Token: 0x040014A5 RID: 5285
	public UISprite glow;

	// Token: 0x040014A6 RID: 5286
	private UITweener _next_summary_count_tween;

	// Token: 0x040014A7 RID: 5287
	private int _previous_count;

	// Token: 0x040014A8 RID: 5288
	public Color repulsor_color;

	// Token: 0x040014A9 RID: 5289
	public Color gamma_color;
}
