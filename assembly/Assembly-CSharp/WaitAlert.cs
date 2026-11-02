using System;
using UnityEngine;

// Token: 0x020001C4 RID: 452
public class WaitAlert : MonoBehaviour
{
	// Token: 0x06000D27 RID: 3367 RVA: 0x0005ED24 File Offset: 0x0005CF24
	private void Start()
	{
		this.playTween.Play(true);
	}

	// Token: 0x06000D28 RID: 3368 RVA: 0x0005ED34 File Offset: 0x0005CF34
	public static GameObject Show(string title, GameObject parent, Vector3 position)
	{
		WaitAlert.alertGO = Helpers.createPrefab("Wait Alert", string.Empty);
		WaitAlert.alertGO.transform.parent = parent.gameObject.transform;
		WaitAlert.alertGO.transform.SnapToZero();
		WaitAlert component = WaitAlert.alertGO.GetComponent<WaitAlert>();
		component.waitLabel.text = title;
		globals.current_alert = WaitAlert.alertGO;
		return WaitAlert.alertGO;
	}

	// Token: 0x06000D29 RID: 3369 RVA: 0x0005EDA4 File Offset: 0x0005CFA4
	public static void updateLabel(string title)
	{
	}

	// Token: 0x06000D2A RID: 3370 RVA: 0x0005EDA8 File Offset: 0x0005CFA8
	private void tweenComplete()
	{
		Object.Destroy(base.gameObject);
	}

	// Token: 0x06000D2B RID: 3371 RVA: 0x0005EDB8 File Offset: 0x0005CFB8
	public void OnDismiss()
	{
		if (WaitAlert.alertGO != null)
		{
			this.playTween.onFinished.Add(new EventDelegate(new EventDelegate.Callback(this.tweenComplete)));
			this.playTween.Play(false);
		}
	}

	// Token: 0x04000D35 RID: 3381
	public UILabel waitLabel;

	// Token: 0x04000D36 RID: 3382
	public UIPlayTween playTween;

	// Token: 0x04000D37 RID: 3383
	private static GameObject alertGO;
}
