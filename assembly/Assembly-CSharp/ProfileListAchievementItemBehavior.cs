using System;
using UnityEngine;

// Token: 0x020002C8 RID: 712
public class ProfileListAchievementItemBehavior : MonoBehaviour
{
	// Token: 0x060012D2 RID: 4818 RVA: 0x00086894 File Offset: 0x00084A94
	public void set_data(AchievementItemClass d)
	{
		this._data = d;
		this.label.text = d.name;
		this.cond_lbl.text = d.description;
		string text = this.icon_prefix + d.id;
		if (this.icon.atlas.GetSprite(text) != null)
		{
			this.icon.spriteName = text;
		}
		this.refresh();
	}

	// Token: 0x060012D3 RID: 4819 RVA: 0x00086904 File Offset: 0x00084B04
	private void set_count_label()
	{
		AchievementEvents.UnlockCriteria unlockCriteria = null;
		for (int i = 0; i < AchievementEvents.inst.unlockCriterias.Count; i++)
		{
			if (AchievementEvents.inst.unlockCriterias[i].id == this._data.id)
			{
				unlockCriteria = AchievementEvents.inst.unlockCriterias[i];
				break;
			}
		}
		if (unlockCriteria != null)
		{
			this.count_lbl.text = unlockCriteria.actions_done().ToString() + "/" + unlockCriteria.actions_to_complete().ToString();
		}
		else
		{
			this.count_lbl.text = string.Empty;
		}
	}

	// Token: 0x060012D4 RID: 4820 RVA: 0x000869C0 File Offset: 0x00084BC0
	public bool getAchievementUnlocked()
	{
		return this._data != null && globals.player_data.achievements.Contains(this._data.id);
	}

	// Token: 0x060012D5 RID: 4821 RVA: 0x000869F8 File Offset: 0x00084BF8
	public void refresh()
	{
		if (this._data == null)
		{
			base.gameObject.SetActive(false);
			return;
		}
		this.count_lbl.text = string.Empty;
		if (globals.player_data.achievements.Contains(this._data.id))
		{
			this.icon.color = Color.white;
		}
		else
		{
			if (globals.player_data.latest_device_data && this._data.count > -1)
			{
				this.set_count_label();
			}
			this.icon.color = Color.black;
			base.gameObject.transform.SetAsLastSibling();
		}
	}

	// Token: 0x040013CC RID: 5068
	public UISprite icon;

	// Token: 0x040013CD RID: 5069
	public UILabel label;

	// Token: 0x040013CE RID: 5070
	public UILabel cond_lbl;

	// Token: 0x040013CF RID: 5071
	public UILabel count_lbl;

	// Token: 0x040013D0 RID: 5072
	public string icon_prefix = "ACHIEVEMENT_";

	// Token: 0x040013D1 RID: 5073
	private AchievementItemClass _data;
}
