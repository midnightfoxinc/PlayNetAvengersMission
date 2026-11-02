using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200001E RID: 30
[AddComponentMenu("Effects/Electricity Line")]
public class ElectricityLine3D : MonoBehaviour
{
	// Token: 0x17000001 RID: 1
	// (get) Token: 0x060000BC RID: 188 RVA: 0x000077BC File Offset: 0x000059BC
	private float minDistanceBeetwenSmoothingPoints
	{
		get
		{
			return this.minDistanceBeetwenPoints / (1f + this.smoothing) * this.scale;
		}
	}

	// Token: 0x17000002 RID: 2
	// (get) Token: 0x060000BD RID: 189 RVA: 0x000077D8 File Offset: 0x000059D8
	private float minDistanceBeetwenPoints
	{
		get
		{
			return 10f / (1f + this.frequence) * this.scale;
		}
	}

	// Token: 0x17000003 RID: 3
	// (get) Token: 0x060000BE RID: 190 RVA: 0x000077F4 File Offset: 0x000059F4
	private float Width
	{
		get
		{
			return this.width / (1f + this.frequence) * this.scale;
		}
	}

	// Token: 0x17000004 RID: 4
	// (get) Token: 0x060000BF RID: 191 RVA: 0x00007810 File Offset: 0x00005A10
	private float delayChangedPosition
	{
		get
		{
			return 1f / this.speedChangeState;
		}
	}

	// Token: 0x060000C0 RID: 192 RVA: 0x00007820 File Offset: 0x00005A20
	private void Awake()
	{
		if (!base.GetComponent<LineRenderer>())
		{
			base.gameObject.AddComponent<LineRenderer>();
		}
		this.lineRenderer = base.GetComponent<LineRenderer>();
		if (this.material != null)
		{
			this.lineRenderer.material = this.material;
		}
		else
		{
			this.lineRenderer.material = new Material(Shader.Find("Particles/~Additive-Multiply"));
		}
		if (this.pointsTransform.Length > 1)
		{
			this.SetPoints(this.pointsTransform);
		}
	}

	// Token: 0x060000C1 RID: 193 RVA: 0x000078B0 File Offset: 0x00005AB0
	private void Update()
	{
		if (this.TestNullReferenceTransform())
		{
			this.pointsTransform = this.ReCalculateArrayTransform();
		}
		if (this.pointsTransform.Length < 2 && this.previewCountPointsTransform != this.pointsTransform.Length)
		{
			this.points = new Vector3[0];
			this.lineRenderer.SetVertexCount(0);
		}
		this.previewCountPointsTransform = this.pointsTransform.Length;
		if (this.pointsTransform.Length > 1)
		{
			this.points = new Vector3[this.pointsTransform.Length];
			for (int i = 0; i < this.pointsTransform.Length; i++)
			{
				this.points[i] = this.pointsTransform[i].position;
			}
		}
		if (this.points.Length < 2)
		{
			return;
		}
		if ((this.points.Length != this.previewCountPoints && this.onLight) || (this.onLight && this.lights == null))
		{
			this.DestroyLights();
			this.lights = new Light[this.points.Length - 1];
			for (int j = 0; j < this.points.Length - 1; j++)
			{
				Vector3 position = Vector3.Lerp(this.points[j], this.points[j + 1], 0.5f);
				GameObject gameObject = new GameObject("light " + j.ToString());
				gameObject.transform.position = position;
				gameObject.transform.parent = base.gameObject.transform;
				this.lights[j] = gameObject.AddComponent<Light>();
			}
		}
		this.previewCountPoints = this.points.Length;
		if (!this.onLight && this.lights != null)
		{
			this.DestroyLights();
		}
		if (Time.time > this.lastTimeChangePosition + this.delayChangedPosition)
		{
			this.lastTimeChangePosition = Time.time;
			if (this.listSmoothingPointsPatch.Count > 0)
			{
				this.previewListSmoothingPointsPatch.Clear();
				this.previewListSmoothingPointsPatch.AddRange(this.listSmoothingPointsPatch);
			}
			this.listSmoothingPointsPatch.Clear();
			this.listBasePointsPatch.Clear();
			AnimationCurve animationCurve = new AnimationCurve(new Keyframe[]
			{
				new Keyframe(0f, this.peripheryAmplititude * this.scale),
				new Keyframe(1f, this.centralAmplitude * this.scale),
				new Keyframe(2f, this.peripheryAmplititude * this.scale)
			});
			for (int k = 0; k < this.points.Length - 1; k++)
			{
				List<Vector3> list = new List<Vector3>();
				Vector3 vector = this.points[k + 1] - this.points[k];
				float num = Vector3.Distance(this.points[k], this.points[k + 1]);
				int num2 = (int)(num / this.minDistanceBeetwenPoints) + 1;
				float num3 = num / (float)num2;
				for (int l = 0; l < num2 + 1; l++)
				{
					Vector3 vector2 = this.points[k] + vector.normalized * (num3 * (float)l);
					float num4 = (float)l / (float)num2 * 2f;
					vector2 += (Quaternion.AngleAxis((float)Random.Range(-180, 180), vector) * new Vector3(vector.y, vector.x * -1f, 0f)).normalized * Random.Range(-animationCurve.Evaluate(num4), animationCurve.Evaluate(num4));
					list.Add(vector2);
				}
				this.listBasePointsPatch.AddRange(list);
				if (this.onLight)
				{
					this.lights[k].transform.position = Vector3.Lerp(this.points[k], this.points[k + 1], 0.5f);
				}
				Bezier bezier = new Bezier(list.ToArray(), false);
				int count = (int)(num / this.minDistanceBeetwenSmoothingPoints);
				this.listSmoothingPointsPatch.AddRange(bezier.GetSmoothingPoints(count));
			}
		}
		if (this.onLight)
		{
			foreach (Light light in this.lights)
			{
				light.color = this.color;
				light.intensity = Random.Range(this.centralAmplitude, this.centralAmplitude * 0.8f) * this.lightIntesity * this.scale;
			}
		}
		List<Vector3> list2 = new List<Vector3>();
		if (this.previewListSmoothingPointsPatch.Count > 0)
		{
			float num5 = (Time.time - this.lastTimeChangePosition) / this.delayChangedPosition;
			for (int n = 0; n < Mathf.Min(this.previewListSmoothingPointsPatch.Count, this.listSmoothingPointsPatch.Count); n++)
			{
				list2.Add(Vector3.Lerp(this.previewListSmoothingPointsPatch[n], this.listSmoothingPointsPatch[n], num5));
			}
		}
		else
		{
			list2.AddRange(this.listSmoothingPointsPatch);
		}
		this.lineRenderer.SetVertexCount(list2.Count);
		for (int num6 = 0; num6 < list2.Count; num6++)
		{
			this.lineRenderer.SetPosition(num6, list2[num6]);
		}
		this.lineRenderer.SetWidth(this.Width, this.Width);
		this.lineRenderer.SetColors(this.color, this.color);
	}

	// Token: 0x060000C2 RID: 194 RVA: 0x00007EC4 File Offset: 0x000060C4
	private void OnDrawGizmos()
	{
		if (this.drawGizmos)
		{
			for (int i = 0; i < this.listSmoothingPointsPatch.Count - 1; i++)
			{
				Gizmos.color = Color.blue;
				if (i != this.listSmoothingPointsPatch.Count - 1)
				{
					Gizmos.DrawLine(this.listSmoothingPointsPatch[i], this.listSmoothingPointsPatch[i + 1]);
				}
			}
			for (int j = 0; j < this.listBasePointsPatch.Count; j++)
			{
				Gizmos.color = Color.red;
				Gizmos.DrawSphere(this.listBasePointsPatch[j], this.minDistanceBeetwenPoints / 7f * this.scale);
			}
		}
	}

	// Token: 0x060000C3 RID: 195 RVA: 0x00007F80 File Offset: 0x00006180
	private void DestroyLights()
	{
		if (this.lights == null)
		{
			return;
		}
		for (int i = 0; i < this.lights.Length; i++)
		{
			Object.Destroy(this.lights[i].gameObject);
		}
		this.lights = null;
	}

	// Token: 0x060000C4 RID: 196 RVA: 0x00007FCC File Offset: 0x000061CC
	private bool TestNullReferenceTransform()
	{
		foreach (Transform transform in this.pointsTransform)
		{
			if (transform == null)
			{
				return true;
			}
		}
		return false;
	}

	// Token: 0x060000C5 RID: 197 RVA: 0x00008008 File Offset: 0x00006208
	private Transform[] ReCalculateArrayTransform()
	{
		List<Transform> list = new List<Transform>();
		foreach (Transform transform in this.pointsTransform)
		{
			if (transform != null)
			{
				list.Add(transform);
			}
		}
		return list.ToArray();
	}

	// Token: 0x060000C6 RID: 198 RVA: 0x00008054 File Offset: 0x00006254
	public void SetPoints(params Vector3[] nPoints)
	{
		this.pointsTransform = new Transform[0];
		this.points = nPoints;
	}

	// Token: 0x060000C7 RID: 199 RVA: 0x0000806C File Offset: 0x0000626C
	public void SetPoints(params Transform[] nPoints)
	{
		this.pointsTransform = nPoints;
	}

	// Token: 0x060000C8 RID: 200 RVA: 0x00008078 File Offset: 0x00006278
	public void SetPoints(List<Vector3> nPoints)
	{
		this.pointsTransform = new Transform[0];
		this.points = nPoints.ToArray();
	}

	// Token: 0x060000C9 RID: 201 RVA: 0x00008094 File Offset: 0x00006294
	public void SetPoints(List<Transform> nPoints)
	{
		this.pointsTransform = nPoints.ToArray();
	}

	// Token: 0x060000CA RID: 202 RVA: 0x000080A4 File Offset: 0x000062A4
	public void AddPoints(params Vector3[] nPoints)
	{
		this.pointsTransform = new Transform[0];
		List<Vector3> list = new List<Vector3>();
		list.AddRange(this.points);
		list.AddRange(nPoints);
		this.points = list.ToArray();
	}

	// Token: 0x060000CB RID: 203 RVA: 0x000080E4 File Offset: 0x000062E4
	public void AddPoints(List<Vector3> nPoints)
	{
		this.pointsTransform = new Transform[0];
		List<Vector3> list = new List<Vector3>();
		list.AddRange(this.points);
		list.AddRange(nPoints);
		this.points = list.ToArray();
	}

	// Token: 0x060000CC RID: 204 RVA: 0x00008124 File Offset: 0x00006324
	public void AddPoints(params Transform[] nPoints)
	{
		List<Transform> list = new List<Transform>();
		list.AddRange(this.pointsTransform);
		list.AddRange(nPoints);
		this.pointsTransform = list.ToArray();
	}

	// Token: 0x060000CD RID: 205 RVA: 0x00008158 File Offset: 0x00006358
	public void AddPoints(List<Transform> nPoints)
	{
		List<Transform> list = new List<Transform>();
		list.AddRange(this.pointsTransform);
		list.AddRange(nPoints);
		this.pointsTransform = list.ToArray();
	}

	// Token: 0x060000CE RID: 206 RVA: 0x0000818C File Offset: 0x0000638C
	public Vector3[] GetPoints()
	{
		return this.points;
	}

	// Token: 0x060000CF RID: 207 RVA: 0x00008194 File Offset: 0x00006394
	public Vector3[] GetPointsPathLines()
	{
		Vector3[] array = new Vector3[this.listBasePointsPatch.Count];
		for (int i = 0; i < this.listBasePointsPatch.Count; i++)
		{
			array[i] = this.listBasePointsPatch[i];
		}
		return array;
	}

	// Token: 0x060000D0 RID: 208 RVA: 0x000081E8 File Offset: 0x000063E8
	public Vector3[] GetSmoothingPointsPathLines()
	{
		Vector3[] array = new Vector3[this.listSmoothingPointsPatch.Count];
		for (int i = 0; i < this.listSmoothingPointsPatch.Count; i++)
		{
			array[i] = this.listSmoothingPointsPatch[i];
		}
		return array;
	}

	// Token: 0x060000D1 RID: 209 RVA: 0x0000823C File Offset: 0x0000643C
	public void Clear()
	{
		this.points = new Vector3[0];
		this.pointsTransform = new Transform[0];
	}

	// Token: 0x0400010D RID: 269
	public Transform[] pointsTransform = new Transform[0];

	// Token: 0x0400010E RID: 270
	[Range(0.1f, 5f)]
	public float scale = 1f;

	// Token: 0x0400010F RID: 271
	[Range(1f, 60f)]
	public float frequence = 37f;

	// Token: 0x04000110 RID: 272
	[Range(0f, 5f)]
	public float centralAmplitude = 0.4f;

	// Token: 0x04000111 RID: 273
	[Range(0f, 5f)]
	public float peripheryAmplititude;

	// Token: 0x04000112 RID: 274
	[Range(0f, 100f)]
	public float speedChangeState = 48f;

	// Token: 0x04000113 RID: 275
	[Range(0f, 20f)]
	public float smoothing = 20f;

	// Token: 0x04000114 RID: 276
	[Range(0f, 5f)]
	public float width = 1.5f;

	// Token: 0x04000115 RID: 277
	public Color color = new Color32(0, 181, byte.MaxValue, byte.MaxValue);

	// Token: 0x04000116 RID: 278
	public bool onLight = true;

	// Token: 0x04000117 RID: 279
	[Range(0.1f, 3f)]
	public float lightIntesity = 1.7f;

	// Token: 0x04000118 RID: 280
	public bool drawGizmos;

	// Token: 0x04000119 RID: 281
	public Material material;

	// Token: 0x0400011A RID: 282
	private Light[] lights;

	// Token: 0x0400011B RID: 283
	private LineRenderer lineRenderer;

	// Token: 0x0400011C RID: 284
	private Vector3[] points = new Vector3[2];

	// Token: 0x0400011D RID: 285
	private List<Vector3> listBasePointsPatch = new List<Vector3>();

	// Token: 0x0400011E RID: 286
	private List<Vector3> listSmoothingPointsPatch = new List<Vector3>();

	// Token: 0x0400011F RID: 287
	private List<Vector3> previewListSmoothingPointsPatch = new List<Vector3>();

	// Token: 0x04000120 RID: 288
	private float lastTimeChangePosition = -1f;

	// Token: 0x04000121 RID: 289
	private int previewCountPoints;

	// Token: 0x04000122 RID: 290
	private int previewCountPointsTransform;
}
