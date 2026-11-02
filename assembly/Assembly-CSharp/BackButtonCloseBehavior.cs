using System;

// Token: 0x020001DC RID: 476
public abstract class BackButtonCloseBehavior : CallbackMonoBehavior
{
	// Token: 0x06000DF0 RID: 3568 RVA: 0x00062F68 File Offset: 0x00061168
	public virtual void close(bool silent = false)
	{
		if (!silent)
		{
			globals.sfx_master.play(this.dismiss_sfx, null);
		}
		base.gameObject.SetActive(false);
	}

	// Token: 0x06000DF1 RID: 3569 RVA: 0x00062F90 File Offset: 0x00061190
	protected virtual void Update()
	{
		if (!globals.top_panel.Contains(this))
		{
			globals.top_panel.Add(this);
		}
	}

	// Token: 0x04000D9E RID: 3486
	public string dismiss_sfx;
}
