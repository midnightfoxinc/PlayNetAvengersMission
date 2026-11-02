using System;
using UnityEngine;

// Token: 0x0200015D RID: 349
[RequireComponent(typeof(AudioSource))]
public class MusicJukeboxBehavior : MonoBehaviour
{
	// Token: 0x170001A7 RID: 423
	// (get) Token: 0x06000B2D RID: 2861 RVA: 0x0005222C File Offset: 0x0005042C
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

	// Token: 0x170001A8 RID: 424
	// (get) Token: 0x06000B2E RID: 2862 RVA: 0x0005225C File Offset: 0x0005045C
	// (set) Token: 0x06000B2F RID: 2863 RVA: 0x000522A4 File Offset: 0x000504A4
	public static bool muted
	{
		get
		{
			bool? muted = MusicJukeboxBehavior._muted;
			if (muted == null)
			{
				MusicJukeboxBehavior._muted = new bool?(PlayerPrefs.GetInt("music muted", 0) > 0);
			}
			bool? muted2 = MusicJukeboxBehavior._muted;
			return muted2.Value;
		}
		set
		{
			MusicJukeboxBehavior._muted = new bool?(value);
			string text = "music muted";
			bool? muted = MusicJukeboxBehavior._muted;
			PlayerPrefs.SetInt(text, (!muted.Value) ? 0 : 1);
		}
	}

	// Token: 0x06000B30 RID: 2864 RVA: 0x000522E0 File Offset: 0x000504E0
	private void Awake()
	{
		this.volume_progress = 0f;
		this.audio.volume = 0f;
		this.target_volume = this.max_volume;
		if (this.audio.clip)
		{
			this.current_music = this.audio.clip.name;
		}
	}

	// Token: 0x06000B31 RID: 2865 RVA: 0x00052340 File Offset: 0x00050540
	private void play_by_name(string n)
	{
		if (string.IsNullOrEmpty(n))
		{
			this.audio.clip = null;
			return;
		}
		bool flag = false;
		for (int i = 0; i < this.music.Length; i++)
		{
			if (this.music[i] != null && this.music[i].name == n)
			{
				this.audio.clip = this.music[i];
				this.audio.Play();
				this.target_volume = this.max_volume;
				flag = true;
				this.current_music = n;
				break;
			}
		}
		if (!flag && MusicJukeboxBehavior.complain)
		{
			globals.debug("no music clip found with name: " + n);
		}
	}

	// Token: 0x06000B32 RID: 2866 RVA: 0x00052404 File Offset: 0x00050604
	public void fade_out(float f = -1f)
	{
		this.target_volume = 0f;
		this.last_volume = this.audio.volume;
		if (f > -1f)
		{
			this.fade_speed = f;
		}
	}

	// Token: 0x06000B33 RID: 2867 RVA: 0x00052440 File Offset: 0x00050640
	public void set_volume(float v)
	{
		this.volume_progress = 1f;
		this.target_volume = v;
	}

	// Token: 0x06000B34 RID: 2868 RVA: 0x00052454 File Offset: 0x00050654
	public void change_music(string n, float f = -1f)
	{
		if (this.current_music == n)
		{
			this.target_volume = this.max_volume;
			this.last_volume = this.audio.volume;
			return;
		}
		if (this.target_volume != 0f)
		{
			this.target_volume = 0f;
			this.last_volume = this.audio.volume;
			this.volume_progress = 0f;
		}
		this.current_music = n;
		if (f >= 0f)
		{
			this.fade_speed = f;
		}
	}

	// Token: 0x06000B35 RID: 2869 RVA: 0x000524E0 File Offset: 0x000506E0
	private void Update()
	{
		if (Application.isEditor && Input.GetKeyDown(109))
		{
			MusicJukeboxBehavior.muted = !MusicJukeboxBehavior.muted;
		}
		if (MusicJukeboxBehavior.muted)
		{
			this.audio.mute = true;
			return;
		}
		this.audio.mute = false;
		if (this.volume_progress < 1f)
		{
			if (this.fade_speed <= 0f)
			{
				this.volume_progress = 1f;
			}
			else
			{
				this.volume_progress += Time.deltaTime / this.fade_speed;
			}
			this.audio.volume = Mathf.Lerp(this.last_volume, this.target_volume, this.volume_progress);
		}
		else
		{
			this.audio.volume = this.target_volume;
			if (this.target_volume == 0f && (!this.audio.clip || this.current_music != this.audio.clip.name))
			{
				this.volume_progress = 0f;
				this.last_volume = 0f;
				this.play_by_name(this.current_music);
			}
		}
	}

	// Token: 0x04000AAA RID: 2730
	public AudioClip[] music;

	// Token: 0x04000AAB RID: 2731
	public float max_volume = 1f;

	// Token: 0x04000AAC RID: 2732
	public float fade_speed = 0.25f;

	// Token: 0x04000AAD RID: 2733
	public static bool complain;

	// Token: 0x04000AAE RID: 2734
	private float target_volume;

	// Token: 0x04000AAF RID: 2735
	private float last_volume;

	// Token: 0x04000AB0 RID: 2736
	private float volume_progress;

	// Token: 0x04000AB1 RID: 2737
	public string current_music;

	// Token: 0x04000AB2 RID: 2738
	private AudioSource _audio;

	// Token: 0x04000AB3 RID: 2739
	private static bool? _muted;
}
