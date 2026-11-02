using System;
using UnityEngine;

// Token: 0x020001CC RID: 460
public class LoggerBehavior : MonoBehaviour
{
	// Token: 0x06000DA2 RID: 3490 RVA: 0x00061E20 File Offset: 0x00060020
	private void Start()
	{
	}

	// Token: 0x06000DA3 RID: 3491 RVA: 0x00061E24 File Offset: 0x00060024
	private void Update()
	{
	}

	// Token: 0x06000DA4 RID: 3492 RVA: 0x00061E28 File Offset: 0x00060028
	public static void Show(GameObject parent)
	{
		if (LoggerBehavior.activeLogger)
		{
			return;
		}
		GameObject gameObject = Helpers.createPrefab("LogPanel", string.Empty);
		gameObject.transform.parent = parent.gameObject.transform;
		gameObject.transform.localScale = new Vector3(1f, 1f, 1f);
		Transform transform = gameObject.transform;
		Vector3 vector;
		vector..ctor(0f, 0f, 0f);
		transform.position = vector.normalized;
		LoggerBehavior.activeLogger = gameObject;
	}

	// Token: 0x06000DA5 RID: 3493 RVA: 0x00061EB8 File Offset: 0x000600B8
	public void hide(GameObject parent)
	{
		Transform transform = LoggerBehavior.activeLogger.transform;
		Vector3 vector;
		vector..ctor(0f, 1000f, 0f);
		transform.position = vector.normalized;
	}

	// Token: 0x04000D5D RID: 3421
	private static GameObject activeLogger;

	// Token: 0x04000D5E RID: 3422
	public GameObject showbutton;

	// Token: 0x04000D5F RID: 3423
	public UILabel label;
}
