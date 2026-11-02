using System;
using UnityEngine;

// Token: 0x020002A5 RID: 677
[AddComponentMenu("Scripts/Database/Database Category Behavior")]
public class DatabaseCategoryBehavior : MonoBehaviour
{
	// Token: 0x06001250 RID: 4688 RVA: 0x00082108 File Offset: 0x00080308
	private void Awake()
	{
		this.orig_y = this.grid.transform.localPosition.y;
	}

	// Token: 0x17000225 RID: 549
	// (get) Token: 0x06001251 RID: 4689 RVA: 0x00082134 File Offset: 0x00080334
	public bool tweening
	{
		get
		{
			return this.tween_time > 0f;
		}
	}

	// Token: 0x17000226 RID: 550
	// (get) Token: 0x06001252 RID: 4690 RVA: 0x00082144 File Offset: 0x00080344
	public bool released
	{
		get
		{
			return this.button.released;
		}
	}

	// Token: 0x06001253 RID: 4691 RVA: 0x00082154 File Offset: 0x00080354
	public void close(bool snap = false)
	{
		if (!this.opening || this.panel.baseClipRegion.w == 1f)
		{
			return;
		}
		this.opening = false;
		if (snap)
		{
			this.tween_time = 0f;
			this.setClipping(0f);
		}
		else
		{
			this.tween_time = this.slide_time - this.tween_time;
		}
		this.setButtons();
	}

	// Token: 0x06001254 RID: 4692 RVA: 0x000821CC File Offset: 0x000803CC
	public void open(bool snap = false)
	{
		if (this.opening || this.panel.baseClipRegion.w != 1f)
		{
			return;
		}
		this.opening = true;
		if (snap)
		{
			this.tween_time = 0f;
			this.setClipping(1f);
		}
		else
		{
			this.tween_time = this.slide_time - this.tween_time;
		}
		this.setButtons();
	}

	// Token: 0x06001255 RID: 4693 RVA: 0x00082244 File Offset: 0x00080444
	private void setButtons()
	{
		this.button_go.SetActive(!this.opening);
		this.selected_go.SetActive(this.opening);
	}

	// Token: 0x06001256 RID: 4694 RVA: 0x0008226C File Offset: 0x0008046C
	public void Update()
	{
		if (this.tween_time > 0f)
		{
			this.tween_time -= Time.deltaTime;
			if (this.tween_time < 0f)
			{
				this.tween_time = 0f;
			}
			this.setClipping((this.slide_time - this.tween_time) / this.slide_time);
		}
	}

	// Token: 0x06001257 RID: 4695 RVA: 0x000822D0 File Offset: 0x000804D0
	private void setClipping(float percentage)
	{
		float num = (float)this.grid.transform.childCount * this.grid.cellHeight;
		float num2 = percentage * num;
		if (!this.opening)
		{
			num2 = num - num2;
		}
		Vector4 baseClipRegion = this.panel.baseClipRegion;
		baseClipRegion.w = 1f + num2;
		baseClipRegion.y = -(num2 / 2f);
		this.panel.baseClipRegion = baseClipRegion;
		Vector3 localPosition = this.grid.transform.localPosition;
		localPosition.y = this.orig_y + num - num2;
		this.grid.transform.localPosition = localPosition;
		Vector2 clipOffset = this.panel.clipOffset;
		clipOffset.y = -(num - num2);
		this.panel.clipOffset = clipOffset;
		if (this.opening)
		{
			this.table.Reposition();
		}
	}

	// Token: 0x040012D4 RID: 4820
	public buttonBehavior button;

	// Token: 0x040012D5 RID: 4821
	public GameObject button_go;

	// Token: 0x040012D6 RID: 4822
	public GameObject selected_go;

	// Token: 0x040012D7 RID: 4823
	public DatabasePanelBehavior.mode_enum mode;

	// Token: 0x040012D8 RID: 4824
	public bool is_help;

	// Token: 0x040012D9 RID: 4825
	public UIGrid grid;

	// Token: 0x040012DA RID: 4826
	public UIPanel panel;

	// Token: 0x040012DB RID: 4827
	public float slide_time = 0.3f;

	// Token: 0x040012DC RID: 4828
	private float tween_time;

	// Token: 0x040012DD RID: 4829
	private bool opening;

	// Token: 0x040012DE RID: 4830
	private float orig_y;

	// Token: 0x040012DF RID: 4831
	public UITable table;
}
