using System;
using UnityEngine;

// Token: 0x0200019D RID: 413
public class FTUEManagerBehavior : MonoBehaviour
{
	// Token: 0x170001B5 RID: 437
	// (get) Token: 0x06000C79 RID: 3193 RVA: 0x0005AABC File Offset: 0x00058CBC
	// (set) Token: 0x06000C78 RID: 3192 RVA: 0x0005AAA0 File Offset: 0x00058CA0
	public bool done
	{
		get
		{
			return PlayerPrefs.GetInt("FTUE_done") == 1;
		}
		set
		{
			PlayerPrefs.SetInt("FTUE_done", (!value) ? 0 : 1);
		}
	}

	// Token: 0x06000C7A RID: 3194 RVA: 0x0005AACC File Offset: 0x00058CCC
	public void init()
	{
		this.state = FTUEManagerBehavior.FTUE_state_enum.none;
	}

	// Token: 0x06000C7B RID: 3195 RVA: 0x0005AAD8 File Offset: 0x00058CD8
	public void login()
	{
		this.set_state(FTUEManagerBehavior.FTUE_state_enum.login, false);
	}

	// Token: 0x06000C7C RID: 3196 RVA: 0x0005AAE4 File Offset: 0x00058CE4
	public void detect_gear()
	{
		this.set_state(FTUEManagerBehavior.FTUE_state_enum.ble_detect, false);
	}

	// Token: 0x06000C7D RID: 3197 RVA: 0x0005AAF0 File Offset: 0x00058CF0
	public void finish()
	{
		this.set_state(FTUEManagerBehavior.FTUE_state_enum.done, false);
	}

	// Token: 0x06000C7E RID: 3198 RVA: 0x0005AAFC File Offset: 0x00058CFC
	public void set_state(string s, bool done_check = false)
	{
		s = s.ToLower().Replace(' ', '_');
		bool flag = false;
		for (int i = 0; i < Enum.GetNames(typeof(FTUEManagerBehavior.FTUE_state_enum)).Length; i++)
		{
			if (s == ((FTUEManagerBehavior.FTUE_state_enum)i).ToString())
			{
				DMOManager.LogFTUEProgress(i + "_" + s);
				this.state = (FTUEManagerBehavior.FTUE_state_enum)i;
				flag = true;
				break;
			}
		}
		if (!flag)
		{
			globals.debugWarning("state not found: " + s + " | defaulting to \"done\" state");
			this.state = FTUEManagerBehavior.FTUE_state_enum.done;
		}
		this.set_state(this.state, done_check);
	}

	// Token: 0x06000C7F RID: 3199 RVA: 0x0005ABA8 File Offset: 0x00058DA8
	public void set_state(FTUEManagerBehavior.FTUE_state_enum s, bool done_check = false)
	{
		this.state = s;
		if (this.state == FTUEManagerBehavior.FTUE_state_enum.login && !globals.player_data.isGuestLogin())
		{
			this.state = this.already_logged_in_state;
		}
		if (done_check && this.done && this.state != FTUEManagerBehavior.FTUE_state_enum.done)
		{
			if (this.just_logged_in)
			{
				this.just_logged_in = false;
				this.state = FTUEManagerBehavior.FTUE_state_enum.retinal_scan;
			}
			else
			{
				this.state = FTUEManagerBehavior.FTUE_state_enum.done;
			}
		}
		switch (this.state)
		{
		case FTUEManagerBehavior.FTUE_state_enum.disclaimer:
			NavigationManager.load_scene(this.disclaimer_scene);
			break;
		case FTUEManagerBehavior.FTUE_state_enum.ble_detect:
			NavigationManager.load_scene(this.ble_detect_scene);
			break;
		case FTUEManagerBehavior.FTUE_state_enum.login:
			NavigationManager.load_scene(this.login_scene);
			break;
		case FTUEManagerBehavior.FTUE_state_enum.gear_detected:
			NavigationManager.load_scene(this.gear_detected_scene);
			break;
		case FTUEManagerBehavior.FTUE_state_enum.register_device:
			NavigationManager.load_scene(this.register_device_scene);
			break;
		case FTUEManagerBehavior.FTUE_state_enum.register_later:
			NavigationManager.load_scene(this.register_later_scene);
			break;
		case FTUEManagerBehavior.FTUE_state_enum.retinal_scan:
			NavigationManager.load_scene(this.retinal_scan_scene);
			break;
		case FTUEManagerBehavior.FTUE_state_enum.done:
			NavigationManager.load_scene(this.done_scene);
			break;
		}
	}

	// Token: 0x04000C2B RID: 3115
	public FTUEManagerBehavior.FTUE_state_enum state;

	// Token: 0x04000C2C RID: 3116
	public string disclaimer_scene = "disclaimer";

	// Token: 0x04000C2D RID: 3117
	public string ble_detect_scene = "ble detect";

	// Token: 0x04000C2E RID: 3118
	public string gear_detected_scene = "gear detected";

	// Token: 0x04000C2F RID: 3119
	public string login_scene = "login menu";

	// Token: 0x04000C30 RID: 3120
	public string register_device_scene = "register device menu";

	// Token: 0x04000C31 RID: 3121
	public string register_later_scene = "register later";

	// Token: 0x04000C32 RID: 3122
	public string retinal_scan_scene = "retinal scan";

	// Token: 0x04000C33 RID: 3123
	public string done_scene = NavigationManager.hq_scene;

	// Token: 0x04000C34 RID: 3124
	public int register_device_id;

	// Token: 0x04000C35 RID: 3125
	public FTUEManagerBehavior.FTUE_state_enum already_logged_in_state = FTUEManagerBehavior.FTUE_state_enum.gear_detected;

	// Token: 0x04000C36 RID: 3126
	public bool just_logged_in;

	// Token: 0x0200019E RID: 414
	public enum FTUE_state_enum
	{
		// Token: 0x04000C38 RID: 3128
		none,
		// Token: 0x04000C39 RID: 3129
		disclaimer,
		// Token: 0x04000C3A RID: 3130
		ble_detect,
		// Token: 0x04000C3B RID: 3131
		login,
		// Token: 0x04000C3C RID: 3132
		gear_detected,
		// Token: 0x04000C3D RID: 3133
		register_device,
		// Token: 0x04000C3E RID: 3134
		register_later,
		// Token: 0x04000C3F RID: 3135
		retinal_scan,
		// Token: 0x04000C40 RID: 3136
		done
	}
}
