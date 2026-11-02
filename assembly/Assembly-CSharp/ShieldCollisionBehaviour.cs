using System;
using UnityEngine;

// Token: 0x0200013E RID: 318
public class ShieldCollisionBehaviour : MonoBehaviour
{
	// Token: 0x06000A8D RID: 2701 RVA: 0x0004D6C4 File Offset: 0x0004B8C4
	public void ShieldCollisionEnter(CollisionInfo e)
	{
		if (e.Hit.transform != null)
		{
			if (this.IsWaterInstance)
			{
				GameObject gameObject = Object.Instantiate<GameObject>(this.ExplosionOnHit);
				Transform transform = gameObject.transform;
				transform.parent = base.transform;
				float num = base.transform.localScale.x * this.ScaleWave;
				transform.localScale = new Vector3(num, num, num);
				transform.localPosition = new Vector3(0f, 0.001f, 0f);
				transform.LookAt(e.Hit.point);
			}
			else
			{
				if (this.EffectOnHit != null)
				{
					if (!this.CreateMechInstanceOnHit)
					{
						Transform transform2 = e.Hit.transform;
						Renderer componentInChildren = transform2.GetComponentInChildren<Renderer>();
						GameObject gameObject2 = Object.Instantiate<GameObject>(this.EffectOnHit);
						gameObject2.transform.parent = componentInChildren.transform;
						gameObject2.transform.localPosition = Vector3.zero;
						AddMaterialOnHit component = gameObject2.GetComponent<AddMaterialOnHit>();
						component.SetMaterialQueue(this.currentQueue);
						component.UpdateMaterial(e.Hit);
					}
					else
					{
						GameObject gameObject3 = Object.Instantiate<GameObject>(this.EffectOnHit);
						Transform transform3 = gameObject3.transform;
						transform3.parent = base.GetComponent<Renderer>().transform;
						transform3.localPosition = Vector3.zero;
						transform3.localScale = base.transform.localScale * this.ScaleWave;
						transform3.LookAt(e.Hit.point);
						transform3.Rotate(this.AngleFix);
						gameObject3.GetComponent<Renderer>().material.renderQueue = this.currentQueue - 1000;
					}
				}
				if (this.currentQueue > 4000)
				{
					this.currentQueue = 3001;
				}
				else
				{
					this.currentQueue++;
				}
				if (this.ExplosionOnHit != null)
				{
					GameObject gameObject4 = Object.Instantiate(this.ExplosionOnHit, e.Hit.point, default(Quaternion)) as GameObject;
					gameObject4.transform.parent = base.transform;
				}
			}
		}
	}

	// Token: 0x06000A8E RID: 2702 RVA: 0x0004D8FC File Offset: 0x0004BAFC
	private void Update()
	{
	}

	// Token: 0x040009A8 RID: 2472
	public GameObject EffectOnHit;

	// Token: 0x040009A9 RID: 2473
	public GameObject ExplosionOnHit;

	// Token: 0x040009AA RID: 2474
	public bool IsWaterInstance;

	// Token: 0x040009AB RID: 2475
	public float ScaleWave = 0.89f;

	// Token: 0x040009AC RID: 2476
	public bool CreateMechInstanceOnHit;

	// Token: 0x040009AD RID: 2477
	public Vector3 AngleFix;

	// Token: 0x040009AE RID: 2478
	public int currentQueue = 3001;
}
