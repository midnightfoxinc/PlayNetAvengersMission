using System;
using UnityEngine;
using UnityEngine.UI;

// Token: 0x0200004C RID: 76
[Serializable]
public class ETCArea : MonoBehaviour
{
	// Token: 0x06000297 RID: 663 RVA: 0x000111F8 File Offset: 0x0000F3F8
	public ETCArea()
	{
		this.show = true;
	}

	// Token: 0x06000298 RID: 664 RVA: 0x00011208 File Offset: 0x0000F408
	public void Awake()
	{
		base.GetComponent<Image>().enabled = this.show;
	}

	// Token: 0x06000299 RID: 665 RVA: 0x0001121C File Offset: 0x0000F41C
	public void ApplyPreset(ETCArea.AreaPreset preset)
	{
		RectTransform component = base.transform.parent.GetComponent<RectTransform>();
		switch (preset)
		{
		case ETCArea.AreaPreset.TopLeft:
			this.rectTransform().anchoredPosition = new Vector2(-component.rect.width / 4f, component.rect.height / 4f);
			this.rectTransform().SetSizeWithCurrentAnchors(0, component.rect.width / 2f);
			this.rectTransform().SetSizeWithCurrentAnchors(1, component.rect.height / 2f);
			this.rectTransform().anchorMin = new Vector2(0f, 1f);
			this.rectTransform().anchorMax = new Vector2(0f, 1f);
			this.rectTransform().anchoredPosition = new Vector2(this.rectTransform().sizeDelta.x / 2f, -this.rectTransform().sizeDelta.y / 2f);
			break;
		case ETCArea.AreaPreset.TopRight:
			this.rectTransform().anchoredPosition = new Vector2(component.rect.width / 4f, component.rect.height / 4f);
			this.rectTransform().SetSizeWithCurrentAnchors(0, component.rect.width / 2f);
			this.rectTransform().SetSizeWithCurrentAnchors(1, component.rect.height / 2f);
			this.rectTransform().anchorMin = new Vector2(1f, 1f);
			this.rectTransform().anchorMax = new Vector2(1f, 1f);
			this.rectTransform().anchoredPosition = new Vector2(-this.rectTransform().sizeDelta.x / 2f, -this.rectTransform().sizeDelta.y / 2f);
			break;
		case ETCArea.AreaPreset.BottomLeft:
			this.rectTransform().anchoredPosition = new Vector2(-component.rect.width / 4f, -component.rect.height / 4f);
			this.rectTransform().SetSizeWithCurrentAnchors(0, component.rect.width / 2f);
			this.rectTransform().SetSizeWithCurrentAnchors(1, component.rect.height / 2f);
			this.rectTransform().anchorMin = new Vector2(0f, 0f);
			this.rectTransform().anchorMax = new Vector2(0f, 0f);
			this.rectTransform().anchoredPosition = new Vector2(this.rectTransform().sizeDelta.x / 2f, this.rectTransform().sizeDelta.y / 2f);
			break;
		case ETCArea.AreaPreset.BottomRight:
			this.rectTransform().anchoredPosition = new Vector2(component.rect.width / 4f, -component.rect.height / 4f);
			this.rectTransform().SetSizeWithCurrentAnchors(0, component.rect.width / 2f);
			this.rectTransform().SetSizeWithCurrentAnchors(1, component.rect.height / 2f);
			this.rectTransform().anchorMin = new Vector2(1f, 0f);
			this.rectTransform().anchorMax = new Vector2(1f, 0f);
			this.rectTransform().anchoredPosition = new Vector2(-this.rectTransform().sizeDelta.x / 2f, this.rectTransform().sizeDelta.y / 2f);
			break;
		}
	}

	// Token: 0x040002BC RID: 700
	public bool show;

	// Token: 0x0200004D RID: 77
	public enum AreaPreset
	{
		// Token: 0x040002BE RID: 702
		Choose,
		// Token: 0x040002BF RID: 703
		TopLeft,
		// Token: 0x040002C0 RID: 704
		TopRight,
		// Token: 0x040002C1 RID: 705
		BottomLeft,
		// Token: 0x040002C2 RID: 706
		BottomRight
	}
}
