using System;
using UnityEngine;

// Token: 0x020001FA RID: 506
public class PlayLoopedSoundShield : MonoBehaviour
{
	// Token: 0x06000E80 RID: 3712 RVA: 0x00066048 File Offset: 0x00064248
	private void Start()
	{
		if (this.MyWeaponInfo.LoopingShootSound)
		{
			AudioSource audioSource = base.gameObject.AddComponent<AudioSource>();
			audioSource.loop = true;
			audioSource.clip = this.MyWeaponInfo.LoopingShootSound;
			audioSource.playOnAwake = true;
			audioSource.Play();
			audioSource.mute = SFXJukeboxBehavior.muted;
		}
	}

	// Token: 0x04000E61 RID: 3681
	public RepulsorTestFireBehavior.WeaponInfo MyWeaponInfo;
}
