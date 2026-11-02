using System;
using System.Collections.Generic;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x02000025 RID: 37
	public class LightningBoltSegmentGroup
	{
		// Token: 0x04000147 RID: 327
		public object Tag;

		// Token: 0x04000148 RID: 328
		public Color Color;

		// Token: 0x04000149 RID: 329
		public float LineWidth;

		// Token: 0x0400014A RID: 330
		public int StartIndex;

		// Token: 0x0400014B RID: 331
		public int Generation;

		// Token: 0x0400014C RID: 332
		public float Delay;

		// Token: 0x0400014D RID: 333
		public float PeakStart;

		// Token: 0x0400014E RID: 334
		public float PeakEnd;

		// Token: 0x0400014F RID: 335
		public float LifeTime;

		// Token: 0x04000150 RID: 336
		public float EndWidthMultiplier;

		// Token: 0x04000151 RID: 337
		public readonly List<LightningBoltSegment> Segments = new List<LightningBoltSegment>();
	}
}
