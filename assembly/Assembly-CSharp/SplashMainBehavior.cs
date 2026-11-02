using System;
using UnityEngine;

// Token: 0x020001A8 RID: 424
public class SplashMainBehavior : MonoBehaviour
{
	// Token: 0x06000CB3 RID: 3251 RVA: 0x0005C484 File Offset: 0x0005A684
	protected virtual void Start()
	{
		globals.sfx_master.play(this.sting_sfx, null);
	}

	// Token: 0x06000CB4 RID: 3252 RVA: 0x0005C498 File Offset: 0x0005A698
	protected virtual void time_expired()
	{
		if (globals.build_type == build_type_enum.no_gear_demo && !string.IsNullOrEmpty(this.demo_next_state))
		{
			globals.FTUE_manager.set_state(this.demo_next_state, false);
		}
		else if (globals.FTUE_manager.done)
		{
			globals.FTUE_manager.finish();
		}
		else
		{
			globals.FTUE_manager.set_state(this.next_state, false);
		}
	}

	// Token: 0x06000CB5 RID: 3253 RVA: 0x0005C508 File Offset: 0x0005A708
	protected virtual void Update()
	{
		this.delay -= Time.deltaTime;
		if (Input.GetMouseButtonDown(0))
		{
			this.delay = -1f;
		}
		if (this.delay < 0f)
		{
			this.time_expired();
		}
	}

	// Token: 0x04000C9D RID: 3229
	public string sting_sfx;

	// Token: 0x04000C9E RID: 3230
	public string next_state;

	// Token: 0x04000C9F RID: 3231
	public string demo_next_state;

	// Token: 0x04000CA0 RID: 3232
	public float delay = 5f;
}
