using System;
using UnityEngine;

// Token: 0x02000159 RID: 345
public class LayeredAnimTesterBehavior : MonoBehaviour
{
	// Token: 0x06000B1C RID: 2844 RVA: 0x00051D30 File Offset: 0x0004FF30
	private void Awake()
	{
		this._animator = base.GetComponent<Animator>();
	}

	// Token: 0x06000B1D RID: 2845 RVA: 0x00051D40 File Offset: 0x0004FF40
	private void Start()
	{
		for (int i = 0; i < this._animator.layerCount; i++)
		{
			this._animator.Play(this.stateToTest, i);
		}
		this._animator.speed = 0f;
	}

	// Token: 0x06000B1E RID: 2846 RVA: 0x00051D8C File Offset: 0x0004FF8C
	private void Update()
	{
		this.samplesPerSecond = Mathf.Max(1, this.samplesPerSecond);
		if (this._animator.GetCurrentAnimatorStateInfo(0).ToString() != this.stateToTest)
		{
			for (int i = 0; i < this._animator.layerCount; i++)
			{
				this._animator.Play(this.stateToTest, i);
			}
		}
		if (Input.GetKeyDown(32))
		{
			this._playing = !this._playing;
		}
		AnimatorStateInfo currentAnimatorStateInfo = this._animator.GetCurrentAnimatorStateInfo(0);
		int num = (int)(currentAnimatorStateInfo.length * (float)this.samplesPerSecond);
		float num2 = this._normalized_time % 1f * currentAnimatorStateInfo.length;
		int num3 = (int)Mathf.Round(num2 * (float)this.samplesPerSecond);
		int num4 = 0;
		if (Input.GetKeyDown(276))
		{
			num4 = -1;
		}
		if (Input.GetKeyDown(275))
		{
			num4 = 1;
		}
		if (this._playing)
		{
			this.sampleIndex = num3;
		}
		else if (this.sampleIndex != num3)
		{
			num4 = this.sampleIndex - num3;
		}
		if (num4 != 0)
		{
			this._playing = false;
			this.sampleIndex += num4;
			if (this.sampleIndex < 0)
			{
				this.sampleIndex = num - -this.sampleIndex % num;
			}
			if (this.sampleIndex >= num)
			{
				this.sampleIndex %= num;
			}
			num2 = (float)this.sampleIndex / (float)this.samplesPerSecond;
			this._normalized_time = num2 / currentAnimatorStateInfo.length;
		}
		for (int j = 0; j < this._animator.layerCount; j++)
		{
			this._animator.Play(this.stateToTest, j, this._normalized_time);
		}
		this._animator.speed = 0f;
		if (this._playing)
		{
			this._normalized_time += Time.deltaTime / currentAnimatorStateInfo.length;
			if (this._normalized_time > 1f)
			{
				this._normalized_time -= 1f;
			}
		}
	}

	// Token: 0x04000A9C RID: 2716
	public string stateToTest;

	// Token: 0x04000A9D RID: 2717
	public int samplesPerSecond = 24;

	// Token: 0x04000A9E RID: 2718
	public int sampleIndex;

	// Token: 0x04000A9F RID: 2719
	private Animator _animator;

	// Token: 0x04000AA0 RID: 2720
	private bool _playing;

	// Token: 0x04000AA1 RID: 2721
	private float _normalized_time;
}
