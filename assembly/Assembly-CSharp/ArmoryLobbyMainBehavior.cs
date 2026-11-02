using System;
using UnityEngine;

// Token: 0x020002DD RID: 733
public class ArmoryLobbyMainBehavior : MonoBehaviour
{
	// Token: 0x06001351 RID: 4945 RVA: 0x0008A0D8 File Offset: 0x000882D8
	private void Start()
	{
		globals.armory_lobby = this;
		if (globals.ability_to_test)
		{
			if (globals.ability_to_test.mola == "2111")
			{
				this.load_armory(ArmoryLobbyMainBehavior.armory_type_enum.gamma);
			}
			else
			{
				this.load_armory(ArmoryLobbyMainBehavior.armory_type_enum.repulsor);
			}
		}
		else
		{
			this.blast_doors.Play(this.waiting_animation);
		}
		globals.music_jukebox.change_music(this.music, 0.25f);
	}

	// Token: 0x06001352 RID: 4946 RVA: 0x0008A154 File Offset: 0x00088354
	private void load_armory(ArmoryLobbyMainBehavior.armory_type_enum type)
	{
		string text;
		string text2;
		if (type == ArmoryLobbyMainBehavior.armory_type_enum.gamma)
		{
			text = this.gamma_armory_scene;
			text2 = this.gamma_loading_animation;
		}
		else
		{
			text = this.repulsor_armory_scene;
			text2 = this.repulsor_loading_animation;
		}
		globals.debug("loading " + text);
		this.state = ArmoryLobbyMainBehavior.blast_doors_state_enum.loading;
		this.blast_doors.CrossFade(text2, 0.1f);
		NavigationManager.load_scene_async(text);
	}

	// Token: 0x06001353 RID: 4947 RVA: 0x0008A1B8 File Offset: 0x000883B8
	private void Update()
	{
		switch (this.state)
		{
		case ArmoryLobbyMainBehavior.blast_doors_state_enum.waiting:
			if (Input.GetMouseButtonDown(0))
			{
				if (globals.selectedObject == this.repulsor_collider.gameObject)
				{
					this.load_armory(ArmoryLobbyMainBehavior.armory_type_enum.repulsor);
				}
				else if (globals.selectedObject == this.gamma_collider.gameObject)
				{
					this.load_armory(ArmoryLobbyMainBehavior.armory_type_enum.gamma);
				}
			}
			else if (this.back_button.clicked || Input.GetKeyDown(27))
			{
				this.state = ArmoryLobbyMainBehavior.blast_doors_state_enum.loading;
				NavigationManager.load_scene_additive(NavigationManager.hq_scene);
			}
			break;
		case ArmoryLobbyMainBehavior.blast_doors_state_enum.loading:
			this.back_button.gameObject.SetActive(false);
			this.loading_wait -= Time.deltaTime;
			if (this.loading_wait < 0f && !NavigationManager.is_loading())
			{
				this.blast_doors.CrossFade(this.open_animation, 0.1f);
				this.state = ArmoryLobbyMainBehavior.blast_doors_state_enum.opening;
				NavigationManager.set_active_scene(NavigationManager.hq_scene);
			}
			break;
		case ArmoryLobbyMainBehavior.blast_doors_state_enum.opening:
			if (this.blast_doors.GetCurrentAnimatorStateInfo(0).IsName(this.idle_state))
			{
				NavigationManager.unload_scene(base.gameObject.scene.name);
			}
			break;
		}
	}

	// Token: 0x040014AA RID: 5290
	public UIRoot root;

	// Token: 0x040014AB RID: 5291
	public Animator blast_doors;

	// Token: 0x040014AC RID: 5292
	public buttonBehavior back_button;

	// Token: 0x040014AD RID: 5293
	public Collider repulsor_collider;

	// Token: 0x040014AE RID: 5294
	public Collider gamma_collider;

	// Token: 0x040014AF RID: 5295
	public string waiting_animation = "closed";

	// Token: 0x040014B0 RID: 5296
	public string repulsor_loading_animation;

	// Token: 0x040014B1 RID: 5297
	public string gamma_loading_animation;

	// Token: 0x040014B2 RID: 5298
	public string open_animation = "blast doors open";

	// Token: 0x040014B3 RID: 5299
	public string idle_state = "idle";

	// Token: 0x040014B4 RID: 5300
	public ArmoryLobbyMainBehavior.blast_doors_state_enum state;

	// Token: 0x040014B5 RID: 5301
	public string repulsor_armory_scene = "repulsor armory menu";

	// Token: 0x040014B6 RID: 5302
	public string gamma_armory_scene = "gamma armory menu";

	// Token: 0x040014B7 RID: 5303
	public float loading_wait = 2f;

	// Token: 0x040014B8 RID: 5304
	public string music;

	// Token: 0x020002DE RID: 734
	public enum blast_doors_state_enum
	{
		// Token: 0x040014BA RID: 5306
		waiting,
		// Token: 0x040014BB RID: 5307
		loading,
		// Token: 0x040014BC RID: 5308
		opening
	}

	// Token: 0x020002DF RID: 735
	public enum armory_type_enum
	{
		// Token: 0x040014BE RID: 5310
		repulsor,
		// Token: 0x040014BF RID: 5311
		gamma
	}
}
