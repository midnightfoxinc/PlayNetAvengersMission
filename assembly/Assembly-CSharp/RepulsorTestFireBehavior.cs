using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001FF RID: 511
public class RepulsorTestFireBehavior : MonoBehaviour
{
	// Token: 0x170001D9 RID: 473
	// (get) Token: 0x06000E96 RID: 3734 RVA: 0x00066674 File Offset: 0x00064874
	// (set) Token: 0x06000E97 RID: 3735 RVA: 0x0006667C File Offset: 0x0006487C
	public int EnemyIndex
	{
		get
		{
			return this.enemyindex;
		}
		set
		{
			if (value > this.EnemyMasterList.Count - 1)
			{
				this.enemyindex = 0;
			}
			else if (value < 0)
			{
				this.enemyindex = this.EnemyMasterList.Count - 1;
			}
			else
			{
				this.enemyindex = value;
			}
		}
	}

	// Token: 0x06000E98 RID: 3736 RVA: 0x000666D0 File Offset: 0x000648D0
	private void Start()
	{
		this.RepulsorAnimator = this.Repulsor.GetComponent<Animator>();
		this.CurrentDeployWeapon = this.DeployWeapons[0];
		this.CurrentGestureWeapon = this.Gestures[0];
		this.m_ChargeAudioSource = base.gameObject.AddComponent<AudioSource>();
		this.m_ChargeAudioSource.name = "ChargeAudioSource";
		this.BackgroundSwap("NY");
		this.SpawnEnemy(this.EnemyMasterList[0], RepulsorTestFireBehavior.SpawnSide.Right, false);
		this.m_bPlayBackgroundStaticSfx = true;
		this.StartTime = Time.time;
		this.LateStartOneShot = false;
		this.SelectPanel.ability_directory.ability_type_panel.gameObject.SetActive(false);
	}

	// Token: 0x06000E99 RID: 3737 RVA: 0x00066788 File Offset: 0x00064988
	private void LateStart()
	{
		if (this.LateStartOneShot)
		{
			return;
		}
		this.LateStartOneShot = true;
		this.SelectPanel.ability_directory.ability_type_panel.gameObject.SetActive(true);
	}

	// Token: 0x06000E9A RID: 3738 RVA: 0x000667C4 File Offset: 0x000649C4
	private void disableOtherButtons(TestfireButtonBehavior leaveEnabled)
	{
		this.TestFirePanel.palm_button.disabled = (this.TestFirePanel.palm_button != leaveEnabled);
		this.TestFirePanel.thumb_button.disabled = (this.TestFirePanel.thumb_button != leaveEnabled);
		for (int i = 0; i < this.TestFirePanel.ability_button.Length; i++)
		{
			this.TestFirePanel.ability_button[i].disabled = (this.TestFirePanel.ability_button[i] != leaveEnabled);
		}
	}

	// Token: 0x06000E9B RID: 3739 RVA: 0x00066858 File Offset: 0x00064A58
	private void Update()
	{
		if (Input.GetKey(32))
		{
			this.SelectPanel.StartTesting();
		}
		if (Time.time > this.StartTime + 0.01f)
		{
			this.LateStart();
		}
		if (!this.TestFirePanel)
		{
			globals.debug(" Test Fire Panel Missin in inspector");
			return;
		}
		this.FadeStatic();
		bool flag = this.inIdleState();
		if (flag && this._spawnEnemy != null)
		{
			this.SpawnEnemy(this._spawnEnemy, RepulsorTestFireBehavior.SpawnSide.Right, false);
			this._spawnEnemy = null;
		}
		if (this.CurrentEnemy == null)
		{
			return;
		}
		if (this.CurrentEnemy.EnemyGameObject == null)
		{
			return;
		}
		this.TestFirePanel.show_all_buttons();
		if (!flag)
		{
			this.TestFirePanel.palm_button.disabled = false;
			this.TestFirePanel.thumb_button.disabled = false;
			for (int i = 0; i < this.TestFirePanel.ability_button.Length; i++)
			{
				this.TestFirePanel.ability_button[i].disabled = false;
			}
		}
		this.RepulsorAnimator.SetBool("PalmHold", this.TestFirePanel.palm_button.pressed);
		this.RepulsorAnimator.SetBool("ability panel", globals.armory_main.ability_select_panel.gameObject.activeInHierarchy);
		if (this.TestFirePanel.thumb_button.hit && !this.TestFirePanel.thumb_button.disabled && flag)
		{
			this.RepulsorAnimator.Play(this.ThumbAnimation);
			this.disableOtherButtons(this.TestFirePanel.thumb_button);
		}
		else if (this.TestFirePanel.palm_button.hit && !this.TestFirePanel.palm_button.disabled && flag)
		{
			this.RepulsorAnimator.Play(this.PalmAnimation);
			if (this.PalmCannon.ChargeSound[0] != null)
			{
				globals.armory_main.play_sfx(this.PalmCannon.ChargeSound[0]);
				globals.debug("play charge sound");
			}
			this.disableOtherButtons(this.TestFirePanel.palm_button);
		}
		this.RepulsorAnimator.SetBool("DeployHold", this.TestFirePanel.ability_button[0].pressed);
		if (this.TestFirePanel.ability_button[0].hit && !this.TestFirePanel.ability_button[0].disabled && flag)
		{
			this.DeployWeapon(this.CurrentDeployWeapon.TypeOfAnimation);
			AchievementEvents.inst.log_ability_testfired(this.CurrentDeployWeapon.AbilityID);
			this.TimeDeployButtonPressed = Time.time;
			this.disableOtherButtons(this.TestFirePanel.ability_button[0]);
		}
		this.RepulsorAnimator.SetBool("GestureHold", this.TestFirePanel.ability_button[1].pressed);
		if (this.TestFirePanel.ability_button[1].hit && !this.TestFirePanel.ability_button[1].disabled && flag)
		{
			this.GestureWeapon(this.CurrentGestureWeapon.TypeOfAnimation);
			AchievementEvents.inst.log_ability_testfired(this.CurrentGestureWeapon.AbilityID);
			this.disableOtherButtons(this.TestFirePanel.ability_button[1]);
		}
		if (this.CurrentDeployWeapon.ReadySound != null && this.RepulsorAnimator.GetBool("DeployHold"))
		{
			float num = this.CurrentDeployWeapon.ChargeTime + this.TimeDeployButtonPressed;
			if (Time.time >= num && (Time.time - Time.deltaTime < num || this.CurrentDeployWeapon.bRepeatReadySound) && !globals.armory_main.LoopingAudioSource.isPlaying && !SFXJukeboxBehavior.muted)
			{
				if (this.CurrentDeployWeapon.AbilityID.Equals("GenScram"))
				{
					globals.armory_main.LoopingAudioSource.clip = this.CurrentDeployWeapon.ReadySound;
					globals.armory_main.LoopingAudioSource.loop = false;
					globals.armory_main.LoopingAudioSource.Play();
					globals.debug("ready sound 1");
				}
				else if (!(this.CurrentDeployWeapon.AbilityName == "HOMINGMISSILE") || this.RepulsorAnimator.GetCurrentAnimatorStateInfo(0).IsName("FX_Missile_Loop"))
				{
					globals.armory_main.LoopingAudioSource.clip = this.CurrentDeployWeapon.ReadySound;
					globals.armory_main.LoopingAudioSource.loop = false;
					globals.armory_main.LoopingAudioSource.Play();
					globals.debug("ready sound 2");
				}
			}
		}
		this.ManageScreenEffectsState();
	}

	// Token: 0x06000E9C RID: 3740 RVA: 0x00066D34 File Offset: 0x00064F34
	public void PlayAdjustToIdleSound()
	{
		globals.armory_main.play_sfx(this.AdjustToIdleSound);
	}

	// Token: 0x06000E9D RID: 3741 RVA: 0x00066D48 File Offset: 0x00064F48
	public void PlayTurnOnSound()
	{
		if (this.CurrentDeployWeapon.TurnOnSound != null)
		{
			globals.armory_main.play_sfx(this.CurrentDeployWeapon.TurnOnSound);
			globals.debug("play turn on sound");
		}
	}

	// Token: 0x06000E9E RID: 3742 RVA: 0x00066D80 File Offset: 0x00064F80
	private void ManageScreenEffectsState()
	{
		switch (this.CurrentScreenState)
		{
		case RepulsorTestFireBehavior.ScreenState.None:
			if (this.PreviousScreenState != this.CurrentScreenState)
			{
				foreach (UITexture uitexture in this.TestFirePanel.ScreenEffects)
				{
					uitexture.color = new Color(1f, 1f, 1f, 0f);
				}
			}
			break;
		case RepulsorTestFireBehavior.ScreenState.StaticStart:
			if (Time.time > this.ShotTimeStamp + this.CurrentDeployWeapon.ScreenEffectDelay)
			{
				this.TestFirePanel.StaticScreenEffect.color = Color.white;
				this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.StaticFading;
			}
			break;
		case RepulsorTestFireBehavior.ScreenState.StaticFading:
			this.TestFirePanel.StaticScreenEffect.uvRect = new Rect(Random.Range(-20f, 20f), Random.Range(-20f, 20f), 1f, 1f);
			this.TestFirePanel.StaticScreenEffect.color = new Color(this.TestFirePanel.StaticScreenEffect.color.r, this.TestFirePanel.StaticScreenEffect.color.g, this.TestFirePanel.StaticScreenEffect.color.b, Mathf.Lerp(this.TestFirePanel.StaticScreenEffect.color.a, 0f, Time.deltaTime * 2f));
			if (this.TestFirePanel.StaticScreenEffect.color.a < 0.01f)
			{
				this.TestFirePanel.StaticScreenEffect.color = new Color(this.TestFirePanel.StaticScreenEffect.color.r, this.TestFirePanel.StaticScreenEffect.color.g, this.TestFirePanel.StaticScreenEffect.color.b, 0f);
				this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.None;
			}
			break;
		case RepulsorTestFireBehavior.ScreenState.ClassifiedStart:
			if (Time.time > this.ShotTimeStamp + this.CurrentDeployWeapon.ScreenEffectDelay)
			{
				this.TestFirePanel.ClassifiedEffect.color = Color.white;
				float num = Mathf.Lerp(1f, 0f, (Time.time - this.ShotTimeStamp) / 1f);
				float num2 = Random.Range(-0.1f, 0.1f);
				float num3 = Random.Range(-0.1f, 0.1f);
				this.TestFirePanel.ClassifiedEffect.uvRect = new Rect(num3 * num, num2 * num, 1f, 1f);
			}
			break;
		case RepulsorTestFireBehavior.ScreenState.ClassifiedFading:
			this.TestFirePanel.ClassifiedEffect.color = new Color(this.TestFirePanel.ClassifiedEffect.color.r, this.TestFirePanel.ClassifiedEffect.color.g, this.TestFirePanel.ClassifiedEffect.color.b, Mathf.Lerp(this.TestFirePanel.ClassifiedEffect.color.a, 0f, Time.deltaTime * 5f));
			if (this.TestFirePanel.ClassifiedEffect.color.a < 0.01f)
			{
				this.TestFirePanel.ClassifiedEffect.color = new Color(this.TestFirePanel.ClassifiedEffect.color.r, this.TestFirePanel.ClassifiedEffect.color.g, this.TestFirePanel.ClassifiedEffect.color.b, 0f);
				this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.None;
			}
			break;
		case RepulsorTestFireBehavior.ScreenState.FreezingStart:
			this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.Freezing;
			break;
		case RepulsorTestFireBehavior.ScreenState.Freezing:
			this.TestFirePanel.FrostScreenEffect.color = new Color(this.TestFirePanel.FrostScreenEffect.color.r, this.TestFirePanel.FrostScreenEffect.color.g, this.TestFirePanel.FrostScreenEffect.color.b, Mathf.Lerp(this.TestFirePanel.FrostScreenEffect.color.a, 1f, Time.deltaTime * 1f));
			if (this.TestFirePanel.FrostScreenEffect.color.a > 0.99f)
			{
				this.TestFirePanel.FrostScreenEffect.color = new Color(this.TestFirePanel.FrostScreenEffect.color.r, this.TestFirePanel.FrostScreenEffect.color.g, this.TestFirePanel.FrostScreenEffect.color.b, 1f);
				this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.FreezingFadeStart;
			}
			break;
		case RepulsorTestFireBehavior.ScreenState.FreezingFadeStart:
			this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.FreezingFading;
			break;
		case RepulsorTestFireBehavior.ScreenState.FreezingFading:
			this.TestFirePanel.FrostScreenEffect.color = new Color(this.TestFirePanel.FrostScreenEffect.color.r, this.TestFirePanel.FrostScreenEffect.color.g, this.TestFirePanel.FrostScreenEffect.color.b, Mathf.Lerp(this.TestFirePanel.FrostScreenEffect.color.a, 0f, Time.deltaTime * 1f));
			if (this.TestFirePanel.FrostScreenEffect.color.a < 0.01f)
			{
				this.TestFirePanel.FrostScreenEffect.color = new Color(this.TestFirePanel.FrostScreenEffect.color.r, this.TestFirePanel.FrostScreenEffect.color.g, this.TestFirePanel.FrostScreenEffect.color.b, 0f);
				this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.None;
			}
			break;
		case RepulsorTestFireBehavior.ScreenState.ScrambleStart:
			this.GenScramblerStartTime = Time.time;
			this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.ScrambleBegin;
			break;
		case RepulsorTestFireBehavior.ScreenState.ScrambleBegin:
			if (Time.time > this.GenScramblerStartTime + 1f)
			{
				this.TestFirePanel.GeneticScramblerEffect.color = Color.white;
				this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.Scrambling;
			}
			break;
		case RepulsorTestFireBehavior.ScreenState.Scrambling:
		{
			float num4 = Mathf.SmoothStep(1f, 0f, Mathf.Clamp01((Time.time - this.GenScramblerStartTime) / 2.75f));
			float num5 = Random.Range(-0.01f, 0.01f);
			float num6 = Random.Range(-0.01f, 0.01f);
			this.TestFirePanel.GeneticScramblerEffect.uvRect = new Rect(num6 * num4, num5 * num4, 1f, 1f);
			if (Time.time > this.GenScramblerStartTime + 3.25f)
			{
				this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.ScrambleEnd;
				this.GenScramblerStartTime = Time.time;
			}
			break;
		}
		case RepulsorTestFireBehavior.ScreenState.ScrambleEnd:
			this.TestFirePanel.GeneticScramblerEffect.color = new Color(1f, 1f, 1f, 0f);
			if (Time.time >= this.GenScramblerStartTime + 0.25f)
			{
				this.CurrentScreenState = RepulsorTestFireBehavior.ScreenState.None;
			}
			break;
		}
		this.PreviousScreenState = this.CurrentScreenState;
	}

	// Token: 0x06000E9F RID: 3743 RVA: 0x00067574 File Offset: 0x00065774
	public void ChangeScreenStateForClassified(RepulsorTestFireBehavior.ScreenState newstate)
	{
		this.CurrentScreenState = newstate;
		this.ShotTimeStamp = Time.time;
	}

	// Token: 0x06000EA0 RID: 3744 RVA: 0x00067588 File Offset: 0x00065788
	public void DestroyCurrentTarget()
	{
		this.CurrentEnemy.EnemyGameObject.GetComponent<NewEnemyBehavior>().Hit(this.CurrentGestureWeapon, this.CurrentEnemy.EnemyGameObject.transform.position + new Vector3(0f, 2f, 0f), Vector3.forward, false);
	}

	// Token: 0x06000EA1 RID: 3745 RVA: 0x000675E4 File Offset: 0x000657E4
	public void FireWarmUp(RepulsorTestFireBehavior.AnimationUsed anim)
	{
		if (this.CurrentEnemy == null || this.CurrentEnemy.EnemyGameObject == null)
		{
			return;
		}
		RepulsorTestFireBehavior.WeaponInfo weaponInfo = new RepulsorTestFireBehavior.WeaponInfo();
		Transform transform;
		if (anim != RepulsorTestFireBehavior.AnimationUsed.PulseBolt)
		{
			if (anim != RepulsorTestFireBehavior.AnimationUsed.PalmCannon)
			{
				transform = this.GetMuzzle();
				weaponInfo = this.CurrentDeployWeapon;
			}
			else
			{
				transform = this.PalmMuzzle;
				weaponInfo = this.PalmCannon;
			}
		}
		else
		{
			weaponInfo = this.PulseBolt;
			transform = this.MainMuzzle;
		}
		if (weaponInfo.WarmUpPrefab != null)
		{
			GameObject gameObject = (GameObject)Object.Instantiate(weaponInfo.WarmUpPrefab, transform.position, transform.rotation);
			this.CurrentWarmUp = gameObject;
			gameObject.transform.parent = transform;
		}
	}

	// Token: 0x06000EA2 RID: 3746 RVA: 0x000676A8 File Offset: 0x000658A8
	public void StopWarmUp()
	{
		Object.Destroy(this.CurrentWarmUp);
	}

	// Token: 0x06000EA3 RID: 3747 RVA: 0x000676B8 File Offset: 0x000658B8
	public void TurnOffPart()
	{
		Object.Destroy(this.ActivePart);
	}

	// Token: 0x06000EA4 RID: 3748 RVA: 0x000676C8 File Offset: 0x000658C8
	public void StartCeilingAttackWarmUp()
	{
		if (this.ActivePreWarm != null)
		{
			Object.Destroy(this.ActivePreWarm);
			this.ActivePreWarm = null;
		}
		GameObject activePreWarm = (GameObject)Object.Instantiate(this.CurrentDeployWeapon.WarmUpPrefab, this.GetMuzzle().transform.position, Quaternion.Euler(Vector3.zero));
		this.ActivePreWarm = activePreWarm;
		base.StartCoroutine(this.WaitAndDo(this.CurrentDeployWeapon.ChargeTime, new RepulsorTestFireBehavior.DelayedMethod(this.DelayRequirmentMet)));
	}

	// Token: 0x06000EA5 RID: 3749 RVA: 0x00067754 File Offset: 0x00065954
	private void DelayRequirmentMet()
	{
		this.RepulsorAnimator.SetTrigger("TimerHit");
	}

	// Token: 0x06000EA6 RID: 3750 RVA: 0x00067768 File Offset: 0x00065968
	public void FireWeapon(RepulsorTestFireBehavior.AnimationUsed anim)
	{
		if (this.CurrentEnemy == null || this.CurrentEnemy.EnemyGameObject == null)
		{
			return;
		}
		if (globals.armory_main.LoopingAudioSource.isPlaying)
		{
			globals.armory_main.LoopingAudioSource.clip = null;
			globals.armory_main.LoopingAudioSource.Stop();
		}
		this.ShotTimeStamp = Time.time;
		RepulsorTestFireBehavior.WeaponInfo weaponInfo = new RepulsorTestFireBehavior.WeaponInfo();
		bool flag = anim == RepulsorTestFireBehavior.AnimationUsed.DeployBeam;
		Transform transform;
		List<string> list;
		switch (anim)
		{
		case RepulsorTestFireBehavior.AnimationUsed.PulseBolt:
		{
			weaponInfo = this.PulseBolt;
			transform = this.MainMuzzle;
			ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
			scavenger_hunt_types type = scavenger_hunt_types.USE_ABILITY;
			list = new List<string>();
			list.Add("pulse");
			scavenger_hunt_manager.do_action(type, list, 1);
			goto IL_1D5;
		}
		case RepulsorTestFireBehavior.AnimationUsed.PalmCannon:
		{
			transform = this.PalmMuzzle;
			weaponInfo = this.PalmCannon;
			ScavengerHuntManagerClass scavenger_hunt_manager2 = globals.scavenger_hunt_manager;
			scavenger_hunt_types type2 = scavenger_hunt_types.USE_ABILITY;
			list = new List<string>();
			list.Add("palm");
			list.Add("shield breaker");
			scavenger_hunt_manager2.do_action(type2, list, 1);
			goto IL_1D5;
		}
		default:
			if (anim == RepulsorTestFireBehavior.AnimationUsed.GestureWhip)
			{
				transform = this.GestureBlockPartLocatorBone;
				weaponInfo = this.CurrentGestureWeapon;
				ScavengerHuntManagerClass scavenger_hunt_manager3 = globals.scavenger_hunt_manager;
				scavenger_hunt_types type3 = scavenger_hunt_types.USE_ABILITY;
				list = new List<string>();
				list.Add(weaponInfo.AbilityID);
				list.Add((!weaponInfo.ShieldBreaker) ? string.Empty : "shield breaker");
				scavenger_hunt_manager3.do_action(type3, list, 1);
				goto IL_1D5;
			}
			break;
		case RepulsorTestFireBehavior.AnimationUsed.DeployCeilingCall:
			Object.Destroy(this.ActivePreWarm);
			break;
		}
		transform = this.GetMuzzle();
		weaponInfo = this.CurrentDeployWeapon;
		ScavengerHuntManagerClass scavenger_hunt_manager4 = globals.scavenger_hunt_manager;
		scavenger_hunt_types type4 = scavenger_hunt_types.USE_ABILITY;
		list = new List<string>();
		list.Add(weaponInfo.AbilityID);
		list.Add((!weaponInfo.ShieldBreaker) ? string.Empty : "shield breaker");
		scavenger_hunt_manager4.do_action(type4, list, 1);
		IL_1D5:
		for (int i = 1; i <= weaponInfo.ShotCount; i++)
		{
			this.TargetCenter = this.CurrentEnemy.EnemyGameObject.transform.GetComponent<BoxCollider>().bounds.center;
			Vector3 vector = Random.insideUnitCircle * this.CurrentDeployWeapon.OffsetInsideCircle;
			this.TargetCenter += vector;
			Vector3 vector2 = this.TargetCenter - transform.position;
			Quaternion quaternion = Quaternion.LookRotation(vector2);
			quaternion.eulerAngles = new Vector3(quaternion.eulerAngles.x, quaternion.eulerAngles.y, Random.Range(0f, 360f));
			Debug.DrawRay(transform.position, vector2, Color.red, 10f);
			if (!weaponInfo.AimedWeapon)
			{
				quaternion = transform.rotation;
			}
			if (weaponInfo.MuzzleFlashPrefab != null)
			{
				GameObject gameObject = (GameObject)Object.Instantiate(weaponInfo.MuzzleFlashPrefab, transform.position, quaternion);
				if (flag)
				{
					this.LatestBeamMuzzle = gameObject;
					gameObject.transform.parent = transform;
				}
				if (weaponInfo.MuzzleFlashRandomRotation)
				{
					gameObject.transform.localEulerAngles = new Vector3(gameObject.transform.localEulerAngles.x, gameObject.transform.localEulerAngles.y, Random.Range(0f, 360f));
				}
			}
			if (weaponInfo.ShotSound != null && weaponInfo.ShotSound.Count > 0)
			{
				globals.armory_main.play_sfx(weaponInfo.ShotSound[Random.Range(0, weaponInfo.ShotSound.Count - 1)]);
			}
			if (weaponInfo.bRepeatReadySound && weaponInfo.ReadySound != null)
			{
				globals.armory_main.play_sfx(weaponInfo.ReadySound);
				globals.debug("play ready sound 3");
			}
			GameObject gameObject2 = (GameObject)Object.Instantiate(weaponInfo.BulletPrefab, transform.position, quaternion);
			ShotBehavior component = gameObject2.GetComponent<ShotBehavior>();
			component.MyWeaponInfo = weaponInfo;
			if (flag)
			{
				gameObject2.transform.parent = transform;
				this.LatestBeam = gameObject2;
			}
		}
	}

	// Token: 0x06000EA7 RID: 3751 RVA: 0x00067B98 File Offset: 0x00065D98
	public void PlayCancelSound()
	{
		if (this.CurrentDeployWeapon.CancelSound != null)
		{
			globals.armory_main.play_sfx(this.CurrentDeployWeapon.CancelSound);
		}
	}

	// Token: 0x06000EA8 RID: 3752 RVA: 0x00067BC8 File Offset: 0x00065DC8
	public void FireGestureShot()
	{
		if (this.CurrentGestureWeapon.AbilityID.Equals("RzrDisc", 5))
		{
			this.TargetCenter = this.CurrentEnemy.EnemyGameObject.transform.GetComponent<BoxCollider>().bounds.center;
			Vector3 vector = Random.insideUnitCircle * this.CurrentDeployWeapon.OffsetInsideCircle;
			this.TargetCenter += vector;
			Vector3 vector2 = this.TargetCenter - this.GestureBlockPartLocatorBone.transform.position;
			Quaternion quaternion = Quaternion.LookRotation(vector2);
			quaternion.eulerAngles = new Vector3(quaternion.eulerAngles.x, quaternion.eulerAngles.y, -45f);
			GameObject gameObject = (GameObject)Object.Instantiate(this.CurrentGestureWeapon.BulletPrefab, this.GestureBlockPartLocatorBone.transform.position, quaternion);
			ShotBehavior component = gameObject.GetComponent<ShotBehavior>();
			component.MyWeaponInfo = this.CurrentGestureWeapon;
			this.StopGestureShield();
			if (this.CurrentGestureWeapon.ShotSound != null && this.CurrentGestureWeapon.ShotSound.Count > 0)
			{
				globals.armory_main.play_sfx(this.CurrentGestureWeapon.ShotSound[Random.Range(0, this.CurrentGestureWeapon.ShotSound.Count - 1)]);
			}
		}
		else if (this.CurrentGestureWeapon.AbilityID.Equals("StormBrg", 5) || this.CurrentGestureWeapon.AbilityID.Equals("Stinger", 5))
		{
			this.FireWeapon(this.CurrentGestureWeapon.TypeOfAnimation);
		}
	}

	// Token: 0x06000EA9 RID: 3753 RVA: 0x00067D80 File Offset: 0x00065F80
	public void FireGestureShield(RepulsorTestFireBehavior.AnimationUsed anim)
	{
		RepulsorTestFireBehavior.WeaponInfo weaponInfo = new RepulsorTestFireBehavior.WeaponInfo();
		if (anim == RepulsorTestFireBehavior.AnimationUsed.GestureBlock)
		{
			weaponInfo = this.CurrentGestureWeapon;
			ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
			scavenger_hunt_types type = scavenger_hunt_types.USE_ABILITY;
			List<string> list = new List<string>();
			list.Add(weaponInfo.AbilityID);
			list.Add((!weaponInfo.ShieldBreaker) ? string.Empty : "shield breaker");
			scavenger_hunt_manager.do_action(type, list, 1);
		}
		if (weaponInfo.GestureBlockingModel)
		{
			if (this.CurrentGesturePart != null && this.CurrentGesturePart.Count > 0)
			{
				foreach (GameObject gameObject in this.CurrentGesturePart)
				{
					Object.Destroy(gameObject);
				}
			}
			this.CurrentGesturePart = new List<GameObject>();
			this.CurrentGesturePart.Add((GameObject)Object.Instantiate(weaponInfo.GestureBlockingModel, this.GestureBlockPartLocatorBone.position, this.GestureBlockPartLocatorBone.rotation));
			foreach (GameObject gameObject2 in this.CurrentGesturePart)
			{
				gameObject2.transform.parent = this.GestureBlockPartLocatorBone;
			}
			this.CurrentGesturePart[0].AddComponent<PlayLoopedSoundShield>().MyWeaponInfo = weaponInfo;
		}
		if (weaponInfo.AbilityID.Equals("IMBust", 5))
		{
			this.CurrentGesturePart = new List<GameObject>();
			foreach (GameObject gameObject3 in weaponInfo.GestureHulkBusterParts)
			{
				if (gameObject3.name.Contains("Top"))
				{
					this.CurrentGesturePart.Add((GameObject)Object.Instantiate(gameObject3, this.HulkBusterPartTopSpawnLocation.position, Quaternion.Euler(new Vector3(0f, 90f, 90f))));
				}
				else if (gameObject3.name.Contains("Bottom"))
				{
					this.CurrentGesturePart.Add((GameObject)Object.Instantiate(gameObject3, this.HulkBusterPartBottomSpawnLocation.position, Quaternion.Euler(new Vector3(0f, 90f, 90f))));
				}
			}
			base.StartCoroutine("MoveHulkBusterParts");
		}
		if (this.CurrentGestureWeapon.ChargeSound != null && this.CurrentGestureWeapon.ChargeSound.Count > 0)
		{
			globals.armory_main.play_sfx(this.CurrentGestureWeapon.ChargeSound[Random.Range(0, this.CurrentGestureWeapon.ChargeSound.Count - 1)]);
		}
	}

	// Token: 0x06000EAA RID: 3754 RVA: 0x000680A8 File Offset: 0x000662A8
	private IEnumerator MoveHulkBusterParts()
	{
		while ((double)Vector3.Distance(this.GestureHulkBusterLocatorBottom.transform.position, this.CurrentGesturePart[0].transform.position) > 0.01)
		{
			foreach (GameObject hbpart in this.CurrentGesturePart)
			{
				if (hbpart.name.Contains("Top"))
				{
					hbpart.transform.position = Vector3.Lerp(hbpart.transform.position, this.GestureHulkBusterLocatorTop.transform.position, Time.deltaTime * 30f);
					hbpart.transform.rotation = Quaternion.Lerp(hbpart.transform.rotation, this.GestureHulkBusterLocatorTop.transform.rotation, Time.deltaTime * 30f);
				}
				else if (hbpart.name.Contains("Bottom"))
				{
					hbpart.transform.position = Vector3.Lerp(hbpart.transform.position, this.GestureHulkBusterLocatorBottom.transform.position, Time.deltaTime * 30f);
					hbpart.transform.rotation = Quaternion.Lerp(hbpart.transform.rotation, this.GestureHulkBusterLocatorBottom.transform.rotation, Time.deltaTime * 30f);
				}
			}
			yield return null;
		}
		List<Renderer> reprenderers = new List<Renderer>(this.Repulsor.GetComponentsInChildren<Renderer>());
		foreach (Renderer r in reprenderers)
		{
			r.enabled = false;
		}
		foreach (GameObject hbpart2 in this.CurrentGesturePart)
		{
			if (hbpart2.name.Contains("Top"))
			{
				hbpart2.transform.parent = this.GestureHulkBusterLocatorTop.transform;
				hbpart2.transform.localPosition = Vector3.zero;
				hbpart2.transform.localEulerAngles = Vector3.zero;
			}
			else if (hbpart2.name.Contains("Bottom"))
			{
				hbpart2.transform.parent = this.GestureHulkBusterLocatorBottom.transform;
				hbpart2.transform.localPosition = Vector3.zero;
				hbpart2.transform.localEulerAngles = Vector3.zero;
			}
		}
		yield break;
	}

	// Token: 0x06000EAB RID: 3755 RVA: 0x000680C4 File Offset: 0x000662C4
	private IEnumerator MoveHulkBusterPartsOff()
	{
		while (Vector3.Distance(this.RepulsorRootBone.position, this.CurrentGesturePart[0].transform.position) < 1f)
		{
			foreach (GameObject hbpart in this.CurrentGesturePart)
			{
				if (hbpart.name.Contains("Top"))
				{
					hbpart.transform.position = Vector3.Lerp(hbpart.transform.position, this.HulkBusterPartTopSpawnLocation.position, Time.deltaTime * 2.5f);
					hbpart.transform.Rotate(Vector3.up * Time.deltaTime * 500f);
				}
				else if (hbpart.name.Contains("Bottom"))
				{
					hbpart.transform.position = Vector3.Lerp(hbpart.transform.position, this.HulkBusterPartBottomSpawnLocation.position, Time.deltaTime * 2.5f);
					hbpart.transform.Rotate(-Vector3.up * Time.deltaTime * 500f);
				}
			}
			yield return null;
		}
		foreach (GameObject go in this.CurrentGesturePart)
		{
			Object.Destroy(go);
		}
		this.CurrentGesturePart = null;
		yield break;
	}

	// Token: 0x06000EAC RID: 3756 RVA: 0x000680E0 File Offset: 0x000662E0
	public void StopGestureShield()
	{
		if (this.CurrentGestureWeapon.AbilityID.Equals("IMBust", 5))
		{
			foreach (GameObject gameObject in this.CurrentGesturePart)
			{
				gameObject.transform.parent = null;
			}
			base.StartCoroutine("MoveHulkBusterPartsOff");
			List<Renderer> list = new List<Renderer>(this.Repulsor.GetComponentsInChildren<Renderer>());
			foreach (Renderer renderer in list)
			{
				renderer.enabled = true;
			}
		}
		else if (this.CurrentGesturePart != null)
		{
			foreach (GameObject gameObject2 in this.CurrentGesturePart)
			{
				Object.Destroy(gameObject2);
			}
			this.CurrentGesturePart = null;
		}
		if (this.CurrentGestureWeapon.CancelSound != null)
		{
			globals.armory_main.play_sfx(this.CurrentGestureWeapon.CancelSound);
		}
	}

	// Token: 0x06000EAD RID: 3757 RVA: 0x00068270 File Offset: 0x00066470
	public void PlayImpactGestureEffect()
	{
		Vector3 vector = Random.insideUnitSphere * 0.1f;
		Vector3 vector2;
		vector2..ctor(vector.x + this.GestureBlockPartLocatorBone.transform.position.x, vector.y + this.GestureBlockPartLocatorBone.transform.position.y, this.GestureBlockPartLocatorBone.transform.position.z + 0.25f);
		if (this.CurrentGestureWeapon.ImpactPrefab)
		{
			Object.Instantiate(this.CurrentGestureWeapon.ImpactPrefab, vector2, this.GestureBlockPartLocatorBone.rotation);
		}
		if (this.CurrentGestureWeapon.AbilityID.Equals("RicoShot", 5))
		{
			this.TargetCenter = this.CurrentEnemy.EnemyGameObject.transform.GetComponent<BoxCollider>().bounds.center;
			Vector3 vector3 = Random.insideUnitCircle * this.CurrentDeployWeapon.OffsetInsideCircle;
			this.TargetCenter += vector3;
			Vector3 vector4 = this.TargetCenter - vector2;
			Quaternion quaternion = Quaternion.LookRotation(vector4);
			quaternion.eulerAngles = new Vector3(quaternion.eulerAngles.x, quaternion.eulerAngles.y, Random.Range(0f, 360f));
			GameObject gameObject = (GameObject)Object.Instantiate(this.CurrentGestureWeapon.BulletPrefab, vector2, quaternion);
			ShotBehavior component = gameObject.GetComponent<ShotBehavior>();
			component.MyWeaponInfo = this.CurrentGestureWeapon;
		}
		else if (this.CurrentGestureWeapon.ImpactSound != null && this.CurrentGestureWeapon.ImpactSound.Count > 0)
		{
			globals.armory_main.play_sfx(this.CurrentGestureWeapon.ImpactSound[Random.Range(0, this.CurrentGestureWeapon.ImpactSound.Count - 1)]);
		}
	}

	// Token: 0x06000EAE RID: 3758 RVA: 0x00068478 File Offset: 0x00066678
	public void StopBeamWeapon()
	{
		if (this.LatestBeamMuzzle != null)
		{
			List<ParticleSystem> list = new List<ParticleSystem>();
			ParticleSystem component = this.LatestBeamMuzzle.GetComponent<ParticleSystem>();
			if (component != null)
			{
				list.Add(component);
			}
			list.AddRange(this.LatestBeamMuzzle.GetComponentsInChildren<ParticleSystem>());
			foreach (ParticleSystem particleSystem in list)
			{
				particleSystem.Stop();
			}
		}
		if (this.CurrentDeployWeapon.ParticleBasedBeam)
		{
			List<ParticleSystem> list2 = new List<ParticleSystem>();
			ParticleSystem particleSystem2 = null;
			if (this.LatestBeam)
			{
				particleSystem2 = this.LatestBeam.GetComponent<ParticleSystem>();
			}
			if (!(particleSystem2 != null))
			{
				return;
			}
			list2.Add(particleSystem2);
			List<ParticleSystem> list3 = new List<ParticleSystem>();
			list3.AddRange(particleSystem2.GetComponentsInChildren<ParticleSystem>());
			foreach (ParticleSystem particleSystem3 in list3)
			{
				particleSystem3.loop = false;
				particleSystem3.Stop();
			}
		}
		else if (this.LatestBeam != null)
		{
			Object.Destroy(this.LatestBeam);
		}
		if (this.CurrentReturnAttack != null)
		{
			globals.debug("Trying to return particles");
			ReturnToPlayer component2 = this.CurrentReturnAttack.GetComponent<ReturnToPlayer>();
			component2.StartReturn();
		}
	}

	// Token: 0x06000EAF RID: 3759 RVA: 0x00068634 File Offset: 0x00066834
	public Transform GetMuzzle()
	{
		switch (this.CurrentDeployWeapon.MuzzleLocation)
		{
		case RepulsorTestFireBehavior.MuzzleLocator.Main:
			return this.MainMuzzle;
		case RepulsorTestFireBehavior.MuzzleLocator.Palm:
			return this.PalmMuzzle;
		case RepulsorTestFireBehavior.MuzzleLocator.Deploy:
			return this.DeployMuzzle;
		case RepulsorTestFireBehavior.MuzzleLocator.Roof:
			return this.RoofMuzzle;
		default:
			return this.MainMuzzle;
		}
	}

	// Token: 0x06000EB0 RID: 3760 RVA: 0x0006868C File Offset: 0x0006688C
	private void GestureWeapon(RepulsorTestFireBehavior.AnimationUsed anim)
	{
		string text = string.Empty;
		switch (anim)
		{
		case RepulsorTestFireBehavior.AnimationUsed.GestureBlock:
			text = this.GestureAnimation;
			break;
		case RepulsorTestFireBehavior.AnimationUsed.GestureWhip:
			text = this.GestureWhipAnimation;
			break;
		case RepulsorTestFireBehavior.AnimationUsed.GestureWhipQuick:
			text = this.GestureWhipQuickAnimation;
			break;
		case RepulsorTestFireBehavior.AnimationUsed.Classified:
			text = this.ClassifiedAnimation;
			break;
		}
		this.RepulsorAnimator.Play(text);
	}

	// Token: 0x06000EB1 RID: 3761 RVA: 0x000686FC File Offset: 0x000668FC
	private void DeployWeapon(RepulsorTestFireBehavior.AnimationUsed anim)
	{
		string text = string.Empty;
		switch (anim)
		{
		case RepulsorTestFireBehavior.AnimationUsed.DeployBarrage:
			text = this.DeployBarrage;
			break;
		case RepulsorTestFireBehavior.AnimationUsed.DeployMissile:
			text = this.DeployMissileAnimation;
			break;
		case RepulsorTestFireBehavior.AnimationUsed.DeployBeam:
			text = this.DeployBeamAnimation;
			break;
		case RepulsorTestFireBehavior.AnimationUsed.DeployCeilingCall:
			text = this.DeployCeilingAnimation;
			break;
		case RepulsorTestFireBehavior.AnimationUsed.DeployQuickShot:
			text = this.DeployMissileQuick;
			break;
		case RepulsorTestFireBehavior.AnimationUsed.Classified:
			text = this.ClassifiedAnimation;
			break;
		}
		if (this.CurrentGesturePart != null && this.CurrentGesturePart.Count > 0)
		{
			foreach (GameObject gameObject in this.CurrentGesturePart)
			{
				Object.Destroy(gameObject);
			}
			this.CurrentGesturePart = new List<GameObject>();
		}
		if (this.ActivePart != null)
		{
			Object.Destroy(this.ActivePart);
			this.ActivePart = null;
		}
		if (this.CurrentDeployWeapon.AddedPart != null)
		{
			GameObject gameObject2 = (GameObject)Object.Instantiate(this.CurrentDeployWeapon.AddedPart, this.PartLocatorBone.position, this.PartLocatorBone.rotation);
			gameObject2.transform.parent = this.PartLocatorBone;
			this.ActivePart = gameObject2.gameObject;
		}
		else
		{
			GameObject gameObject3 = (GameObject)Object.Instantiate(this.DefaultPart, this.PartLocatorBone.position, this.PartLocatorBone.rotation);
			gameObject3.transform.parent = this.PartLocatorBone;
			this.ActivePart = gameObject3.gameObject;
		}
		this.RepulsorAnimator.Play(text);
		if (this.CurrentDeployWeapon.ChargeSound != null && this.CurrentDeployWeapon.ChargeSound.Count > 0)
		{
			this.PlayChargeSfx(this.CurrentDeployWeapon.ChargeSound[Random.Range(0, this.CurrentDeployWeapon.ChargeSound.Count - 1)]);
		}
	}

	// Token: 0x06000EB2 RID: 3762 RVA: 0x0006893C File Offset: 0x00066B3C
	public void PlayChargeSfx(AudioClip clip)
	{
		if (SFXJukeboxBehavior.muted)
		{
			return;
		}
		this.m_ChargeAudioSource.PlayOneShot(clip);
	}

	// Token: 0x06000EB3 RID: 3763 RVA: 0x00068958 File Offset: 0x00066B58
	public void StopChargeSfx()
	{
		this.m_ChargeAudioSource.Stop();
	}

	// Token: 0x06000EB4 RID: 3764 RVA: 0x00068968 File Offset: 0x00066B68
	public void TargetDestroyed(string enemyid)
	{
		this.CurrentEnemy = null;
		this._spawnEnemy = this.EnemyMasterList[0];
		foreach (RepulsorTestFireBehavior.EnemyInfo enemyInfo in this.EnemyMasterList)
		{
			if (enemyInfo.enemy_id.Equals(enemyid, 5))
			{
				this._spawnEnemy = enemyInfo;
				break;
			}
		}
	}

	// Token: 0x06000EB5 RID: 3765 RVA: 0x00068A00 File Offset: 0x00066C00
	public void SpawnEnemy(RepulsorTestFireBehavior.EnemyInfo enemytospawn, RepulsorTestFireBehavior.SpawnSide sidetospawnfrom, bool quickspawn = false)
	{
		GameObject enemyPrefab = enemytospawn.EnemyPrefab;
		this.CurrentEnemy = enemytospawn;
		this.EnemyName.text = enemytospawn.EnemyName;
		if (quickspawn)
		{
			GameObject gameObject = (GameObject)Object.Instantiate(enemyPrefab, this.SpawnLocation(sidetospawnfrom).position, this.SpawnLocation(sidetospawnfrom).rotation);
			gameObject.GetComponent<NewEnemyBehavior>().MyInfo = enemytospawn;
			this.CurrentEnemy.EnemyGameObject = gameObject;
			this.ChangeBackground(enemytospawn.PreferedLocation);
		}
		else
		{
			GameObject gameObject2 = (GameObject)Object.Instantiate(enemyPrefab, this.SpawnLocation(sidetospawnfrom).position, this.SpawnLocation(sidetospawnfrom).rotation);
			gameObject2.GetComponent<NewEnemyBehavior>().MyInfo = enemytospawn;
			this.ChangeBackground(enemytospawn.PreferedLocation);
			if (sidetospawnfrom == RepulsorTestFireBehavior.SpawnSide.Right)
			{
				base.StartCoroutine("MoveEnemyTargetFromRight", gameObject2);
			}
			else
			{
				base.StartCoroutine("MoveEnemyTargetFromLeft", gameObject2);
			}
		}
	}

	// Token: 0x06000EB6 RID: 3766 RVA: 0x00068AE0 File Offset: 0x00066CE0
	private void ChangeBackground(string requestedbackground)
	{
		globals.debug("Changeing Background Requested BG: " + requestedbackground + "Last Background: " + this.LastBackground);
		if (requestedbackground.Equals(this.LastBackground, 5))
		{
			this.StaticState = RepulsorTestFireBehavior.ScreenStaticState.Off;
			return;
		}
		this.LastBackground = requestedbackground;
		this.StaticState = RepulsorTestFireBehavior.ScreenStaticState.FadeOn;
		if (this.m_bPlayBackgroundStaticSfx)
		{
			globals.armory_main.play_sfx(this.StaticForSwitching);
		}
	}

	// Token: 0x06000EB7 RID: 3767 RVA: 0x00068B4C File Offset: 0x00066D4C
	private void BackgroundSwap(string requestedbackground)
	{
		foreach (RepulsorTestFireBehavior.LocationInfo locationInfo in this.Locations)
		{
			locationInfo.LocationBackground.SetActive(false);
		}
		foreach (RepulsorTestFireBehavior.LocationInfo locationInfo2 in this.Locations)
		{
			if (requestedbackground.Equals(locationInfo2.LocationName, 5))
			{
				locationInfo2.LocationBackground.SetActive(true);
				break;
			}
		}
	}

	// Token: 0x06000EB8 RID: 3768 RVA: 0x00068C28 File Offset: 0x00066E28
	private Transform SpawnLocation(RepulsorTestFireBehavior.SpawnSide sidetospawnfrom)
	{
		if (sidetospawnfrom != RepulsorTestFireBehavior.SpawnSide.Left)
		{
			return this.TargetSpawnLocationRight;
		}
		return this.TargetSpawnLocationLeft;
	}

	// Token: 0x06000EB9 RID: 3769 RVA: 0x00068C50 File Offset: 0x00066E50
	private IEnumerator MoveEnemyTargetFromRight(GameObject enemy)
	{
		yield return new WaitForSeconds(0.1f);
		while (Vector3.Distance(enemy.transform.position, this.TargetDestination.position) > 0.01f)
		{
			enemy.transform.position = Vector3.Lerp(enemy.transform.position, this.TargetDestination.position, Time.deltaTime * this.TargetMoveVelocity);
			yield return null;
		}
		enemy.transform.position = this.TargetDestination.position;
		this.CurrentEnemy.EnemyGameObject = enemy;
		yield break;
	}

	// Token: 0x06000EBA RID: 3770 RVA: 0x00068C7C File Offset: 0x00066E7C
	private IEnumerator MoveEnemyTargetFromLeft(GameObject enemy)
	{
		yield return new WaitForSeconds(0.1f);
		while (Vector3.Distance(enemy.transform.position, this.TargetDestination.position) > 0.01f)
		{
			enemy.transform.position = Vector3.Lerp(enemy.transform.position, this.TargetDestination.position, Time.deltaTime * this.TargetMoveVelocity);
			yield return null;
		}
		enemy.transform.position = this.TargetDestination.position;
		this.CurrentEnemy.EnemyGameObject = enemy;
		yield break;
	}

	// Token: 0x06000EBB RID: 3771 RVA: 0x00068CA8 File Offset: 0x00066EA8
	private IEnumerator MoveEnemyTargetOffRight(RepulsorTestFireBehavior.SpawnSide sidetomovethetargetowards)
	{
		Transform side = this.SpawnLocation(sidetomovethetargetowards);
		while (Vector3.Distance(this.ExitingEnemy.EnemyGameObject.transform.position, side.position) > 0.1f)
		{
			this.ExitingEnemy.EnemyGameObject.transform.position = Vector3.Lerp(this.ExitingEnemy.EnemyGameObject.transform.position, side.position, Time.deltaTime * this.TargetMoveVelocity);
			yield return null;
		}
		this.ExitingEnemy.EnemyGameObject.transform.position = side.position;
		this.ExitingEnemy.EnemyGameObject.GetComponent<NewEnemyBehavior>().KillQuetly();
		this.ExitingEnemy = new RepulsorTestFireBehavior.EnemyInfo();
		yield break;
	}

	// Token: 0x06000EBC RID: 3772 RVA: 0x00068CD4 File Offset: 0x00066ED4
	private IEnumerator MoveEnemyTargetOffLeft(RepulsorTestFireBehavior.SpawnSide sidetomovethetargetowards)
	{
		Transform side = this.SpawnLocation(sidetomovethetargetowards);
		while (Vector3.Distance(this.ExitingEnemy.EnemyGameObject.transform.position, side.position) > 0.1f)
		{
			this.ExitingEnemy.EnemyGameObject.transform.position = Vector3.Lerp(this.ExitingEnemy.EnemyGameObject.transform.position, side.position, Time.deltaTime * this.TargetMoveVelocity);
			yield return null;
		}
		this.ExitingEnemy.EnemyGameObject.transform.position = side.position;
		this.ExitingEnemy.EnemyGameObject.GetComponent<NewEnemyBehavior>().KillQuetly();
		this.ExitingEnemy = new RepulsorTestFireBehavior.EnemyInfo();
		yield break;
	}

	// Token: 0x06000EBD RID: 3773 RVA: 0x00068D00 File Offset: 0x00066F00
	private void FadeStatic()
	{
		Material material = this.StaticScreen.GetComponent<MeshRenderer>().material;
		switch (this.StaticState)
		{
		case RepulsorTestFireBehavior.ScreenStaticState.Off:
			if (material.GetColor("_Color").a != 0f)
			{
				material.SetColor("_Color", new Color(1f, 1f, 1f, 0f));
				globals.debug("Trying to make ti clear");
			}
			break;
		case RepulsorTestFireBehavior.ScreenStaticState.FadeOn:
			if (material.GetColor("_Color").a < 0.99f)
			{
				material.SetColor("_Color", new Color(material.GetColor("_Color").r, material.GetColor("_Color").g, material.GetColor("_Color").b, Mathf.Lerp(material.GetColor("_Color").a, 1f, Time.deltaTime * 10f)));
			}
			else
			{
				this.StaticState = RepulsorTestFireBehavior.ScreenStaticState.On;
			}
			break;
		case RepulsorTestFireBehavior.ScreenStaticState.FadeOff:
			if (material.GetColor("_Color").a > 0.01f)
			{
				material.SetColor("_Color", new Color(material.GetColor("_Color").r, material.GetColor("_Color").g, material.GetColor("_Color").b, Mathf.Lerp(material.GetColor("_Color").a, 0f, Time.deltaTime * 10f)));
			}
			else
			{
				this.StaticState = RepulsorTestFireBehavior.ScreenStaticState.Off;
			}
			break;
		case RepulsorTestFireBehavior.ScreenStaticState.On:
			if (material.GetColor("_Color").a != 1f)
			{
				material.SetColor("_Color", Color.white);
			}
			this.BackgroundSwap(this.LastBackground);
			this.StaticState = RepulsorTestFireBehavior.ScreenStaticState.FadeOff;
			break;
		}
	}

	// Token: 0x06000EBE RID: 3774 RVA: 0x00068F20 File Offset: 0x00067120
	internal bool inIdleState()
	{
		return !this.RepulsorAnimator || (this.RepulsorAnimator.GetCurrentAnimatorStateInfo(0).IsName("idle") && (this.ExitingEnemy == null || this.ExitingEnemy.EnemyGameObject == null));
	}

	// Token: 0x06000EBF RID: 3775 RVA: 0x00068F80 File Offset: 0x00067180
	private bool isTargetReady()
	{
		return this.CurrentEnemy.EnemyGameObject != null && this.CurrentEnemy.EnemyGameObject.transform.position == this.TargetDestination.position;
	}

	// Token: 0x06000EC0 RID: 3776 RVA: 0x00068FCC File Offset: 0x000671CC
	private bool can_swipe()
	{
		return this.inIdleState() && globals.armory_main.in_testfire() && (!globals.gear_daisy || !globals.gear_daisy.submenu_open()) && this.isTargetReady();
	}

	// Token: 0x06000EC1 RID: 3777 RVA: 0x00069028 File Offset: 0x00067228
	public void SwipeLeft()
	{
		if (!this.can_swipe())
		{
			return;
		}
		globals.debug("Swiped Left");
		this.ExitingEnemy = this.CurrentEnemy;
		base.StartCoroutine("MoveEnemyTargetOffLeft", RepulsorTestFireBehavior.SpawnSide.Left);
		this.EnemyIndex++;
		this.SpawnEnemy(this.EnemyMasterList[this.EnemyIndex], RepulsorTestFireBehavior.SpawnSide.Right, false);
		globals.armory_main.play_sfx(this.SlideInSound);
	}

	// Token: 0x06000EC2 RID: 3778 RVA: 0x000690A0 File Offset: 0x000672A0
	public void SwipeRight()
	{
		if (!this.can_swipe())
		{
			return;
		}
		globals.debug("Swiped Right");
		this.ExitingEnemy = this.CurrentEnemy;
		base.StartCoroutine("MoveEnemyTargetOffRight", RepulsorTestFireBehavior.SpawnSide.Right);
		this.EnemyIndex--;
		this.SpawnEnemy(this.EnemyMasterList[this.EnemyIndex], RepulsorTestFireBehavior.SpawnSide.Left, false);
		globals.armory_main.play_sfx(this.SlideInSound);
	}

	// Token: 0x06000EC3 RID: 3779 RVA: 0x00069118 File Offset: 0x00067318
	public void SetGesture(AbilityDBItemClass ability)
	{
		RepulsorTestFireBehavior.WeaponInfo currentGestureWeapon = new RepulsorTestFireBehavior.WeaponInfo();
		foreach (RepulsorTestFireBehavior.WeaponInfo weaponInfo in this.Gestures)
		{
			if (weaponInfo.AbilityID.Equals(ability.id, 5))
			{
				currentGestureWeapon = weaponInfo;
				break;
			}
		}
		this.CurrentGestureWeapon = currentGestureWeapon;
	}

	// Token: 0x06000EC4 RID: 3780 RVA: 0x000691A4 File Offset: 0x000673A4
	public void SetDeploy(AbilityDBItemClass ability)
	{
		RepulsorTestFireBehavior.WeaponInfo currentDeployWeapon = new RepulsorTestFireBehavior.WeaponInfo();
		foreach (RepulsorTestFireBehavior.WeaponInfo weaponInfo in this.DeployWeapons)
		{
			if (weaponInfo.AbilityID.Equals(ability.id, 5))
			{
				currentDeployWeapon = weaponInfo;
				break;
			}
		}
		this.CurrentDeployWeapon = currentDeployWeapon;
	}

	// Token: 0x06000EC5 RID: 3781 RVA: 0x00069230 File Offset: 0x00067430
	public void set_ability(AbilityDBItemClass ability)
	{
		if (ability.mola == "2101")
		{
			if (ability.slot == AbilityDBItemClass.slot_enum.Deploy)
			{
				this.SetDeploy(ability);
			}
			else
			{
				this.SetGesture(ability);
			}
		}
	}

	// Token: 0x06000EC6 RID: 3782 RVA: 0x00069274 File Offset: 0x00067474
	public void RepulsorPlayAnimation(string animationname)
	{
	}

	// Token: 0x06000EC7 RID: 3783 RVA: 0x00069278 File Offset: 0x00067478
	private IEnumerator WaitAndDo(float time, RepulsorTestFireBehavior.DelayedMethod method)
	{
		yield return new WaitForSeconds(time);
		method();
		yield break;
	}

	// Token: 0x04000E74 RID: 3700
	private const float kDelayTargetTime = 0.1f;

	// Token: 0x04000E75 RID: 3701
	private const float kTargetDistanceEpsilon = 0.01f;

	// Token: 0x04000E76 RID: 3702
	public TestfirePanelBehavior TestFirePanel;

	// Token: 0x04000E77 RID: 3703
	public AbilitySelectPanelBehavior SelectPanel;

	// Token: 0x04000E78 RID: 3704
	public GameObject Repulsor;

	// Token: 0x04000E79 RID: 3705
	public Animator RepulsorAnimator;

	// Token: 0x04000E7A RID: 3706
	public Transform PartLocatorBone;

	// Token: 0x04000E7B RID: 3707
	public Transform GestureBlockPartLocatorBone;

	// Token: 0x04000E7C RID: 3708
	public Transform RepulsorRootBone;

	// Token: 0x04000E7D RID: 3709
	public Transform GestureHulkBusterLocatorTop;

	// Token: 0x04000E7E RID: 3710
	public Transform GestureHulkBusterLocatorBottom;

	// Token: 0x04000E7F RID: 3711
	public List<GameObject> CurrentGesturePart;

	// Token: 0x04000E80 RID: 3712
	public GameObject ActivePart;

	// Token: 0x04000E81 RID: 3713
	public Transform DefaultPart;

	// Token: 0x04000E82 RID: 3714
	public Transform MainMuzzle;

	// Token: 0x04000E83 RID: 3715
	public Transform PalmMuzzle;

	// Token: 0x04000E84 RID: 3716
	public Transform DeployMuzzle;

	// Token: 0x04000E85 RID: 3717
	public Transform RoofMuzzle;

	// Token: 0x04000E86 RID: 3718
	public List<AudioClip> ShrapnelImpactSounds;

	// Token: 0x04000E87 RID: 3719
	public RepulsorTestFireBehavior.ScreenState CurrentScreenState;

	// Token: 0x04000E88 RID: 3720
	public AudioClip AdjustToIdleSound;

	// Token: 0x04000E89 RID: 3721
	public GameObject StaticScreen;

	// Token: 0x04000E8A RID: 3722
	public AudioClip StaticForSwitching;

	// Token: 0x04000E8B RID: 3723
	public List<RepulsorTestFireBehavior.LocationInfo> Locations;

	// Token: 0x04000E8C RID: 3724
	public RepulsorTestFireBehavior.EnemyInfo CurrentEnemy;

	// Token: 0x04000E8D RID: 3725
	public RepulsorTestFireBehavior.EnemyInfo ExitingEnemy;

	// Token: 0x04000E8E RID: 3726
	public AudioClip SlideInSound;

	// Token: 0x04000E8F RID: 3727
	public List<RepulsorTestFireBehavior.EnemyInfo> EnemyMasterList;

	// Token: 0x04000E90 RID: 3728
	public TextMesh EnemyName;

	// Token: 0x04000E91 RID: 3729
	private int enemyindex;

	// Token: 0x04000E92 RID: 3730
	public List<RepulsorTestFireBehavior.WeaponInfo> DeployWeapons;

	// Token: 0x04000E93 RID: 3731
	public List<RepulsorTestFireBehavior.WeaponInfo> Gestures;

	// Token: 0x04000E94 RID: 3732
	public RepulsorTestFireBehavior.WeaponInfo PulseBolt;

	// Token: 0x04000E95 RID: 3733
	public RepulsorTestFireBehavior.WeaponInfo PalmCannon;

	// Token: 0x04000E96 RID: 3734
	public RepulsorTestFireBehavior.WeaponInfo CurrentDeployWeapon;

	// Token: 0x04000E97 RID: 3735
	public RepulsorTestFireBehavior.WeaponInfo CurrentGestureWeapon;

	// Token: 0x04000E98 RID: 3736
	public string ThumbAnimation = "fire";

	// Token: 0x04000E99 RID: 3737
	public string PalmAnimation = "palm charge";

	// Token: 0x04000E9A RID: 3738
	public string DeployAnimation = "deploy";

	// Token: 0x04000E9B RID: 3739
	public string DeployMissileAnimation = "DeployMissile";

	// Token: 0x04000E9C RID: 3740
	public string DeployCeilingAnimation = "DeployCeiling";

	// Token: 0x04000E9D RID: 3741
	public string DeployBeamAnimation = "DeployBeam";

	// Token: 0x04000E9E RID: 3742
	public string DeployBarrage = "DeployBarrage";

	// Token: 0x04000E9F RID: 3743
	public string DeployMissileQuick = "DeployMissileQuick";

	// Token: 0x04000EA0 RID: 3744
	public string GestureAnimation = "gesture";

	// Token: 0x04000EA1 RID: 3745
	public string GestureWhipAnimation = "GestureStartWhip";

	// Token: 0x04000EA2 RID: 3746
	public string GestureWhipQuickAnimation = "GestureStartWhipQuick";

	// Token: 0x04000EA3 RID: 3747
	public string ClassifiedAnimation = "Classified";

	// Token: 0x04000EA4 RID: 3748
	public Transform TargetSpawnLocationRight;

	// Token: 0x04000EA5 RID: 3749
	public Transform TargetSpawnLocationLeft;

	// Token: 0x04000EA6 RID: 3750
	public Transform TargetDestination;

	// Token: 0x04000EA7 RID: 3751
	public float TargetMoveVelocity = 5f;

	// Token: 0x04000EA8 RID: 3752
	public List<GameObject> LightningTargets;

	// Token: 0x04000EA9 RID: 3753
	public List<ParticleSystem> EMPWorldParticleSystems;

	// Token: 0x04000EAA RID: 3754
	public List<CallLightning> EMPWorldCallLightnings;

	// Token: 0x04000EAB RID: 3755
	public List<Transform> EMPWorldCallLightningTargets;

	// Token: 0x04000EAC RID: 3756
	public Transform HulkBusterPartTopSpawnLocation;

	// Token: 0x04000EAD RID: 3757
	public Transform HulkBusterPartBottomSpawnLocation;

	// Token: 0x04000EAE RID: 3758
	private RepulsorTestFireBehavior.ScreenStaticState StaticState;

	// Token: 0x04000EAF RID: 3759
	private Vector3 TargetCenter;

	// Token: 0x04000EB0 RID: 3760
	private GameObject ActivePreWarm;

	// Token: 0x04000EB1 RID: 3761
	private string LastBackground;

	// Token: 0x04000EB2 RID: 3762
	private GameObject LatestBeam;

	// Token: 0x04000EB3 RID: 3763
	private GameObject LatestBeamMuzzle;

	// Token: 0x04000EB4 RID: 3764
	private RepulsorTestFireBehavior.ScreenState PreviousScreenState;

	// Token: 0x04000EB5 RID: 3765
	private float ShotTimeStamp;

	// Token: 0x04000EB6 RID: 3766
	public List<Material> StaticScreenEffectMaterials;

	// Token: 0x04000EB7 RID: 3767
	private float GenScramblerStartTime;

	// Token: 0x04000EB8 RID: 3768
	public GameObject CurrentReturnAttack;

	// Token: 0x04000EB9 RID: 3769
	public GameObject CurrentWarmUp;

	// Token: 0x04000EBA RID: 3770
	private bool LateStartOneShot;

	// Token: 0x04000EBB RID: 3771
	private float StartTime;

	// Token: 0x04000EBC RID: 3772
	private float TimeDeployButtonPressed;

	// Token: 0x04000EBD RID: 3773
	private float LastTimeClassifiedScreenEffect;

	// Token: 0x04000EBE RID: 3774
	private RepulsorTestFireBehavior.EnemyInfo _spawnEnemy;

	// Token: 0x04000EBF RID: 3775
	private bool m_bPlayBackgroundStaticSfx;

	// Token: 0x04000EC0 RID: 3776
	private AudioSource m_ChargeAudioSource;

	// Token: 0x02000200 RID: 512
	[Serializable]
	public class WeaponInfo
	{
		// Token: 0x04000EC1 RID: 3777
		public string AbilityName;

		// Token: 0x04000EC2 RID: 3778
		public string AbilityID;

		// Token: 0x04000EC3 RID: 3779
		public GameObject BulletPrefab;

		// Token: 0x04000EC4 RID: 3780
		public GameObject ImpactPrefab;

		// Token: 0x04000EC5 RID: 3781
		public GameObject BeamImpactPrefab;

		// Token: 0x04000EC6 RID: 3782
		public GameObject BeamScorchMarkPrefab;

		// Token: 0x04000EC7 RID: 3783
		public GameObject MuzzleFlashPrefab;

		// Token: 0x04000EC8 RID: 3784
		public bool MuzzleFlashRandomRotation;

		// Token: 0x04000EC9 RID: 3785
		public GameObject WarmUpPrefab;

		// Token: 0x04000ECA RID: 3786
		public GameObject ShieldedImpactPrefab;

		// Token: 0x04000ECB RID: 3787
		public GameObject ShieldedBeamImpactPrefab;

		// Token: 0x04000ECC RID: 3788
		public GameObject GestureBlockingModel;

		// Token: 0x04000ECD RID: 3789
		public List<GameObject> GestureHulkBusterParts;

		// Token: 0x04000ECE RID: 3790
		public GameObject BulletHolePrefab;

		// Token: 0x04000ECF RID: 3791
		public GameObject AddedPart;

		// Token: 0x04000ED0 RID: 3792
		public float ChargeTime;

		// Token: 0x04000ED1 RID: 3793
		public float Velocity;

		// Token: 0x04000ED2 RID: 3794
		public float Damage;

		// Token: 0x04000ED3 RID: 3795
		public float Force;

		// Token: 0x04000ED4 RID: 3796
		public float DeathExplosiveForce;

		// Token: 0x04000ED5 RID: 3797
		public int ShotCount = 1;

		// Token: 0x04000ED6 RID: 3798
		public float ShotTime;

		// Token: 0x04000ED7 RID: 3799
		public bool ShieldBreaker;

		// Token: 0x04000ED8 RID: 3800
		public RepulsorTestFireBehavior.AttackInfoType AttackType;

		// Token: 0x04000ED9 RID: 3801
		public bool AimedWeapon = true;

		// Token: 0x04000EDA RID: 3802
		public bool ShouldMoveAtStart = true;

		// Token: 0x04000EDB RID: 3803
		public bool DelayDestroyParticleSystem;

		// Token: 0x04000EDC RID: 3804
		public bool RaycastType;

		// Token: 0x04000EDD RID: 3805
		public bool RaycastOneShot;

		// Token: 0x04000EDE RID: 3806
		public float RaycastOneShotBeamLifeTime;

		// Token: 0x04000EDF RID: 3807
		public bool ParticleBasedBeam;

		// Token: 0x04000EE0 RID: 3808
		public float RaycastDistance;

		// Token: 0x04000EE1 RID: 3809
		public LayerMask RaycaseLayerMask;

		// Token: 0x04000EE2 RID: 3810
		public float OffsetInsideCircle;

		// Token: 0x04000EE3 RID: 3811
		public AudioClip TurnOnSound;

		// Token: 0x04000EE4 RID: 3812
		public List<AudioClip> ShotSound;

		// Token: 0x04000EE5 RID: 3813
		public List<AudioClip> ImpactSound;

		// Token: 0x04000EE6 RID: 3814
		public AudioClip LoopingShootSound;

		// Token: 0x04000EE7 RID: 3815
		public AudioClip FlyingSound;

		// Token: 0x04000EE8 RID: 3816
		public List<AudioClip> ChargeSound;

		// Token: 0x04000EE9 RID: 3817
		public AudioClip CancelSound;

		// Token: 0x04000EEA RID: 3818
		public AudioClip ReadySound;

		// Token: 0x04000EEB RID: 3819
		public bool bRepeatReadySound = true;

		// Token: 0x04000EEC RID: 3820
		public RepulsorTestFireBehavior.AnimationUsed TypeOfAnimation;

		// Token: 0x04000EED RID: 3821
		public RepulsorTestFireBehavior.MuzzleLocator MuzzleLocation;

		// Token: 0x04000EEE RID: 3822
		public RepulsorTestFireBehavior.ScreenEffect WeaponScreenEffect;

		// Token: 0x04000EEF RID: 3823
		public float ScreenEffectDelay;
	}

	// Token: 0x02000201 RID: 513
	public enum AnimationUsed
	{
		// Token: 0x04000EF1 RID: 3825
		PulseBolt,
		// Token: 0x04000EF2 RID: 3826
		PalmCannon,
		// Token: 0x04000EF3 RID: 3827
		DeployBarrage,
		// Token: 0x04000EF4 RID: 3828
		DeployMissile,
		// Token: 0x04000EF5 RID: 3829
		DeployBeam,
		// Token: 0x04000EF6 RID: 3830
		DeployCeilingCall,
		// Token: 0x04000EF7 RID: 3831
		DeployQuickShot,
		// Token: 0x04000EF8 RID: 3832
		GestureBlock,
		// Token: 0x04000EF9 RID: 3833
		GestureWhip,
		// Token: 0x04000EFA RID: 3834
		GestureWhipQuick,
		// Token: 0x04000EFB RID: 3835
		Classified,
		// Token: 0x04000EFC RID: 3836
		Custom
	}

	// Token: 0x02000202 RID: 514
	public enum ShotType
	{
		// Token: 0x04000EFE RID: 3838
		Single,
		// Token: 0x04000EFF RID: 3839
		Hold,
		// Token: 0x04000F00 RID: 3840
		Release
	}

	// Token: 0x02000203 RID: 515
	public enum MuzzleLocator
	{
		// Token: 0x04000F02 RID: 3842
		Main,
		// Token: 0x04000F03 RID: 3843
		Palm,
		// Token: 0x04000F04 RID: 3844
		Deploy,
		// Token: 0x04000F05 RID: 3845
		Roof
	}

	// Token: 0x02000204 RID: 516
	public enum AttackInfoType
	{
		// Token: 0x04000F07 RID: 3847
		Default,
		// Token: 0x04000F08 RID: 3848
		Bullet,
		// Token: 0x04000F09 RID: 3849
		Acid,
		// Token: 0x04000F0A RID: 3850
		Fire,
		// Token: 0x04000F0B RID: 3851
		Ice
	}

	// Token: 0x02000205 RID: 517
	public enum ScreenEffect
	{
		// Token: 0x04000F0D RID: 3853
		None,
		// Token: 0x04000F0E RID: 3854
		Static,
		// Token: 0x04000F0F RID: 3855
		Frost,
		// Token: 0x04000F10 RID: 3856
		GeneticScrambler,
		// Token: 0x04000F11 RID: 3857
		Classified
	}

	// Token: 0x02000206 RID: 518
	public enum ScreenState
	{
		// Token: 0x04000F13 RID: 3859
		None,
		// Token: 0x04000F14 RID: 3860
		StaticStart,
		// Token: 0x04000F15 RID: 3861
		StaticFadeStart,
		// Token: 0x04000F16 RID: 3862
		StaticFading,
		// Token: 0x04000F17 RID: 3863
		ClassifiedStart,
		// Token: 0x04000F18 RID: 3864
		ClassifiedFadeStart,
		// Token: 0x04000F19 RID: 3865
		ClassifiedFading,
		// Token: 0x04000F1A RID: 3866
		FreezingStart,
		// Token: 0x04000F1B RID: 3867
		Freezing,
		// Token: 0x04000F1C RID: 3868
		FreezingFadeStart,
		// Token: 0x04000F1D RID: 3869
		FreezingFading,
		// Token: 0x04000F1E RID: 3870
		ScrambleStart,
		// Token: 0x04000F1F RID: 3871
		ScrambleBegin,
		// Token: 0x04000F20 RID: 3872
		Scrambling,
		// Token: 0x04000F21 RID: 3873
		ScrambleEnd
	}

	// Token: 0x02000207 RID: 519
	[Serializable]
	public class EnemyInfo
	{
		// Token: 0x04000F22 RID: 3874
		public string EnemyName;

		// Token: 0x04000F23 RID: 3875
		public GameObject EnemyPrefab;

		// Token: 0x04000F24 RID: 3876
		public float Health;

		// Token: 0x04000F25 RID: 3877
		public bool Shielded;

		// Token: 0x04000F26 RID: 3878
		public string enemy_id;

		// Token: 0x04000F27 RID: 3879
		public string PreferedLocation;

		// Token: 0x04000F28 RID: 3880
		public GameObject EnemyGameObject;

		// Token: 0x04000F29 RID: 3881
		public GameObject Death_Prefab;

		// Token: 0x04000F2A RID: 3882
		public GameObject ShieldBreakEffectPrefab;

		// Token: 0x04000F2B RID: 3883
		public List<GameObject> Death_Shrapnel_Prefabs;

		// Token: 0x04000F2C RID: 3884
		public List<GameObject> Death_Ice_Shrapnel_Prefabs;

		// Token: 0x04000F2D RID: 3885
		public GameObject Death_Ice_Prefab;
	}

	// Token: 0x02000208 RID: 520
	[Serializable]
	public class LocationInfo
	{
		// Token: 0x04000F2E RID: 3886
		public string LocationName;

		// Token: 0x04000F2F RID: 3887
		public GameObject LocationBackground;
	}

	// Token: 0x02000209 RID: 521
	public enum SpawnSide
	{
		// Token: 0x04000F31 RID: 3889
		Right,
		// Token: 0x04000F32 RID: 3890
		Left
	}

	// Token: 0x0200020A RID: 522
	public enum ScreenStaticState
	{
		// Token: 0x04000F34 RID: 3892
		Off,
		// Token: 0x04000F35 RID: 3893
		FadeOn,
		// Token: 0x04000F36 RID: 3894
		FadeOff,
		// Token: 0x04000F37 RID: 3895
		On
	}

	// Token: 0x02000364 RID: 868
	// (Invoke) Token: 0x060015B2 RID: 5554
	private delegate void DelayedMethod();
}
