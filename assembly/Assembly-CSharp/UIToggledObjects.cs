using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000CD RID: 205
[AddComponentMenu("NGUI/Interaction/Toggled Objects")]
public class UIToggledObjects : MonoBehaviour
{
	// Token: 0x0600053B RID: 1339 RVA: 0x000239D0 File Offset: 0x00021BD0
	private void Awake()
	{
		if (this.target != null)
		{
			if (this.activate.Count == 0 && this.deactivate.Count == 0)
			{
				if (this.inverse)
				{
					this.deactivate.Add(this.target);
				}
				else
				{
					this.activate.Add(this.target);
				}
			}
			else
			{
				this.target = null;
			}
		}
		UIToggle component = base.GetComponent<UIToggle>();
		EventDelegate.Add(component.onChange, new EventDelegate.Callback(this.Toggle));
	}

	// Token: 0x0600053C RID: 1340 RVA: 0x00023A6C File Offset: 0x00021C6C
	public void Toggle()
	{
		bool value = UIToggle.current.value;
		if (base.enabled)
		{
			for (int i = 0; i < this.activate.Count; i++)
			{
				this.Set(this.activate[i], value);
			}
			for (int j = 0; j < this.deactivate.Count; j++)
			{
				this.Set(this.deactivate[j], !value);
			}
		}
	}

	// Token: 0x0600053D RID: 1341 RVA: 0x00023AF0 File Offset: 0x00021CF0
	private void Set(GameObject go, bool state)
	{
		if (go != null)
		{
			NGUITools.SetActive(go, state);
		}
	}

	// Token: 0x040005A0 RID: 1440
	public List<GameObject> activate;

	// Token: 0x040005A1 RID: 1441
	public List<GameObject> deactivate;

	// Token: 0x040005A2 RID: 1442
	[SerializeField]
	[HideInInspector]
	private GameObject target;

	// Token: 0x040005A3 RID: 1443
	[SerializeField]
	[HideInInspector]
	private bool inverse;
}
