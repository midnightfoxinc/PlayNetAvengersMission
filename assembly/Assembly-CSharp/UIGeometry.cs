using System;
using UnityEngine;

// Token: 0x020000F2 RID: 242
public class UIGeometry
{
	// Token: 0x170000A2 RID: 162
	// (get) Token: 0x06000714 RID: 1812 RVA: 0x00035A98 File Offset: 0x00033C98
	public bool hasVertices
	{
		get
		{
			return this.verts.size > 0;
		}
	}

	// Token: 0x170000A3 RID: 163
	// (get) Token: 0x06000715 RID: 1813 RVA: 0x00035AA8 File Offset: 0x00033CA8
	public bool hasTransformed
	{
		get
		{
			return this.mRtpVerts != null && this.mRtpVerts.size > 0 && this.mRtpVerts.size == this.verts.size;
		}
	}

	// Token: 0x06000716 RID: 1814 RVA: 0x00035AE4 File Offset: 0x00033CE4
	public void Clear()
	{
		this.verts.Clear();
		this.uvs.Clear();
		this.cols.Clear();
		this.mRtpVerts.Clear();
	}

	// Token: 0x06000717 RID: 1815 RVA: 0x00035B20 File Offset: 0x00033D20
	public void ApplyTransform(Matrix4x4 widgetToPanel, bool generateNormals = true)
	{
		if (this.verts.size > 0)
		{
			this.mRtpVerts.Clear();
			int i = 0;
			int size = this.verts.size;
			while (i < size)
			{
				this.mRtpVerts.Add(widgetToPanel.MultiplyPoint3x4(this.verts[i]));
				i++;
			}
			if (generateNormals)
			{
				this.mRtpNormal = widgetToPanel.MultiplyVector(Vector3.back).normalized;
				Vector3 normalized = widgetToPanel.MultiplyVector(Vector3.right).normalized;
				this.mRtpTan = new Vector4(normalized.x, normalized.y, normalized.z, -1f);
			}
		}
		else
		{
			this.mRtpVerts.Clear();
		}
	}

	// Token: 0x06000718 RID: 1816 RVA: 0x00035BF0 File Offset: 0x00033DF0
	public void WriteToBuffers(BetterList<Vector3> v, BetterList<Vector2> u, BetterList<Color32> c, BetterList<Vector3> n, BetterList<Vector4> t)
	{
		if (this.mRtpVerts != null && this.mRtpVerts.size > 0)
		{
			if (n == null)
			{
				for (int i = 0; i < this.mRtpVerts.size; i++)
				{
					v.Add(this.mRtpVerts.buffer[i]);
					u.Add(this.uvs.buffer[i]);
					c.Add(this.cols.buffer[i]);
				}
			}
			else
			{
				for (int j = 0; j < this.mRtpVerts.size; j++)
				{
					v.Add(this.mRtpVerts.buffer[j]);
					u.Add(this.uvs.buffer[j]);
					c.Add(this.cols.buffer[j]);
					n.Add(this.mRtpNormal);
					t.Add(this.mRtpTan);
				}
			}
		}
	}

	// Token: 0x040006D2 RID: 1746
	public BetterList<Vector3> verts = new BetterList<Vector3>();

	// Token: 0x040006D3 RID: 1747
	public BetterList<Vector2> uvs = new BetterList<Vector2>();

	// Token: 0x040006D4 RID: 1748
	public BetterList<Color32> cols = new BetterList<Color32>();

	// Token: 0x040006D5 RID: 1749
	private BetterList<Vector3> mRtpVerts = new BetterList<Vector3>();

	// Token: 0x040006D6 RID: 1750
	private Vector3 mRtpNormal;

	// Token: 0x040006D7 RID: 1751
	private Vector4 mRtpTan;
}
