using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000160 RID: 352
[RequireComponent(typeof(AudioSource))]
public class SFXJukeboxBehavior : MonoBehaviour
{
	// Token: 0x170001A9 RID: 425
	// (get) Token: 0x06000B3B RID: 2875 RVA: 0x0005271C File Offset: 0x0005091C
	// (set) Token: 0x06000B3C RID: 2876 RVA: 0x00052764 File Offset: 0x00050964
	public static bool muted
	{
		get
		{
			bool? muted = SFXJukeboxBehavior._muted;
			if (muted == null)
			{
				SFXJukeboxBehavior._muted = new bool?(PlayerPrefs.GetInt("sfx muted", 0) > 0);
			}
			bool? muted2 = SFXJukeboxBehavior._muted;
			return muted2.Value;
		}
		set
		{
			SFXJukeboxBehavior._muted = new bool?(value);
			string text = "sfx muted";
			bool? muted = SFXJukeboxBehavior._muted;
			PlayerPrefs.SetInt(text, (!muted.Value) ? 0 : 1);
		}
	}

	// Token: 0x170001AA RID: 426
	// (get) Token: 0x06000B3D RID: 2877 RVA: 0x000527A0 File Offset: 0x000509A0
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

	// Token: 0x06000B3E RID: 2878 RVA: 0x000527F0 File Offset: 0x000509F0
	public bool try_to_play(string set, GameObject target = null)
	{
		if (SFXJukeboxBehavior.muted)
		{
			return true;
		}
		if (this.sfx_set == null || this.sfx_set.Count < 1)
		{
			if (this.complain)
			{
				globals.debug(base.name + " has a sfx jukebox with no sfx sets");
			}
			return false;
		}
		if (target == null)
		{
			target = base.gameObject;
		}
		AudioSource audioSource = target.GetComponent<AudioSource>();
		if (!audioSource)
		{
			audioSource = target.AddComponent<AudioSource>();
			audioSource.playOnAwake = false;
			audioSource.rolloffMode = 1;
		}
		bool result = false;
		for (int i = 0; i < this.sfx_set.Count; i++)
		{
			if (this.sfx_set[i] != null && this.sfx_set[i].name == set)
			{
				AudioClip audioClip = this.sfx_set[i].random_sfx();
				if (audioClip != null)
				{
					switch (this.sfx_set[i].priority)
					{
					case sfx_priority_enum.play_all:
						audioSource.PlayOneShot(audioClip);
						break;
					case sfx_priority_enum.stop_previous:
						audioSource.Stop();
						audioSource.clip = audioClip;
						audioSource.Play();
						break;
					case sfx_priority_enum.keep_previous:
						if (!audioSource.isPlaying)
						{
							audioSource.clip = audioClip;
							audioSource.Play();
						}
						break;
					}
				}
				result = true;
				break;
			}
		}
		return result;
	}

	// Token: 0x06000B3F RID: 2879 RVA: 0x00052960 File Offset: 0x00050B60
	public void play_sfx(string set)
	{
		this.play(set, null);
	}

	// Token: 0x06000B40 RID: 2880 RVA: 0x0005296C File Offset: 0x00050B6C
	public void play_sfx_on_master(string set)
	{
		if (globals.sfx_master)
		{
			globals.sfx_master.play(set, null);
		}
		else
		{
			this.play(set, null);
		}
	}

	// Token: 0x06000B41 RID: 2881 RVA: 0x000529A4 File Offset: 0x00050BA4
	public void play(string set, GameObject target = null)
	{
		if (string.IsNullOrEmpty(set))
		{
			return;
		}
		if (!this.try_to_play(set, target) && this.complain)
		{
			if (target)
			{
				globals.debug("no sfx set found with name: " + set + " | called by " + NGUITools.GetHierarchy(target));
			}
			else
			{
				globals.debug("no sfx set found with name: " + set);
			}
		}
	}

	// Token: 0x06000B42 RID: 2882 RVA: 0x00052A10 File Offset: 0x00050C10
	public void play_once(string set, GameObject target = null)
	{
		float num = Time.timeSinceLevelLoad - this._last_time;
		if (this._last_time < 0f || this._last_set != set || num > 0.1f)
		{
			this._last_set = set;
			this._last_time = Time.timeSinceLevelLoad;
			this.play(set, target);
		}
	}

	// Token: 0x06000B43 RID: 2883 RVA: 0x00052A70 File Offset: 0x00050C70
	public void stop()
	{
		if (this.audio)
		{
			this.audio.Stop();
		}
	}

	// Token: 0x06000B44 RID: 2884 RVA: 0x00052A90 File Offset: 0x00050C90
	[ContextMenu("Set All to stop_previous")]
	public void set_all_stop_previous()
	{
		for (int i = 0; i < this.sfx_set.Count; i++)
		{
			this.sfx_set[i].priority = sfx_priority_enum.stop_previous;
		}
	}

	// Token: 0x06000B45 RID: 2885 RVA: 0x00052ACC File Offset: 0x00050CCC
	[ContextMenu("Set All to play_all")]
	public void set_all_play_all()
	{
		for (int i = 0; i < this.sfx_set.Count; i++)
		{
			this.sfx_set[i].priority = sfx_priority_enum.play_all;
		}
	}

	// Token: 0x04000ABC RID: 2748
	public bool complain;

	// Token: 0x04000ABD RID: 2749
	public List<sfx_set_class> sfx_set = new List<sfx_set_class>();

	// Token: 0x04000ABE RID: 2750
	private string _last_set = string.Empty;

	// Token: 0x04000ABF RID: 2751
	private float _last_time = -1f;

	// Token: 0x04000AC0 RID: 2752
	private static bool? _muted;

	// Token: 0x04000AC1 RID: 2753
	private AudioSource _audio;
}
