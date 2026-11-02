using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000AF RID: 175
[AddComponentMenu("NGUI/Interaction/Key Binding")]
public class UIKeyBinding : MonoBehaviour
{
	// Token: 0x17000033 RID: 51
	// (get) Token: 0x06000444 RID: 1092 RVA: 0x0001BF6C File Offset: 0x0001A16C
	public string captionText
	{
		get
		{
			string text = NGUITools.KeyToCaption(this.keyCode);
			if (this.modifier == UIKeyBinding.Modifier.Alt)
			{
				return "Alt+" + text;
			}
			if (this.modifier == UIKeyBinding.Modifier.Control)
			{
				return "Control+" + text;
			}
			if (this.modifier == UIKeyBinding.Modifier.Shift)
			{
				return "Shift+" + text;
			}
			return text;
		}
	}

	// Token: 0x06000445 RID: 1093 RVA: 0x0001BFD0 File Offset: 0x0001A1D0
	public static bool IsBound(KeyCode key)
	{
		int i = 0;
		int count = UIKeyBinding.mList.Count;
		while (i < count)
		{
			UIKeyBinding uikeyBinding = UIKeyBinding.mList[i];
			if (uikeyBinding != null && uikeyBinding.keyCode == key)
			{
				return true;
			}
			i++;
		}
		return false;
	}

	// Token: 0x06000446 RID: 1094 RVA: 0x0001C024 File Offset: 0x0001A224
	protected virtual void OnEnable()
	{
		UIKeyBinding.mList.Add(this);
	}

	// Token: 0x06000447 RID: 1095 RVA: 0x0001C034 File Offset: 0x0001A234
	protected virtual void OnDisable()
	{
		UIKeyBinding.mList.Remove(this);
	}

	// Token: 0x06000448 RID: 1096 RVA: 0x0001C044 File Offset: 0x0001A244
	protected virtual void Start()
	{
		UIInput component = base.GetComponent<UIInput>();
		this.mIsInput = (component != null);
		if (component != null)
		{
			EventDelegate.Add(component.onSubmit, new EventDelegate.Callback(this.OnSubmit));
		}
	}

	// Token: 0x06000449 RID: 1097 RVA: 0x0001C08C File Offset: 0x0001A28C
	protected virtual void OnSubmit()
	{
		if (UICamera.currentKey == this.keyCode && this.IsModifierActive())
		{
			this.mIgnoreUp = true;
		}
	}

	// Token: 0x0600044A RID: 1098 RVA: 0x0001C0BC File Offset: 0x0001A2BC
	protected virtual bool IsModifierActive()
	{
		if (this.modifier == UIKeyBinding.Modifier.Any)
		{
			return true;
		}
		if (this.modifier == UIKeyBinding.Modifier.Alt)
		{
			if (UICamera.GetKey(308) || UICamera.GetKey(307))
			{
				return true;
			}
		}
		else if (this.modifier == UIKeyBinding.Modifier.Control)
		{
			if (UICamera.GetKey(306) || UICamera.GetKey(305))
			{
				return true;
			}
		}
		else if (this.modifier == UIKeyBinding.Modifier.Shift)
		{
			if (UICamera.GetKey(304) || UICamera.GetKey(303))
			{
				return true;
			}
		}
		else if (this.modifier == UIKeyBinding.Modifier.None)
		{
			return !UICamera.GetKey(308) && !UICamera.GetKey(307) && !UICamera.GetKey(306) && !UICamera.GetKey(305) && !UICamera.GetKey(304) && !UICamera.GetKey(303);
		}
		return false;
	}

	// Token: 0x0600044B RID: 1099 RVA: 0x0001C210 File Offset: 0x0001A410
	protected virtual void Update()
	{
		if (UICamera.inputHasFocus)
		{
			return;
		}
		if (this.keyCode == null || !this.IsModifierActive())
		{
			return;
		}
		bool flag = UICamera.GetKeyDown(this.keyCode);
		bool flag2 = UICamera.GetKeyUp(this.keyCode);
		if (flag)
		{
			this.mPress = true;
		}
		if (this.action == UIKeyBinding.Action.PressAndClick || this.action == UIKeyBinding.Action.All)
		{
			if (flag)
			{
				UICamera.currentKey = this.keyCode;
				this.OnBindingPress(true);
			}
			if (this.mPress && flag2)
			{
				UICamera.currentKey = this.keyCode;
				this.OnBindingPress(false);
				this.OnBindingClick();
			}
		}
		if ((this.action == UIKeyBinding.Action.Select || this.action == UIKeyBinding.Action.All) && flag2)
		{
			if (this.mIsInput)
			{
				if (!this.mIgnoreUp && !UICamera.inputHasFocus && this.mPress)
				{
					UICamera.selectedObject = base.gameObject;
				}
				this.mIgnoreUp = false;
			}
			else if (this.mPress)
			{
				UICamera.hoveredObject = base.gameObject;
			}
		}
		if (flag2)
		{
			this.mPress = false;
		}
	}

	// Token: 0x0600044C RID: 1100 RVA: 0x0001C34C File Offset: 0x0001A54C
	protected virtual void OnBindingPress(bool pressed)
	{
		UICamera.Notify(base.gameObject, "OnPress", pressed);
	}

	// Token: 0x0600044D RID: 1101 RVA: 0x0001C364 File Offset: 0x0001A564
	protected virtual void OnBindingClick()
	{
		UICamera.Notify(base.gameObject, "OnClick", null);
	}

	// Token: 0x0600044E RID: 1102 RVA: 0x0001C378 File Offset: 0x0001A578
	public override string ToString()
	{
		return (this.modifier == UIKeyBinding.Modifier.None) ? this.keyCode.ToString() : (this.modifier + "+" + this.keyCode);
	}

	// Token: 0x0600044F RID: 1103 RVA: 0x0001C3C8 File Offset: 0x0001A5C8
	public static bool GetKeyCode(string text, out KeyCode key, out UIKeyBinding.Modifier modifier)
	{
		key = 0;
		modifier = UIKeyBinding.Modifier.None;
		if (string.IsNullOrEmpty(text))
		{
			return false;
		}
		if (text.Contains("+"))
		{
			string[] array = text.Split(new char[]
			{
				'+'
			});
			try
			{
				modifier = (UIKeyBinding.Modifier)((int)Enum.Parse(typeof(UIKeyBinding.Modifier), array[0]));
				key = (int)Enum.Parse(typeof(KeyCode), array[1]);
			}
			catch (Exception)
			{
				return false;
			}
		}
		else
		{
			modifier = UIKeyBinding.Modifier.None;
			try
			{
				key = (int)Enum.Parse(typeof(KeyCode), text);
			}
			catch (Exception)
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x0400048E RID: 1166
	private static List<UIKeyBinding> mList = new List<UIKeyBinding>();

	// Token: 0x0400048F RID: 1167
	public KeyCode keyCode;

	// Token: 0x04000490 RID: 1168
	public UIKeyBinding.Modifier modifier;

	// Token: 0x04000491 RID: 1169
	public UIKeyBinding.Action action;

	// Token: 0x04000492 RID: 1170
	[NonSerialized]
	private bool mIgnoreUp;

	// Token: 0x04000493 RID: 1171
	[NonSerialized]
	private bool mIsInput;

	// Token: 0x04000494 RID: 1172
	[NonSerialized]
	private bool mPress;

	// Token: 0x020000B0 RID: 176
	public enum Action
	{
		// Token: 0x04000496 RID: 1174
		PressAndClick,
		// Token: 0x04000497 RID: 1175
		Select,
		// Token: 0x04000498 RID: 1176
		All
	}

	// Token: 0x020000B1 RID: 177
	public enum Modifier
	{
		// Token: 0x0400049A RID: 1178
		Any,
		// Token: 0x0400049B RID: 1179
		Shift,
		// Token: 0x0400049C RID: 1180
		Control,
		// Token: 0x0400049D RID: 1181
		Alt,
		// Token: 0x0400049E RID: 1182
		None
	}
}
