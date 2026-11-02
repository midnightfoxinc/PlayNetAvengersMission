using System;
using UnityEngine;

// Token: 0x020001A4 RID: 420
public class RegisterCodePanelBehavior : MonoBehaviour
{
	// Token: 0x06000C98 RID: 3224 RVA: 0x0005B6EC File Offset: 0x000598EC
	private void Start()
	{
		this.current_code = new int[this.number_display.Length];
		this.reset();
	}

	// Token: 0x06000C99 RID: 3225 RVA: 0x0005B708 File Offset: 0x00059908
	public void reset()
	{
		this._current_number_display = 0;
		this.current_number_highlight.transform.position = this.number_display[0].transform.position;
		for (int i = 0; i < this.number_display.Length; i++)
		{
			this.current_code[i] = -1;
			this.number_display[i].text = string.Empty;
		}
	}

	// Token: 0x06000C9A RID: 3226 RVA: 0x0005B774 File Offset: 0x00059974
	public string current_code_string()
	{
		string text = string.Empty;
		for (int i = 0; i < this.current_code.Length; i++)
		{
			if (this.current_code[i] < 0)
			{
				return string.Empty;
			}
			text += this.current_code[i].ToString();
		}
		return text;
	}

	// Token: 0x06000C9B RID: 3227 RVA: 0x0005B7D0 File Offset: 0x000599D0
	private void Update()
	{
		if (this._current_number_display < this.number_display.Length)
		{
			this.current_number_highlight.transform.position = this.number_display[this._current_number_display].transform.position;
			this.current_number_highlight.SetActive(true);
			for (int i = 0; i < this.number_button.Length; i++)
			{
				if (this.number_button[i].hit)
				{
					this.current_code[this._current_number_display] = i;
					this._current_number_display++;
				}
			}
			if (this.delete_button.hit && this._current_number_display > 0)
			{
				this._current_number_display--;
				this.current_code[this._current_number_display] = -1;
			}
			for (int j = 0; j < this.number_display.Length; j++)
			{
				if (this.current_code[j] < 0)
				{
					this.number_display[j].text = string.Empty;
				}
				else
				{
					this.number_display[j].text = this.current_code[j].ToString();
				}
			}
		}
		else
		{
			this.current_number_highlight.SetActive(false);
		}
	}

	// Token: 0x04000C6E RID: 3182
	public buttonBehavior[] number_button;

	// Token: 0x04000C6F RID: 3183
	public buttonBehavior delete_button;

	// Token: 0x04000C70 RID: 3184
	public UILabel[] number_display;

	// Token: 0x04000C71 RID: 3185
	public GameObject current_number_highlight;

	// Token: 0x04000C72 RID: 3186
	public int[] current_code;

	// Token: 0x04000C73 RID: 3187
	private int _current_number_display;
}
