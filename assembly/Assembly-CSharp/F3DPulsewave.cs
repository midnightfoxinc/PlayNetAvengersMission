using System;
using UnityEngine;

// Token: 0x02000010 RID: 16
public class F3DPulsewave : MonoBehaviour
{
	// Token: 0x0600007A RID: 122 RVA: 0x00005A0C File Offset: 0x00003C0C
	private void Awake()
	{
		this.transform = base.GetComponent<Transform>();
		this.meshRenderer = base.GetComponent<MeshRenderer>();
		this.tintColorRef = Shader.PropertyToID("_TintColor");
		this.defaultColor = this.meshRenderer.material.GetColor(this.tintColorRef);
	}

	// Token: 0x0600007B RID: 123 RVA: 0x00005A60 File Offset: 0x00003C60
	private void Start()
	{
		if (this.DebugLoop)
		{
			this.OnSpawned();
		}
	}

	// Token: 0x0600007C RID: 124 RVA: 0x00005A74 File Offset: 0x00003C74
	private void OnSpawned()
	{
		this.transform.localScale = new Vector3(0f, 0f, 0f);
		this.isEnabled = true;
		this.isFadeOut = false;
		this.timerID = F3DTime.time.AddTimer(this.FadeOutDelay, new Action(this.OnFadeOut));
		this.meshRenderer.material.SetColor(this.tintColorRef, this.defaultColor);
		this.color = this.defaultColor;
	}

	// Token: 0x0600007D RID: 125 RVA: 0x00005AF8 File Offset: 0x00003CF8
	private void OnDespawned()
	{
		if (this.timerID >= 0)
		{
			F3DTime.time.RemoveTimer(this.timerID);
			this.timerID = -1;
		}
	}

	// Token: 0x0600007E RID: 126 RVA: 0x00005B20 File Offset: 0x00003D20
	private void OnFadeOut()
	{
		this.isFadeOut = true;
	}

	// Token: 0x0600007F RID: 127 RVA: 0x00005B2C File Offset: 0x00003D2C
	private void Update()
	{
		if (this.isEnabled)
		{
			this.transform.localScale = Vector3.Lerp(this.transform.localScale, this.ScaleSize, Time.deltaTime * this.ScaleTime);
			if (this.isFadeOut)
			{
				this.color = Color.Lerp(this.color, new Color(0f, 0f, 0f, -0.1f), Time.deltaTime * this.FadeOutTime);
				this.meshRenderer.material.SetColor(this.tintColorRef, this.color);
				if (this.color.a <= 0f)
				{
					this.isEnabled = false;
					if (this.DebugLoop)
					{
						this.OnDespawned();
						this.OnSpawned();
					}
				}
			}
		}
	}

	// Token: 0x040000C5 RID: 197
	public float FadeOutDelay;

	// Token: 0x040000C6 RID: 198
	public float FadeOutTime;

	// Token: 0x040000C7 RID: 199
	public float ScaleTime;

	// Token: 0x040000C8 RID: 200
	public Vector3 ScaleSize;

	// Token: 0x040000C9 RID: 201
	public bool DebugLoop;

	// Token: 0x040000CA RID: 202
	private Transform transform;

	// Token: 0x040000CB RID: 203
	private MeshRenderer meshRenderer;

	// Token: 0x040000CC RID: 204
	private int timerID = -1;

	// Token: 0x040000CD RID: 205
	private bool isFadeOut;

	// Token: 0x040000CE RID: 206
	private bool isEnabled;

	// Token: 0x040000CF RID: 207
	private Color defaultColor;

	// Token: 0x040000D0 RID: 208
	private Color color;

	// Token: 0x040000D1 RID: 209
	private int tintColorRef;
}
