using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001FB RID: 507
public class PlaySoundOnImpact : MonoBehaviour
{
	// Token: 0x06000E82 RID: 3714 RVA: 0x000660B0 File Offset: 0x000642B0
	private void Start()
	{
		this.MyAudioSource = base.gameObject.AddComponent<AudioSource>();
		this.ImpactSounds = new List<AudioClip>();
		this.ImpactSounds.AddRange(globals.armory_main.testfire_scene.ShrapnelImpactSounds);
	}

	// Token: 0x06000E83 RID: 3715 RVA: 0x000660F4 File Offset: 0x000642F4
	private void OnCollisionEnter(Collision collision)
	{
		if (Random.Range(0, 5) == 0 && !SFXJukeboxBehavior.muted)
		{
			this.MyAudioSource.PlayOneShot(this.ImpactSounds[Random.Range(0, this.ImpactSounds.Count - 1)], 0.5f);
		}
	}

	// Token: 0x04000E62 RID: 3682
	private AudioSource MyAudioSource;

	// Token: 0x04000E63 RID: 3683
	public List<AudioClip> ImpactSounds;
}
