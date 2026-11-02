using System;
using System.Collections.Generic;

// Token: 0x020002F0 RID: 752
public class ActionPosterBehavior : DetailsPanelBehavior
{
	// Token: 0x060013D6 RID: 5078 RVA: 0x0008F068 File Offset: 0x0008D268
	protected override void cleanup()
	{
		for (int i = 0; i < this.step.Count; i++)
		{
			this.step[i].cleanup();
		}
	}

	// Token: 0x060013D7 RID: 5079 RVA: 0x0008F0A4 File Offset: 0x0008D2A4
	public void show(ActionDBItemClass data)
	{
		this.cleanup();
		this.name_label.text = data.long_name;
		this.step[0].number_label.text = "1";
		base.gameObject.SetActive(true);
		List<string> list = new List<string>();
		list.Add(data.id);
		List<string> list2 = list;
		while (this.step.Count < data.action_step.Count)
		{
			ActionPosterStepBehavior actionPosterStepBehavior = this.step[0].CopyInPlace() as ActionPosterStepBehavior;
			actionPosterStepBehavior.number_label.text = (this.step.Count + 1).ToString();
			actionPosterStepBehavior.name = "step " + (this.step.Count + 1).ToString();
			this.step.Add(actionPosterStepBehavior);
		}
		for (int i = 0; i < this.step.Count; i++)
		{
			if (i < data.action_step.Count)
			{
				this.step[i].set_data(data.action_step[i]);
				list2.Add(data.action_step[i].image);
			}
			else
			{
				this.step[i].gameObject.SetActive(false);
			}
		}
		this.scroll_view.ResetPosition();
		this.step_grid.Reposition();
		this.see_also.set_buttons(data.see_also);
		globals.sfx_master.play(this.show_sfx, null);
		globals.scavenger_hunt_manager.do_action(scavenger_hunt_types.VIEW_TIP, list2, 1);
	}

	// Token: 0x0400159E RID: 5534
	public List<ActionPosterStepBehavior> step;

	// Token: 0x0400159F RID: 5535
	public UIGrid step_grid;

	// Token: 0x040015A0 RID: 5536
	public UIScrollView scroll_view;
}
