using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000AB RID: 171
[AddComponentMenu("NGUI/Interaction/Grid")]
public class UIGrid : UIWidgetContainer
{
	// Token: 0x17000031 RID: 49
	// (set) Token: 0x06000427 RID: 1063 RVA: 0x0001B64C File Offset: 0x0001984C
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

	// Token: 0x06000428 RID: 1064 RVA: 0x0001B664 File Offset: 0x00019864
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
		if (this.sorting != UIGrid.Sorting.None && this.arrangement != UIGrid.Arrangement.CellSnap)
		{
			if (this.sorting == UIGrid.Sorting.Alphabetic)
			{
				list.Sort(new Comparison<Transform>(UIGrid.SortByName));
			}
			else if (this.sorting == UIGrid.Sorting.Horizontal)
			{
				list.Sort(new Comparison<Transform>(UIGrid.SortHorizontal));
			}
			else if (this.sorting == UIGrid.Sorting.Vertical)
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

	// Token: 0x06000429 RID: 1065 RVA: 0x0001B770 File Offset: 0x00019970
	public Transform GetChild(int index)
	{
		List<Transform> childList = this.GetChildList();
		return (index >= childList.Count) ? null : childList[index];
	}

	// Token: 0x0600042A RID: 1066 RVA: 0x0001B7A0 File Offset: 0x000199A0
	public int GetIndex(Transform trans)
	{
		return this.GetChildList().IndexOf(trans);
	}

	// Token: 0x0600042B RID: 1067 RVA: 0x0001B7B0 File Offset: 0x000199B0
	public void AddChild(Transform trans)
	{
		this.AddChild(trans, true);
	}

	// Token: 0x0600042C RID: 1068 RVA: 0x0001B7BC File Offset: 0x000199BC
	public void AddChild(Transform trans, bool sort)
	{
		if (trans != null)
		{
			trans.parent = base.transform;
			this.ResetPosition(this.GetChildList());
		}
	}

	// Token: 0x0600042D RID: 1069 RVA: 0x0001B7F0 File Offset: 0x000199F0
	public bool RemoveChild(Transform t)
	{
		List<Transform> childList = this.GetChildList();
		if (childList.Remove(t))
		{
			this.ResetPosition(childList);
			return true;
		}
		return false;
	}

	// Token: 0x0600042E RID: 1070 RVA: 0x0001B81C File Offset: 0x00019A1C
	protected virtual void Init()
	{
		this.mInitDone = true;
		this.mPanel = NGUITools.FindInParents<UIPanel>(base.gameObject);
	}

	// Token: 0x0600042F RID: 1071 RVA: 0x0001B838 File Offset: 0x00019A38
	protected virtual void Start()
	{
		if (!this.mInitDone)
		{
			this.Init();
		}
		bool flag = this.animateSmoothly;
		this.animateSmoothly = false;
		this.Reposition();
		this.animateSmoothly = flag;
		base.enabled = false;
	}

	// Token: 0x06000430 RID: 1072 RVA: 0x0001B878 File Offset: 0x00019A78
	protected virtual void Update()
	{
		this.Reposition();
		base.enabled = false;
	}

	// Token: 0x06000431 RID: 1073 RVA: 0x0001B888 File Offset: 0x00019A88
	private void OnValidate()
	{
		if (!Application.isPlaying && NGUITools.GetActive(this))
		{
			this.Reposition();
		}
	}

	// Token: 0x06000432 RID: 1074 RVA: 0x0001B8A8 File Offset: 0x00019AA8
	public static int SortByName(Transform a, Transform b)
	{
		return string.Compare(a.name, b.name);
	}

	// Token: 0x06000433 RID: 1075 RVA: 0x0001B8BC File Offset: 0x00019ABC
	public static int SortHorizontal(Transform a, Transform b)
	{
		return a.localPosition.x.CompareTo(b.localPosition.x);
	}

	// Token: 0x06000434 RID: 1076 RVA: 0x0001B8EC File Offset: 0x00019AEC
	public static int SortVertical(Transform a, Transform b)
	{
		return b.localPosition.y.CompareTo(a.localPosition.y);
	}

	// Token: 0x06000435 RID: 1077 RVA: 0x0001B91C File Offset: 0x00019B1C
	protected virtual void Sort(List<Transform> list)
	{
	}

	// Token: 0x06000436 RID: 1078 RVA: 0x0001B920 File Offset: 0x00019B20
	[ContextMenu("Execute")]
	public virtual void Reposition()
	{
		if (Application.isPlaying && !this.mInitDone && NGUITools.GetActive(base.gameObject))
		{
			this.Init();
		}
		if (this.sorted)
		{
			this.sorted = false;
			if (this.sorting == UIGrid.Sorting.None)
			{
				this.sorting = UIGrid.Sorting.Alphabetic;
			}
			NGUITools.SetDirty(this);
		}
		List<Transform> childList = this.GetChildList();
		this.ResetPosition(childList);
		if (this.keepWithinPanel)
		{
			this.ConstrainWithinPanel();
		}
		if (this.onReposition != null)
		{
			this.onReposition();
		}
	}

	// Token: 0x06000437 RID: 1079 RVA: 0x0001B9B8 File Offset: 0x00019BB8
	public void ConstrainWithinPanel()
	{
		if (this.mPanel != null)
		{
			this.mPanel.ConstrainTargetToBounds(base.transform, true);
			UIScrollView component = this.mPanel.GetComponent<UIScrollView>();
			if (component != null)
			{
				component.UpdateScrollbars(true);
			}
		}
	}

	// Token: 0x06000438 RID: 1080 RVA: 0x0001BA08 File Offset: 0x00019C08
	protected virtual void ResetPosition(List<Transform> list)
	{
		this.mReposition = false;
		int num = 0;
		int num2 = 0;
		int num3 = 0;
		int num4 = 0;
		Transform transform = base.transform;
		int i = 0;
		int count = list.Count;
		while (i < count)
		{
			Transform transform2 = list[i];
			Vector3 vector = transform2.localPosition;
			float z = vector.z;
			if (this.arrangement == UIGrid.Arrangement.CellSnap)
			{
				if (this.cellWidth > 0f)
				{
					vector.x = Mathf.Round(vector.x / this.cellWidth) * this.cellWidth;
				}
				if (this.cellHeight > 0f)
				{
					vector.y = Mathf.Round(vector.y / this.cellHeight) * this.cellHeight;
				}
			}
			else
			{
				vector = ((this.arrangement != UIGrid.Arrangement.Horizontal) ? new Vector3(this.cellWidth * (float)num2, -this.cellHeight * (float)num, z) : new Vector3(this.cellWidth * (float)num, -this.cellHeight * (float)num2, z));
			}
			if (this.animateSmoothly && Application.isPlaying && Vector3.SqrMagnitude(transform2.localPosition - vector) >= 0.0001f)
			{
				SpringPosition springPosition = SpringPosition.Begin(transform2.gameObject, vector, 15f);
				springPosition.updateScrollView = true;
				springPosition.ignoreTimeScale = true;
			}
			else
			{
				transform2.localPosition = vector;
			}
			num3 = Mathf.Max(num3, num);
			num4 = Mathf.Max(num4, num2);
			if (++num >= this.maxPerLine && this.maxPerLine > 0)
			{
				num = 0;
				num2++;
			}
			i++;
		}
		if (this.pivot != UIWidget.Pivot.TopLeft)
		{
			Vector2 pivotOffset = NGUIMath.GetPivotOffset(this.pivot);
			float num5;
			float num6;
			if (this.arrangement == UIGrid.Arrangement.Horizontal)
			{
				num5 = Mathf.Lerp(0f, (float)num3 * this.cellWidth, pivotOffset.x);
				num6 = Mathf.Lerp((float)(-(float)num4) * this.cellHeight, 0f, pivotOffset.y);
			}
			else
			{
				num5 = Mathf.Lerp(0f, (float)num4 * this.cellWidth, pivotOffset.x);
				num6 = Mathf.Lerp((float)(-(float)num3) * this.cellHeight, 0f, pivotOffset.y);
			}
			for (int j = 0; j < transform.childCount; j++)
			{
				Transform child = transform.GetChild(j);
				SpringPosition component = child.GetComponent<SpringPosition>();
				if (component != null)
				{
					SpringPosition springPosition2 = component;
					springPosition2.target.x = springPosition2.target.x - num5;
					SpringPosition springPosition3 = component;
					springPosition3.target.y = springPosition3.target.y - num6;
				}
				else
				{
					Vector3 localPosition = child.localPosition;
					localPosition.x -= num5;
					localPosition.y -= num6;
					child.localPosition = localPosition;
				}
			}
		}
	}

	// Token: 0x0400046F RID: 1135
	public UIGrid.Arrangement arrangement;

	// Token: 0x04000470 RID: 1136
	public UIGrid.Sorting sorting;

	// Token: 0x04000471 RID: 1137
	public UIWidget.Pivot pivot;

	// Token: 0x04000472 RID: 1138
	public int maxPerLine;

	// Token: 0x04000473 RID: 1139
	public float cellWidth = 200f;

	// Token: 0x04000474 RID: 1140
	public float cellHeight = 200f;

	// Token: 0x04000475 RID: 1141
	public bool animateSmoothly;

	// Token: 0x04000476 RID: 1142
	public bool hideInactive;

	// Token: 0x04000477 RID: 1143
	public bool keepWithinPanel;

	// Token: 0x04000478 RID: 1144
	public UIGrid.OnReposition onReposition;

	// Token: 0x04000479 RID: 1145
	public Comparison<Transform> onCustomSort;

	// Token: 0x0400047A RID: 1146
	[SerializeField]
	[HideInInspector]
	private bool sorted;

	// Token: 0x0400047B RID: 1147
	protected bool mReposition;

	// Token: 0x0400047C RID: 1148
	protected UIPanel mPanel;

	// Token: 0x0400047D RID: 1149
	protected bool mInitDone;

	// Token: 0x020000AC RID: 172
	public enum Arrangement
	{
		// Token: 0x0400047F RID: 1151
		Horizontal,
		// Token: 0x04000480 RID: 1152
		Vertical,
		// Token: 0x04000481 RID: 1153
		CellSnap
	}

	// Token: 0x020000AD RID: 173
	public enum Sorting
	{
		// Token: 0x04000483 RID: 1155
		None,
		// Token: 0x04000484 RID: 1156
		Alphabetic,
		// Token: 0x04000485 RID: 1157
		Horizontal,
		// Token: 0x04000486 RID: 1158
		Vertical,
		// Token: 0x04000487 RID: 1159
		Custom
	}

	// Token: 0x02000336 RID: 822
	// (Invoke) Token: 0x060014FA RID: 5370
	public delegate void OnReposition();
}
