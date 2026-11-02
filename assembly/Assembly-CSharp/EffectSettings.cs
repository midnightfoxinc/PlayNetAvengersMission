using System;
using UnityEngine;

// Token: 0x02000145 RID: 325
public class EffectSettings : MonoBehaviour
{
	// Token: 0x14000028 RID: 40
	// (add) Token: 0x06000AA6 RID: 2726 RVA: 0x0004E4E8 File Offset: 0x0004C6E8
	// (remove) Token: 0x06000AA7 RID: 2727 RVA: 0x0004E504 File Offset: 0x0004C704
	public event EventHandler<CollisionInfo> CollisionEnter;

	// Token: 0x14000029 RID: 41
	// (add) Token: 0x06000AA8 RID: 2728 RVA: 0x0004E520 File Offset: 0x0004C720
	// (remove) Token: 0x06000AA9 RID: 2729 RVA: 0x0004E53C File Offset: 0x0004C73C
	public event EventHandler EffectDeactivated;

	// Token: 0x06000AAA RID: 2730 RVA: 0x0004E558 File Offset: 0x0004C758
	public void OnCollisionHandler(CollisionInfo e)
	{
		for (int i = 0; i < this.lastActiveIndex; i++)
		{
			base.Invoke("SetGoActive", this.active_value[i]);
		}
		for (int j = 0; j < this.lastInactiveIndex; j++)
		{
			base.Invoke("SetGoInactive", this.inactive_value[j]);
		}
		EventHandler<CollisionInfo> collisionEnter = this.CollisionEnter;
		if (collisionEnter != null)
		{
			collisionEnter.Invoke(this, e);
		}
		if (this.DeactivateAfterCollision && !this.deactivatedIsWait)
		{
			this.deactivatedIsWait = true;
			base.Invoke("Deactivate", this.DeactivateTimeDelay);
		}
	}

	// Token: 0x06000AAB RID: 2731 RVA: 0x0004E5FC File Offset: 0x0004C7FC
	public void OnEffectDeactivatedHandler()
	{
		EventHandler effectDeactivated = this.EffectDeactivated;
		if (effectDeactivated != null)
		{
			effectDeactivated.Invoke(this, EventArgs.Empty);
		}
	}

	// Token: 0x06000AAC RID: 2732 RVA: 0x0004E624 File Offset: 0x0004C824
	public void Deactivate()
	{
		this.OnEffectDeactivatedHandler();
		base.gameObject.SetActive(false);
	}

	// Token: 0x06000AAD RID: 2733 RVA: 0x0004E638 File Offset: 0x0004C838
	private void SetGoActive()
	{
		this.active_key[this.currentActiveGo].SetActive(false);
		this.currentActiveGo++;
		if (this.currentActiveGo >= this.lastActiveIndex)
		{
			this.currentActiveGo = 0;
		}
	}

	// Token: 0x06000AAE RID: 2734 RVA: 0x0004E674 File Offset: 0x0004C874
	private void SetGoInactive()
	{
		this.inactive_Key[this.currentInactiveGo].SetActive(true);
		this.currentInactiveGo++;
		if (this.currentInactiveGo >= this.lastInactiveIndex)
		{
			this.currentInactiveGo = 0;
		}
	}

	// Token: 0x06000AAF RID: 2735 RVA: 0x0004E6B0 File Offset: 0x0004C8B0
	public void OnEnable()
	{
		for (int i = 0; i < this.lastActiveIndex; i++)
		{
			this.active_key[i].SetActive(true);
		}
		for (int j = 0; j < this.lastInactiveIndex; j++)
		{
			this.inactive_Key[j].SetActive(false);
		}
		this.deactivatedIsWait = false;
	}

	// Token: 0x06000AB0 RID: 2736 RVA: 0x0004E710 File Offset: 0x0004C910
	public void OnDisable()
	{
		base.CancelInvoke("SetGoActive");
		base.CancelInvoke("SetGoInactive");
		base.CancelInvoke("Deactivate");
		this.currentActiveGo = 0;
		this.currentInactiveGo = 0;
	}

	// Token: 0x06000AB1 RID: 2737 RVA: 0x0004E744 File Offset: 0x0004C944
	public void RegistreActiveElement(GameObject go, float time)
	{
		this.active_key[this.lastActiveIndex] = go;
		this.active_value[this.lastActiveIndex] = time;
		this.lastActiveIndex++;
	}

	// Token: 0x06000AB2 RID: 2738 RVA: 0x0004E77C File Offset: 0x0004C97C
	public void RegistreInactiveElement(GameObject go, float time)
	{
		this.inactive_Key[this.lastInactiveIndex] = go;
		this.inactive_value[this.lastInactiveIndex] = time;
		this.lastInactiveIndex++;
	}

	// Token: 0x040009E3 RID: 2531
	public float ColliderRadius = 0.2f;

	// Token: 0x040009E4 RID: 2532
	public float EffectRadius;

	// Token: 0x040009E5 RID: 2533
	public GameObject Target;

	// Token: 0x040009E6 RID: 2534
	public float MoveSpeed = 1f;

	// Token: 0x040009E7 RID: 2535
	public float MoveDistance = 20f;

	// Token: 0x040009E8 RID: 2536
	public bool IsHomingMove;

	// Token: 0x040009E9 RID: 2537
	public bool IsVisible = true;

	// Token: 0x040009EA RID: 2538
	public bool DeactivateAfterCollision = true;

	// Token: 0x040009EB RID: 2539
	public float DeactivateTimeDelay = 4f;

	// Token: 0x040009EC RID: 2540
	public LayerMask LayerMask = -1;

	// Token: 0x040009ED RID: 2541
	private GameObject[] active_key = new GameObject[100];

	// Token: 0x040009EE RID: 2542
	private float[] active_value = new float[100];

	// Token: 0x040009EF RID: 2543
	private GameObject[] inactive_Key = new GameObject[100];

	// Token: 0x040009F0 RID: 2544
	private float[] inactive_value = new float[100];

	// Token: 0x040009F1 RID: 2545
	private int lastActiveIndex;

	// Token: 0x040009F2 RID: 2546
	private int lastInactiveIndex;

	// Token: 0x040009F3 RID: 2547
	private int currentActiveGo;

	// Token: 0x040009F4 RID: 2548
	private int currentInactiveGo;

	// Token: 0x040009F5 RID: 2549
	private bool deactivatedIsWait;
}
