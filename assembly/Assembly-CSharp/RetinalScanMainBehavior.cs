using System;
using UnityEngine;

// Token: 0x020001A7 RID: 423
public class RetinalScanMainBehavior : MonoBehaviour
{
	// Token: 0x06000CB1 RID: 3249 RVA: 0x0005C424 File Offset: 0x0005A624
	private void Start()
	{
		if (Application.isEditor)
		{
			globals.debug("retinal scan");
		}
		globals.retinalScan = true;
		Handheld.PlayFullScreenMovie(this.movie_name, Color.black, 2, 2);
		globals.FTUE_manager.set_state(this.next_state, false);
	}

	// Token: 0x04000C9B RID: 3227
	public string next_state = "done";

	// Token: 0x04000C9C RID: 3228
	public string movie_name = "retinal_scan.mp4";
}
