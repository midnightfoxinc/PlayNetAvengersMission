using System;
using UnityEngine;

// Token: 0x0200017B RID: 379
public class DontFindGearBehavior : MonoBehaviour
{
	// Token: 0x06000BD9 RID: 3033 RVA: 0x00056E28 File Offset: 0x00055028
	private void Awake()
	{
		globals.autoConnect = false;
		globals.BLE_manager.dont_find_gear_scene = NavigationManager.current_scene();
	}
}
