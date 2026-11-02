using System;
using UnityEngine;

// Token: 0x020002F5 RID: 757
public class PosterAlbumBehavior : MonoBehaviour
{
	// Token: 0x060013E8 RID: 5096 RVA: 0x0008F620 File Offset: 0x0008D820
	private void Start()
	{
		if (!globals.poster_album)
		{
			globals.poster_album = this;
			this.hide_all_posters();
			return;
		}
		base.gameObject.SetActive(false);
		globals.debugWarning("extra poster album found at " + NGUITools.GetHierarchy(base.gameObject));
	}

	// Token: 0x060013E9 RID: 5097 RVA: 0x0008F674 File Offset: 0x0008D874
	private void hide_all_posters()
	{
		if (this.sf_poster)
		{
			this.sf_poster.close(true);
		}
		else
		{
			globals.debugWarning("WARNING: sf_poster not found!");
		}
		if (this.enemy_poster)
		{
			this.enemy_poster.close(true);
		}
		else
		{
			globals.debugWarning("WARNING: enemy_poster not found!");
		}
		if (this.hazard_poster)
		{
			this.hazard_poster.close(true);
		}
		else
		{
			globals.debugWarning("WARNING: hazard_poster not found!");
		}
		if (this.action_poster)
		{
			this.action_poster.close(true);
		}
		else
		{
			globals.debugWarning("WARNING: action_poster not found!");
		}
		if (this.ability_poster)
		{
			this.ability_poster.close(true);
		}
		else
		{
			globals.debugWarning("WARNING: ability_poster not found!");
		}
		if (this.gear_poster)
		{
			this.gear_poster.close(true);
		}
		else
		{
			globals.debugWarning("WARNING: gear_poster not found!");
		}
	}

	// Token: 0x060013EA RID: 5098 RVA: 0x0008F784 File Offset: 0x0008D984
	public bool any_poster_showing()
	{
		return this.sf_poster.gameObject.activeInHierarchy || this.enemy_poster.gameObject.activeInHierarchy || this.hazard_poster.gameObject.activeInHierarchy || this.action_poster.gameObject.activeInHierarchy || this.ability_poster.gameObject.activeInHierarchy || this.gear_poster.gameObject.activeInHierarchy;
	}

	// Token: 0x060013EB RID: 5099 RVA: 0x0008F81C File Offset: 0x0008DA1C
	public void hide()
	{
		this.hide_all_posters();
	}

	// Token: 0x060013EC RID: 5100 RVA: 0x0008F824 File Offset: 0x0008DA24
	public void show(DBItemClass data)
	{
		this.hide_all_posters();
		base.gameObject.SetActive(true);
		if (!data)
		{
			globals.debugWarning("null data received!");
		}
		else if (data is SFDBItemClass)
		{
			this.sf_poster.show(data as SFDBItemClass);
		}
		else if (data is EnemyDBItemClass)
		{
			this.enemy_poster.show(data as EnemyDBItemClass);
		}
		else if (data is HazardDBItemClass)
		{
			this.hazard_poster.show(data as HazardDBItemClass);
		}
		else if (data is ActionDBItemClass)
		{
			this.action_poster.show(data as ActionDBItemClass);
		}
		else if (data is AbilityDBItemClass)
		{
			this.ability_poster.show(data as AbilityDBItemClass);
		}
		else if (data is GearDBItemClass)
		{
			this.gear_poster.show(data as GearDBItemClass);
		}
		else
		{
			globals.debugWarning("bad data received! " + data.name);
		}
	}

	// Token: 0x060013ED RID: 5101 RVA: 0x0008F938 File Offset: 0x0008DB38
	private void Update()
	{
	}

	// Token: 0x040015B3 RID: 5555
	public SFPosterBehavior sf_poster;

	// Token: 0x040015B4 RID: 5556
	public EnemyPosterBehavior enemy_poster;

	// Token: 0x040015B5 RID: 5557
	public HazardPosterBehavior hazard_poster;

	// Token: 0x040015B6 RID: 5558
	public ActionPosterBehavior action_poster;

	// Token: 0x040015B7 RID: 5559
	public AbilityPosterBehavior ability_poster;

	// Token: 0x040015B8 RID: 5560
	public GearPosterBehavior gear_poster;
}
