using System;
using UnityEngine;

// Token: 0x02000013 RID: 19
public class F3DShotgun : MonoBehaviour
{
	// Token: 0x06000087 RID: 135 RVA: 0x00005D70 File Offset: 0x00003F70
	private void OnParticleCollision(GameObject other)
	{
		int safeCollisionEventSize = ParticlePhysicsExtensions.GetSafeCollisionEventSize(base.GetComponent<ParticleSystem>());
		if (this.collisionEvents.Length < safeCollisionEventSize)
		{
			this.collisionEvents = new ParticleCollisionEvent[safeCollisionEventSize];
		}
		int num = ParticlePhysicsExtensions.GetCollisionEvents(base.GetComponent<ParticleSystem>(), other, this.collisionEvents);
		for (int i = 0; i < num; i++)
		{
			F3DAudioController.instance.ShotGunHit(this.collisionEvents[i].intersection);
			if (other.GetComponent<Rigidbody>())
			{
				Vector3 intersection = this.collisionEvents[i].intersection;
				Vector3 vector = this.collisionEvents[i].velocity.normalized * 50f;
				other.GetComponent<Rigidbody>().AddForceAtPosition(vector, intersection);
			}
		}
	}

	// Token: 0x040000DE RID: 222
	private ParticleCollisionEvent[] collisionEvents = new ParticleCollisionEvent[16];
}
