using System;

// Token: 0x0200019C RID: 412
public class FTUEDisclaimerMainBehavior : FTUEChoiceMainBehavior
{
	// Token: 0x06000C76 RID: 3190 RVA: 0x0005A9EC File Offset: 0x00058BEC
	protected override void Start()
	{
		string text = string.Empty;
		text = "Google Play";
		this.body_label.text = Localization.Get("IAP DISCLAIMER").Replace("store_platform", text);
		base.Start();
	}

	// Token: 0x04000C2A RID: 3114
	public UILabel body_label;
}
