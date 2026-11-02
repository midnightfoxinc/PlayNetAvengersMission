using System;
using UnityEngine;

// Token: 0x02000011 RID: 17
public class F3DRandomize : MonoBehaviour
{
	// Token: 0x06000081 RID: 129 RVA: 0x00005C0C File Offset: 0x00003E0C
	private void Awake()
	{
		this.transform = base.GetComponent<Transform>();
		this.defaultScale = this.transform.localScale;
	}

	// Token: 0x06000082 RID: 130 RVA: 0x00005C2C File Offset: 0x00003E2C
	private void OnEnable()
	{
		if (this.RandomScale)
		{
			this.transform.localScale = this.defaultScale * Random.Range(this.MinScale, this.MaxScale);
		}
		if (this.RandomRotation)
		{
			this.transform.rotation *= Quaternion.Euler(0f, 0f, Random.Range(this.MinRotation, this.MaxRotaion));
		}
	}

	// Token: 0x040000D2 RID: 210
	private Transform transform;

	// Token: 0x040000D3 RID: 211
	private Vector3 defaultScale;

	// Token: 0x040000D4 RID: 212
	public bool RandomScale;

	// Token: 0x040000D5 RID: 213
	public bool RandomRotation;

	// Token: 0x040000D6 RID: 214
	public float MinScale;

	// Token: 0x040000D7 RID: 215
	public float MaxScale;

	// Token: 0x040000D8 RID: 216
	public float MinRotation;

	// Token: 0x040000D9 RID: 217
	public float MaxRotaion;
}
