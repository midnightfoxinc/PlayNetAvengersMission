using System;
using UnityEngine;

// Token: 0x020001E9 RID: 489
public class AnimationRelay : MonoBehaviour
{
	// Token: 0x06000E2D RID: 3629 RVA: 0x00064134 File Offset: 0x00062334
	private void Shoot()
	{
		globals.armory_main.testfire_scene.FireWeapon(RepulsorTestFireBehavior.AnimationUsed.PulseBolt);
	}

	// Token: 0x06000E2E RID: 3630 RVA: 0x00064148 File Offset: 0x00062348
	private void TurnOffPart()
	{
		globals.armory_main.testfire_scene.TurnOffPart();
		this.PlayCancelSound();
	}

	// Token: 0x06000E2F RID: 3631 RVA: 0x00064160 File Offset: 0x00062360
	private void ShootPalmCannon()
	{
		globals.armory_main.testfire_scene.FireWeapon(RepulsorTestFireBehavior.AnimationUsed.PalmCannon);
	}

	// Token: 0x06000E30 RID: 3632 RVA: 0x00064174 File Offset: 0x00062374
	private void PrewarmDeployCeiling()
	{
		globals.armory_main.testfire_scene.StartCeilingAttackWarmUp();
	}

	// Token: 0x06000E31 RID: 3633 RVA: 0x00064188 File Offset: 0x00062388
	private void ShootDeployCannonSingle()
	{
		globals.armory_main.testfire_scene.FireWeapon(RepulsorTestFireBehavior.AnimationUsed.DeployMissile);
	}

	// Token: 0x06000E32 RID: 3634 RVA: 0x0006419C File Offset: 0x0006239C
	private void ShootDeployCannonCeiling()
	{
		globals.armory_main.testfire_scene.FireWeapon(RepulsorTestFireBehavior.AnimationUsed.DeployCeilingCall);
	}

	// Token: 0x06000E33 RID: 3635 RVA: 0x000641B0 File Offset: 0x000623B0
	private void ShootDeployBeam()
	{
		globals.armory_main.testfire_scene.FireWeapon(RepulsorTestFireBehavior.AnimationUsed.DeployBeam);
	}

	// Token: 0x06000E34 RID: 3636 RVA: 0x000641C4 File Offset: 0x000623C4
	private void StopDeployBeam()
	{
		globals.armory_main.testfire_scene.StopBeamWeapon();
	}

	// Token: 0x06000E35 RID: 3637 RVA: 0x000641D8 File Offset: 0x000623D8
	private void StopWarmUp()
	{
		globals.armory_main.testfire_scene.StopWarmUp();
	}

	// Token: 0x06000E36 RID: 3638 RVA: 0x000641EC File Offset: 0x000623EC
	private void ShootDeployBarrage()
	{
		globals.armory_main.testfire_scene.FireWeapon(RepulsorTestFireBehavior.AnimationUsed.DeployBarrage);
	}

	// Token: 0x06000E37 RID: 3639 RVA: 0x00064200 File Offset: 0x00062400
	private void ShootPreWarmPalm()
	{
		globals.armory_main.testfire_scene.FireWarmUp(RepulsorTestFireBehavior.AnimationUsed.PalmCannon);
	}

	// Token: 0x06000E38 RID: 3640 RVA: 0x00064214 File Offset: 0x00062414
	private void ShootPreWarmDeployMissile()
	{
		globals.armory_main.testfire_scene.FireWarmUp(RepulsorTestFireBehavior.AnimationUsed.DeployMissile);
	}

	// Token: 0x06000E39 RID: 3641 RVA: 0x00064228 File Offset: 0x00062428
	private void ShootPreWarmBeam()
	{
		globals.armory_main.testfire_scene.FireWarmUp(RepulsorTestFireBehavior.AnimationUsed.DeployBeam);
	}

	// Token: 0x06000E3A RID: 3642 RVA: 0x0006423C File Offset: 0x0006243C
	private void ShootPreWarmBarrage()
	{
		globals.armory_main.testfire_scene.FireWarmUp(RepulsorTestFireBehavior.AnimationUsed.DeployBarrage);
	}

	// Token: 0x06000E3B RID: 3643 RVA: 0x00064250 File Offset: 0x00062450
	private void CeilingFireNOTAvailable()
	{
		globals.armory_main.testfire_scene.RepulsorAnimator.SetBool("CeilingFireAvailable", false);
	}

	// Token: 0x06000E3C RID: 3644 RVA: 0x0006426C File Offset: 0x0006246C
	private void CeilingFireAvailable()
	{
		globals.armory_main.testfire_scene.RepulsorAnimator.SetBool("CeilingFireAvailable", true);
	}

	// Token: 0x06000E3D RID: 3645 RVA: 0x00064288 File Offset: 0x00062488
	private void GestureStart()
	{
		globals.armory_main.testfire_scene.FireGestureShield(RepulsorTestFireBehavior.AnimationUsed.GestureBlock);
	}

	// Token: 0x06000E3E RID: 3646 RVA: 0x0006429C File Offset: 0x0006249C
	private void GestureImpactEffect()
	{
		globals.armory_main.testfire_scene.PlayImpactGestureEffect();
	}

	// Token: 0x06000E3F RID: 3647 RVA: 0x000642B0 File Offset: 0x000624B0
	private void FireGestureShot()
	{
		globals.armory_main.testfire_scene.FireGestureShot();
	}

	// Token: 0x06000E40 RID: 3648 RVA: 0x000642C4 File Offset: 0x000624C4
	private void GestureEnd()
	{
		globals.armory_main.testfire_scene.StopGestureShield();
	}

	// Token: 0x06000E41 RID: 3649 RVA: 0x000642D8 File Offset: 0x000624D8
	private void PlayCancelSound()
	{
		globals.armory_main.testfire_scene.PlayCancelSound();
	}

	// Token: 0x06000E42 RID: 3650 RVA: 0x000642EC File Offset: 0x000624EC
	private void PlayClassifiedScreenEffect()
	{
		globals.armory_main.testfire_scene.ChangeScreenStateForClassified(RepulsorTestFireBehavior.ScreenState.ClassifiedStart);
	}

	// Token: 0x06000E43 RID: 3651 RVA: 0x00064300 File Offset: 0x00062500
	private void StopClassifiedScreenEffect()
	{
		globals.armory_main.testfire_scene.ChangeScreenStateForClassified(RepulsorTestFireBehavior.ScreenState.ClassifiedFading);
		globals.armory_main.testfire_scene.DestroyCurrentTarget();
	}

	// Token: 0x06000E44 RID: 3652 RVA: 0x00064324 File Offset: 0x00062524
	private void PlayAdjustToIdleSound()
	{
		globals.armory_main.testfire_scene.PlayAdjustToIdleSound();
	}

	// Token: 0x06000E45 RID: 3653 RVA: 0x00064338 File Offset: 0x00062538
	private void StopChargeSound()
	{
		globals.armory_main.testfire_scene.StopChargeSfx();
	}
}
