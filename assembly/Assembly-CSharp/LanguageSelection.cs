using System;
using UnityEngine;

// Token: 0x02000090 RID: 144
[AddComponentMenu("NGUI/Interaction/Language Selection")]
[RequireComponent(typeof(UIPopupList))]
public class LanguageSelection : MonoBehaviour
{
	// Token: 0x06000370 RID: 880 RVA: 0x00016CB4 File Offset: 0x00014EB4
	private void Awake()
	{
		this.mList = base.GetComponent<UIPopupList>();
		this.Refresh();
	}

	// Token: 0x06000371 RID: 881 RVA: 0x00016CC8 File Offset: 0x00014EC8
	private void Start()
	{
		EventDelegate.Add(this.mList.onChange, delegate()
		{
			Localization.language = UIPopupList.current.value;
		});
	}

	// Token: 0x06000372 RID: 882 RVA: 0x00016D04 File Offset: 0x00014F04
	public void Refresh()
	{
		if (this.mList != null && Localization.knownLanguages != null)
		{
			this.mList.Clear();
			int i = 0;
			int num = Localization.knownLanguages.Length;
			while (i < num)
			{
				this.mList.items.Add(Localization.knownLanguages[i]);
				i++;
			}
			this.mList.value = Localization.language;
		}
	}

	// Token: 0x040003A9 RID: 937
	private UIPopupList mList;
}
