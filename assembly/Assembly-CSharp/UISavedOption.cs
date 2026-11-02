using System;
using UnityEngine;

// Token: 0x020000BD RID: 189
[AddComponentMenu("NGUI/Interaction/Saved Option")]
public class UISavedOption : MonoBehaviour
{
	// Token: 0x1700004B RID: 75
	// (get) Token: 0x060004D9 RID: 1241 RVA: 0x00020184 File Offset: 0x0001E384
	private string key
	{
		get
		{
			return (!string.IsNullOrEmpty(this.keyName)) ? this.keyName : ("NGUI State: " + base.name);
		}
	}

	// Token: 0x060004DA RID: 1242 RVA: 0x000201B4 File Offset: 0x0001E3B4
	private void Awake()
	{
		this.mList = base.GetComponent<UIPopupList>();
		this.mCheck = base.GetComponent<UIToggle>();
		this.mSlider = base.GetComponent<UIProgressBar>();
	}

	// Token: 0x060004DB RID: 1243 RVA: 0x000201E8 File Offset: 0x0001E3E8
	private void OnEnable()
	{
		if (this.mList != null)
		{
			EventDelegate.Add(this.mList.onChange, new EventDelegate.Callback(this.SaveSelection));
			string @string = PlayerPrefs.GetString(this.key);
			if (!string.IsNullOrEmpty(@string))
			{
				this.mList.value = @string;
			}
		}
		else if (this.mCheck != null)
		{
			EventDelegate.Add(this.mCheck.onChange, new EventDelegate.Callback(this.SaveState));
			this.mCheck.value = (PlayerPrefs.GetInt(this.key, (!this.mCheck.startsActive) ? 0 : 1) != 0);
		}
		else if (this.mSlider != null)
		{
			EventDelegate.Add(this.mSlider.onChange, new EventDelegate.Callback(this.SaveProgress));
			this.mSlider.value = PlayerPrefs.GetFloat(this.key, this.mSlider.value);
		}
		else
		{
			string string2 = PlayerPrefs.GetString(this.key);
			UIToggle[] componentsInChildren = base.GetComponentsInChildren<UIToggle>(true);
			int i = 0;
			int num = componentsInChildren.Length;
			while (i < num)
			{
				UIToggle uitoggle = componentsInChildren[i];
				uitoggle.value = (uitoggle.name == string2);
				i++;
			}
		}
	}

	// Token: 0x060004DC RID: 1244 RVA: 0x0002034C File Offset: 0x0001E54C
	private void OnDisable()
	{
		if (this.mCheck != null)
		{
			EventDelegate.Remove(this.mCheck.onChange, new EventDelegate.Callback(this.SaveState));
		}
		else if (this.mList != null)
		{
			EventDelegate.Remove(this.mList.onChange, new EventDelegate.Callback(this.SaveSelection));
		}
		else if (this.mSlider != null)
		{
			EventDelegate.Remove(this.mSlider.onChange, new EventDelegate.Callback(this.SaveProgress));
		}
		else
		{
			UIToggle[] componentsInChildren = base.GetComponentsInChildren<UIToggle>(true);
			int i = 0;
			int num = componentsInChildren.Length;
			while (i < num)
			{
				UIToggle uitoggle = componentsInChildren[i];
				if (uitoggle.value)
				{
					PlayerPrefs.SetString(this.key, uitoggle.name);
					break;
				}
				i++;
			}
		}
	}

	// Token: 0x060004DD RID: 1245 RVA: 0x00020438 File Offset: 0x0001E638
	public void SaveSelection()
	{
		PlayerPrefs.SetString(this.key, UIPopupList.current.value);
	}

	// Token: 0x060004DE RID: 1246 RVA: 0x00020450 File Offset: 0x0001E650
	public void SaveState()
	{
		PlayerPrefs.SetInt(this.key, (!UIToggle.current.value) ? 0 : 1);
	}

	// Token: 0x060004DF RID: 1247 RVA: 0x00020474 File Offset: 0x0001E674
	public void SaveProgress()
	{
		PlayerPrefs.SetFloat(this.key, UIProgressBar.current.value);
	}

	// Token: 0x04000529 RID: 1321
	public string keyName;

	// Token: 0x0400052A RID: 1322
	private UIPopupList mList;

	// Token: 0x0400052B RID: 1323
	private UIToggle mCheck;

	// Token: 0x0400052C RID: 1324
	private UIProgressBar mSlider;
}
