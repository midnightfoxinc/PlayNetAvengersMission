using System;
using UnityEngine;

// Token: 0x02000180 RID: 384
public class ChooseEnvMainBehavior : MonoBehaviour
{
	// Token: 0x06000BE6 RID: 3046 RVA: 0x00057288 File Offset: 0x00055488
	private void Start()
	{
		if (globals.environment_manager.build_phase == build_phase_enum.RC)
		{
			NavigationManager.load_scene(this.next_scene);
		}
		else
		{
			this.panel.SetActive(true);
		}
	}

	// Token: 0x06000BE7 RID: 3047 RVA: 0x000572C4 File Offset: 0x000554C4
	private void set_production(bool b)
	{
		globals.environment_manager.isProd = b;
		bool flag = PlayerPrefs.GetInt("last_env_prod", 0) == 1;
		if (b != flag)
		{
			globals.debug("environment changed. Logging out.");
			globals.player_data.logout();
			globals.BLE_manager.logout();
		}
		PlayerPrefs.SetInt("last_env_prod", (!b) ? 0 : 1);
		NavigationManager.load_scene(this.next_scene);
	}

	// Token: 0x06000BE8 RID: 3048 RVA: 0x00057334 File Offset: 0x00055534
	private void Update()
	{
		if (this.staging_button.hit)
		{
			globals.debug("environment set to staging!");
			this.set_production(false);
		}
		else if (this.prod_button.hit)
		{
			globals.debug("environment set to production!");
			this.set_production(true);
		}
	}

	// Token: 0x04000BBC RID: 3004
	public GameObject panel;

	// Token: 0x04000BBD RID: 3005
	public buttonBehavior staging_button;

	// Token: 0x04000BBE RID: 3006
	public buttonBehavior prod_button;

	// Token: 0x04000BBF RID: 3007
	public string next_scene = "starting scene";
}
