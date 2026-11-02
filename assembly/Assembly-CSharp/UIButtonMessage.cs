using System;
using UnityEngine;

// Token: 0x02000098 RID: 152
[AddComponentMenu("NGUI/Interaction/Button Message (Legacy)")]
public class UIButtonMessage : MonoBehaviour
{
	// Token: 0x060003A3 RID: 931 RVA: 0x00018220 File Offset: 0x00016420
	private void Start()
	{
		this.mStarted = true;
	}

	// Token: 0x060003A4 RID: 932 RVA: 0x0001822C File Offset: 0x0001642C
	private void OnEnable()
	{
		if (this.mStarted)
		{
			this.OnHover(UICamera.IsHighlighted(base.gameObject));
		}
	}

	// Token: 0x060003A5 RID: 933 RVA: 0x0001824C File Offset: 0x0001644C
	private void OnHover(bool isOver)
	{
		if (base.enabled && ((isOver && this.trigger == UIButtonMessage.Trigger.OnMouseOver) || (!isOver && this.trigger == UIButtonMessage.Trigger.OnMouseOut)))
		{
			this.Send();
		}
	}

	// Token: 0x060003A6 RID: 934 RVA: 0x00018284 File Offset: 0x00016484
	private void OnPress(bool isPressed)
	{
		if (base.enabled && ((isPressed && this.trigger == UIButtonMessage.Trigger.OnPress) || (!isPressed && this.trigger == UIButtonMessage.Trigger.OnRelease)))
		{
			this.Send();
		}
	}

	// Token: 0x060003A7 RID: 935 RVA: 0x000182BC File Offset: 0x000164BC
	private void OnSelect(bool isSelected)
	{
		if (base.enabled && (!isSelected || UICamera.currentScheme == UICamera.ControlScheme.Controller))
		{
			this.OnHover(isSelected);
		}
	}

	// Token: 0x060003A8 RID: 936 RVA: 0x000182E4 File Offset: 0x000164E4
	private void OnClick()
	{
		if (base.enabled && this.trigger == UIButtonMessage.Trigger.OnClick)
		{
			this.Send();
		}
	}

	// Token: 0x060003A9 RID: 937 RVA: 0x00018304 File Offset: 0x00016504
	private void OnDoubleClick()
	{
		if (base.enabled && this.trigger == UIButtonMessage.Trigger.OnDoubleClick)
		{
			this.Send();
		}
	}

	// Token: 0x060003AA RID: 938 RVA: 0x00018324 File Offset: 0x00016524
	private void Send()
	{
		if (string.IsNullOrEmpty(this.functionName))
		{
			return;
		}
		if (this.target == null)
		{
			this.target = base.gameObject;
		}
		if (this.includeChildren)
		{
			Transform[] componentsInChildren = this.target.GetComponentsInChildren<Transform>();
			int i = 0;
			int num = componentsInChildren.Length;
			while (i < num)
			{
				Transform transform = componentsInChildren[i];
				transform.gameObject.SendMessage(this.functionName, base.gameObject, 1);
				i++;
			}
		}
		else
		{
			this.target.SendMessage(this.functionName, base.gameObject, 1);
		}
	}

	// Token: 0x040003E1 RID: 993
	public GameObject target;

	// Token: 0x040003E2 RID: 994
	public string functionName;

	// Token: 0x040003E3 RID: 995
	public UIButtonMessage.Trigger trigger;

	// Token: 0x040003E4 RID: 996
	public bool includeChildren;

	// Token: 0x040003E5 RID: 997
	private bool mStarted;

	// Token: 0x02000099 RID: 153
	public enum Trigger
	{
		// Token: 0x040003E7 RID: 999
		OnClick,
		// Token: 0x040003E8 RID: 1000
		OnMouseOver,
		// Token: 0x040003E9 RID: 1001
		OnMouseOut,
		// Token: 0x040003EA RID: 1002
		OnPress,
		// Token: 0x040003EB RID: 1003
		OnRelease,
		// Token: 0x040003EC RID: 1004
		OnDoubleClick
	}
}
