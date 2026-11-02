using System;
using UnityEngine;

// Token: 0x020001C7 RID: 455
[RequireComponent(typeof(HockeyAppAndroid))]
[RequireComponent(typeof(HockeyAppIOS))]
public class HockeyAppSwitcherBehavior : MonoBehaviour
{
	// Token: 0x06000D33 RID: 3379 RVA: 0x0005EEF4 File Offset: 0x0005D0F4
	private void Start()
	{
		HockeyAppAndroid component = base.GetComponent<HockeyAppAndroid>();
		switch (globals.environment_manager.build_phase)
		{
		case build_phase_enum.CI:
			component.appID = this.Android.CI;
			break;
		case build_phase_enum.QA:
			component.appID = this.Android.QA;
			break;
		case build_phase_enum.RC:
			component.appID = this.Android.RC;
			break;
		}
		component.init();
	}

	// Token: 0x04000D3F RID: 3391
	public HockeyAppSwitcherBehavior.HA_ID_collection_class iOS;

	// Token: 0x04000D40 RID: 3392
	public HockeyAppSwitcherBehavior.HA_ID_collection_class Android;

	// Token: 0x020001C8 RID: 456
	[Serializable]
	public class HA_ID_collection_class
	{
		// Token: 0x04000D41 RID: 3393
		public string CI;

		// Token: 0x04000D42 RID: 3394
		public string QA;

		// Token: 0x04000D43 RID: 3395
		public string RC;
	}
}
