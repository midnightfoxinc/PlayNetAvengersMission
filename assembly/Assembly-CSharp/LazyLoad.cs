using System;
using UnityEngine;

// Token: 0x0200013C RID: 316
public class LazyLoad : MonoBehaviour
{
	// Token: 0x06000A82 RID: 2690 RVA: 0x0004D42C File Offset: 0x0004B62C
	private void Awake()
	{
		this.GO.SetActive(false);
	}

	// Token: 0x06000A83 RID: 2691 RVA: 0x0004D43C File Offset: 0x0004B63C
	private void LazyEnable()
	{
		this.GO.SetActive(true);
	}

	// Token: 0x06000A84 RID: 2692 RVA: 0x0004D44C File Offset: 0x0004B64C
	private void OnEnable()
	{
		base.Invoke("LazyEnable", this.TimeDelay);
	}

	// Token: 0x06000A85 RID: 2693 RVA: 0x0004D460 File Offset: 0x0004B660
	private void OnDisable()
	{
		base.CancelInvoke("LazyEnable");
		this.GO.SetActive(false);
	}

	// Token: 0x040009A0 RID: 2464
	public GameObject GO;

	// Token: 0x040009A1 RID: 2465
	public float TimeDelay = 0.3f;
}
