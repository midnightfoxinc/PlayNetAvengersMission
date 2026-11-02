using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000A9 RID: 169
[AddComponentMenu("NGUI/Interaction/Event Trigger")]
public class UIEventTrigger : MonoBehaviour
{
	// Token: 0x17000030 RID: 48
	// (get) Token: 0x06000411 RID: 1041 RVA: 0x0001B16C File Offset: 0x0001936C
	public bool isColliderEnabled
	{
		get
		{
			Collider component = base.GetComponent<Collider>();
			if (component != null)
			{
				return component.enabled;
			}
			Collider2D component2 = base.GetComponent<Collider2D>();
			return component2 != null && component2.enabled;
		}
	}

	// Token: 0x06000412 RID: 1042 RVA: 0x0001B1B0 File Offset: 0x000193B0
	private void OnHover(bool isOver)
	{
		if (UIEventTrigger.current != null || !this.isColliderEnabled)
		{
			return;
		}
		UIEventTrigger.current = this;
		if (isOver)
		{
			EventDelegate.Execute(this.onHoverOver);
		}
		else
		{
			EventDelegate.Execute(this.onHoverOut);
		}
		UIEventTrigger.current = null;
	}

	// Token: 0x06000413 RID: 1043 RVA: 0x0001B208 File Offset: 0x00019408
	private void OnPress(bool pressed)
	{
		if (UIEventTrigger.current != null || !this.isColliderEnabled)
		{
			return;
		}
		UIEventTrigger.current = this;
		if (pressed)
		{
			EventDelegate.Execute(this.onPress);
		}
		else
		{
			EventDelegate.Execute(this.onRelease);
		}
		UIEventTrigger.current = null;
	}

	// Token: 0x06000414 RID: 1044 RVA: 0x0001B260 File Offset: 0x00019460
	private void OnSelect(bool selected)
	{
		if (UIEventTrigger.current != null || !this.isColliderEnabled)
		{
			return;
		}
		UIEventTrigger.current = this;
		if (selected)
		{
			EventDelegate.Execute(this.onSelect);
		}
		else
		{
			EventDelegate.Execute(this.onDeselect);
		}
		UIEventTrigger.current = null;
	}

	// Token: 0x06000415 RID: 1045 RVA: 0x0001B2B8 File Offset: 0x000194B8
	private void OnClick()
	{
		if (UIEventTrigger.current != null || !this.isColliderEnabled)
		{
			return;
		}
		UIEventTrigger.current = this;
		EventDelegate.Execute(this.onClick);
		UIEventTrigger.current = null;
	}

	// Token: 0x06000416 RID: 1046 RVA: 0x0001B2F0 File Offset: 0x000194F0
	private void OnDoubleClick()
	{
		if (UIEventTrigger.current != null || !this.isColliderEnabled)
		{
			return;
		}
		UIEventTrigger.current = this;
		EventDelegate.Execute(this.onDoubleClick);
		UIEventTrigger.current = null;
	}

	// Token: 0x06000417 RID: 1047 RVA: 0x0001B328 File Offset: 0x00019528
	private void OnDragStart()
	{
		if (UIEventTrigger.current != null)
		{
			return;
		}
		UIEventTrigger.current = this;
		EventDelegate.Execute(this.onDragStart);
		UIEventTrigger.current = null;
	}

	// Token: 0x06000418 RID: 1048 RVA: 0x0001B360 File Offset: 0x00019560
	private void OnDragEnd()
	{
		if (UIEventTrigger.current != null)
		{
			return;
		}
		UIEventTrigger.current = this;
		EventDelegate.Execute(this.onDragEnd);
		UIEventTrigger.current = null;
	}

	// Token: 0x06000419 RID: 1049 RVA: 0x0001B398 File Offset: 0x00019598
	private void OnDragOver(GameObject go)
	{
		if (UIEventTrigger.current != null || !this.isColliderEnabled)
		{
			return;
		}
		UIEventTrigger.current = this;
		EventDelegate.Execute(this.onDragOver);
		UIEventTrigger.current = null;
	}

	// Token: 0x0600041A RID: 1050 RVA: 0x0001B3D0 File Offset: 0x000195D0
	private void OnDragOut(GameObject go)
	{
		if (UIEventTrigger.current != null || !this.isColliderEnabled)
		{
			return;
		}
		UIEventTrigger.current = this;
		EventDelegate.Execute(this.onDragOut);
		UIEventTrigger.current = null;
	}

	// Token: 0x0600041B RID: 1051 RVA: 0x0001B408 File Offset: 0x00019608
	private void OnDrag(Vector2 delta)
	{
		if (UIEventTrigger.current != null)
		{
			return;
		}
		UIEventTrigger.current = this;
		EventDelegate.Execute(this.onDrag);
		UIEventTrigger.current = null;
	}

	// Token: 0x04000457 RID: 1111
	public static UIEventTrigger current;

	// Token: 0x04000458 RID: 1112
	public List<EventDelegate> onHoverOver = new List<EventDelegate>();

	// Token: 0x04000459 RID: 1113
	public List<EventDelegate> onHoverOut = new List<EventDelegate>();

	// Token: 0x0400045A RID: 1114
	public List<EventDelegate> onPress = new List<EventDelegate>();

	// Token: 0x0400045B RID: 1115
	public List<EventDelegate> onRelease = new List<EventDelegate>();

	// Token: 0x0400045C RID: 1116
	public List<EventDelegate> onSelect = new List<EventDelegate>();

	// Token: 0x0400045D RID: 1117
	public List<EventDelegate> onDeselect = new List<EventDelegate>();

	// Token: 0x0400045E RID: 1118
	public List<EventDelegate> onClick = new List<EventDelegate>();

	// Token: 0x0400045F RID: 1119
	public List<EventDelegate> onDoubleClick = new List<EventDelegate>();

	// Token: 0x04000460 RID: 1120
	public List<EventDelegate> onDragStart = new List<EventDelegate>();

	// Token: 0x04000461 RID: 1121
	public List<EventDelegate> onDragEnd = new List<EventDelegate>();

	// Token: 0x04000462 RID: 1122
	public List<EventDelegate> onDragOver = new List<EventDelegate>();

	// Token: 0x04000463 RID: 1123
	public List<EventDelegate> onDragOut = new List<EventDelegate>();

	// Token: 0x04000464 RID: 1124
	public List<EventDelegate> onDrag = new List<EventDelegate>();
}
