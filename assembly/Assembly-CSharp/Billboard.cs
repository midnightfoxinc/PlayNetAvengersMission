using System;
using UnityEngine;

// Token: 0x02000143 RID: 323
public class Billboard : MonoBehaviour
{
	// Token: 0x06000AA1 RID: 2721 RVA: 0x0004E2D8 File Offset: 0x0004C4D8
	private void Awake()
	{
		if (this.AutoInitCamera)
		{
			this.Camera = Camera.main;
			this.Active = true;
		}
		this.t = base.transform;
		this.camT = this.Camera.transform;
		Transform parent = this.t.parent;
		this.myContainer = new GameObject
		{
			name = "Billboard_" + this.t.gameObject.name
		};
		this.contT = this.myContainer.transform;
		this.contT.position = this.t.position;
		this.t.parent = this.myContainer.transform;
		this.contT.parent = parent;
	}

	// Token: 0x06000AA2 RID: 2722 RVA: 0x0004E3A4 File Offset: 0x0004C5A4
	private void Update()
	{
		if (this.Active)
		{
			this.contT.LookAt(this.contT.position + this.camT.rotation * Vector3.back, this.camT.rotation * Vector3.up);
		}
	}

	// Token: 0x040009DA RID: 2522
	public Camera Camera;

	// Token: 0x040009DB RID: 2523
	public bool Active = true;

	// Token: 0x040009DC RID: 2524
	public bool AutoInitCamera = true;

	// Token: 0x040009DD RID: 2525
	private GameObject myContainer;

	// Token: 0x040009DE RID: 2526
	private Transform t;

	// Token: 0x040009DF RID: 2527
	private Transform camT;

	// Token: 0x040009E0 RID: 2528
	private Transform contT;
}
