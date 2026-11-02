using System;
using UnityEngine;

// Token: 0x02000094 RID: 148
[AddComponentMenu("NGUI/Interaction/Button Activate")]
public class UIButtonActivate : MonoBehaviour
{
	// Token: 0x0600038B RID: 907 RVA: 0x00017A68 File Offset: 0x00015C68
	private void OnClick()
	{
		if (this.target != null)
		{
			NGUITools.SetActive(this.target, this.state);
		}
	}

	// Token: 0x040003CB RID: 971
	public GameObject target;

	// Token: 0x040003CC RID: 972
	public bool state = true;
}
