using System;
using UnityEngine;

// Token: 0x020001E7 RID: 487
public class AirStrike : MonoBehaviour
{
	// Token: 0x06000E27 RID: 3623 RVA: 0x0006405C File Offset: 0x0006225C
	private void Start()
	{
		this.BornTime = Time.time;
	}

	// Token: 0x06000E28 RID: 3624 RVA: 0x0006406C File Offset: 0x0006226C
	private void Update()
	{
		if (!this.OneShot && Time.time > this.BornTime + this.BombDelay)
		{
			this.OneShot = true;
			this.BombEffect.gameObject.SetActive(true);
			ShotBehavior component = base.transform.GetComponent<ShotBehavior>();
			component.PlayBulletHole();
			component.HitSomething(globals.armory_main.testfire_scene.CurrentEnemy.EnemyGameObject.GetComponent<NewEnemyBehavior>());
		}
		this.JetOuline.Translate(Vector3.up * Time.deltaTime * this.Speed);
	}

	// Token: 0x04000DD7 RID: 3543
	public Transform JetOuline;

	// Token: 0x04000DD8 RID: 3544
	public float Speed;

	// Token: 0x04000DD9 RID: 3545
	public float BombDelay = 1f;

	// Token: 0x04000DDA RID: 3546
	private float BornTime;

	// Token: 0x04000DDB RID: 3547
	public Transform BombEffect;

	// Token: 0x04000DDC RID: 3548
	private bool OneShot;
}
