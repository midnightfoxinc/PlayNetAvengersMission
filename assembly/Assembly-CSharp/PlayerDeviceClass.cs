using System;
using System.Collections;
using System.Collections.Generic;

// Token: 0x02000235 RID: 565
public class PlayerDeviceClass : IEnumerable, IEnumerable<DLCData>
{
	// Token: 0x06000FD9 RID: 4057 RVA: 0x000707D8 File Offset: 0x0006E9D8
	public PlayerDeviceClass()
	{
	}

	// Token: 0x06000FDA RID: 4058 RVA: 0x0007082C File Offset: 0x0006EA2C
	public PlayerDeviceClass(JSONObject obj)
	{
		if (obj.HasField("id"))
		{
			this.id = (int)obj["id"].n;
		}
		if (obj.HasField("type"))
		{
			this.type = (int)obj["type"].n;
		}
		if (obj.HasField("isPrimary"))
		{
			this.isPrimary = obj["isPrimary"].b;
		}
		if (obj.HasField("isRegister"))
		{
			this.isRegister = obj["isRegister"].b;
		}
		else
		{
			this.isRegister = true;
		}
		if (obj.HasField("firmwareVersion"))
		{
			this.firmwareVersion = obj["firmwareVersion"].str;
		}
		if (obj.HasField("xp"))
		{
			this.xp = (int)obj["xp"].n;
		}
		if (obj.HasField("nickname"))
		{
			this._nickname = obj["nickname"].str;
		}
		if (obj.HasField("hide"))
		{
			this.hide = obj["hide"].b;
		}
		if (string.IsNullOrEmpty(this._nickname))
		{
			DBItemClass dbitemClass = globals.database_data.item_by_id(this.type.ToString(), true);
			if (dbitemClass)
			{
				this._nickname = dbitemClass.name;
			}
			else
			{
				this._nickname = "New Gear";
			}
		}
		if (obj.HasField("unlocks") && obj["unlocks"].IsArray)
		{
			for (int i = 0; i < obj["unlocks"].Count; i++)
			{
				this.add_unlock(obj["unlocks"][i].str);
			}
		}
		if (obj.HasField("downloadQueu") && obj["downloadQueu"].IsArray)
		{
			for (int j = 0; j < obj["downloadQueu"].Count; j++)
			{
				this.addPackageinDownloadQueu(obj["downloadQueu"][j].str);
			}
		}
		if (obj.HasField("grade"))
		{
			JSONObject jsonobject = obj["grade"];
			for (int k = 0; k < jsonobject.list.Count; k++)
			{
				this.set_grade(Convert.ToInt32(jsonobject.keys[k]), (int)jsonobject.list[k].n);
			}
		}
		if (obj.HasField("sf_rep") && obj["sf_rep"].IsArray)
		{
			for (int l = 0; l < obj["sf_rep"].Count; l++)
			{
				this._rep_data.Add(new SFRepClass(obj["sf_rep"][l]));
			}
		}
	}

	// Token: 0x06000FDB RID: 4059 RVA: 0x00070BA4 File Offset: 0x0006EDA4
	IEnumerator IEnumerable.GetEnumerator()
	{
		return this.content.GetEnumerator();
	}

	// Token: 0x170001EE RID: 494
	// (get) Token: 0x06000FDC RID: 4060 RVA: 0x00070BB8 File Offset: 0x0006EDB8
	// (set) Token: 0x06000FDD RID: 4061 RVA: 0x00070BC0 File Offset: 0x0006EDC0
	public string nickname
	{
		get
		{
			return this._nickname;
		}
		set
		{
			this._nickname = this.validate_nickname(value);
		}
	}

	// Token: 0x06000FDE RID: 4062 RVA: 0x00070BD0 File Offset: 0x0006EDD0
	private string validate_nickname(string input_string)
	{
		string text = string.Empty;
		for (int i = 0; i < input_string.Length; i++)
		{
			char c = this.validate_nickname_character(input_string.get_Chars(i));
			if (c != '\0')
			{
				text += c;
			}
		}
		return text;
	}

	// Token: 0x06000FDF RID: 4063 RVA: 0x00070C1C File Offset: 0x0006EE1C
	private char validate_nickname_character(char ch)
	{
		if (ch >= 'A' && ch <= 'Z')
		{
			return ch;
		}
		if (ch >= 'a' && ch <= 'z')
		{
			return ch;
		}
		if (ch >= '0' && ch <= '9')
		{
			return ch;
		}
		if (ch == ' ')
		{
			return ch;
		}
		return '\0';
	}

	// Token: 0x170001EF RID: 495
	// (get) Token: 0x06000FE0 RID: 4064 RVA: 0x00070C6C File Offset: 0x0006EE6C
	public List<string> unlocks
	{
		get
		{
			return this._unlocks;
		}
	}

	// Token: 0x06000FE1 RID: 4065 RVA: 0x00070C74 File Offset: 0x0006EE74
	public void add_unlock(string s)
	{
		if (!this._unlocks.Contains(s))
		{
			this._unlocks.Add(s);
		}
	}

	// Token: 0x06000FE2 RID: 4066 RVA: 0x00070C94 File Offset: 0x0006EE94
	public void clear_unlocks()
	{
		this._unlocks.Clear();
	}

	// Token: 0x06000FE3 RID: 4067 RVA: 0x00070CA4 File Offset: 0x0006EEA4
	public void set_grade(int mission, int grade)
	{
		if (this._grade.ContainsKey(mission))
		{
			if (this._grade[mission] < grade)
			{
				this._grade[mission] = grade;
			}
		}
		else
		{
			this._grade.Add(mission, grade);
		}
	}

	// Token: 0x06000FE4 RID: 4068 RVA: 0x00070CF4 File Offset: 0x0006EEF4
	public int get_grade(int mission)
	{
		if (this._grade.ContainsKey(mission))
		{
			return this._grade[mission];
		}
		return 0;
	}

	// Token: 0x06000FE5 RID: 4069 RVA: 0x00070D18 File Offset: 0x0006EF18
	public void clear_grades()
	{
		this._grade.Clear();
	}

	// Token: 0x06000FE6 RID: 4070 RVA: 0x00070D28 File Offset: 0x0006EF28
	public void clear_sf_rep()
	{
		this._rep_data.Clear();
	}

	// Token: 0x06000FE7 RID: 4071 RVA: 0x00070D38 File Offset: 0x0006EF38
	public int get_sf_rep(int sf)
	{
		return this.get_sf_rep(sf.ToString());
	}

	// Token: 0x06000FE8 RID: 4072 RVA: 0x00070D48 File Offset: 0x0006EF48
	public int get_sf_rep(string sf)
	{
		for (int i = 0; i < this._rep_data.Count; i++)
		{
			if (this._rep_data[i].sf.ToString() == sf)
			{
				return this._rep_data[i].xp;
			}
		}
		return -1;
	}

	// Token: 0x06000FE9 RID: 4073 RVA: 0x00070DA8 File Offset: 0x0006EFA8
	public int set_sf_rep(int sf, int rep)
	{
		for (int i = 0; i < this._rep_data.Count; i++)
		{
			if (this._rep_data[i].sf == sf)
			{
				int result = this._rep_data[i].xp;
				if (this._rep_data[i].xp < rep)
				{
					this._rep_data[i].xp = rep;
				}
				return result;
			}
		}
		this._rep_data.Add(new SFRepClass(sf, rep));
		return 0;
	}

	// Token: 0x06000FEA RID: 4074 RVA: 0x00070E38 File Offset: 0x0006F038
	public int sf_rep_count()
	{
		return this._rep_data.Count;
	}

	// Token: 0x06000FEB RID: 4075 RVA: 0x00070E48 File Offset: 0x0006F048
	public JSONObject sf_rep_for_toy()
	{
		JSONObject jsonobject = new JSONObject(JSONObject.Type.ARRAY);
		for (int i = 0; i < this._rep_data.Count; i++)
		{
			JSONObject jsonobject2 = new JSONObject();
			jsonobject2.AddField("id", this._rep_data[i].sf);
			jsonobject2.AddField("xp", this._rep_data[i].xp);
			jsonobject.Add(jsonobject2);
		}
		return jsonobject;
	}

	// Token: 0x06000FEC RID: 4076 RVA: 0x00070EC0 File Offset: 0x0006F0C0
	public void sf_rep_from_toy(JSONObject obj)
	{
		Dictionary<int, int> dictionary = new Dictionary<int, int>();
		for (int i = 0; i < this._rep_data.Count; i++)
		{
			int num = globals.sf_level_from_xp(this._rep_data[i].xp);
			dictionary.Add(this._rep_data[i].sf, num);
		}
		for (int j = 0; j < obj.list.Count; j++)
		{
			string text = obj.keys[j];
			JSONObject jsonobject = obj.list[j];
			if (text.Substring(0, 2) == "sf")
			{
				int num2 = int.Parse(text.Substring(2));
				SFDBItemClass sfdbitemClass = globals.database_data.item_by_id(num2.ToString(), true) as SFDBItemClass;
				if (sfdbitemClass)
				{
					int num3 = this.set_sf_rep(num2, (int)jsonobject.n);
					int num4 = globals.sf_level_from_xp((int)jsonobject.n);
					if (num3 < (int)jsonobject.n)
					{
						globals.add_new_sf_rep(new SFRepClass(num2, (int)jsonobject.n, num3), !dictionary.ContainsKey(num2) || dictionary[num2] < num4);
					}
					string textdump_string = globals.textdump_string;
					globals.textdump_string = string.Concat(new string[]
					{
						textdump_string,
						"REP: ",
						sfdbitemClass.name,
						" = ",
						jsonobject.n.ToString(),
						"xp = level ",
						num4.ToString(),
						"\n"
					});
				}
			}
		}
	}

	// Token: 0x06000FED RID: 4077 RVA: 0x00071064 File Offset: 0x0006F264
	public void setPrimary(bool primaryFlag)
	{
		this.isPrimary = primaryFlag;
	}

	// Token: 0x06000FEE RID: 4078 RVA: 0x00071070 File Offset: 0x0006F270
	public void setFirmwareVersion(string firmwareId)
	{
		this.firmwareVersion = firmwareId;
	}

	// Token: 0x06000FEF RID: 4079 RVA: 0x0007107C File Offset: 0x0006F27C
	public void addPackageinDownloadQueu(string contentId)
	{
		if (!this.downloadQueu.Contains(contentId))
		{
			this.downloadQueu.Add(contentId);
		}
	}

	// Token: 0x06000FF0 RID: 4080 RVA: 0x0007109C File Offset: 0x0006F29C
	public void removePackagefromDownloadQueu(string contentId)
	{
		if (this.downloadQueu.Contains(contentId))
		{
			this.downloadQueu.Remove(contentId);
		}
	}

	// Token: 0x06000FF1 RID: 4081 RVA: 0x000710BC File Offset: 0x0006F2BC
	public void addContent(string contentId)
	{
		if (!this.isAdded(contentId))
		{
			DLCData dlcdata = new DLCData();
			dlcdata.missionId = contentId;
			dlcdata.isPlayed = false;
			this.content.Add(dlcdata);
		}
	}

	// Token: 0x06000FF2 RID: 4082 RVA: 0x000710F8 File Offset: 0x0006F2F8
	public bool removeContent(string contentId)
	{
		bool result = false;
		for (int i = 0; i < this.content.Count; i++)
		{
			DLCData dlcdata = this.content[i];
			if (dlcdata != null && dlcdata.missionId == contentId)
			{
				this.content.Remove(dlcdata);
				result = true;
				i--;
			}
		}
		return result;
	}

	// Token: 0x06000FF3 RID: 4083 RVA: 0x0007115C File Offset: 0x0006F35C
	public bool isAdded(string contentId)
	{
		bool result = false;
		foreach (DLCData dlcdata in this.content)
		{
			if (dlcdata.missionId == contentId)
			{
				result = true;
			}
		}
		return result;
	}

	// Token: 0x06000FF4 RID: 4084 RVA: 0x000711D4 File Offset: 0x0006F3D4
	public IEnumerator<DLCData> GetEnumerator()
	{
		return this.content.GetEnumerator();
	}

	// Token: 0x06000FF5 RID: 4085 RVA: 0x000711E8 File Offset: 0x0006F3E8
	public void reconcile(PlayerDeviceClass other_data)
	{
		this.xp = ((other_data.xp <= this.xp) ? this.xp : other_data.xp);
		for (int i = 0; i < other_data.unlocks.Count; i++)
		{
			this.add_unlock(other_data.unlocks[i]);
		}
		foreach (KeyValuePair<int, int> keyValuePair in other_data._grade)
		{
			this.set_grade(keyValuePair.Key, keyValuePair.Value);
		}
		for (int j = 0; j < other_data._rep_data.Count; j++)
		{
			this.set_sf_rep(other_data._rep_data[j].sf, other_data._rep_data[j].xp);
		}
	}

	// Token: 0x06000FF6 RID: 4086 RVA: 0x000712F8 File Offset: 0x0006F4F8
	public JSONObject to_json()
	{
		JSONObject jsonobject = new JSONObject();
		jsonobject.AddField("id", this.id);
		jsonobject.AddField("type", this.type);
		jsonobject.AddField("isPrimary", this.isPrimary);
		jsonobject.AddField("firmwareVersion", this.firmwareVersion);
		jsonobject.AddField("xp", this.xp);
		jsonobject.AddField("nickname", this._nickname);
		jsonobject.AddField("hide", this.hide);
		jsonobject.AddField("isRegister", this.isRegister);
		JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
		for (int i = 0; i < this._unlocks.Count; i++)
		{
			jsonobject2.Add(this._unlocks[i]);
		}
		jsonobject.AddField("unlocks", jsonobject2);
		JSONObject jsonobject3 = new JSONObject(JSONObject.Type.ARRAY);
		for (int j = 0; j < this.downloadQueu.Count; j++)
		{
			jsonobject3.Add(this.downloadQueu[j]);
		}
		jsonobject.AddField("downloadQueu", jsonobject3);
		JSONObject jsonobject4 = new JSONObject(JSONObject.Type.ARRAY);
		foreach (KeyValuePair<int, int> keyValuePair in this._grade)
		{
			jsonobject4.AddField(keyValuePair.Key.ToString(), keyValuePair.Value);
		}
		jsonobject.AddField("grade", jsonobject4);
		JSONObject jsonobject5 = new JSONObject(JSONObject.Type.ARRAY);
		for (int k = 0; k < this._rep_data.Count; k++)
		{
			jsonobject5.Add(this._rep_data[k].to_json());
		}
		jsonobject.AddField("sf_rep", jsonobject5);
		return jsonobject;
	}

	// Token: 0x06000FF7 RID: 4087 RVA: 0x000714F4 File Offset: 0x0006F6F4
	public static implicit operator bool(PlayerDeviceClass d)
	{
		return d != null;
	}

	// Token: 0x04000FE7 RID: 4071
	public int type;

	// Token: 0x04000FE8 RID: 4072
	public int id;

	// Token: 0x04000FE9 RID: 4073
	public bool isPrimary;

	// Token: 0x04000FEA RID: 4074
	public string firmwareVersion;

	// Token: 0x04000FEB RID: 4075
	public int xp;

	// Token: 0x04000FEC RID: 4076
	public bool hide;

	// Token: 0x04000FED RID: 4077
	public bool isRegister = true;

	// Token: 0x04000FEE RID: 4078
	public List<string> downloadQueu = new List<string>();

	// Token: 0x04000FEF RID: 4079
	public List<DLCData> content = new List<DLCData>();

	// Token: 0x04000FF0 RID: 4080
	private string _nickname;

	// Token: 0x04000FF1 RID: 4081
	private List<string> _unlocks = new List<string>();

	// Token: 0x04000FF2 RID: 4082
	private Dictionary<int, int> _grade = new Dictionary<int, int>();

	// Token: 0x04000FF3 RID: 4083
	private List<SFRepClass> _rep_data = new List<SFRepClass>();
}
