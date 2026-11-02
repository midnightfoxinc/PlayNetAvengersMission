using System;
using UnityEngine;

// Token: 0x020000C7 RID: 199
[RequireComponent(typeof(UISlider))]
[AddComponentMenu("NGUI/Interaction/Sound Volume")]
public class UISoundVolume : MonoBehaviour
{
	// Token: 0x0600051E RID: 1310 RVA: 0x00022960 File Offset: 0x00020B60
	private void Awake()
	{
		UISlider component = base.GetComponent<UISlider>();
		component.value = NGUITools.soundVolume;
		EventDelegate.Add(component.onChange, new EventDelegate.Callback(this.OnChange));
	}

	// Token: 0x0600051F RID: 1311 RVA: 0x00022998 File Offset: 0x00020B98
	private void OnChange()
	{
		NGUITools.soundVolume = UIProgressBar.current.value;
	}
}
