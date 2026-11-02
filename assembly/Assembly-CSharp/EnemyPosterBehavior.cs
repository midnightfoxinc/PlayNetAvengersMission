using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002F2 RID: 754
public class EnemyPosterBehavior : DetailsPanelBehavior
{
	// Token: 0x060013DC RID: 5084 RVA: 0x0008F2DC File Offset: 0x0008D4DC
	private void Start()
	{
	}

	// Token: 0x060013DD RID: 5085 RVA: 0x0008F2E0 File Offset: 0x0008D4E0
	protected override void cleanup()
	{
		Resources.UnloadAsset(this.large_portrait.mainTexture);
		Resources.UnloadAsset(this.bg.mainTexture);
	}

	// Token: 0x060013DE RID: 5086 RVA: 0x0008F310 File Offset: 0x0008D510
	public void show(EnemyDBItemClass d)
	{
		this.cleanup();
		this.name_label.text = d.name + ": " + d.enemy_class;
		this.bio_label.text = "[b]BIO:[/b] " + d.bio;
		this.large_portrait.mainTexture = Resources.Load<Texture>(this.portrait_prefix + d.id);
		this.bg.mainTexture = Resources.Load<Texture>("db details bgs/" + d.bg);
		this.repulsor_action_button.set_id(d.tip(Constants.PlaymationDeviceType.DEVICE_REPULSOR));
		this.gamma_action_button.set_id(d.tip(Constants.PlaymationDeviceType.DEVICE_HULKHAND));
		base.gameObject.SetActive(true);
		this.see_also.set_buttons(d.see_also);
		globals.sfx_master.play(this.show_sfx, null);
		ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
		scavenger_hunt_types type = scavenger_hunt_types.VIEW_DATABASE_ENTRY;
		List<string> list = new List<string>();
		list.Add(d.id);
		list.Add(d.item_type.ToString());
		list.Add(d.enemy_class);
		list.Add(d.tip(Constants.PlaymationDeviceType.DEVICE_REPULSOR));
		scavenger_hunt_manager.do_action(type, list, 1);
		this.table.repositionNow = true;
		this.scroll_view.ResetPosition();
	}

	// Token: 0x060013DF RID: 5087 RVA: 0x0008F464 File Offset: 0x0008D664
	protected override void Update()
	{
		base.Update();
		if (this.repulsor_action_button.released)
		{
			globals.poster_album.show(this.repulsor_action_button.data);
		}
		if (this.gamma_action_button.released)
		{
			globals.poster_album.show(this.gamma_action_button.data);
		}
	}

	// Token: 0x040015A5 RID: 5541
	public UITexture large_portrait;

	// Token: 0x040015A6 RID: 5542
	public UITexture bg;

	// Token: 0x040015A7 RID: 5543
	public DBItemButtonBehavior repulsor_action_button;

	// Token: 0x040015A8 RID: 5544
	public DBItemButtonBehavior gamma_action_button;

	// Token: 0x040015A9 RID: 5545
	public UILabel bio_label;

	// Token: 0x040015AA RID: 5546
	private string portrait_prefix = "db portraits/enemy/DBportrait_";

	// Token: 0x040015AB RID: 5547
	public UITable table;

	// Token: 0x040015AC RID: 5548
	public UIScrollView scroll_view;
}
