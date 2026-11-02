using System;
using UnityEngine;

// Token: 0x02000008 RID: 8
public class F3DFlameThrower : MonoBehaviour
{
	// Token: 0x0600004C RID: 76 RVA: 0x00004638 File Offset: 0x00002838
	private void Start()
	{
		this.ps = base.GetComponent<ParticleSystem>();
	}

	// Token: 0x0600004D RID: 77 RVA: 0x00004648 File Offset: 0x00002848
	private void OnSpawned()
	{
		this.despawn = false;
		F3DAudioController.instance.FlameGunLoop(base.transform.position, base.transform);
		this.lightState = 1;
		this.pLight.intensity = 0f;
	}

	// Token: 0x0600004E RID: 78 RVA: 0x00004690 File Offset: 0x00002890
	private void OnDespawned()
	{
	}

	// Token: 0x0600004F RID: 79 RVA: 0x00004694 File Offset: 0x00002894
	private void OnDespawn()
	{
		F3DPool.instance.Despawn(base.transform);
	}

	// Token: 0x06000050 RID: 80 RVA: 0x000046A8 File Offset: 0x000028A8
	private void Update()
	{
		if (Input.GetMouseButtonUp(0) && !this.despawn)
		{
			this.despawn = true;
			F3DTime.time.AddTimer(1f, 1, new Action(this.OnDespawn));
			this.ps.Stop();
			if (this.heat)
			{
				this.heat.Stop();
			}
			F3DAudioController.instance.FlameGunClose(base.transform.position);
			this.pLight.intensity = 0.6f;
			this.lightState = -1;
		}
		if (this.lightState == 1)
		{
			this.pLight.intensity = Mathf.Lerp(this.pLight.intensity, 0.7f, Time.deltaTime * 10f);
			if (this.pLight.intensity >= 0.5f)
			{
				this.lightState = 0;
			}
		}
		else if (this.lightState == -1)
		{
			this.pLight.intensity = Mathf.Lerp(this.pLight.intensity, -0.1f, Time.deltaTime * 10f);
			if (this.pLight.intensity <= 0f)
			{
				this.lightState = 0;
			}
		}
	}

	// Token: 0x0400007B RID: 123
	public Light pLight;

	// Token: 0x0400007C RID: 124
	public ParticleSystem heat;

	// Token: 0x0400007D RID: 125
	private int lightState;

	// Token: 0x0400007E RID: 126
	private bool despawn;

	// Token: 0x0400007F RID: 127
	private ParticleSystem ps;
}
