using System;
using UnityEngine;

// Token: 0x020001CD RID: 461
public class MovieSceneMainBehavior : MonoBehaviour
{
	// Token: 0x06000DA7 RID: 3495 RVA: 0x00061EFC File Offset: 0x000600FC
	private void Start()
	{
		Handheld.PlayFullScreenMovie(this.movie_name, Color.black, 2, 2);
		NavigationManager.load_scene(this.next_scene);
	}

	// Token: 0x04000D60 RID: 3424
	public string next_scene;

	// Token: 0x04000D61 RID: 3425
	public string movie_name;
}
