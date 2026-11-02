using System;
using System.Collections.Generic;

// Token: 0x020002A0 RID: 672
public struct sReportItems
{
	// Token: 0x0600122D RID: 4653 RVA: 0x000813C0 File Offset: 0x0007F5C0
	public sReportItems(bool setDefaults)
	{
		this.user_cancelled = false;
		this.sf = new List<SFRepClass>();
		this.abilities = new List<string>();
		this.missions = new List<missionSummaryClass>();
		this.achievements = new List<string>();
	}

	// Token: 0x040012AA RID: 4778
	public bool user_cancelled;

	// Token: 0x040012AB RID: 4779
	public List<SFRepClass> sf;

	// Token: 0x040012AC RID: 4780
	public List<string> abilities;

	// Token: 0x040012AD RID: 4781
	public List<missionSummaryClass> missions;

	// Token: 0x040012AE RID: 4782
	public List<string> achievements;
}
