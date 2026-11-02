using System;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x02000026 RID: 38
	public struct LightningBoltSegment
	{
		// Token: 0x06000104 RID: 260 RVA: 0x00009020 File Offset: 0x00007220
		public override string ToString()
		{
			return this.Start.ToString() + ", " + this.End.ToString();
		}

		// Token: 0x04000152 RID: 338
		public Vector3 Start;

		// Token: 0x04000153 RID: 339
		public Vector3 End;
	}
}
