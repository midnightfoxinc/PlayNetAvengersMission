using System;
using UnityEngine;

// Token: 0x0200002C RID: 44
public class DFloating : MonoBehaviour
{
	// Token: 0x06000130 RID: 304 RVA: 0x0000A63C File Offset: 0x0000883C
	private void Awake()
	{
		this.startPos = base.transform.position;
		this.direction = this.direction.normalized;
	}

	// Token: 0x06000131 RID: 305 RVA: 0x0000A66C File Offset: 0x0000886C
	private void Update()
	{
		this.currentAngle += Time.deltaTime * this.speed;
		if (this.currentAngle >= 6.2831855f)
		{
			this.currentAngle -= 6.2831855f;
		}
		Vector3 position = this.startPos + Mathf.Sin(this.currentAngle) * this.Length * this.direction;
		base.transform.position = position;
	}

	// Token: 0x0400018F RID: 399
	[SerializeField]
	private float Length = 3f;

	// Token: 0x04000190 RID: 400
	[SerializeField]
	private float speed = 1f;

	// Token: 0x04000191 RID: 401
	[SerializeField]
	private Vector3 direction = Vector3.forward;

	// Token: 0x04000192 RID: 402
	private float currentAngle;

	// Token: 0x04000193 RID: 403
	private Vector3 startPos;
}
