using System;
using UnityEngine;

// Token: 0x020002AC RID: 684
public class LocationAmbientBehavior : LoopingSoundBehavior
{
	// Token: 0x06001271 RID: 4721 RVA: 0x00082EC4 File Offset: 0x000810C4
	public void set_location(string location)
	{
		for (int i = 0; i < this.location_loop.Length; i++)
		{
			if (this.location_loop[i].location == location)
			{
				base.audio.clip = this.location_loop[i].clip;
				base.audio.Play();
				return;
			}
		}
		base.audio.Stop();
	}

	// Token: 0x04001303 RID: 4867
	public LocationAmbientBehavior.location_loop_class[] location_loop;

	// Token: 0x020002AD RID: 685
	[Serializable]
	public class location_loop_class
	{
		// Token: 0x04001304 RID: 4868
		public string location;

		// Token: 0x04001305 RID: 4869
		public AudioClip clip;
	}
}
