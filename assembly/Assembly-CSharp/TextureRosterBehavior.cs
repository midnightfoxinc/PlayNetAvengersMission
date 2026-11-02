using System;
using UnityEngine;

// Token: 0x020002FB RID: 763
public class TextureRosterBehavior : MonoBehaviour
{
	// Token: 0x06001400 RID: 5120 RVA: 0x00090170 File Offset: 0x0008E370
	private texture_roster_entry entry_for_id(string id)
	{
		if (this.textures[this._previous_result].id == id)
		{
			return this.textures[this._previous_result];
		}
		for (int i = 0; i < this.textures.Length; i++)
		{
			if (this.textures[i].id == id)
			{
				this._previous_result = i;
				return this.textures[i];
			}
		}
		globals.debugWarning("can't find an entry for location id #" + id.ToString());
		return null;
	}

	// Token: 0x06001401 RID: 5121 RVA: 0x00090200 File Offset: 0x0008E400
	public Texture texture_for_id(string id)
	{
		texture_roster_entry texture_roster_entry = this.entry_for_id(id);
		if (texture_roster_entry)
		{
			return Resources.Load<Texture>(this.texture_directory + "/" + texture_roster_entry.img);
		}
		return null;
	}

	// Token: 0x040015E4 RID: 5604
	public string texture_directory = "location bg";

	// Token: 0x040015E5 RID: 5605
	public texture_roster_entry[] textures;

	// Token: 0x040015E6 RID: 5606
	private int _previous_result;
}
