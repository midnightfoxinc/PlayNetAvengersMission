using System;

// Token: 0x020002FA RID: 762
[Serializable]
public class texture_roster_entry
{
	// Token: 0x060013FE RID: 5118 RVA: 0x00090150 File Offset: 0x0008E350
	public static implicit operator bool(texture_roster_entry d)
	{
		return d != null;
	}

	// Token: 0x040015E1 RID: 5601
	public string name;

	// Token: 0x040015E2 RID: 5602
	public string id;

	// Token: 0x040015E3 RID: 5603
	public string img;
}
