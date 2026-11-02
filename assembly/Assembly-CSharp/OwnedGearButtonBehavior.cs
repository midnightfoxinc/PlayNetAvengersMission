using System;
using UnityEngine;

// Token: 0x020001A2 RID: 418
public class OwnedGearButtonBehavior : buttonBehavior
{
	// Token: 0x06000C93 RID: 3219 RVA: 0x0005B57C File Offset: 0x0005977C
	private void Start()
	{
		UIPanel uipanel = NGUITools.FindInParents<UIPanel>(base.gameObject);
		this.scrollViewTransform = uipanel.transform;
	}

	// Token: 0x06000C94 RID: 3220 RVA: 0x0005B5A4 File Offset: 0x000597A4
	public void set_data(PlayerDeviceClass data)
	{
		this.id = data.id;
		this.sprite.spriteName = this.spritename_prefix + data.type.ToString();
		GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(data.type.ToString(), true) as GearDBItemClass;
		if (gearDBItemClass)
		{
			this.name_label.text = gearDBItemClass.name;
		}
		this.id_label.text = data.id.ToString() + " (registered)";
		this.registered = OwnedGearButtonBehavior.reg_enum.mine;
	}

	// Token: 0x06000C95 RID: 3221 RVA: 0x0005B640 File Offset: 0x00059840
	public void updateLabel(string label)
	{
		this.id_label.text = this.id.ToString() + " (" + label + ")";
	}

	// Token: 0x06000C96 RID: 3222 RVA: 0x0005B674 File Offset: 0x00059874
	protected override void Update()
	{
		base.Update();
		this.index = NGUITools.FindInParents<UIGrid>(base.gameObject).GetIndex(base.gameObject.transform);
		this.selected = (Mathf.FloorToInt(Mathf.Abs(this.scrollViewTransform.localPosition.x / NGUITools.FindInParents<UIGrid>(base.gameObject).cellWidth)) == this.index);
	}

	// Token: 0x04000C62 RID: 3170
	public UILabel name_label;

	// Token: 0x04000C63 RID: 3171
	public UILabel id_label;

	// Token: 0x04000C64 RID: 3172
	public bool selected;

	// Token: 0x04000C65 RID: 3173
	private int index = -1;

	// Token: 0x04000C66 RID: 3174
	public int id = -1;

	// Token: 0x04000C67 RID: 3175
	public OwnedGearButtonBehavior.reg_enum registered;

	// Token: 0x04000C68 RID: 3176
	private Transform scrollViewTransform;

	// Token: 0x04000C69 RID: 3177
	public string spritename_prefix = "gearfound_";

	// Token: 0x020001A3 RID: 419
	public enum reg_enum
	{
		// Token: 0x04000C6B RID: 3179
		unregistered,
		// Token: 0x04000C6C RID: 3180
		mine,
		// Token: 0x04000C6D RID: 3181
		not_mine
	}
}
