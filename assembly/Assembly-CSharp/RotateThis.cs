using System;
using UnityEngine;

// Token: 0x0200001F RID: 31
public class RotateThis : MonoBehaviour
{
	// Token: 0x060000D3 RID: 211 RVA: 0x00008260 File Offset: 0x00006460
	private void Start()
	{
	}

	// Token: 0x060000D4 RID: 212 RVA: 0x00008264 File Offset: 0x00006464
	private void Update()
	{
		base.transform.Rotate(this.speedRotate * Time.deltaTime);
	}

	// Token: 0x04000123 RID: 291
	public Vector3 speedRotate;
}
