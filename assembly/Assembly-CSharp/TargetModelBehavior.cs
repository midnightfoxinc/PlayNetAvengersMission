using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000211 RID: 529
[RequireComponent(typeof(Animator))]
public class TargetModelBehavior : MonoBehaviour
{
	// Token: 0x170001DA RID: 474
	// (get) Token: 0x06000EEC RID: 3820 RVA: 0x0006A790 File Offset: 0x00068990
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

	// Token: 0x170001DB RID: 475
	// (get) Token: 0x06000EED RID: 3821 RVA: 0x0006A7C0 File Offset: 0x000689C0
	public bool idling
	{
		get
		{
			return !base.gameObject.activeInHierarchy || this.health <= 0 || this.animator.GetCurrentAnimatorStateInfo(this.animator.GetLayerIndex("dolly layer")).IsName("idle");
		}
	}

	// Token: 0x06000EEE RID: 3822 RVA: 0x0006A818 File Offset: 0x00068A18
	private void Start()
	{
		if (!this.sfx_jukebox)
		{
			this.sfx_jukebox = base.GetComponent<SFXJukeboxBehavior>();
		}
		this.animator.applyRootMotion = false;
		this.animator.cullingMode = 0;
		for (int i = 0; i < globals.database_data.item.Count; i++)
		{
			if (globals.database_data.item[i] is EnemyDBItemClass)
			{
				EnemyDBItemClass enemyDBItemClass = (EnemyDBItemClass)globals.database_data.item[i];
				this._enemy_db.Add(enemyDBItemClass);
			}
		}
		this.set_enemy_type(this.enemy_id);
	}

	// Token: 0x06000EEF RID: 3823 RVA: 0x0006A8C4 File Offset: 0x00068AC4
	public void set_enemy_type(string eid)
	{
		foreach (EnemyDBItemClass enemyDBItemClass in this._enemy_db)
		{
			if (enemyDBItemClass.id == eid)
			{
				this.enemy_id = eid;
				this._cur_enemy = enemyDBItemClass;
				this.reset_status();
			}
		}
	}

	// Token: 0x06000EF0 RID: 3824 RVA: 0x0006A948 File Offset: 0x00068B48
	public void reset_status()
	{
		this.shield = this._cur_enemy.enemy_class.ToUpper().Contains("SHIELDED");
		this.animator.SetInteger("health", 100);
		this.animator.Play("dmg_idle");
	}

	// Token: 0x06000EF1 RID: 3825 RVA: 0x0006A998 File Offset: 0x00068B98
	public void switch_out()
	{
		if (this.animator.GetCurrentAnimatorStateInfo(this.animator.GetLayerIndex("dolly layer")).IsName("idle"))
		{
			this.play_animation("exit");
		}
	}

	// Token: 0x06000EF2 RID: 3826 RVA: 0x0006A9E0 File Offset: 0x00068BE0
	public void play_animation(string a)
	{
		this.animator.Play(a);
	}

	// Token: 0x06000EF3 RID: 3827 RVA: 0x0006A9F0 File Offset: 0x00068BF0
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

	// Token: 0x06000EF4 RID: 3828 RVA: 0x0006AA2C File Offset: 0x00068C2C
	public void do_damage(int amount, int attack_type = 0)
	{
		if (this.shield)
		{
			this.play_animation(this.shield_hit_animation);
		}
		else
		{
			this.health -= amount;
			this.health = Mathf.Max(0, this.health);
			this.animator.SetInteger("attack_type", attack_type);
			this.animator.SetTrigger("damage");
			if (this.health <= 0 && attack_type >= 0 && attack_type < this.special_attack_deaths.Length)
			{
				if (this.special_attack_deaths[attack_type] != null)
				{
					this.switch_in_child_anim(this.special_attack_deaths[attack_type]);
				}
				else
				{
					this.animator.SetInteger("attack_type", 0);
				}
				ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
				scavenger_hunt_types type = scavenger_hunt_types.DESTROY_ENEMY;
				List<string> list = new List<string>();
				list.Add(this.enemy_id);
				list.Add(attack_type.ToString());
				scavenger_hunt_manager.do_action(type, list, 1);
			}
		}
	}

	// Token: 0x06000EF5 RID: 3829 RVA: 0x0006AB1C File Offset: 0x00068D1C
	public void break_shield()
	{
		if (this.shield)
		{
			this.shield = false;
			this.play_animation(this.shield_break_animation);
		}
	}

	// Token: 0x06000EF6 RID: 3830 RVA: 0x0006AB3C File Offset: 0x00068D3C
	public void switch_in_child_anim(GameObject child)
	{
		child.SetActive(true);
		child.GetComponent<Animator>().Play("idle");
	}

	// Token: 0x06000EF7 RID: 3831 RVA: 0x0006AB58 File Offset: 0x00068D58
	private void Update()
	{
		this.animator.SetBool("shield", this.shield);
		if (!this._exiting)
		{
			for (int i = 0; i < this.special_attack_deaths.Length; i++)
			{
				GameObject gameObject = this.special_attack_deaths[i];
				if (gameObject && gameObject.activeSelf && gameObject.GetComponent<Animator>().GetCurrentAnimatorStateInfo(0).normalizedTime >= 1f)
				{
					this.switch_out();
				}
			}
		}
		if (this.animator.GetCurrentAnimatorStateInfo(this.animator.GetLayerIndex("dolly layer")).IsName("exit"))
		{
			this._exiting = true;
		}
		else if (this._exiting)
		{
			this._exiting = false;
			for (int j = 0; j < this.special_attack_deaths.Length; j++)
			{
				GameObject gameObject2 = this.special_attack_deaths[j];
				if (gameObject2)
				{
					gameObject2.SetActive(false);
				}
			}
			this.reset_status();
		}
	}

	// Token: 0x04000F55 RID: 3925
	public SFXJukeboxBehavior sfx_jukebox;

	// Token: 0x04000F56 RID: 3926
	public GameObject[] special_attack_deaths;

	// Token: 0x04000F57 RID: 3927
	public string idle_state = "idle";

	// Token: 0x04000F58 RID: 3928
	public string damage_animation = "damage";

	// Token: 0x04000F59 RID: 3929
	public string destroy_animation = "destroy";

	// Token: 0x04000F5A RID: 3930
	public string shielded_animation = "shielded";

	// Token: 0x04000F5B RID: 3931
	public string shield_hit_animation = "shield_hit";

	// Token: 0x04000F5C RID: 3932
	public string shield_break_animation = "shield_break";

	// Token: 0x04000F5D RID: 3933
	public int health = 3;

	// Token: 0x04000F5E RID: 3934
	public bool shield;

	// Token: 0x04000F5F RID: 3935
	public string enemy_id = "GRAVELBOT";

	// Token: 0x04000F60 RID: 3936
	internal bool _exiting;

	// Token: 0x04000F61 RID: 3937
	private List<EnemyDBItemClass> _enemy_db = new List<EnemyDBItemClass>();

	// Token: 0x04000F62 RID: 3938
	private EnemyDBItemClass _cur_enemy;

	// Token: 0x04000F63 RID: 3939
	private Animator _animator;

	// Token: 0x02000212 RID: 530
	public enum DeathType
	{
		// Token: 0x04000F65 RID: 3941
		DEFAULT,
		// Token: 0x04000F66 RID: 3942
		ACID,
		// Token: 0x04000F67 RID: 3943
		BULLET
	}
}
