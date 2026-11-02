using System;
using System.Collections;
using UnityEngine;

// Token: 0x02000150 RID: 336
public class QueueUvAnimation : MonoBehaviour
{
	// Token: 0x06000AF2 RID: 2802 RVA: 0x0004FD5C File Offset: 0x0004DF5C
	private void Start()
	{
		this.deltaTime = 1f / this.Fps;
		this.InitDefaultTex(this.RowsFadeIn, this.ColumnsFadeIn);
	}

	// Token: 0x06000AF3 RID: 2803 RVA: 0x0004FD90 File Offset: 0x0004DF90
	private void InitDefaultTex(int rows, int colums)
	{
		this.count = rows * colums;
		this.index += colums - 1;
		Vector2 vector;
		vector..ctor(1f / (float)colums, 1f / (float)rows);
		base.GetComponent<Renderer>().material.SetTextureScale("_MainTex", vector);
		if (this.IsBump)
		{
			base.GetComponent<Renderer>().material.SetTextureScale("_BumpMap", vector);
		}
	}

	// Token: 0x06000AF4 RID: 2804 RVA: 0x0004FE04 File Offset: 0x0004E004
	private void OnBecameVisible()
	{
		this.isVisible = true;
		base.StartCoroutine(this.UpdateTiling());
	}

	// Token: 0x06000AF5 RID: 2805 RVA: 0x0004FE1C File Offset: 0x0004E01C
	private void OnBecameInvisible()
	{
		this.isVisible = false;
	}

	// Token: 0x06000AF6 RID: 2806 RVA: 0x0004FE28 File Offset: 0x0004E028
	private IEnumerator UpdateTiling()
	{
		while (this.isVisible && this.allCount != this.count)
		{
			this.allCount++;
			this.index++;
			if (this.index >= this.count)
			{
				this.index = 0;
			}
			Vector2 offset = this.isFadeHandle ? new Vector2((float)this.index / (float)this.ColumnsLoop - (float)(this.index / this.ColumnsLoop), 1f - (float)(this.index / this.ColumnsLoop) / (float)this.RowsLoop) : new Vector2((float)this.index / (float)this.ColumnsFadeIn - (float)(this.index / this.ColumnsFadeIn), 1f - (float)(this.index / this.ColumnsFadeIn) / (float)this.RowsFadeIn);
			if (!this.isFadeHandle)
			{
				base.GetComponent<Renderer>().material.SetTextureOffset("_MainTex", offset);
				if (this.IsBump)
				{
					base.GetComponent<Renderer>().material.SetTextureOffset("_BumpMap", offset);
				}
			}
			else
			{
				base.GetComponent<Renderer>().material.SetTextureOffset("_MainTex", offset);
				if (this.IsBump)
				{
					base.GetComponent<Renderer>().material.SetTextureOffset("_BumpMap", offset);
				}
			}
			if (this.allCount == this.count)
			{
				this.isFadeHandle = true;
				base.GetComponent<Renderer>().material = this.NextMaterial;
				this.InitDefaultTex(this.RowsLoop, this.ColumnsLoop);
			}
			yield return new WaitForSeconds(this.deltaTime);
		}
		yield break;
	}

	// Token: 0x04000A5E RID: 2654
	public int RowsFadeIn = 4;

	// Token: 0x04000A5F RID: 2655
	public int ColumnsFadeIn = 4;

	// Token: 0x04000A60 RID: 2656
	public int RowsLoop = 4;

	// Token: 0x04000A61 RID: 2657
	public int ColumnsLoop = 4;

	// Token: 0x04000A62 RID: 2658
	public float Fps = 20f;

	// Token: 0x04000A63 RID: 2659
	public bool IsBump;

	// Token: 0x04000A64 RID: 2660
	public Material NextMaterial;

	// Token: 0x04000A65 RID: 2661
	private int index;

	// Token: 0x04000A66 RID: 2662
	private int count;

	// Token: 0x04000A67 RID: 2663
	private int allCount;

	// Token: 0x04000A68 RID: 2664
	private float deltaTime;

	// Token: 0x04000A69 RID: 2665
	private bool isVisible;

	// Token: 0x04000A6A RID: 2666
	private bool isFadeHandle;
}
