using System;
using UnityEngine;

// Token: 0x02000216 RID: 534
public class AbilityDirectoryButtonBehavior : MonoBehaviour
{
	// Token: 0x06000F06 RID: 3846 RVA: 0x0006B188 File Offset: 0x00069388
	public void set_atlas(UIAtlas a)
	{
		this.sprite.atlas = a;
	}

	// Token: 0x06000F07 RID: 3847 RVA: 0x0006B198 File Offset: 0x00069398
	public void set_data(AbilityDBItemClass d)
	{
		this.data = d;
		if (d)
		{
			this.sprite.spriteName = d.icon;
			this.sprite.MakePixelPerfect();
			this.disabled = !globals.player_data.has_unlock(d.id);
			base.gameObject.SetActive(true);
		}
		else
		{
			base.gameObject.SetActive(false);
		}
	}

	// Token: 0x04000F80 RID: 3968
	public buttonBehavior info_button;

	// Token: 0x04000F81 RID: 3969
	public AbilityDBItemClass data;

	// Token: 0x04000F82 RID: 3970
	public Color pressed_color = Color.white;

	// Token: 0x04000F83 RID: 3971
	public Color disabled_color = Color.gray;

	// Token: 0x04000F84 RID: 3972
	public Vector2 ButtonStartingLocalScale;

	// Token: 0x04000F85 RID: 3973
	public UISprite sprite;

	// Token: 0x04000F86 RID: 3974
	public bool disabled;
}
