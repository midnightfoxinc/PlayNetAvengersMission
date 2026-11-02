using System;
using System.Collections.Generic;
using System.Text;
using UnityEngine;

// Token: 0x0200011E RID: 286
[AddComponentMenu("NGUI/UI/Input Field")]
public class UIInput : MonoBehaviour
{
	// Token: 0x1700012B RID: 299
	// (get) Token: 0x06000902 RID: 2306 RVA: 0x000428D4 File Offset: 0x00040AD4
	// (set) Token: 0x06000903 RID: 2307 RVA: 0x000428F0 File Offset: 0x00040AF0
	public string defaultText
	{
		get
		{
			if (this.mDoInit)
			{
				this.Init();
			}
			return this.mDefaultText;
		}
		set
		{
			if (this.mDoInit)
			{
				this.Init();
			}
			this.mDefaultText = value;
			this.UpdateLabel();
		}
	}

	// Token: 0x1700012C RID: 300
	// (get) Token: 0x06000904 RID: 2308 RVA: 0x00042910 File Offset: 0x00040B10
	// (set) Token: 0x06000905 RID: 2309 RVA: 0x0004292C File Offset: 0x00040B2C
	public Color defaultColor
	{
		get
		{
			if (this.mDoInit)
			{
				this.Init();
			}
			return this.mDefaultColor;
		}
		set
		{
			this.mDefaultColor = value;
			if (!this.isSelected)
			{
				this.label.color = value;
			}
		}
	}

	// Token: 0x1700012D RID: 301
	// (get) Token: 0x06000906 RID: 2310 RVA: 0x0004294C File Offset: 0x00040B4C
	public bool inputShouldBeHidden
	{
		get
		{
			return this.hideInput && this.label != null && !this.label.multiLine && this.inputType != UIInput.InputType.Password;
		}
	}

	// Token: 0x1700012E RID: 302
	// (get) Token: 0x06000907 RID: 2311 RVA: 0x0004298C File Offset: 0x00040B8C
	// (set) Token: 0x06000908 RID: 2312 RVA: 0x00042994 File Offset: 0x00040B94
	[Obsolete("Use UIInput.value instead")]
	public string text
	{
		get
		{
			return this.value;
		}
		set
		{
			this.value = value;
		}
	}

	// Token: 0x1700012F RID: 303
	// (get) Token: 0x06000909 RID: 2313 RVA: 0x000429A0 File Offset: 0x00040BA0
	// (set) Token: 0x0600090A RID: 2314 RVA: 0x000429BC File Offset: 0x00040BBC
	public string value
	{
		get
		{
			if (this.mDoInit)
			{
				this.Init();
			}
			return this.mValue;
		}
		set
		{
			this.Set(value, true);
		}
	}

	// Token: 0x0600090B RID: 2315 RVA: 0x000429C8 File Offset: 0x00040BC8
	public void Set(string value, bool notify = true)
	{
		if (this.mDoInit)
		{
			this.Init();
		}
		if (value == this.value)
		{
			return;
		}
		UIInput.mDrawStart = 0;
		if (Application.platform == 22)
		{
			value = value.Replace("\\b", "\b");
		}
		value = this.Validate(value);
		if (this.isSelected && UIInput.mKeyboard != null && this.mCached != value)
		{
			UIInput.mKeyboard.text = value;
			this.mCached = value;
		}
		if (this.mValue != value)
		{
			this.mValue = value;
			this.mLoadSavedValue = false;
			if (this.isSelected)
			{
				if (string.IsNullOrEmpty(value))
				{
					this.mSelectionStart = 0;
					this.mSelectionEnd = 0;
				}
				else
				{
					this.mSelectionStart = value.Length;
					this.mSelectionEnd = this.mSelectionStart;
				}
			}
			else if (this.mStarted)
			{
				this.SaveToPlayerPrefs(value);
			}
			this.UpdateLabel();
			if (notify)
			{
				this.ExecuteOnChange();
			}
		}
	}

	// Token: 0x17000130 RID: 304
	// (get) Token: 0x0600090C RID: 2316 RVA: 0x00042AE8 File Offset: 0x00040CE8
	// (set) Token: 0x0600090D RID: 2317 RVA: 0x00042AF0 File Offset: 0x00040CF0
	[Obsolete("Use UIInput.isSelected instead")]
	public bool selected
	{
		get
		{
			return this.isSelected;
		}
		set
		{
			this.isSelected = value;
		}
	}

	// Token: 0x17000131 RID: 305
	// (get) Token: 0x0600090E RID: 2318 RVA: 0x00042AFC File Offset: 0x00040CFC
	// (set) Token: 0x0600090F RID: 2319 RVA: 0x00042B0C File Offset: 0x00040D0C
	public bool isSelected
	{
		get
		{
			return UIInput.selection == this;
		}
		set
		{
			if (!value)
			{
				if (this.isSelected)
				{
					UICamera.selectedObject = null;
				}
			}
			else
			{
				UICamera.selectedObject = base.gameObject;
			}
		}
	}

	// Token: 0x17000132 RID: 306
	// (get) Token: 0x06000910 RID: 2320 RVA: 0x00042B38 File Offset: 0x00040D38
	// (set) Token: 0x06000911 RID: 2321 RVA: 0x00042B88 File Offset: 0x00040D88
	public int cursorPosition
	{
		get
		{
			if (UIInput.mKeyboard != null && !this.inputShouldBeHidden)
			{
				return this.value.Length;
			}
			return (!this.isSelected) ? this.value.Length : this.mSelectionEnd;
		}
		set
		{
			if (this.isSelected)
			{
				if (UIInput.mKeyboard != null && !this.inputShouldBeHidden)
				{
					return;
				}
				this.mSelectionEnd = value;
				this.UpdateLabel();
			}
		}
	}

	// Token: 0x17000133 RID: 307
	// (get) Token: 0x06000912 RID: 2322 RVA: 0x00042BC4 File Offset: 0x00040DC4
	// (set) Token: 0x06000913 RID: 2323 RVA: 0x00042C0C File Offset: 0x00040E0C
	public int selectionStart
	{
		get
		{
			if (UIInput.mKeyboard != null && !this.inputShouldBeHidden)
			{
				return 0;
			}
			return (!this.isSelected) ? this.value.Length : this.mSelectionStart;
		}
		set
		{
			if (this.isSelected)
			{
				if (UIInput.mKeyboard != null && !this.inputShouldBeHidden)
				{
					return;
				}
				this.mSelectionStart = value;
				this.UpdateLabel();
			}
		}
	}

	// Token: 0x17000134 RID: 308
	// (get) Token: 0x06000914 RID: 2324 RVA: 0x00042C48 File Offset: 0x00040E48
	// (set) Token: 0x06000915 RID: 2325 RVA: 0x00042C98 File Offset: 0x00040E98
	public int selectionEnd
	{
		get
		{
			if (UIInput.mKeyboard != null && !this.inputShouldBeHidden)
			{
				return this.value.Length;
			}
			return (!this.isSelected) ? this.value.Length : this.mSelectionEnd;
		}
		set
		{
			if (this.isSelected)
			{
				if (UIInput.mKeyboard != null && !this.inputShouldBeHidden)
				{
					return;
				}
				this.mSelectionEnd = value;
				this.UpdateLabel();
			}
		}
	}

	// Token: 0x17000135 RID: 309
	// (get) Token: 0x06000916 RID: 2326 RVA: 0x00042CD4 File Offset: 0x00040ED4
	public UITexture caret
	{
		get
		{
			return this.mCaret;
		}
	}

	// Token: 0x06000917 RID: 2327 RVA: 0x00042CDC File Offset: 0x00040EDC
	public string Validate(string val)
	{
		if (string.IsNullOrEmpty(val))
		{
			return string.Empty;
		}
		StringBuilder stringBuilder = new StringBuilder(val.Length);
		for (int i = 0; i < val.Length; i++)
		{
			char c = val.get_Chars(i);
			if (this.onValidate != null)
			{
				c = this.onValidate(stringBuilder.ToString(), stringBuilder.Length, c);
			}
			else if (this.validation != UIInput.Validation.None)
			{
				c = this.Validate(stringBuilder.ToString(), stringBuilder.Length, c);
			}
			if (c != '\0')
			{
				stringBuilder.Append(c);
			}
		}
		if (this.characterLimit > 0 && stringBuilder.Length > this.characterLimit)
		{
			return stringBuilder.ToString(0, this.characterLimit);
		}
		return stringBuilder.ToString();
	}

	// Token: 0x06000918 RID: 2328 RVA: 0x00042DAC File Offset: 0x00040FAC
	public void Start()
	{
		if (this.mStarted)
		{
			return;
		}
		if (this.selectOnTab != null)
		{
			UIKeyNavigation uikeyNavigation = base.GetComponent<UIKeyNavigation>();
			if (uikeyNavigation == null)
			{
				uikeyNavigation = base.gameObject.AddComponent<UIKeyNavigation>();
				uikeyNavigation.onDown = this.selectOnTab;
			}
			this.selectOnTab = null;
			NGUITools.SetDirty(this);
		}
		if (this.mLoadSavedValue && !string.IsNullOrEmpty(this.savedAs))
		{
			this.LoadValue();
		}
		else
		{
			this.value = this.mValue.Replace("\\n", "\n");
		}
		this.mStarted = true;
	}

	// Token: 0x06000919 RID: 2329 RVA: 0x00042E58 File Offset: 0x00041058
	protected void Init()
	{
		if (this.mDoInit && this.label != null)
		{
			this.mDoInit = false;
			this.mDefaultText = this.label.text;
			this.mDefaultColor = this.label.color;
			this.label.supportEncoding = false;
			this.mEllipsis = this.label.overflowEllipsis;
			if (this.label.alignment == NGUIText.Alignment.Justified)
			{
				this.label.alignment = NGUIText.Alignment.Left;
				Debug.LogWarning("Input fields using labels with justified alignment are not supported at this time", this);
			}
			this.mAlignment = this.label.alignment;
			this.mPosition = this.label.cachedTransform.localPosition.x;
			this.UpdateLabel();
		}
	}

	// Token: 0x0600091A RID: 2330 RVA: 0x00042F24 File Offset: 0x00041124
	protected void SaveToPlayerPrefs(string val)
	{
		if (!string.IsNullOrEmpty(this.savedAs))
		{
			if (string.IsNullOrEmpty(val))
			{
				PlayerPrefs.DeleteKey(this.savedAs);
			}
			else
			{
				PlayerPrefs.SetString(this.savedAs, val);
			}
		}
	}

	// Token: 0x0600091B RID: 2331 RVA: 0x00042F60 File Offset: 0x00041160
	protected virtual void OnSelect(bool isSelected)
	{
		if (isSelected)
		{
			this.OnSelectEvent();
		}
		else
		{
			this.OnDeselectEvent();
		}
	}

	// Token: 0x0600091C RID: 2332 RVA: 0x00042F7C File Offset: 0x0004117C
	protected void OnSelectEvent()
	{
		this.mSelectTime = Time.frameCount;
		UIInput.selection = this;
		if (this.mDoInit)
		{
			this.Init();
		}
		if (this.label != null)
		{
			this.mEllipsis = this.label.overflowEllipsis;
			this.label.overflowEllipsis = false;
		}
		if (this.label != null && NGUITools.GetActive(this))
		{
			this.mSelectMe = Time.frameCount;
		}
	}

	// Token: 0x0600091D RID: 2333 RVA: 0x00043000 File Offset: 0x00041200
	protected void OnDeselectEvent()
	{
		if (this.mDoInit)
		{
			this.Init();
		}
		if (this.label != null)
		{
			this.label.overflowEllipsis = this.mEllipsis;
		}
		if (this.label != null && NGUITools.GetActive(this))
		{
			this.mValue = this.value;
			if (UIInput.mKeyboard != null)
			{
				UIInput.mWaitForKeyboard = false;
				UIInput.mKeyboard.active = false;
				UIInput.mKeyboard = null;
			}
			if (string.IsNullOrEmpty(this.mValue))
			{
				this.label.text = this.mDefaultText;
				this.label.color = this.mDefaultColor;
			}
			else
			{
				this.label.text = this.mValue;
			}
			Input.imeCompositionMode = 0;
			this.label.alignment = this.mAlignment;
		}
		UIInput.selection = null;
		this.UpdateLabel();
	}

	// Token: 0x0600091E RID: 2334 RVA: 0x000430F4 File Offset: 0x000412F4
	protected virtual void Update()
	{
		if (!this.isSelected || this.mSelectTime == Time.frameCount)
		{
			return;
		}
		if (this.mDoInit)
		{
			this.Init();
		}
		if (UIInput.mWaitForKeyboard)
		{
			if (UIInput.mKeyboard != null && !UIInput.mKeyboard.active)
			{
				return;
			}
			UIInput.mWaitForKeyboard = false;
		}
		if (this.mSelectMe != -1 && this.mSelectMe != Time.frameCount)
		{
			this.mSelectMe = -1;
			this.mSelectionEnd = ((!string.IsNullOrEmpty(this.mValue)) ? this.mValue.Length : 0);
			UIInput.mDrawStart = 0;
			this.mSelectionStart = ((!this.selectAllTextOnFocus) ? this.mSelectionEnd : 0);
			this.label.color = this.activeTextColor;
			RuntimePlatform platform = Application.platform;
			if (platform == 8 || platform == 11 || platform == 21 || platform == 22 || platform == 20 || platform == 19 || platform == 18)
			{
				TouchScreenKeyboardType touchScreenKeyboardType;
				string text;
				if (this.inputShouldBeHidden)
				{
					TouchScreenKeyboard.hideInput = true;
					touchScreenKeyboardType = this.keyboardType;
					text = "|";
				}
				else if (this.inputType == UIInput.InputType.Password)
				{
					TouchScreenKeyboard.hideInput = false;
					touchScreenKeyboardType = this.keyboardType;
					text = this.mValue;
					this.mSelectionStart = this.mSelectionEnd;
				}
				else
				{
					TouchScreenKeyboard.hideInput = false;
					touchScreenKeyboardType = this.keyboardType;
					text = this.mValue;
					this.mSelectionStart = this.mSelectionEnd;
				}
				UIInput.mWaitForKeyboard = true;
				UIInput.mKeyboard = ((this.inputType != UIInput.InputType.Password) ? TouchScreenKeyboard.Open(text, touchScreenKeyboardType, !this.inputShouldBeHidden && this.inputType == UIInput.InputType.AutoCorrect, this.label.multiLine && !this.hideInput, false, false, this.defaultText) : TouchScreenKeyboard.Open(text, touchScreenKeyboardType, false, false, true));
			}
			else
			{
				Vector2 compositionCursorPos = (!(UICamera.current != null) || !(UICamera.current.cachedCamera != null)) ? this.label.worldCorners[0] : UICamera.current.cachedCamera.WorldToScreenPoint(this.label.worldCorners[0]);
				compositionCursorPos.y = (float)Screen.height - compositionCursorPos.y;
				Input.imeCompositionMode = 1;
				Input.compositionCursorPos = compositionCursorPos;
			}
			this.UpdateLabel();
			if (string.IsNullOrEmpty(Input.inputString))
			{
				return;
			}
		}
		if (UIInput.mKeyboard != null)
		{
			string text2 = (!UIInput.mKeyboard.done && UIInput.mKeyboard.active) ? UIInput.mKeyboard.text : this.mCached;
			if (this.inputShouldBeHidden)
			{
				if (text2 != "|")
				{
					if (!string.IsNullOrEmpty(text2))
					{
						this.Insert(text2.Substring(1));
					}
					else if (!UIInput.mKeyboard.done && UIInput.mKeyboard.active)
					{
						this.DoBackspace();
					}
					UIInput.mKeyboard.text = "|";
				}
			}
			else if (this.mCached != text2)
			{
				this.mCached = text2;
				if (!UIInput.mKeyboard.done && UIInput.mKeyboard.active)
				{
					this.value = text2;
				}
			}
			if (UIInput.mKeyboard.done || !UIInput.mKeyboard.active)
			{
				if (!UIInput.mKeyboard.wasCanceled)
				{
					this.Submit();
				}
				UIInput.mKeyboard = null;
				this.isSelected = false;
				this.mCached = string.Empty;
			}
		}
		else
		{
			string compositionString = Input.compositionString;
			if (string.IsNullOrEmpty(compositionString) && !string.IsNullOrEmpty(Input.inputString))
			{
				string inputString = Input.inputString;
				for (int i = 0; i < inputString.Length; i++)
				{
					char c = inputString.get_Chars(i);
					if (c >= ' ')
					{
						if (c != '')
						{
							if (c != '')
							{
								if (c != '')
								{
									if (c != '')
									{
										this.Insert(c.ToString());
									}
								}
							}
						}
					}
				}
			}
			if (UIInput.mLastIME != compositionString)
			{
				this.mSelectionEnd = ((!string.IsNullOrEmpty(compositionString)) ? (this.mValue.Length + compositionString.Length) : this.mSelectionStart);
				UIInput.mLastIME = compositionString;
				this.UpdateLabel();
				this.ExecuteOnChange();
			}
		}
		if (this.mCaret != null && this.mNextBlink < RealTime.time)
		{
			this.mNextBlink = RealTime.time + 0.5f;
			this.mCaret.enabled = !this.mCaret.enabled;
		}
		if (this.isSelected && this.mLastAlpha != this.label.finalAlpha)
		{
			this.UpdateLabel();
		}
		if (this.mCam == null)
		{
			this.mCam = UICamera.FindCameraForLayer(base.gameObject.layer);
		}
		if (this.mCam != null)
		{
			bool flag = false;
			if (this.label.multiLine)
			{
				bool flag2 = Input.GetKey(306) || Input.GetKey(305);
				if (this.onReturnKey == UIInput.OnReturnKey.Submit)
				{
					flag = flag2;
				}
				else
				{
					flag = !flag2;
				}
			}
			if (UICamera.GetKeyDown(this.mCam.submitKey0) || (this.mCam.submitKey0 == 13 && UICamera.GetKeyDown(271)))
			{
				if (flag)
				{
					this.Insert("\n");
				}
				else
				{
					if (UICamera.controller.current != null)
					{
						UICamera.controller.clickNotification = UICamera.ClickNotification.None;
					}
					UICamera.currentKey = this.mCam.submitKey0;
					this.Submit();
				}
			}
			if (UICamera.GetKeyDown(this.mCam.submitKey1) || (this.mCam.submitKey1 == 13 && UICamera.GetKeyDown(271)))
			{
				if (flag)
				{
					this.Insert("\n");
				}
				else
				{
					if (UICamera.controller.current != null)
					{
						UICamera.controller.clickNotification = UICamera.ClickNotification.None;
					}
					UICamera.currentKey = this.mCam.submitKey1;
					this.Submit();
				}
			}
			if (!this.mCam.useKeyboard && UICamera.GetKeyUp(9))
			{
				this.OnKey(9);
			}
		}
	}

	// Token: 0x0600091F RID: 2335 RVA: 0x00043818 File Offset: 0x00041A18
	private void OnKey(KeyCode key)
	{
		int frameCount = Time.frameCount;
		if (UIInput.mIgnoreKey == frameCount)
		{
			return;
		}
		if (this.mCam != null && (key == this.mCam.cancelKey0 || key == this.mCam.cancelKey1))
		{
			UIInput.mIgnoreKey = frameCount;
			this.isSelected = false;
		}
		else if (key == 9)
		{
			UIInput.mIgnoreKey = frameCount;
			this.isSelected = false;
			UIKeyNavigation component = base.GetComponent<UIKeyNavigation>();
			if (component != null)
			{
				component.OnKey(9);
			}
		}
	}

	// Token: 0x06000920 RID: 2336 RVA: 0x000438AC File Offset: 0x00041AAC
	protected void DoBackspace()
	{
		if (!string.IsNullOrEmpty(this.mValue))
		{
			if (this.mSelectionStart == this.mSelectionEnd)
			{
				if (this.mSelectionStart < 1)
				{
					return;
				}
				this.mSelectionEnd--;
			}
			this.Insert(string.Empty);
		}
	}

	// Token: 0x06000921 RID: 2337 RVA: 0x00043900 File Offset: 0x00041B00
	protected virtual void Insert(string text)
	{
		string leftText = this.GetLeftText();
		string rightText = this.GetRightText();
		int length = rightText.Length;
		StringBuilder stringBuilder = new StringBuilder(leftText.Length + rightText.Length + text.Length);
		stringBuilder.Append(leftText);
		int i = 0;
		int length2 = text.Length;
		while (i < length2)
		{
			char c = text.get_Chars(i);
			if (c == '\b')
			{
				this.DoBackspace();
			}
			else
			{
				if (this.characterLimit > 0 && stringBuilder.Length + length >= this.characterLimit)
				{
					break;
				}
				if (this.onValidate != null)
				{
					c = this.onValidate(stringBuilder.ToString(), stringBuilder.Length, c);
				}
				else if (this.validation != UIInput.Validation.None)
				{
					c = this.Validate(stringBuilder.ToString(), stringBuilder.Length, c);
				}
				if (c != '\0')
				{
					stringBuilder.Append(c);
				}
			}
			i++;
		}
		this.mSelectionStart = stringBuilder.Length;
		this.mSelectionEnd = this.mSelectionStart;
		int j = 0;
		int length3 = rightText.Length;
		while (j < length3)
		{
			char c2 = rightText.get_Chars(j);
			if (this.onValidate != null)
			{
				c2 = this.onValidate(stringBuilder.ToString(), stringBuilder.Length, c2);
			}
			else if (this.validation != UIInput.Validation.None)
			{
				c2 = this.Validate(stringBuilder.ToString(), stringBuilder.Length, c2);
			}
			if (c2 != '\0')
			{
				stringBuilder.Append(c2);
			}
			j++;
		}
		this.mValue = stringBuilder.ToString();
		this.UpdateLabel();
		this.ExecuteOnChange();
	}

	// Token: 0x06000922 RID: 2338 RVA: 0x00043AB8 File Offset: 0x00041CB8
	protected string GetLeftText()
	{
		int num = Mathf.Min(this.mSelectionStart, this.mSelectionEnd);
		return (!string.IsNullOrEmpty(this.mValue) && num >= 0) ? this.mValue.Substring(0, num) : string.Empty;
	}

	// Token: 0x06000923 RID: 2339 RVA: 0x00043B08 File Offset: 0x00041D08
	protected string GetRightText()
	{
		int num = Mathf.Max(this.mSelectionStart, this.mSelectionEnd);
		return (!string.IsNullOrEmpty(this.mValue) && num < this.mValue.Length) ? this.mValue.Substring(num) : string.Empty;
	}

	// Token: 0x06000924 RID: 2340 RVA: 0x00043B60 File Offset: 0x00041D60
	protected string GetSelection()
	{
		if (string.IsNullOrEmpty(this.mValue) || this.mSelectionStart == this.mSelectionEnd)
		{
			return string.Empty;
		}
		int num = Mathf.Min(this.mSelectionStart, this.mSelectionEnd);
		int num2 = Mathf.Max(this.mSelectionStart, this.mSelectionEnd);
		return this.mValue.Substring(num, num2 - num);
	}

	// Token: 0x06000925 RID: 2341 RVA: 0x00043BC8 File Offset: 0x00041DC8
	protected int GetCharUnderMouse()
	{
		Vector3[] worldCorners = this.label.worldCorners;
		Ray currentRay = UICamera.currentRay;
		Plane plane;
		plane..ctor(worldCorners[0], worldCorners[1], worldCorners[2]);
		float num;
		return (!plane.Raycast(currentRay, ref num)) ? 0 : (UIInput.mDrawStart + this.label.GetCharacterIndexAtPosition(currentRay.GetPoint(num), false));
	}

	// Token: 0x06000926 RID: 2342 RVA: 0x00043C44 File Offset: 0x00041E44
	protected virtual void OnPress(bool isPressed)
	{
		if (isPressed && this.isSelected && this.label != null && (UICamera.currentScheme == UICamera.ControlScheme.Mouse || UICamera.currentScheme == UICamera.ControlScheme.Touch))
		{
			this.selectionEnd = this.GetCharUnderMouse();
			if (!Input.GetKey(304) && !Input.GetKey(303))
			{
				this.selectionStart = this.mSelectionEnd;
			}
		}
	}

	// Token: 0x06000927 RID: 2343 RVA: 0x00043CC0 File Offset: 0x00041EC0
	protected virtual void OnDrag(Vector2 delta)
	{
		if (this.label != null && (UICamera.currentScheme == UICamera.ControlScheme.Mouse || UICamera.currentScheme == UICamera.ControlScheme.Touch))
		{
			this.selectionEnd = this.GetCharUnderMouse();
		}
	}

	// Token: 0x06000928 RID: 2344 RVA: 0x00043D00 File Offset: 0x00041F00
	private void OnDisable()
	{
		this.Cleanup();
	}

	// Token: 0x06000929 RID: 2345 RVA: 0x00043D08 File Offset: 0x00041F08
	protected virtual void Cleanup()
	{
		if (this.mHighlight)
		{
			this.mHighlight.enabled = false;
		}
		if (this.mCaret)
		{
			this.mCaret.enabled = false;
		}
		if (this.mBlankTex)
		{
			NGUITools.Destroy(this.mBlankTex);
			this.mBlankTex = null;
		}
	}

	// Token: 0x0600092A RID: 2346 RVA: 0x00043D70 File Offset: 0x00041F70
	public void Submit()
	{
		if (NGUITools.GetActive(this))
		{
			this.mValue = this.value;
			if (UIInput.current == null)
			{
				UIInput.current = this;
				EventDelegate.Execute(this.onSubmit);
				UIInput.current = null;
			}
			this.SaveToPlayerPrefs(this.mValue);
		}
	}

	// Token: 0x0600092B RID: 2347 RVA: 0x00043DC8 File Offset: 0x00041FC8
	public void UpdateLabel()
	{
		if (this.label != null)
		{
			if (this.mDoInit)
			{
				this.Init();
			}
			bool isSelected = this.isSelected;
			string value = this.value;
			bool flag = string.IsNullOrEmpty(value) && string.IsNullOrEmpty(Input.compositionString);
			this.label.color = ((!flag || isSelected) ? this.activeTextColor : this.mDefaultColor);
			string text;
			if (flag)
			{
				text = ((!isSelected) ? this.mDefaultText : string.Empty);
				this.label.alignment = this.mAlignment;
			}
			else
			{
				if (this.inputType == UIInput.InputType.Password)
				{
					text = string.Empty;
					string text2 = "*";
					if (this.label.bitmapFont != null && this.label.bitmapFont.bmFont != null && this.label.bitmapFont.bmFont.GetGlyph(42) == null)
					{
						text2 = "x";
					}
					int i = 0;
					int length = value.Length;
					while (i < length)
					{
						text += text2;
						i++;
					}
				}
				else
				{
					text = value;
				}
				int num = (!isSelected) ? 0 : Mathf.Min(text.Length, this.cursorPosition);
				string text3 = text.Substring(0, num);
				if (isSelected)
				{
					text3 += Input.compositionString;
				}
				text = text3 + text.Substring(num, text.Length - num);
				if (isSelected && this.label.overflowMethod == UILabel.Overflow.ClampContent && this.label.maxLineCount == 1)
				{
					int num2 = this.label.CalculateOffsetToFit(text);
					if (num2 == 0)
					{
						UIInput.mDrawStart = 0;
						this.label.alignment = this.mAlignment;
					}
					else if (num < UIInput.mDrawStart)
					{
						UIInput.mDrawStart = num;
						this.label.alignment = NGUIText.Alignment.Left;
					}
					else if (num2 < UIInput.mDrawStart)
					{
						UIInput.mDrawStart = num2;
						this.label.alignment = NGUIText.Alignment.Left;
					}
					else
					{
						num2 = this.label.CalculateOffsetToFit(text.Substring(0, num));
						if (num2 > UIInput.mDrawStart)
						{
							UIInput.mDrawStart = num2;
							this.label.alignment = NGUIText.Alignment.Right;
						}
					}
					if (UIInput.mDrawStart != 0)
					{
						text = text.Substring(UIInput.mDrawStart, text.Length - UIInput.mDrawStart);
					}
				}
				else
				{
					UIInput.mDrawStart = 0;
					this.label.alignment = this.mAlignment;
				}
			}
			this.label.text = text;
			if (isSelected && (UIInput.mKeyboard == null || this.inputShouldBeHidden))
			{
				int num3 = this.mSelectionStart - UIInput.mDrawStart;
				int num4 = this.mSelectionEnd - UIInput.mDrawStart;
				if (this.mBlankTex == null)
				{
					this.mBlankTex = new Texture2D(2, 2, 5, false);
					for (int j = 0; j < 2; j++)
					{
						for (int k = 0; k < 2; k++)
						{
							this.mBlankTex.SetPixel(k, j, Color.white);
						}
					}
					this.mBlankTex.Apply();
				}
				if (num3 != num4)
				{
					if (this.mHighlight == null)
					{
						this.mHighlight = this.label.cachedGameObject.AddWidget(int.MaxValue);
						this.mHighlight.name = "Input Highlight";
						this.mHighlight.mainTexture = this.mBlankTex;
						this.mHighlight.fillGeometry = false;
						this.mHighlight.pivot = this.label.pivot;
						this.mHighlight.SetAnchor(this.label.cachedTransform);
					}
					else
					{
						this.mHighlight.pivot = this.label.pivot;
						this.mHighlight.mainTexture = this.mBlankTex;
						this.mHighlight.MarkAsChanged();
						this.mHighlight.enabled = true;
					}
				}
				if (this.mCaret == null)
				{
					this.mCaret = this.label.cachedGameObject.AddWidget(int.MaxValue);
					this.mCaret.name = "Input Caret";
					this.mCaret.mainTexture = this.mBlankTex;
					this.mCaret.fillGeometry = false;
					this.mCaret.pivot = this.label.pivot;
					this.mCaret.SetAnchor(this.label.cachedTransform);
				}
				else
				{
					this.mCaret.pivot = this.label.pivot;
					this.mCaret.mainTexture = this.mBlankTex;
					this.mCaret.MarkAsChanged();
					this.mCaret.enabled = true;
				}
				if (num3 != num4)
				{
					this.label.PrintOverlay(num3, num4, this.mCaret.geometry, this.mHighlight.geometry, this.caretColor, this.selectionColor);
					this.mHighlight.enabled = this.mHighlight.geometry.hasVertices;
				}
				else
				{
					this.label.PrintOverlay(num3, num4, this.mCaret.geometry, null, this.caretColor, this.selectionColor);
					if (this.mHighlight != null)
					{
						this.mHighlight.enabled = false;
					}
				}
				this.mNextBlink = RealTime.time + 0.5f;
				this.mLastAlpha = this.label.finalAlpha;
			}
			else
			{
				this.Cleanup();
			}
		}
	}

	// Token: 0x0600092C RID: 2348 RVA: 0x0004438C File Offset: 0x0004258C
	protected char Validate(string text, int pos, char ch)
	{
		if (this.validation == UIInput.Validation.None || !base.enabled)
		{
			return ch;
		}
		if (this.validation == UIInput.Validation.Integer)
		{
			if (ch >= '0' && ch <= '9')
			{
				return ch;
			}
			if (ch == '-' && pos == 0 && !text.Contains("-"))
			{
				return ch;
			}
		}
		else if (this.validation == UIInput.Validation.Float)
		{
			if (ch >= '0' && ch <= '9')
			{
				return ch;
			}
			if (ch == '-' && pos == 0 && !text.Contains("-"))
			{
				return ch;
			}
			if (ch == '.' && !text.Contains("."))
			{
				return ch;
			}
		}
		else if (this.validation == UIInput.Validation.Alphanumeric)
		{
			if (ch >= 'A' && ch <= 'Z')
			{
				return ch;
			}
			if (ch >= 'a' && ch <= 'z')
			{
				return ch;
			}
			if (ch >= '0' && ch <= '9')
			{
				return ch;
			}
		}
		else if (this.validation == UIInput.Validation.Username)
		{
			if (ch >= 'A' && ch <= 'Z')
			{
				return ch - 'A' + 'a';
			}
			if (ch >= 'a' && ch <= 'z')
			{
				return ch;
			}
			if (ch >= '0' && ch <= '9')
			{
				return ch;
			}
		}
		else if (this.validation == UIInput.Validation.Filename)
		{
			if (ch == ':')
			{
				return '\0';
			}
			if (ch == '/')
			{
				return '\0';
			}
			if (ch == '\\')
			{
				return '\0';
			}
			if (ch == '<')
			{
				return '\0';
			}
			if (ch == '>')
			{
				return '\0';
			}
			if (ch == '|')
			{
				return '\0';
			}
			if (ch == '^')
			{
				return '\0';
			}
			if (ch == '*')
			{
				return '\0';
			}
			if (ch == ';')
			{
				return '\0';
			}
			if (ch == '"')
			{
				return '\0';
			}
			if (ch == '`')
			{
				return '\0';
			}
			if (ch == '\t')
			{
				return '\0';
			}
			if (ch == '\n')
			{
				return '\0';
			}
			return ch;
		}
		else if (this.validation == UIInput.Validation.Name)
		{
			char c = (text.Length <= 0) ? ' ' : text.get_Chars(Mathf.Clamp(pos, 0, text.Length - 1));
			char c2 = (text.Length <= 0) ? '\n' : text.get_Chars(Mathf.Clamp(pos + 1, 0, text.Length - 1));
			if (ch >= 'a' && ch <= 'z')
			{
				if (c == ' ')
				{
					return ch - 'a' + 'A';
				}
				return ch;
			}
			else if (ch >= 'A' && ch <= 'Z')
			{
				if (c != ' ' && c != '\'')
				{
					return ch - 'A' + 'a';
				}
				return ch;
			}
			else if (ch == '\'')
			{
				if (c != ' ' && c != '\'' && c2 != '\'' && !text.Contains("'"))
				{
					return ch;
				}
			}
			else if (ch == ' ' && c != ' ' && c != '\'' && c2 != ' ' && c2 != '\'')
			{
				return ch;
			}
		}
		return '\0';
	}

	// Token: 0x0600092D RID: 2349 RVA: 0x00044688 File Offset: 0x00042888
	protected void ExecuteOnChange()
	{
		if (UIInput.current == null && EventDelegate.IsValid(this.onChange))
		{
			UIInput.current = this;
			EventDelegate.Execute(this.onChange);
			UIInput.current = null;
		}
	}

	// Token: 0x0600092E RID: 2350 RVA: 0x000446C4 File Offset: 0x000428C4
	public void RemoveFocus()
	{
		this.isSelected = false;
	}

	// Token: 0x0600092F RID: 2351 RVA: 0x000446D0 File Offset: 0x000428D0
	public void SaveValue()
	{
		this.SaveToPlayerPrefs(this.mValue);
	}

	// Token: 0x06000930 RID: 2352 RVA: 0x000446E0 File Offset: 0x000428E0
	public void LoadValue()
	{
		if (!string.IsNullOrEmpty(this.savedAs))
		{
			string text = this.mValue.Replace("\\n", "\n");
			this.mValue = string.Empty;
			this.value = ((!PlayerPrefs.HasKey(this.savedAs)) ? text : PlayerPrefs.GetString(this.savedAs));
		}
	}

	// Token: 0x04000870 RID: 2160
	public static UIInput current;

	// Token: 0x04000871 RID: 2161
	public static UIInput selection;

	// Token: 0x04000872 RID: 2162
	public UILabel label;

	// Token: 0x04000873 RID: 2163
	public UIInput.InputType inputType;

	// Token: 0x04000874 RID: 2164
	public UIInput.OnReturnKey onReturnKey;

	// Token: 0x04000875 RID: 2165
	public UIInput.KeyboardType keyboardType;

	// Token: 0x04000876 RID: 2166
	public bool hideInput;

	// Token: 0x04000877 RID: 2167
	[NonSerialized]
	public bool selectAllTextOnFocus = true;

	// Token: 0x04000878 RID: 2168
	public UIInput.Validation validation;

	// Token: 0x04000879 RID: 2169
	public int characterLimit;

	// Token: 0x0400087A RID: 2170
	public string savedAs;

	// Token: 0x0400087B RID: 2171
	[HideInInspector]
	[SerializeField]
	private GameObject selectOnTab;

	// Token: 0x0400087C RID: 2172
	public Color activeTextColor = Color.white;

	// Token: 0x0400087D RID: 2173
	public Color caretColor = new Color(1f, 1f, 1f, 0.8f);

	// Token: 0x0400087E RID: 2174
	public Color selectionColor = new Color(1f, 0.8745098f, 0.5529412f, 0.5f);

	// Token: 0x0400087F RID: 2175
	public List<EventDelegate> onSubmit = new List<EventDelegate>();

	// Token: 0x04000880 RID: 2176
	public List<EventDelegate> onChange = new List<EventDelegate>();

	// Token: 0x04000881 RID: 2177
	public UIInput.OnValidate onValidate;

	// Token: 0x04000882 RID: 2178
	[HideInInspector]
	[SerializeField]
	protected string mValue;

	// Token: 0x04000883 RID: 2179
	[NonSerialized]
	protected string mDefaultText = string.Empty;

	// Token: 0x04000884 RID: 2180
	[NonSerialized]
	protected Color mDefaultColor = Color.white;

	// Token: 0x04000885 RID: 2181
	[NonSerialized]
	protected float mPosition;

	// Token: 0x04000886 RID: 2182
	[NonSerialized]
	protected bool mDoInit = true;

	// Token: 0x04000887 RID: 2183
	[NonSerialized]
	protected NGUIText.Alignment mAlignment = NGUIText.Alignment.Left;

	// Token: 0x04000888 RID: 2184
	[NonSerialized]
	protected bool mLoadSavedValue = true;

	// Token: 0x04000889 RID: 2185
	protected static int mDrawStart;

	// Token: 0x0400088A RID: 2186
	protected static string mLastIME = string.Empty;

	// Token: 0x0400088B RID: 2187
	protected static TouchScreenKeyboard mKeyboard;

	// Token: 0x0400088C RID: 2188
	private static bool mWaitForKeyboard;

	// Token: 0x0400088D RID: 2189
	[NonSerialized]
	protected int mSelectionStart;

	// Token: 0x0400088E RID: 2190
	[NonSerialized]
	protected int mSelectionEnd;

	// Token: 0x0400088F RID: 2191
	[NonSerialized]
	protected UITexture mHighlight;

	// Token: 0x04000890 RID: 2192
	[NonSerialized]
	protected UITexture mCaret;

	// Token: 0x04000891 RID: 2193
	[NonSerialized]
	protected Texture2D mBlankTex;

	// Token: 0x04000892 RID: 2194
	[NonSerialized]
	protected float mNextBlink;

	// Token: 0x04000893 RID: 2195
	[NonSerialized]
	protected float mLastAlpha;

	// Token: 0x04000894 RID: 2196
	[NonSerialized]
	protected string mCached = string.Empty;

	// Token: 0x04000895 RID: 2197
	[NonSerialized]
	protected int mSelectMe = -1;

	// Token: 0x04000896 RID: 2198
	[NonSerialized]
	protected int mSelectTime = -1;

	// Token: 0x04000897 RID: 2199
	[NonSerialized]
	protected bool mStarted;

	// Token: 0x04000898 RID: 2200
	[NonSerialized]
	private UICamera mCam;

	// Token: 0x04000899 RID: 2201
	[NonSerialized]
	private bool mEllipsis;

	// Token: 0x0400089A RID: 2202
	private static int mIgnoreKey;

	// Token: 0x0200011F RID: 287
	public enum InputType
	{
		// Token: 0x0400089C RID: 2204
		Standard,
		// Token: 0x0400089D RID: 2205
		AutoCorrect,
		// Token: 0x0400089E RID: 2206
		Password
	}

	// Token: 0x02000120 RID: 288
	public enum Validation
	{
		// Token: 0x040008A0 RID: 2208
		None,
		// Token: 0x040008A1 RID: 2209
		Integer,
		// Token: 0x040008A2 RID: 2210
		Float,
		// Token: 0x040008A3 RID: 2211
		Alphanumeric,
		// Token: 0x040008A4 RID: 2212
		Username,
		// Token: 0x040008A5 RID: 2213
		Name,
		// Token: 0x040008A6 RID: 2214
		Filename
	}

	// Token: 0x02000121 RID: 289
	public enum KeyboardType
	{
		// Token: 0x040008A8 RID: 2216
		Default,
		// Token: 0x040008A9 RID: 2217
		ASCIICapable,
		// Token: 0x040008AA RID: 2218
		NumbersAndPunctuation,
		// Token: 0x040008AB RID: 2219
		URL,
		// Token: 0x040008AC RID: 2220
		NumberPad,
		// Token: 0x040008AD RID: 2221
		PhonePad,
		// Token: 0x040008AE RID: 2222
		NamePhonePad,
		// Token: 0x040008AF RID: 2223
		EmailAddress
	}

	// Token: 0x02000122 RID: 290
	public enum OnReturnKey
	{
		// Token: 0x040008B1 RID: 2225
		Default,
		// Token: 0x040008B2 RID: 2226
		Submit,
		// Token: 0x040008B3 RID: 2227
		NewLine
	}

	// Token: 0x0200035D RID: 861
	// (Invoke) Token: 0x06001596 RID: 5526
	public delegate char OnValidate(string text, int charIndex, char addedChar);
}
