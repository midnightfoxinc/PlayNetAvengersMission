using System;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x02000020 RID: 32
	public abstract class LightningBoltRenderer
	{
		// Token: 0x060000D6 RID: 214 RVA: 0x0000828C File Offset: 0x0000648C
		public virtual void Begin(LightningBolt lightningBolt)
		{
		}

		// Token: 0x060000D7 RID: 215 RVA: 0x00008290 File Offset: 0x00006490
		public virtual void Render(LightningBolt lightningBolt, LightningBoltSegmentGroup group)
		{
		}

		// Token: 0x060000D8 RID: 216 RVA: 0x00008294 File Offset: 0x00006494
		public virtual void AddGroup(LightningBolt lightningBolt, LightningBoltSegmentGroup group)
		{
		}

		// Token: 0x060000D9 RID: 217 RVA: 0x00008298 File Offset: 0x00006498
		public virtual void RemoveGroup(LightningBoltSegmentGroup group)
		{
		}

		// Token: 0x060000DA RID: 218 RVA: 0x0000829C File Offset: 0x0000649C
		public virtual void Optimize()
		{
		}

		// Token: 0x060000DB RID: 219 RVA: 0x000082A0 File Offset: 0x000064A0
		public virtual void Cleanup(LightningBolt lightningBolt)
		{
		}

		// Token: 0x17000005 RID: 5
		// (get) Token: 0x060000DC RID: 220 RVA: 0x000082A4 File Offset: 0x000064A4
		// (set) Token: 0x060000DD RID: 221 RVA: 0x000082AC File Offset: 0x000064AC
		public LightningBoltScript Script { get; set; }

		// Token: 0x17000006 RID: 6
		// (get) Token: 0x060000DE RID: 222 RVA: 0x000082B8 File Offset: 0x000064B8
		public virtual int ShaderIndex
		{
			get
			{
				return 0;
			}
		}

		// Token: 0x17000007 RID: 7
		// (get) Token: 0x060000DF RID: 223 RVA: 0x000082BC File Offset: 0x000064BC
		// (set) Token: 0x060000E0 RID: 224 RVA: 0x000082C4 File Offset: 0x000064C4
		public Material Material { get; set; }

		// Token: 0x17000008 RID: 8
		// (get) Token: 0x060000E1 RID: 225 RVA: 0x000082D0 File Offset: 0x000064D0
		public virtual bool CanGlow
		{
			get
			{
				return false;
			}
		}

		// Token: 0x17000009 RID: 9
		// (get) Token: 0x060000E2 RID: 226 RVA: 0x000082D4 File Offset: 0x000064D4
		// (set) Token: 0x060000E3 RID: 227 RVA: 0x000082DC File Offset: 0x000064DC
		public float GlowWidthMultiplier { get; set; }

		// Token: 0x1700000A RID: 10
		// (get) Token: 0x060000E4 RID: 228 RVA: 0x000082E8 File Offset: 0x000064E8
		// (set) Token: 0x060000E5 RID: 229 RVA: 0x000082F0 File Offset: 0x000064F0
		public float GlowIntensityMultiplier { get; set; }
	}
}
