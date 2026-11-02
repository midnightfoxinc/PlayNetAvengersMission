using System;
using UnityEngine;

// Token: 0x02000016 RID: 22
public class F3DTurret : MonoBehaviour
{
	// Token: 0x06000093 RID: 147 RVA: 0x000060D0 File Offset: 0x000042D0
	private Vector3 ProjectVectorOnPlane(Vector3 planeNormal, Vector3 vector)
	{
		return vector - Vector3.Dot(vector, planeNormal) * planeNormal;
	}

	// Token: 0x06000094 RID: 148 RVA: 0x000060E8 File Offset: 0x000042E8
	private float SignedVectorAngle(Vector3 referenceVector, Vector3 otherVector, Vector3 normal)
	{
		Vector3 vector = Vector3.Cross(normal, referenceVector);
		float num = Vector3.Angle(referenceVector, otherVector);
		return num * Mathf.Sign(Vector3.Dot(vector, otherVector));
	}

	// Token: 0x06000095 RID: 149 RVA: 0x00006118 File Offset: 0x00004318
	private void Track()
	{
		if (this.hub != null && this.barrel != null)
		{
			Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
			if (Physics.Raycast(ray, ref this.hitInfo, 500f))
			{
				Vector3 vector = this.ProjectVectorOnPlane(this.hub.up, this.hitInfo.point - this.hub.position);
				Quaternion quaternion = Quaternion.LookRotation(vector);
				this.hubAngle = this.SignedVectorAngle(base.transform.forward, vector, Vector3.up);
				if (this.hubAngle <= -60f)
				{
					quaternion = Quaternion.LookRotation(Quaternion.Euler(0f, -60f, 0f) * base.transform.forward);
				}
				else if (this.hubAngle >= 60f)
				{
					quaternion = Quaternion.LookRotation(Quaternion.Euler(0f, 60f, 0f) * base.transform.forward);
				}
				this.hub.rotation = Quaternion.Slerp(this.hub.rotation, quaternion, Time.deltaTime * 5f);
				Vector3 vector2 = this.ProjectVectorOnPlane(this.hub.right, this.hitInfo.point - this.barrel.position);
				Quaternion quaternion2 = Quaternion.LookRotation(vector2);
				this.barrelAngle = this.SignedVectorAngle(this.hub.forward, vector2, this.hub.right);
				if (this.barrelAngle < -30f)
				{
					quaternion2 = Quaternion.LookRotation(Quaternion.AngleAxis(-30f, this.hub.right) * this.hub.forward);
				}
				else if (this.barrelAngle > 15f)
				{
					quaternion2 = Quaternion.LookRotation(Quaternion.AngleAxis(15f, this.hub.right) * this.hub.forward);
				}
				this.barrel.rotation = Quaternion.Slerp(this.barrel.rotation, quaternion2, Time.deltaTime * 5f);
			}
		}
	}

	// Token: 0x06000096 RID: 150 RVA: 0x0000635C File Offset: 0x0000455C
	private void Update()
	{
		this.Track();
		if (!this.isFiring && Input.GetKeyDown(323))
		{
			this.isFiring = true;
			F3DFXController.instance.Fire();
		}
		if (this.isFiring && Input.GetKeyUp(323))
		{
			this.isFiring = false;
			F3DFXController.instance.Stop();
		}
	}

	// Token: 0x040000EA RID: 234
	public Transform hub;

	// Token: 0x040000EB RID: 235
	public Transform barrel;

	// Token: 0x040000EC RID: 236
	private RaycastHit hitInfo;

	// Token: 0x040000ED RID: 237
	private bool isFiring;

	// Token: 0x040000EE RID: 238
	private float hubAngle;

	// Token: 0x040000EF RID: 239
	private float barrelAngle;
}
