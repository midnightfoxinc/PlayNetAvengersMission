using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002E5 RID: 741
public class GTMMainBehavior : MonoBehaviour
{
	// Token: 0x0600137E RID: 4990 RVA: 0x0008B53C File Offset: 0x0008973C
	private void Start()
	{
		this.planes = GeometryUtility.CalculateFrustumPlanes(this.cam);
		float num = (float)(this.indicator_bg.width / 2);
		float num2 = (float)(this.indicator_bg.height / 2);
		Vector3 position = this.cam.ViewportToWorldPoint(Vector3.zero);
		this.indicator.transform.position = position;
		position = this.indicator.transform.localPosition;
		this.indicatorX.x = position.x + num;
		this.indicatorY.x = position.y + num + 20f;
		position = this.cam.ViewportToWorldPoint(Vector3.one);
		this.indicator.transform.position = position;
		position = this.indicator.transform.localPosition;
		this.indicatorX.y = position.x - num2;
		this.indicatorY.y = position.y - num2;
		globals.music_jukebox.change_music(this.music, 0.25f);
		int num3 = 0;
		int num4 = 0;
		for (int i = 0; i < globals.location_data.item.Count; i++)
		{
			if (globals.location_data.item[i].offworld)
			{
				if (this.offworld_button.Count <= num4)
				{
					LocationButtonBehavior locationButtonBehavior = this.offworld_button[0].CopyInPlace() as LocationButtonBehavior;
					locationButtonBehavior.name = "offworld button " + this.offworld_button.Count.ToString();
					this.offworld_button.Add(locationButtonBehavior);
				}
				this.offworld_button[num4].set_data(globals.location_data.item[i]);
				this._location_button.Add(this.offworld_button[num4]);
				num4++;
			}
			else
			{
				if (this.onworld_button.Count <= num3)
				{
					LocationButtonBehavior locationButtonBehavior2 = this.onworld_button[0].CopyInPlace() as LocationButtonBehavior;
					locationButtonBehavior2.name = "location button " + this.onworld_button.Count.ToString();
					this.onworld_button.Add(locationButtonBehavior2);
				}
				this.onworld_button[num3].set_data(globals.location_data.item[i]);
				this._location_button.Add(this.onworld_button[num3]);
				num3++;
			}
		}
		this._current_zoom = this.zoom_min;
		this.results_panel.show(globals.mission_summary.Count > 0);
		if (!string.IsNullOrEmpty(globals.location_id))
		{
			for (int j = 0; j < this._location_button.Count; j++)
			{
				if (this._location_button[j].id == globals.location_id)
				{
					this._centered_location = j;
					this.start_centering(0);
				}
			}
		}
		globals.sfx_master.play(this.intro_sfx, null);
		ScavengerHuntManagerClass scavenger_hunt_manager = globals.scavenger_hunt_manager;
		scavenger_hunt_types type = scavenger_hunt_types.VIEW_SCENE;
		List<string> list = new List<string>();
		list.Add("globe");
		scavenger_hunt_manager.do_action(type, list, 1);
	}

	// Token: 0x0600137F RID: 4991 RVA: 0x0008B87C File Offset: 0x00089A7C
	private void start_centering(int delta)
	{
		if (delta != 0)
		{
			this._centered_location += delta + this._location_button.Count;
			this._centered_location %= this._location_button.Count;
		}
		this._center_rotation = -this._location_button[this._centered_location].transform.localEulerAngles;
		this._previous_rotation = new Vector2(this.globe_x_rot.localEulerAngles.x, this.globe.transform.localEulerAngles.y);
		this._centering_progress = 0f;
		this._drot_mag = 0f;
	}

	// Token: 0x06001380 RID: 4992 RVA: 0x0008B938 File Offset: 0x00089B38
	private void update_zoom()
	{
		this._current_zoom = Mathf.SmoothDamp(this._current_zoom, Mathf.Lerp(this.zoom_min, this.zoom_max, this.zoom_slider.value), ref this._dzoom, 0.1f);
		this.zoom_transform.localScale = Vector3.one * this._current_zoom;
	}

	// Token: 0x06001381 RID: 4993 RVA: 0x0008B998 File Offset: 0x00089B98
	private void update_location_buttons()
	{
		string text = string.Empty;
		if (this.mission_alert_popup.alerted_mission)
		{
			text = this.mission_alert_popup.alerted_mission.location.id;
		}
		for (int i = 0; i < this._location_button.Count; i++)
		{
			this._location_button[i].update_state(this._location_button[i].id == text);
			this._location_button[i].set_depth();
			if (this._location_button[i].state == location_button_state_enum.high_alert)
			{
				if (!GeometryUtility.TestPlanesAABB(this.planes, this._location_button[i].press_collider.bounds))
				{
					Vector3 vector = this.cam.WorldToViewportPoint(this._location_button[i].press_collider.bounds.center);
					float num = Mathf.Atan2(vector.y - 0.5f, vector.x - 0.5f);
					num = num * 180f / 3.1415927f;
					globals.debug("rot: " + num);
					Vector3 vector2 = vector;
					vector2.x = Mathf.Clamp(vector2.x, 0f, 1f);
					vector2.y = Mathf.Clamp(vector2.y, 0f, 1f);
					vector2.z = 0f;
					vector2 = this.cam.ViewportToWorldPoint(vector2);
					this.indicator.transform.position = vector2;
					vector2 = this.indicator.transform.localPosition;
					vector2.x = Mathf.Min(this.indicatorX.y, Mathf.Max(this.indicatorX.x, vector2.x));
					vector2.y = Mathf.Min(this.indicatorY.y, Mathf.Max(this.indicatorY.x, vector2.y));
					this.indicator.transform.localPosition = vector2;
					this.indicator_bg.transform.localRotation = Quaternion.Euler(new Vector3(0f, 0f, num));
					this.indicator.gameObject.SetActive(true);
				}
				else
				{
					this.indicator.gameObject.SetActive(false);
				}
			}
		}
	}

	// Token: 0x06001382 RID: 4994 RVA: 0x0008BC0C File Offset: 0x00089E0C
	private void Update()
	{
		if (this.back_button.clicked || globals.base_escape_hit())
		{
			DMOManager.LogNavigation(NavigationManager.hq_scene, "back_btn", NavigationManager.gtm_scene, null);
			NavigationManager.load_scene(NavigationManager.hq_scene);
		}
		this.snap_buttons_container.SetActive(!this.mission_alert_popup.showing);
		if (this.prev_button.hit)
		{
			this.start_centering(-1);
			return;
		}
		if (this.next_button.hit)
		{
			this.start_centering(1);
			return;
		}
		if (this._centering_progress < 1f)
		{
			this._centering_progress += Time.deltaTime;
			float num = this.centering_curve.Evaluate(this._centering_progress);
			float num2 = Mathf.LerpAngle(this._previous_rotation.x, this._center_rotation.x, num);
			float num3 = Mathf.LerpAngle(this._previous_rotation.y, this._center_rotation.y, num);
			this.globe_x_rot.localEulerAngles = new Vector3(num2, 0f, 0f);
			this.globe.transform.localEulerAngles = new Vector3(0f, num3, 0f);
			this.update_zoom();
			return;
		}
		if (Input.GetMouseButton(0))
		{
			if (globals.selectedObject == this.zoom_slider.thumb.gameObject)
			{
				this.zooming = true;
				this._pressed_button = null;
			}
			else if (globals.selectedObject == this.globe_collider.gameObject && !this.zooming)
			{
				if (Input.touchCount != this._previous_touchcount)
				{
					this._previous_touchcount = Input.touchCount;
					this.dragging = false;
				}
				if (!this.dragging)
				{
					this._drag_start_pos = Input.mousePosition;
					this._globe_start_rot = new Vector2(-this.globe.transform.localEulerAngles.y, this.globe_x_rot.localEulerAngles.x);
				}
				this.dragging = true;
				this._pressed_button = null;
			}
		}
		else
		{
			this.dragging = false;
			this.zooming = false;
			this._previous_touchcount = 0;
			if (this._pressed_button && this._pressed_button.released)
			{
				globals.location_id = this._pressed_button.id;
				globals.sfx_master.play(this.travel_sfx, null);
				DMOManager.LogNavigation(AnalyticsStrings.GetAnalyticsTranslationName(globals.location_id), "location_icon", NavigationManager.gtm_scene, null);
				NavigationManager.load_scene(NavigationManager.location_scene);
				return;
			}
			this._pressed_button = null;
			if (this._drot_mag > 0f)
			{
				this.globe.transform.Rotate(0f, this._drot.y, 0f);
				this._drot_mag -= this.rot_decay * Time.deltaTime;
				this._drot = this._drot.normalized * this._drot_mag;
			}
		}
		if (this.dragging)
		{
			float num4 = this.rot_speed / (float)Screen.width;
			Vector3 vector = this._globe_start_rot + (Input.mousePosition - this._drag_start_pos) * num4;
			float num5;
			for (num5 = vector.y; num5 > 180f; num5 -= 360f)
			{
			}
			if (num5 > this.max_x_rot)
			{
				num5 = this.max_x_rot;
			}
			else if (num5 < -this.max_x_rot)
			{
				num5 = -this.max_x_rot;
			}
			this._drot = new Vector2(Mathf.DeltaAngle(this.globe_x_rot.transform.localEulerAngles.x, num5), Mathf.DeltaAngle(this.globe.transform.localEulerAngles.y, -vector.x));
			this._drot_mag = this._drot.magnitude;
			this.globe_x_rot.transform.localEulerAngles = new Vector3(num5, 0f, 0f);
			this.globe.transform.localEulerAngles = new Vector3(0f, -vector.x, 0f);
		}
		else if (!this.zooming)
		{
			for (int i = 0; i < this.onworld_button.Count; i++)
			{
				if (this.onworld_button[i].hit)
				{
					this._pressed_button = this.onworld_button[i];
				}
			}
			for (int j = 0; j < this.offworld_button.Count; j++)
			{
				if (this.offworld_button[j].hit)
				{
					this._pressed_button = this.offworld_button[j];
				}
			}
		}
		if (this.zoom_in_button.hit && this.zoom_slider.value < 1f)
		{
			this.zoom_in_button.play_sfx();
			this.zoom_slider.value += this.zoom_step;
		}
		else if (this.zoom_out_button.hit && this.zoom_slider.value > 0f)
		{
			this.zoom_out_button.play_sfx();
			this.zoom_slider.value -= this.zoom_step;
		}
		if (this.pinch.pinching)
		{
			this.zoom_slider.value = this.pinch.value;
		}
		else
		{
			this.pinch.value = this.zoom_slider.value;
		}
		this.update_zoom();
		this.update_location_buttons();
		if (this.results_panel.gameObject.activeInHierarchy || (globals.gear_daisy && globals.gear_daisy.submenu_open()))
		{
			this.main_panel.gameObject.SetLayerRecursively(this.blur_camera.gameObject.layer);
		}
		else if (globals.scavenger_hunt_manager.panel && globals.scavenger_hunt_manager.panel.showing())
		{
			this.main_panel.gameObject.SetLayerRecursively(this.blur_camera.gameObject.layer);
		}
		else
		{
			this.main_panel.gameObject.SetLayerRecursively(this.ui_camera.gameObject.layer);
		}
		if (this.mission_alert_popup.alerted_mission && (this.snapped_to_mission == null || this.mission_alert_popup.alerted_mission.id != this.snapped_to_mission.id))
		{
			this.snapped_to_mission = this.mission_alert_popup.alerted_mission;
			for (int k = 0; k < this._location_button.Count; k++)
			{
				if (this._location_button[k].id == this.snapped_to_mission.location.id)
				{
					this.start_centering(k - this._centered_location);
				}
			}
		}
	}

	// Token: 0x040014EB RID: 5355
	public GameObject globe;

	// Token: 0x040014EC RID: 5356
	public Transform globe_x_rot;

	// Token: 0x040014ED RID: 5357
	public Collider globe_collider;

	// Token: 0x040014EE RID: 5358
	public buttonBehavior back_button;

	// Token: 0x040014EF RID: 5359
	public string music = "gtm music";

	// Token: 0x040014F0 RID: 5360
	public List<LocationButtonBehavior> onworld_button;

	// Token: 0x040014F1 RID: 5361
	public List<LocationButtonBehavior> offworld_button;

	// Token: 0x040014F2 RID: 5362
	public UIPanel main_panel;

	// Token: 0x040014F3 RID: 5363
	public ResultsPanelBehavior results_panel;

	// Token: 0x040014F4 RID: 5364
	public Camera ui_camera;

	// Token: 0x040014F5 RID: 5365
	public Camera blur_camera;

	// Token: 0x040014F6 RID: 5366
	public float rot_speed = 300f;

	// Token: 0x040014F7 RID: 5367
	public float rot_decay = 1f;

	// Token: 0x040014F8 RID: 5368
	public float max_x_rot = 80f;

	// Token: 0x040014F9 RID: 5369
	public UISlider zoom_slider;

	// Token: 0x040014FA RID: 5370
	public float zoom_min = 1f;

	// Token: 0x040014FB RID: 5371
	public float zoom_max = 2f;

	// Token: 0x040014FC RID: 5372
	public float zoom_step = 0.1f;

	// Token: 0x040014FD RID: 5373
	public buttonBehavior zoom_in_button;

	// Token: 0x040014FE RID: 5374
	public buttonBehavior zoom_out_button;

	// Token: 0x040014FF RID: 5375
	public Transform zoom_transform;

	// Token: 0x04001500 RID: 5376
	public PinchBehavior pinch;

	// Token: 0x04001501 RID: 5377
	public buttonBehavior prev_button;

	// Token: 0x04001502 RID: 5378
	public buttonBehavior next_button;

	// Token: 0x04001503 RID: 5379
	public AnimationCurve centering_curve;

	// Token: 0x04001504 RID: 5380
	public AlertPopupBehavior mission_alert_popup;

	// Token: 0x04001505 RID: 5381
	public GameObject snap_buttons_container;

	// Token: 0x04001506 RID: 5382
	public SFXJukeboxBehavior jarvis;

	// Token: 0x04001507 RID: 5383
	public string intro_sfx = "SFX_CHARTIP";

	// Token: 0x04001508 RID: 5384
	public string travel_sfx = "travel";

	// Token: 0x04001509 RID: 5385
	public bool dragging;

	// Token: 0x0400150A RID: 5386
	public bool zooming;

	// Token: 0x0400150B RID: 5387
	public UILabel debug_label;

	// Token: 0x0400150C RID: 5388
	private Vector3 _drag_start_pos;

	// Token: 0x0400150D RID: 5389
	private Vector2 _globe_start_rot = Vector2.zero;

	// Token: 0x0400150E RID: 5390
	private int _centered_location;

	// Token: 0x0400150F RID: 5391
	private Vector2 _center_rotation;

	// Token: 0x04001510 RID: 5392
	private Vector2 _previous_rotation;

	// Token: 0x04001511 RID: 5393
	private Vector2 _drot = Vector2.zero;

	// Token: 0x04001512 RID: 5394
	private float _drot_mag;

	// Token: 0x04001513 RID: 5395
	private float _centering_progress = 1f;

	// Token: 0x04001514 RID: 5396
	private float _dzoom;

	// Token: 0x04001515 RID: 5397
	private float _current_zoom;

	// Token: 0x04001516 RID: 5398
	private int _previous_touchcount;

	// Token: 0x04001517 RID: 5399
	private List<LocationButtonBehavior> _location_button = new List<LocationButtonBehavior>();

	// Token: 0x04001518 RID: 5400
	private LocationButtonBehavior _pressed_button;

	// Token: 0x04001519 RID: 5401
	private missionDataClass snapped_to_mission;

	// Token: 0x0400151A RID: 5402
	public Camera cam;

	// Token: 0x0400151B RID: 5403
	private Plane[] planes;

	// Token: 0x0400151C RID: 5404
	public UISprite indicator;

	// Token: 0x0400151D RID: 5405
	public UISprite indicator_bg;

	// Token: 0x0400151E RID: 5406
	private Vector2 indicatorX;

	// Token: 0x0400151F RID: 5407
	private Vector2 indicatorY;
}
