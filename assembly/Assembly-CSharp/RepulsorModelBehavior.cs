using System;
using UnityEngine;

// Token: 0x020001FE RID: 510
[RequireComponent(typeof(Animator))]
public class RepulsorModelBehavior : MonoBehaviour
{
	// Token: 0x170001D7 RID: 471
	// (get) Token: 0x06000E8B RID: 3723 RVA: 0x00066278 File Offset: 0x00064478
	public Animator animator
	{
		get
		{
			if (!this._animator)
			{
				this._animator = base.GetComponent<Animator>();
			}
			return this._animator;
		}
	}

	// Token: 0x170001D8 RID: 472
	// (get) Token: 0x06000E8C RID: 3724 RVA: 0x000662A8 File Offset: 0x000644A8
	public bool idling
	{
		get
		{
			return !base.gameObject.activeInHierarchy || (!this.animator.IsInTransition(0) && this.animator.GetCurrentAnimatorStateInfo(0).IsName(this.idle_state));
		}
	}

	// Token: 0x06000E8D RID: 3725 RVA: 0x000662F4 File Offset: 0x000644F4
	private void Start()
	{
		if (!this.sfx_jukebox)
		{
			this.sfx_jukebox = base.GetComponent<SFXJukeboxBehavior>();
		}
		this.animator.applyRootMotion = false;
		this.animator.cullingMode = 0;
	}

	// Token: 0x06000E8E RID: 3726 RVA: 0x00066338 File Offset: 0x00064538
	private void target_play_animation(string a)
	{
		this.target_model.play_animation(a);
	}

	// Token: 0x06000E8F RID: 3727 RVA: 0x00066348 File Offset: 0x00064548
	private void destroy_target(int attack_type = 0)
	{
		if (!this.target_model.idling)
		{
			this.play_sfx("glass_hit");
			return;
		}
		if (this.ability_class != null)
		{
			if (this.ability_class.shield_break && this.target_model.shield)
			{
				this.target_model.break_shield();
			}
			else if (this.ability_class.damage > 0)
			{
				this.target_model.do_damage(this.ability_class.damage, attack_type);
			}
			this.cooldown = this.ability_class.cooldown;
		}
		else if (this.is_palm_shot)
		{
			if (this.target_model.shield)
			{
				this.target_model.break_shield();
			}
			else
			{
				this.target_model.do_damage(2, 0);
			}
		}
		else
		{
			this.target_model.do_damage(1, 0);
		}
	}

	// Token: 0x06000E90 RID: 3728 RVA: 0x00066434 File Offset: 0x00064634
	public void play_animation(string a)
	{
		for (int i = 0; i < this.animator.layerCount; i++)
		{
			if (!this.animator.GetLayerName(i).StartsWith("S_"))
			{
				if (this.animator.HasState(i, Animator.StringToHash(a)))
				{
					this.animator.Play(a, i);
				}
			}
		}
	}

	// Token: 0x06000E91 RID: 3729 RVA: 0x000664A4 File Offset: 0x000646A4
	public void play_sfx(string sfx)
	{
		if (this.sfx_jukebox)
		{
			this.sfx_jukebox.play(sfx, null);
		}
		else
		{
			globals.debug("no sfx jukebox found");
		}
	}

	// Token: 0x06000E92 RID: 3730 RVA: 0x000664E0 File Offset: 0x000646E0
	public void play_particle_animation(string name)
	{
	}

	// Token: 0x06000E93 RID: 3731 RVA: 0x000664E4 File Offset: 0x000646E4
	public void shake_screen(int intensity_level)
	{
		switch (intensity_level)
		{
		case 0:
			CameraShakeMasterBehavior._instance.TriggerShake(0.5f, 0.75f);
			break;
		case 1:
			CameraShakeMasterBehavior._instance.TriggerShake(0.75f, 1.5f);
			break;
		case 2:
			CameraShakeMasterBehavior._instance.TriggerShake(1f, 2f);
			break;
		}
	}

	// Token: 0x06000E94 RID: 3732 RVA: 0x00066558 File Offset: 0x00064758
	private void Update()
	{
		this.cooldown = Mathf.Max(0f, this.cooldown - Time.deltaTime);
		if (this.animator.GetCurrentAnimatorStateInfo(0).IsName("Base Layer.palm charge"))
		{
			this.is_palm_shot = true;
		}
		else if (this.animator.GetCurrentAnimatorStateInfo(0).IsName("Base Layer.idle"))
		{
			this.is_palm_shot = false;
		}
	}

	// Token: 0x04000E6D RID: 3693
	public TargetModelBehavior target_model;

	// Token: 0x04000E6E RID: 3694
	public SFXJukeboxBehavior sfx_jukebox;

	// Token: 0x04000E6F RID: 3695
	public string idle_state = "idle";

	// Token: 0x04000E70 RID: 3696
	internal AbilityDBItemClass ability_class;

	// Token: 0x04000E71 RID: 3697
	internal float cooldown;

	// Token: 0x04000E72 RID: 3698
	internal bool is_palm_shot;

	// Token: 0x04000E73 RID: 3699
	private Animator _animator;
}
