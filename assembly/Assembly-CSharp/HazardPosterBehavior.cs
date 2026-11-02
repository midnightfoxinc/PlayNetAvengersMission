using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002F4 RID: 756
public class HazardPosterBehavior : DetailsPanelBehavior
{
	// Token: 0x060013E4 RID: 5092 RVA: 0x0008F4E8 File Offset: 0x0008D6E8
	private void Start()
	{
	}

	// Token: 0x060013E5 RID: 5093 RVA: 0x0008F4EC File Offset: 0x0008D6EC
	protected override void cleanup()
	{
		Resources.UnloadAsset(this.large_portrait.mainTexture);
		Resources.UnloadAsset(this.bg.mainTexture);
	}

	// Token: 0x060013E6 RID: 5094 RVA: 0x0008F51C File Offset: 0x0008D71C
	public void show(HazardDBItemClass d)
	{
		this.cleanup();
		this.name_label.text = d.name;
		this.bio_label.text = "[b]BIO:[/b] " + d.description;
		this.large_portrait.mainTexture = Resources.Load<Texture>(this.portrait_prefix + d.id);
		this.bg.mainTexture = Resources.Load<Texture>("db details bgs/" + d.bg);
		base.gameObject.SetActive(true);
		this.see_also.set_buttons(d.see_also);
		globals.sfx_master.play(this.show_sfx, null);
		ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
		scavenger_hunt_types type = scavenger_hunt_types.VIEW_DATABASE_ENTRY;
		List<string> list = new List<string>();
		list.Add(d.id);
		list.Add(d.item_type.ToString());
		scavenger_hunt_manager.do_action(type, list, 1);
		this.table.repositionNow = true;
		this.scroll_view.ResetPosition();
	}

	// Token: 0x040015AD RID: 5549
	public UITexture large_portrait;

	// Token: 0x040015AE RID: 5550
	public UITexture bg;

	// Token: 0x040015AF RID: 5551
	public UILabel bio_label;

	// Token: 0x040015B0 RID: 5552
	private string portrait_prefix = "db portraits/enemy/DBportrait_";

	// Token: 0x040015B1 RID: 5553
	public UITable table;

	// Token: 0x040015B2 RID: 5554
	public UIScrollView scroll_view;
}
