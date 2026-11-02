using System;
using UnityEngine;

// Token: 0x0200020F RID: 527
public class StaticScreenBehavior : MonoBehaviour
{
	// Token: 0x06000EE1 RID: 3809 RVA: 0x0006A5CC File Offset: 0x000687CC
	private void Start()
	{
		this.MyMaterial = base.transform.GetComponent<MeshRenderer>().material;
	}

	// Token: 0x06000EE2 RID: 3810 RVA: 0x0006A5E4 File Offset: 0x000687E4
	private void Update()
	{
		this.MyMaterial.SetTextureOffset("_MainTex", new Vector2(Random.Range(-20f, 20f), Random.Range(-20f, 20f)));
	}

	// Token: 0x04000F54 RID: 3924
	private Material MyMaterial;
}
