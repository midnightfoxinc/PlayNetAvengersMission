using System;
using UnityEngine;

// Token: 0x0200019A RID: 410
public class FTUEChoiceMainBehavior : MonoBehaviour
{
	// Token: 0x06000C72 RID: 3186 RVA: 0x0005A95C File Offset: 0x00058B5C
	protected virtual void Start()
	{
		if (this.choice.Length < 1)
		{
			globals.debugWarning("no choices! Did you mean to use a SplashMainBehavior instead?");
		}
	}

	// Token: 0x06000C73 RID: 3187 RVA: 0x0005A978 File Offset: 0x00058B78
	private void Update()
	{
		for (int i = 0; i < this.choice.Length; i++)
		{
			if (this.choice[i].button.hit)
			{
				globals.FTUE_manager.set_state(this.choice[i].state, this.choice[i].done_check);
				return;
			}
		}
	}

	// Token: 0x04000C26 RID: 3110
	public FTUEChoiceMainBehavior.choice_class[] choice;

	// Token: 0x0200019B RID: 411
	[Serializable]
	public class choice_class
	{
		// Token: 0x04000C27 RID: 3111
		public buttonBehavior button;

		// Token: 0x04000C28 RID: 3112
		public string state;

		// Token: 0x04000C29 RID: 3113
		public bool done_check;
	}
}
