using System;
using UnityEngine;

// Token: 0x020002EC RID: 748
public class IAPInitializerBehavior : MonoBehaviour
{
	// Token: 0x060013C4 RID: 5060 RVA: 0x0008E97C File Offset: 0x0008CB7C
	private void Start()
	{
		IAPHandler.testing_IAP = this.testing_IAP;
		IAPHandler.initialize(this.androidPublicKey, this.gp_iap_prefix);
	}

	// Token: 0x04001587 RID: 5511
	public string androidPublicKey;

	// Token: 0x04001588 RID: 5512
	public string ios_iap_prefix = "disney.playmationavengersnet.";

	// Token: 0x04001589 RID: 5513
	public string gp_iap_prefix = "gp.disney.playmationavengersnet.";

	// Token: 0x0400158A RID: 5514
	public bool testing_IAP;
}
