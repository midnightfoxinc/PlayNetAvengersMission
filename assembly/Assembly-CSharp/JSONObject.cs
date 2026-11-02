using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using UnityEngine;

// Token: 0x020001C9 RID: 457
public class JSONObject
{
	// Token: 0x06000D35 RID: 3381 RVA: 0x0005EF7C File Offset: 0x0005D17C
	public JSONObject(JSONObject.Type t)
	{
		this.type = t;
		if (t != JSONObject.Type.OBJECT)
		{
			if (t == JSONObject.Type.ARRAY)
			{
				this.list = new List<JSONObject>();
			}
		}
		else
		{
			this.list = new List<JSONObject>();
			this.keys = new List<string>();
		}
	}

	// Token: 0x06000D36 RID: 3382 RVA: 0x0005EFD8 File Offset: 0x0005D1D8
	public JSONObject(bool b)
	{
		this.type = JSONObject.Type.BOOL;
		this.b = b;
	}

	// Token: 0x06000D37 RID: 3383 RVA: 0x0005EFF0 File Offset: 0x0005D1F0
	public JSONObject(double d)
	{
		this.type = JSONObject.Type.NUMBER;
		this.n = d;
	}

	// Token: 0x06000D38 RID: 3384 RVA: 0x0005F008 File Offset: 0x0005D208
	public JSONObject(Dictionary<string, string> dic)
	{
		this.type = JSONObject.Type.OBJECT;
		this.keys = new List<string>();
		this.list = new List<JSONObject>();
		foreach (KeyValuePair<string, string> keyValuePair in dic)
		{
			this.keys.Add(keyValuePair.Key);
			this.list.Add(JSONObject.CreateStringObject(keyValuePair.Value));
		}
	}

	// Token: 0x06000D39 RID: 3385 RVA: 0x0005F0B0 File Offset: 0x0005D2B0
	public JSONObject(Dictionary<string, JSONObject> dic)
	{
		this.type = JSONObject.Type.OBJECT;
		this.keys = new List<string>();
		this.list = new List<JSONObject>();
		foreach (KeyValuePair<string, JSONObject> keyValuePair in dic)
		{
			this.keys.Add(keyValuePair.Key);
			this.list.Add(keyValuePair.Value);
		}
	}

	// Token: 0x06000D3A RID: 3386 RVA: 0x0005F154 File Offset: 0x0005D354
	public JSONObject(JSONObject.AddJSONConents content)
	{
		content(this);
	}

	// Token: 0x06000D3B RID: 3387 RVA: 0x0005F164 File Offset: 0x0005D364
	public JSONObject(JSONObject[] objs)
	{
		this.type = JSONObject.Type.ARRAY;
		this.list = new List<JSONObject>(objs);
	}

	// Token: 0x06000D3C RID: 3388 RVA: 0x0005F180 File Offset: 0x0005D380
	public JSONObject()
	{
	}

	// Token: 0x06000D3D RID: 3389 RVA: 0x0005F188 File Offset: 0x0005D388
	public JSONObject(string str, int maxDepth = -2, bool storeExcessLevels = false, bool strict = false)
	{
		this.Parse(str, maxDepth, storeExcessLevels, strict);
	}

	// Token: 0x170001BA RID: 442
	// (get) Token: 0x06000D3F RID: 3391 RVA: 0x0005F1CC File Offset: 0x0005D3CC
	public bool isContainer
	{
		get
		{
			return this.type == JSONObject.Type.ARRAY || this.type == JSONObject.Type.OBJECT;
		}
	}

	// Token: 0x170001BB RID: 443
	// (get) Token: 0x06000D40 RID: 3392 RVA: 0x0005F1E8 File Offset: 0x0005D3E8
	public int Count
	{
		get
		{
			if (this.list == null)
			{
				return -1;
			}
			return this.list.Count;
		}
	}

	// Token: 0x170001BC RID: 444
	// (get) Token: 0x06000D41 RID: 3393 RVA: 0x0005F204 File Offset: 0x0005D404
	public float f
	{
		get
		{
			return (float)this.n;
		}
	}

	// Token: 0x170001BD RID: 445
	// (get) Token: 0x06000D42 RID: 3394 RVA: 0x0005F210 File Offset: 0x0005D410
	// (set) Token: 0x06000D43 RID: 3395 RVA: 0x0005F248 File Offset: 0x0005D448
	public bool b
	{
		get
		{
			if (this.type == JSONObject.Type.BOOL)
			{
				return this._b;
			}
			return this.type == JSONObject.Type.NUMBER && this.n != 0.0;
		}
		set
		{
			this._b = value;
		}
	}

	// Token: 0x170001BE RID: 446
	// (get) Token: 0x06000D44 RID: 3396 RVA: 0x0005F254 File Offset: 0x0005D454
	public static JSONObject nullJO
	{
		get
		{
			return JSONObject.Create(JSONObject.Type.NULL);
		}
	}

	// Token: 0x170001BF RID: 447
	// (get) Token: 0x06000D45 RID: 3397 RVA: 0x0005F25C File Offset: 0x0005D45C
	public static JSONObject obj
	{
		get
		{
			return JSONObject.Create(JSONObject.Type.OBJECT);
		}
	}

	// Token: 0x170001C0 RID: 448
	// (get) Token: 0x06000D46 RID: 3398 RVA: 0x0005F264 File Offset: 0x0005D464
	public static JSONObject arr
	{
		get
		{
			return JSONObject.Create(JSONObject.Type.ARRAY);
		}
	}

	// Token: 0x06000D47 RID: 3399 RVA: 0x0005F26C File Offset: 0x0005D46C
	public static JSONObject StringObject(string val)
	{
		return JSONObject.CreateStringObject(val);
	}

	// Token: 0x06000D48 RID: 3400 RVA: 0x0005F274 File Offset: 0x0005D474
	public void Absorb(JSONObject obj)
	{
		this.list.AddRange(obj.list);
		this.keys.AddRange(obj.keys);
		this.str = obj.str;
		this.n = obj.n;
		this.b = obj.b;
		this.type = obj.type;
	}

	// Token: 0x06000D49 RID: 3401 RVA: 0x0005F2D4 File Offset: 0x0005D4D4
	public static JSONObject Create()
	{
		return new JSONObject();
	}

	// Token: 0x06000D4A RID: 3402 RVA: 0x0005F2DC File Offset: 0x0005D4DC
	public static JSONObject Create(JSONObject.Type t)
	{
		JSONObject jsonobject = JSONObject.Create();
		jsonobject.type = t;
		if (t != JSONObject.Type.OBJECT)
		{
			if (t == JSONObject.Type.ARRAY)
			{
				jsonobject.list = new List<JSONObject>();
			}
		}
		else
		{
			jsonobject.list = new List<JSONObject>();
			jsonobject.keys = new List<string>();
		}
		return jsonobject;
	}

	// Token: 0x06000D4B RID: 3403 RVA: 0x0005F338 File Offset: 0x0005D538
	public static JSONObject Create(bool val)
	{
		JSONObject jsonobject = JSONObject.Create();
		jsonobject.type = JSONObject.Type.BOOL;
		jsonobject.b = val;
		return jsonobject;
	}

	// Token: 0x06000D4C RID: 3404 RVA: 0x0005F35C File Offset: 0x0005D55C
	public static JSONObject Create(float val)
	{
		JSONObject jsonobject = JSONObject.Create();
		jsonobject.type = JSONObject.Type.NUMBER;
		jsonobject.n = (double)val;
		return jsonobject;
	}

	// Token: 0x06000D4D RID: 3405 RVA: 0x0005F380 File Offset: 0x0005D580
	public static JSONObject Create(int val)
	{
		JSONObject jsonobject = JSONObject.Create();
		jsonobject.type = JSONObject.Type.NUMBER;
		jsonobject.n = (double)val;
		return jsonobject;
	}

	// Token: 0x06000D4E RID: 3406 RVA: 0x0005F3A4 File Offset: 0x0005D5A4
	public static JSONObject CreateStringObject(string val)
	{
		JSONObject jsonobject = JSONObject.Create();
		jsonobject.type = JSONObject.Type.STRING;
		jsonobject.str = val;
		return jsonobject;
	}

	// Token: 0x06000D4F RID: 3407 RVA: 0x0005F3C8 File Offset: 0x0005D5C8
	public static JSONObject CreateBakedObject(string val)
	{
		JSONObject jsonobject = JSONObject.Create();
		jsonobject.type = JSONObject.Type.BAKED;
		jsonobject.str = val;
		return jsonobject;
	}

	// Token: 0x06000D50 RID: 3408 RVA: 0x0005F3EC File Offset: 0x0005D5EC
	public static JSONObject Create(string val, int maxDepth = -2, bool storeExcessLevels = false, bool strict = false)
	{
		JSONObject jsonobject = JSONObject.Create();
		jsonobject.Parse(val, maxDepth, storeExcessLevels, strict);
		return jsonobject;
	}

	// Token: 0x06000D51 RID: 3409 RVA: 0x0005F40C File Offset: 0x0005D60C
	public static JSONObject Create(JSONObject.AddJSONConents content)
	{
		JSONObject jsonobject = JSONObject.Create();
		content(jsonobject);
		return jsonobject;
	}

	// Token: 0x06000D52 RID: 3410 RVA: 0x0005F428 File Offset: 0x0005D628
	public static JSONObject Create(Dictionary<string, string> dic)
	{
		JSONObject jsonobject = JSONObject.Create();
		jsonobject.type = JSONObject.Type.OBJECT;
		jsonobject.keys = new List<string>();
		jsonobject.list = new List<JSONObject>();
		foreach (KeyValuePair<string, string> keyValuePair in dic)
		{
			jsonobject.keys.Add(keyValuePair.Key);
			jsonobject.list.Add(JSONObject.CreateStringObject(keyValuePair.Value));
		}
		return jsonobject;
	}

	// Token: 0x06000D53 RID: 3411 RVA: 0x0005F4D0 File Offset: 0x0005D6D0
	private void Parse(string str, int maxDepth = -2, bool storeExcessLevels = false, bool strict = false)
	{
		if (!string.IsNullOrEmpty(str))
		{
			str = str.Trim(JSONObject.WHITESPACE);
			if (strict && str.get_Chars(0) != '[' && str.get_Chars(0) != '{')
			{
				this.type = JSONObject.Type.NULL;
				globals.debugWarning("Improper (strict) JSON formatting.  First character must be [ or {");
				return;
			}
			if (str.Length > 0)
			{
				if (string.Compare(str, "true", true) == 0)
				{
					this.type = JSONObject.Type.BOOL;
					this.b = true;
				}
				else if (string.Compare(str, "false", true) == 0)
				{
					this.type = JSONObject.Type.BOOL;
					this.b = false;
				}
				else if (string.Compare(str, "null", true) == 0)
				{
					this.type = JSONObject.Type.NULL;
				}
				else if (str == "\"INFINITY\"")
				{
					this.type = JSONObject.Type.NUMBER;
					this.n = double.PositiveInfinity;
				}
				else if (str == "\"NEGINFINITY\"")
				{
					this.type = JSONObject.Type.NUMBER;
					this.n = double.NegativeInfinity;
				}
				else if (str == "\"NaN\"")
				{
					this.type = JSONObject.Type.NUMBER;
					this.n = double.NaN;
				}
				else if (str.get_Chars(0) == '"')
				{
					this.type = JSONObject.Type.STRING;
					this.str = str.Substring(1, str.Length - 2);
				}
				else
				{
					int num = 1;
					int num2 = 0;
					char c = str.get_Chars(num2);
					if (c != '[')
					{
						if (c != '{')
						{
							try
							{
								this.n = Convert.ToDouble(str);
								this.type = JSONObject.Type.NUMBER;
							}
							catch (FormatException)
							{
								this.type = JSONObject.Type.NULL;
								globals.debugWarning("improper JSON formatting:" + str);
							}
							return;
						}
						this.type = JSONObject.Type.OBJECT;
						this.keys = new List<string>();
						this.list = new List<JSONObject>();
					}
					else
					{
						this.type = JSONObject.Type.ARRAY;
						this.list = new List<JSONObject>();
					}
					string text = string.Empty;
					bool flag = false;
					bool flag2 = false;
					int num3 = 0;
					while (++num2 < str.Length)
					{
						if (Array.IndexOf<char>(JSONObject.WHITESPACE, str.get_Chars(num2)) <= -1)
						{
							if (str.get_Chars(num2) == '\\')
							{
								num2++;
							}
							else
							{
								if (str.get_Chars(num2) == '"')
								{
									if (flag)
									{
										if (!flag2 && num3 == 0 && this.type == JSONObject.Type.OBJECT)
										{
											text = str.Substring(num + 1, num2 - num - 1);
										}
										flag = false;
									}
									else
									{
										if (num3 == 0 && this.type == JSONObject.Type.OBJECT)
										{
											num = num2;
										}
										flag = true;
									}
								}
								if (!flag)
								{
									if (this.type == JSONObject.Type.OBJECT && num3 == 0 && str.get_Chars(num2) == ':')
									{
										num = num2 + 1;
										flag2 = true;
									}
									if (str.get_Chars(num2) == '[' || str.get_Chars(num2) == '{')
									{
										num3++;
									}
									else if (str.get_Chars(num2) == ']' || str.get_Chars(num2) == '}')
									{
										num3--;
									}
									if ((str.get_Chars(num2) == ',' && num3 == 0) || num3 < 0)
									{
										flag2 = false;
										string text2 = str.Substring(num, num2 - num).Trim(JSONObject.WHITESPACE);
										if (text2.Length > 0)
										{
											if (this.type == JSONObject.Type.OBJECT)
											{
												this.keys.Add(text);
											}
											if (maxDepth != -1)
											{
												this.list.Add(JSONObject.Create(text2, (maxDepth >= -1) ? (maxDepth - 1) : -2, false, false));
											}
											else if (storeExcessLevels)
											{
												this.list.Add(JSONObject.CreateBakedObject(text2));
											}
										}
										num = num2 + 1;
									}
								}
							}
						}
					}
				}
			}
			else
			{
				this.type = JSONObject.Type.NULL;
			}
		}
		else
		{
			this.type = JSONObject.Type.NULL;
		}
	}

	// Token: 0x170001C1 RID: 449
	// (get) Token: 0x06000D54 RID: 3412 RVA: 0x0005F8E8 File Offset: 0x0005DAE8
	public bool IsNumber
	{
		get
		{
			return this.type == JSONObject.Type.NUMBER;
		}
	}

	// Token: 0x170001C2 RID: 450
	// (get) Token: 0x06000D55 RID: 3413 RVA: 0x0005F8F4 File Offset: 0x0005DAF4
	public bool IsNull
	{
		get
		{
			return this.type == JSONObject.Type.NULL;
		}
	}

	// Token: 0x170001C3 RID: 451
	// (get) Token: 0x06000D56 RID: 3414 RVA: 0x0005F900 File Offset: 0x0005DB00
	public bool IsString
	{
		get
		{
			return this.type == JSONObject.Type.STRING;
		}
	}

	// Token: 0x170001C4 RID: 452
	// (get) Token: 0x06000D57 RID: 3415 RVA: 0x0005F90C File Offset: 0x0005DB0C
	public bool IsBool
	{
		get
		{
			return this.type == JSONObject.Type.BOOL;
		}
	}

	// Token: 0x170001C5 RID: 453
	// (get) Token: 0x06000D58 RID: 3416 RVA: 0x0005F918 File Offset: 0x0005DB18
	public bool IsArray
	{
		get
		{
			return this.type == JSONObject.Type.ARRAY;
		}
	}

	// Token: 0x170001C6 RID: 454
	// (get) Token: 0x06000D59 RID: 3417 RVA: 0x0005F924 File Offset: 0x0005DB24
	public bool IsObject
	{
		get
		{
			return this.type == JSONObject.Type.OBJECT;
		}
	}

	// Token: 0x06000D5A RID: 3418 RVA: 0x0005F930 File Offset: 0x0005DB30
	public void Add(bool val)
	{
		this.Add(JSONObject.Create(val));
	}

	// Token: 0x06000D5B RID: 3419 RVA: 0x0005F940 File Offset: 0x0005DB40
	public void Add(float val)
	{
		this.Add(JSONObject.Create(val));
	}

	// Token: 0x06000D5C RID: 3420 RVA: 0x0005F950 File Offset: 0x0005DB50
	public void Add(int val)
	{
		this.Add(JSONObject.Create(val));
	}

	// Token: 0x06000D5D RID: 3421 RVA: 0x0005F960 File Offset: 0x0005DB60
	public void Add(string str)
	{
		this.Add(JSONObject.CreateStringObject(str));
	}

	// Token: 0x06000D5E RID: 3422 RVA: 0x0005F970 File Offset: 0x0005DB70
	public void Add(JSONObject.AddJSONConents content)
	{
		this.Add(JSONObject.Create(content));
	}

	// Token: 0x06000D5F RID: 3423 RVA: 0x0005F980 File Offset: 0x0005DB80
	public void Add(JSONObject obj)
	{
		if (obj)
		{
			if (this.type != JSONObject.Type.ARRAY)
			{
				this.type = JSONObject.Type.ARRAY;
				if (this.list == null)
				{
					this.list = new List<JSONObject>();
				}
			}
			this.list.Add(obj);
		}
	}

	// Token: 0x06000D60 RID: 3424 RVA: 0x0005F9D0 File Offset: 0x0005DBD0
	public void AddField(string name, bool val)
	{
		this.AddField(name, JSONObject.Create(val));
	}

	// Token: 0x06000D61 RID: 3425 RVA: 0x0005F9E0 File Offset: 0x0005DBE0
	public void AddField(string name, float val)
	{
		this.AddField(name, JSONObject.Create(val));
	}

	// Token: 0x06000D62 RID: 3426 RVA: 0x0005F9F0 File Offset: 0x0005DBF0
	public void AddField(string name, int val)
	{
		this.AddField(name, JSONObject.Create(val));
	}

	// Token: 0x06000D63 RID: 3427 RVA: 0x0005FA00 File Offset: 0x0005DC00
	public void AddField(string name, JSONObject.AddJSONConents content)
	{
		this.AddField(name, JSONObject.Create(content));
	}

	// Token: 0x06000D64 RID: 3428 RVA: 0x0005FA10 File Offset: 0x0005DC10
	public void AddField(string name, string val)
	{
		this.AddField(name, JSONObject.CreateStringObject(val));
	}

	// Token: 0x06000D65 RID: 3429 RVA: 0x0005FA20 File Offset: 0x0005DC20
	public void AddField(string name, JSONObject obj)
	{
		if (obj)
		{
			if (this.type != JSONObject.Type.OBJECT)
			{
				if (this.keys == null)
				{
					this.keys = new List<string>();
				}
				if (this.type == JSONObject.Type.ARRAY)
				{
					for (int i = 0; i < this.list.Count; i++)
					{
						this.keys.Add(i + string.Empty);
					}
				}
				else if (this.list == null)
				{
					this.list = new List<JSONObject>();
				}
				this.type = JSONObject.Type.OBJECT;
			}
			this.keys.Add(name);
			this.list.Add(obj);
		}
	}

	// Token: 0x06000D66 RID: 3430 RVA: 0x0005FAD8 File Offset: 0x0005DCD8
	public void SetField(string name, bool val)
	{
		this.SetField(name, JSONObject.Create(val));
	}

	// Token: 0x06000D67 RID: 3431 RVA: 0x0005FAE8 File Offset: 0x0005DCE8
	public void SetField(string name, float val)
	{
		this.SetField(name, JSONObject.Create(val));
	}

	// Token: 0x06000D68 RID: 3432 RVA: 0x0005FAF8 File Offset: 0x0005DCF8
	public void SetField(string name, int val)
	{
		this.SetField(name, JSONObject.Create(val));
	}

	// Token: 0x06000D69 RID: 3433 RVA: 0x0005FB08 File Offset: 0x0005DD08
	public void SetField(string name, JSONObject obj)
	{
		if (this.HasField(name))
		{
			this.list.Remove(this[name]);
			this.keys.Remove(name);
		}
		this.AddField(name, obj);
	}

	// Token: 0x06000D6A RID: 3434 RVA: 0x0005FB4C File Offset: 0x0005DD4C
	public void RemoveField(string name)
	{
		if (this.keys.IndexOf(name) > -1)
		{
			this.list.RemoveAt(this.keys.IndexOf(name));
			this.keys.Remove(name);
		}
	}

	// Token: 0x06000D6B RID: 3435 RVA: 0x0005FB90 File Offset: 0x0005DD90
	public void GetField(ref bool field, string name, JSONObject.FieldNotFound fail = null)
	{
		if (this.type == JSONObject.Type.OBJECT)
		{
			int num = this.keys.IndexOf(name);
			if (num >= 0)
			{
				field = this.list[num].b;
				return;
			}
		}
		if (fail != null)
		{
			fail(name);
		}
	}

	// Token: 0x06000D6C RID: 3436 RVA: 0x0005FBE0 File Offset: 0x0005DDE0
	public void GetField(ref double field, string name, JSONObject.FieldNotFound fail = null)
	{
		if (this.type == JSONObject.Type.OBJECT)
		{
			int num = this.keys.IndexOf(name);
			if (num >= 0)
			{
				field = this.list[num].n;
				return;
			}
		}
		if (fail != null)
		{
			fail(name);
		}
	}

	// Token: 0x06000D6D RID: 3437 RVA: 0x0005FC30 File Offset: 0x0005DE30
	public void GetField(ref int field, string name, JSONObject.FieldNotFound fail = null)
	{
		if (this.type == JSONObject.Type.OBJECT)
		{
			int num = this.keys.IndexOf(name);
			if (num >= 0)
			{
				field = (int)this.list[num].n;
				return;
			}
		}
		if (fail != null)
		{
			fail(name);
		}
	}

	// Token: 0x06000D6E RID: 3438 RVA: 0x0005FC80 File Offset: 0x0005DE80
	public void GetField(ref uint field, string name, JSONObject.FieldNotFound fail = null)
	{
		if (this.type == JSONObject.Type.OBJECT)
		{
			int num = this.keys.IndexOf(name);
			if (num >= 0)
			{
				field = (uint)this.list[num].n;
				return;
			}
		}
		if (fail != null)
		{
			fail(name);
		}
	}

	// Token: 0x06000D6F RID: 3439 RVA: 0x0005FCD0 File Offset: 0x0005DED0
	public void GetField(ref string field, string name, JSONObject.FieldNotFound fail = null)
	{
		if (this.type == JSONObject.Type.OBJECT)
		{
			int num = this.keys.IndexOf(name);
			if (num >= 0)
			{
				field = this.list[num].str;
				return;
			}
		}
		if (fail != null)
		{
			fail(name);
		}
	}

	// Token: 0x06000D70 RID: 3440 RVA: 0x0005FD20 File Offset: 0x0005DF20
	public void GetField(string name, JSONObject.GetFieldResponse response, JSONObject.FieldNotFound fail = null)
	{
		if (response != null && this.type == JSONObject.Type.OBJECT)
		{
			int num = this.keys.IndexOf(name);
			if (num >= 0)
			{
				response(this.list[num]);
				return;
			}
		}
		if (fail != null)
		{
			fail(name);
		}
	}

	// Token: 0x06000D71 RID: 3441 RVA: 0x0005FD74 File Offset: 0x0005DF74
	public JSONObject GetField(string name)
	{
		if (this.type == JSONObject.Type.OBJECT)
		{
			for (int i = 0; i < this.keys.Count; i++)
			{
				if (this.keys[i] == name)
				{
					return this.list[i];
				}
			}
		}
		return null;
	}

	// Token: 0x06000D72 RID: 3442 RVA: 0x0005FDD0 File Offset: 0x0005DFD0
	public bool HasFields(string[] names)
	{
		for (int i = 0; i < names.Length; i++)
		{
			if (!this.keys.Contains(names[i]))
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x06000D73 RID: 3443 RVA: 0x0005FE08 File Offset: 0x0005E008
	public bool HasField(string name)
	{
		if (this.type == JSONObject.Type.OBJECT)
		{
			for (int i = 0; i < this.keys.Count; i++)
			{
				if (this.keys[i] == name)
				{
					return true;
				}
			}
		}
		return false;
	}

	// Token: 0x06000D74 RID: 3444 RVA: 0x0005FE58 File Offset: 0x0005E058
	public JSONObject drill_to(params object[] field)
	{
		JSONObject jsonobject = this;
		for (int i = 0; i < field.Length; i++)
		{
			if (field[i] is string)
			{
				string text = field[i] as string;
				if (!jsonobject.HasField(text))
				{
					return null;
				}
				jsonobject = jsonobject[text];
			}
			else
			{
				if (!(field[i] is int))
				{
					return null;
				}
				int num = (int)field[i];
				if (!jsonobject.IsArray || jsonobject.Count <= num)
				{
					return null;
				}
				jsonobject = jsonobject[num];
			}
		}
		return jsonobject;
	}

	// Token: 0x06000D75 RID: 3445 RVA: 0x0005FEF8 File Offset: 0x0005E0F8
	public void Clear()
	{
		this.type = JSONObject.Type.NULL;
		if (this.list != null)
		{
			this.list.Clear();
		}
		if (this.keys != null)
		{
			this.keys.Clear();
		}
		this.str = string.Empty;
		this.n = 0.0;
		this.b = false;
	}

	// Token: 0x06000D76 RID: 3446 RVA: 0x0005FF5C File Offset: 0x0005E15C
	public JSONObject Copy()
	{
		return JSONObject.Create(this.Print(false), -2, false, false);
	}

	// Token: 0x06000D77 RID: 3447 RVA: 0x0005FF70 File Offset: 0x0005E170
	public void Merge(JSONObject obj)
	{
		JSONObject.MergeRecur(this, obj);
	}

	// Token: 0x06000D78 RID: 3448 RVA: 0x0005FF7C File Offset: 0x0005E17C
	private static void MergeRecur(JSONObject left, JSONObject right)
	{
		if (left.type == JSONObject.Type.NULL)
		{
			left.Absorb(right);
		}
		else if (left.type == JSONObject.Type.OBJECT && right.type == JSONObject.Type.OBJECT)
		{
			for (int i = 0; i < right.list.Count; i++)
			{
				string text = right.keys[i];
				if (right[i].isContainer)
				{
					if (left.HasField(text))
					{
						JSONObject.MergeRecur(left[text], right[i]);
					}
					else
					{
						left.AddField(text, right[i]);
					}
				}
				else if (left.HasField(text))
				{
					left.SetField(text, right[i]);
				}
				else
				{
					left.AddField(text, right[i]);
				}
			}
		}
		else if (left.type == JSONObject.Type.ARRAY && right.type == JSONObject.Type.ARRAY)
		{
			if (right.Count > left.Count)
			{
				globals.debugError("Cannot merge arrays when right object has more elements");
				return;
			}
			for (int j = 0; j < right.list.Count; j++)
			{
				if (left[j].type == right[j].type)
				{
					if (left[j].isContainer)
					{
						JSONObject.MergeRecur(left[j], right[j]);
					}
					else
					{
						left[j] = right[j];
					}
				}
			}
		}
	}

	// Token: 0x06000D79 RID: 3449 RVA: 0x00060100 File Offset: 0x0005E300
	public void Bake()
	{
		if (this.type != JSONObject.Type.BAKED)
		{
			this.str = this.Print(false);
			this.type = JSONObject.Type.BAKED;
		}
	}

	// Token: 0x06000D7A RID: 3450 RVA: 0x00060130 File Offset: 0x0005E330
	public IEnumerable BakeAsync()
	{
		if (this.type != JSONObject.Type.BAKED)
		{
			foreach (string s in this.PrintAsync(false))
			{
				if (s == null)
				{
					yield return s;
				}
				else
				{
					this.str = s;
				}
			}
			this.type = JSONObject.Type.BAKED;
		}
		yield break;
	}

	// Token: 0x06000D7B RID: 3451 RVA: 0x00060154 File Offset: 0x0005E354
	public void sort()
	{
		bool flag = false;
		while (!flag)
		{
			flag = true;
			for (int i = 0; i < this.keys.Count - 1; i++)
			{
				if (this.keys[i].CompareTo(this.keys[i + 1]) > 0)
				{
					string text = this.keys[i];
					this.keys[i] = this.keys[i + 1];
					this.keys[i + 1] = text;
					JSONObject jsonobject = this.list[i];
					this.list[i] = this.list[i + 1];
					this.list[i + 1] = jsonobject;
					flag = false;
				}
			}
		}
	}

	// Token: 0x06000D7C RID: 3452 RVA: 0x00060224 File Offset: 0x0005E424
	public string Print(bool pretty = false)
	{
		StringBuilder stringBuilder = new StringBuilder();
		this.Stringify(0, stringBuilder, pretty);
		return stringBuilder.ToString();
	}

	// Token: 0x06000D7D RID: 3453 RVA: 0x00060248 File Offset: 0x0005E448
	public IEnumerable<string> PrintAsync(bool pretty = false)
	{
		StringBuilder builder = new StringBuilder();
		JSONObject.printWatch.Reset();
		JSONObject.printWatch.Start();
		foreach (object obj in this.StringifyAsync(0, builder, pretty))
		{
			IEnumerable e = (IEnumerable)obj;
			yield return null;
		}
		yield return builder.ToString();
		yield break;
	}

	// Token: 0x06000D7E RID: 3454 RVA: 0x0006027C File Offset: 0x0005E47C
	private IEnumerable StringifyAsync(int depth, StringBuilder builder, bool pretty = false)
	{
		int num;
		depth = (num = depth) + 1;
		if (num > 100)
		{
			globals.debug("reached max depth!");
			yield break;
		}
		if (JSONObject.printWatch.Elapsed.TotalSeconds > 0.00800000037997961)
		{
			JSONObject.printWatch.Reset();
			yield return null;
			JSONObject.printWatch.Start();
		}
		switch (this.type)
		{
		case JSONObject.Type.NULL:
			builder.Append("null");
			break;
		case JSONObject.Type.STRING:
			builder.AppendFormat("\"{0}\"", this.str);
			break;
		case JSONObject.Type.NUMBER:
			if (double.IsInfinity(this.n))
			{
				builder.Append("\"INFINITY\"");
			}
			else if (double.IsNegativeInfinity(this.n))
			{
				builder.Append("\"NEGINFINITY\"");
			}
			else if (double.IsNaN(this.n))
			{
				builder.Append("\"NaN\"");
			}
			else
			{
				builder.Append(this.n.ToString());
			}
			break;
		case JSONObject.Type.OBJECT:
			builder.Append("{");
			if (this.list.Count > 0)
			{
				if (pretty)
				{
					builder.Append("\n");
				}
				for (int i = 0; i < this.list.Count; i++)
				{
					string key = this.keys[i];
					JSONObject obj = this.list[i];
					if (obj)
					{
						if (pretty)
						{
							for (int j = 0; j < depth; j++)
							{
								builder.Append("\t");
							}
						}
						builder.AppendFormat("\"{0}\":", key);
						foreach (object obj2 in obj.StringifyAsync(depth, builder, pretty))
						{
							IEnumerable e = (IEnumerable)obj2;
							yield return e;
						}
						builder.Append(",");
						if (pretty)
						{
							builder.Append("\n");
						}
					}
				}
				if (pretty)
				{
					builder.Length -= 2;
				}
				else
				{
					builder.Length--;
				}
			}
			if (pretty && this.list.Count > 0)
			{
				builder.Append("\n");
				for (int k = 0; k < depth - 1; k++)
				{
					builder.Append("\t");
				}
			}
			builder.Append("}");
			break;
		case JSONObject.Type.ARRAY:
			builder.Append("[");
			if (this.list.Count > 0)
			{
				if (pretty)
				{
					builder.Append("\n");
				}
				for (int l = 0; l < this.list.Count; l++)
				{
					if (this.list[l])
					{
						if (pretty)
						{
							for (int m = 0; m < depth; m++)
							{
								builder.Append("\t");
							}
						}
						foreach (object obj3 in this.list[l].StringifyAsync(depth, builder, pretty))
						{
							IEnumerable e2 = (IEnumerable)obj3;
							yield return e2;
						}
						builder.Append(",");
						if (pretty)
						{
							builder.Append("\n");
						}
					}
				}
				if (pretty)
				{
					builder.Length -= 2;
				}
				else
				{
					builder.Length--;
				}
			}
			if (pretty && this.list.Count > 0)
			{
				builder.Append("\n");
				for (int n = 0; n < depth - 1; n++)
				{
					builder.Append("\t");
				}
			}
			builder.Append("]");
			break;
		case JSONObject.Type.BOOL:
			if (this.b)
			{
				builder.Append("true");
			}
			else
			{
				builder.Append("false");
			}
			break;
		case JSONObject.Type.BAKED:
			builder.Append(this.str);
			break;
		}
		yield break;
	}

	// Token: 0x06000D7F RID: 3455 RVA: 0x000602CC File Offset: 0x0005E4CC
	private void Stringify(int depth, StringBuilder builder, bool pretty = false)
	{
		if (depth++ > 100)
		{
			globals.debug("reached max depth!");
			return;
		}
		switch (this.type)
		{
		case JSONObject.Type.NULL:
			builder.Append("null");
			break;
		case JSONObject.Type.STRING:
			builder.AppendFormat("\"{0}\"", this.str);
			break;
		case JSONObject.Type.NUMBER:
			if (double.IsInfinity(this.n))
			{
				builder.Append("\"INFINITY\"");
			}
			else if (double.IsNegativeInfinity(this.n))
			{
				builder.Append("\"NEGINFINITY\"");
			}
			else if (double.IsNaN(this.n))
			{
				builder.Append("\"NaN\"");
			}
			else
			{
				builder.Append(this.n.ToString());
			}
			break;
		case JSONObject.Type.OBJECT:
			builder.Append("{");
			if (this.list.Count > 0)
			{
				if (pretty)
				{
					builder.Append("\n");
				}
				for (int i = 0; i < this.list.Count; i++)
				{
					string text = this.keys[i];
					JSONObject jsonobject = this.list[i];
					if (jsonobject)
					{
						if (pretty)
						{
							for (int j = 0; j < depth; j++)
							{
								builder.Append("\t");
							}
						}
						builder.AppendFormat("\"{0}\":", text);
						jsonobject.Stringify(depth, builder, pretty);
						builder.Append(",");
						if (pretty)
						{
							builder.Append("\n");
						}
					}
				}
				if (pretty)
				{
					builder.Length -= 2;
				}
				else
				{
					builder.Length--;
				}
			}
			if (pretty && this.list.Count > 0)
			{
				builder.Append("\n");
				for (int k = 0; k < depth - 1; k++)
				{
					builder.Append("\t");
				}
			}
			builder.Append("}");
			break;
		case JSONObject.Type.ARRAY:
			builder.Append("[");
			if (this.list.Count > 0)
			{
				if (pretty)
				{
					builder.Append("\n");
				}
				for (int l = 0; l < this.list.Count; l++)
				{
					if (this.list[l])
					{
						if (pretty)
						{
							for (int m = 0; m < depth; m++)
							{
								builder.Append("\t");
							}
						}
						this.list[l].Stringify(depth, builder, pretty);
						builder.Append(",");
						if (pretty)
						{
							builder.Append("\n");
						}
					}
				}
				if (pretty)
				{
					builder.Length -= 2;
				}
				else
				{
					builder.Length--;
				}
			}
			if (pretty && this.list.Count > 0)
			{
				builder.Append("\n");
				for (int n = 0; n < depth - 1; n++)
				{
					builder.Append("\t");
				}
			}
			builder.Append("]");
			break;
		case JSONObject.Type.BOOL:
			if (this.b)
			{
				builder.Append("true");
			}
			else
			{
				builder.Append("false");
			}
			break;
		case JSONObject.Type.BAKED:
			builder.Append(this.str);
			break;
		}
	}

	// Token: 0x170001C7 RID: 455
	public JSONObject this[int index]
	{
		get
		{
			if (this.list.Count > index)
			{
				return this.list[index];
			}
			return null;
		}
		set
		{
			if (this.list.Count > index)
			{
				this.list[index] = value;
			}
		}
	}

	// Token: 0x170001C8 RID: 456
	public JSONObject this[string index]
	{
		get
		{
			return this.GetField(index);
		}
		set
		{
			this.SetField(index, value);
		}
	}

	// Token: 0x06000D84 RID: 3460 RVA: 0x000606E8 File Offset: 0x0005E8E8
	public override string ToString()
	{
		return this.Print(false);
	}

	// Token: 0x06000D85 RID: 3461 RVA: 0x000606F4 File Offset: 0x0005E8F4
	public string ToString(bool pretty)
	{
		return this.Print(pretty);
	}

	// Token: 0x06000D86 RID: 3462 RVA: 0x00060700 File Offset: 0x0005E900
	public Dictionary<string, string> ToDictionary()
	{
		if (this.type == JSONObject.Type.OBJECT)
		{
			Dictionary<string, string> dictionary = new Dictionary<string, string>();
			int i = 0;
			while (i < this.list.Count)
			{
				JSONObject jsonobject = this.list[i];
				switch (jsonobject.type)
				{
				case JSONObject.Type.STRING:
					dictionary.Add(this.keys[i], jsonobject.str);
					break;
				case JSONObject.Type.NUMBER:
					dictionary.Add(this.keys[i], jsonobject.n + string.Empty);
					break;
				case JSONObject.Type.OBJECT:
				case JSONObject.Type.ARRAY:
					goto IL_C3;
				case JSONObject.Type.BOOL:
					dictionary.Add(this.keys[i], jsonobject.b + string.Empty);
					break;
				default:
					goto IL_C3;
				}
				IL_E8:
				i++;
				continue;
				IL_C3:
				globals.debugWarning("Omitting object: " + this.keys[i] + " in dictionary conversion");
				goto IL_E8;
			}
			return dictionary;
		}
		globals.debugWarning("Tried to turn non-Object JSONObject into a dictionary");
		return null;
	}

	// Token: 0x06000D87 RID: 3463 RVA: 0x00060818 File Offset: 0x0005EA18
	public static implicit operator WWWForm(JSONObject obj)
	{
		WWWForm wwwform = new WWWForm();
		for (int i = 0; i < obj.list.Count; i++)
		{
			string text = i + string.Empty;
			if (obj.type == JSONObject.Type.OBJECT)
			{
				text = obj.keys[i];
			}
			string text2 = obj.list[i].ToString();
			if (obj.list[i].type == JSONObject.Type.STRING)
			{
				text2 = text2.Replace("\"", string.Empty);
			}
			wwwform.AddField(text, text2);
		}
		return wwwform;
	}

	// Token: 0x06000D88 RID: 3464 RVA: 0x000608B4 File Offset: 0x0005EAB4
	public static implicit operator bool(JSONObject o)
	{
		return o != null;
	}

	// Token: 0x04000D44 RID: 3396
	private const int MAX_DEPTH = 100;

	// Token: 0x04000D45 RID: 3397
	private const string INFINITY = "\"INFINITY\"";

	// Token: 0x04000D46 RID: 3398
	private const string NEGINFINITY = "\"NEGINFINITY\"";

	// Token: 0x04000D47 RID: 3399
	private const string NaN = "\"NaN\"";

	// Token: 0x04000D48 RID: 3400
	private const float maxFrameTime = 0.008f;

	// Token: 0x04000D49 RID: 3401
	private static readonly char[] WHITESPACE = new char[]
	{
		' ',
		'\r',
		'\n',
		'\t'
	};

	// Token: 0x04000D4A RID: 3402
	public JSONObject.Type type;

	// Token: 0x04000D4B RID: 3403
	public List<JSONObject> list;

	// Token: 0x04000D4C RID: 3404
	public List<string> keys;

	// Token: 0x04000D4D RID: 3405
	public string str;

	// Token: 0x04000D4E RID: 3406
	public double n;

	// Token: 0x04000D4F RID: 3407
	private bool _b;

	// Token: 0x04000D50 RID: 3408
	private static readonly Stopwatch printWatch = new Stopwatch();

	// Token: 0x020001CA RID: 458
	public enum Type
	{
		// Token: 0x04000D52 RID: 3410
		NULL,
		// Token: 0x04000D53 RID: 3411
		STRING,
		// Token: 0x04000D54 RID: 3412
		NUMBER,
		// Token: 0x04000D55 RID: 3413
		OBJECT,
		// Token: 0x04000D56 RID: 3414
		ARRAY,
		// Token: 0x04000D57 RID: 3415
		BOOL,
		// Token: 0x04000D58 RID: 3416
		BAKED
	}

	// Token: 0x02000361 RID: 865
	// (Invoke) Token: 0x060015A6 RID: 5542
	public delegate void AddJSONConents(JSONObject self);

	// Token: 0x02000362 RID: 866
	// (Invoke) Token: 0x060015AA RID: 5546
	public delegate void FieldNotFound(string name);

	// Token: 0x02000363 RID: 867
	// (Invoke) Token: 0x060015AE RID: 5550
	public delegate void GetFieldResponse(JSONObject obj);
}
