using System;
using UnityEngine;

// Token: 0x0200015A RID: 346
[RequireComponent(typeof(AudioSource))]
public class AmbientSoundBehavior : MonoBehaviour
{
	// Token: 0x170001A4 RID: 420
	// (get) Token: 0x06000B20 RID: 2848 RVA: 0x00051FC0 File Offset: 0x000501C0
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

	// Token: 0x06000B21 RID: 2849 RVA: 0x00051FF0 File Offset: 0x000501F0
	private void Update()
	{
		this.audio.mute = SFXJukeboxBehavior.muted;
		if (SFXJukeboxBehavior.muted)
		{
			return;
		}
		this._countdown -= Time.deltaTime;
		if (this._countdown < 0f && !this.audio.isPlaying)
		{
			this.audio.clip = this.sfx_set.random_sfx();
			this.audio.Play();
			this._countdown = this.delay;
		}
	}

	// Token: 0x04000AA2 RID: 2722
	public sfx_set_class sfx_set;

	// Token: 0x04000AA3 RID: 2723
	public float delay;

	// Token: 0x04000AA4 RID: 2724
	private float _countdown;

	// Token: 0x04000AA5 RID: 2725
	private AudioSource _audio;
}
