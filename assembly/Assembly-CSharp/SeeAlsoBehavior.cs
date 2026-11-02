using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002F7 RID: 759
public class SeeAlsoBehavior : MonoBehaviour
{
	// Token: 0x060013F4 RID: 5108 RVA: 0x0008FDD0 File Offset: 0x0008DFD0
	public void set_buttons(string[] s)
	{
		if (s.Length == 0 || (s.Length == 1 && s[0] == string.Empty))
		{
			base.gameObject.SetActive(false);
			return;
		}
		base.gameObject.SetActive(true);
		while (this.button.Count < s.Length)
		{
			DBItemButtonBehavior dbitemButtonBehavior = this.button[0].CopyInPlace() as DBItemButtonBehavior;
			dbitemButtonBehavior.name = "see also button " + this.button.Count.ToString();
			this.button.Add(dbitemButtonBehavior);
		}
		for (int i = 0; i < this.button.Count; i++)
		{
			if (i < s.Length)
			{
				this.button[i].set_id(s[i]);
			}
			else
			{
				this.button[i].gameObject.SetActive(false);
			}
		}
		this.grid.Reposition();
	}

	// Token: 0x060013F5 RID: 5109 RVA: 0x0008FED8 File Offset: 0x0008E0D8
	public void check_buttons()
	{
		for (int i = 0; i < this.button.Count; i++)
		{
			if (this.button[i].released && this.button[i].data)
			{
				globals.poster_album.show(this.button[i].data);
			}
		}
	}

	// Token: 0x040015CA RID: 5578
	public UIGrid grid;

	// Token: 0x040015CB RID: 5579
	public List<DBItemButtonBehavior> button;
}
