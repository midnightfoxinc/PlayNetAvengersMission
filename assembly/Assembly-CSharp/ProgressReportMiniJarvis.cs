using System;
using UnityEngine;

// Token: 0x020002D7 RID: 727
[AddComponentMenu("Scripts/Progress Report/Progress Report Mini Jarvis Behavior")]
public class ProgressReportMiniJarvis : MonoBehaviour
{
	// Token: 0x0600132E RID: 4910 RVA: 0x00088BA4 File Offset: 0x00086DA4
	public void on_jarvis_in_finished()
	{
		this.parent.on_jarvis_in_finished();
	}

	// Token: 0x0600132F RID: 4911 RVA: 0x00088BB4 File Offset: 0x00086DB4
	public void on_jarvis_out_finished()
	{
		this.parent.on_jarvis_out_finished();
	}

	// Token: 0x04001451 RID: 5201
	public ProgressReportPanelBehavior parent;
}
