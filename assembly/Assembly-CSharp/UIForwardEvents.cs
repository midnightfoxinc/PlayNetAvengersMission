using System;
using UnityEngine;

// Token: 0x020000AA RID: 170
[AddComponentMenu("NGUI/Interaction/Forward Events (Legacy)")]
public class UIForwardEvents : MonoBehaviour
{
	// Token: 0x0600041D RID: 1053 RVA: 0x0001B448 File Offset: 0x00019648
	private void OnHover(bool isOver)
	{
		if (this.onHover && this.target != null)
		{
			this.target.SendMessage("OnHover", isOver, 1);
		}
	}

	// Token: 0x0600041E RID: 1054 RVA: 0x0001B480 File Offset: 0x00019680
	private void OnPress(bool pressed)
	{
		if (this.onPress && this.target != null)
		{
			this.target.SendMessage("OnPress", pressed, 1);
		}
	}

	// Token: 0x0600041F RID: 1055 RVA: 0x0001B4B8 File Offset: 0x000196B8
	private void OnClick()
	{
		if (this.onClick && this.target != null)
		{
			this.target.SendMessage("OnClick", 1);
		}
	}

	// Token: 0x06000420 RID: 1056 RVA: 0x0001B4E8 File Offset: 0x000196E8
	private void OnDoubleClick()
	{
		if (this.onDoubleClick && this.target != null)
		{
			this.target.SendMessage("OnDoubleClick", 1);
		}
	}

	// Token: 0x06000421 RID: 1057 RVA: 0x0001B518 File Offset: 0x00019718
	private void OnSelect(bool selected)
	{
		if (this.onSelect && this.target != null)
		{
			this.target.SendMessage("OnSelect", selected, 1);
		}
	}

	// Token: 0x06000422 RID: 1058 RVA: 0x0001B550 File Offset: 0x00019750
	private void OnDrag(Vector2 delta)
	{
		if (this.onDrag && this.target != null)
		{
			this.target.SendMessage("OnDrag", delta, 1);
		}
	}

	// Token: 0x06000423 RID: 1059 RVA: 0x0001B588 File Offset: 0x00019788
	private void OnDrop(GameObject go)
	{
		if (this.onDrop && this.target != null)
		{
			this.target.SendMessage("OnDrop", go, 1);
		}
	}

	// Token: 0x06000424 RID: 1060 RVA: 0x0001B5C4 File Offset: 0x000197C4
	private void OnSubmit()
	{
		if (this.onSubmit && this.target != null)
		{
			this.target.SendMessage("OnSubmit", 1);
		}
	}

	// Token: 0x06000425 RID: 1061 RVA: 0x0001B5F4 File Offset: 0x000197F4
	private void OnScroll(float delta)
	{
		if (this.onScroll && this.target != null)
		{
			this.target.SendMessage("OnScroll", delta, 1);
		}
	}

	// Token: 0x04000465 RID: 1125
	public GameObject target;

	// Token: 0x04000466 RID: 1126
	public bool onHover;

	// Token: 0x04000467 RID: 1127
	public bool onPress;

	// Token: 0x04000468 RID: 1128
	public bool onClick;

	// Token: 0x04000469 RID: 1129
	public bool onDoubleClick;

	// Token: 0x0400046A RID: 1130
	public bool onSelect;

	// Token: 0x0400046B RID: 1131
	public bool onDrag;

	// Token: 0x0400046C RID: 1132
	public bool onDrop;

	// Token: 0x0400046D RID: 1133
	public bool onSubmit;

	// Token: 0x0400046E RID: 1134
	public bool onScroll;
}
