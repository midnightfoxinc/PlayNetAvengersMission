using System;
using UnityEngine;

// Token: 0x020001C3 RID: 451
public class PopupAlert : MonoBehaviour
{
	// Token: 0x06000D22 RID: 3362 RVA: 0x0005EBBC File Offset: 0x0005CDBC
	private void Start()
	{
		this.playTween.Play(true);
	}

	// Token: 0x06000D23 RID: 3363 RVA: 0x0005EBCC File Offset: 0x0005CDCC
	public static void Show(string title, string message, string dismiss, GameObject parent, EventDelegate.Callback onCloseCB = null, float scale = 1f)
	{
		if (PopupAlert.activePopup)
		{
			return;
		}
		GameObject gameObject = Helpers.createPrefab("PopupAlert", string.Empty);
		gameObject.transform.parent = parent.transform;
		gameObject.transform.localScale = new Vector3(1f, 1f, 1f);
		Vector3 vector;
		vector..ctor(0f, 0f, 0f);
		gameObject.transform.position = vector.normalized;
		gameObject.transform.localScale = new Vector3(scale, scale, scale);
		PopupAlert component = gameObject.GetComponent<PopupAlert>();
		component.titleLbl.text = title.ToUpper();
		component.messageLbl.text = message.ToUpper();
		component.dismissLbl.text = dismiss.ToUpper();
		PopupAlert.onClose = onCloseCB;
		PopupAlert.activePopup = gameObject;
		globals.current_alert = gameObject;
	}

	// Token: 0x06000D24 RID: 3364 RVA: 0x0005ECB4 File Offset: 0x0005CEB4
	private void tweenComplete()
	{
		Object.Destroy(base.gameObject);
		PopupAlert.activePopup = null;
	}

	// Token: 0x06000D25 RID: 3365 RVA: 0x0005ECC8 File Offset: 0x0005CEC8
	public void OnDismiss()
	{
		if (PopupAlert.onClose != null)
		{
			PopupAlert.onClose();
		}
		this.playTween.onFinished.Add(new EventDelegate(new EventDelegate.Callback(this.tweenComplete)));
		this.playTween.Play(false);
		PopupAlert.onClose = null;
	}

	// Token: 0x04000D2F RID: 3375
	public UILabel titleLbl;

	// Token: 0x04000D30 RID: 3376
	public UILabel messageLbl;

	// Token: 0x04000D31 RID: 3377
	public UILabel dismissLbl;

	// Token: 0x04000D32 RID: 3378
	public UIPlayTween playTween;

	// Token: 0x04000D33 RID: 3379
	private static EventDelegate.Callback onClose;

	// Token: 0x04000D34 RID: 3380
	private static GameObject activePopup;
}
