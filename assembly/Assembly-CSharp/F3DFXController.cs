using System;
using UnityEngine;

// Token: 0x02000007 RID: 7
public class F3DFXController : MonoBehaviour
{
	// Token: 0x06000030 RID: 48 RVA: 0x00003858 File Offset: 0x00001A58
	private void Awake()
	{
		F3DFXController.instance = this;
		for (int i = 0; i < this.ShellParticles.Length; i++)
		{
			this.ShellParticles[i].enableEmission = false;
			this.ShellParticles[i].gameObject.SetActive(true);
		}
	}

	// Token: 0x06000031 RID: 49 RVA: 0x000038A8 File Offset: 0x00001AA8
	private void OnGUI()
	{
		GUIStyle guistyle = new GUIStyle(GUI.skin.label);
		guistyle.fontSize = 25;
		guistyle.fontStyle = 1;
		guistyle.wordWrap = false;
		GUIStyle guistyle2 = new GUIStyle(GUI.skin.label);
		guistyle2.fontSize = 11;
		guistyle2.wordWrap = false;
		GUILayout.BeginArea(new Rect((float)(Screen.width / 2 - 150), (float)(Screen.height - 150), 300f, 120f));
		GUILayout.BeginVertical(new GUILayoutOption[0]);
		GUILayout.FlexibleSpace();
		GUILayout.BeginHorizontal(new GUILayoutOption[0]);
		GUILayout.FlexibleSpace();
		GUILayout.Label(this.fxTypeName[(int)this.DefaultFXType], guistyle, new GUILayoutOption[0]);
		GUILayout.FlexibleSpace();
		GUILayout.EndHorizontal();
		GUILayout.FlexibleSpace();
		GUILayout.BeginHorizontal(new GUILayoutOption[0]);
		GUILayout.FlexibleSpace();
		GUILayout.Label("Press Left / Right arrow keys to switch", guistyle2, new GUILayoutOption[0]);
		GUILayout.FlexibleSpace();
		GUILayout.EndHorizontal();
		GUILayout.FlexibleSpace();
		GUILayout.BeginHorizontal(new GUILayoutOption[0]);
		GUILayout.FlexibleSpace();
		if (GUILayout.Button("Previous", new GUILayoutOption[]
		{
			GUILayout.Width(90f),
			GUILayout.Height(30f)
		}))
		{
			this.PrevWeapon();
		}
		GUILayout.FlexibleSpace();
		if (GUILayout.Button("Next", new GUILayoutOption[]
		{
			GUILayout.Width(90f),
			GUILayout.Height(30f)
		}))
		{
			this.NextWeapon();
		}
		GUILayout.FlexibleSpace();
		GUILayout.EndHorizontal();
		GUILayout.FlexibleSpace();
		GUILayout.EndVertical();
		GUILayout.EndArea();
	}

	// Token: 0x06000032 RID: 50 RVA: 0x00003A38 File Offset: 0x00001C38
	private void Update()
	{
		if (Input.GetKeyDown(275))
		{
			this.NextWeapon();
		}
		else if (Input.GetKeyDown(276))
		{
			this.PrevWeapon();
		}
	}

	// Token: 0x06000033 RID: 51 RVA: 0x00003A6C File Offset: 0x00001C6C
	private void NextWeapon()
	{
		if (this.DefaultFXType < (F3DFXType)Enum.GetNames(typeof(F3DFXType)).Length - 1)
		{
			this.Stop();
			this.DefaultFXType++;
		}
	}

	// Token: 0x06000034 RID: 52 RVA: 0x00003AAC File Offset: 0x00001CAC
	private void PrevWeapon()
	{
		if (this.DefaultFXType > F3DFXType.Vulcan)
		{
			this.Stop();
			this.DefaultFXType--;
		}
	}

	// Token: 0x06000035 RID: 53 RVA: 0x00003ADC File Offset: 0x00001CDC
	private void AdvanceSocket()
	{
		this.curSocket++;
		if (this.curSocket > 3)
		{
			this.curSocket = 0;
		}
	}

	// Token: 0x06000036 RID: 54 RVA: 0x00003B00 File Offset: 0x00001D00
	public void Fire()
	{
		switch (this.DefaultFXType)
		{
		case F3DFXType.Vulcan:
			this.timerID = F3DTime.time.AddTimer(0.05f, new Action(this.Vulcan));
			this.Vulcan();
			break;
		case F3DFXType.SoloGun:
			this.timerID = F3DTime.time.AddTimer(0.2f, new Action(this.SoloGun));
			this.SoloGun();
			break;
		case F3DFXType.Sniper:
			this.timerID = F3DTime.time.AddTimer(0.3f, new Action(this.Sniper));
			this.Sniper();
			break;
		case F3DFXType.ShotGun:
			this.timerID = F3DTime.time.AddTimer(0.3f, new Action(this.ShotGun));
			this.ShotGun();
			break;
		case F3DFXType.Seeker:
			this.timerID = F3DTime.time.AddTimer(0.2f, new Action(this.Seeker));
			this.Seeker();
			break;
		case F3DFXType.RailGun:
			this.timerID = F3DTime.time.AddTimer(0.2f, new Action(this.RailGun));
			this.RailGun();
			break;
		case F3DFXType.PlasmaGun:
			this.timerID = F3DTime.time.AddTimer(0.2f, new Action(this.PlasmaGun));
			this.PlasmaGun();
			break;
		case F3DFXType.PlasmaBeam:
			this.PlasmaBeam();
			break;
		case F3DFXType.PlasmaBeamHeavy:
			this.PlasmaBeamHeavy();
			break;
		case F3DFXType.LightningGun:
			this.LightningGun();
			break;
		case F3DFXType.FlameRed:
			this.FlameRed();
			break;
		case F3DFXType.LaserImpulse:
			this.timerID = F3DTime.time.AddTimer(0.15f, new Action(this.LaserImpulse));
			this.LaserImpulse();
			break;
		}
	}

	// Token: 0x06000037 RID: 55 RVA: 0x00003CE0 File Offset: 0x00001EE0
	public void Stop()
	{
		if (this.timerID != -1)
		{
			F3DTime.time.RemoveTimer(this.timerID);
			this.timerID = -1;
		}
	}

	// Token: 0x06000038 RID: 56 RVA: 0x00003D08 File Offset: 0x00001F08
	private void Vulcan()
	{
		Quaternion quaternion = Quaternion.Euler(Random.onUnitSphere);
		F3DPool.instance.Spawn(this.vulcanMuzzle, this.TurretSocket[this.curSocket].position, this.TurretSocket[this.curSocket].rotation, this.TurretSocket[this.curSocket]);
		F3DPool.instance.Spawn(this.vulcanProjectile, this.TurretSocket[this.curSocket].position + this.TurretSocket[this.curSocket].forward, quaternion * this.TurretSocket[this.curSocket].rotation, null);
		this.ShellParticles[this.curSocket].Emit(1);
		F3DAudioController.instance.VulcanShot(this.TurretSocket[this.curSocket].position);
		this.AdvanceSocket();
	}

	// Token: 0x06000039 RID: 57 RVA: 0x00003DEC File Offset: 0x00001FEC
	public void VulcanImpact(Vector3 pos)
	{
		F3DPool.instance.Spawn(this.vulcanImpact, pos, Quaternion.identity, null);
		F3DAudioController.instance.VulcanHit(pos);
	}

	// Token: 0x0600003A RID: 58 RVA: 0x00003E14 File Offset: 0x00002014
	private void SoloGun()
	{
		Quaternion quaternion = Quaternion.Euler(Random.onUnitSphere);
		F3DPool.instance.Spawn(this.soloGunMuzzle, this.TurretSocket[this.curSocket].position, this.TurretSocket[this.curSocket].rotation, this.TurretSocket[this.curSocket]);
		F3DPool.instance.Spawn(this.soloGunProjectile, this.TurretSocket[this.curSocket].position + this.TurretSocket[this.curSocket].forward, quaternion * this.TurretSocket[this.curSocket].rotation, null);
		F3DAudioController.instance.SoloGunShot(this.TurretSocket[this.curSocket].position);
		this.AdvanceSocket();
	}

	// Token: 0x0600003B RID: 59 RVA: 0x00003EE4 File Offset: 0x000020E4
	public void SoloGunImpact(Vector3 pos)
	{
		F3DPool.instance.Spawn(this.soloGunImpact, pos, Quaternion.identity, null);
		F3DAudioController.instance.SoloGunHit(pos);
	}

	// Token: 0x0600003C RID: 60 RVA: 0x00003F0C File Offset: 0x0000210C
	private void Sniper()
	{
		Quaternion quaternion = Quaternion.Euler(Random.onUnitSphere);
		F3DPool.instance.Spawn(this.sniperMuzzle, this.TurretSocket[this.curSocket].position, this.TurretSocket[this.curSocket].rotation, this.TurretSocket[this.curSocket]);
		F3DPool.instance.Spawn(this.sniperBeam, this.TurretSocket[this.curSocket].position, quaternion * this.TurretSocket[this.curSocket].rotation, null);
		F3DAudioController.instance.SniperShot(this.TurretSocket[this.curSocket].position);
		this.ShellParticles[this.curSocket].Emit(1);
		this.AdvanceSocket();
	}

	// Token: 0x0600003D RID: 61 RVA: 0x00003FD8 File Offset: 0x000021D8
	public void SniperImpact(Vector3 pos)
	{
		F3DPool.instance.Spawn(this.sniperImpact, pos, Quaternion.identity, null);
		F3DAudioController.instance.SniperHit(pos);
	}

	// Token: 0x0600003E RID: 62 RVA: 0x00004000 File Offset: 0x00002200
	private void ShotGun()
	{
		Quaternion quaternion = Quaternion.Euler(Random.onUnitSphere);
		F3DPool.instance.Spawn(this.shotGunMuzzle, this.TurretSocket[this.curSocket].position, this.TurretSocket[this.curSocket].rotation, this.TurretSocket[this.curSocket]);
		F3DPool.instance.Spawn(this.shotGunProjectile, this.TurretSocket[this.curSocket].position, quaternion * this.TurretSocket[this.curSocket].rotation, null);
		F3DAudioController.instance.ShotGunShot(this.TurretSocket[this.curSocket].position);
		this.ShellParticles[this.curSocket].Emit(1);
		this.AdvanceSocket();
	}

	// Token: 0x0600003F RID: 63 RVA: 0x000040CC File Offset: 0x000022CC
	private void Seeker()
	{
		Quaternion quaternion = Quaternion.Euler(Random.onUnitSphere);
		F3DPool.instance.Spawn(this.seekerMuzzle, this.TurretSocket[this.curSocket].position, this.TurretSocket[this.curSocket].rotation, this.TurretSocket[this.curSocket]);
		F3DPool.instance.Spawn(this.seekerProjectile, this.TurretSocket[this.curSocket].position, quaternion * this.TurretSocket[this.curSocket].rotation, null);
		F3DAudioController.instance.SeekerShot(this.TurretSocket[this.curSocket].position);
		this.AdvanceSocket();
	}

	// Token: 0x06000040 RID: 64 RVA: 0x00004184 File Offset: 0x00002384
	public void SeekerImpact(Vector3 pos)
	{
		F3DPool.instance.Spawn(this.seekerImpact, pos, Quaternion.identity, null);
		F3DAudioController.instance.SeekerHit(pos);
	}

	// Token: 0x06000041 RID: 65 RVA: 0x000041AC File Offset: 0x000023AC
	private void RailGun()
	{
		Quaternion quaternion = Quaternion.Euler(Random.onUnitSphere);
		F3DPool.instance.Spawn(this.railgunMuzzle, this.TurretSocket[this.curSocket].position, this.TurretSocket[this.curSocket].rotation, this.TurretSocket[this.curSocket]);
		F3DPool.instance.Spawn(this.railgunBeam, this.TurretSocket[this.curSocket].position, quaternion * this.TurretSocket[this.curSocket].rotation, null);
		F3DAudioController.instance.RailGunShot(this.TurretSocket[this.curSocket].position);
		this.ShellParticles[this.curSocket].Emit(1);
		this.AdvanceSocket();
	}

	// Token: 0x06000042 RID: 66 RVA: 0x00004278 File Offset: 0x00002478
	public void RailgunImpact(Vector3 pos)
	{
		F3DPool.instance.Spawn(this.railgunImpact, pos, Quaternion.identity, null);
		F3DAudioController.instance.RailGunHit(pos);
	}

	// Token: 0x06000043 RID: 67 RVA: 0x000042A0 File Offset: 0x000024A0
	private void PlasmaGun()
	{
		Quaternion quaternion = Quaternion.Euler(Random.onUnitSphere);
		F3DPool.instance.Spawn(this.plasmagunMuzzle, this.TurretSocket[this.curSocket].position, this.TurretSocket[this.curSocket].rotation, this.TurretSocket[this.curSocket]);
		F3DPool.instance.Spawn(this.plasmagunProjectile, this.TurretSocket[this.curSocket].position, quaternion * this.TurretSocket[this.curSocket].rotation, null);
		F3DAudioController.instance.PlasmaGunShot(this.TurretSocket[this.curSocket].position);
		this.AdvanceSocket();
	}

	// Token: 0x06000044 RID: 68 RVA: 0x00004358 File Offset: 0x00002558
	public void PlasmaGunImpact(Vector3 pos)
	{
		F3DPool.instance.Spawn(this.plasmagunImpact, pos, Quaternion.identity, null);
		F3DAudioController.instance.PlasmaGunHit(pos);
	}

	// Token: 0x06000045 RID: 69 RVA: 0x00004380 File Offset: 0x00002580
	private void PlasmaBeam()
	{
		F3DPool.instance.Spawn(this.plasmaBeam, this.TurretSocket[0].position, this.TurretSocket[0].rotation, this.TurretSocket[0]);
		F3DPool.instance.Spawn(this.plasmaBeam, this.TurretSocket[2].position, this.TurretSocket[2].rotation, this.TurretSocket[2]);
	}

	// Token: 0x06000046 RID: 70 RVA: 0x000043F4 File Offset: 0x000025F4
	private void PlasmaBeamHeavy()
	{
		F3DPool.instance.Spawn(this.plasmaBeamHeavy, this.TurretSocket[0].position, this.TurretSocket[0].rotation, this.TurretSocket[0]);
		F3DPool.instance.Spawn(this.plasmaBeamHeavy, this.TurretSocket[2].position, this.TurretSocket[2].rotation, this.TurretSocket[2]);
	}

	// Token: 0x06000047 RID: 71 RVA: 0x00004468 File Offset: 0x00002668
	private void LightningGun()
	{
		F3DPool.instance.Spawn(this.lightningGunBeam, this.TurretSocket[0].position, this.TurretSocket[0].rotation, this.TurretSocket[0]);
		F3DPool.instance.Spawn(this.lightningGunBeam, this.TurretSocket[2].position, this.TurretSocket[2].rotation, this.TurretSocket[2]);
	}

	// Token: 0x06000048 RID: 72 RVA: 0x000044DC File Offset: 0x000026DC
	private void FlameRed()
	{
		F3DPool.instance.Spawn(this.flameRed, this.TurretSocket[0].position, this.TurretSocket[0].rotation, this.TurretSocket[0]);
		F3DPool.instance.Spawn(this.flameRed, this.TurretSocket[2].position, this.TurretSocket[2].rotation, this.TurretSocket[2]);
	}

	// Token: 0x06000049 RID: 73 RVA: 0x00004550 File Offset: 0x00002750
	private void LaserImpulse()
	{
		Quaternion quaternion = Quaternion.Euler(Random.onUnitSphere);
		F3DPool.instance.Spawn(this.laserImpulseMuzzle, this.TurretSocket[this.curSocket].position, this.TurretSocket[this.curSocket].rotation, this.TurretSocket[this.curSocket]);
		F3DPool.instance.Spawn(this.laserImpulseProjectile, this.TurretSocket[this.curSocket].position, quaternion * this.TurretSocket[this.curSocket].rotation, null);
		F3DAudioController.instance.LaserImpulseShot(this.TurretSocket[this.curSocket].position);
		this.AdvanceSocket();
	}

	// Token: 0x0600004A RID: 74 RVA: 0x00004608 File Offset: 0x00002808
	public void LaserImpulseImpact(Vector3 pos)
	{
		F3DPool.instance.Spawn(this.laserImpulseImpact, pos, Quaternion.identity, null);
		F3DAudioController.instance.LaserImpulseHit(pos);
	}

	// Token: 0x04000058 RID: 88
	public static F3DFXController instance;

	// Token: 0x04000059 RID: 89
	private string[] fxTypeName = new string[]
	{
		"Vulcan",
		"Sologun",
		"Sniper",
		"Shotgun",
		"Seeker",
		"Railgun",
		"Plasmagun",
		"Plasma beam",
		"Heavy plasma beam",
		"Lightning gun",
		"Flamethrower",
		"Pulse laser"
	};

	// Token: 0x0400005A RID: 90
	private int curSocket;

	// Token: 0x0400005B RID: 91
	private int timerID = -1;

	// Token: 0x0400005C RID: 92
	[Header("Turret setup")]
	public Transform[] TurretSocket;

	// Token: 0x0400005D RID: 93
	public ParticleSystem[] ShellParticles;

	// Token: 0x0400005E RID: 94
	public F3DFXType DefaultFXType;

	// Token: 0x0400005F RID: 95
	[Header("Vulcan")]
	public Transform vulcanProjectile;

	// Token: 0x04000060 RID: 96
	public Transform vulcanMuzzle;

	// Token: 0x04000061 RID: 97
	public Transform vulcanImpact;

	// Token: 0x04000062 RID: 98
	[Header("Solo gun")]
	public Transform soloGunProjectile;

	// Token: 0x04000063 RID: 99
	public Transform soloGunMuzzle;

	// Token: 0x04000064 RID: 100
	public Transform soloGunImpact;

	// Token: 0x04000065 RID: 101
	[Header("Sniper")]
	public Transform sniperBeam;

	// Token: 0x04000066 RID: 102
	public Transform sniperMuzzle;

	// Token: 0x04000067 RID: 103
	public Transform sniperImpact;

	// Token: 0x04000068 RID: 104
	[Header("Shotgun")]
	public Transform shotGunProjectile;

	// Token: 0x04000069 RID: 105
	public Transform shotGunMuzzle;

	// Token: 0x0400006A RID: 106
	public Transform shotGunImpact;

	// Token: 0x0400006B RID: 107
	[Header("Seeker")]
	public Transform seekerProjectile;

	// Token: 0x0400006C RID: 108
	public Transform seekerMuzzle;

	// Token: 0x0400006D RID: 109
	public Transform seekerImpact;

	// Token: 0x0400006E RID: 110
	[Header("Rail gun")]
	public Transform railgunBeam;

	// Token: 0x0400006F RID: 111
	public Transform railgunMuzzle;

	// Token: 0x04000070 RID: 112
	public Transform railgunImpact;

	// Token: 0x04000071 RID: 113
	[Header("Plasma gun")]
	public Transform plasmagunProjectile;

	// Token: 0x04000072 RID: 114
	public Transform plasmagunMuzzle;

	// Token: 0x04000073 RID: 115
	public Transform plasmagunImpact;

	// Token: 0x04000074 RID: 116
	[Header("Plasma beam")]
	public Transform plasmaBeam;

	// Token: 0x04000075 RID: 117
	[Header("Plasma beam heavy")]
	public Transform plasmaBeamHeavy;

	// Token: 0x04000076 RID: 118
	[Header("Lightning gun")]
	public Transform lightningGunBeam;

	// Token: 0x04000077 RID: 119
	[Header("Flame")]
	public Transform flameRed;

	// Token: 0x04000078 RID: 120
	[Header("Laser impulse")]
	public Transform laserImpulseProjectile;

	// Token: 0x04000079 RID: 121
	public Transform laserImpulseMuzzle;

	// Token: 0x0400007A RID: 122
	public Transform laserImpulseImpact;
}
