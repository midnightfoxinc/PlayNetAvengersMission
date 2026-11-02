using System;
using UnityEngine;

// Token: 0x0200009F RID: 159
[AddComponentMenu("NGUI/Interaction/Drag Camera")]
[ExecuteInEditMode]
public class UIDragCamera : MonoBehaviour
{
	// Token: 0x060003CF RID: 975 RVA: 0x0001933C File Offset: 0x0001753C
	private void Awake()
	{
		if (this.draggableCamera == null)
		{
			this.draggableCamera = NGUITools.FindInParents<UIDraggableCamera>(base.gameObject);
		}
	}

	// Token: 0x060003D0 RID: 976 RVA: 0x0001936C File Offset: 0x0001756C
	private void OnPress(bool isPressed)
	{
		if (base.enabled && NGUITools.GetActive(base.gameObject) && this.draggableCamera != null)
		{
			this.draggableCamera.Press(isPressed);
		}
	}

	// Token: 0x060003D1 RID: 977 RVA: 0x000193B4 File Offset: 0x000175B4
	private void OnDrag(Vector2 delta)
	{
		if (base.enabled && NGUITools.GetActive(base.gameObject) && this.draggableCamera != null)
		{
			this.draggableCamera.Drag(delta);
		}
	}

	// Token: 0x060003D2 RID: 978 RVA: 0x000193FC File Offset: 0x000175FC
	private void OnScroll(float delta)
	{
		if (base.enabled && NGUITools.GetActive(base.gameObject) && this.draggableCamera != null)
		{
			this.draggableCamera.Scroll(delta);
		}
	}

	// Token: 0x04000406 RID: 1030
	public UIDraggableCamera draggableCamera;
}
