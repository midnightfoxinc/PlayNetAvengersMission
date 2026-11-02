using System;
using UnityEngine;

// Token: 0x0200000E RID: 14
public class F3DPredictTrajectory : MonoBehaviour
{
	// Token: 0x0600006F RID: 111 RVA: 0x00005530 File Offset: 0x00003730
	public static Vector3 Predict(Vector3 sPos, Vector3 tPos, Vector3 tLastPos, float pSpeed)
	{
		Vector3 vector = (tPos - tLastPos) / Time.deltaTime;
		float projFlightTime = F3DPredictTrajectory.GetProjFlightTime(tPos - sPos, vector, pSpeed);
		if (projFlightTime > 0f)
		{
			return tPos + projFlightTime * vector;
		}
		return tPos;
	}

	// Token: 0x06000070 RID: 112 RVA: 0x00005578 File Offset: 0x00003778
	private static float GetProjFlightTime(Vector3 dist, Vector3 tVel, float pSpeed)
	{
		float num = Vector3.Dot(tVel, tVel) - pSpeed * pSpeed;
		float num2 = 2f * Vector3.Dot(tVel, dist);
		float num3 = Vector3.Dot(dist, dist);
		float num4 = num2 * num2 - 4f * num * num3;
		if (num4 > 0f)
		{
			return 2f * num3 / (Mathf.Sqrt(num4) - num2);
		}
		return -1f;
	}
}
