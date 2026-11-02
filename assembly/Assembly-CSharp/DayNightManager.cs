using System;
using System.Collections;
using UnityEngine;

// Token: 0x020002E3 RID: 739
public class DayNightManager : MonoBehaviour
{
	// Token: 0x06001363 RID: 4963 RVA: 0x0008A8A8 File Offset: 0x00088AA8
	private void Start()
	{
		globals.debug("Setting Day/Night Cycle");
		this.SetTime(DateTime.Now);
		base.StartCoroutine(this.UpdateTime());
	}

	// Token: 0x06001364 RID: 4964 RVA: 0x0008A8D8 File Offset: 0x00088AD8
	private void SetTime(DateTime now)
	{
		float num = this.StartDawnHour * 60f;
		float num2 = this.StartDayHour * 60f;
		float num3 = this.StartDuskHour * 60f;
		float num4 = this.StartNightHour * 60f;
		int num5 = now.Hour * 60 + now.Minute;
		int num6 = 86400;
		if (this.UseTransitions)
		{
			this.SetPanelAlpha(this.DayTexture, (float)num5, num2, num3, num4);
			if ((float)num5 >= num4)
			{
				this.SetPanelAlpha(this.NightTexture, (float)num5, num4, (float)num6, (float)(num6 + 1));
			}
			else
			{
				this.SetPanelAlpha(this.NightTexture, (float)num5, (float)(-1 - this.FadeTimeInMintues), num, num2);
			}
		}
		else if ((float)num5 > num4 || (float)num5 < num)
		{
			this.DayTexture.alpha = 0f;
			this.NightTexture.alpha = 1f;
		}
		else if ((float)num5 > num3)
		{
			this.DayTexture.alpha = 0f;
			this.NightTexture.alpha = 0f;
		}
		else if ((float)num5 > num2)
		{
			this.DayTexture.alpha = 1f;
			this.NightTexture.alpha = 0f;
		}
		else if ((float)num5 > num)
		{
			this.DayTexture.alpha = 0f;
			this.NightTexture.alpha = 0f;
		}
	}

	// Token: 0x06001365 RID: 4965 RVA: 0x0008AA54 File Offset: 0x00088C54
	private void SetPanelAlpha(UITexture texture, float CurrentTimeMinutes, float StartTime, float EndTime, float TooLateTime)
	{
		if (CurrentTimeMinutes > StartTime + (float)this.FadeTimeInMintues && CurrentTimeMinutes < EndTime)
		{
			texture.alpha = 1f;
		}
		else if (CurrentTimeMinutes >= StartTime && CurrentTimeMinutes < EndTime)
		{
			float num = (StartTime + (float)this.FadeTimeInMintues - CurrentTimeMinutes) / (float)this.FadeTimeInMintues;
			texture.alpha = Mathf.Clamp(Mathf.Abs(1f - num), 0f, 1f);
		}
		else if (CurrentTimeMinutes >= EndTime && CurrentTimeMinutes < TooLateTime)
		{
			float num2 = (EndTime + (float)this.FadeTimeInMintues - CurrentTimeMinutes) / (float)this.FadeTimeInMintues;
			texture.alpha = Mathf.Clamp(num2, 0f, 1f);
		}
		else
		{
			texture.alpha = 0f;
		}
	}

	// Token: 0x06001366 RID: 4966 RVA: 0x0008AB1C File Offset: 0x00088D1C
	private IEnumerator UpdateTime()
	{
		while (this.UseTransitions)
		{
			this.SetTime(DateTime.Now);
			float CurrentTime = Time.realtimeSinceStartup;
			while (Time.realtimeSinceStartup < CurrentTime + this.UpdateIntervalInSeconds)
			{
				yield return null;
			}
		}
		yield break;
	}

	// Token: 0x040014DF RID: 5343
	public UITexture DayTexture;

	// Token: 0x040014E0 RID: 5344
	public UITexture NightTexture;

	// Token: 0x040014E1 RID: 5345
	public bool UseTransitions;

	// Token: 0x040014E2 RID: 5346
	public float UpdateIntervalInSeconds = 1f;

	// Token: 0x040014E3 RID: 5347
	public int FadeTimeInMintues = 60;

	// Token: 0x040014E4 RID: 5348
	public float StartDawnHour = 5f;

	// Token: 0x040014E5 RID: 5349
	public float StartDayHour = 9f;

	// Token: 0x040014E6 RID: 5350
	public float StartDuskHour = 18f;

	// Token: 0x040014E7 RID: 5351
	public float StartNightHour = 20f;
}
