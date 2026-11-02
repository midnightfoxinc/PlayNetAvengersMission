using System;
using UnityEngine;

// Token: 0x020000F1 RID: 241
[AddComponentMenu("NGUI/Internal/Event Listener")]
public class UIEventListener : MonoBehaviour
{
	// Token: 0x170000A1 RID: 161
	// (get) Token: 0x06000702 RID: 1794 RVA: 0x00035728 File Offset: 0x00033928
	private bool isColliderEnabled
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

	// Token: 0x06000703 RID: 1795 RVA: 0x0003576C File Offset: 0x0003396C
	private void OnSubmit()
	{
		if (this.isColliderEnabled && this.onSubmit != null)
		{
			this.onSubmit(base.gameObject);
		}
	}

	// Token: 0x06000704 RID: 1796 RVA: 0x00035798 File Offset: 0x00033998
	private void OnClick()
	{
		if (this.isColliderEnabled && this.onClick != null)
		{
			this.onClick(base.gameObject);
		}
	}

	// Token: 0x06000705 RID: 1797 RVA: 0x000357C4 File Offset: 0x000339C4
	private void OnDoubleClick()
	{
		if (this.isColliderEnabled && this.onDoubleClick != null)
		{
			this.onDoubleClick(base.gameObject);
		}
	}

	// Token: 0x06000706 RID: 1798 RVA: 0x000357F0 File Offset: 0x000339F0
	private void OnHover(bool isOver)
	{
		if (this.isColliderEnabled && this.onHover != null)
		{
			this.onHover(base.gameObject, isOver);
		}
	}

	// Token: 0x06000707 RID: 1799 RVA: 0x00035828 File Offset: 0x00033A28
	private void OnPress(bool isPressed)
	{
		if (this.isColliderEnabled && this.onPress != null)
		{
			this.onPress(base.gameObject, isPressed);
		}
	}

	// Token: 0x06000708 RID: 1800 RVA: 0x00035860 File Offset: 0x00033A60
	private void OnSelect(bool selected)
	{
		if (this.isColliderEnabled && this.onSelect != null)
		{
			this.onSelect(base.gameObject, selected);
		}
	}

	// Token: 0x06000709 RID: 1801 RVA: 0x00035898 File Offset: 0x00033A98
	private void OnScroll(float delta)
	{
		if (this.isColliderEnabled && this.onScroll != null)
		{
			this.onScroll(base.gameObject, delta);
		}
	}

	// Token: 0x0600070A RID: 1802 RVA: 0x000358D0 File Offset: 0x00033AD0
	private void OnDragStart()
	{
		if (this.onDragStart != null)
		{
			this.onDragStart(base.gameObject);
		}
	}

	// Token: 0x0600070B RID: 1803 RVA: 0x000358F0 File Offset: 0x00033AF0
	private void OnDrag(Vector2 delta)
	{
		if (this.onDrag != null)
		{
			this.onDrag(base.gameObject, delta);
		}
	}

	// Token: 0x0600070C RID: 1804 RVA: 0x00035910 File Offset: 0x00033B10
	private void OnDragOver()
	{
		if (this.isColliderEnabled && this.onDragOver != null)
		{
			this.onDragOver(base.gameObject);
		}
	}

	// Token: 0x0600070D RID: 1805 RVA: 0x0003593C File Offset: 0x00033B3C
	private void OnDragOut()
	{
		if (this.isColliderEnabled && this.onDragOut != null)
		{
			this.onDragOut(base.gameObject);
		}
	}

	// Token: 0x0600070E RID: 1806 RVA: 0x00035968 File Offset: 0x00033B68
	private void OnDragEnd()
	{
		if (this.onDragEnd != null)
		{
			this.onDragEnd(base.gameObject);
		}
	}

	// Token: 0x0600070F RID: 1807 RVA: 0x00035988 File Offset: 0x00033B88
	private void OnDrop(GameObject go)
	{
		if (this.isColliderEnabled && this.onDrop != null)
		{
			this.onDrop(base.gameObject, go);
		}
	}

	// Token: 0x06000710 RID: 1808 RVA: 0x000359C0 File Offset: 0x00033BC0
	private void OnKey(KeyCode key)
	{
		if (this.isColliderEnabled && this.onKey != null)
		{
			this.onKey(base.gameObject, key);
		}
	}

	// Token: 0x06000711 RID: 1809 RVA: 0x000359F8 File Offset: 0x00033BF8
	private void OnTooltip(bool show)
	{
		if (this.isColliderEnabled && this.onTooltip != null)
		{
			this.onTooltip(base.gameObject, show);
		}
	}

	// Token: 0x06000712 RID: 1810 RVA: 0x00035A30 File Offset: 0x00033C30
	public static UIEventListener Get(GameObject go)
	{
		UIEventListener uieventListener = go.GetComponent<UIEventListener>();
		if (uieventListener == null)
		{
			uieventListener = go.AddComponent<UIEventListener>();
		}
		return uieventListener;
	}

	// Token: 0x040006C2 RID: 1730
	public object parameter;

	// Token: 0x040006C3 RID: 1731
	public UIEventListener.VoidDelegate onSubmit;

	// Token: 0x040006C4 RID: 1732
	public UIEventListener.VoidDelegate onClick;

	// Token: 0x040006C5 RID: 1733
	public UIEventListener.VoidDelegate onDoubleClick;

	// Token: 0x040006C6 RID: 1734
	public UIEventListener.BoolDelegate onHover;

	// Token: 0x040006C7 RID: 1735
	public UIEventListener.BoolDelegate onPress;

	// Token: 0x040006C8 RID: 1736
	public UIEventListener.BoolDelegate onSelect;

	// Token: 0x040006C9 RID: 1737
	public UIEventListener.FloatDelegate onScroll;

	// Token: 0x040006CA RID: 1738
	public UIEventListener.VoidDelegate onDragStart;

	// Token: 0x040006CB RID: 1739
	public UIEventListener.VectorDelegate onDrag;

	// Token: 0x040006CC RID: 1740
	public UIEventListener.VoidDelegate onDragOver;

	// Token: 0x040006CD RID: 1741
	public UIEventListener.VoidDelegate onDragOut;

	// Token: 0x040006CE RID: 1742
	public UIEventListener.VoidDelegate onDragEnd;

	// Token: 0x040006CF RID: 1743
	public UIEventListener.ObjectDelegate onDrop;

	// Token: 0x040006D0 RID: 1744
	public UIEventListener.KeyCodeDelegate onKey;

	// Token: 0x040006D1 RID: 1745
	public UIEventListener.BoolDelegate onTooltip;

	// Token: 0x02000347 RID: 839
	// (Invoke) Token: 0x0600153E RID: 5438
	public delegate void VoidDelegate(GameObject go);

	// Token: 0x02000348 RID: 840
	// (Invoke) Token: 0x06001542 RID: 5442
	public delegate void BoolDelegate(GameObject go, bool state);

	// Token: 0x02000349 RID: 841
	// (Invoke) Token: 0x06001546 RID: 5446
	public delegate void FloatDelegate(GameObject go, float delta);

	// Token: 0x0200034A RID: 842
	// (Invoke) Token: 0x0600154A RID: 5450
	public delegate void VectorDelegate(GameObject go, Vector2 delta);

	// Token: 0x0200034B RID: 843
	// (Invoke) Token: 0x0600154E RID: 5454
	public delegate void ObjectDelegate(GameObject go, GameObject obj);

	// Token: 0x0200034C RID: 844
	// (Invoke) Token: 0x06001552 RID: 5458
	public delegate void KeyCodeDelegate(GameObject go, KeyCode key);
}
