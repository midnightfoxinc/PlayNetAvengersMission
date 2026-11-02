using System;
using System.Diagnostics;
using System.Reflection;
using UnityEngine;

// Token: 0x020000E7 RID: 231
[Serializable]
public class PropertyReference
{
	// Token: 0x0600069B RID: 1691 RVA: 0x00030F58 File Offset: 0x0002F158
	public PropertyReference()
	{
	}

	// Token: 0x0600069C RID: 1692 RVA: 0x00030F60 File Offset: 0x0002F160
	public PropertyReference(Component target, string fieldName)
	{
		this.mTarget = target;
		this.mName = fieldName;
	}

	// Token: 0x17000081 RID: 129
	// (get) Token: 0x0600069E RID: 1694 RVA: 0x00030F8C File Offset: 0x0002F18C
	// (set) Token: 0x0600069F RID: 1695 RVA: 0x00030F94 File Offset: 0x0002F194
	public Component target
	{
		get
		{
			return this.mTarget;
		}
		set
		{
			this.mTarget = value;
			this.mProperty = null;
			this.mField = null;
		}
	}

	// Token: 0x17000082 RID: 130
	// (get) Token: 0x060006A0 RID: 1696 RVA: 0x00030FAC File Offset: 0x0002F1AC
	// (set) Token: 0x060006A1 RID: 1697 RVA: 0x00030FB4 File Offset: 0x0002F1B4
	public string name
	{
		get
		{
			return this.mName;
		}
		set
		{
			this.mName = value;
			this.mProperty = null;
			this.mField = null;
		}
	}

	// Token: 0x17000083 RID: 131
	// (get) Token: 0x060006A2 RID: 1698 RVA: 0x00030FCC File Offset: 0x0002F1CC
	public bool isValid
	{
		get
		{
			return this.mTarget != null && !string.IsNullOrEmpty(this.mName);
		}
	}

	// Token: 0x17000084 RID: 132
	// (get) Token: 0x060006A3 RID: 1699 RVA: 0x00030FFC File Offset: 0x0002F1FC
	public bool isEnabled
	{
		get
		{
			if (this.mTarget == null)
			{
				return false;
			}
			MonoBehaviour monoBehaviour = this.mTarget as MonoBehaviour;
			return monoBehaviour == null || monoBehaviour.enabled;
		}
	}

	// Token: 0x060006A4 RID: 1700 RVA: 0x00031040 File Offset: 0x0002F240
	public Type GetPropertyType()
	{
		if (this.mProperty == null && this.mField == null && this.isValid)
		{
			this.Cache();
		}
		if (this.mProperty != null)
		{
			return this.mProperty.PropertyType;
		}
		if (this.mField != null)
		{
			return this.mField.FieldType;
		}
		return typeof(void);
	}

	// Token: 0x060006A5 RID: 1701 RVA: 0x000310B0 File Offset: 0x0002F2B0
	public override bool Equals(object obj)
	{
		if (obj == null)
		{
			return !this.isValid;
		}
		if (obj is PropertyReference)
		{
			PropertyReference propertyReference = obj as PropertyReference;
			return this.mTarget == propertyReference.mTarget && string.Equals(this.mName, propertyReference.mName);
		}
		return false;
	}

	// Token: 0x060006A6 RID: 1702 RVA: 0x0003110C File Offset: 0x0002F30C
	public override int GetHashCode()
	{
		return PropertyReference.s_Hash;
	}

	// Token: 0x060006A7 RID: 1703 RVA: 0x00031114 File Offset: 0x0002F314
	public void Set(Component target, string methodName)
	{
		this.mTarget = target;
		this.mName = methodName;
	}

	// Token: 0x060006A8 RID: 1704 RVA: 0x00031124 File Offset: 0x0002F324
	public void Clear()
	{
		this.mTarget = null;
		this.mName = null;
	}

	// Token: 0x060006A9 RID: 1705 RVA: 0x00031134 File Offset: 0x0002F334
	public void Reset()
	{
		this.mField = null;
		this.mProperty = null;
	}

	// Token: 0x060006AA RID: 1706 RVA: 0x00031144 File Offset: 0x0002F344
	public override string ToString()
	{
		return PropertyReference.ToString(this.mTarget, this.name);
	}

	// Token: 0x060006AB RID: 1707 RVA: 0x00031158 File Offset: 0x0002F358
	public static string ToString(Component comp, string property)
	{
		if (!(comp != null))
		{
			return null;
		}
		string text = comp.GetType().ToString();
		int num = text.LastIndexOf('.');
		if (num > 0)
		{
			text = text.Substring(num + 1);
		}
		if (!string.IsNullOrEmpty(property))
		{
			return text + "." + property;
		}
		return text + ".[property]";
	}

	// Token: 0x060006AC RID: 1708 RVA: 0x000311BC File Offset: 0x0002F3BC
	[DebuggerHidden]
	[DebuggerStepThrough]
	public object Get()
	{
		if (this.mProperty == null && this.mField == null && this.isValid)
		{
			this.Cache();
		}
		if (this.mProperty != null)
		{
			if (this.mProperty.CanRead)
			{
				return this.mProperty.GetValue(this.mTarget, null);
			}
		}
		else if (this.mField != null)
		{
			return this.mField.GetValue(this.mTarget);
		}
		return null;
	}

	// Token: 0x060006AD RID: 1709 RVA: 0x00031244 File Offset: 0x0002F444
	[DebuggerStepThrough]
	[DebuggerHidden]
	public bool Set(object value)
	{
		if (this.mProperty == null && this.mField == null && this.isValid)
		{
			this.Cache();
		}
		if (this.mProperty == null && this.mField == null)
		{
			return false;
		}
		if (value == null)
		{
			try
			{
				if (this.mProperty == null)
				{
					this.mField.SetValue(this.mTarget, null);
					return true;
				}
				if (this.mProperty.CanWrite)
				{
					this.mProperty.SetValue(this.mTarget, null, null);
					return true;
				}
			}
			catch (Exception)
			{
				return false;
			}
		}
		if (!this.Convert(ref value))
		{
			if (Application.isPlaying)
			{
				Debug.LogError(string.Concat(new object[]
				{
					"Unable to convert ",
					value.GetType(),
					" to ",
					this.GetPropertyType()
				}));
			}
		}
		else
		{
			if (this.mField != null)
			{
				this.mField.SetValue(this.mTarget, value);
				return true;
			}
			if (this.mProperty.CanWrite)
			{
				this.mProperty.SetValue(this.mTarget, value, null);
				return true;
			}
		}
		return false;
	}

	// Token: 0x060006AE RID: 1710 RVA: 0x000313B0 File Offset: 0x0002F5B0
	[DebuggerHidden]
	[DebuggerStepThrough]
	private bool Cache()
	{
		if (this.mTarget != null && !string.IsNullOrEmpty(this.mName))
		{
			Type type = this.mTarget.GetType();
			this.mField = type.GetField(this.mName);
			this.mProperty = type.GetProperty(this.mName);
		}
		else
		{
			this.mField = null;
			this.mProperty = null;
		}
		return this.mField != null || this.mProperty != null;
	}

	// Token: 0x060006AF RID: 1711 RVA: 0x0003143C File Offset: 0x0002F63C
	private bool Convert(ref object value)
	{
		if (this.mTarget == null)
		{
			return false;
		}
		Type propertyType = this.GetPropertyType();
		Type from;
		if (value == null)
		{
			if (!propertyType.IsClass)
			{
				return false;
			}
			from = propertyType;
		}
		else
		{
			from = value.GetType();
		}
		return PropertyReference.Convert(ref value, from, propertyType);
	}

	// Token: 0x060006B0 RID: 1712 RVA: 0x00031490 File Offset: 0x0002F690
	public static bool Convert(Type from, Type to)
	{
		object obj = null;
		return PropertyReference.Convert(ref obj, from, to);
	}

	// Token: 0x060006B1 RID: 1713 RVA: 0x000314A8 File Offset: 0x0002F6A8
	public static bool Convert(object value, Type to)
	{
		if (value == null)
		{
			value = null;
			return PropertyReference.Convert(ref value, to, to);
		}
		return PropertyReference.Convert(ref value, value.GetType(), to);
	}

	// Token: 0x060006B2 RID: 1714 RVA: 0x000314CC File Offset: 0x0002F6CC
	public static bool Convert(ref object value, Type from, Type to)
	{
		if (to.IsAssignableFrom(from))
		{
			return true;
		}
		if (to == typeof(string))
		{
			value = ((value == null) ? "null" : value.ToString());
			return true;
		}
		if (value == null)
		{
			return false;
		}
		float num2;
		if (to == typeof(int))
		{
			if (from == typeof(string))
			{
				int num;
				if (int.TryParse((string)value, ref num))
				{
					value = num;
					return true;
				}
			}
			else if (from == typeof(float))
			{
				value = Mathf.RoundToInt((float)value);
				return true;
			}
		}
		else if (to == typeof(float) && from == typeof(string) && float.TryParse((string)value, ref num2))
		{
			value = num2;
			return true;
		}
		return false;
	}

	// Token: 0x04000668 RID: 1640
	[SerializeField]
	private Component mTarget;

	// Token: 0x04000669 RID: 1641
	[SerializeField]
	private string mName;

	// Token: 0x0400066A RID: 1642
	private FieldInfo mField;

	// Token: 0x0400066B RID: 1643
	private PropertyInfo mProperty;

	// Token: 0x0400066C RID: 1644
	private static int s_Hash = "PropertyBinding".GetHashCode();
}
