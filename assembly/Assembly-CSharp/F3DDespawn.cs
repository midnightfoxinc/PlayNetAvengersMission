using System;
using UnityEngine;

// Token: 0x02000005 RID: 5
public class F3DDespawn : MonoBehaviour
{
	// Token: 0x06000029 RID: 41 RVA: 0x000036E4 File Offset: 0x000018E4
	private void Awake()
	{
		this.aSrc = base.GetComponent<AudioSource>();
	}

	// Token: 0x0600002A RID: 42 RVA: 0x000036F4 File Offset: 0x000018F4
	public void OnSpawned()
	{
		if (!this.DespawnOnMouseUp)
		{
			F3DTime.time.AddTimer(this.DespawnDelay, 1, new Action(this.DespawnOnTimer));
		}
	}

	// Token: 0x0600002B RID: 43 RVA: 0x00003720 File Offset: 0x00001920
	public void OnDespawned()
	{
	}

	// Token: 0x0600002C RID: 44 RVA: 0x00003724 File Offset: 0x00001924
	public void DespawnOnTimer()
	{
		if (this.aSrc != null)
		{
			if (this.aSrc.loop)
			{
				this.DespawnOnMouseUp = true;
			}
			else
			{
				this.DespawnOnMouseUp = false;
				this.Despawn();
			}
		}
		else
		{
			this.Despawn();
		}
	}

	// Token: 0x0600002D RID: 45 RVA: 0x00003778 File Offset: 0x00001978
	public void Despawn()
	{
		F3DPool.instance.Despawn(base.transform);
	}

	// Token: 0x0600002E RID: 46 RVA: 0x0000378C File Offset: 0x0000198C
	private void Update()
	{
		if (Input.GetMouseButtonUp(0) && ((this.aSrc != null && this.aSrc.loop) || this.DespawnOnMouseUp))
		{
			this.Despawn();
		}
	}

	// Token: 0x04000048 RID: 72
	public float DespawnDelay;

	// Token: 0x04000049 RID: 73
	public bool DespawnOnMouseUp;

	// Token: 0x0400004A RID: 74
	private AudioSource aSrc;
}
