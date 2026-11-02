using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002DA RID: 730
public class NewAbilityPanelBehavior : MonoBehaviour
{
	// Token: 0x06001340 RID: 4928 RVA: 0x000894A4 File Offset: 0x000876A4
	public void show()
	{
		for (int i = 0; i < globals.new_abilities.Count; i++)
		{
			AbilityDBItemClass abilityDBItemClass = globals.database_data.item_by_id(globals.new_abilities[i], true) as AbilityDBItemClass;
			if (abilityDBItemClass.mola == this.mola)
			{
				this._new_abilities.Add(abilityDBItemClass);
				globals.new_abilities.RemoveAt(i);
				i--;
			}
		}
		if (this._new_abilities.Count > 0)
		{
			base.gameObject.SetActive(true);
			this._showing = 0;
			this.display();
		}
	}

	// Token: 0x06001341 RID: 4929 RVA: 0x00089544 File Offset: 0x00087744
	private void display()
	{
		if (this._showing < this._new_abilities.Count)
		{
			this._data = this._new_abilities[this._showing];
			if (this._data)
			{
				this.name_label.text = this._data.name;
				this.desc_lbl.text = this._data.description;
				this.portrait.mainTexture = Resources.Load<Texture>(this.portrait_prefix + this._data.id);
				if (this._data.mola == "2111")
				{
					this.set_color(Constants.PlaymationDeviceType.DEVICE_HULKHAND);
				}
				else
				{
					this.set_color(Constants.PlaymationDeviceType.DEVICE_REPULSOR);
				}
				this.prev_btn.gameObject.SetActive(this._showing > 0);
				this.prev_btn_lbl.text = this._showing.ToString();
				this.next_btn.gameObject.SetActive(this._showing < this._new_abilities.Count - 1);
				this.next_btn_lbl.text = (this._new_abilities.Count - 1 - this._showing).ToString();
			}
		}
		else
		{
			this.close();
		}
	}

	// Token: 0x06001342 RID: 4930 RVA: 0x0008969C File Offset: 0x0008789C
	private void set_color(Constants.PlaymationDeviceType type)
	{
		if (type == Constants.PlaymationDeviceType.DEVICE_HULKHAND)
		{
			this.glow.color = this.gamma_color;
			this.outline.color = this.gamma_color;
		}
		else
		{
			this.glow.color = this.repulsor_color;
			this.outline.color = this.repulsor_color;
		}
	}

	// Token: 0x06001343 RID: 4931 RVA: 0x00089700 File Offset: 0x00087900
	private void close()
	{
		this._new_abilities.Clear();
		base.gameObject.SetActive(false);
		globals.sfx_master.play(this.close_sfx, null);
	}

	// Token: 0x06001344 RID: 4932 RVA: 0x00089738 File Offset: 0x00087938
	private void Update()
	{
		if (this.ability_btn.clicked)
		{
			globals.poster_album.show(this._data);
		}
		else if (this.close_btn.clicked)
		{
			this.close();
		}
		else if (this.next_btn.clicked && this._showing < this._new_abilities.Count - 1)
		{
			this._showing++;
			this.display();
		}
		else if (this.prev_btn.clicked && this._showing > 0)
		{
			this._showing--;
			this.display();
		}
	}

	// Token: 0x0400146F RID: 5231
	public UILabel name_label;

	// Token: 0x04001470 RID: 5232
	public UILabel desc_lbl;

	// Token: 0x04001471 RID: 5233
	public UITexture portrait;

	// Token: 0x04001472 RID: 5234
	public buttonBehavior ability_btn;

	// Token: 0x04001473 RID: 5235
	public buttonBehavior close_btn;

	// Token: 0x04001474 RID: 5236
	public buttonBehavior next_btn;

	// Token: 0x04001475 RID: 5237
	public buttonBehavior prev_btn;

	// Token: 0x04001476 RID: 5238
	public UILabel next_btn_lbl;

	// Token: 0x04001477 RID: 5239
	public UILabel prev_btn_lbl;

	// Token: 0x04001478 RID: 5240
	public UISprite glow;

	// Token: 0x04001479 RID: 5241
	public UISprite outline;

	// Token: 0x0400147A RID: 5242
	public Color repulsor_color;

	// Token: 0x0400147B RID: 5243
	public Color gamma_color;

	// Token: 0x0400147C RID: 5244
	private string portrait_prefix = "db portraits/ability/DBportrait_";

	// Token: 0x0400147D RID: 5245
	public string close_sfx = "db hide";

	// Token: 0x0400147E RID: 5246
	public string mola;

	// Token: 0x0400147F RID: 5247
	private List<AbilityDBItemClass> _new_abilities = new List<AbilityDBItemClass>();

	// Token: 0x04001480 RID: 5248
	private AbilityDBItemClass _data;

	// Token: 0x04001481 RID: 5249
	private int _showing;
}
