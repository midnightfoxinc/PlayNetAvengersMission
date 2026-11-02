using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000267 RID: 615
public class GUIManager : MonoBehaviour
{
	// Token: 0x060010AA RID: 4266 RVA: 0x00076928 File Offset: 0x00074B28
	private void Start()
	{
		GUIManager.instance = this;
		this.guiFuncs = new List<GUIManager.DrawDelegate>();
	}

	// Token: 0x060010AB RID: 4267 RVA: 0x0007693C File Offset: 0x00074B3C
	public void pushGUIFunc(GUIManager.DrawDelegate drawFunc)
	{
		if (!this.guiFuncs.Contains(drawFunc))
		{
			this.guiFuncs.Add(drawFunc);
		}
	}

	// Token: 0x060010AC RID: 4268 RVA: 0x0007695C File Offset: 0x00074B5C
	public void removeGUIFunc(GUIManager.DrawDelegate drawFunc)
	{
		this.guiFuncs.Remove(drawFunc);
	}

	// Token: 0x060010AD RID: 4269 RVA: 0x0007696C File Offset: 0x00074B6C
	public void insertGUIFunc(GUIManager.DrawDelegate drawFunc, int index)
	{
		if (this.guiFuncs.Contains(drawFunc))
		{
			this.removeGUIFunc(drawFunc);
		}
		this.guiFuncs.Insert(index, drawFunc);
	}

	// Token: 0x060010AE RID: 4270 RVA: 0x00076994 File Offset: 0x00074B94
	private void OnGUI()
	{
	}

	// Token: 0x060010AF RID: 4271 RVA: 0x00076998 File Offset: 0x00074B98
	private void Update()
	{
	}

	// Token: 0x040010F9 RID: 4345
	public static GUIManager instance;

	// Token: 0x040010FA RID: 4346
	private List<GUIManager.DrawDelegate> guiFuncs;

	// Token: 0x02000366 RID: 870
	// (Invoke) Token: 0x060015BA RID: 5562
	public delegate void DrawDelegate();
}
