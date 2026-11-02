using System;
using System.Collections;
using UnityEngine;

// Token: 0x02000151 RID: 337
public class RandomRotate : MonoBehaviour
{
	// Token: 0x06000AF8 RID: 2808 RVA: 0x0004FE7C File Offset: 0x0004E07C
	private void Start()
	{
		this.deltaTime = 1f / (float)this.fps;
		this.rangeX = (float)Random.Range(0, 10);
		this.rangeY = (float)Random.Range(0, 10);
		this.rangeZ = (float)Random.Range(0, 10);
	}

	// Token: 0x06000AF9 RID: 2809 RVA: 0x0004FECC File Offset: 0x0004E0CC
	private void OnBecameVisible()
	{
		this.isVisible = true;
		base.StartCoroutine(this.UpdateRotation());
	}

	// Token: 0x06000AFA RID: 2810 RVA: 0x0004FEE4 File Offset: 0x0004E0E4
	private void OnBecameInvisible()
	{
		this.isVisible = false;
	}

	// Token: 0x06000AFB RID: 2811 RVA: 0x0004FEF0 File Offset: 0x0004E0F0
	private IEnumerator UpdateRotation()
	{
		while (this.isVisible)
		{
			if (this.isRotate)
			{
				base.transform.Rotate(this.deltaTime * Mathf.Sin(Time.time + this.rangeX) * (float)this.x, this.deltaTime * Mathf.Sin(Time.time + this.rangeY) * (float)this.y, this.deltaTime * Mathf.Sin(Time.time + this.rangeZ) * (float)this.z);
			}
			yield return new WaitForSeconds(this.deltaTime);
		}
		yield break;
	}

	// Token: 0x04000A6B RID: 2667
	public bool isRotate = true;

	// Token: 0x04000A6C RID: 2668
	public int fps = 30;

	// Token: 0x04000A6D RID: 2669
	public int x = 100;

	// Token: 0x04000A6E RID: 2670
	public int y = 200;

	// Token: 0x04000A6F RID: 2671
	public int z = 300;

	// Token: 0x04000A70 RID: 2672
	private float rangeX;

	// Token: 0x04000A71 RID: 2673
	private float rangeY;

	// Token: 0x04000A72 RID: 2674
	private float rangeZ;

	// Token: 0x04000A73 RID: 2675
	private float deltaTime;

	// Token: 0x04000A74 RID: 2676
	private bool isVisible;
}
