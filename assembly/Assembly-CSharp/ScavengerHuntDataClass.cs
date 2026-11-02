using System;
using System.Collections.Generic;

// Token: 0x0200023D RID: 573
public class ScavengerHuntDataClass
{
	// Token: 0x06001009 RID: 4105 RVA: 0x00071CC0 File Offset: 0x0006FEC0
	public ScavengerHuntDataClass(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.OBJECT)
		{
			for (int i = 0; i < obj.list.Count; i++)
			{
				string text = obj.keys[i];
				JSONObject jsonobject = obj.list[i];
				string text2 = text;
				if (text2 != null)
				{
					if (ScavengerHuntDataClass.<>f__switch$mapE == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(6);
						dictionary.Add("id", 0);
						dictionary.Add("num_times", 1);
						dictionary.Add("icon", 2);
						dictionary.Add("description", 3);
						dictionary.Add("type", 4);
						dictionary.Add("specifics", 5);
						ScavengerHuntDataClass.<>f__switch$mapE = dictionary;
					}
					int num;
					if (ScavengerHuntDataClass.<>f__switch$mapE.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.id = (int)jsonobject.n;
							break;
						case 1:
							this.num_times = (int)jsonobject.n;
							break;
						case 2:
							this.icon = jsonobject.str;
							break;
						case 3:
							this.description = jsonobject.str;
							break;
						case 4:
							this.set_type(jsonobject.str);
							break;
						case 5:
							if (jsonobject.IsString)
							{
								this.specifics = new List<string>(jsonobject.str.Split(new char[]
								{
									'|'
								}));
							}
							else
							{
								globals.debugWarning("bad specifics: " + jsonobject.ToString());
							}
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x0600100A RID: 4106 RVA: 0x00071E68 File Offset: 0x00070068
	private void set_type(string t)
	{
		for (int i = 0; i < Enum.GetNames(typeof(scavenger_hunt_types)).Length; i++)
		{
			if (((scavenger_hunt_types)i).ToString() == t)
			{
				this.type = (scavenger_hunt_types)i;
				return;
			}
		}
	}

	// Token: 0x170001F0 RID: 496
	// (get) Token: 0x0600100B RID: 4107 RVA: 0x00071EB8 File Offset: 0x000700B8
	public bool done
	{
		get
		{
			return globals.player_data.get_scavenger_hunt_data(this.id) >= this.num_times || globals.player_data.get_scavenger_hunt_data(this.id) == -1;
		}
	}

	// Token: 0x170001F1 RID: 497
	// (get) Token: 0x0600100C RID: 4108 RVA: 0x00071EF8 File Offset: 0x000700F8
	public bool acknowledged
	{
		get
		{
			return globals.player_data.get_scavenger_hunt_data(this.id) == -1;
		}
	}

	// Token: 0x0600100D RID: 4109 RVA: 0x00071F10 File Offset: 0x00070110
	public bool did_action(int count = 1)
	{
		if (this.done)
		{
			return false;
		}
		globals.player_data.set_scavenger_hunt_data(this.id, globals.player_data.get_scavenger_hunt_data(this.id) + count);
		return this.done;
	}

	// Token: 0x04001013 RID: 4115
	public int id;

	// Token: 0x04001014 RID: 4116
	public scavenger_hunt_types type;

	// Token: 0x04001015 RID: 4117
	public int num_times;

	// Token: 0x04001016 RID: 4118
	public List<string> specifics = new List<string>();

	// Token: 0x04001017 RID: 4119
	public string description;

	// Token: 0x04001018 RID: 4120
	public string icon;
}
