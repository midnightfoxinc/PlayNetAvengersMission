using System;
using UnityEngine;

// Token: 0x020001A9 RID: 425
public class StartingSceneMainBehavior : SplashMainBehavior
{
	// Token: 0x06000CB7 RID: 3255 RVA: 0x0005C574 File Offset: 0x0005A774
	protected override void Start()
	{
		Application.targetFrameRate = 60;
		globals.DisneyIDManager.setup();
		if (this.reset_ftue_button)
		{
			if (globals.build_type != build_type_enum.development)
			{
				this.reset_ftue_button.gameObject.SetActive(false);
			}
			else
			{
				this.reset_ftue_button.gameObject.SetActive(globals.FTUE_manager.done);
			}
		}
		if (this.build_version_label)
		{
			string text = (!globals.environment_manager.isProd) ? "staging " : string.Empty;
			if (globals.build_type == build_type_enum.release)
			{
				this.build_version_label.text = text + BundleVersion.get(true);
			}
			else
			{
				this.build_version_label.text = text + globals.build_type.ToString() + " " + BundleVersion.get(true);
			}
		}
		this.blackout.SetActive(false);
		this.sfx_jukebox.play(this.sfx, null);
		base.Start();
		globals.debug(globals.database_data.item.Count.ToString() + " database data items preloaded");
		globals.debug(globals.location_data.item.Count.ToString() + " location data items preloaded");
		NotificationHandler.init();
	}

	// Token: 0x06000CB8 RID: 3256 RVA: 0x0005C6D4 File Offset: 0x0005A8D4
	protected override void time_expired()
	{
		if (globals.FTUE_manager.done)
		{
			globals.FTUE_manager.finish();
		}
		else
		{
			this.blackout.SetActive(true);
			this.sfx_jukebox.stop();
			DMOManager.LogGameAction("video", "start", "intro", null);
			Handheld.PlayFullScreenMovie(this.intro_movie_name, Color.black, 0, 2);
			DMOManager.LogGameAction("video", "success", "intro", null);
			base.time_expired();
		}
	}

	// Token: 0x06000CB9 RID: 3257 RVA: 0x0005C75C File Offset: 0x0005A95C
	protected override void Update()
	{
		if (this.reset_ftue_button && this.reset_ftue_button.hit)
		{
			globals.FTUE_manager.done = false;
		}
		else
		{
			base.Update();
		}
	}

	// Token: 0x04000CA1 RID: 3233
	public buttonBehavior reset_ftue_button;

	// Token: 0x04000CA2 RID: 3234
	public UILabel build_version_label;

	// Token: 0x04000CA3 RID: 3235
	public SFXJukeboxBehavior sfx_jukebox;

	// Token: 0x04000CA4 RID: 3236
	public GameObject blackout;

	// Token: 0x04000CA5 RID: 3237
	public string sfx = "fanfare";

	// Token: 0x04000CA6 RID: 3238
	public string intro_movie_name = "intro_movie.mp4";
}
