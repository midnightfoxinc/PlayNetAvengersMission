using System;
using UnityEngine;

// Token: 0x0200029E RID: 670
public class LocationButtonBehavior : ButtonCoreBehavior
{
	// Token: 0x17000224 RID: 548
	// (get) Token: 0x06001223 RID: 4643 RVA: 0x00080C98 File Offset: 0x0007EE98
	public override bool hovered
	{
		get
		{
			return globals.selectedObject == this.press_collider.gameObject;
		}
	}

	// Token: 0x06001224 RID: 4644 RVA: 0x00080CB0 File Offset: 0x0007EEB0
	public void set_depth()
	{
		if (!this._panel)
		{
			this._panel = base.GetComponent<UIPanel>();
		}
		if (this._panel)
		{
			float num = this.press_collider.transform.position.z / this._panel.root.transform.localScale.z;
			this._panel.depth = -(int)num;
		}
	}

	// Token: 0x06001225 RID: 4645 RVA: 0x00080D30 File Offset: 0x0007EF30
	public void set_alpha(float a)
	{
		if (!this._panel)
		{
			this._panel = base.GetComponent<UIPanel>();
		}
		if (this._panel)
		{
			this._panel.alpha = a;
		}
	}

	// Token: 0x06001226 RID: 4646 RVA: 0x00080D78 File Offset: 0x0007EF78
	public void set_state(location_button_state_enum s)
	{
		this.state = s;
		if (!this.locked_icon)
		{
			return;
		}
		this.locked_icon.SetActive(s == location_button_state_enum.locked);
		this.low_alert_icon.SetActive(s == location_button_state_enum.low_alert);
		this.high_alert_icon.SetActive(s == location_button_state_enum.high_alert);
		this.complete_icon.SetActive(s == location_button_state_enum.complete);
		this.mastered_icon.SetActive(s == location_button_state_enum.mastered);
		this.locked_label_bg.gameObject.SetActive(s == location_button_state_enum.locked);
		this.low_alert_label_bg.gameObject.SetActive(s == location_button_state_enum.low_alert);
		this.high_alert_label_bg.gameObject.SetActive(s == location_button_state_enum.high_alert);
		this.complete_label_bg.gameObject.SetActive(s == location_button_state_enum.complete || s == location_button_state_enum.mastered);
	}

	// Token: 0x06001227 RID: 4647 RVA: 0x00080E44 File Offset: 0x0007F044
	public void update_state(bool set_high = false)
	{
		if (set_high)
		{
			this.set_state(location_button_state_enum.high_alert);
		}
		else if (this._data.unlocked())
		{
			switch (this._data.completion())
			{
			case locationDataItemClass.completion_enum.zero:
				this.set_state(location_button_state_enum.low_alert);
				break;
			case locationDataItemClass.completion_enum.partial:
				this.set_state(location_button_state_enum.low_alert);
				break;
			case locationDataItemClass.completion_enum.complete:
				this.set_state(location_button_state_enum.complete);
				break;
			case locationDataItemClass.completion_enum.mastered:
				this.set_state(location_button_state_enum.mastered);
				break;
			}
		}
		else
		{
			this.set_state(location_button_state_enum.locked);
		}
		this.SetCompletion(this._data.CompletionFloat(false));
	}

	// Token: 0x06001228 RID: 4648 RVA: 0x00080EE8 File Offset: 0x0007F0E8
	public void set_data(locationDataItemClass d)
	{
		base.transform.localEulerAngles = d.rotation;
		if (this.location_icon)
		{
			this.location_icon.spriteName = d.offworld_icon;
		}
		this._data = d;
		this.label.text = d.name.ToUpper();
		this.id = d.id;
		string text = this.id + "_Chaos";
		AudioClip audioClip = Resources.Load("audio/gtm_locations/" + text) as AudioClip;
		if (!globals.hq_main && this.locationSfx && audioClip && this.locationSfx.enabled)
		{
			this.locationSfx.audio.clip = audioClip;
			this.locationSfx.audio.Play();
		}
		else
		{
			this.locationSfx.audio.clip = null;
		}
		this.update_state(false);
	}

	// Token: 0x06001229 RID: 4649 RVA: 0x00080FF4 File Offset: 0x0007F1F4
	public void SetCompletion(float Completion)
	{
		for (int i = 0; i < this.LocationProgressMeter.Length; i++)
		{
			if (this.LocationProgressMeter[i])
			{
				this.LocationProgressMeter[i].fillAmount = Completion;
			}
		}
	}

	// Token: 0x04001291 RID: 4753
	public Collider press_collider;

	// Token: 0x04001292 RID: 4754
	public UILabel label;

	// Token: 0x04001293 RID: 4755
	public UISprite locked_label_bg;

	// Token: 0x04001294 RID: 4756
	public UISprite low_alert_label_bg;

	// Token: 0x04001295 RID: 4757
	public UISprite high_alert_label_bg;

	// Token: 0x04001296 RID: 4758
	public UISprite complete_label_bg;

	// Token: 0x04001297 RID: 4759
	public UISprite location_icon;

	// Token: 0x04001298 RID: 4760
	public string id;

	// Token: 0x04001299 RID: 4761
	public location_button_state_enum state;

	// Token: 0x0400129A RID: 4762
	public LoopingSoundBehavior locationSfx;

	// Token: 0x0400129B RID: 4763
	public GameObject locked_icon;

	// Token: 0x0400129C RID: 4764
	public GameObject low_alert_icon;

	// Token: 0x0400129D RID: 4765
	public GameObject high_alert_icon;

	// Token: 0x0400129E RID: 4766
	public GameObject complete_icon;

	// Token: 0x0400129F RID: 4767
	public GameObject mastered_icon;

	// Token: 0x040012A0 RID: 4768
	public UISprite[] LocationProgressMeter;

	// Token: 0x040012A1 RID: 4769
	public UISprite alert_icon;

	// Token: 0x040012A2 RID: 4770
	private locationDataItemClass _data;

	// Token: 0x040012A3 RID: 4771
	private UIPanel _panel;
}
