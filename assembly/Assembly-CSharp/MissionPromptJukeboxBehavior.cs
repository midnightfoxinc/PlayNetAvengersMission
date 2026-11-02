using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200015C RID: 348
[RequireComponent(typeof(AudioSource))]
public class MissionPromptJukeboxBehavior : MonoBehaviour
{
	// Token: 0x170001A6 RID: 422
	// (get) Token: 0x06000B26 RID: 2854 RVA: 0x000520CC File Offset: 0x000502CC
	public AudioSource audio
	{
		get
		{
			if (!this._audio)
			{
				this._audio = base.GetComponent<AudioSource>();
				if (!this._audio)
				{
					this._audio = base.gameObject.AddComponent<AudioSource>();
				}
			}
			return this._audio;
		}
	}

	// Token: 0x06000B27 RID: 2855 RVA: 0x0005211C File Offset: 0x0005031C
	public void play(string p)
	{
		if (SFXJukeboxBehavior.muted)
		{
			return;
		}
		for (int i = 0; i < this.prompt.Count; i++)
		{
			if (this.prompt[i].name == p)
			{
				this.audio.Stop();
				this.audio.clip = this.prompt[i];
				this.audio.Play();
				return;
			}
		}
		globals.debugWarning("no prompt found with name: " + p);
	}

	// Token: 0x06000B28 RID: 2856 RVA: 0x000521AC File Offset: 0x000503AC
	public void stop()
	{
		this.audio.Stop();
	}

	// Token: 0x06000B29 RID: 2857 RVA: 0x000521BC File Offset: 0x000503BC
	[ContextMenu("Alphabetize")]
	private void alphabetize()
	{
		this.prompt.Sort((AudioClip x, AudioClip y) => x.name.CompareTo(y.name));
	}

	// Token: 0x04000AA7 RID: 2727
	public List<AudioClip> prompt;

	// Token: 0x04000AA8 RID: 2728
	private AudioSource _audio;
}
