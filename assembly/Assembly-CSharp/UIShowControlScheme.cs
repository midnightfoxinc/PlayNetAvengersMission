using System;
using UnityEngine;

// Token: 0x020000C4 RID: 196
public class UIShowControlScheme : MonoBehaviour
{
	// Token: 0x0600050D RID: 1293 RVA: 0x000224A8 File Offset: 0x000206A8
	private void OnEnable()
	{
		UICamera.onSchemeChange = (UICamera.OnSchemeChange)Delegate.Combine(UICamera.onSchemeChange, new UICamera.OnSchemeChange(this.OnScheme));
		this.OnScheme();
	}

	// Token: 0x0600050E RID: 1294 RVA: 0x000224DC File Offset: 0x000206DC
	private void OnDisable()
	{
		UICamera.onSchemeChange = (UICamera.OnSchemeChange)Delegate.Remove(UICamera.onSchemeChange, new UICamera.OnSchemeChange(this.OnScheme));
	}

	// Token: 0x0600050F RID: 1295 RVA: 0x0002250C File Offset: 0x0002070C
	private void OnScheme()
	{
		if (this.target != null)
		{
			UICamera.ControlScheme currentScheme = UICamera.currentScheme;
			if (currentScheme == UICamera.ControlScheme.Mouse)
			{
				this.target.SetActive(this.mouse);
			}
			else if (currentScheme == UICamera.ControlScheme.Touch)
			{
				this.target.SetActive(this.touch);
			}
			else if (currentScheme == UICamera.ControlScheme.Controller)
			{
				this.target.SetActive(this.controller);
			}
		}
	}

	// Token: 0x04000566 RID: 1382
	public GameObject target;

	// Token: 0x04000567 RID: 1383
	public bool mouse;

	// Token: 0x04000568 RID: 1384
	public bool touch;

	// Token: 0x04000569 RID: 1385
	public bool controller = true;
}
