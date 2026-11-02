using System;
using UnityEngine;

// Token: 0x02000002 RID: 2
public class F3DAudioController : MonoBehaviour
{
	// Token: 0x06000002 RID: 2 RVA: 0x000020F4 File Offset: 0x000002F4
	private void Awake()
	{
		F3DAudioController.instance = this;
	}

	// Token: 0x06000003 RID: 3 RVA: 0x000020FC File Offset: 0x000002FC
	private void Update()
	{
		this.timer_01 += Time.deltaTime;
		this.timer_02 += Time.deltaTime;
	}

	// Token: 0x06000004 RID: 4 RVA: 0x00002130 File Offset: 0x00000330
	public void VulcanShot(Vector3 pos)
	{
		if (this.timer_01 >= this.vulcanDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.vulcanShot, pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.95f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 5f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_01 = 0f;
			}
		}
	}

	// Token: 0x06000005 RID: 5 RVA: 0x000021BC File Offset: 0x000003BC
	public void VulcanHit(Vector3 pos)
	{
		if (this.timer_02 >= this.vulcanHitDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.vulcanHit[Random.Range(0, this.vulcanHit.Length)], pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.95f, 1f);
				audioSource.volume = Random.Range(0.6f, 1f);
				audioSource.minDistance = 7f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_02 = 0f;
			}
		}
	}

	// Token: 0x06000006 RID: 6 RVA: 0x00002258 File Offset: 0x00000458
	public void SoloGunShot(Vector3 pos)
	{
		if (this.timer_01 >= this.soloGunDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.soloGunShot, pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.95f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 30f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_01 = 0f;
			}
		}
	}

	// Token: 0x06000007 RID: 7 RVA: 0x000022E4 File Offset: 0x000004E4
	public void SoloGunHit(Vector3 pos)
	{
		if (this.timer_02 >= this.soloGunHitDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.soloGunHit[Random.Range(0, this.soloGunHit.Length)], pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.95f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 50f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_02 = 0f;
			}
		}
	}

	// Token: 0x06000008 RID: 8 RVA: 0x00002380 File Offset: 0x00000580
	public void SniperShot(Vector3 pos)
	{
		if (this.timer_01 >= this.sniperDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.sniperShot, pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.9f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 6f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_01 = 0f;
			}
		}
	}

	// Token: 0x06000009 RID: 9 RVA: 0x0000240C File Offset: 0x0000060C
	public void SniperHit(Vector3 pos)
	{
		if (this.timer_02 >= this.sniperHitDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.sniperHit[Random.Range(0, this.sniperHit.Length)], pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.9f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 8f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_02 = 0f;
			}
		}
	}

	// Token: 0x0600000A RID: 10 RVA: 0x000024A8 File Offset: 0x000006A8
	public void ShotGunShot(Vector3 pos)
	{
		if (this.timer_01 >= this.shotGunDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.shotGunShot, pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.9f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 8f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_01 = 0f;
			}
		}
	}

	// Token: 0x0600000B RID: 11 RVA: 0x00002534 File Offset: 0x00000734
	public void ShotGunHit(Vector3 pos)
	{
		if (this.timer_02 >= this.shotGunHitDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.shotGunHit[Random.Range(0, this.shotGunHit.Length)], pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.9f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 7f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_02 = 0f;
			}
		}
	}

	// Token: 0x0600000C RID: 12 RVA: 0x000025D0 File Offset: 0x000007D0
	public void SeekerShot(Vector3 pos)
	{
		if (this.timer_01 >= this.seekerDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.seekerShot, pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.8f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 8f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_01 = 0f;
			}
		}
	}

	// Token: 0x0600000D RID: 13 RVA: 0x0000265C File Offset: 0x0000085C
	public void SeekerHit(Vector3 pos)
	{
		if (this.timer_02 >= this.seekerHitDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.seekerHit[Random.Range(0, this.seekerHit.Length)], pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.8f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 25f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_02 = 0f;
			}
		}
	}

	// Token: 0x0600000E RID: 14 RVA: 0x000026F8 File Offset: 0x000008F8
	public void RailGunShot(Vector3 pos)
	{
		if (this.timer_01 >= this.railgunDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.railgunShot, pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.8f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 4f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_01 = 0f;
			}
		}
	}

	// Token: 0x0600000F RID: 15 RVA: 0x00002784 File Offset: 0x00000984
	public void RailGunHit(Vector3 pos)
	{
		if (this.timer_02 >= this.railgunHitDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.railgunHit[Random.Range(0, this.railgunHit.Length)], pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.8f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 20f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_02 = 0f;
			}
		}
	}

	// Token: 0x06000010 RID: 16 RVA: 0x00002820 File Offset: 0x00000A20
	public void PlasmaGunShot(Vector3 pos)
	{
		if (this.timer_01 >= this.plasmagunDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.plasmagunShot, pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.8f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 4f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_01 = 0f;
			}
		}
	}

	// Token: 0x06000011 RID: 17 RVA: 0x000028AC File Offset: 0x00000AAC
	public void PlasmaGunHit(Vector3 pos)
	{
		if (this.timer_02 >= this.plasmagunHitDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.plasmagunHit[Random.Range(0, this.plasmagunHit.Length)], pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.8f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 50f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_02 = 0f;
			}
		}
	}

	// Token: 0x06000012 RID: 18 RVA: 0x00002948 File Offset: 0x00000B48
	public void PlasmaBeamLoop(Vector3 pos, Transform loopParent)
	{
		AudioSource audioSource = F3DPool.instance.SpawnAudio(this.plasmabeamOpen, pos, null);
		AudioSource audioSource2 = F3DPool.instance.SpawnAudio(this.plasmabeamLoop, pos, loopParent);
		if (audioSource != null && audioSource2 != null)
		{
			audioSource.pitch = Random.Range(0.8f, 1f);
			audioSource.volume = Random.Range(0.8f, 1f);
			audioSource.minDistance = 50f;
			audioSource.loop = false;
			audioSource.Play();
			audioSource2.pitch = Random.Range(0.95f, 1f);
			audioSource2.volume = Random.Range(0.95f, 1f);
			audioSource2.loop = true;
			audioSource2.minDistance = 50f;
			audioSource2.Play();
		}
	}

	// Token: 0x06000013 RID: 19 RVA: 0x00002A18 File Offset: 0x00000C18
	public void PlasmaBeamClose(Vector3 pos)
	{
		AudioSource audioSource = F3DPool.instance.SpawnAudio(this.plasmabeamClose, pos, null);
		if (audioSource != null)
		{
			audioSource.pitch = Random.Range(0.8f, 1f);
			audioSource.volume = Random.Range(0.8f, 1f);
			audioSource.minDistance = 50f;
			audioSource.loop = false;
			audioSource.Play();
		}
	}

	// Token: 0x06000014 RID: 20 RVA: 0x00002A88 File Offset: 0x00000C88
	public void PlasmaBeamHeavyLoop(Vector3 pos, Transform loopParent)
	{
		AudioSource audioSource = F3DPool.instance.SpawnAudio(this.plasmabeamHeavyOpen, pos, null);
		AudioSource audioSource2 = F3DPool.instance.SpawnAudio(this.plasmabeamHeavyLoop, pos, loopParent);
		if (audioSource != null && audioSource2 != null)
		{
			audioSource.pitch = Random.Range(0.8f, 1f);
			audioSource.volume = Random.Range(0.8f, 1f);
			audioSource.minDistance = 50f;
			audioSource.loop = false;
			audioSource.Play();
			audioSource2.pitch = Random.Range(0.95f, 1f);
			audioSource2.volume = Random.Range(0.95f, 1f);
			audioSource2.loop = true;
			audioSource2.minDistance = 50f;
			audioSource2.Play();
		}
	}

	// Token: 0x06000015 RID: 21 RVA: 0x00002B58 File Offset: 0x00000D58
	public void PlasmaBeamHeavyClose(Vector3 pos)
	{
		AudioSource audioSource = F3DPool.instance.SpawnAudio(this.plasmabeamHeavyClose, pos, null);
		if (audioSource != null)
		{
			audioSource.pitch = Random.Range(0.8f, 1f);
			audioSource.volume = Random.Range(0.8f, 1f);
			audioSource.minDistance = 50f;
			audioSource.loop = false;
			audioSource.Play();
		}
	}

	// Token: 0x06000016 RID: 22 RVA: 0x00002BC8 File Offset: 0x00000DC8
	public void LightningGunLoop(Vector3 pos, Transform loopParent)
	{
		AudioSource audioSource = F3DPool.instance.SpawnAudio(this.lightningGunOpen, pos, null);
		AudioSource audioSource2 = F3DPool.instance.SpawnAudio(this.lightningGunLoop, pos, loopParent.parent);
		if (audioSource != null && audioSource2 != null)
		{
			audioSource.pitch = Random.Range(0.8f, 1f);
			audioSource.volume = Random.Range(0.8f, 1f);
			audioSource.minDistance = 50f;
			audioSource.loop = false;
			audioSource.Play();
			audioSource2.pitch = Random.Range(0.95f, 1f);
			audioSource2.volume = Random.Range(0.95f, 1f);
			audioSource2.loop = true;
			audioSource2.minDistance = 50f;
			audioSource2.Play();
		}
	}

	// Token: 0x06000017 RID: 23 RVA: 0x00002C9C File Offset: 0x00000E9C
	public void LightningGunClose(Vector3 pos)
	{
		AudioSource audioSource = F3DPool.instance.SpawnAudio(this.lightningGunClose, pos, null);
		if (audioSource != null)
		{
			audioSource.pitch = Random.Range(0.8f, 1f);
			audioSource.volume = Random.Range(0.8f, 1f);
			audioSource.minDistance = 50f;
			audioSource.loop = false;
			audioSource.Play();
		}
	}

	// Token: 0x06000018 RID: 24 RVA: 0x00002D0C File Offset: 0x00000F0C
	public void FlameGunLoop(Vector3 pos, Transform loopParent)
	{
		AudioSource audioSource = F3DPool.instance.SpawnAudio(this.flameGunOpen, pos, null);
		AudioSource audioSource2 = F3DPool.instance.SpawnAudio(this.flameGunLoop, pos, loopParent.parent);
		if (audioSource != null && audioSource2 != null)
		{
			audioSource.pitch = Random.Range(0.8f, 1f);
			audioSource.volume = Random.Range(0.8f, 1f);
			audioSource.minDistance = 50f;
			audioSource.loop = false;
			audioSource.Play();
			audioSource2.pitch = Random.Range(0.95f, 1f);
			audioSource2.volume = Random.Range(0.95f, 1f);
			audioSource2.loop = true;
			audioSource2.minDistance = 50f;
			audioSource2.Play();
		}
	}

	// Token: 0x06000019 RID: 25 RVA: 0x00002DE0 File Offset: 0x00000FE0
	public void FlameGunClose(Vector3 pos)
	{
		AudioSource audioSource = F3DPool.instance.SpawnAudio(this.flameGunClose, pos, null);
		if (audioSource != null)
		{
			audioSource.pitch = Random.Range(0.8f, 1f);
			audioSource.volume = Random.Range(0.8f, 1f);
			audioSource.minDistance = 50f;
			audioSource.loop = false;
			audioSource.Play();
		}
	}

	// Token: 0x0600001A RID: 26 RVA: 0x00002E50 File Offset: 0x00001050
	public void LaserImpulseShot(Vector3 pos)
	{
		if (this.timer_01 >= this.laserImpulseDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.laserImpulseShot, pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.9f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 20f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_01 = 0f;
			}
		}
	}

	// Token: 0x0600001B RID: 27 RVA: 0x00002EDC File Offset: 0x000010DC
	public void LaserImpulseHit(Vector3 pos)
	{
		if (this.timer_02 >= this.laserImpulseHitDelay)
		{
			AudioSource audioSource = F3DPool.instance.SpawnAudio(this.laserImpulseHit[Random.Range(0, this.plasmagunHit.Length)], pos, null);
			if (audioSource != null)
			{
				audioSource.pitch = Random.Range(0.8f, 1f);
				audioSource.volume = Random.Range(0.8f, 1f);
				audioSource.minDistance = 20f;
				audioSource.loop = false;
				audioSource.Play();
				this.timer_02 = 0f;
			}
		}
	}

	// Token: 0x04000001 RID: 1
	public static F3DAudioController instance;

	// Token: 0x04000002 RID: 2
	private float timer_01;

	// Token: 0x04000003 RID: 3
	private float timer_02;

	// Token: 0x04000004 RID: 4
	[Header("Vulcan")]
	public AudioClip[] vulcanHit;

	// Token: 0x04000005 RID: 5
	public AudioClip vulcanShot;

	// Token: 0x04000006 RID: 6
	public float vulcanDelay;

	// Token: 0x04000007 RID: 7
	public float vulcanHitDelay;

	// Token: 0x04000008 RID: 8
	[Header("Solo gun")]
	public AudioClip[] soloGunHit;

	// Token: 0x04000009 RID: 9
	public AudioClip soloGunShot;

	// Token: 0x0400000A RID: 10
	public float soloGunDelay;

	// Token: 0x0400000B RID: 11
	public float soloGunHitDelay;

	// Token: 0x0400000C RID: 12
	[Header("Sniper")]
	public AudioClip[] sniperHit;

	// Token: 0x0400000D RID: 13
	public AudioClip sniperShot;

	// Token: 0x0400000E RID: 14
	public float sniperDelay;

	// Token: 0x0400000F RID: 15
	public float sniperHitDelay;

	// Token: 0x04000010 RID: 16
	[Header("Shot gun")]
	public AudioClip[] shotGunHit;

	// Token: 0x04000011 RID: 17
	public AudioClip shotGunShot;

	// Token: 0x04000012 RID: 18
	public float shotGunDelay;

	// Token: 0x04000013 RID: 19
	public float shotGunHitDelay;

	// Token: 0x04000014 RID: 20
	[Header("Seeker")]
	public AudioClip[] seekerHit;

	// Token: 0x04000015 RID: 21
	public AudioClip seekerShot;

	// Token: 0x04000016 RID: 22
	public float seekerDelay;

	// Token: 0x04000017 RID: 23
	public float seekerHitDelay;

	// Token: 0x04000018 RID: 24
	[Header("Rail gun")]
	public AudioClip[] railgunHit;

	// Token: 0x04000019 RID: 25
	public AudioClip railgunShot;

	// Token: 0x0400001A RID: 26
	public float railgunDelay;

	// Token: 0x0400001B RID: 27
	public float railgunHitDelay;

	// Token: 0x0400001C RID: 28
	[Header("Plasma gun")]
	public AudioClip[] plasmagunHit;

	// Token: 0x0400001D RID: 29
	public AudioClip plasmagunShot;

	// Token: 0x0400001E RID: 30
	public float plasmagunDelay;

	// Token: 0x0400001F RID: 31
	public float plasmagunHitDelay;

	// Token: 0x04000020 RID: 32
	[Header("Plasma beam")]
	public AudioClip plasmabeamOpen;

	// Token: 0x04000021 RID: 33
	public AudioClip plasmabeamLoop;

	// Token: 0x04000022 RID: 34
	public AudioClip plasmabeamClose;

	// Token: 0x04000023 RID: 35
	[Header("Plasma beam heavy")]
	public AudioClip plasmabeamHeavyOpen;

	// Token: 0x04000024 RID: 36
	public AudioClip plasmabeamHeavyLoop;

	// Token: 0x04000025 RID: 37
	public AudioClip plasmabeamHeavyClose;

	// Token: 0x04000026 RID: 38
	[Header("Lightning gun")]
	public AudioClip lightningGunOpen;

	// Token: 0x04000027 RID: 39
	public AudioClip lightningGunLoop;

	// Token: 0x04000028 RID: 40
	public AudioClip lightningGunClose;

	// Token: 0x04000029 RID: 41
	[Header("Flame gun")]
	public AudioClip flameGunOpen;

	// Token: 0x0400002A RID: 42
	public AudioClip flameGunLoop;

	// Token: 0x0400002B RID: 43
	public AudioClip flameGunClose;

	// Token: 0x0400002C RID: 44
	[Header("Laser impulse")]
	public AudioClip[] laserImpulseHit;

	// Token: 0x0400002D RID: 45
	public AudioClip laserImpulseShot;

	// Token: 0x0400002E RID: 46
	public float laserImpulseDelay;

	// Token: 0x0400002F RID: 47
	public float laserImpulseHitDelay;
}
