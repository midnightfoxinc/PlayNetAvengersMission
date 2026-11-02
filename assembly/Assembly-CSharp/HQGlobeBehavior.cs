using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200029F RID: 671
public class HQGlobeBehavior : MonoBehaviour
{
	// Token: 0x0600122B RID: 4651 RVA: 0x00081050 File Offset: 0x0007F250
	private void Start()
	{
		int num = 0;
		int num2 = 0;
		this.onworld_button[0].press_collider.enabled = false;
		this.offworld_button[0].press_collider.enabled = false;
		for (int i = 0; i < globals.location_data.item.Count; i++)
		{
			if (globals.location_data.item[i].offworld)
			{
				if (this.offworld_button.Count <= num2)
				{
					LocationButtonBehavior locationButtonBehavior = this.offworld_button[0].CopyInPlace() as LocationButtonBehavior;
					locationButtonBehavior.name = "offworld button " + this.offworld_button.Count.ToString();
					this.offworld_button.Add(locationButtonBehavior);
				}
				this.offworld_button[num2].set_data(globals.location_data.item[i]);
				num2++;
			}
			else
			{
				if (this.onworld_button.Count <= num)
				{
					LocationButtonBehavior locationButtonBehavior2 = this.onworld_button[0].CopyInPlace() as LocationButtonBehavior;
					locationButtonBehavior2.name = "location button " + this.onworld_button.Count.ToString();
					this.onworld_button.Add(locationButtonBehavior2);
				}
				this.onworld_button[num].set_data(globals.location_data.item[i]);
				num++;
			}
		}
	}

	// Token: 0x0600122C RID: 4652 RVA: 0x000811CC File Offset: 0x0007F3CC
	private void Update()
	{
		missionDataClass missionDataClass = globals.location_data.alert_mission();
		string text = string.Empty;
		if (missionDataClass)
		{
			text = missionDataClass.location.id;
		}
		for (int i = 0; i < this.onworld_button.Count; i++)
		{
			float alpha = 1f;
			float num = Vector3.Dot(this.onworld_button[i].transform.forward, Vector3.forward);
			if (num < 0f)
			{
				if (num > -0.25f)
				{
					alpha = Mathf.Lerp(1f, this.min_alpha, num * -4f);
				}
				else
				{
					alpha = this.min_alpha;
				}
			}
			this.onworld_button[i].set_alpha(alpha);
			this.onworld_button[i].update_state(this.onworld_button[i].id == text);
		}
		for (int j = 0; j < this.offworld_button.Count; j++)
		{
			float alpha2 = 1f;
			float num2 = Vector3.Dot(this.offworld_button[j].transform.forward, Vector3.forward);
			if (num2 < 0f)
			{
				if (num2 > -0.25f)
				{
					alpha2 = Mathf.Lerp(1f, this.min_alpha, num2 * -4f);
				}
				else
				{
					alpha2 = this.min_alpha;
				}
			}
			this.offworld_button[j].set_alpha(alpha2);
			this.offworld_button[j].update_state(this.offworld_button[j].id == text);
		}
		this.count_label.gameObject.SetActive(globals.mission_summary.Count > 0);
		this.count_label.text = globals.mission_summary.Count.ToString();
	}

	// Token: 0x040012A4 RID: 4772
	public Collider globe_collider;

	// Token: 0x040012A5 RID: 4773
	public ConstantSpinBehavior spin;

	// Token: 0x040012A6 RID: 4774
	public List<LocationButtonBehavior> onworld_button;

	// Token: 0x040012A7 RID: 4775
	public List<LocationButtonBehavior> offworld_button;

	// Token: 0x040012A8 RID: 4776
	public UILabel count_label;

	// Token: 0x040012A9 RID: 4777
	public float min_alpha = 0.25f;
}
