using System;
using UnityEngine;

// Token: 0x020001D1 RID: 465
public class TextureRosterLoaderBehavior : MonoBehaviour
{
	// Token: 0x06000DDA RID: 3546 RVA: 0x00062A80 File Offset: 0x00060C80
	private void Start()
	{
		this.renderer = base.GetComponent<Renderer>();
	}

	// Token: 0x06000DDB RID: 3547 RVA: 0x00062A90 File Offset: 0x00060C90
	private void OnBecameVisible()
	{
		this.renderer.material.mainTexture = this.texture_roster.texture_for_id(this.roster_id);
	}

	// Token: 0x06000DDC RID: 3548 RVA: 0x00062AB4 File Offset: 0x00060CB4
	private void OnBecameInvisible()
	{
		this.renderer.material.mainTexture = null;
	}

	// Token: 0x04000D87 RID: 3463
	public TextureRosterBehavior texture_roster;

	// Token: 0x04000D88 RID: 3464
	public string roster_id;

	// Token: 0x04000D89 RID: 3465
	private Renderer renderer;
}
