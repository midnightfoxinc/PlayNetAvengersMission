using System;
using UnityEngine;

// Token: 0x0200029C RID: 668
public class AlertPopupBehavior : MonoBehaviour
{
	// Token: 0x17000223 RID: 547
	// (get) Token: 0x06001220 RID: 4640 RVA: 0x00080BB8 File Offset: 0x0007EDB8
	public bool showing
	{
		get
		{
			return this.container.gameObject.activeInHierarchy;
		}
	}

	// Token: 0x06001221 RID: 4641 RVA: 0x00080BCC File Offset: 0x0007EDCC
	private void Update()
	{
		missionDataClass missionDataClass = globals.location_data.alert_mission();
		if (missionDataClass)
		{
			if (this.alerted_mission == null || this.alerted_mission.id != missionDataClass.id)
			{
				this.alerted_mission = missionDataClass;
				this.mission_name_lbl.text = this.alerted_mission.name;
			}
		}
		else
		{
			this.alerted_mission = null;
		}
		this.container.SetActive(this.alerted_mission != null);
		if (this.button.clicked)
		{
			globals.mission_to_open = this.alerted_mission.id;
			globals.location_id = this.alerted_mission.location.id;
			NavigationManager.load_scene(NavigationManager.location_scene);
		}
	}

	// Token: 0x04001287 RID: 4743
	public UILabel mission_name_lbl;

	// Token: 0x04001288 RID: 4744
	public GameObject container;

	// Token: 0x04001289 RID: 4745
	public LabelledButtonBehavior button;

	// Token: 0x0400128A RID: 4746
	public missionDataClass alerted_mission;
}
