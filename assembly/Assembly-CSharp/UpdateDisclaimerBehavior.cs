using System;
using UnityEngine;

// Token: 0x0200028C RID: 652
public class UpdateDisclaimerBehavior : MonoBehaviour
{
	// Token: 0x0600116D RID: 4461 RVA: 0x0007C600 File Offset: 0x0007A800
	private void Start()
	{
	}

	// Token: 0x0600116E RID: 4462 RVA: 0x0007C604 File Offset: 0x0007A804
	public void show(bool show_scavenger_hunt)
	{
		this._show_scavenger_hunt = show_scavenger_hunt;
		this._countdown = this.timeout;
		base.gameObject.SetActive(true);
	}

	// Token: 0x0600116F RID: 4463 RVA: 0x0007C628 File Offset: 0x0007A828
	private void Update()
	{
		this._countdown -= Time.deltaTime;
		if (this._countdown < 0f)
		{
			if (this._show_scavenger_hunt)
			{
				globals.scavenger_hunt_manager.start_scavenger_hunt();
			}
			base.gameObject.SetActive(false);
		}
	}

	// Token: 0x040011DB RID: 4571
	public float timeout = 5f;

	// Token: 0x040011DC RID: 4572
	private float _countdown;

	// Token: 0x040011DD RID: 4573
	private bool _show_scavenger_hunt;
}
