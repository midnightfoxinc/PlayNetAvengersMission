using System;
using UnityEngine;

// Token: 0x02000299 RID: 665
[AddComponentMenu("Scripts/Gear Menu/Scavenger Hunt/Scavenger Hunt Item Behavior")]
public class ScavengerHuntItemBehavior : MonoBehaviour
{
	// Token: 0x060011D2 RID: 4562 RVA: 0x0007F878 File Offset: 0x0007DA78
	private void Start()
	{
	}

	// Token: 0x060011D3 RID: 4563 RVA: 0x0007F87C File Offset: 0x0007DA7C
	private void Awake()
	{
		TweenPosition[] componentsInChildren = base.GetComponentsInChildren<TweenPosition>();
		foreach (TweenPosition tweenPosition in componentsInChildren)
		{
			if (tweenPosition.to.x == 0f)
			{
				if (tweenPosition.to.y == 0f)
				{
					this.anim_in_tp = tweenPosition;
				}
				else
				{
					this.anim_up_tp = tweenPosition;
				}
			}
			else
			{
				this.anim_out_tp = tweenPosition;
			}
		}
	}

	// Token: 0x060011D4 RID: 4564 RVA: 0x0007F8F4 File Offset: 0x0007DAF4
	public void update()
	{
		foreach (ScavengerHuntDataClass scavengerHuntDataClass in globals.scavenger_hunt_manager.items)
		{
			if (scavengerHuntDataClass.id == this.id)
			{
				this.setup(scavengerHuntDataClass, false);
			}
		}
	}

	// Token: 0x060011D5 RID: 4565 RVA: 0x0007F970 File Offset: 0x0007DB70
	public void slide_in()
	{
		this.anim_in_tp.ResetToBeginning();
		this.anim_in_tp.PlayForward();
		globals.sfx_master.play_sfx(this.panel.in_sfx);
	}

	// Token: 0x060011D6 RID: 4566 RVA: 0x0007F9A0 File Offset: 0x0007DBA0
	public void setup(ScavengerHuntDataClass data, bool reset_tween = true)
	{
		this.id = data.id;
		this.message.text = data.description;
		if (data.num_times > 1)
		{
			UILabel uilabel = this.message;
			string text = uilabel.text;
			uilabel.text = string.Concat(new object[]
			{
				text,
				" ",
				globals.player_data.get_scavenger_hunt_data(data.id),
				"/",
				data.num_times
			});
		}
		this.icon.spriteName = data.icon;
		this.done_go.SetActive(data.done);
		if (this.anim_out_tp)
		{
			this.anim_out_tp.gameObject.SetActive(true);
		}
		if (reset_tween)
		{
			if (this.anim_out_tp)
			{
				this.anim_out_tp.ResetToBeginning();
				this.anim_out_tp.enabled = false;
			}
			if (this.anim_up_tp)
			{
				this.anim_up_tp.enabled = false;
			}
		}
	}

	// Token: 0x17000208 RID: 520
	// (get) Token: 0x060011D7 RID: 4567 RVA: 0x0007FABC File Offset: 0x0007DCBC
	public bool done
	{
		get
		{
			return this.done_go.activeSelf;
		}
	}

	// Token: 0x060011D8 RID: 4568 RVA: 0x0007FACC File Offset: 0x0007DCCC
	public void acknowledge()
	{
		globals.player_data.set_scavenger_hunt_data(this.id, -1);
		this.anim_out_tp.ResetToBeginning();
		this.anim_out_tp.PlayForward();
		this.panel.input_blocker.SetActive(true);
		AchievementEvents.inst.on_manual_update();
		globals.player_data.saveData(true, false);
		globals.sfx_master.play_sfx(this.panel.out_sfx);
		DMOManager.LogGameAction("scavenger_hunt", "acknowledge", this.id.ToString() + "|" + this.message.text, null);
	}

	// Token: 0x060011D9 RID: 4569 RVA: 0x0007FB70 File Offset: 0x0007DD70
	public void on_anim_in_complete()
	{
		this.panel.input_blocker.SetActive(false);
	}

	// Token: 0x060011DA RID: 4570 RVA: 0x0007FB84 File Offset: 0x0007DD84
	public void on_anim_out_complete()
	{
		bool flag = false;
		this.panel.waiting_for_items = 0;
		foreach (ScavengerHuntItemBehavior scavengerHuntItemBehavior in this.panel.items)
		{
			if (flag && scavengerHuntItemBehavior.gameObject.activeSelf)
			{
				this.panel.waiting_for_items++;
				if (scavengerHuntItemBehavior.anim_up_tp)
				{
					scavengerHuntItemBehavior.anim_up_tp.ResetToBeginning();
					scavengerHuntItemBehavior.anim_up_tp.PlayForward();
				}
			}
			if (scavengerHuntItemBehavior == this)
			{
				flag = true;
			}
		}
		if (this.panel.waiting_for_items == 0)
		{
			this.panel.on_item_shifted_up();
		}
	}

	// Token: 0x060011DB RID: 4571 RVA: 0x0007FC70 File Offset: 0x0007DE70
	private void Update()
	{
		if (this.acknowledge_btn.clicked)
		{
			this.acknowledge();
		}
	}

	// Token: 0x04001240 RID: 4672
	public UISprite bg;

	// Token: 0x04001241 RID: 4673
	public UISprite icon;

	// Token: 0x04001242 RID: 4674
	public UILabel message;

	// Token: 0x04001243 RID: 4675
	public GameObject done_go;

	// Token: 0x04001244 RID: 4676
	private int id;

	// Token: 0x04001245 RID: 4677
	public buttonBehavior acknowledge_btn;

	// Token: 0x04001246 RID: 4678
	private TweenPosition anim_out_tp;

	// Token: 0x04001247 RID: 4679
	private TweenPosition anim_in_tp;

	// Token: 0x04001248 RID: 4680
	private TweenPosition anim_up_tp;

	// Token: 0x04001249 RID: 4681
	public ScavengerHuntPanelBehavior panel;
}
