using System;
using UnityEngine;

// Token: 0x02000097 RID: 151
[AddComponentMenu("NGUI/Interaction/Button Keys (Legacy)")]
[ExecuteInEditMode]
public class UIButtonKeys : UIKeyNavigation
{
	// Token: 0x060003A0 RID: 928 RVA: 0x000180B8 File Offset: 0x000162B8
	protected override void OnEnable()
	{
		this.Upgrade();
		base.OnEnable();
	}

	// Token: 0x060003A1 RID: 929 RVA: 0x000180C8 File Offset: 0x000162C8
	public void Upgrade()
	{
		if (this.onClick == null && this.selectOnClick != null)
		{
			this.onClick = this.selectOnClick.gameObject;
			this.selectOnClick = null;
			NGUITools.SetDirty(this);
		}
		if (this.onLeft == null && this.selectOnLeft != null)
		{
			this.onLeft = this.selectOnLeft.gameObject;
			this.selectOnLeft = null;
			NGUITools.SetDirty(this);
		}
		if (this.onRight == null && this.selectOnRight != null)
		{
			this.onRight = this.selectOnRight.gameObject;
			this.selectOnRight = null;
			NGUITools.SetDirty(this);
		}
		if (this.onUp == null && this.selectOnUp != null)
		{
			this.onUp = this.selectOnUp.gameObject;
			this.selectOnUp = null;
			NGUITools.SetDirty(this);
		}
		if (this.onDown == null && this.selectOnDown != null)
		{
			this.onDown = this.selectOnDown.gameObject;
			this.selectOnDown = null;
			NGUITools.SetDirty(this);
		}
	}

	// Token: 0x040003DC RID: 988
	public UIButtonKeys selectOnClick;

	// Token: 0x040003DD RID: 989
	public UIButtonKeys selectOnUp;

	// Token: 0x040003DE RID: 990
	public UIButtonKeys selectOnDown;

	// Token: 0x040003DF RID: 991
	public UIButtonKeys selectOnLeft;

	// Token: 0x040003E0 RID: 992
	public UIButtonKeys selectOnRight;
}
