using System;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;

// Token: 0x020000DA RID: 218
[Serializable]
public class EventDelegate
{
	// Token: 0x06000590 RID: 1424 RVA: 0x00025C54 File Offset: 0x00023E54
	public EventDelegate()
	{
	}

	// Token: 0x06000591 RID: 1425 RVA: 0x00025C5C File Offset: 0x00023E5C
	public EventDelegate(EventDelegate.Callback call)
	{
		this.Set(call);
	}

	// Token: 0x06000592 RID: 1426 RVA: 0x00025C6C File Offset: 0x00023E6C
	public EventDelegate(MonoBehaviour target, string methodName)
	{
		this.Set(target, methodName);
	}

	// Token: 0x17000071 RID: 113
	// (get) Token: 0x06000594 RID: 1428 RVA: 0x00025C90 File Offset: 0x00023E90
	// (set) Token: 0x06000595 RID: 1429 RVA: 0x00025C98 File Offset: 0x00023E98
	public MonoBehaviour target
	{
		get
		{
			return this.mTarget;
		}
		set
		{
			this.mTarget = value;
			this.mCachedCallback = null;
			this.mRawDelegate = false;
			this.mCached = false;
			this.mMethod = null;
			this.mParameterInfos = null;
			this.mParameters = null;
		}
	}

	// Token: 0x17000072 RID: 114
	// (get) Token: 0x06000596 RID: 1430 RVA: 0x00025CCC File Offset: 0x00023ECC
	// (set) Token: 0x06000597 RID: 1431 RVA: 0x00025CD4 File Offset: 0x00023ED4
	public string methodName
	{
		get
		{
			return this.mMethodName;
		}
		set
		{
			this.mMethodName = value;
			this.mCachedCallback = null;
			this.mRawDelegate = false;
			this.mCached = false;
			this.mMethod = null;
			this.mParameterInfos = null;
			this.mParameters = null;
		}
	}

	// Token: 0x17000073 RID: 115
	// (get) Token: 0x06000598 RID: 1432 RVA: 0x00025D08 File Offset: 0x00023F08
	public EventDelegate.Parameter[] parameters
	{
		get
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			return this.mParameters;
		}
	}

	// Token: 0x17000074 RID: 116
	// (get) Token: 0x06000599 RID: 1433 RVA: 0x00025D24 File Offset: 0x00023F24
	public bool isValid
	{
		get
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			return (this.mRawDelegate && this.mCachedCallback != null) || (this.mTarget != null && !string.IsNullOrEmpty(this.mMethodName));
		}
	}

	// Token: 0x17000075 RID: 117
	// (get) Token: 0x0600059A RID: 1434 RVA: 0x00025D80 File Offset: 0x00023F80
	public bool isEnabled
	{
		get
		{
			if (!this.mCached)
			{
				this.Cache();
			}
			if (this.mRawDelegate && this.mCachedCallback != null)
			{
				return true;
			}
			if (this.mTarget == null)
			{
				return false;
			}
			MonoBehaviour monoBehaviour = this.mTarget;
			return monoBehaviour == null || monoBehaviour.enabled;
		}
	}

	// Token: 0x0600059B RID: 1435 RVA: 0x00025DE8 File Offset: 0x00023FE8
	private static string GetMethodName(EventDelegate.Callback callback)
	{
		return callback.Method.Name;
	}

	// Token: 0x0600059C RID: 1436 RVA: 0x00025DF8 File Offset: 0x00023FF8
	private static bool IsValid(EventDelegate.Callback callback)
	{
		return callback != null && callback.Method != null;
	}

	// Token: 0x0600059D RID: 1437 RVA: 0x00025E10 File Offset: 0x00024010
	public override bool Equals(object obj)
	{
		if (obj == null)
		{
			return !this.isValid;
		}
		if (obj is EventDelegate.Callback)
		{
			EventDelegate.Callback callback = obj as EventDelegate.Callback;
			if (callback.Equals(this.mCachedCallback))
			{
				return true;
			}
			MonoBehaviour monoBehaviour = callback.Target as MonoBehaviour;
			return this.mTarget == monoBehaviour && string.Equals(this.mMethodName, EventDelegate.GetMethodName(callback));
		}
		else
		{
			if (obj is EventDelegate)
			{
				EventDelegate eventDelegate = obj as EventDelegate;
				return this.mTarget == eventDelegate.mTarget && string.Equals(this.mMethodName, eventDelegate.mMethodName);
			}
			return false;
		}
	}

	// Token: 0x0600059E RID: 1438 RVA: 0x00025EC4 File Offset: 0x000240C4
	public override int GetHashCode()
	{
		return EventDelegate.s_Hash;
	}

	// Token: 0x0600059F RID: 1439 RVA: 0x00025ECC File Offset: 0x000240CC
	private void Set(EventDelegate.Callback call)
	{
		this.Clear();
		if (call != null && EventDelegate.IsValid(call))
		{
			this.mTarget = (call.Target as MonoBehaviour);
			if (this.mTarget == null)
			{
				this.mRawDelegate = true;
				this.mCachedCallback = call;
				this.mMethodName = null;
			}
			else
			{
				this.mMethodName = EventDelegate.GetMethodName(call);
				this.mRawDelegate = false;
			}
		}
	}

	// Token: 0x060005A0 RID: 1440 RVA: 0x00025F40 File Offset: 0x00024140
	public void Set(MonoBehaviour target, string methodName)
	{
		this.Clear();
		this.mTarget = target;
		this.mMethodName = methodName;
	}

	// Token: 0x060005A1 RID: 1441 RVA: 0x00025F58 File Offset: 0x00024158
	private void Cache()
	{
		this.mCached = true;
		if (this.mRawDelegate)
		{
			return;
		}
		if ((this.mCachedCallback == null || this.mCachedCallback.Target as MonoBehaviour != this.mTarget || EventDelegate.GetMethodName(this.mCachedCallback) != this.mMethodName) && this.mTarget != null && !string.IsNullOrEmpty(this.mMethodName))
		{
			Type type = this.mTarget.GetType();
			this.mMethod = null;
			while (type != null)
			{
				try
				{
					this.mMethod = type.GetMethod(this.mMethodName, 52);
					if (this.mMethod != null)
					{
						break;
					}
				}
				catch (Exception)
				{
				}
				type = type.BaseType;
			}
			if (this.mMethod == null)
			{
				Debug.LogError(string.Concat(new object[]
				{
					"Could not find method '",
					this.mMethodName,
					"' on ",
					this.mTarget.GetType()
				}), this.mTarget);
				return;
			}
			if (this.mMethod.ReturnType != typeof(void))
			{
				Debug.LogError(string.Concat(new object[]
				{
					this.mTarget.GetType(),
					".",
					this.mMethodName,
					" must have a 'void' return type."
				}), this.mTarget);
				return;
			}
			this.mParameterInfos = this.mMethod.GetParameters();
			if (this.mParameterInfos.Length == 0)
			{
				this.mCachedCallback = (EventDelegate.Callback)Delegate.CreateDelegate(typeof(EventDelegate.Callback), this.mTarget, this.mMethodName);
				this.mArgs = null;
				this.mParameters = null;
				return;
			}
			this.mCachedCallback = null;
			if (this.mParameters == null || this.mParameters.Length != this.mParameterInfos.Length)
			{
				this.mParameters = new EventDelegate.Parameter[this.mParameterInfos.Length];
				int i = 0;
				int num = this.mParameters.Length;
				while (i < num)
				{
					this.mParameters[i] = new EventDelegate.Parameter();
					i++;
				}
			}
			int j = 0;
			int num2 = this.mParameters.Length;
			while (j < num2)
			{
				this.mParameters[j].expectedType = this.mParameterInfos[j].ParameterType;
				j++;
			}
		}
	}

	// Token: 0x060005A2 RID: 1442 RVA: 0x000261DC File Offset: 0x000243DC
	public bool Execute()
	{
		if (!this.mCached)
		{
			this.Cache();
		}
		if (this.mCachedCallback != null)
		{
			this.mCachedCallback();
			return true;
		}
		if (this.mMethod != null)
		{
			if (this.mParameters == null || this.mParameters.Length == 0)
			{
				this.mMethod.Invoke(this.mTarget, null);
			}
			else
			{
				if (this.mArgs == null || this.mArgs.Length != this.mParameters.Length)
				{
					this.mArgs = new object[this.mParameters.Length];
				}
				int i = 0;
				int num = this.mParameters.Length;
				while (i < num)
				{
					this.mArgs[i] = this.mParameters[i].value;
					i++;
				}
				try
				{
					this.mMethod.Invoke(this.mTarget, this.mArgs);
				}
				catch (ArgumentException ex)
				{
					string text = "Error calling ";
					if (this.mTarget == null)
					{
						text += this.mMethod.Name;
					}
					else
					{
						string text2 = text;
						text = string.Concat(new object[]
						{
							text2,
							this.mTarget.GetType(),
							".",
							this.mMethod.Name
						});
					}
					text = text + ": " + ex.Message;
					text += "\n  Expected: ";
					if (this.mParameterInfos.Length == 0)
					{
						text += "no arguments";
					}
					else
					{
						text += this.mParameterInfos[0];
						for (int j = 1; j < this.mParameterInfos.Length; j++)
						{
							text = text + ", " + this.mParameterInfos[j].ParameterType;
						}
					}
					text += "\n  Received: ";
					if (this.mParameters.Length == 0)
					{
						text += "no arguments";
					}
					else
					{
						text += this.mParameters[0].type;
						for (int k = 1; k < this.mParameters.Length; k++)
						{
							text = text + ", " + this.mParameters[k].type;
						}
					}
					text += "\n";
					Debug.LogError(text);
				}
				int l = 0;
				int num2 = this.mArgs.Length;
				while (l < num2)
				{
					if (this.mParameterInfos[l].IsIn || this.mParameterInfos[l].IsOut)
					{
						this.mParameters[l].value = this.mArgs[l];
					}
					this.mArgs[l] = null;
					l++;
				}
			}
			return true;
		}
		return false;
	}

	// Token: 0x060005A3 RID: 1443 RVA: 0x000264EC File Offset: 0x000246EC
	public void Clear()
	{
		this.mTarget = null;
		this.mMethodName = null;
		this.mRawDelegate = false;
		this.mCachedCallback = null;
		this.mParameters = null;
		this.mCached = false;
		this.mMethod = null;
		this.mParameterInfos = null;
		this.mArgs = null;
	}

	// Token: 0x060005A4 RID: 1444 RVA: 0x00026538 File Offset: 0x00024738
	public override string ToString()
	{
		if (!(this.mTarget != null))
		{
			return (!this.mRawDelegate) ? null : "[delegate]";
		}
		string text = this.mTarget.GetType().ToString();
		int num = text.LastIndexOf('.');
		if (num > 0)
		{
			text = text.Substring(num + 1);
		}
		if (!string.IsNullOrEmpty(this.methodName))
		{
			return text + "/" + this.methodName;
		}
		return text + "/[delegate]";
	}

	// Token: 0x060005A5 RID: 1445 RVA: 0x000265C8 File Offset: 0x000247C8
	public static void Execute(List<EventDelegate> list)
	{
		if (list != null)
		{
			for (int i = 0; i < list.Count; i++)
			{
				EventDelegate eventDelegate = list[i];
				if (eventDelegate != null)
				{
					try
					{
						eventDelegate.Execute();
					}
					catch (Exception ex)
					{
						if (ex.InnerException != null)
						{
							Debug.LogError(ex.InnerException.Message);
						}
						else
						{
							Debug.LogError(ex.Message);
						}
					}
					if (i >= list.Count)
					{
						break;
					}
					if (list[i] != eventDelegate)
					{
						continue;
					}
					if (eventDelegate.oneShot)
					{
						list.RemoveAt(i);
						continue;
					}
				}
			}
		}
	}

	// Token: 0x060005A6 RID: 1446 RVA: 0x00026694 File Offset: 0x00024894
	public static bool IsValid(List<EventDelegate> list)
	{
		if (list != null)
		{
			int i = 0;
			int count = list.Count;
			while (i < count)
			{
				EventDelegate eventDelegate = list[i];
				if (eventDelegate != null && eventDelegate.isValid)
				{
					return true;
				}
				i++;
			}
		}
		return false;
	}

	// Token: 0x060005A7 RID: 1447 RVA: 0x000266DC File Offset: 0x000248DC
	public static EventDelegate Set(List<EventDelegate> list, EventDelegate.Callback callback)
	{
		if (list != null)
		{
			EventDelegate eventDelegate = new EventDelegate(callback);
			list.Clear();
			list.Add(eventDelegate);
			return eventDelegate;
		}
		return null;
	}

	// Token: 0x060005A8 RID: 1448 RVA: 0x00026708 File Offset: 0x00024908
	public static void Set(List<EventDelegate> list, EventDelegate del)
	{
		if (list != null)
		{
			list.Clear();
			list.Add(del);
		}
	}

	// Token: 0x060005A9 RID: 1449 RVA: 0x00026720 File Offset: 0x00024920
	public static EventDelegate Add(List<EventDelegate> list, EventDelegate.Callback callback)
	{
		return EventDelegate.Add(list, callback, false);
	}

	// Token: 0x060005AA RID: 1450 RVA: 0x0002672C File Offset: 0x0002492C
	public static EventDelegate Add(List<EventDelegate> list, EventDelegate.Callback callback, bool oneShot)
	{
		if (list != null)
		{
			int i = 0;
			int count = list.Count;
			while (i < count)
			{
				EventDelegate eventDelegate = list[i];
				if (eventDelegate != null && eventDelegate.Equals(callback))
				{
					return eventDelegate;
				}
				i++;
			}
			EventDelegate eventDelegate2 = new EventDelegate(callback);
			eventDelegate2.oneShot = oneShot;
			list.Add(eventDelegate2);
			return eventDelegate2;
		}
		Debug.LogWarning("Attempting to add a callback to a list that's null");
		return null;
	}

	// Token: 0x060005AB RID: 1451 RVA: 0x00026798 File Offset: 0x00024998
	public static void Add(List<EventDelegate> list, EventDelegate ev)
	{
		EventDelegate.Add(list, ev, ev.oneShot);
	}

	// Token: 0x060005AC RID: 1452 RVA: 0x000267A8 File Offset: 0x000249A8
	public static void Add(List<EventDelegate> list, EventDelegate ev, bool oneShot)
	{
		if (ev.mRawDelegate || ev.target == null || string.IsNullOrEmpty(ev.methodName))
		{
			EventDelegate.Add(list, ev.mCachedCallback, oneShot);
		}
		else if (list != null)
		{
			int i = 0;
			int count = list.Count;
			while (i < count)
			{
				EventDelegate eventDelegate = list[i];
				if (eventDelegate != null && eventDelegate.Equals(ev))
				{
					return;
				}
				i++;
			}
			EventDelegate eventDelegate2 = new EventDelegate(ev.target, ev.methodName);
			eventDelegate2.oneShot = oneShot;
			if (ev.mParameters != null && ev.mParameters.Length > 0)
			{
				eventDelegate2.mParameters = new EventDelegate.Parameter[ev.mParameters.Length];
				for (int j = 0; j < ev.mParameters.Length; j++)
				{
					eventDelegate2.mParameters[j] = ev.mParameters[j];
				}
			}
			list.Add(eventDelegate2);
		}
		else
		{
			Debug.LogWarning("Attempting to add a callback to a list that's null");
		}
	}

	// Token: 0x060005AD RID: 1453 RVA: 0x000268B8 File Offset: 0x00024AB8
	public static bool Remove(List<EventDelegate> list, EventDelegate.Callback callback)
	{
		if (list != null)
		{
			int i = 0;
			int count = list.Count;
			while (i < count)
			{
				EventDelegate eventDelegate = list[i];
				if (eventDelegate != null && eventDelegate.Equals(callback))
				{
					list.RemoveAt(i);
					return true;
				}
				i++;
			}
		}
		return false;
	}

	// Token: 0x060005AE RID: 1454 RVA: 0x00026908 File Offset: 0x00024B08
	public static bool Remove(List<EventDelegate> list, EventDelegate ev)
	{
		if (list != null)
		{
			int i = 0;
			int count = list.Count;
			while (i < count)
			{
				EventDelegate eventDelegate = list[i];
				if (eventDelegate != null && eventDelegate.Equals(ev))
				{
					list.RemoveAt(i);
					return true;
				}
				i++;
			}
		}
		return false;
	}

	// Token: 0x040005F6 RID: 1526
	[SerializeField]
	private MonoBehaviour mTarget;

	// Token: 0x040005F7 RID: 1527
	[SerializeField]
	private string mMethodName;

	// Token: 0x040005F8 RID: 1528
	[SerializeField]
	private EventDelegate.Parameter[] mParameters;

	// Token: 0x040005F9 RID: 1529
	public bool oneShot;

	// Token: 0x040005FA RID: 1530
	[NonSerialized]
	private EventDelegate.Callback mCachedCallback;

	// Token: 0x040005FB RID: 1531
	[NonSerialized]
	private bool mRawDelegate;

	// Token: 0x040005FC RID: 1532
	[NonSerialized]
	private bool mCached;

	// Token: 0x040005FD RID: 1533
	[NonSerialized]
	private MethodInfo mMethod;

	// Token: 0x040005FE RID: 1534
	[NonSerialized]
	private ParameterInfo[] mParameterInfos;

	// Token: 0x040005FF RID: 1535
	[NonSerialized]
	private object[] mArgs;

	// Token: 0x04000600 RID: 1536
	private static int s_Hash = "EventDelegate".GetHashCode();

	// Token: 0x020000DB RID: 219
	[Serializable]
	public class Parameter
	{
		// Token: 0x060005AF RID: 1455 RVA: 0x00026958 File Offset: 0x00024B58
		public Parameter()
		{
		}

		// Token: 0x060005B0 RID: 1456 RVA: 0x00026970 File Offset: 0x00024B70
		public Parameter(Object obj, string field)
		{
			this.obj = obj;
			this.field = field;
		}

		// Token: 0x060005B1 RID: 1457 RVA: 0x000269A4 File Offset: 0x00024BA4
		public Parameter(object val)
		{
			this.mValue = val;
		}

		// Token: 0x17000076 RID: 118
		// (get) Token: 0x060005B2 RID: 1458 RVA: 0x000269C4 File Offset: 0x00024BC4
		// (set) Token: 0x060005B3 RID: 1459 RVA: 0x00026ADC File Offset: 0x00024CDC
		public object value
		{
			get
			{
				if (this.mValue != null)
				{
					return this.mValue;
				}
				if (!this.cached)
				{
					this.cached = true;
					this.fieldInfo = null;
					this.propInfo = null;
					if (this.obj != null && !string.IsNullOrEmpty(this.field))
					{
						Type type = this.obj.GetType();
						this.propInfo = type.GetProperty(this.field);
						if (this.propInfo == null)
						{
							this.fieldInfo = type.GetField(this.field);
						}
					}
				}
				if (this.propInfo != null)
				{
					return this.propInfo.GetValue(this.obj, null);
				}
				if (this.fieldInfo != null)
				{
					return this.fieldInfo.GetValue(this.obj);
				}
				if (this.obj != null)
				{
					return this.obj;
				}
				if (this.expectedType != null && this.expectedType.IsValueType)
				{
					return null;
				}
				return Convert.ChangeType(null, this.expectedType);
			}
			set
			{
				this.mValue = value;
			}
		}

		// Token: 0x17000077 RID: 119
		// (get) Token: 0x060005B4 RID: 1460 RVA: 0x00026AE8 File Offset: 0x00024CE8
		public Type type
		{
			get
			{
				if (this.mValue != null)
				{
					return this.mValue.GetType();
				}
				if (this.obj == null)
				{
					return typeof(void);
				}
				return this.obj.GetType();
			}
		}

		// Token: 0x04000601 RID: 1537
		public Object obj;

		// Token: 0x04000602 RID: 1538
		public string field;

		// Token: 0x04000603 RID: 1539
		[NonSerialized]
		private object mValue;

		// Token: 0x04000604 RID: 1540
		[NonSerialized]
		public Type expectedType = typeof(void);

		// Token: 0x04000605 RID: 1541
		[NonSerialized]
		public bool cached;

		// Token: 0x04000606 RID: 1542
		[NonSerialized]
		public PropertyInfo propInfo;

		// Token: 0x04000607 RID: 1543
		[NonSerialized]
		public FieldInfo fieldInfo;
	}

	// Token: 0x0200033E RID: 830
	// (Invoke) Token: 0x0600151A RID: 5402
	public delegate void Callback();
}
