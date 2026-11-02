using System;

// Token: 0x02000304 RID: 772
[Serializable]
public class RowFilterClass
{
	// Token: 0x04001627 RID: 5671
	public bool hero = true;

	// Token: 0x04001628 RID: 5672
	public bool villain = true;

	// Token: 0x04001629 RID: 5673
	public bool gear = true;

	// Token: 0x0400162A RID: 5674
	public RowFilterClass.sort_enum sort;

	// Token: 0x02000305 RID: 773
	public enum sort_enum
	{
		// Token: 0x0400162C RID: 5676
		a,
		// Token: 0x0400162D RID: 5677
		z
	}
}
