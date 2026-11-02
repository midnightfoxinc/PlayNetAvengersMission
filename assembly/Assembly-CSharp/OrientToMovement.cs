using System;
using UnityEngine;

// Token: 0x020001F6 RID: 502
public class OrientToMovement : MonoBehaviour
{
	// Token: 0x06000E70 RID: 3696 RVA: 0x00065B34 File Offset: 0x00063D34
	private void Start()
	{
		this.MyRigidBody = base.transform.GetComponent<Rigidbody>();
	}

	// Token: 0x06000E71 RID: 3697 RVA: 0x00065B48 File Offset: 0x00063D48
	private void Update()
	{
	}

	// Token: 0x04000E47 RID: 3655
	private Rigidbody MyRigidBody;

	// Token: 0x04000E48 RID: 3656
	private Vector3 LastPosition;
}
