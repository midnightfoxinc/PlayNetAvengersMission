using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000214 RID: 532
public class TestfirePanelBehavior : MonoBehaviour
{
	// Token: 0x06000EFB RID: 3835 RVA: 0x0006AD04 File Offset: 0x00068F04
	private void Start()
	{
		this.testfire_scene.TestFirePanel = this;
		for (int i = 0; i < this.ability_button.Length; i++)
		{
			this.ability_button[i].gameObject.SetActive(false);
		}
	}

	// Token: 0x06000EFC RID: 3836 RVA: 0x0006AD4C File Offset: 0x00068F4C
	public void show(bool b)
	{
		if (b)
		{
			this.testfire_button_tween.PlayForward();
			this.type_button_tween.PlayReverse();
		}
		else
		{
			this.testfire_button_tween.PlayReverse();
			this.type_button_tween.PlayForward();
		}
	}

	// Token: 0x06000EFD RID: 3837 RVA: 0x0006AD88 File Offset: 0x00068F88
	public bool any_button_pressed()
	{
		for (int i = 0; i < this.ability_button.Length; i++)
		{
			if (this.ability_button[i].pressed)
			{
				return true;
			}
		}
		return this.thumb_button.pressed || this.palm_button.pressed;
	}

	// Token: 0x06000EFE RID: 3838 RVA: 0x0006ADE0 File Offset: 0x00068FE0
	public void show_all_buttons()
	{
		for (int i = 0; i < this.ability_button.Length; i++)
		{
			this.ability_button[i].gameObject.SetActive(true);
		}
	}

	// Token: 0x06000EFF RID: 3839 RVA: 0x0006AE1C File Offset: 0x0006901C
	public void set_ability(AbilityDBItemClass a)
	{
		if (!a)
		{
			return;
		}
		for (int i = 0; i < this.ability_button.Length; i++)
		{
			if (this.ability_button[i].slot == a.slot)
			{
				this.ability_button[i].gameObject.SetActive(true);
				this.ability_button[i].icon.spriteName = a.icon;
				this.ability_button[i].label.text = a.name;
			}
		}
		this.testfire_scene.set_ability(a);
	}

	// Token: 0x04000F6B RID: 3947
	public TestfireButtonBehavior thumb_button;

	// Token: 0x04000F6C RID: 3948
	public TestfireButtonBehavior palm_button;

	// Token: 0x04000F6D RID: 3949
	public TestfireButtonBehavior[] ability_button;

	// Token: 0x04000F6E RID: 3950
	public UITexture StaticScreenEffect;

	// Token: 0x04000F6F RID: 3951
	public UITexture FrostScreenEffect;

	// Token: 0x04000F70 RID: 3952
	public UITexture GeneticScramblerEffect;

	// Token: 0x04000F71 RID: 3953
	public UITexture ClassifiedEffect;

	// Token: 0x04000F72 RID: 3954
	public List<UITexture> ScreenEffects;

	// Token: 0x04000F73 RID: 3955
	public TweenPosition testfire_button_tween;

	// Token: 0x04000F74 RID: 3956
	public TweenPosition type_button_tween;

	// Token: 0x04000F75 RID: 3957
	public RepulsorTestFireBehavior testfire_scene;
}
