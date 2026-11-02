using System;
using System.Collections;
using UnityEngine;

// Token: 0x020001AE RID: 430
[RequireComponent(typeof(AudioSource))]
public class TourManager : MonoBehaviour
{
	// Token: 0x170001B6 RID: 438
	// (get) Token: 0x06000CC9 RID: 3273 RVA: 0x0005CD44 File Offset: 0x0005AF44
	public AudioSource audio
	{
		get
		{
			if (!this._audio)
			{
				this._audio = base.GetComponent<AudioSource>();
			}
			return this._audio;
		}
	}

	// Token: 0x06000CCA RID: 3274 RVA: 0x0005CD74 File Offset: 0x0005AF74
	private void Awake()
	{
		if (this.DialogBox)
		{
			this.DialogBox.SetActive(false);
		}
		if (this.DialogText)
		{
			this.DialogText.gameObject.SetActive(false);
		}
		if (this.NextButton)
		{
			this.NextButton.gameObject.SetActive(false);
		}
		if (this.HighlightPanel)
		{
			this.HighlightPanel.gameObject.SetActive(false);
		}
	}

	// Token: 0x06000CCB RID: 3275 RVA: 0x0005CE00 File Offset: 0x0005B000
	private void FixedUpdate()
	{
		if (this.MoveToHighlight && this.MoveProgress < 1f)
		{
			this.MoveProgress += Time.deltaTime / this.TransitionTimeInSeconds;
			this.HighlightPanel.gameObject.transform.position = Vector3.Lerp(this.OldPosition, this.ObjectToHighlight.transform.position, this.Curve.Evaluate(this.MoveProgress));
		}
	}

	// Token: 0x06000CCC RID: 3276 RVA: 0x0005CE84 File Offset: 0x0005B084
	public void HighlightObject(GameObject Obj, float MoveTime)
	{
		NGUITools.SetActive(this.HighlightPanel.gameObject, true);
		this.OldPosition = this.HighlightPanel.transform.position;
		this.ObjectToHighlight = Obj;
		this.TransitionTimeInSeconds = MoveTime;
		this.MoveToHighlight = true;
		this.MoveProgress = 0f;
		if (this.HighlightPanel.alpha != this.PanelAlpha)
		{
			base.StartCoroutine(this.FadeAlpha(true));
		}
	}

	// Token: 0x06000CCD RID: 3277 RVA: 0x0005CEFC File Offset: 0x0005B0FC
	public void DisplayDialog(TourEvent e)
	{
		this.DisplayDialog(e.DialogOrientation, e.TextToDisplay, e.DialogOffset);
		if (e.sfx && !SFXJukeboxBehavior.muted)
		{
			this.audio.clip = e.sfx;
			this.audio.Play();
		}
	}

	// Token: 0x06000CCE RID: 3278 RVA: 0x0005CF58 File Offset: 0x0005B158
	public void DisplayDialog(TourManager.DialogBoxDirection Direction, string Text, Vector2 Offset)
	{
		this.TourRunning = true;
		if (this.DialogBox && this.DialogBoxBackground && this.DialogText)
		{
			NGUITools.SetActive(this.DialogBox, true);
			NGUITools.SetActive(this.DialogText.gameObject, true);
			NGUITools.SetActive(this.NextButton.gameObject, true);
			this.DialogText.text = Text;
			Vector3 vector;
			vector..ctor(Offset.x * 0.01f, Offset.y * 0.01f, 0f);
			this.DialogBox.gameObject.transform.position = this.ObjectToHighlight.transform.position + vector;
			if (Direction == TourManager.DialogBoxDirection.NorthEast)
			{
				this.DialogBoxBackground.gameObject.transform.localEulerAngles = Vector3.zero;
				this.DialogBoxBackground.gameObject.transform.localScale = Vector3.one;
				this.DialogText.gameObject.transform.position = this.NEDialog.transform.position;
				this.NextButton.gameObject.transform.position = this.NENext.transform.position;
			}
			else if (Direction == TourManager.DialogBoxDirection.NorthWest)
			{
				this.DialogBoxBackground.gameObject.transform.localEulerAngles = Vector3.zero;
				this.DialogBoxBackground.gameObject.transform.localScale = new Vector3(-1f, 1f, 1f);
				this.DialogText.gameObject.transform.position = this.NWDialog.transform.position;
				this.NextButton.gameObject.transform.position = this.NWNext.transform.position;
			}
			else if (Direction == TourManager.DialogBoxDirection.SouthEast)
			{
				this.DialogBoxBackground.gameObject.transform.localEulerAngles = new Vector3(0f, 0f, 180f);
				this.DialogBoxBackground.gameObject.transform.localScale = new Vector3(-1f, 1f, 1f);
				this.DialogText.gameObject.transform.position = this.SEDialog.transform.position;
				this.NextButton.gameObject.transform.position = this.SENext.transform.position;
			}
			else if (Direction == TourManager.DialogBoxDirection.SouthWest)
			{
				this.DialogBoxBackground.gameObject.transform.localEulerAngles = new Vector3(0f, 0f, 180f);
				this.DialogBoxBackground.gameObject.transform.localScale = Vector3.one;
				this.DialogText.gameObject.transform.position = this.SWDialog.transform.position;
				this.NextButton.gameObject.transform.position = this.SWNext.transform.position;
			}
			if (this.Jarvis)
			{
				this.Jarvis.transform.localEulerAngles = Vector3.zero;
			}
		}
	}

	// Token: 0x06000CCF RID: 3279 RVA: 0x0005D2AC File Offset: 0x0005B4AC
	public void HideDialog()
	{
		NGUITools.SetActive(this.DialogBox.gameObject, false);
	}

	// Token: 0x06000CD0 RID: 3280 RVA: 0x0005D2C0 File Offset: 0x0005B4C0
	public void StopMovement()
	{
		this.MoveToHighlight = false;
	}

	// Token: 0x06000CD1 RID: 3281 RVA: 0x0005D2CC File Offset: 0x0005B4CC
	public bool IsTourCompleted()
	{
		return false;
	}

	// Token: 0x06000CD2 RID: 3282 RVA: 0x0005D2D0 File Offset: 0x0005B4D0
	public void CompleteTour(TourGroup Group)
	{
		Group.gameObject.SetActive(false);
		this.Shutdown();
	}

	// Token: 0x06000CD3 RID: 3283 RVA: 0x0005D2E4 File Offset: 0x0005B4E4
	public void Shutdown()
	{
		if (this.ObjectToHighlight && this.HighlightPanel)
		{
			this.HighlightPanel.transform.position = this.ObjectToHighlight.transform.position;
		}
		else if (this.HighlightPanel)
		{
			this.HighlightPanel.transform.position = this.OffScreenPosition;
		}
		NGUITools.SetActive(this.DialogBox, false);
		NGUITools.SetActive(this.DialogText.gameObject, false);
		NGUITools.SetActive(this.NextButton.gameObject, false);
		this.audio.Stop();
		this.StopMovement();
		base.StartCoroutine(this.FadeAlpha(false));
		base.StartCoroutine(this.ShutdownCheck());
	}

	// Token: 0x06000CD4 RID: 3284 RVA: 0x0005D3B8 File Offset: 0x0005B5B8
	private IEnumerator FadeAlpha(bool In)
	{
		this.FadeIn = In;
		float LerpPercent = 0f;
		if (In)
		{
			while (this.HighlightPanel.alpha < this.PanelAlpha && this.FadeIn)
			{
				this.HighlightPanel.alpha = Mathf.Lerp(0f, this.PanelAlpha, LerpPercent);
				LerpPercent += Time.deltaTime / this.TransitionTimeInSeconds;
				yield return null;
			}
		}
		else
		{
			while (this.HighlightPanel.alpha > 0f && !this.FadeIn)
			{
				this.HighlightPanel.alpha = Mathf.Lerp(this.PanelAlpha, 0f, LerpPercent);
				LerpPercent += Time.deltaTime / 0.25f;
				yield return null;
			}
		}
		yield break;
	}

	// Token: 0x06000CD5 RID: 3285 RVA: 0x0005D3E4 File Offset: 0x0005B5E4
	private IEnumerator ShutdownCheck()
	{
		while (this.HighlightPanel.alpha > 0f)
		{
			yield return null;
		}
		this.HighlightPanel.gameObject.transform.localPosition = Vector3.zero;
		NGUITools.SetActive(this.HighlightPanel.gameObject, false);
		this.TourRunning = false;
		yield break;
	}

	// Token: 0x04000CBA RID: 3258
	public ButtonCoreBehavior NextButton;

	// Token: 0x04000CBB RID: 3259
	public GameObject NENext;

	// Token: 0x04000CBC RID: 3260
	public GameObject NWNext;

	// Token: 0x04000CBD RID: 3261
	public GameObject SENext;

	// Token: 0x04000CBE RID: 3262
	public GameObject SWNext;

	// Token: 0x04000CBF RID: 3263
	public GameObject NEDialog;

	// Token: 0x04000CC0 RID: 3264
	public GameObject NWDialog;

	// Token: 0x04000CC1 RID: 3265
	public GameObject SEDialog;

	// Token: 0x04000CC2 RID: 3266
	public GameObject SWDialog;

	// Token: 0x04000CC3 RID: 3267
	public GameObject DialogBox;

	// Token: 0x04000CC4 RID: 3268
	public GameObject DialogBoxBackground;

	// Token: 0x04000CC5 RID: 3269
	public UILabel DialogText;

	// Token: 0x04000CC6 RID: 3270
	public GameObject Jarvis;

	// Token: 0x04000CC7 RID: 3271
	public UIPanel HighlightPanel;

	// Token: 0x04000CC8 RID: 3272
	[Range(0f, 1f)]
	public float PanelAlpha = 0.75f;

	// Token: 0x04000CC9 RID: 3273
	public AnimationCurve Curve;

	// Token: 0x04000CCA RID: 3274
	public Vector3 OffScreenPosition;

	// Token: 0x04000CCB RID: 3275
	[HideInInspector]
	public bool TourRunning;

	// Token: 0x04000CCC RID: 3276
	private bool MoveToHighlight;

	// Token: 0x04000CCD RID: 3277
	private float TransitionTimeInSeconds = 1f;

	// Token: 0x04000CCE RID: 3278
	private GameObject ObjectToHighlight;

	// Token: 0x04000CCF RID: 3279
	private float MoveProgress;

	// Token: 0x04000CD0 RID: 3280
	private Vector3 OldPosition;

	// Token: 0x04000CD1 RID: 3281
	private bool FadeIn;

	// Token: 0x04000CD2 RID: 3282
	private AudioSource _audio;

	// Token: 0x020001AF RID: 431
	public enum DialogBoxDirection
	{
		// Token: 0x04000CD4 RID: 3284
		NorthWest,
		// Token: 0x04000CD5 RID: 3285
		NorthEast,
		// Token: 0x04000CD6 RID: 3286
		SouthWest,
		// Token: 0x04000CD7 RID: 3287
		SouthEast
	}
}
