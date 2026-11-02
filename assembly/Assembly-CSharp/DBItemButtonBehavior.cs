using System;

// Token: 0x0200029B RID: 667
public class DBItemButtonBehavior : buttonBehavior
{
	// Token: 0x0600121E RID: 4638 RVA: 0x00080B04 File Offset: 0x0007ED04
	public void set_id(string n)
	{
		if (!this.sprite)
		{
			this.sprite = base.GetComponent<UISprite>();
		}
		if (!string.IsNullOrEmpty(n))
		{
			this.data = globals.database_data.item_by_id(n, true);
			if (this.data)
			{
				this.sprite.spriteName = globals.db_icon_prefix + this.data.icon;
				base.gameObject.SetActive(true);
			}
			else
			{
				base.gameObject.SetActive(false);
			}
		}
		else
		{
			this.data = null;
			base.gameObject.SetActive(false);
		}
	}

	// Token: 0x04001286 RID: 4742
	public DBItemClass data;
}
