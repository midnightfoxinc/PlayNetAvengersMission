using System;
using UnityEngine;

// Token: 0x02000128 RID: 296
[ExecuteInEditMode]
[AddComponentMenu("NGUI/UI/Localize")]
[RequireComponent(typeof(UIWidget))]
public class UILocalize : MonoBehaviour
{
	// Token: 0x17000163 RID: 355
	// (set) Token: 0x060009A7 RID: 2471 RVA: 0x00046D94 File Offset: 0x00044F94
	public string value
	{
		set
		{
			if (!string.IsNullOrEmpty(value))
			{
				UIWidget component = base.GetComponent<UIWidget>();
				UILabel uilabel = component as UILabel;
				UISprite uisprite = component as UISprite;
				if (uilabel != null)
				{
					UIInput uiinput = NGUITools.FindInParents<UIInput>(uilabel.gameObject);
					if (uiinput != null && uiinput.label == uilabel)
					{
						uiinput.defaultText = value;
					}
					else
					{
						uilabel.text = value;
					}
				}
				else if (uisprite != null)
				{
					UIButton uibutton = NGUITools.FindInParents<UIButton>(uisprite.gameObject);
					if (uibutton != null && uibutton.tweenTarget == uisprite.gameObject)
					{
						uibutton.normalSprite = value;
					}
					uisprite.spriteName = value;
					uisprite.MakePixelPerfect();
				}
			}
		}
	}

	// Token: 0x060009A8 RID: 2472 RVA: 0x00046E60 File Offset: 0x00045060
	private void OnEnable()
	{
		if (this.mStarted)
		{
			this.OnLocalize();
		}
	}

	// Token: 0x060009A9 RID: 2473 RVA: 0x00046E74 File Offset: 0x00045074
	private void Start()
	{
		this.mStarted = true;
		this.OnLocalize();
	}

	// Token: 0x060009AA RID: 2474 RVA: 0x00046E84 File Offset: 0x00045084
	private void OnLocalize()
	{
		if (string.IsNullOrEmpty(this.key))
		{
			UILabel component = base.GetComponent<UILabel>();
			if (component != null)
			{
				this.key = component.text;
			}
		}
		if (!string.IsNullOrEmpty(this.key))
		{
			this.value = Localization.Get(this.key);
		}
	}

	// Token: 0x040008F0 RID: 2288
	public string key;

	// Token: 0x040008F1 RID: 2289
	private bool mStarted;
}
