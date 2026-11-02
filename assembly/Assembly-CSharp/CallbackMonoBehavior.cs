using System;
using UnityEngine;

// Token: 0x020001DE RID: 478
public abstract class CallbackMonoBehavior : MonoBehaviour
{
	// Token: 0x170001D2 RID: 466
	// (get) Token: 0x06000DFC RID: 3580 RVA: 0x00063130 File Offset: 0x00061330
	protected CallbackHandlerBehavior _callback_handler
	{
		get
		{
			if (!this.__callback_handler)
			{
				if (base.GetComponent<CallbackHandlerBehavior>())
				{
					this.__callback_handler = base.GetComponent<CallbackHandlerBehavior>();
				}
				else
				{
					this.__callback_handler = base.gameObject.AddComponent<CallbackHandlerBehavior>();
				}
			}
			return this.__callback_handler;
		}
	}

	// Token: 0x04000DA7 RID: 3495
	private CallbackHandlerBehavior __callback_handler;
}
