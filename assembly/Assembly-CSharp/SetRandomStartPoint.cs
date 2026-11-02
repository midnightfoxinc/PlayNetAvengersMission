using System;
using UnityEngine;

// Token: 0x0200013D RID: 317
public class SetRandomStartPoint : MonoBehaviour
{
	// Token: 0x06000A87 RID: 2695 RVA: 0x0004D490 File Offset: 0x0004B690
	private void GetEffectSettingsComponent(Transform tr)
	{
		Transform parent = tr.parent;
		if (parent != null)
		{
			this.effectSettings = parent.GetComponentInChildren<EffectSettings>();
			if (this.effectSettings == null)
			{
				this.GetEffectSettingsComponent(parent.transform);
			}
		}
	}

	// Token: 0x06000A88 RID: 2696 RVA: 0x0004D4DC File Offset: 0x0004B6DC
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		if (this.effectSettings == null)
		{
			Debug.Log("Prefab root or children have not script \"PrefabSettings\"");
		}
		this.tRoot = this.effectSettings.transform;
		this.InitDefaultVariables();
		this.isInitialized = true;
	}

	// Token: 0x06000A89 RID: 2697 RVA: 0x0004D530 File Offset: 0x0004B730
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.InitDefaultVariables();
		}
	}

	// Token: 0x06000A8A RID: 2698 RVA: 0x0004D544 File Offset: 0x0004B744
	private void InitDefaultVariables()
	{
		if (base.GetComponent<ParticleSystem>() != null)
		{
			base.GetComponent<ParticleSystem>().Stop();
		}
		Vector3 position = this.effectSettings.Target.transform.position;
		Vector3 vector;
		vector..ctor(position.x, this.Height, position.z);
		float num = Random.Range(0f, this.RandomRange.x * 200f) / 100f - this.RandomRange.x;
		float num2 = Random.Range(0f, this.RandomRange.y * 200f) / 100f - this.RandomRange.y;
		float num3 = Random.Range(0f, this.RandomRange.z * 200f) / 100f - this.RandomRange.z;
		Vector3 position2;
		position2..ctor(vector.x + num, vector.y + num2, vector.z + num3);
		if (this.StartPointGo == null)
		{
			this.tRoot.position = position2;
		}
		else
		{
			this.StartPointGo.transform.position = position2;
		}
		if (base.GetComponent<ParticleSystem>() != null)
		{
			base.GetComponent<ParticleSystem>().Play();
		}
	}

	// Token: 0x06000A8B RID: 2699 RVA: 0x0004D6A0 File Offset: 0x0004B8A0
	private void Update()
	{
	}

	// Token: 0x040009A2 RID: 2466
	public Vector3 RandomRange;

	// Token: 0x040009A3 RID: 2467
	public GameObject StartPointGo;

	// Token: 0x040009A4 RID: 2468
	public float Height = 10f;

	// Token: 0x040009A5 RID: 2469
	private EffectSettings effectSettings;

	// Token: 0x040009A6 RID: 2470
	private bool isInitialized;

	// Token: 0x040009A7 RID: 2471
	private Transform tRoot;
}
