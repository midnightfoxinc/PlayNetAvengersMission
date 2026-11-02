using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200014E RID: 334
public class InvokeInterval : MonoBehaviour
{
	// Token: 0x06000AE5 RID: 2789 RVA: 0x0004F9F0 File Offset: 0x0004DBF0
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

	// Token: 0x06000AE6 RID: 2790 RVA: 0x0004FA3C File Offset: 0x0004DC3C
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		this.goInstances = new List<GameObject>();
		this.count = (int)(this.Duration / this.Interval);
		for (int i = 0; i < this.count; i++)
		{
			GameObject gameObject = Object.Instantiate(this.GO, base.transform.position, default(Quaternion)) as GameObject;
			gameObject.transform.parent = base.transform;
			EffectSettings component = gameObject.GetComponent<EffectSettings>();
			component.Target = this.effectSettings.Target;
			component.IsHomingMove = this.effectSettings.IsHomingMove;
			component.MoveDistance = this.effectSettings.MoveDistance;
			component.MoveSpeed = this.effectSettings.MoveSpeed;
			component.CollisionEnter += delegate(object n, CollisionInfo e)
			{
				this.effectSettings.OnCollisionHandler(e);
			};
			component.ColliderRadius = this.effectSettings.ColliderRadius;
			component.EffectRadius = this.effectSettings.EffectRadius;
			component.EffectDeactivated += new EventHandler(this.effectSettings_EffectDeactivated);
			this.goInstances.Add(gameObject);
			gameObject.SetActive(false);
		}
		this.InvokeAll();
		this.isInitialized = true;
	}

	// Token: 0x06000AE7 RID: 2791 RVA: 0x0004FB74 File Offset: 0x0004DD74
	private void InvokeAll()
	{
		for (int i = 0; i < this.count; i++)
		{
			base.Invoke("InvokeInstance", (float)i * this.Interval);
		}
	}

	// Token: 0x06000AE8 RID: 2792 RVA: 0x0004FBAC File Offset: 0x0004DDAC
	private void InvokeInstance()
	{
		this.goInstances[this.goIndexActivate].SetActive(true);
		if (this.goIndexActivate >= this.goInstances.Count - 1)
		{
			this.goIndexActivate = 0;
		}
		else
		{
			this.goIndexActivate++;
		}
	}

	// Token: 0x06000AE9 RID: 2793 RVA: 0x0004FC04 File Offset: 0x0004DE04
	private void effectSettings_EffectDeactivated(object sender, EventArgs e)
	{
		EffectSettings effectSettings = sender as EffectSettings;
		effectSettings.transform.position = base.transform.position;
		if (this.goIndexDeactivate >= this.count - 1)
		{
			this.effectSettings.Deactivate();
			this.goIndexDeactivate = 0;
		}
		else
		{
			this.goIndexDeactivate++;
		}
	}

	// Token: 0x06000AEA RID: 2794 RVA: 0x0004FC68 File Offset: 0x0004DE68
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.InvokeAll();
		}
	}

	// Token: 0x06000AEB RID: 2795 RVA: 0x0004FC7C File Offset: 0x0004DE7C
	private void OnDisable()
	{
	}

	// Token: 0x04000A53 RID: 2643
	public GameObject GO;

	// Token: 0x04000A54 RID: 2644
	public float Interval = 0.3f;

	// Token: 0x04000A55 RID: 2645
	public float Duration = 3f;

	// Token: 0x04000A56 RID: 2646
	private List<GameObject> goInstances;

	// Token: 0x04000A57 RID: 2647
	private EffectSettings effectSettings;

	// Token: 0x04000A58 RID: 2648
	private int goIndexActivate;

	// Token: 0x04000A59 RID: 2649
	private int goIndexDeactivate;

	// Token: 0x04000A5A RID: 2650
	private bool isInitialized;

	// Token: 0x04000A5B RID: 2651
	private int count;
}
