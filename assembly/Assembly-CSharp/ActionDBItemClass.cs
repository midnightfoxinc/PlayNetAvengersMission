using System;
using System.Collections.Generic;

// Token: 0x0200024A RID: 586
public class ActionDBItemClass : DBItemClass
{
	// Token: 0x06001031 RID: 4145 RVA: 0x00073094 File Offset: 0x00071294
	public ActionDBItemClass(JSONObject obj)
	{
		this.parse(obj);
		if (obj.type == JSONObject.Type.OBJECT)
		{
			for (int i = 0; i < obj.list.Count; i++)
			{
				string text = obj.keys[i];
				JSONObject jsonobject = obj.list[i];
				string text2 = text;
				if (text2 != null)
				{
					if (ActionDBItemClass.<>f__switch$map14 == null)
					{
						Dictionary<string, int> dictionary = new Dictionary<string, int>(3);
						dictionary.Add("steps", 0);
						dictionary.Add("blurb", 1);
						dictionary.Add("mola", 2);
						ActionDBItemClass.<>f__switch$map14 = dictionary;
					}
					int num;
					if (ActionDBItemClass.<>f__switch$map14.TryGetValue(text2, ref num))
					{
						switch (num)
						{
						case 0:
							this.parse_action_steps(jsonobject);
							break;
						case 1:
							this.long_name = base.scratch_tinted(jsonobject.str);
							break;
						case 2:
							if (jsonobject.IsNumber)
							{
								this.mola = ((int)jsonobject.n).ToString();
							}
							else
							{
								this.mola = jsonobject.str;
							}
							break;
						}
					}
				}
			}
		}
	}

	// Token: 0x06001032 RID: 4146 RVA: 0x000731D4 File Offset: 0x000713D4
	private void parse_action_steps(JSONObject obj)
	{
		if (obj.type == JSONObject.Type.ARRAY)
		{
			for (int i = 0; i < obj.list.Count; i++)
			{
				ActionDBItemClass.ActionStepClass actionStepClass = new ActionDBItemClass.ActionStepClass(obj.list[i], this);
				this.action_step.Add(actionStepClass);
			}
		}
		else
		{
			globals.debugWarning("action step data isn't an array");
		}
	}

	// Token: 0x04001061 RID: 4193
	public string long_name;

	// Token: 0x04001062 RID: 4194
	public string mola = string.Empty;

	// Token: 0x04001063 RID: 4195
	public List<ActionDBItemClass.ActionStepClass> action_step = new List<ActionDBItemClass.ActionStepClass>();

	// Token: 0x0200024B RID: 587
	public class ActionStepClass
	{
		// Token: 0x06001033 RID: 4147 RVA: 0x00073238 File Offset: 0x00071438
		public ActionStepClass(JSONObject obj, ActionDBItemClass action)
		{
			this.action = action;
			if (obj.type == JSONObject.Type.OBJECT)
			{
				for (int i = 0; i < obj.list.Count; i++)
				{
					string text = obj.keys[i];
					JSONObject jsonobject = obj.list[i];
					string text2 = text;
					if (text2 != null)
					{
						if (ActionDBItemClass.ActionStepClass.<>f__switch$map15 == null)
						{
							Dictionary<string, int> dictionary = new Dictionary<string, int>(2);
							dictionary.Add("image", 0);
							dictionary.Add("text", 1);
							ActionDBItemClass.ActionStepClass.<>f__switch$map15 = dictionary;
						}
						int num;
						if (ActionDBItemClass.ActionStepClass.<>f__switch$map15.TryGetValue(text2, ref num))
						{
							if (num != 0)
							{
								if (num == 1)
								{
									this.text = this.scratch_tinted(jsonobject.str);
								}
							}
							else
							{
								this.image = jsonobject.str;
							}
						}
					}
				}
			}
		}

		// Token: 0x06001034 RID: 4148 RVA: 0x00073320 File Offset: 0x00071520
		private string scratch_tinted(string s)
		{
			if (this.action)
			{
				return this.action.scratch_tinted(s);
			}
			globals.debugWarning("action step is missing action");
			return s;
		}

		// Token: 0x04001065 RID: 4197
		public string image;

		// Token: 0x04001066 RID: 4198
		public string text;

		// Token: 0x04001067 RID: 4199
		public ActionDBItemClass action;
	}
}
