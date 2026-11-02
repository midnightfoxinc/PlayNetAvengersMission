using System;

// Token: 0x020001CE RID: 462
public class NativeManager
{
	// Token: 0x06000DA9 RID: 3497 RVA: 0x00061F24 File Offset: 0x00060124
	public static INative getNative()
	{
		if (NativeManager.native == null)
		{
			NativeManager.native = androidNative.getInstance();
		}
		return NativeManager.native;
	}

	// Token: 0x04000D62 RID: 3426
	private static INative native;
}
