using System;
using System.Collections;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x02000021 RID: 33
	public class LightningBoltLineRenderer : LightningBoltRenderer
	{
		// Token: 0x060000E7 RID: 231 RVA: 0x00008304 File Offset: 0x00006504
		private IEnumerator EnableLineRenderer(LineRenderer r, LightningBolt lightningBolt, float delay)
		{
			yield return new WaitForSeconds(delay);
			if (r != null && lightningBolt.ElapsedTime < lightningBolt.LifeTime)
			{
				r.gameObject.SetActive(true);
				r.enabled = true;
			}
			yield break;
		}

		// Token: 0x060000E8 RID: 232 RVA: 0x00008344 File Offset: 0x00006544
		private void CreateLineRenderer(LightningBolt lightningBolt, LightningBoltSegmentGroup group)
		{
			if (group.Tag == null)
			{
				LineRenderer lineRenderer = new GameObject
				{
					name = "LightningBoltLineRenderer",
					transform = 
					{
						parent = lightningBolt.Parent.transform,
						position = lightningBolt.Parent.transform.position
					}
				}.AddComponent<LineRenderer>();
				Color color;
				color..ctor(0f, 0f, 0f, 0f);
				lineRenderer.shadowCastingMode = 0;
				lineRenderer.receiveShadows = false;
				lineRenderer.SetColors(color, color);
				lineRenderer.sharedMaterial = base.Material;
				lineRenderer.useWorldSpace = true;
				lineRenderer.useLightProbes = false;
				lineRenderer.enabled = false;
				group.Tag = lineRenderer;
			}
			LineRenderer lineRenderer2 = group.Tag as LineRenderer;
			int num = 0;
			lineRenderer2.SetWidth(group.LineWidth, group.LineWidth * group.EndWidthMultiplier);
			lineRenderer2.SetVertexCount(group.Segments.Count - group.StartIndex);
			lineRenderer2.SetPosition(num++, group.Segments[group.StartIndex].Start);
			for (int i = group.StartIndex + 1; i < group.Segments.Count; i++)
			{
				lineRenderer2.SetPosition(num++, group.Segments[i].End);
			}
			base.Script.StartCoroutine(this.EnableLineRenderer(lineRenderer2, lightningBolt, lightningBolt.Delay + lightningBolt.CurrentDelayAmount));
		}

		// Token: 0x060000E9 RID: 233 RVA: 0x000084D0 File Offset: 0x000066D0
		private void UpdateColors(LightningBoltSegmentGroup group, float elapsed)
		{
			float num;
			float num2;
			float num3;
			if (elapsed >= group.PeakStart)
			{
				if (elapsed <= group.PeakEnd)
				{
					num = 1f;
					num2 = 1f;
					num3 = 1f;
				}
				else
				{
					num = (elapsed - group.PeakEnd) / (group.LifeTime - group.PeakEnd);
					num2 = 1f;
					num3 = 0f;
				}
			}
			else
			{
				num = elapsed / group.PeakStart;
				num2 = 0f;
				num3 = 1f;
			}
			Color color = group.Color;
			color.a = Mathf.Lerp(color.a * num2, color.a * num3, num);
			(group.Tag as LineRenderer).SetColors(color, color);
		}

		// Token: 0x060000EA RID: 234 RVA: 0x00008584 File Offset: 0x00006784
		public override void Render(LightningBolt lightningBolt, LightningBoltSegmentGroup group)
		{
			if (lightningBolt.ElapsedTime < group.Delay || group.Tag == null || !(group.Tag as LineRenderer).enabled)
			{
				return;
			}
			this.UpdateColors(group, lightningBolt.ElapsedTime - group.Delay);
		}

		// Token: 0x060000EB RID: 235 RVA: 0x000085D8 File Offset: 0x000067D8
		public override void AddGroup(LightningBolt lightningBolt, LightningBoltSegmentGroup group)
		{
			this.CreateLineRenderer(lightningBolt, group);
		}

		// Token: 0x060000EC RID: 236 RVA: 0x000085E4 File Offset: 0x000067E4
		public override void RemoveGroup(LightningBoltSegmentGroup group)
		{
			if (group.Tag != null)
			{
				LineRenderer lineRenderer = group.Tag as LineRenderer;
				lineRenderer.enabled = false;
				lineRenderer.gameObject.SetActive(false);
			}
		}
	}
}
