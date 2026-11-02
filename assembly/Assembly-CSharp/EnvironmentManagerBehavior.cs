using System;
using UnityEngine;

// Token: 0x02000195 RID: 405
public class EnvironmentManagerBehavior : MonoBehaviour
{
	// Token: 0x04000C07 RID: 3079
	public build_type_enum build_type;

	// Token: 0x04000C08 RID: 3080
	public bool enableStore = true;

	// Token: 0x04000C09 RID: 3081
	public bool enableNotifications = true;

	// Token: 0x04000C0A RID: 3082
	public bool useMedals;

	// Token: 0x04000C0B RID: 3083
	public bool isProd;

	// Token: 0x04000C0C RID: 3084
	public bool force_version;

	// Token: 0x04000C0D RID: 3085
	public bool log_SDK;

	// Token: 0x04000C0E RID: 3086
	public build_phase_enum build_phase = build_phase_enum.CI;
}
