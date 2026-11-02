using System;
using System.Collections.Generic;
using System.Text;
using UnityEngine;

// Token: 0x02000134 RID: 308
[AddComponentMenu("NGUI/UI/Text List")]
public class UITextList : MonoBehaviour
{
	// Token: 0x17000196 RID: 406
	// (get) Token: 0x06000A46 RID: 2630 RVA: 0x0004BA1C File Offset: 0x00049C1C
	protected BetterList<UITextList.Paragraph> paragraphs
	{
		get
		{
			if (this.mParagraphs == null && !UITextList.mHistory.TryGetValue(base.name, ref this.mParagraphs))
			{
				this.mParagraphs = new BetterList<UITextList.Paragraph>();
				UITextList.mHistory.Add(base.name, this.mParagraphs);
			}
			return this.mParagraphs;
		}
	}

	// Token: 0x17000197 RID: 407
	// (get) Token: 0x06000A47 RID: 2631 RVA: 0x0004BA78 File Offset: 0x00049C78
	public bool isValid
	{
		get
		{
			return this.textLabel != null && this.textLabel.ambigiousFont != null;
		}
	}

	// Token: 0x17000198 RID: 408
	// (get) Token: 0x06000A48 RID: 2632 RVA: 0x0004BAA0 File Offset: 0x00049CA0
	// (set) Token: 0x06000A49 RID: 2633 RVA: 0x0004BAA8 File Offset: 0x00049CA8
	public float scrollValue
	{
		get
		{
			return this.mScroll;
		}
		set
		{
			value = Mathf.Clamp01(value);
			if (this.isValid && this.mScroll != value)
			{
				if (this.scrollBar != null)
				{
					this.scrollBar.value = value;
				}
				else
				{
					this.mScroll = value;
					this.UpdateVisibleText();
				}
			}
		}
	}

	// Token: 0x17000199 RID: 409
	// (get) Token: 0x06000A4A RID: 2634 RVA: 0x0004BB04 File Offset: 0x00049D04
	protected float lineHeight
	{
		get
		{
			return (!(this.textLabel != null)) ? 20f : ((float)this.textLabel.fontSize + this.textLabel.effectiveSpacingY);
		}
	}

	// Token: 0x1700019A RID: 410
	// (get) Token: 0x06000A4B RID: 2635 RVA: 0x0004BB3C File Offset: 0x00049D3C
	protected int scrollHeight
	{
		get
		{
			if (!this.isValid)
			{
				return 0;
			}
			int num = Mathf.FloorToInt((float)this.textLabel.height / this.lineHeight);
			return Mathf.Max(0, this.mTotalLines - num);
		}
	}

	// Token: 0x06000A4C RID: 2636 RVA: 0x0004BB80 File Offset: 0x00049D80
	public void Clear()
	{
		this.paragraphs.Clear();
		this.UpdateVisibleText();
	}

	// Token: 0x06000A4D RID: 2637 RVA: 0x0004BB94 File Offset: 0x00049D94
	private void Start()
	{
		if (this.textLabel == null)
		{
			this.textLabel = base.GetComponentInChildren<UILabel>();
		}
		if (this.scrollBar != null)
		{
			EventDelegate.Add(this.scrollBar.onChange, new EventDelegate.Callback(this.OnScrollBar));
		}
		this.textLabel.overflowMethod = UILabel.Overflow.ClampContent;
		if (this.style == UITextList.Style.Chat)
		{
			this.textLabel.pivot = UIWidget.Pivot.BottomLeft;
			this.scrollValue = 1f;
		}
		else
		{
			this.textLabel.pivot = UIWidget.Pivot.TopLeft;
			this.scrollValue = 0f;
		}
	}

	// Token: 0x06000A4E RID: 2638 RVA: 0x0004BC38 File Offset: 0x00049E38
	private void Update()
	{
		if (this.isValid && (this.textLabel.width != this.mLastWidth || this.textLabel.height != this.mLastHeight))
		{
			this.Rebuild();
		}
	}

	// Token: 0x06000A4F RID: 2639 RVA: 0x0004BC84 File Offset: 0x00049E84
	public void OnScroll(float val)
	{
		int scrollHeight = this.scrollHeight;
		if (scrollHeight != 0)
		{
			val *= this.lineHeight;
			this.scrollValue = this.mScroll - val / (float)scrollHeight;
		}
	}

	// Token: 0x06000A50 RID: 2640 RVA: 0x0004BCBC File Offset: 0x00049EBC
	public void OnDrag(Vector2 delta)
	{
		int scrollHeight = this.scrollHeight;
		if (scrollHeight != 0)
		{
			float num = delta.y / this.lineHeight;
			this.scrollValue = this.mScroll + num / (float)scrollHeight;
		}
	}

	// Token: 0x06000A51 RID: 2641 RVA: 0x0004BCF8 File Offset: 0x00049EF8
	private void OnScrollBar()
	{
		this.mScroll = UIProgressBar.current.value;
		this.UpdateVisibleText();
	}

	// Token: 0x06000A52 RID: 2642 RVA: 0x0004BD10 File Offset: 0x00049F10
	public void Add(string text)
	{
		this.Add(text, true);
	}

	// Token: 0x06000A53 RID: 2643 RVA: 0x0004BD1C File Offset: 0x00049F1C
	protected void Add(string text, bool updateVisible)
	{
		UITextList.Paragraph paragraph;
		if (this.paragraphs.size < this.paragraphHistory)
		{
			paragraph = new UITextList.Paragraph();
		}
		else
		{
			paragraph = this.mParagraphs[0];
			this.mParagraphs.RemoveAt(0);
		}
		paragraph.text = text;
		this.mParagraphs.Add(paragraph);
		this.Rebuild();
	}

	// Token: 0x06000A54 RID: 2644 RVA: 0x0004BD80 File Offset: 0x00049F80
	protected void Rebuild()
	{
		if (this.isValid)
		{
			this.mLastWidth = this.textLabel.width;
			this.mLastHeight = this.textLabel.height;
			this.textLabel.UpdateNGUIText();
			NGUIText.rectHeight = 1000000;
			NGUIText.regionHeight = 1000000;
			this.mTotalLines = 0;
			for (int i = 0; i < this.paragraphs.size; i++)
			{
				UITextList.Paragraph paragraph = this.mParagraphs.buffer[i];
				string text;
				NGUIText.WrapText(paragraph.text, out text, false, true, false);
				paragraph.lines = text.Split(new char[]
				{
					'\n'
				});
				this.mTotalLines += paragraph.lines.Length;
			}
			this.mTotalLines = 0;
			int j = 0;
			int size = this.mParagraphs.size;
			while (j < size)
			{
				this.mTotalLines += this.mParagraphs.buffer[j].lines.Length;
				j++;
			}
			if (this.scrollBar != null)
			{
				UIScrollBar uiscrollBar = this.scrollBar as UIScrollBar;
				if (uiscrollBar != null)
				{
					uiscrollBar.barSize = ((this.mTotalLines != 0) ? (1f - (float)this.scrollHeight / (float)this.mTotalLines) : 1f);
				}
			}
			this.UpdateVisibleText();
		}
	}

	// Token: 0x06000A55 RID: 2645 RVA: 0x0004BEF4 File Offset: 0x0004A0F4
	protected void UpdateVisibleText()
	{
		if (this.isValid)
		{
			if (this.mTotalLines == 0)
			{
				this.textLabel.text = string.Empty;
				return;
			}
			int num = Mathf.FloorToInt((float)this.textLabel.height / this.lineHeight);
			int num2 = Mathf.Max(0, this.mTotalLines - num);
			int num3 = Mathf.RoundToInt(this.mScroll * (float)num2);
			if (num3 < 0)
			{
				num3 = 0;
			}
			StringBuilder stringBuilder = new StringBuilder();
			int num4 = 0;
			int size = this.paragraphs.size;
			while (num > 0 && num4 < size)
			{
				UITextList.Paragraph paragraph = this.mParagraphs.buffer[num4];
				int num5 = 0;
				int num6 = paragraph.lines.Length;
				while (num > 0 && num5 < num6)
				{
					string text = paragraph.lines[num5];
					if (num3 > 0)
					{
						num3--;
					}
					else
					{
						if (stringBuilder.Length > 0)
						{
							stringBuilder.Append("\n");
						}
						stringBuilder.Append(text);
						num--;
					}
					num5++;
				}
				num4++;
			}
			this.textLabel.text = stringBuilder.ToString();
		}
	}

	// Token: 0x04000968 RID: 2408
	public UILabel textLabel;

	// Token: 0x04000969 RID: 2409
	public UIProgressBar scrollBar;

	// Token: 0x0400096A RID: 2410
	public UITextList.Style style;

	// Token: 0x0400096B RID: 2411
	public int paragraphHistory = 100;

	// Token: 0x0400096C RID: 2412
	protected char[] mSeparator = new char[]
	{
		'\n'
	};

	// Token: 0x0400096D RID: 2413
	protected float mScroll;

	// Token: 0x0400096E RID: 2414
	protected int mTotalLines;

	// Token: 0x0400096F RID: 2415
	protected int mLastWidth;

	// Token: 0x04000970 RID: 2416
	protected int mLastHeight;

	// Token: 0x04000971 RID: 2417
	private BetterList<UITextList.Paragraph> mParagraphs;

	// Token: 0x04000972 RID: 2418
	private static Dictionary<string, BetterList<UITextList.Paragraph>> mHistory = new Dictionary<string, BetterList<UITextList.Paragraph>>();

	// Token: 0x02000135 RID: 309
	public enum Style
	{
		// Token: 0x04000974 RID: 2420
		Text,
		// Token: 0x04000975 RID: 2421
		Chat
	}

	// Token: 0x02000136 RID: 310
	protected class Paragraph
	{
		// Token: 0x04000976 RID: 2422
		public string text;

		// Token: 0x04000977 RID: 2423
		public string[] lines;
	}
}
