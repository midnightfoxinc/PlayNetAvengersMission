using System;
using UnityEngine;

// Token: 0x0200007F RID: 127
public class ETCSingleton<T> : MonoBehaviour where T : ETCSingleton<T>
{
	// Token: 0x17000025 RID: 37
	// (get) Token: 0x0600034D RID: 845 RVA: 0x00015F10 File Offset: 0x00014110
	public static T instance
	{
		get
		{
			if (ETCSingleton<T>.m_Instance == null)
			{
				ETCSingleton<T>.m_Instance = (Object.FindObjectOfType(typeof(T)) as T);
				if (ETCSingleton<T>.m_Instance == null && !ETCSingleton<T>.onClose)
				{
					ETCSingleton<T>.m_Instance = new GameObject("VirtualControlInput", new Type[]
					{
						typeof(T)
					}).GetComponent<T>();
					ETCSingleton<T>.m_Instance.Init();
				}
			}
			return ETCSingleton<T>.m_Instance;
		}
	}

	// Token: 0x0600034E RID: 846 RVA: 0x00015FAC File Offset: 0x000141AC
	private void Awake()
	{
		if (ETCSingleton<T>.m_Instance == null)
		{
			ETCSingleton<T>.m_Instance = (this as T);
		}
	}

	// Token: 0x0600034F RID: 847 RVA: 0x00015FD4 File Offset: 0x000141D4
	public virtual void Init()
	{
	}

	// Token: 0x06000350 RID: 848 RVA: 0x00015FD8 File Offset: 0x000141D8
	private void OnApplicationQuit()
	{
		ETCSingleton<T>.m_Instance = (T)((object)null);
		ETCSingleton<T>.onClose = true;
	}

	// Token: 0x0400038A RID: 906
	private static T m_Instance;

	// Token: 0x0400038B RID: 907
	private static bool onClose;
}
