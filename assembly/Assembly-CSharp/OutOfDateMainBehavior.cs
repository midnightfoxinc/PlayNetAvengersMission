using System;
using UnityEngine;

// Token: 0x020001A1 RID: 417
public class OutOfDateMainBehavior : MonoBehaviour
{
	// Token: 0x06000C90 RID: 3216 RVA: 0x0005B4C4 File Offset: 0x000596C4
	private void Start()
	{
		string text = string.Concat(new string[]
		{
			"YOUR AVENGERSNET APP IS OUT OF DATE.\n\nTHE LATEST VERSION IS [ffff00]",
			globals.latestAppVersion,
			"[-] AND YOUR CURRENTLY-INSTALLED VERSION IS [ffff00]",
			BundleVersion.get(true),
			"[-]\n\nPLEASE DOWNLOAD THE LATEST VERSION FROM "
		});
		text += "GOOGLE PLAY.";
		this.body_label.text = text;
	}

	// Token: 0x06000C91 RID: 3217 RVA: 0x0005B520 File Offset: 0x00059720
	private void Update()
	{
		if (this.ok_button.hit || Input.GetKeyDown(27))
		{
			Application.OpenURL("market://details?id=" + Application.bundleIdentifier);
			Application.Quit();
		}
	}

	// Token: 0x04000C60 RID: 3168
	public buttonBehavior ok_button;

	// Token: 0x04000C61 RID: 3169
	public UILabel body_label;
}
