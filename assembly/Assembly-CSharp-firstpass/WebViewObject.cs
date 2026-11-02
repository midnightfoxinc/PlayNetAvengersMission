using System;
using UnityEngine;

// Token: 0x02000018 RID: 24
public class WebViewObject : MonoBehaviour
{
	// Token: 0x06000180 RID: 384 RVA: 0x00007580 File Offset: 0x00005780
	public void SetKeyboardVisible(string pIsVisible)
	{
		this.mIsKeyboardVisible = (pIsVisible == "true");
	}

	// Token: 0x17000023 RID: 35
	// (get) Token: 0x06000181 RID: 385 RVA: 0x00007594 File Offset: 0x00005794
	public bool IsKeyboardVisible
	{
		get
		{
			return this.mIsKeyboardVisible;
		}
	}

	// Token: 0x06000182 RID: 386 RVA: 0x0000759C File Offset: 0x0000579C
	public void Init(Action<string> cb = null)
	{
		this.callback = cb;
		this.webView = new AndroidJavaObject("net.gree.unitywebview.WebViewPlugin", new object[0]);
		this.webView.Call("Init", new object[]
		{
			base.name
		});
	}

	// Token: 0x06000183 RID: 387 RVA: 0x000075E8 File Offset: 0x000057E8
	private void OnDestroy()
	{
		if (this.webView == null)
		{
			return;
		}
		this.webView.Call("Destroy", new object[0]);
	}

	// Token: 0x06000184 RID: 388 RVA: 0x00007618 File Offset: 0x00005818
	public void SetCenterPositionWithScale(Vector2 center, Vector2 scale)
	{
	}

	// Token: 0x06000185 RID: 389 RVA: 0x0000761C File Offset: 0x0000581C
	public void SetMargins(int left, int top, int right, int bottom)
	{
		if (this.webView == null)
		{
			return;
		}
		this.webView.Call("SetMargins", new object[]
		{
			left,
			top,
			right,
			bottom
		});
	}

	// Token: 0x06000186 RID: 390 RVA: 0x00007670 File Offset: 0x00005870
	public void SetVisibility(bool v)
	{
		if (this.webView == null)
		{
			return;
		}
		this.webView.Call("SetVisibility", new object[]
		{
			v
		});
	}

	// Token: 0x06000187 RID: 391 RVA: 0x000076A0 File Offset: 0x000058A0
	public void LoadURL(string url)
	{
		if (this.webView == null)
		{
			return;
		}
		this.webView.Call("LoadURL", new object[]
		{
			url
		});
	}

	// Token: 0x06000188 RID: 392 RVA: 0x000076D4 File Offset: 0x000058D4
	public void EvaluateJS(string js)
	{
		if (this.webView == null)
		{
			return;
		}
		this.webView.Call("LoadURL", new object[]
		{
			"javascript:" + js
		});
	}

	// Token: 0x06000189 RID: 393 RVA: 0x00007714 File Offset: 0x00005914
	public void CallFromJS(string message)
	{
		if (this.callback != null)
		{
			this.callback.Invoke(message);
		}
	}

	// Token: 0x040000AC RID: 172
	private Action<string> callback;

	// Token: 0x040000AD RID: 173
	private AndroidJavaObject webView;

	// Token: 0x040000AE RID: 174
	private bool mIsKeyboardVisible;
}
