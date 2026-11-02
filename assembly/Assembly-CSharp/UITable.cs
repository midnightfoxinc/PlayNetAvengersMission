using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000C8 RID: 200
[AddComponentMenu("NGUI/Interaction/Table")]
public class UITable : UIWidgetContainer
{
	// Token: 0x1700005A RID: 90
	// (set) Token: 0x06000521 RID: 1313 RVA: 0x000229C8 File Offset: 0x00020BC8
	public bool repositionNow
	{
		set
		{
			if (value)
			{
				this.mReposition = true;
				base.enabled = true;
			}
		}
	}

	// Token: 0x06000522 RID: 1314 RVA: 0x000229E0 File Offset: 0x00020BE0
	public List<Transform> GetChildList()
	{
		Transform transform = base.transform;
		List<Transform> list = new List<Transform>();
		for (int i = 0; i < transform.childCount; i++)
		{
			Transform child = transform.GetChild(i);
			if (!this.hideInactive || (child && NGUITools.GetActive(child.gameObject)))
			{
				list.Add(child);
			}
		}
		if (this.sorting != UITable.Sorting.None)
		{
			if (this.sorting == UITable.Sorting.Alphabetic)
			{
				list.Sort(new Comparison<Transform>(UIGrid.SortByName));
			}
			else if (this.sorting == UITable.Sorting.Horizontal)
			{
				list.Sort(new Comparison<Transform>(UIGrid.SortHorizontal));
			}
			else if (this.sorting == UITable.Sorting.Vertical)
			{
				list.Sort(new Comparison<Transform>(UIGrid.SortVertical));
			}
			else if (this.onCustomSort != null)
			{
				list.Sort(this.onCustomSort);
			}
			else
			{
				this.Sort(list);
			}
		}
		return list;
	}

	// Token: 0x06000523 RID: 1315 RVA: 0x00022AE0 File Offset: 0x00020CE0
	protected virtual void Sort(List<Transform> list)
	{
		list.Sort(new Comparison<Transform>(UIGrid.SortByName));
	}

	// Token: 0x06000524 RID: 1316 RVA: 0x00022AF4 File Offset: 0x00020CF4
	protected virtual void Start()
	{
		this.Init();
		this.Reposition();
		base.enabled = false;
	}

	// Token: 0x06000525 RID: 1317 RVA: 0x00022B0C File Offset: 0x00020D0C
	protected virtual void Init()
	{
		this.mInitDone = true;
		this.mPanel = NGUITools.FindInParents<UIPanel>(base.gameObject);
	}

	// Token: 0x06000526 RID: 1318 RVA: 0x00022B28 File Offset: 0x00020D28
	protected virtual void LateUpdate()
	{
		if (this.mReposition)
		{
			this.Reposition();
		}
		base.enabled = false;
	}

	// Token: 0x06000527 RID: 1319 RVA: 0x00022B44 File Offset: 0x00020D44
	private void OnValidate()
	{
		if (!Application.isPlaying && NGUITools.GetActive(this))
		{
			this.Reposition();
		}
	}

	// Token: 0x06000528 RID: 1320 RVA: 0x00022B64 File Offset: 0x00020D64
	protected void RepositionVariableSize(List<Transform> children)
	{
		float num = 0f;
		float num2 = 0f;
		int num3 = (this.columns <= 0) ? 1 : (children.Count / this.columns + 1);
		int num4 = (this.columns <= 0) ? children.Count : this.columns;
		Bounds[,] array = new Bounds[num3, num4];
		Bounds[] array2 = new Bounds[num4];
		Bounds[] array3 = new Bounds[num3];
		int num5 = 0;
		int num6 = 0;
		int i = 0;
		int count = children.Count;
		while (i < count)
		{
			Transform transform = children[i];
			Bounds bounds = NGUIMath.CalculateRelativeWidgetBounds(transform, !this.hideInactive);
			Vector3 localScale = transform.localScale;
			bounds.min = Vector3.Scale(bounds.min, localScale);
			bounds.max = Vector3.Scale(bounds.max, localScale);
			array[num6, num5] = bounds;
			array2[num5].Encapsulate(bounds);
			array3[num6].Encapsulate(bounds);
			if (++num5 >= this.columns && this.columns > 0)
			{
				num5 = 0;
				num6++;
			}
			i++;
		}
		num5 = 0;
		num6 = 0;
		Vector2 pivotOffset = NGUIMath.GetPivotOffset(this.cellAlignment);
		int j = 0;
		int count2 = children.Count;
		while (j < count2)
		{
			Transform transform2 = children[j];
			Bounds bounds2 = array[num6, num5];
			Bounds bounds3 = array2[num5];
			Bounds bounds4 = array3[num6];
			Vector3 localPosition = transform2.localPosition;
			localPosition.x = num + bounds2.extents.x - bounds2.center.x;
			localPosition.x -= Mathf.Lerp(0f, bounds2.max.x - bounds2.min.x - bounds3.max.x + bounds3.min.x, pivotOffset.x) - this.padding.x;
			if (this.direction == UITable.Direction.Down)
			{
				localPosition.y = -num2 - bounds2.extents.y - bounds2.center.y;
				localPosition.y += Mathf.Lerp(bounds2.max.y - bounds2.min.y - bounds4.max.y + bounds4.min.y, 0f, pivotOffset.y) - this.padding.y;
			}
			else
			{
				localPosition.y = num2 + bounds2.extents.y - bounds2.center.y;
				localPosition.y -= Mathf.Lerp(0f, bounds2.max.y - bounds2.min.y - bounds4.max.y + bounds4.min.y, pivotOffset.y) - this.padding.y;
			}
			num += bounds3.size.x + this.padding.x * 2f;
			transform2.localPosition = localPosition;
			if (++num5 >= this.columns && this.columns > 0)
			{
				num5 = 0;
				num6++;
				num = 0f;
				num2 += bounds4.size.y + this.padding.y * 2f;
			}
			j++;
		}
		if (this.pivot != UIWidget.Pivot.TopLeft)
		{
			pivotOffset = NGUIMath.GetPivotOffset(this.pivot);
			Bounds bounds5 = NGUIMath.CalculateRelativeWidgetBounds(base.transform);
			float num7 = Mathf.Lerp(0f, bounds5.size.x, pivotOffset.x);
			float num8 = Mathf.Lerp(-bounds5.size.y, 0f, pivotOffset.y);
			Transform transform3 = base.transform;
			for (int k = 0; k < transform3.childCount; k++)
			{
				Transform child = transform3.GetChild(k);
				SpringPosition component = child.GetComponent<SpringPosition>();
				if (component != null)
				{
					SpringPosition springPosition = component;
					springPosition.target.x = springPosition.target.x - num7;
					SpringPosition springPosition2 = component;
					springPosition2.target.y = springPosition2.target.y - num8;
				}
				else
				{
					Vector3 localPosition2 = child.localPosition;
					localPosition2.x -= num7;
					localPosition2.y -= num8;
					child.localPosition = localPosition2;
				}
			}
		}
	}

	// Token: 0x06000529 RID: 1321 RVA: 0x0002307C File Offset: 0x0002127C
	[ContextMenu("Execute")]
	public virtual void Reposition()
	{
		if (Application.isPlaying && !this.mInitDone && NGUITools.GetActive(this))
		{
			this.Init();
		}
		this.mReposition = false;
		Transform transform = base.transform;
		List<Transform> childList = this.GetChildList();
		if (childList.Count > 0)
		{
			this.RepositionVariableSize(childList);
		}
		if (this.keepWithinPanel && this.mPanel != null)
		{
			this.mPanel.ConstrainTargetToBounds(transform, true);
			UIScrollView component = this.mPanel.GetComponent<UIScrollView>();
			if (component != null)
			{
				component.UpdateScrollbars(true);
			}
		}
		if (this.onReposition != null)
		{
			this.onReposition();
		}
	}

	// Token: 0x04000572 RID: 1394
	public int columns;

	// Token: 0x04000573 RID: 1395
	public UITable.Direction direction;

	// Token: 0x04000574 RID: 1396
	public UITable.Sorting sorting;

	// Token: 0x04000575 RID: 1397
	public UIWidget.Pivot pivot;

	// Token: 0x04000576 RID: 1398
	public UIWidget.Pivot cellAlignment;

	// Token: 0x04000577 RID: 1399
	public bool hideInactive = true;

	// Token: 0x04000578 RID: 1400
	public bool keepWithinPanel;

	// Token: 0x04000579 RID: 1401
	public Vector2 padding = Vector2.zero;

	// Token: 0x0400057A RID: 1402
	public UITable.OnReposition onReposition;

	// Token: 0x0400057B RID: 1403
	public Comparison<Transform> onCustomSort;

	// Token: 0x0400057C RID: 1404
	protected UIPanel mPanel;

	// Token: 0x0400057D RID: 1405
	protected bool mInitDone;

	// Token: 0x0400057E RID: 1406
	protected bool mReposition;

	// Token: 0x020000C9 RID: 201
	public enum Direction
	{
		// Token: 0x04000580 RID: 1408
		Down,
		// Token: 0x04000581 RID: 1409
		Up
	}

	// Token: 0x020000CA RID: 202
	public enum Sorting
	{
		// Token: 0x04000583 RID: 1411
		None,
		// Token: 0x04000584 RID: 1412
		Alphabetic,
		// Token: 0x04000585 RID: 1413
		Horizontal,
		// Token: 0x04000586 RID: 1414
		Vertical,
		// Token: 0x04000587 RID: 1415
		Custom
	}

	// Token: 0x0200033A RID: 826
	// (Invoke) Token: 0x0600150A RID: 5386
	public delegate void OnReposition();
}
