using System;
using UnityEngine;

// Token: 0x020001C2 RID: 450
public class ConfirmationPopupAlert : MonoBehaviour
{
	// Token: 0x06000D1C RID: 3356 RVA: 0x0005EA20 File Offset: 0x0005CC20
	private void Start()
	{
		this.playTween.Play(true);
	}

	// Token: 0x06000D1D RID: 3357 RVA: 0x0005EA30 File Offset: 0x0005CC30
	public static void Show(string title, string message, string okey, string dismiss, GameObject parent, EventDelegate.Callback onOkeyCB = null, EventDelegate.Callback onCloseCB = null)
	{
		if (ConfirmationPopupAlert.activePopup)
		{
			return;
		}
		GameObject gameObject = Helpers.createPrefab("ConfirmationPopupAlert", string.Empty);
		gameObject.transform.parent = parent.gameObject.transform;
		gameObject.transform.localScale = new Vector3(1f, 1f, 1f);
		ConfirmationPopupAlert component = gameObject.GetComponent<ConfirmationPopupAlert>();
		component.titleLbl.text = title.ToUpper();
		component.messageLbl.text = message.ToUpper();
		component.okeyLbl.text = okey.ToUpper();
		component.dismissLbl.text = dismiss.ToUpper();
		ConfirmationPopupAlert.onClose = onCloseCB;
		ConfirmationPopupAlert.onOkey = onOkeyCB;
		ConfirmationPopupAlert.activePopup = gameObject;
		globals.current_alert = gameObject;
	}

	// Token: 0x06000D1E RID: 3358 RVA: 0x0005EAF8 File Offset: 0x0005CCF8
	private void tweenComplete()
	{
		Object.Destroy(base.gameObject);
		ConfirmationPopupAlert.activePopup = null;
	}

	// Token: 0x06000D1F RID: 3359 RVA: 0x0005EB0C File Offset: 0x0005CD0C
	public void OnOk()
	{
		if (ConfirmationPopupAlert.onOkey != null)
		{
			ConfirmationPopupAlert.onOkey();
		}
		this.playTween.onFinished.Add(new EventDelegate(new EventDelegate.Callback(this.tweenComplete)));
		this.playTween.Play(false);
		ConfirmationPopupAlert.onOkey = null;
	}

	// Token: 0x06000D20 RID: 3360 RVA: 0x0005EB60 File Offset: 0x0005CD60
	public void OnDismiss()
	{
		if (ConfirmationPopupAlert.onClose != null)
		{
			ConfirmationPopupAlert.onClose();
		}
		this.playTween.onFinished.Add(new EventDelegate(new EventDelegate.Callback(this.tweenComplete)));
		this.playTween.Play(false);
		ConfirmationPopupAlert.onClose = null;
	}

	// Token: 0x04000D27 RID: 3367
	public UILabel titleLbl;

	// Token: 0x04000D28 RID: 3368
	public UILabel messageLbl;

	// Token: 0x04000D29 RID: 3369
	public UILabel dismissLbl;

	// Token: 0x04000D2A RID: 3370
	public UILabel okeyLbl;

	// Token: 0x04000D2B RID: 3371
	public UIPlayTween playTween;

	// Token: 0x04000D2C RID: 3372
	private static EventDelegate.Callback onClose;

	// Token: 0x04000D2D RID: 3373
	private static EventDelegate.Callback onOkey;

	// Token: 0x04000D2E RID: 3374
	private static GameObject activePopup;
}
