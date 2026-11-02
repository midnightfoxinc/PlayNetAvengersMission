using System;

// Token: 0x0200027A RID: 634
public static class int_extensions
{
	// Token: 0x0600110E RID: 4366 RVA: 0x00079E6C File Offset: 0x0007806C
	public static int min(this int n, int m)
	{
		return (n <= m) ? m : n;
	}

	// Token: 0x0600110F RID: 4367 RVA: 0x00079E7C File Offset: 0x0007807C
	public static int max(this int n, int m)
	{
		return (n >= m) ? m : n;
	}
}
