using System;
using UnityEngine;

// Token: 0x020001B2 RID: 434
public class ConfirmPanelBehavior : MonoBehaviour
{
	// Token: 0x06000CE3 RID: 3299 RVA: 0x0005D6A0 File Offset: 0x0005B8A0
	public virtual void show(bool b)
	{
		base.gameObject.SetActive(b);
	}

	// Token: 0x04000CDF RID: 3295
	public UILabel label;

	// Token: 0x04000CE0 RID: 3296
	public buttonBehavior yes_button;

	// Token: 0x04000CE1 RID: 3297
	public buttonBehavior no_button;
}
