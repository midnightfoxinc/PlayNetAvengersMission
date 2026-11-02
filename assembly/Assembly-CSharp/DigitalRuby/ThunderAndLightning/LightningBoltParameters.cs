using System;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x02000024 RID: 36
	public class LightningBoltParameters
	{
		// Token: 0x04000139 RID: 313
		public Camera Camera;

		// Token: 0x0400013A RID: 314
		public Vector3 Start;

		// Token: 0x0400013B RID: 315
		public Vector3 End;

		// Token: 0x0400013C RID: 316
		public int Generations;

		// Token: 0x0400013D RID: 317
		public float LifeTime;

		// Token: 0x0400013E RID: 318
		public float Delay;

		// Token: 0x0400013F RID: 319
		public float ChaosFactor;

		// Token: 0x04000140 RID: 320
		public float TrunkWidth;

		// Token: 0x04000141 RID: 321
		public float EndWidthMultiplier = 0.5f;

		// Token: 0x04000142 RID: 322
		public float GlowIntensity;

		// Token: 0x04000143 RID: 323
		public float GlowWidthMultiplier;

		// Token: 0x04000144 RID: 324
		public float Forkedness;

		// Token: 0x04000145 RID: 325
		public Random Random;

		// Token: 0x04000146 RID: 326
		public float PointLightIntensity;
	}
}
