using System;
using UnityEngine;

// Token: 0x0200028D RID: 653
public class MemoryBarBehavior : MonoBehaviour
{
	// Token: 0x06001171 RID: 4465 RVA: 0x0007C68C File Offset: 0x0007A88C
	private void Start()
	{
	}

	// Token: 0x06001172 RID: 4466 RVA: 0x0007C690 File Offset: 0x0007A890
	private void Update()
	{
		float num = (float)globals.BLE_manager.spaceAvailable(globals.BLE_manager.connectedDevice);
		this.fill.fillAmount = 1f - num / (float)this.max_memory;
		if (num < 1f)
		{
			this.label.text = "MEMORY CALCULATING...";
		}
		else
		{
			this.label.text = "MEMORY: " + ((int)(num / (float)this.max_memory * 100f)).ToString() + "% FREE";
		}
	}

	// Token: 0x040011DE RID: 4574
	public UISprite fill;

	// Token: 0x040011DF RID: 4575
	public UILabel label;

	// Token: 0x040011E0 RID: 4576
	public int max_memory = 22000000;
}
