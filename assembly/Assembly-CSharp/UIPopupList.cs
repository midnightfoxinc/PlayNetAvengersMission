using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000B8 RID: 184
[ExecuteInEditMode]
[AddComponentMenu("NGUI/Interaction/Popup List")]
public class UIPopupList : UIWidgetContainer
{
	// Token: 0x17000038 RID: 56
	// (get) Token: 0x06000491 RID: 1169 RVA: 0x0001DBFC File Offset: 0x0001BDFC
	// (set) Token: 0x06000492 RID: 1170 RVA: 0x0001DC40 File Offset: 0x0001BE40
	public Object ambigiousFont
	{
		get
		{
			if (this.trueTypeFont != null)
			{
				return this.trueTypeFont;
			}
			if (this.bitmapFont != null)
			{
				return this.bitmapFont;
			}
			return this.font;
		}
		set
		{
			if (value is Font)
			{
				this.trueTypeFont = (value as Font);
				this.bitmapFont = null;
				this.font = null;
			}
			else if (value is UIFont)
			{
				this.bitmapFont = (value as UIFont);
				this.trueTypeFont = null;
				this.font = null;
			}
		}
	}

	// Token: 0x17000039 RID: 57
	// (get) Token: 0x06000493 RID: 1171 RVA: 0x0001DC9C File Offset: 0x0001BE9C
	// (set) Token: 0x06000494 RID: 1172 RVA: 0x0001DCA4 File Offset: 0x0001BEA4
	[Obsolete("Use EventDelegate.Add(popup.onChange, YourCallback) instead, and UIPopupList.current.value to determine the state")]
	public UIPopupList.LegacyEvent onSelectionChange
	{
		get
		{
			return this.mLegacyEvent;
		}
		set
		{
			this.mLegacyEvent = value;
		}
	}

	// Token: 0x1700003A RID: 58
	// (get) Token: 0x06000495 RID: 1173 RVA: 0x0001DCB0 File Offset: 0x0001BEB0
	public static bool isOpen
	{
		get
		{
			return UIPopupList.current != null && (UIPopupList.mChild != null || UIPopupList.mFadeOutComplete > Time.unscaledTime);
		}
	}

	// Token: 0x1700003B RID: 59
	// (get) Token: 0x06000496 RID: 1174 RVA: 0x0001DCF0 File Offset: 0x0001BEF0
	// (set) Token: 0x06000497 RID: 1175 RVA: 0x0001DCF8 File Offset: 0x0001BEF8
	public virtual string value
	{
		get
		{
			return this.mSelectedItem;
		}
		set
		{
			this.Set(value, true);
		}
	}

	// Token: 0x1700003C RID: 60
	// (get) Token: 0x06000498 RID: 1176 RVA: 0x0001DD04 File Offset: 0x0001BF04
	public virtual object data
	{
		get
		{
			int num = this.items.IndexOf(this.mSelectedItem);
			return (num <= -1 || num >= this.itemData.Count) ? null : this.itemData[num];
		}
	}

	// Token: 0x1700003D RID: 61
	// (get) Token: 0x06000499 RID: 1177 RVA: 0x0001DD50 File Offset: 0x0001BF50
	public bool isColliderEnabled
	{
		get
		{
			Collider component = base.GetComponent<Collider>();
			if (component != null)
			{
				return component.enabled;
			}
			Collider2D component2 = base.GetComponent<Collider2D>();
			return component2 != null && component2.enabled;
		}
	}

	// Token: 0x1700003E RID: 62
	// (get) Token: 0x0600049A RID: 1178 RVA: 0x0001DD94 File Offset: 0x0001BF94
	// (set) Token: 0x0600049B RID: 1179 RVA: 0x0001DD9C File Offset: 0x0001BF9C
	[Obsolete("Use 'value' instead")]
	public string selection
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

	// Token: 0x1700003F RID: 63
	// (get) Token: 0x0600049C RID: 1180 RVA: 0x0001DDA8 File Offset: 0x0001BFA8
	private bool isValid
	{
		get
		{
			return this.bitmapFont != null || this.trueTypeFont != null;
		}
	}

	// Token: 0x17000040 RID: 64
	// (get) Token: 0x0600049D RID: 1181 RVA: 0x0001DDD8 File Offset: 0x0001BFD8
	private int activeFontSize
	{
		get
		{
			return (!(this.trueTypeFont != null) && !(this.bitmapFont == null)) ? this.bitmapFont.defaultSize : this.fontSize;
		}
	}

	// Token: 0x17000041 RID: 65
	// (get) Token: 0x0600049E RID: 1182 RVA: 0x0001DE20 File Offset: 0x0001C020
	private float activeFontScale
	{
		get
		{
			return (!(this.trueTypeFont != null) && !(this.bitmapFont == null)) ? ((float)this.fontSize / (float)this.bitmapFont.defaultSize) : 1f;
		}
	}

	// Token: 0x0600049F RID: 1183 RVA: 0x0001DE70 File Offset: 0x0001C070
	public void Set(string value, bool notify = true)
	{
		this.mSelectedItem = value;
		if (this.mSelectedItem == null)
		{
			return;
		}
		if (notify && this.mSelectedItem != null)
		{
			this.TriggerCallbacks();
		}
	}

	// Token: 0x060004A0 RID: 1184 RVA: 0x0001DEA8 File Offset: 0x0001C0A8
	public virtual void Clear()
	{
		this.items.Clear();
		this.itemData.Clear();
	}

	// Token: 0x060004A1 RID: 1185 RVA: 0x0001DEC0 File Offset: 0x0001C0C0
	public virtual void AddItem(string text)
	{
		this.items.Add(text);
		this.itemData.Add(null);
	}

	// Token: 0x060004A2 RID: 1186 RVA: 0x0001DEDC File Offset: 0x0001C0DC
	public virtual void AddItem(string text, object data)
	{
		this.items.Add(text);
		this.itemData.Add(data);
	}

	// Token: 0x060004A3 RID: 1187 RVA: 0x0001DEF8 File Offset: 0x0001C0F8
	public virtual void RemoveItem(string text)
	{
		int num = this.items.IndexOf(text);
		if (num != -1)
		{
			this.items.RemoveAt(num);
			this.itemData.RemoveAt(num);
		}
	}

	// Token: 0x060004A4 RID: 1188 RVA: 0x0001DF34 File Offset: 0x0001C134
	public virtual void RemoveItemByData(object data)
	{
		int num = this.itemData.IndexOf(data);
		if (num != -1)
		{
			this.items.RemoveAt(num);
			this.itemData.RemoveAt(num);
		}
	}

	// Token: 0x060004A5 RID: 1189 RVA: 0x0001DF70 File Offset: 0x0001C170
	protected void TriggerCallbacks()
	{
		if (!this.mExecuting)
		{
			this.mExecuting = true;
			UIPopupList uipopupList = UIPopupList.current;
			UIPopupList.current = this;
			if (this.mLegacyEvent != null)
			{
				this.mLegacyEvent(this.mSelectedItem);
			}
			if (EventDelegate.IsValid(this.onChange))
			{
				EventDelegate.Execute(this.onChange);
			}
			else if (this.eventReceiver != null && !string.IsNullOrEmpty(this.functionName))
			{
				this.eventReceiver.SendMessage(this.functionName, this.mSelectedItem, 1);
			}
			UIPopupList.current = uipopupList;
			this.mExecuting = false;
		}
	}

	// Token: 0x060004A6 RID: 1190 RVA: 0x0001E020 File Offset: 0x0001C220
	protected virtual void OnEnable()
	{
		if (EventDelegate.IsValid(this.onChange))
		{
			this.eventReceiver = null;
			this.functionName = null;
		}
		if (this.font != null)
		{
			if (this.font.isDynamic)
			{
				this.trueTypeFont = this.font.dynamicFont;
				this.fontStyle = this.font.dynamicFontStyle;
				this.mUseDynamicFont = true;
			}
			else if (this.bitmapFont == null)
			{
				this.bitmapFont = this.font;
				this.mUseDynamicFont = false;
			}
			this.font = null;
		}
		if (this.textScale != 0f)
		{
			this.fontSize = ((!(this.bitmapFont != null)) ? 16 : Mathf.RoundToInt((float)this.bitmapFont.defaultSize * this.textScale));
			this.textScale = 0f;
		}
		if (this.trueTypeFont == null && this.bitmapFont != null && this.bitmapFont.isDynamic)
		{
			this.trueTypeFont = this.bitmapFont.dynamicFont;
			this.bitmapFont = null;
		}
	}

	// Token: 0x060004A7 RID: 1191 RVA: 0x0001E160 File Offset: 0x0001C360
	protected virtual void OnValidate()
	{
		Font font = this.trueTypeFont;
		UIFont uifont = this.bitmapFont;
		this.bitmapFont = null;
		this.trueTypeFont = null;
		if (font != null && (uifont == null || !this.mUseDynamicFont))
		{
			this.bitmapFont = null;
			this.trueTypeFont = font;
			this.mUseDynamicFont = true;
		}
		else if (uifont != null)
		{
			if (uifont.isDynamic)
			{
				this.trueTypeFont = uifont.dynamicFont;
				this.fontStyle = uifont.dynamicFontStyle;
				this.fontSize = uifont.defaultSize;
				this.mUseDynamicFont = true;
			}
			else
			{
				this.bitmapFont = uifont;
				this.mUseDynamicFont = false;
			}
		}
		else
		{
			this.trueTypeFont = font;
			this.mUseDynamicFont = true;
		}
	}

	// Token: 0x060004A8 RID: 1192 RVA: 0x0001E230 File Offset: 0x0001C430
	public virtual void Start()
	{
		if (this.mStarted)
		{
			return;
		}
		this.mStarted = true;
		if (this.textLabel != null)
		{
			EventDelegate.Add(this.onChange, new EventDelegate.Callback(this.textLabel.SetCurrentSelection));
			this.textLabel = null;
		}
	}

	// Token: 0x060004A9 RID: 1193 RVA: 0x0001E288 File Offset: 0x0001C488
	protected virtual void OnLocalize()
	{
		if (this.isLocalized)
		{
			this.TriggerCallbacks();
		}
	}

	// Token: 0x060004AA RID: 1194 RVA: 0x0001E29C File Offset: 0x0001C49C
	protected virtual void Highlight(UILabel lbl, bool instant)
	{
		if (this.mHighlight != null)
		{
			this.mHighlightedLabel = lbl;
			Vector3 highlightPosition = this.GetHighlightPosition();
			if (!instant && this.isAnimated)
			{
				TweenPosition.Begin(this.mHighlight.gameObject, 0.1f, highlightPosition).method = UITweener.Method.EaseOut;
				if (!this.mTweening)
				{
					this.mTweening = true;
					base.StartCoroutine("UpdateTweenPosition");
				}
			}
			else
			{
				this.mHighlight.cachedTransform.localPosition = highlightPosition;
			}
		}
	}

	// Token: 0x060004AB RID: 1195 RVA: 0x0001E32C File Offset: 0x0001C52C
	protected virtual Vector3 GetHighlightPosition()
	{
		if (this.mHighlightedLabel == null || this.mHighlight == null)
		{
			return Vector3.zero;
		}
		Vector4 border = this.mHighlight.border;
		float num = (!(this.atlas != null)) ? 1f : this.atlas.pixelSize;
		float num2 = border.x * num;
		float num3 = border.w * num;
		return this.mHighlightedLabel.cachedTransform.localPosition + new Vector3(-num2, num3, 1f);
	}

	// Token: 0x060004AC RID: 1196 RVA: 0x0001E3CC File Offset: 0x0001C5CC
	protected virtual IEnumerator UpdateTweenPosition()
	{
		if (this.mHighlight != null && this.mHighlightedLabel != null)
		{
			TweenPosition tp = this.mHighlight.GetComponent<TweenPosition>();
			while (tp != null && tp.enabled)
			{
				tp.to = this.GetHighlightPosition();
				yield return null;
			}
		}
		this.mTweening = false;
		yield break;
	}

	// Token: 0x060004AD RID: 1197 RVA: 0x0001E3E8 File Offset: 0x0001C5E8
	protected virtual void OnItemHover(GameObject go, bool isOver)
	{
		if (isOver)
		{
			UILabel component = go.GetComponent<UILabel>();
			this.Highlight(component, false);
		}
	}

	// Token: 0x060004AE RID: 1198 RVA: 0x0001E40C File Offset: 0x0001C60C
	protected virtual void OnItemPress(GameObject go, bool isPressed)
	{
		if (isPressed)
		{
			this.Select(go.GetComponent<UILabel>(), true);
			UIEventListener component = go.GetComponent<UIEventListener>();
			this.value = (component.parameter as string);
			UIPlaySound[] components = base.GetComponents<UIPlaySound>();
			int i = 0;
			int num = components.Length;
			while (i < num)
			{
				UIPlaySound uiplaySound = components[i];
				if (uiplaySound.trigger == UIPlaySound.Trigger.OnClick)
				{
					NGUITools.PlaySound(uiplaySound.audioClip, uiplaySound.volume, 1f);
				}
				i++;
			}
			this.CloseSelf();
		}
	}

	// Token: 0x060004AF RID: 1199 RVA: 0x0001E494 File Offset: 0x0001C694
	private void Select(UILabel lbl, bool instant)
	{
		this.Highlight(lbl, instant);
	}

	// Token: 0x060004B0 RID: 1200 RVA: 0x0001E4A0 File Offset: 0x0001C6A0
	protected virtual void OnNavigate(KeyCode key)
	{
		if (base.enabled && UIPopupList.current == this)
		{
			int num = this.mLabelList.IndexOf(this.mHighlightedLabel);
			if (num == -1)
			{
				num = 0;
			}
			if (key == 273)
			{
				if (num > 0)
				{
					this.Select(this.mLabelList[num - 1], false);
				}
			}
			else if (key == 274 && num + 1 < this.mLabelList.Count)
			{
				this.Select(this.mLabelList[num + 1], false);
			}
		}
	}

	// Token: 0x060004B1 RID: 1201 RVA: 0x0001E548 File Offset: 0x0001C748
	protected virtual void OnKey(KeyCode key)
	{
		if (base.enabled && UIPopupList.current == this && (key == UICamera.current.cancelKey0 || key == UICamera.current.cancelKey1))
		{
			this.OnSelect(false);
		}
	}

	// Token: 0x060004B2 RID: 1202 RVA: 0x0001E598 File Offset: 0x0001C798
	protected virtual void OnDisable()
	{
		this.CloseSelf();
	}

	// Token: 0x060004B3 RID: 1203 RVA: 0x0001E5A0 File Offset: 0x0001C7A0
	protected virtual void OnSelect(bool isSelected)
	{
		if (!isSelected)
		{
			this.CloseSelf();
		}
	}

	// Token: 0x060004B4 RID: 1204 RVA: 0x0001E5B0 File Offset: 0x0001C7B0
	public static void Close()
	{
		if (UIPopupList.current != null)
		{
			UIPopupList.current.CloseSelf();
			UIPopupList.current = null;
		}
	}

	// Token: 0x060004B5 RID: 1205 RVA: 0x0001E5E0 File Offset: 0x0001C7E0
	public virtual void CloseSelf()
	{
		if (UIPopupList.mChild != null && UIPopupList.current == this)
		{
			base.StopCoroutine("CloseIfUnselected");
			this.mSelection = null;
			this.mLabelList.Clear();
			if (this.isAnimated)
			{
				UIWidget[] componentsInChildren = UIPopupList.mChild.GetComponentsInChildren<UIWidget>();
				int i = 0;
				int num = componentsInChildren.Length;
				while (i < num)
				{
					UIWidget uiwidget = componentsInChildren[i];
					Color color = uiwidget.color;
					color.a = 0f;
					TweenColor.Begin(uiwidget.gameObject, 0.15f, color).method = UITweener.Method.EaseOut;
					i++;
				}
				Collider[] componentsInChildren2 = UIPopupList.mChild.GetComponentsInChildren<Collider>();
				int j = 0;
				int num2 = componentsInChildren2.Length;
				while (j < num2)
				{
					componentsInChildren2[j].enabled = false;
					j++;
				}
				Object.Destroy(UIPopupList.mChild, 0.15f);
				UIPopupList.mFadeOutComplete = Time.unscaledTime + Mathf.Max(0.1f, 0.15f);
			}
			else
			{
				Object.Destroy(UIPopupList.mChild);
				UIPopupList.mFadeOutComplete = Time.unscaledTime + 0.1f;
			}
			this.mBackground = null;
			this.mHighlight = null;
			UIPopupList.mChild = null;
			UIPopupList.current = null;
		}
	}

	// Token: 0x060004B6 RID: 1206 RVA: 0x0001E71C File Offset: 0x0001C91C
	protected virtual void AnimateColor(UIWidget widget)
	{
		Color color = widget.color;
		widget.color = new Color(color.r, color.g, color.b, 0f);
		TweenColor.Begin(widget.gameObject, 0.15f, color).method = UITweener.Method.EaseOut;
	}

	// Token: 0x060004B7 RID: 1207 RVA: 0x0001E76C File Offset: 0x0001C96C
	protected virtual void AnimatePosition(UIWidget widget, bool placeAbove, float bottom)
	{
		Vector3 localPosition = widget.cachedTransform.localPosition;
		Vector3 localPosition2 = (!placeAbove) ? new Vector3(localPosition.x, 0f, localPosition.z) : new Vector3(localPosition.x, bottom, localPosition.z);
		widget.cachedTransform.localPosition = localPosition2;
		GameObject gameObject = widget.gameObject;
		TweenPosition.Begin(gameObject, 0.15f, localPosition).method = UITweener.Method.EaseOut;
	}

	// Token: 0x060004B8 RID: 1208 RVA: 0x0001E7E4 File Offset: 0x0001C9E4
	protected virtual void AnimateScale(UIWidget widget, bool placeAbove, float bottom)
	{
		GameObject gameObject = widget.gameObject;
		Transform cachedTransform = widget.cachedTransform;
		float num = (float)this.activeFontSize * this.activeFontScale + this.mBgBorder * 2f;
		cachedTransform.localScale = new Vector3(1f, num / (float)widget.height, 1f);
		TweenScale.Begin(gameObject, 0.15f, Vector3.one).method = UITweener.Method.EaseOut;
		if (placeAbove)
		{
			Vector3 localPosition = cachedTransform.localPosition;
			cachedTransform.localPosition = new Vector3(localPosition.x, localPosition.y - (float)widget.height + num, localPosition.z);
			TweenPosition.Begin(gameObject, 0.15f, localPosition).method = UITweener.Method.EaseOut;
		}
	}

	// Token: 0x060004B9 RID: 1209 RVA: 0x0001E898 File Offset: 0x0001CA98
	private void Animate(UIWidget widget, bool placeAbove, float bottom)
	{
		this.AnimateColor(widget);
		this.AnimatePosition(widget, placeAbove, bottom);
	}

	// Token: 0x060004BA RID: 1210 RVA: 0x0001E8AC File Offset: 0x0001CAAC
	protected virtual void OnClick()
	{
		if (this.mOpenFrame == Time.frameCount)
		{
			return;
		}
		if (UIPopupList.mChild == null)
		{
			if (this.openOn == UIPopupList.OpenOn.DoubleClick || this.openOn == UIPopupList.OpenOn.Manual)
			{
				return;
			}
			if (this.openOn == UIPopupList.OpenOn.RightClick && UICamera.currentTouchID != -2)
			{
				return;
			}
			this.Show();
		}
		else if (this.mHighlightedLabel != null)
		{
			this.OnItemPress(this.mHighlightedLabel.gameObject, true);
		}
	}

	// Token: 0x060004BB RID: 1211 RVA: 0x0001E93C File Offset: 0x0001CB3C
	protected virtual void OnDoubleClick()
	{
		if (this.openOn == UIPopupList.OpenOn.DoubleClick)
		{
			this.Show();
		}
	}

	// Token: 0x060004BC RID: 1212 RVA: 0x0001E950 File Offset: 0x0001CB50
	private IEnumerator CloseIfUnselected()
	{
		do
		{
			yield return null;
		}
		while (!(UICamera.selectedObject != this.mSelection));
		this.CloseSelf();
		yield break;
	}

	// Token: 0x060004BD RID: 1213 RVA: 0x0001E96C File Offset: 0x0001CB6C
	public virtual void Show()
	{
		if (base.enabled && NGUITools.GetActive(base.gameObject) && UIPopupList.mChild == null && this.isValid && this.items.Count > 0)
		{
			this.mLabelList.Clear();
			base.StopCoroutine("CloseIfUnselected");
			UICamera.selectedObject = (UICamera.hoveredObject ?? base.gameObject);
			this.mSelection = UICamera.selectedObject;
			this.source = UICamera.selectedObject;
			if (this.source == null)
			{
				Debug.LogError("Popup list needs a source object...");
				return;
			}
			this.mOpenFrame = Time.frameCount;
			if (this.mPanel == null)
			{
				this.mPanel = UIPanel.Find(base.transform);
				if (this.mPanel == null)
				{
					return;
				}
			}
			UIPopupList.mChild = new GameObject("Drop-down List");
			UIPopupList.mChild.layer = base.gameObject.layer;
			if (this.separatePanel)
			{
				if (base.GetComponent<Collider>() != null)
				{
					Rigidbody rigidbody = UIPopupList.mChild.AddComponent<Rigidbody>();
					rigidbody.isKinematic = true;
				}
				else if (base.GetComponent<Collider2D>() != null)
				{
					Rigidbody2D rigidbody2D = UIPopupList.mChild.AddComponent<Rigidbody2D>();
					rigidbody2D.isKinematic = true;
				}
				UIPopupList.mChild.AddComponent<UIPanel>().depth = 1000000;
			}
			UIPopupList.current = this;
			Transform transform = UIPopupList.mChild.transform;
			transform.parent = this.mPanel.cachedTransform;
			Vector3 vector;
			Vector3 vector2;
			if (this.openOn == UIPopupList.OpenOn.Manual && this.mSelection != base.gameObject)
			{
				this.startingPosition = UICamera.lastEventPosition;
				vector = this.mPanel.cachedTransform.InverseTransformPoint(this.mPanel.anchorCamera.ScreenToWorldPoint(this.startingPosition));
				vector2 = vector;
				transform.localPosition = vector;
				this.startingPosition = transform.position;
			}
			else
			{
				Bounds bounds = NGUIMath.CalculateRelativeWidgetBounds(this.mPanel.cachedTransform, base.transform, false, false);
				vector = bounds.min;
				vector2 = bounds.max;
				transform.localPosition = vector;
				this.startingPosition = transform.position;
			}
			base.StartCoroutine("CloseIfUnselected");
			transform.localRotation = Quaternion.identity;
			transform.localScale = Vector3.one;
			int num = (!this.separatePanel) ? NGUITools.CalculateNextDepth(this.mPanel.gameObject) : 0;
			if (this.background2DSprite != null)
			{
				UI2DSprite ui2DSprite = UIPopupList.mChild.AddWidget(num);
				ui2DSprite.sprite2D = this.background2DSprite;
				this.mBackground = ui2DSprite;
			}
			else
			{
				if (!(this.atlas != null))
				{
					return;
				}
				this.mBackground = UIPopupList.mChild.AddSprite(this.atlas, this.backgroundSprite, num);
			}
			this.mBackground.pivot = UIWidget.Pivot.TopLeft;
			this.mBackground.color = this.backgroundColor;
			Vector4 border = this.mBackground.border;
			this.mBgBorder = border.y;
			this.mBackground.cachedTransform.localPosition = new Vector3(0f, border.y, 0f);
			if (this.highlight2DSprite != null)
			{
				UI2DSprite ui2DSprite2 = UIPopupList.mChild.AddWidget(num + 1);
				ui2DSprite2.sprite2D = this.highlight2DSprite;
				this.mHighlight = ui2DSprite2;
			}
			else
			{
				if (!(this.atlas != null))
				{
					return;
				}
				this.mHighlight = UIPopupList.mChild.AddSprite(this.atlas, this.highlightSprite, num + 1);
			}
			float num2 = 0f;
			float num3 = 0f;
			if (this.mHighlight.hasBorder)
			{
				num2 = this.mHighlight.border.w;
				num3 = this.mHighlight.border.x;
			}
			this.mHighlight.pivot = UIWidget.Pivot.TopLeft;
			this.mHighlight.color = this.highlightColor;
			float num4 = (float)this.activeFontSize;
			float activeFontScale = this.activeFontScale;
			float num5 = num4 * activeFontScale;
			float num6 = 0f;
			float num7 = -this.padding.y;
			List<UILabel> list = new List<UILabel>();
			if (!this.items.Contains(this.mSelectedItem))
			{
				this.mSelectedItem = null;
			}
			int i = 0;
			int count = this.items.Count;
			while (i < count)
			{
				string text = this.items[i];
				UILabel uilabel = UIPopupList.mChild.AddWidget(this.mBackground.depth + 2);
				uilabel.name = i.ToString();
				uilabel.pivot = UIWidget.Pivot.TopLeft;
				uilabel.bitmapFont = this.bitmapFont;
				uilabel.trueTypeFont = this.trueTypeFont;
				uilabel.fontSize = this.fontSize;
				uilabel.fontStyle = this.fontStyle;
				uilabel.text = ((!this.isLocalized) ? text : Localization.Get(text));
				uilabel.color = this.textColor;
				uilabel.cachedTransform.localPosition = new Vector3(border.x + this.padding.x - uilabel.pivotOffset.x, num7, -1f);
				uilabel.overflowMethod = UILabel.Overflow.ResizeFreely;
				uilabel.alignment = this.alignment;
				list.Add(uilabel);
				num7 -= num5;
				num7 -= this.padding.y;
				num6 = Mathf.Max(num6, uilabel.printedSize.x);
				UIEventListener uieventListener = UIEventListener.Get(uilabel.gameObject);
				uieventListener.onHover = new UIEventListener.BoolDelegate(this.OnItemHover);
				uieventListener.onPress = new UIEventListener.BoolDelegate(this.OnItemPress);
				uieventListener.parameter = text;
				if (this.mSelectedItem == text || (i == 0 && string.IsNullOrEmpty(this.mSelectedItem)))
				{
					this.Highlight(uilabel, true);
				}
				this.mLabelList.Add(uilabel);
				i++;
			}
			num6 = Mathf.Max(num6, vector2.x - vector.x - (border.x + this.padding.x) * 2f);
			float num8 = num6;
			Vector3 vector3;
			vector3..ctor(num8 * 0.5f, -num5 * 0.5f, 0f);
			Vector3 vector4;
			vector4..ctor(num8, num5 + this.padding.y, 1f);
			int j = 0;
			int count2 = list.Count;
			while (j < count2)
			{
				UILabel uilabel2 = list[j];
				NGUITools.AddWidgetCollider(uilabel2.gameObject);
				uilabel2.autoResizeBoxCollider = false;
				BoxCollider component = uilabel2.GetComponent<BoxCollider>();
				if (component != null)
				{
					vector3.z = component.center.z;
					component.center = vector3;
					component.size = vector4;
				}
				else
				{
					BoxCollider2D component2 = uilabel2.GetComponent<BoxCollider2D>();
					component2.offset = vector3;
					component2.size = vector4;
				}
				j++;
			}
			int width = Mathf.RoundToInt(num6);
			num6 += (border.x + this.padding.x) * 2f;
			num7 -= border.y;
			this.mBackground.width = Mathf.RoundToInt(num6);
			this.mBackground.height = Mathf.RoundToInt(-num7 + border.y);
			int k = 0;
			int count3 = list.Count;
			while (k < count3)
			{
				UILabel uilabel3 = list[k];
				uilabel3.overflowMethod = UILabel.Overflow.ShrinkContent;
				uilabel3.width = width;
				k++;
			}
			float num9 = (!(this.atlas != null)) ? 2f : (2f * this.atlas.pixelSize);
			float num10 = num6 - (border.x + this.padding.x) * 2f + num3 * num9;
			float num11 = num5 + num2 * num9;
			this.mHighlight.width = Mathf.RoundToInt(num10);
			this.mHighlight.height = Mathf.RoundToInt(num11);
			bool flag = this.position == UIPopupList.Position.Above;
			if (this.position == UIPopupList.Position.Auto)
			{
				UICamera uicamera = UICamera.FindCameraForLayer(this.mSelection.layer);
				if (uicamera != null)
				{
					flag = (uicamera.cachedCamera.WorldToViewportPoint(this.startingPosition).y < 0.5f);
				}
			}
			if (this.isAnimated)
			{
				this.AnimateColor(this.mBackground);
				if (Time.timeScale == 0f || Time.timeScale >= 0.1f)
				{
					float bottom = num7 + num5;
					this.Animate(this.mHighlight, flag, bottom);
					int l = 0;
					int count4 = list.Count;
					while (l < count4)
					{
						this.Animate(list[l], flag, bottom);
						l++;
					}
					this.AnimateScale(this.mBackground, flag, bottom);
				}
			}
			if (flag)
			{
				vector.y = vector2.y - border.y;
				vector2.y = vector.y + (float)this.mBackground.height;
				vector2.x = vector.x + (float)this.mBackground.width;
				transform.localPosition = new Vector3(vector.x, vector2.y - border.y, vector.z);
			}
			else
			{
				vector2.y = vector.y + border.y;
				vector.y = vector2.y - (float)this.mBackground.height;
				vector2.x = vector.x + (float)this.mBackground.width;
			}
			Transform parent = this.mPanel.cachedTransform.parent;
			if (parent != null)
			{
				vector = this.mPanel.cachedTransform.TransformPoint(vector);
				vector2 = this.mPanel.cachedTransform.TransformPoint(vector2);
				vector = parent.InverseTransformPoint(vector);
				vector2 = parent.InverseTransformPoint(vector2);
			}
			Vector3 vector5 = (!this.mPanel.hasClipping) ? this.mPanel.CalculateConstrainOffset(vector, vector2) : Vector3.zero;
			Vector3 localPosition = transform.localPosition + vector5;
			localPosition.x = Mathf.Round(localPosition.x);
			localPosition.y = Mathf.Round(localPosition.y);
			transform.localPosition = localPosition;
		}
		else
		{
			this.OnSelect(false);
		}
	}

	// Token: 0x040004DE RID: 1246
	private const float animSpeed = 0.15f;

	// Token: 0x040004DF RID: 1247
	public static UIPopupList current;

	// Token: 0x040004E0 RID: 1248
	private static GameObject mChild;

	// Token: 0x040004E1 RID: 1249
	private static float mFadeOutComplete;

	// Token: 0x040004E2 RID: 1250
	public UIAtlas atlas;

	// Token: 0x040004E3 RID: 1251
	public UIFont bitmapFont;

	// Token: 0x040004E4 RID: 1252
	public Font trueTypeFont;

	// Token: 0x040004E5 RID: 1253
	public int fontSize = 16;

	// Token: 0x040004E6 RID: 1254
	public FontStyle fontStyle;

	// Token: 0x040004E7 RID: 1255
	public string backgroundSprite;

	// Token: 0x040004E8 RID: 1256
	public string highlightSprite;

	// Token: 0x040004E9 RID: 1257
	public Sprite background2DSprite;

	// Token: 0x040004EA RID: 1258
	public Sprite highlight2DSprite;

	// Token: 0x040004EB RID: 1259
	public UIPopupList.Position position;

	// Token: 0x040004EC RID: 1260
	public NGUIText.Alignment alignment = NGUIText.Alignment.Left;

	// Token: 0x040004ED RID: 1261
	public List<string> items = new List<string>();

	// Token: 0x040004EE RID: 1262
	public List<object> itemData = new List<object>();

	// Token: 0x040004EF RID: 1263
	public Vector2 padding = new Vector3(4f, 4f);

	// Token: 0x040004F0 RID: 1264
	public Color textColor = Color.white;

	// Token: 0x040004F1 RID: 1265
	public Color backgroundColor = Color.white;

	// Token: 0x040004F2 RID: 1266
	public Color highlightColor = new Color(0.88235295f, 0.78431374f, 0.5882353f, 1f);

	// Token: 0x040004F3 RID: 1267
	public bool isAnimated = true;

	// Token: 0x040004F4 RID: 1268
	public bool isLocalized;

	// Token: 0x040004F5 RID: 1269
	public bool separatePanel = true;

	// Token: 0x040004F6 RID: 1270
	public UIPopupList.OpenOn openOn;

	// Token: 0x040004F7 RID: 1271
	public List<EventDelegate> onChange = new List<EventDelegate>();

	// Token: 0x040004F8 RID: 1272
	[HideInInspector]
	[SerializeField]
	protected string mSelectedItem;

	// Token: 0x040004F9 RID: 1273
	[SerializeField]
	[HideInInspector]
	protected UIPanel mPanel;

	// Token: 0x040004FA RID: 1274
	[HideInInspector]
	[SerializeField]
	protected UIBasicSprite mBackground;

	// Token: 0x040004FB RID: 1275
	[SerializeField]
	[HideInInspector]
	protected UIBasicSprite mHighlight;

	// Token: 0x040004FC RID: 1276
	[SerializeField]
	[HideInInspector]
	protected UILabel mHighlightedLabel;

	// Token: 0x040004FD RID: 1277
	[SerializeField]
	[HideInInspector]
	protected List<UILabel> mLabelList = new List<UILabel>();

	// Token: 0x040004FE RID: 1278
	[HideInInspector]
	[SerializeField]
	protected float mBgBorder;

	// Token: 0x040004FF RID: 1279
	[NonSerialized]
	protected GameObject mSelection;

	// Token: 0x04000500 RID: 1280
	[NonSerialized]
	protected int mOpenFrame;

	// Token: 0x04000501 RID: 1281
	[HideInInspector]
	[SerializeField]
	private GameObject eventReceiver;

	// Token: 0x04000502 RID: 1282
	[SerializeField]
	[HideInInspector]
	private string functionName = "OnSelectionChange";

	// Token: 0x04000503 RID: 1283
	[SerializeField]
	[HideInInspector]
	private float textScale;

	// Token: 0x04000504 RID: 1284
	[HideInInspector]
	[SerializeField]
	private UIFont font;

	// Token: 0x04000505 RID: 1285
	[HideInInspector]
	[SerializeField]
	private UILabel textLabel;

	// Token: 0x04000506 RID: 1286
	[NonSerialized]
	public Vector3 startingPosition;

	// Token: 0x04000507 RID: 1287
	private UIPopupList.LegacyEvent mLegacyEvent;

	// Token: 0x04000508 RID: 1288
	[NonSerialized]
	protected bool mExecuting;

	// Token: 0x04000509 RID: 1289
	protected bool mUseDynamicFont;

	// Token: 0x0400050A RID: 1290
	[NonSerialized]
	protected bool mStarted;

	// Token: 0x0400050B RID: 1291
	protected bool mTweening;

	// Token: 0x0400050C RID: 1292
	public GameObject source;

	// Token: 0x020000B9 RID: 185
	public enum Position
	{
		// Token: 0x0400050E RID: 1294
		Auto,
		// Token: 0x0400050F RID: 1295
		Above,
		// Token: 0x04000510 RID: 1296
		Below
	}

	// Token: 0x020000BA RID: 186
	public enum OpenOn
	{
		// Token: 0x04000512 RID: 1298
		ClickOrTap,
		// Token: 0x04000513 RID: 1299
		RightClick,
		// Token: 0x04000514 RID: 1300
		DoubleClick,
		// Token: 0x04000515 RID: 1301
		Manual
	}

	// Token: 0x02000337 RID: 823
	// (Invoke) Token: 0x060014FE RID: 5374
	public delegate void LegacyEvent(string val);
}
