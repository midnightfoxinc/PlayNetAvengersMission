using System;
using UnityEngine;

// Token: 0x02000004 RID: 4
[RequireComponent(typeof(LineRenderer))]
public class F3DCurvedBeam : MonoBehaviour
{
	// Token: 0x06000026 RID: 38 RVA: 0x00003530 File Offset: 0x00001730
	private void Start()
	{
		this.lineRenderer = base.GetComponent<LineRenderer>();
		this.initialBeamOffset = Random.Range(0f, 5f);
		this.lineRenderer.SetVertexCount(this.curvePoints);
	}

	// Token: 0x06000027 RID: 39 RVA: 0x00003570 File Offset: 0x00001770
	private void Update()
	{
		this.lineRenderer.material.SetTextureOffset("_MainTex", new Vector2(Time.time * this.UVTime + this.initialBeamOffset, 0f));
		float num = Vector3.Distance(base.transform.position, this.dest.position);
		this.lineRenderer.SetPosition(0, base.transform.position);
		float num2 = 3.1415927f / (float)(this.curvePoints - 1);
		for (int i = 1; i < this.curvePoints - 1; i++)
		{
			float num3 = num / (float)(this.curvePoints - 1) * (float)i;
			Vector3 vector = Vector3.Normalize(this.dest.position - base.transform.position) * num3;
			float num4 = Mathf.Sin(num2 * (float)i) * this.curveHeight;
			vector += base.transform.up * num4;
			this.lineRenderer.SetPosition(i, base.transform.position + vector);
		}
		this.lineRenderer.SetPosition(this.curvePoints - 1, this.dest.position);
		float num5 = num * (this.beamScale / 10f);
		this.lineRenderer.material.SetTextureScale("_MainTex", new Vector2(num5, 1f));
	}

	// Token: 0x04000041 RID: 65
	public Transform dest;

	// Token: 0x04000042 RID: 66
	public float beamScale;

	// Token: 0x04000043 RID: 67
	public float UVTime;

	// Token: 0x04000044 RID: 68
	private LineRenderer lineRenderer;

	// Token: 0x04000045 RID: 69
	public int curvePoints;

	// Token: 0x04000046 RID: 70
	public float curveHeight;

	// Token: 0x04000047 RID: 71
	private float initialBeamOffset;
}
