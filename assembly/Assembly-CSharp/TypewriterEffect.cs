using System;
using System.Collections.Generic;
using System.Text;
using UnityEngine;

// Token: 0x02000091 RID: 145
[RequireComponent(typeof(UILabel))]
[AddComponentMenu("NGUI/Interaction/Typewriter Effect")]
public class TypewriterEffect : MonoBehaviour
{
	// Token: 0x17000026 RID: 38
	// (get) Token: 0x06000375 RID: 885 RVA: 0x00016DD0 File Offset: 0x00014FD0
	public bool isActive
	{
		get
		{
			return this.mActive;
		}
	}

	// Token: 0x06000376 RID: 886 RVA: 0x00016DD8 File Offset: 0x00014FD8
	public void ResetToBeginning()
	{
		this.Finish();
		this.mReset = true;
		this.mActive = true;
		this.mNextChar = 0f;
		this.mCurrentOffset = 0;
		this.Update();
	}

	// Token: 0x06000377 RID: 887 RVA: 0x00016E14 File Offset: 0x00015014
	public void Finish()
	{
		if (this.mActive)
		{
			this.mActive = false;
			if (!this.mReset)
			{
				this.mCurrentOffset = this.mFullText.Length;
				this.mFade.Clear();
				this.mLabel.text = this.mFullText;
			}
			if (this.keepFullDimensions && this.scrollView != null)
			{
				this.scrollView.UpdatePosition();
			}
			TypewriterEffect.current = this;
			EventDelegate.Execute(this.onFinished);
			TypewriterEffect.current = null;
		}
	}

	// Token: 0x06000378 RID: 888 RVA: 0x00016EAC File Offset: 0x000150AC
	private void OnEnable()
	{
		this.mReset = true;
		this.mActive = true;
	}

	// Token: 0x06000379 RID: 889 RVA: 0x00016EBC File Offset: 0x000150BC
	private void OnDisable()
	{
		this.Finish();
	}

	// Token: 0x0600037A RID: 890 RVA: 0x00016EC4 File Offset: 0x000150C4
	private void Update()
	{
		if (!this.mActive)
		{
			return;
		}
		if (this.mReset)
		{
			this.mCurrentOffset = 0;
			this.mReset = false;
			this.mLabel = base.GetComponent<UILabel>();
			this.mFullText = this.mLabel.processedText;
			this.mFade.Clear();
			if (this.keepFullDimensions && this.scrollView != null)
			{
				this.scrollView.UpdatePosition();
			}
		}
		if (string.IsNullOrEmpty(this.mFullText))
		{
			return;
		}
		while (this.mCurrentOffset < this.mFullText.Length && this.mNextChar <= RealTime.time)
		{
			int num = this.mCurrentOffset;
			this.charsPerSecond = Mathf.Max(1, this.charsPerSecond);
			if (this.mLabel.supportEncoding)
			{
				while (NGUIText.ParseSymbol(this.mFullText, ref this.mCurrentOffset))
				{
				}
			}
			this.mCurrentOffset++;
			if (this.mCurrentOffset > this.mFullText.Length)
			{
				break;
			}
			float num2 = 1f / (float)this.charsPerSecond;
			char c = (num >= this.mFullText.Length) ? '\n' : this.mFullText.get_Chars(num);
			if (c == '\n')
			{
				num2 += this.delayOnNewLine;
			}
			else if (num + 1 == this.mFullText.Length || this.mFullText.get_Chars(num + 1) <= ' ')
			{
				if (c == '.')
				{
					if (num + 2 < this.mFullText.Length && this.mFullText.get_Chars(num + 1) == '.' && this.mFullText.get_Chars(num + 2) == '.')
					{
						num2 += this.delayOnPeriod * 3f;
						num += 2;
					}
					else
					{
						num2 += this.delayOnPeriod;
					}
				}
				else if (c == '!' || c == '?')
				{
					num2 += this.delayOnPeriod;
				}
			}
			if (this.mNextChar == 0f)
			{
				this.mNextChar = RealTime.time + num2;
			}
			else
			{
				this.mNextChar += num2;
			}
			if (this.fadeInTime != 0f)
			{
				TypewriterEffect.FadeEntry item = default(TypewriterEffect.FadeEntry);
				item.index = num;
				item.alpha = 0f;
				item.text = this.mFullText.Substring(num, this.mCurrentOffset - num);
				this.mFade.Add(item);
			}
			else
			{
				this.mLabel.text = ((!this.keepFullDimensions) ? this.mFullText.Substring(0, this.mCurrentOffset) : (this.mFullText.Substring(0, this.mCurrentOffset) + "[00]" + this.mFullText.Substring(this.mCurrentOffset)));
				if (!this.keepFullDimensions && this.scrollView != null)
				{
					this.scrollView.UpdatePosition();
				}
			}
		}
		if (this.mCurrentOffset >= this.mFullText.Length)
		{
			this.mLabel.text = this.mFullText;
			TypewriterEffect.current = this;
			EventDelegate.Execute(this.onFinished);
			TypewriterEffect.current = null;
			this.mActive = false;
		}
		else if (this.mFade.size != 0)
		{
			int i = 0;
			while (i < this.mFade.size)
			{
				TypewriterEffect.FadeEntry value = this.mFade[i];
				value.alpha += RealTime.deltaTime / this.fadeInTime;
				if (value.alpha < 1f)
				{
					this.mFade[i] = value;
					i++;
				}
				else
				{
					this.mFade.RemoveAt(i);
				}
			}
			if (this.mFade.size == 0)
			{
				if (this.keepFullDimensions)
				{
					this.mLabel.text = this.mFullText.Substring(0, this.mCurrentOffset) + "[00]" + this.mFullText.Substring(this.mCurrentOffset);
				}
				else
				{
					this.mLabel.text = this.mFullText.Substring(0, this.mCurrentOffset);
				}
			}
			else
			{
				StringBuilder stringBuilder = new StringBuilder();
				for (int j = 0; j < this.mFade.size; j++)
				{
					TypewriterEffect.FadeEntry fadeEntry = this.mFade[j];
					if (j == 0)
					{
						stringBuilder.Append(this.mFullText.Substring(0, fadeEntry.index));
					}
					stringBuilder.Append('[');
					stringBuilder.Append(NGUIText.EncodeAlpha(fadeEntry.alpha));
					stringBuilder.Append(']');
					stringBuilder.Append(fadeEntry.text);
				}
				if (this.keepFullDimensions)
				{
					stringBuilder.Append("[00]");
					stringBuilder.Append(this.mFullText.Substring(this.mCurrentOffset));
				}
				this.mLabel.text = stringBuilder.ToString();
			}
		}
	}

	// Token: 0x040003AB RID: 939
	public static TypewriterEffect current;

	// Token: 0x040003AC RID: 940
	public int charsPerSecond = 20;

	// Token: 0x040003AD RID: 941
	public float fadeInTime;

	// Token: 0x040003AE RID: 942
	public float delayOnPeriod;

	// Token: 0x040003AF RID: 943
	public float delayOnNewLine;

	// Token: 0x040003B0 RID: 944
	public UIScrollView scrollView;

	// Token: 0x040003B1 RID: 945
	public bool keepFullDimensions;

	// Token: 0x040003B2 RID: 946
	public List<EventDelegate> onFinished = new List<EventDelegate>();

	// Token: 0x040003B3 RID: 947
	private UILabel mLabel;

	// Token: 0x040003B4 RID: 948
	private string mFullText = string.Empty;

	// Token: 0x040003B5 RID: 949
	private int mCurrentOffset;

	// Token: 0x040003B6 RID: 950
	private float mNextChar;

	// Token: 0x040003B7 RID: 951
	private bool mReset = true;

	// Token: 0x040003B8 RID: 952
	private bool mActive;

	// Token: 0x040003B9 RID: 953
	private BetterList<TypewriterEffect.FadeEntry> mFade = new BetterList<TypewriterEffect.FadeEntry>();

	// Token: 0x02000092 RID: 146
	private struct FadeEntry
	{
		// Token: 0x040003BA RID: 954
		public int index;

		// Token: 0x040003BB RID: 955
		public string text;

		// Token: 0x040003BC RID: 956
		public float alpha;
	}
}
