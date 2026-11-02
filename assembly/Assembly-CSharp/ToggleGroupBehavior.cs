using System;
using UnityEngine;

// Token: 0x020001C0 RID: 448
public class ToggleGroupBehavior : MonoBehaviour
{
	// Token: 0x06000D13 RID: 3347 RVA: 0x0005E7D8 File Offset: 0x0005C9D8
	public int current_value()
	{
		for (int i = 0; i < this.toggle.Length; i++)
		{
			if (this.toggle[i].value)
			{
				return i;
			}
		}
		return -1;
	}

	// Token: 0x06000D14 RID: 3348 RVA: 0x0005E814 File Offset: 0x0005CA14
	public void set_value(int n)
	{
		for (int i = 0; i < this.toggle.Length; i++)
		{
			this.toggle[i].Set(i == n, true);
		}
	}

	// Token: 0x06000D15 RID: 3349 RVA: 0x0005E84C File Offset: 0x0005CA4C
	private void Update()
	{
		int num = this.current_value();
		if (this._previous_value != num)
		{
			if (this._previous_value > -1 && !string.IsNullOrEmpty(this.change_sfx))
			{
				globals.sfx_master.play(this.change_sfx, null);
			}
			this._previous_value = num;
		}
	}

	// Token: 0x04000D23 RID: 3363
	public UIToggle[] toggle;

	// Token: 0x04000D24 RID: 3364
	public string change_sfx;

	// Token: 0x04000D25 RID: 3365
	private int _previous_value = -1;
}
