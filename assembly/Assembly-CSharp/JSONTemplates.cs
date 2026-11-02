using System;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;

// Token: 0x020001CB RID: 459
public static class JSONTemplates
{
	// Token: 0x06000D8A RID: 3466 RVA: 0x000608CC File Offset: 0x0005EACC
	public static JSONObject TOJSON(object obj)
	{
		if (JSONTemplates.touched.Add(obj))
		{
			JSONObject obj2 = JSONObject.obj;
			FieldInfo[] fields = obj.GetType().GetFields();
			foreach (FieldInfo fieldInfo in fields)
			{
				JSONObject jsonobject = JSONObject.nullJO;
				if (!fieldInfo.GetValue(obj).Equals(null))
				{
					MethodInfo method = typeof(JSONTemplates).GetMethod("From" + fieldInfo.FieldType.Name);
					if (method != null)
					{
						jsonobject = (JSONObject)method.Invoke(null, new object[]
						{
							fieldInfo.GetValue(obj)
						});
					}
					else if (fieldInfo.FieldType == typeof(string))
					{
						jsonobject = JSONObject.CreateStringObject(fieldInfo.GetValue(obj).ToString());
					}
					else
					{
						jsonobject = JSONObject.Create(fieldInfo.GetValue(obj).ToString(), -2, false, false);
					}
				}
				if (jsonobject)
				{
					if (jsonobject.type != JSONObject.Type.NULL)
					{
						obj2.AddField(fieldInfo.Name, jsonobject);
					}
					else
					{
						globals.debugWarning(string.Concat(new string[]
						{
							"Null for this non-null object, property ",
							fieldInfo.Name,
							" of class ",
							obj.GetType().Name,
							". Object type is ",
							fieldInfo.FieldType.Name
						}));
					}
				}
			}
			PropertyInfo[] properties = obj.GetType().GetProperties();
			foreach (PropertyInfo propertyInfo in properties)
			{
				JSONObject jsonobject2 = JSONObject.nullJO;
				if (!propertyInfo.GetValue(obj, null).Equals(null))
				{
					MethodInfo method2 = typeof(JSONTemplates).GetMethod("From" + propertyInfo.PropertyType.Name);
					if (method2 != null)
					{
						jsonobject2 = (JSONObject)method2.Invoke(null, new object[]
						{
							propertyInfo.GetValue(obj, null)
						});
					}
					else if (propertyInfo.PropertyType == typeof(string))
					{
						jsonobject2 = JSONObject.CreateStringObject(propertyInfo.GetValue(obj, null).ToString());
					}
					else
					{
						jsonobject2 = JSONObject.Create(propertyInfo.GetValue(obj, null).ToString(), -2, false, false);
					}
				}
				if (jsonobject2)
				{
					if (jsonobject2.type != JSONObject.Type.NULL)
					{
						obj2.AddField(propertyInfo.Name, jsonobject2);
					}
					else
					{
						globals.debugWarning(string.Concat(new string[]
						{
							"Null for this non-null object, property ",
							propertyInfo.Name,
							" of class ",
							obj.GetType().Name,
							". Object type is ",
							propertyInfo.PropertyType.Name
						}));
					}
				}
			}
			return obj2;
		}
		globals.debugWarning("trying to save the same data twice");
		return JSONObject.nullJO;
	}

	// Token: 0x06000D8B RID: 3467 RVA: 0x00060BC0 File Offset: 0x0005EDC0
	public static Vector2 ToVector2(JSONObject obj)
	{
		float num = (!obj["x"]) ? 0f : obj["x"].f;
		float num2 = (!obj["y"]) ? 0f : obj["y"].f;
		return new Vector2(num, num2);
	}

	// Token: 0x06000D8C RID: 3468 RVA: 0x00060C34 File Offset: 0x0005EE34
	public static JSONObject FromVector2(Vector2 v)
	{
		JSONObject obj = JSONObject.obj;
		if (v.x != 0f)
		{
			obj.AddField("x", v.x);
		}
		if (v.y != 0f)
		{
			obj.AddField("y", v.y);
		}
		return obj;
	}

	// Token: 0x06000D8D RID: 3469 RVA: 0x00060C90 File Offset: 0x0005EE90
	public static JSONObject FromVector3(Vector3 v)
	{
		JSONObject obj = JSONObject.obj;
		if (v.x != 0f)
		{
			obj.AddField("x", v.x);
		}
		if (v.y != 0f)
		{
			obj.AddField("y", v.y);
		}
		if (v.z != 0f)
		{
			obj.AddField("z", v.z);
		}
		return obj;
	}

	// Token: 0x06000D8E RID: 3470 RVA: 0x00060D10 File Offset: 0x0005EF10
	public static Vector3 ToVector3(JSONObject obj)
	{
		float num = (!obj["x"]) ? 0f : obj["x"].f;
		float num2 = (!obj["y"]) ? 0f : obj["y"].f;
		float num3 = (!obj["z"]) ? 0f : obj["z"].f;
		return new Vector3(num, num2, num3);
	}

	// Token: 0x06000D8F RID: 3471 RVA: 0x00060DB8 File Offset: 0x0005EFB8
	public static JSONObject FromVector4(Vector4 v)
	{
		JSONObject obj = JSONObject.obj;
		if (v.x != 0f)
		{
			obj.AddField("x", v.x);
		}
		if (v.y != 0f)
		{
			obj.AddField("y", v.y);
		}
		if (v.z != 0f)
		{
			obj.AddField("z", v.z);
		}
		if (v.w != 0f)
		{
			obj.AddField("w", v.w);
		}
		return obj;
	}

	// Token: 0x06000D90 RID: 3472 RVA: 0x00060E58 File Offset: 0x0005F058
	public static Vector4 ToVector4(JSONObject obj)
	{
		float num = (!obj["x"]) ? 0f : obj["x"].f;
		float num2 = (!obj["y"]) ? 0f : obj["y"].f;
		float num3 = (!obj["z"]) ? 0f : obj["z"].f;
		float num4 = (!obj["w"]) ? 0f : obj["w"].f;
		return new Vector4(num, num2, num3, num4);
	}

	// Token: 0x06000D91 RID: 3473 RVA: 0x00060F30 File Offset: 0x0005F130
	public static JSONObject FromMatrix4x4(Matrix4x4 m)
	{
		JSONObject obj = JSONObject.obj;
		if (m.m00 != 0f)
		{
			obj.AddField("m00", m.m00);
		}
		if (m.m01 != 0f)
		{
			obj.AddField("m01", m.m01);
		}
		if (m.m02 != 0f)
		{
			obj.AddField("m02", m.m02);
		}
		if (m.m03 != 0f)
		{
			obj.AddField("m03", m.m03);
		}
		if (m.m10 != 0f)
		{
			obj.AddField("m10", m.m10);
		}
		if (m.m11 != 0f)
		{
			obj.AddField("m11", m.m11);
		}
		if (m.m12 != 0f)
		{
			obj.AddField("m12", m.m12);
		}
		if (m.m13 != 0f)
		{
			obj.AddField("m13", m.m13);
		}
		if (m.m20 != 0f)
		{
			obj.AddField("m20", m.m20);
		}
		if (m.m21 != 0f)
		{
			obj.AddField("m21", m.m21);
		}
		if (m.m22 != 0f)
		{
			obj.AddField("m22", m.m22);
		}
		if (m.m23 != 0f)
		{
			obj.AddField("m23", m.m23);
		}
		if (m.m30 != 0f)
		{
			obj.AddField("m30", m.m30);
		}
		if (m.m31 != 0f)
		{
			obj.AddField("m31", m.m31);
		}
		if (m.m32 != 0f)
		{
			obj.AddField("m32", m.m32);
		}
		if (m.m33 != 0f)
		{
			obj.AddField("m33", m.m33);
		}
		return obj;
	}

	// Token: 0x06000D92 RID: 3474 RVA: 0x00061174 File Offset: 0x0005F374
	public static Matrix4x4 ToMatrix4x4(JSONObject obj)
	{
		Matrix4x4 result = default(Matrix4x4);
		if (obj["m00"])
		{
			result.m00 = obj["m00"].f;
		}
		if (obj["m01"])
		{
			result.m01 = obj["m01"].f;
		}
		if (obj["m02"])
		{
			result.m02 = obj["m02"].f;
		}
		if (obj["m03"])
		{
			result.m03 = obj["m03"].f;
		}
		if (obj["m10"])
		{
			result.m10 = obj["m10"].f;
		}
		if (obj["m11"])
		{
			result.m11 = obj["m11"].f;
		}
		if (obj["m12"])
		{
			result.m12 = obj["m12"].f;
		}
		if (obj["m13"])
		{
			result.m13 = obj["m13"].f;
		}
		if (obj["m20"])
		{
			result.m20 = obj["m20"].f;
		}
		if (obj["m21"])
		{
			result.m21 = obj["m21"].f;
		}
		if (obj["m22"])
		{
			result.m22 = obj["m22"].f;
		}
		if (obj["m23"])
		{
			result.m23 = obj["m23"].f;
		}
		if (obj["m30"])
		{
			result.m30 = obj["m30"].f;
		}
		if (obj["m31"])
		{
			result.m31 = obj["m31"].f;
		}
		if (obj["m32"])
		{
			result.m32 = obj["m32"].f;
		}
		if (obj["m33"])
		{
			result.m33 = obj["m33"].f;
		}
		return result;
	}

	// Token: 0x06000D93 RID: 3475 RVA: 0x0006144C File Offset: 0x0005F64C
	public static JSONObject FromQuaternion(Quaternion q)
	{
		JSONObject obj = JSONObject.obj;
		if (q.w != 0f)
		{
			obj.AddField("w", q.w);
		}
		if (q.x != 0f)
		{
			obj.AddField("x", q.x);
		}
		if (q.y != 0f)
		{
			obj.AddField("y", q.y);
		}
		if (q.z != 0f)
		{
			obj.AddField("z", q.z);
		}
		return obj;
	}

	// Token: 0x06000D94 RID: 3476 RVA: 0x000614EC File Offset: 0x0005F6EC
	public static Quaternion ToQuaternion(JSONObject obj)
	{
		float num = (!obj["x"]) ? 0f : obj["x"].f;
		float num2 = (!obj["y"]) ? 0f : obj["y"].f;
		float num3 = (!obj["z"]) ? 0f : obj["z"].f;
		float num4 = (!obj["w"]) ? 0f : obj["w"].f;
		return new Quaternion(num, num2, num3, num4);
	}

	// Token: 0x06000D95 RID: 3477 RVA: 0x000615C4 File Offset: 0x0005F7C4
	public static JSONObject FromColor(Color c)
	{
		JSONObject obj = JSONObject.obj;
		if (c.r != 0f)
		{
			obj.AddField("r", c.r);
		}
		if (c.g != 0f)
		{
			obj.AddField("g", c.g);
		}
		if (c.b != 0f)
		{
			obj.AddField("b", c.b);
		}
		if (c.a != 0f)
		{
			obj.AddField("a", c.a);
		}
		return obj;
	}

	// Token: 0x06000D96 RID: 3478 RVA: 0x00061664 File Offset: 0x0005F864
	public static Color ToColor(JSONObject obj)
	{
		Color result = default(Color);
		for (int i = 0; i < obj.Count; i++)
		{
			string text = obj.keys[i];
			if (text != null)
			{
				if (JSONTemplates.<>f__switch$map6 == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(4);
					dictionary.Add("r", 0);
					dictionary.Add("g", 1);
					dictionary.Add("b", 2);
					dictionary.Add("a", 3);
					JSONTemplates.<>f__switch$map6 = dictionary;
				}
				int num;
				if (JSONTemplates.<>f__switch$map6.TryGetValue(text, ref num))
				{
					switch (num)
					{
					case 0:
						result.r = obj[i].f;
						break;
					case 1:
						result.g = obj[i].f;
						break;
					case 2:
						result.b = obj[i].f;
						break;
					case 3:
						result.a = obj[i].f;
						break;
					}
				}
			}
		}
		return result;
	}

	// Token: 0x06000D97 RID: 3479 RVA: 0x0006177C File Offset: 0x0005F97C
	public static JSONObject FromLayerMask(LayerMask l)
	{
		JSONObject obj = JSONObject.obj;
		obj.AddField("value", l.value);
		return obj;
	}

	// Token: 0x06000D98 RID: 3480 RVA: 0x000617A4 File Offset: 0x0005F9A4
	public static LayerMask ToLayerMask(JSONObject obj)
	{
		LayerMask result = default(LayerMask);
		result.value = (int)obj["value"].n;
		return result;
	}

	// Token: 0x06000D99 RID: 3481 RVA: 0x000617D8 File Offset: 0x0005F9D8
	public static JSONObject FromRect(Rect r)
	{
		JSONObject obj = JSONObject.obj;
		if (r.x != 0f)
		{
			obj.AddField("x", r.x);
		}
		if (r.y != 0f)
		{
			obj.AddField("y", r.y);
		}
		if (r.height != 0f)
		{
			obj.AddField("height", r.height);
		}
		if (r.width != 0f)
		{
			obj.AddField("width", r.width);
		}
		return obj;
	}

	// Token: 0x06000D9A RID: 3482 RVA: 0x00061878 File Offset: 0x0005FA78
	public static Rect ToRect(JSONObject obj)
	{
		Rect result = default(Rect);
		for (int i = 0; i < obj.Count; i++)
		{
			string text = obj.keys[i];
			if (text != null)
			{
				if (JSONTemplates.<>f__switch$map7 == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(4);
					dictionary.Add("x", 0);
					dictionary.Add("y", 1);
					dictionary.Add("height", 2);
					dictionary.Add("width", 3);
					JSONTemplates.<>f__switch$map7 = dictionary;
				}
				int num;
				if (JSONTemplates.<>f__switch$map7.TryGetValue(text, ref num))
				{
					switch (num)
					{
					case 0:
						result.x = obj[i].f;
						break;
					case 1:
						result.y = obj[i].f;
						break;
					case 2:
						result.height = obj[i].f;
						break;
					case 3:
						result.width = obj[i].f;
						break;
					}
				}
			}
		}
		return result;
	}

	// Token: 0x06000D9B RID: 3483 RVA: 0x00061990 File Offset: 0x0005FB90
	public static JSONObject FromRectOffset(RectOffset r)
	{
		JSONObject obj = JSONObject.obj;
		if (r.bottom != 0)
		{
			obj.AddField("bottom", r.bottom);
		}
		if (r.left != 0)
		{
			obj.AddField("left", r.left);
		}
		if (r.right != 0)
		{
			obj.AddField("right", r.right);
		}
		if (r.top != 0)
		{
			obj.AddField("top", r.top);
		}
		return obj;
	}

	// Token: 0x06000D9C RID: 3484 RVA: 0x00061A14 File Offset: 0x0005FC14
	public static RectOffset ToRectOffset(JSONObject obj)
	{
		RectOffset rectOffset = new RectOffset();
		for (int i = 0; i < obj.Count; i++)
		{
			string text = obj.keys[i];
			if (text != null)
			{
				if (JSONTemplates.<>f__switch$map8 == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(4);
					dictionary.Add("bottom", 0);
					dictionary.Add("left", 1);
					dictionary.Add("right", 2);
					dictionary.Add("top", 3);
					JSONTemplates.<>f__switch$map8 = dictionary;
				}
				int num;
				if (JSONTemplates.<>f__switch$map8.TryGetValue(text, ref num))
				{
					switch (num)
					{
					case 0:
						rectOffset.bottom = (int)obj[i].n;
						break;
					case 1:
						rectOffset.left = (int)obj[i].n;
						break;
					case 2:
						rectOffset.right = (int)obj[i].n;
						break;
					case 3:
						rectOffset.top = (int)obj[i].n;
						break;
					}
				}
			}
		}
		return rectOffset;
	}

	// Token: 0x06000D9D RID: 3485 RVA: 0x00061B28 File Offset: 0x0005FD28
	public static AnimationCurve ToAnimationCurve(JSONObject obj)
	{
		AnimationCurve animationCurve = new AnimationCurve();
		if (obj.HasField("keys"))
		{
			JSONObject field = obj.GetField("keys");
			for (int i = 0; i < field.list.Count; i++)
			{
				animationCurve.AddKey(JSONTemplates.ToKeyframe(field[i]));
			}
		}
		if (obj.HasField("preWrapMode"))
		{
			animationCurve.preWrapMode = (int)obj.GetField("preWrapMode").n;
		}
		if (obj.HasField("postWrapMode"))
		{
			animationCurve.postWrapMode = (int)obj.GetField("postWrapMode").n;
		}
		return animationCurve;
	}

	// Token: 0x06000D9E RID: 3486 RVA: 0x00061BD8 File Offset: 0x0005FDD8
	public static JSONObject FromAnimationCurve(AnimationCurve a)
	{
		JSONObject obj = JSONObject.obj;
		obj.AddField("preWrapMode", a.preWrapMode.ToString());
		obj.AddField("postWrapMode", a.postWrapMode.ToString());
		if (a.keys.Length > 0)
		{
			JSONObject jsonobject = JSONObject.Create();
			for (int i = 0; i < a.keys.Length; i++)
			{
				jsonobject.Add(JSONTemplates.FromKeyframe(a.keys[i]));
			}
			obj.AddField("keys", jsonobject);
		}
		return obj;
	}

	// Token: 0x06000D9F RID: 3487 RVA: 0x00061C78 File Offset: 0x0005FE78
	public static Keyframe ToKeyframe(JSONObject obj)
	{
		Keyframe result;
		result..ctor((!obj.HasField("time")) ? 0f : obj.GetField("time").f, (!obj.HasField("value")) ? 0f : obj.GetField("value").f);
		if (obj.HasField("inTangent"))
		{
			result.inTangent = obj.GetField("inTangent").f;
		}
		if (obj.HasField("outTangent"))
		{
			result.outTangent = obj.GetField("outTangent").f;
		}
		if (obj.HasField("tangentMode"))
		{
			result.tangentMode = (int)obj.GetField("tangentMode").f;
		}
		return result;
	}

	// Token: 0x06000DA0 RID: 3488 RVA: 0x00061D58 File Offset: 0x0005FF58
	public static JSONObject FromKeyframe(Keyframe k)
	{
		JSONObject obj = JSONObject.obj;
		if (k.inTangent != 0f)
		{
			obj.AddField("inTangent", k.inTangent);
		}
		if (k.outTangent != 0f)
		{
			obj.AddField("outTangent", k.outTangent);
		}
		if (k.tangentMode != 0)
		{
			obj.AddField("tangentMode", k.tangentMode);
		}
		if (k.time != 0f)
		{
			obj.AddField("time", k.time);
		}
		if (k.value != 0f)
		{
			obj.AddField("value", k.value);
		}
		return obj;
	}

	// Token: 0x04000D59 RID: 3417
	private static readonly HashSet<object> touched = new HashSet<object>();
}
