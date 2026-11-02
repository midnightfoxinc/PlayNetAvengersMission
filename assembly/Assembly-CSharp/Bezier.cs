using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200001D RID: 29
[Serializable]
public class Bezier
{
	// Token: 0x060000AF RID: 175 RVA: 0x00007234 File Offset: 0x00005434
	public Bezier(Vector3[] waypoints, bool CloseLine = false)
	{
		this.closeLine = CloseLine;
		this.points = new Vector3[waypoints.Length];
		for (int i = 0; i < waypoints.Length; i++)
		{
			this.points[i] = waypoints[i];
		}
	}

	// Token: 0x060000B0 RID: 176 RVA: 0x00007290 File Offset: 0x00005490
	public Bezier(Transform[] waypoints, bool CloseLine = false)
	{
		this.closeLine = CloseLine;
		this.points = new Vector3[waypoints.Length];
		for (int i = 0; i < waypoints.Length; i++)
		{
			this.points[i] = waypoints[i].position;
		}
	}

	// Token: 0x060000B1 RID: 177 RVA: 0x000072E8 File Offset: 0x000054E8
	public Bezier()
	{
	}

	// Token: 0x060000B2 RID: 178 RVA: 0x000072F0 File Offset: 0x000054F0
	public Vector3 GetPointAtTime(float t)
	{
		return this.CreateBenzierForPoint(t);
	}

	// Token: 0x060000B3 RID: 179 RVA: 0x000072FC File Offset: 0x000054FC
	public Vector3[] GetSmoothingPoints(int count)
	{
		List<Vector3> list = new List<Vector3>();
		for (int i = 0; i < count; i++)
		{
			float t = (float)i / (float)count;
			list.Add(this.CreateBenzierForPoint(t));
		}
		return list.ToArray();
	}

	// Token: 0x060000B4 RID: 180 RVA: 0x0000733C File Offset: 0x0000553C
	public Vector3[] GetSmoothingPoints(float minDistance)
	{
		float num = 0f;
		for (int i = 0; i < this.points.Length; i++)
		{
			if (i != this.points.Length - 1)
			{
				num += Vector3.Distance(this.points[i], this.points[i + 1]);
			}
		}
		int num2 = (int)(num / minDistance);
		List<Vector3> list = new List<Vector3>();
		for (int j = 0; j < num2; j++)
		{
			float t = (float)j / ((float)num2 - 1f);
			list.Add(this.CreateBenzierForPoint(t));
		}
		return list.ToArray();
	}

	// Token: 0x060000B5 RID: 181 RVA: 0x000073E8 File Offset: 0x000055E8
	private Vector3 CreateBenzierForPoint(float t)
	{
		int num = (int)(t * (float)this.points.Length);
		if (num == this.points.Length && this.closeLine)
		{
			num = 0;
		}
		float t2 = t * (float)this.points.Length - (float)num;
		Vector3 vector = this.points[this.FindCurrentIndex(num, this.points.Length)];
		Vector3 vector2 = this.points[this.FindCurrentIndex(num + 1, this.points.Length)];
		Vector3 vector3 = this.points[this.FindCurrentIndex(num + 2, this.points.Length)];
		Vector3 vector4 = this.points[this.FindCurrentIndex(num + 3, this.points.Length)];
		Vector3 vector5 = (vector3 - vector) * 0.166f;
		Vector3 vector6 = (vector4 - vector2) * 0.166f;
		if (this.closeLine)
		{
			return this.CalculateBezierForPoints(t2, new Vector3[]
			{
				vector2,
				vector2 + vector5,
				vector3 - vector6,
				vector3
			});
		}
		if (num == this.points.Length - 1)
		{
			return this.CalculateBezierForPoints(t2, new Vector3[]
			{
				vector
			});
		}
		return this.CalculateBezierForPoints(t2, new Vector3[]
		{
			vector,
			vector + vector5,
			vector2 - vector6,
			vector2
		});
	}

	// Token: 0x060000B6 RID: 182 RVA: 0x000075B4 File Offset: 0x000057B4
	private int FindCurrentIndex(int index, int count)
	{
		if (index < count)
		{
			return index;
		}
		if (!this.closeLine)
		{
			return count - 1;
		}
		return index % count;
	}

	// Token: 0x060000B7 RID: 183 RVA: 0x000075D4 File Offset: 0x000057D4
	private Vector3 CalculateBezierForPoints(float t, Vector3[] locPoints)
	{
		Vector3 vector;
		vector..ctor(0f, 0f, 0f);
		int num = locPoints.Length - 1;
		for (int i = 0; i <= num; i++)
		{
			vector += this.BinomialCoefficient(num, i) * Mathf.Pow(1f - t, (float)(num - i)) * Mathf.Pow(t, (float)i) * locPoints[i];
		}
		return vector;
	}

	// Token: 0x060000B8 RID: 184 RVA: 0x0000764C File Offset: 0x0000584C
	private float BinomialCoefficient(int n, int k)
	{
		if (k < 0 || k > n)
		{
			return 0f;
		}
		k = ((k <= n / 2) ? k : (n - k));
		return (float)this.FallingPower(n, k) / (float)this.Factorial(k);
	}

	// Token: 0x060000B9 RID: 185 RVA: 0x00007694 File Offset: 0x00005894
	private int Factorial(int n)
	{
		if (n == 0)
		{
			return 1;
		}
		int num = n;
		while (n-- > 2)
		{
			num *= n;
		}
		return num;
	}

	// Token: 0x060000BA RID: 186 RVA: 0x000076C4 File Offset: 0x000058C4
	private int FallingPower(int n, int p)
	{
		int num = 1;
		for (int i = 0; i < p; i++)
		{
			num *= n--;
		}
		return num;
	}

	// Token: 0x0400010B RID: 267
	private bool closeLine;

	// Token: 0x0400010C RID: 268
	private Vector3[] points;
}
