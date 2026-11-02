using System;
using System.Collections.Generic;

// Token: 0x0200023F RID: 575
public class ScavengerHuntManagerClass
{
	// Token: 0x0600100E RID: 4110 RVA: 0x00071F54 File Offset: 0x00070154
	public ScavengerHuntManagerClass(string json_str)
	{
		JSONObject jsonobject = new JSONObject(json_str, -2, false, false);
		if (jsonobject.IsArray)
		{
			for (int i = 0; i < jsonobject.Count; i++)
			{
				this.items.Add(new ScavengerHuntDataClass(jsonobject[i]));
			}
		}
	}

	// Token: 0x0600100F RID: 4111 RVA: 0x00071FC0 File Offset: 0x000701C0
	public void start_scavenger_hunt()
	{
		if (!globals.player_data.show_scavenger_hunt)
		{
			globals.player_data.show_scavenger_hunt = true;
			globals.player_data.saveData(true, false);
		}
		if (this.panel != null)
		{
			this.panel.start_scavenger_hunt();
		}
	}

	// Token: 0x06001010 RID: 4112 RVA: 0x00072010 File Offset: 0x00070210
	public void do_action(scavenger_hunt_types type, List<string> specifics, int count = 1)
	{
		if (!globals.player_data.show_scavenger_hunt)
		{
			return;
		}
		int num = 0;
		foreach (ScavengerHuntDataClass scavengerHuntDataClass in this.items)
		{
			if (!scavengerHuntDataClass.acknowledged)
			{
				if (!scavengerHuntDataClass.done && scavengerHuntDataClass.type == type)
				{
					bool flag = true;
					foreach (string text in scavengerHuntDataClass.specifics)
					{
						if (text.Length > 0 && !specifics.Contains(text))
						{
							flag = false;
							break;
						}
					}
					if (flag)
					{
						if (scavengerHuntDataClass.did_action(count))
						{
							DMOManager.LogGameAction("scavenger_hunt", "complete", scavengerHuntDataClass.id.ToString() + "|" + scavengerHuntDataClass.description, null);
						}
						globals.player_data.saveData(true, false);
					}
				}
				num++;
				if (num >= this.max_active)
				{
					break;
				}
			}
		}
		if (this.panel != null)
		{
			this.panel.update_items();
		}
	}

	// Token: 0x06001011 RID: 4113 RVA: 0x00072198 File Offset: 0x00070398
	public static implicit operator bool(ScavengerHuntManagerClass d)
	{
		return d != null;
	}

	// Token: 0x04001024 RID: 4132
	public List<ScavengerHuntDataClass> items = new List<ScavengerHuntDataClass>();

	// Token: 0x04001025 RID: 4133
	public int max_active = 4;

	// Token: 0x04001026 RID: 4134
	public ScavengerHuntPanelBehavior panel;
}
