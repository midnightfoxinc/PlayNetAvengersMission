using System;
using UnityEngine;

// Token: 0x020001F0 RID: 496
public class LerpToLocalZero : MonoBehaviour
{
	// Token: 0x06000E5D RID: 3677 RVA: 0x00064F28 File Offset: 0x00063128
	private void Start()
	{
	}

	// Token: 0x06000E5E RID: 3678 RVA: 0x00064F2C File Offset: 0x0006312C
	private void Update()
	{
		if (this.DelayEnabled)
		{
			this.step = Mathf.Lerp(this.step, 0f, Time.deltaTime * this.SpeedToLerp);
			if (this.step < 0.01f)
			{
				base.transform.GetComponent<DelayEnable>().EnabledAllInList();
			}
		}
		base.transform.localPosition = Vector3.Lerp(base.transform.localPosition, Vector3.zero, Time.deltaTime * this.SpeedToLerp);
	}

	// Token: 0x04000E21 RID: 3617
	public float SpeedToLerp = 1f;

	// Token: 0x04000E22 RID: 3618
	public bool DelayEnabled;

	// Token: 0x04000E23 RID: 3619
	private float step = 1f;
}
