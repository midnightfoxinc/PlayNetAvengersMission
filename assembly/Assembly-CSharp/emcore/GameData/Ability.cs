using System;
using System.Collections.Generic;
using UnityEngine;

namespace emcore.GameData
{
	// Token: 0x02000269 RID: 617
	public class Ability
	{
		// Token: 0x060010B1 RID: 4273 RVA: 0x000769A4 File Offset: 0x00074BA4
		public static Dictionary<int, Ability> fromJSON(JSONObject j)
		{
			Dictionary<int, Ability> dictionary = new Dictionary<int, Ability>();
			JSONObject jsonobject = j["abilities"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					Ability ability = new Ability();
					ability.id = (int)jsonobject2["id"].n;
					ability.trackId = ((!jsonobject2.HasField("track")) ? 0 : ((int)jsonobject2["track"].n));
					ability.name = jsonobject2["name"].str;
					ability.toyid = ((!jsonobject2.HasField("toyid")) ? string.Empty : jsonobject2["toyid"].str);
					ability.icon = jsonobject2["icon"].str;
					ability.type = ((!"WEAPON".Equals(jsonobject2["type"].str)) ? AbilityType.ARMOR : AbilityType.WEAPON);
					ability.desc = jsonobject2["desc"].str;
					ability.detl = jsonobject2["detl"].str;
					ability.power = (int)jsonobject2["power"].n;
					ability.speed = (int)jsonobject2["speed"].n;
					ability.energy = (int)jsonobject2["energy"].n;
					ability.armloc = ((!jsonobject2.HasField("armloc")) ? 0 : ((int)jsonobject2["armloc"].n));
					ability.premium = (jsonobject2.HasField("premium") && jsonobject2["premium"].b);
					ability.unlock = ((!jsonobject2.HasField("unlock")) ? null : jsonobject2["unlock"].str);
					ability.isCustom = (ability.id > Constants.CUSTOM_ABILITY_OFFSET);
					if (ability.isCustom)
					{
						ability.core = (int)jsonobject2["core"].n;
						ability.behavior = (int)jsonobject2["behavior"].n;
						ability.nameid1 = (int)jsonobject2["nameid1"].n;
						ability.nameid2 = (int)jsonobject2["nameid2"].n;
						ability.nameid3 = (int)jsonobject2["nameid3"].n;
						ability.lightPattern = (int)jsonobject2["lightPattern"].n;
						ability.lightColor1 = new Color(jsonobject2["color1r"].f, jsonobject2["color1g"].f, jsonobject2["color1b"].f, jsonobject2["color1a"].f);
						ability.lightColor2 = new Color(jsonobject2["color2r"].f, jsonobject2["color2g"].f, jsonobject2["color2b"].f, jsonobject2["color2a"].f);
					}
					dictionary.Add(ability.id, ability);
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return dictionary;
		}

		// Token: 0x060010B2 RID: 4274 RVA: 0x00076D70 File Offset: 0x00074F70
		public static JSONObject toJSON(Dictionary<int, Ability> abilities)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("abilities", jsonobject2);
			foreach (KeyValuePair<int, Ability> keyValuePair in abilities)
			{
				Ability value = keyValuePair.Value;
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("id", value.id);
				if (value.trackId != 0)
				{
					jsonobject3.AddField("track", value.trackId);
				}
				jsonobject3.AddField("name", value.name);
				jsonobject3.AddField("toyid", value.toyid);
				jsonobject3.AddField("icon", value.icon);
				jsonobject3.AddField("type", (value.type != AbilityType.WEAPON) ? "ARMOR" : "WEAPON");
				jsonobject3.AddField("desc", value.desc);
				jsonobject3.AddField("detl", value.detl);
				jsonobject3.AddField("power", value.power);
				jsonobject3.AddField("speed", value.speed);
				jsonobject3.AddField("energy", value.energy);
				jsonobject3.AddField("armloc", value.armloc);
				jsonobject3.AddField("premium", value.premium);
				if (value.unlock != null)
				{
					jsonobject3.AddField("unlock", value.unlock);
				}
				if (value.isCustom)
				{
					jsonobject3.AddField("core", value.core);
					jsonobject3.AddField("behavior", value.behavior);
					jsonobject3.AddField("nameid1", value.nameid1);
					jsonobject3.AddField("nameid2", value.nameid2);
					jsonobject3.AddField("nameid3", value.nameid3);
					jsonobject3.AddField("lightPattern", value.lightPattern);
					jsonobject3.AddField("color1r", value.lightColor1.r);
					jsonobject3.AddField("color1g", value.lightColor1.g);
					jsonobject3.AddField("color1b", value.lightColor1.b);
					jsonobject3.AddField("color1a", value.lightColor1.a);
					jsonobject3.AddField("color2r", value.lightColor2.r);
					jsonobject3.AddField("color2g", value.lightColor2.g);
					jsonobject3.AddField("color2b", value.lightColor2.b);
					jsonobject3.AddField("color2a", value.lightColor2.a);
				}
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x060010B3 RID: 4275 RVA: 0x00077074 File Offset: 0x00075274
		public JSONObject toJSONForToy(int armLocation = -1)
		{
			if (armLocation == -1)
			{
				armLocation = this.armloc;
			}
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			jsonobject.AddField("custom", this.isCustom);
			jsonobject.AddField("toyid", this.toyid);
			jsonobject.AddField("armLoc", armLocation);
			if (this.isCustom)
			{
				jsonobject.AddField("id", this.id);
				jsonobject.AddField("core", this.core);
				jsonobject.AddField("behavior", this.behavior);
				jsonobject.AddField("lightPattern", this.lightPattern);
				jsonobject.AddField("nameid1", this.nameid1);
				jsonobject.AddField("nameid2", this.nameid2);
				jsonobject.AddField("nameid3", this.nameid3);
				JSONObject jsonobject2 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject2.AddField("r", (int)(this.lightColor1.r * 255f));
				jsonobject2.AddField("g", (int)(this.lightColor1.g * 255f));
				jsonobject2.AddField("b", (int)(this.lightColor1.b * 255f));
				jsonobject2.AddField("a", (int)(this.lightColor1.a * 255f));
				jsonobject.AddField("lightColor1", jsonobject2);
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("r", (int)(this.lightColor2.r * 255f));
				jsonobject3.AddField("g", (int)(this.lightColor2.g * 255f));
				jsonobject3.AddField("b", (int)(this.lightColor2.b * 255f));
				jsonobject3.AddField("a", (int)(this.lightColor2.a * 255f));
				jsonobject.AddField("lightColor2", jsonobject3);
				jsonobject.AddField("power", this.power);
				jsonobject.AddField("speed", this.speed);
				jsonobject.AddField("energy", this.energy);
			}
			return jsonobject;
		}

		// Token: 0x060010B4 RID: 4276 RVA: 0x0007728C File Offset: 0x0007548C
		public static Ability fromJSONFromToy(JSONObject json)
		{
			Ability ability = new Ability();
			ability.isCustom = json["custom"].b;
			ability.toyid = json["toyid"].str;
			ability.armloc = (int)json["armLoc"].n;
			if (ability.isCustom || ability.toyid == "custom")
			{
				ability.id = (int)json["id"].n;
				ability.core = (int)json["core"].n;
				ability.behavior = (int)json["behavior"].n;
				ability.lightPattern = (int)json["lightPattern"].n;
				ability.nameid1 = (int)json["nameid1"].n;
				ability.nameid2 = (int)json["nameid2"].n;
				ability.nameid3 = (int)json["nameid3"].n;
				JSONObject jsonobject = json["lightColor1"];
				ability.lightColor1 = new Color(jsonobject["r"].f / 255f, jsonobject["g"].f / 255f, jsonobject["b"].f / 255f);
				JSONObject jsonobject2 = json["lightColor2"];
				ability.lightColor2 = new Color(jsonobject2["r"].f / 255f, jsonobject2["g"].f / 255f, jsonobject2["b"].f / 255f);
				ability.power = (int)json["power"].n;
				ability.speed = (int)json["speed"].n;
				ability.energy = (int)json["energy"].n;
			}
			return ability;
		}

		// Token: 0x040010FE RID: 4350
		public int id;

		// Token: 0x040010FF RID: 4351
		public int trackId;

		// Token: 0x04001100 RID: 4352
		public string name;

		// Token: 0x04001101 RID: 4353
		public string toyid;

		// Token: 0x04001102 RID: 4354
		public string icon;

		// Token: 0x04001103 RID: 4355
		public AbilityType type;

		// Token: 0x04001104 RID: 4356
		public string desc;

		// Token: 0x04001105 RID: 4357
		public string detl;

		// Token: 0x04001106 RID: 4358
		public int power;

		// Token: 0x04001107 RID: 4359
		public int speed;

		// Token: 0x04001108 RID: 4360
		public int energy;

		// Token: 0x04001109 RID: 4361
		public int armloc;

		// Token: 0x0400110A RID: 4362
		public bool premium;

		// Token: 0x0400110B RID: 4363
		public string unlock;

		// Token: 0x0400110C RID: 4364
		public bool isCustom;

		// Token: 0x0400110D RID: 4365
		public int core;

		// Token: 0x0400110E RID: 4366
		public int behavior;

		// Token: 0x0400110F RID: 4367
		public int lightPattern;

		// Token: 0x04001110 RID: 4368
		public int nameid1;

		// Token: 0x04001111 RID: 4369
		public int nameid2;

		// Token: 0x04001112 RID: 4370
		public int nameid3;

		// Token: 0x04001113 RID: 4371
		public Color lightColor1;

		// Token: 0x04001114 RID: 4372
		public Color lightColor2;
	}
}
