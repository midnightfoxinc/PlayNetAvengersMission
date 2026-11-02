using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002E1 RID: 737
[RequireComponent(typeof(AudioSource))]
public class BlastDoorsBehavior : MonoBehaviour
{
	// Token: 0x17000230 RID: 560
	// (get) Token: 0x0600135E RID: 4958 RVA: 0x0008A688 File Offset: 0x00088888
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

	// Token: 0x0600135F RID: 4959 RVA: 0x0008A6B8 File Offset: 0x000888B8
	private void Start()
	{
		globals.blast_doors = this;
		this.blast_doors.Play(this.waiting_animation);
		globals.mission_to_open = -1;
	}

	// Token: 0x06001360 RID: 4960 RVA: 0x0008A6D8 File Offset: 0x000888D8
	private void stop_prompt_sfx()
	{
		this.audio.Stop();
		this.sfx_queue.Clear();
	}

	// Token: 0x06001361 RID: 4961 RVA: 0x0008A6F0 File Offset: 0x000888F0
	private void Update()
	{
		switch (this.state)
		{
		case BlastDoorsBehavior.blast_doors_state_enum.waiting:
			if (Input.GetMouseButtonDown(0) || Input.GetKeyDown(27))
			{
				this.stop_prompt_sfx();
				this.state = BlastDoorsBehavior.blast_doors_state_enum.loading;
				NavigationManager.load_scene_additive(NavigationManager.hq_scene);
			}
			else if (!this._in_mission && (globals.file_transfer_allowed < 1 || !globals.player_data.latest_device_data))
			{
				this._in_mission = true;
			}
			break;
		case BlastDoorsBehavior.blast_doors_state_enum.loading:
			if (!NavigationManager.is_loading())
			{
				this.blast_doors.CrossFade(this.open_animation, 0.1f);
				this.state = BlastDoorsBehavior.blast_doors_state_enum.opening;
				globals.sfx_master.play(this.open_sfx, null);
				NavigationManager.set_active_scene(NavigationManager.hq_scene);
			}
			break;
		case BlastDoorsBehavior.blast_doors_state_enum.opening:
			if (this.blast_doors.GetCurrentAnimatorStateInfo(0).IsName(this.idle_state))
			{
				NavigationManager.unload_scene(base.gameObject.scene.name);
			}
			break;
		}
		if (this.sfx_queue.Count > 0 && !this.audio.isPlaying && !SFXJukeboxBehavior.muted)
		{
			this.audio.clip = this.sfx_queue.Shift<AudioClip>();
			this.audio.Play();
		}
	}

	// Token: 0x040014CE RID: 5326
	public UIRoot root;

	// Token: 0x040014CF RID: 5327
	public Animator blast_doors;

	// Token: 0x040014D0 RID: 5328
	public string waiting_animation = "closed";

	// Token: 0x040014D1 RID: 5329
	public string open_animation = "blast doors open";

	// Token: 0x040014D2 RID: 5330
	public string idle_state = "idle";

	// Token: 0x040014D3 RID: 5331
	public string open_sfx = "doors open";

	// Token: 0x040014D4 RID: 5332
	public BlastDoorsBehavior.blast_doors_state_enum state;

	// Token: 0x040014D5 RID: 5333
	public AudioClip brawl_sfx;

	// Token: 0x040014D6 RID: 5334
	public AudioClip time_sfx;

	// Token: 0x040014D7 RID: 5335
	public AudioClip survival_sfx;

	// Token: 0x040014D8 RID: 5336
	public List<AudioClip> sfx_queue = new List<AudioClip>();

	// Token: 0x040014D9 RID: 5337
	private bool _in_mission;

	// Token: 0x040014DA RID: 5338
	private AudioSource _audio;

	// Token: 0x020002E2 RID: 738
	public enum blast_doors_state_enum
	{
		// Token: 0x040014DC RID: 5340
		waiting,
		// Token: 0x040014DD RID: 5341
		loading,
		// Token: 0x040014DE RID: 5342
		opening
	}
}
