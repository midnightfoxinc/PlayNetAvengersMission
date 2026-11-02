using System;
using UnityEngine;

// Token: 0x020001AA RID: 426
public class TempMovieBehavior : MonoBehaviour
{
	// Token: 0x06000CBB RID: 3259 RVA: 0x0005C7A8 File Offset: 0x0005A9A8
	public void play_sfx(string sfx)
	{
		this.sfx_jukebox.play(sfx, null);
	}

	// Token: 0x04000CA7 RID: 3239
	public SFXJukeboxBehavior sfx_jukebox;
}
