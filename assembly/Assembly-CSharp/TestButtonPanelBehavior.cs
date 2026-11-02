using System;
using UnityEngine;

// Token: 0x020002A3 RID: 675
public class TestButtonPanelBehavior : MonoBehaviour
{
	// Token: 0x0600124A RID: 4682 RVA: 0x00081FC0 File Offset: 0x000801C0
	private void Start()
	{
	}

	// Token: 0x0600124B RID: 4683 RVA: 0x00081FC4 File Offset: 0x000801C4
	private void Update()
	{
		if (this.clear_data_button.clicked)
		{
			globals.player_data.clear_progress();
		}
		else if (this.reset_download_button.clicked)
		{
			globals.BLE_manager.resetDownload(globals.player_data.getPrimaryDevice());
		}
		else if (this.fake_summary_button && this.fake_summary && this.fake_summary_button.clicked)
		{
			this.fake_summary.gameObject.SetActive(true);
		}
	}

	// Token: 0x040012CC RID: 4812
	public buttonBehavior clear_data_button;

	// Token: 0x040012CD RID: 4813
	public buttonBehavior reset_download_button;

	// Token: 0x040012CE RID: 4814
	public buttonBehavior fake_summary_button;

	// Token: 0x040012CF RID: 4815
	public FakeMissionSummaryBehavior fake_summary;
}
