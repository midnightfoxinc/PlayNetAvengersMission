using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002E0 RID: 736
public class ArmoryMainBehavior : MonoBehaviour
{
	// Token: 0x06001355 RID: 4949 RVA: 0x0008A328 File Offset: 0x00088528
	private void Start()
	{
		globals.armory_main = this;
		this.testfire_panel.gameObject.SetActive(true);
		this.ability_select_panel.gameObject.SetActive(true);
		this.ability_select_panel.directory_tween.gameObject.SetActive(true);
		this.ability_select_panel.init();
		this.toggle_testfire(this.start_in_testfire);
		globals.music_jukebox.change_music(this.music, 0.25f);
		if (globals.new_abilities.Count > 0)
		{
			this.new_ability_panel.mola = this.mola();
			this.new_ability_panel.show();
		}
		else
		{
			this.new_ability_panel.gameObject.SetActive(false);
		}
		if (this.lobby_doors)
		{
			this.lobby_doors.gameObject.SetActive(true);
			this.lobby_doors.enabled = true;
			this.lobby_doors.Play(this.lobby_doors_open_animation);
		}
		if (globals.ability_to_test && globals.ability_to_test.mola == this.mola())
		{
			this.ability_select_panel.select_ability(globals.ability_to_test.id);
			globals.ability_to_test = null;
		}
		ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
		scavenger_hunt_types type = scavenger_hunt_types.VIEW_SCENE;
		List<string> list = new List<string>();
		list.Add("armory");
		scavenger_hunt_manager.do_action(type, list, 1);
	}

	// Token: 0x06001356 RID: 4950 RVA: 0x0008A484 File Offset: 0x00088684
	public void play_sfx(AudioClip clip)
	{
		if (!this._audio)
		{
			this._audio = base.GetComponent<AudioSource>();
		}
		if (this._audio && !SFXJukeboxBehavior.muted)
		{
			this._audio.PlayOneShot(clip);
		}
	}

	// Token: 0x06001357 RID: 4951 RVA: 0x0008A4D4 File Offset: 0x000886D4
	public string mola()
	{
		return this.ability_select_panel.ability_directory.ability_type_panel.mola;
	}

	// Token: 0x06001358 RID: 4952 RVA: 0x0008A4EC File Offset: 0x000886EC
	public void toggle_testfire(bool on)
	{
		this.testfire_panel.show(on);
		Camera.main.transform.GetComponent<BlurEffectBehavior>().enabled = !on;
		this.ability_select_panel.show(!on);
	}

	// Token: 0x06001359 RID: 4953 RVA: 0x0008A52C File Offset: 0x0008872C
	public bool in_testfire()
	{
		return !this.ability_select_panel.gameObject.activeInHierarchy;
	}

	// Token: 0x0600135A RID: 4954 RVA: 0x0008A544 File Offset: 0x00088744
	public void testfire_exit_check()
	{
		if (this.in_testfire() && !this.back_button.disabled && (this.back_button.clicked || Input.GetKeyDown(27)))
		{
			this.toggle_testfire(false);
			DMOManager.LogNavigation(NavigationManager.current_scene(), "back_btn", "armory_test_fire", null);
		}
	}

	// Token: 0x0600135B RID: 4955 RVA: 0x0008A5A4 File Offset: 0x000887A4
	public void armory_exit_check()
	{
		if (this.back_button.clicked || Input.GetKeyDown(27))
		{
			DMOManager.LogNavigation(NavigationManager.armory_lobby_scene, "back_btn", NavigationManager.current_scene(), null);
			NavigationManager.load_scene(NavigationManager.armory_lobby_scene);
		}
	}

	// Token: 0x0600135C RID: 4956 RVA: 0x0008A5EC File Offset: 0x000887EC
	private void Update()
	{
		this.back_button.disabled = (globals.armory_main.testfire_scene && !globals.armory_main.testfire_scene.inIdleState() && !this.ability_select_panel.gameObject.activeSelf);
		this.testfire_exit_check();
	}

	// Token: 0x040014C0 RID: 5312
	public AbilitySelectPanelBehavior ability_select_panel;

	// Token: 0x040014C1 RID: 5313
	public TestfirePanelBehavior testfire_panel;

	// Token: 0x040014C2 RID: 5314
	public NewAbilityPanelBehavior new_ability_panel;

	// Token: 0x040014C3 RID: 5315
	public RepulsorTestFireBehavior testfire_scene;

	// Token: 0x040014C4 RID: 5316
	public AudioSource LoopingAudioSource;

	// Token: 0x040014C5 RID: 5317
	public buttonBehavior back_button;

	// Token: 0x040014C6 RID: 5318
	public Camera ui_camera;

	// Token: 0x040014C7 RID: 5319
	public Camera scene_camera;

	// Token: 0x040014C8 RID: 5320
	public Animator lobby_doors;

	// Token: 0x040014C9 RID: 5321
	public string lobby_doors_open_animation = "open doors";

	// Token: 0x040014CA RID: 5322
	public bool start_in_testfire;

	// Token: 0x040014CB RID: 5323
	public string music;

	// Token: 0x040014CC RID: 5324
	public List<GameObject> ThingsToBlur;

	// Token: 0x040014CD RID: 5325
	private AudioSource _audio;
}
