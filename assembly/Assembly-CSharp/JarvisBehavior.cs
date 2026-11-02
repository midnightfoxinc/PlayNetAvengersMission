using System;
using UnityEngine;

// Token: 0x020001B7 RID: 439
[RequireComponent(typeof(AudioSource))]
public class JarvisBehavior : MonoBehaviour
{
	// Token: 0x170001B7 RID: 439
	// (get) Token: 0x06000CF0 RID: 3312 RVA: 0x0005DA88 File Offset: 0x0005BC88
	public AudioSource audio
	{
		get
		{
			if (!this._audio)
			{
				this._audio = base.GetComponent<AudioSource>();
			}
			return this._audio;
		}
	}

	// Token: 0x06000CF1 RID: 3313 RVA: 0x0005DAB8 File Offset: 0x0005BCB8
	private void Start()
	{
	}

	// Token: 0x06000CF2 RID: 3314 RVA: 0x0005DABC File Offset: 0x0005BCBC
	private void Update()
	{
		if (this._xscale < 0f)
		{
			this._xscale = this.scaler.localScale.x;
		}
		if (this.audio.isPlaying)
		{
			if (this.sample_size > this.spectrum_size)
			{
				this.sample_size = this.spectrum_size;
			}
			float[] array = new float[this.spectrum_size];
			this.audio.GetSpectrumData(array, 0, this.fft_window);
			float num = 0f;
			for (int i = 0; i < this.sample_size; i++)
			{
				num += array[i];
			}
			num /= (float)this.sample_size;
			this._scale = Mathf.SmoothDamp(this._scale, num, ref this._dscale, this.scale_damp);
			if (this._scale > this.scale_max)
			{
				this._scale = this.scale_max;
			}
			this.scaler.localScale = new Vector3(this._xscale, this._scale * this.scale_mult, this._xscale);
		}
		else
		{
			this.scaler.localScale = new Vector3(this._xscale, 0.01f, this._xscale);
		}
	}

	// Token: 0x04000CEF RID: 3311
	public Transform scaler;

	// Token: 0x04000CF0 RID: 3312
	public float scale_mult = 2f;

	// Token: 0x04000CF1 RID: 3313
	public float scale_max = 0.1f;

	// Token: 0x04000CF2 RID: 3314
	public int spectrum_size = 64;

	// Token: 0x04000CF3 RID: 3315
	public int sample_size = 32;

	// Token: 0x04000CF4 RID: 3316
	public float scale_damp = 0.05f;

	// Token: 0x04000CF5 RID: 3317
	public FFTWindow fft_window;

	// Token: 0x04000CF6 RID: 3318
	private float _xscale = -1f;

	// Token: 0x04000CF7 RID: 3319
	private float _scale = 1f;

	// Token: 0x04000CF8 RID: 3320
	private float _dscale;

	// Token: 0x04000CF9 RID: 3321
	private AudioSource _audio;
}
