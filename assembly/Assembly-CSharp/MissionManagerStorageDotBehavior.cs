using System;
using UnityEngine;

// Token: 0x02000297 RID: 663
public class MissionManagerStorageDotBehavior : MonoBehaviour
{
	// Token: 0x060011C7 RID: 4551 RVA: 0x0007F7A0 File Offset: 0x0007D9A0
	private void Awake()
	{
		this.inner_sprite.color = new Color(0f, 0f, 0f, 0.5f);
		this.download_animation.SetActive(false);
	}

	// Token: 0x060011C8 RID: 4552 RVA: 0x0007F7E0 File Offset: 0x0007D9E0
	public void set_memory_filled(bool filled)
	{
		this.inner_sprite.color = ((!filled) ? new Color(0f, 0f, 0f, 0.5f) : Color.green);
		this.download_animation.SetActive(false);
	}

	// Token: 0x060011C9 RID: 4553 RVA: 0x0007F830 File Offset: 0x0007DA30
	public void animate_dot()
	{
		this.download_animation.SetActive(true);
		this.inner_sprite.color = MissionManagerBehavior.MM_orange;
	}

	// Token: 0x0400123C RID: 4668
	public UISprite inner_sprite;

	// Token: 0x0400123D RID: 4669
	public GameObject download_animation;
}
