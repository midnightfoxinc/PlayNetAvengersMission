using System;
using UnityEngine;

// Token: 0x0200027E RID: 638
public static class camera_extensions
{
	// Token: 0x0600111E RID: 4382 RVA: 0x0007A22C File Offset: 0x0007842C
	public static void SetVanishingPoint(this Camera cam, Vector2 offset)
	{
		Matrix4x4 projectionMatrix = cam.projectionMatrix;
		float num = 2f * cam.nearClipPlane / projectionMatrix.m00;
		float num2 = 2f * cam.nearClipPlane / projectionMatrix.m11;
		float num3 = -num / 2f - offset.x;
		float right = num3 + num;
		float num4 = -num2 / 2f - offset.y;
		float top = num4 + num2;
		cam.projectionMatrix = camera_extensions.PerspectiveOffCenter(num3, right, num4, top, cam.nearClipPlane, cam.farClipPlane);
	}

	// Token: 0x0600111F RID: 4383 RVA: 0x0007A2B8 File Offset: 0x000784B8
	public static void SetVanishingPoint(this Camera cam, float x, float y = 0f)
	{
		cam.SetVanishingPoint(new Vector2(x, y));
	}

	// Token: 0x06001120 RID: 4384 RVA: 0x0007A2C8 File Offset: 0x000784C8
	private static Matrix4x4 PerspectiveOffCenter(float left, float right, float bottom, float top, float near, float far)
	{
		float num = 2f * near / (right - left);
		float num2 = 2f * near / (top - bottom);
		float num3 = (right + left) / (right - left);
		float num4 = (top + bottom) / (top - bottom);
		float num5 = -(far + near) / (far - near);
		float num6 = -(2f * far * near) / (far - near);
		float num7 = -1f;
		Matrix4x4 result = default(Matrix4x4);
		result[0, 0] = num;
		result[0, 1] = 0f;
		result[0, 2] = num3;
		result[0, 3] = 0f;
		result[1, 0] = 0f;
		result[1, 1] = num2;
		result[1, 2] = num4;
		result[1, 3] = 0f;
		result[2, 0] = 0f;
		result[2, 1] = 0f;
		result[2, 2] = num5;
		result[2, 3] = num6;
		result[3, 0] = 0f;
		result[3, 1] = 0f;
		result[3, 2] = num7;
		result[3, 3] = 0f;
		return result;
	}
}
