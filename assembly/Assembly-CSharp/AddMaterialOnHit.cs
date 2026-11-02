using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

// Token: 0x0200013A RID: 314
public class AddMaterialOnHit : MonoBehaviour
{
	// Token: 0x06000A78 RID: 2680 RVA: 0x0004D0F4 File Offset: 0x0004B2F4
	public void UpdateMaterial(RaycastHit hit)
	{
		Transform transform = hit.transform;
		if (transform != null)
		{
			Object.Destroy(base.gameObject, this.RemoveAfterTime);
			this.fadeInOutShaderColor = base.GetComponents<FadeInOutShaderColor>();
			this.fadeInOutShaderFloat = base.GetComponents<FadeInOutShaderFloat>();
			this.uvTextureAnimator = base.GetComponent<UVTextureAnimator>();
			this.renderParent = base.transform.parent.GetComponent<Renderer>();
			Material[] sharedMaterials = this.renderParent.sharedMaterials;
			int num = sharedMaterials.Length + 1;
			Material[] array = new Material[num];
			sharedMaterials.CopyTo(array, 0);
			this.renderParent.material = this.Material;
			this.instanceMat = this.renderParent.material;
			array[num - 1] = this.instanceMat;
			this.renderParent.sharedMaterials = array;
			if (this.UsePointMatrixTransform)
			{
				Matrix4x4 matrix4x = Matrix4x4.TRS(hit.transform.InverseTransformPoint(hit.point), Quaternion.Euler(180f, 180f, 0f), this.TransformScale);
				this.instanceMat.SetMatrix("_DecalMatr", matrix4x);
			}
			if (this.materialQueue != -1)
			{
				this.instanceMat.renderQueue = this.materialQueue;
			}
			if (this.fadeInOutShaderColor != null)
			{
				foreach (FadeInOutShaderColor fadeInOutShaderColor in this.fadeInOutShaderColor)
				{
					fadeInOutShaderColor.UpdateMaterial(this.instanceMat);
				}
			}
			if (this.fadeInOutShaderFloat != null)
			{
				foreach (FadeInOutShaderFloat fadeInOutShaderFloat in this.fadeInOutShaderFloat)
				{
					fadeInOutShaderFloat.UpdateMaterial(this.instanceMat);
				}
			}
			if (this.uvTextureAnimator != null)
			{
				this.uvTextureAnimator.SetInstanceMaterial(this.instanceMat, hit.textureCoord);
			}
		}
	}

	// Token: 0x06000A79 RID: 2681 RVA: 0x0004D2D4 File Offset: 0x0004B4D4
	public void SetMaterialQueue(int matlQueue)
	{
		this.materialQueue = matlQueue;
	}

	// Token: 0x06000A7A RID: 2682 RVA: 0x0004D2E0 File Offset: 0x0004B4E0
	private void OnDestroy()
	{
		if (this.renderParent == null)
		{
			return;
		}
		List<Material> list = Enumerable.ToList<Material>(this.renderParent.sharedMaterials);
		list.Remove(this.instanceMat);
		this.renderParent.sharedMaterials = list.ToArray();
	}

	// Token: 0x04000992 RID: 2450
	public float RemoveAfterTime = 5f;

	// Token: 0x04000993 RID: 2451
	public Material Material;

	// Token: 0x04000994 RID: 2452
	public bool UsePointMatrixTransform;

	// Token: 0x04000995 RID: 2453
	public Vector3 TransformScale = Vector3.one;

	// Token: 0x04000996 RID: 2454
	private FadeInOutShaderColor[] fadeInOutShaderColor;

	// Token: 0x04000997 RID: 2455
	private FadeInOutShaderFloat[] fadeInOutShaderFloat;

	// Token: 0x04000998 RID: 2456
	private UVTextureAnimator uvTextureAnimator;

	// Token: 0x04000999 RID: 2457
	private Renderer renderParent;

	// Token: 0x0400099A RID: 2458
	private Material instanceMat;

	// Token: 0x0400099B RID: 2459
	private int materialQueue = -1;
}
