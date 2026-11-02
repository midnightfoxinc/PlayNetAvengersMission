using System;

// Token: 0x020001B6 RID: 438
public class FlashyButtonBehavior : buttonBehavior
{
	// Token: 0x06000CEE RID: 3310 RVA: 0x0005D9F8 File Offset: 0x0005BBF8
	public void play_flash()
	{
		if (this.flash)
		{
			this.flash.ResetToBeginning();
			this.flash.PlayForward();
		}
	}

	// Token: 0x04000CEE RID: 3310
	public UITweener flash;
}
