using System;
using UnityEngine;

// Token: 0x020001BD RID: 445
public class PinchBehavior : MonoBehaviour
{
	// Token: 0x170001B9 RID: 441
	// (get) Token: 0x06000D0A RID: 3338 RVA: 0x0005E604 File Offset: 0x0005C804
	public bool pinching
	{
		get
		{
			return this._pinching;
		}
	}

	// Token: 0x06000D0B RID: 3339 RVA: 0x0005E60C File Offset: 0x0005C80C
	private void Update()
	{
		if (Input.touchCount > 1)
		{
			if (!this._pinching)
			{
				this._pinching = true;
				this._starting_dist = Vector2.Distance(Input.GetTouch(0).position, Input.GetTouch(1).position);
				this._previous_value = this.value;
			}
			else
			{
				float num = Vector2.Distance(Input.GetTouch(0).position, Input.GetTouch(1).position) - this._starting_dist;
				this.value = this._previous_value + num / this.divisor;
			}
		}
		else
		{
			this._pinching = false;
		}
	}

	// Token: 0x04000D18 RID: 3352
	public float divisor = 1f;

	// Token: 0x04000D19 RID: 3353
	public float value;

	// Token: 0x04000D1A RID: 3354
	private float _starting_dist;

	// Token: 0x04000D1B RID: 3355
	private float _previous_value;

	// Token: 0x04000D1C RID: 3356
	private bool _pinching;
}
