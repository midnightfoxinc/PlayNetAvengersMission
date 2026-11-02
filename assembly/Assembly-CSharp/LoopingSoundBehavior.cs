using System;
using UnityEngine;

// Token: 0x0200015B RID: 347
[RequireComponent(typeof(AudioSource))]
public class LoopingSoundBehavior : MonoBehaviour
{
	// Token: 0x170001A5 RID: 421
	// (get) Token: 0x06000B23 RID: 2851 RVA: 0x00052080 File Offset: 0x00050280
	public AudioSource audio
	{
		get
		{
			if (!this._audio)
			{
				this._audio = base.GetComponent<AudioSource>();
			}
			return this._audio;
		}
	}

	// Token: 0x06000B24 RID: 2852 RVA: 0x000520B0 File Offset: 0x000502B0
	private void Update()
	{
		this.audio.mute = SFXJukeboxBehavior.muted;
	}

	// Token: 0x04000AA6 RID: 2726
	private AudioSource _audio;
}
