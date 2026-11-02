using System;
using UnityEngine;

// Token: 0x0200002F RID: 47
public class UVTiling : MonoBehaviour
{
	// Token: 0x0600013A RID: 314 RVA: 0x0000A8A0 File Offset: 0x00008AA0
	private void Start()
	{
	}

	// Token: 0x0600013B RID: 315 RVA: 0x0000A8A4 File Offset: 0x00008AA4
	private void Update()
	{
		Vector2 textureOffset = base.GetComponent<Renderer>().material.GetTextureOffset("_MainTex");
		textureOffset.y += this.tilingSpeed * Time.deltaTime;
		while (textureOffset.y > 1f)
		{
			textureOffset.y -= 1f;
		}
		base.GetComponent<Renderer>().material.SetTextureOffset("_MainTex", textureOffset);
	}

	// Token: 0x0400019A RID: 410
	public float tilingSpeed = 1f;
}
