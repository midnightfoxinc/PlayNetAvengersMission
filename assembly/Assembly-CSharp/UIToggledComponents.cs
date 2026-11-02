using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000CC RID: 204
[ExecuteInEditMode]
[AddComponentMenu("NGUI/Interaction/Toggled Components")]
[RequireComponent(typeof(UIToggle))]
public class UIToggledComponents : MonoBehaviour
{
	// Token: 0x06000538 RID: 1336 RVA: 0x0002389C File Offset: 0x00021A9C
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

	// Token: 0x06000539 RID: 1337 RVA: 0x00023938 File Offset: 0x00021B38
	public void Toggle()
	{
		if (base.enabled)
		{
			for (int i = 0; i < this.activate.Count; i++)
			{
				MonoBehaviour monoBehaviour = this.activate[i];
				monoBehaviour.enabled = UIToggle.current.value;
			}
			for (int j = 0; j < this.deactivate.Count; j++)
			{
				MonoBehaviour monoBehaviour2 = this.deactivate[j];
				monoBehaviour2.enabled = !UIToggle.current.value;
			}
		}
	}

	// Token: 0x0400059C RID: 1436
	public List<MonoBehaviour> activate;

	// Token: 0x0400059D RID: 1437
	public List<MonoBehaviour> deactivate;

	// Token: 0x0400059E RID: 1438
	[SerializeField]
	[HideInInspector]
	private MonoBehaviour target;

	// Token: 0x0400059F RID: 1439
	[SerializeField]
	[HideInInspector]
	private bool inverse;
}
