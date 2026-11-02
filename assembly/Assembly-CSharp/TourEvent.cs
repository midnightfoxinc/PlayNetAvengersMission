using System;
using System.Collections;
using UnityEngine;

// Token: 0x020001AB RID: 427
public class TourEvent : MonoBehaviour
{
	// Token: 0x06000CBD RID: 3261 RVA: 0x0005C7EC File Offset: 0x0005A9EC
	private void Awake()
	{
		if (!this.ParentGroup)
		{
			this.ParentGroup = base.gameObject.transform.parent.GetComponent<TourGroup>();
		}
	}

	// Token: 0x06000CBE RID: 3262 RVA: 0x0005C824 File Offset: 0x0005AA24
	private void Start()
	{
		if (!this.ParentGroup)
		{
			base.gameObject.transform.parent.GetComponent<TourGroup>();
		}
	}

	// Token: 0x06000CBF RID: 3263 RVA: 0x0005C858 File Offset: 0x0005AA58
	public void BeginEvent()
	{
		if (this.CompleteOn == TourEvent.CompletionConditions.ButtonClicked)
		{
			if (this.ButtonToClick)
			{
				this.ParentGroup.Manager.HighlightObject(this.ObjectToHighlight, this.TransitionSpeedInSeconds);
				if (this.DisplayDialog)
				{
					this.ParentGroup.Manager.DisplayDialog(this);
				}
				base.StartCoroutine(this.CheckButtonClick(this.ButtonToClick));
			}
			else
			{
				globals.debugError("No ButtonToClick specified! Skipping TourEvent!");
				this.ParentGroup.EventComplete(this);
			}
		}
		else if (this.CompleteOn == TourEvent.CompletionConditions.NextButton)
		{
			if (this.ParentGroup && this.ParentGroup.Manager && this.ParentGroup.Manager.NextButton)
			{
				this.ParentGroup.Manager.HighlightObject(this.ObjectToHighlight, this.TransitionSpeedInSeconds);
				if (this.DisplayDialog)
				{
					this.ParentGroup.Manager.DisplayDialog(this);
				}
				base.StartCoroutine(this.CheckButtonClick(this.ParentGroup.Manager.NextButton));
			}
			else
			{
				globals.debugError("Missing references to either ParentGroup, Manager, or NextButton. Skipping!");
			}
		}
	}

	// Token: 0x06000CC0 RID: 3264 RVA: 0x0005C99C File Offset: 0x0005AB9C
	private IEnumerator CheckButtonClick(ButtonCoreBehavior Button)
	{
		yield return null;
		while (!Button.released)
		{
			yield return null;
		}
		this.ParentGroup.EventComplete(this);
		yield break;
	}

	// Token: 0x04000CA8 RID: 3240
	public TourGroup ParentGroup;

	// Token: 0x04000CA9 RID: 3241
	public TourEvent.CompletionConditions CompleteOn = TourEvent.CompletionConditions.NextButton;

	// Token: 0x04000CAA RID: 3242
	public ButtonCoreBehavior ButtonToClick;

	// Token: 0x04000CAB RID: 3243
	public GameObject ObjectToHighlight;

	// Token: 0x04000CAC RID: 3244
	public bool DisplayDialog = true;

	// Token: 0x04000CAD RID: 3245
	public TourManager.DialogBoxDirection DialogOrientation = TourManager.DialogBoxDirection.NorthEast;

	// Token: 0x04000CAE RID: 3246
	public Vector2 DialogOffset;

	// Token: 0x04000CAF RID: 3247
	[Multiline]
	public string TextToDisplay;

	// Token: 0x04000CB0 RID: 3248
	public float TransitionSpeedInSeconds = 1f;

	// Token: 0x04000CB1 RID: 3249
	public AudioClip sfx;

	// Token: 0x020001AC RID: 428
	public enum CompletionConditions
	{
		// Token: 0x04000CB3 RID: 3251
		ButtonClicked,
		// Token: 0x04000CB4 RID: 3252
		NextButton
	}
}
