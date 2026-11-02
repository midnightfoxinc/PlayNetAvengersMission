using System;
using System.Collections;
using UnityEngine;

// Token: 0x02000154 RID: 340
internal class UVTextureAnimator : MonoBehaviour
{
	// Token: 0x06000B06 RID: 2822 RVA: 0x00050148 File Offset: 0x0004E348
	private void Awake()
	{
		this.InitDefaultVariables();
		this.isInizialised = true;
	}

	// Token: 0x06000B07 RID: 2823 RVA: 0x00050158 File Offset: 0x0004E358
	public void SetInstanceMaterial(Material mat, Vector2 offsetMat)
	{
		this.instanceMaterial = mat;
		this.InitDefaultVariables();
	}

	// Token: 0x06000B08 RID: 2824 RVA: 0x00050168 File Offset: 0x0004E368
	private void InitDefaultVariables()
	{
		this.currentRenderer = base.GetComponent<Renderer>();
		this.allCount = 0;
		this.deltaFps = 1f / this.Fps;
		this.count = this.Rows * this.Columns;
		this.index = this.Columns - 1;
		Vector2 vector;
		vector..ctor((float)this.index / (float)this.Columns - (float)(this.index / this.Columns), 1f - (float)(this.index / this.Columns) / (float)this.Rows);
		this.OffsetMat = (this.IsRandomOffsetForInctance ? Random.Range(0, this.count) : (this.OffsetMat - this.OffsetMat / this.count * this.count));
		Vector2 vector2 = (!(this.SelfTiling == Vector2.zero)) ? this.SelfTiling : new Vector2(1f / (float)this.Columns, 1f / (float)this.Rows);
		if (this.AnimatedMaterialsNotInstance.Length > 0)
		{
			foreach (Material material in this.AnimatedMaterialsNotInstance)
			{
				material.SetTextureScale("_MainTex", vector2);
				material.SetTextureOffset("_MainTex", Vector2.zero);
				if (this.IsBump)
				{
					material.SetTextureScale("_BumpMap", vector2);
					material.SetTextureOffset("_BumpMap", Vector2.zero);
				}
				if (this.IsHeight)
				{
					material.SetTextureScale("_HeightMap", vector2);
					material.SetTextureOffset("_HeightMap", Vector2.zero);
				}
			}
		}
		else if (this.instanceMaterial != null)
		{
			this.instanceMaterial.SetTextureScale("_MainTex", vector2);
			this.instanceMaterial.SetTextureOffset("_MainTex", vector);
			if (this.IsBump)
			{
				this.instanceMaterial.SetTextureScale("_BumpMap", vector2);
				this.instanceMaterial.SetTextureOffset("_BumpMap", vector);
			}
			if (this.IsBump)
			{
				this.instanceMaterial.SetTextureScale("_HeightMap", vector2);
				this.instanceMaterial.SetTextureOffset("_HeightMap", vector);
			}
		}
		else if (this.currentRenderer != null)
		{
			this.currentRenderer.material.SetTextureScale("_MainTex", vector2);
			this.currentRenderer.material.SetTextureOffset("_MainTex", vector);
			if (this.IsBump)
			{
				this.currentRenderer.material.SetTextureScale("_BumpMap", vector2);
				this.currentRenderer.material.SetTextureOffset("_BumpMap", vector);
			}
			if (this.IsBump)
			{
				this.currentRenderer.material.SetTextureScale("_HeightMap", vector2);
				this.currentRenderer.material.SetTextureOffset("_HeightMap", vector);
			}
		}
	}

	// Token: 0x06000B09 RID: 2825 RVA: 0x00050458 File Offset: 0x0004E658
	private void OnEnable()
	{
		if (this.isInizialised)
		{
			this.InitDefaultVariables();
		}
		this.isVisible = true;
		if (!this.isCorutineStarted)
		{
			base.StartCoroutine(this.UpdateCorutine());
		}
	}

	// Token: 0x06000B0A RID: 2826 RVA: 0x00050498 File Offset: 0x0004E698
	private void OnDisable()
	{
		this.isCorutineStarted = false;
		this.isVisible = false;
		base.StopAllCoroutines();
	}

	// Token: 0x06000B0B RID: 2827 RVA: 0x000504B0 File Offset: 0x0004E6B0
	private void OnBecameVisible()
	{
		this.isVisible = true;
		if (!this.isCorutineStarted)
		{
			base.StartCoroutine(this.UpdateCorutine());
		}
	}

	// Token: 0x06000B0C RID: 2828 RVA: 0x000504D4 File Offset: 0x0004E6D4
	private void OnBecameInvisible()
	{
		this.isVisible = false;
	}

	// Token: 0x06000B0D RID: 2829 RVA: 0x000504E0 File Offset: 0x0004E6E0
	private IEnumerator UpdateCorutine()
	{
		this.isCorutineStarted = true;
		while (this.isVisible && (this.IsLoop || this.allCount != this.count))
		{
			this.UpdateCorutineFrame();
			if (!this.IsLoop && this.allCount == this.count)
			{
				break;
			}
			yield return new WaitForSeconds(this.deltaFps);
		}
		this.isCorutineStarted = false;
		yield break;
	}

	// Token: 0x06000B0E RID: 2830 RVA: 0x000504FC File Offset: 0x0004E6FC
	private void UpdateCorutineFrame()
	{
		if (this.currentRenderer == null && this.instanceMaterial == null && this.AnimatedMaterialsNotInstance.Length == 0)
		{
			return;
		}
		this.allCount++;
		if (this.IsReverse)
		{
			this.index--;
		}
		else
		{
			this.index++;
		}
		if (this.index >= this.count)
		{
			this.index = 0;
		}
		if (this.AnimatedMaterialsNotInstance.Length > 0)
		{
			for (int i = 0; i < this.AnimatedMaterialsNotInstance.Length; i++)
			{
				int num = i * this.OffsetMat + this.index;
				num -= num / this.count * this.count;
				Vector2 vector;
				vector..ctor((float)num / (float)this.Columns - (float)(num / this.Columns), 1f - (float)(num / this.Columns) / (float)this.Rows);
				this.AnimatedMaterialsNotInstance[i].SetTextureOffset("_MainTex", vector);
				if (this.IsBump)
				{
					this.AnimatedMaterialsNotInstance[i].SetTextureOffset("_BumpMap", vector);
				}
				if (this.IsHeight)
				{
					this.AnimatedMaterialsNotInstance[i].SetTextureOffset("_HeightMap", vector);
				}
			}
		}
		else
		{
			Vector2 vector2;
			if (this.IsRandomOffsetForInctance)
			{
				int num2 = this.index + this.OffsetMat;
				vector2..ctor((float)num2 / (float)this.Columns - (float)(num2 / this.Columns), 1f - (float)(num2 / this.Columns) / (float)this.Rows);
			}
			else
			{
				vector2..ctor((float)this.index / (float)this.Columns - (float)(this.index / this.Columns), 1f - (float)(this.index / this.Columns) / (float)this.Rows);
			}
			if (this.instanceMaterial != null)
			{
				this.instanceMaterial.SetTextureOffset("_MainTex", vector2);
				if (this.IsBump)
				{
					this.instanceMaterial.SetTextureOffset("_BumpMap", vector2);
				}
				if (this.IsHeight)
				{
					this.instanceMaterial.SetTextureOffset("_HeightMap", vector2);
				}
			}
			else if (this.currentRenderer != null)
			{
				this.currentRenderer.material.SetTextureOffset("_MainTex", vector2);
				if (this.IsBump)
				{
					this.currentRenderer.material.SetTextureOffset("_BumpMap", vector2);
				}
				if (this.IsHeight)
				{
					this.currentRenderer.material.SetTextureOffset("_HeightMap", vector2);
				}
			}
		}
	}

	// Token: 0x04000A7C RID: 2684
	public Material[] AnimatedMaterialsNotInstance;

	// Token: 0x04000A7D RID: 2685
	public int Rows = 4;

	// Token: 0x04000A7E RID: 2686
	public int Columns = 4;

	// Token: 0x04000A7F RID: 2687
	public float Fps = 20f;

	// Token: 0x04000A80 RID: 2688
	public int OffsetMat;

	// Token: 0x04000A81 RID: 2689
	public Vector2 SelfTiling = default(Vector2);

	// Token: 0x04000A82 RID: 2690
	public bool IsLoop = true;

	// Token: 0x04000A83 RID: 2691
	public bool IsReverse;

	// Token: 0x04000A84 RID: 2692
	public bool IsRandomOffsetForInctance;

	// Token: 0x04000A85 RID: 2693
	public bool IsBump;

	// Token: 0x04000A86 RID: 2694
	public bool IsHeight;

	// Token: 0x04000A87 RID: 2695
	private bool isInizialised;

	// Token: 0x04000A88 RID: 2696
	private int index;

	// Token: 0x04000A89 RID: 2697
	private int count;

	// Token: 0x04000A8A RID: 2698
	private int allCount;

	// Token: 0x04000A8B RID: 2699
	private float deltaFps;

	// Token: 0x04000A8C RID: 2700
	private bool isVisible;

	// Token: 0x04000A8D RID: 2701
	private bool isCorutineStarted;

	// Token: 0x04000A8E RID: 2702
	private Renderer currentRenderer;

	// Token: 0x04000A8F RID: 2703
	private Material instanceMaterial;
}
