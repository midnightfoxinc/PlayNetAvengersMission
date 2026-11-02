using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000DD RID: 221
[AddComponentMenu("NGUI/Internal/Debug")]
public class NGUIDebug : MonoBehaviour
{
	// Token: 0x1700007C RID: 124
	// (get) Token: 0x060005D2 RID: 1490 RVA: 0x0002784C File Offset: 0x00025A4C
	// (set) Token: 0x060005D3 RID: 1491 RVA: 0x00027854 File Offset: 0x00025A54
	public static bool debugRaycast
	{
		get
		{
			return NGUIDebug.mRayDebug;
		}
		set
		{
			NGUIDebug.mRayDebug = value;
			if (value && Application.isPlaying)
			{
				NGUIDebug.CreateInstance();
			}
		}
	}

	// Token: 0x060005D4 RID: 1492 RVA: 0x00027874 File Offset: 0x00025A74
	public static void CreateInstance()
	{
		if (NGUIDebug.mInstance == null)
		{
			GameObject gameObject = new GameObject("_NGUI Debug");
			NGUIDebug.mInstance = gameObject.AddComponent<NGUIDebug>();
			Object.DontDestroyOnLoad(gameObject);
		}
	}

	// Token: 0x060005D5 RID: 1493 RVA: 0x000278B0 File Offset: 0x00025AB0
	private static void LogString(string text)
	{
		if (Application.isPlaying)
		{
			if (NGUIDebug.mLines.Count > 20)
			{
				NGUIDebug.mLines.RemoveAt(0);
			}
			NGUIDebug.mLines.Add(text);
			NGUIDebug.CreateInstance();
		}
		else
		{
			Debug.Log(text);
		}
	}

	// Token: 0x060005D6 RID: 1494 RVA: 0x00027900 File Offset: 0x00025B00
	public static void Log(params object[] objs)
	{
		string text = string.Empty;
		for (int i = 0; i < objs.Length; i++)
		{
			if (i == 0)
			{
				text += objs[i].ToString();
			}
			else
			{
				text = text + ", " + objs[i].ToString();
			}
		}
		NGUIDebug.LogString(text);
	}

	// Token: 0x060005D7 RID: 1495 RVA: 0x0002795C File Offset: 0x00025B5C
	public static void Log(string s)
	{
		if (!string.IsNullOrEmpty(s))
		{
			string[] array = s.Split(new char[]
			{
				'\n'
			});
			foreach (string text in array)
			{
				NGUIDebug.LogString(text);
			}
		}
	}

	// Token: 0x060005D8 RID: 1496 RVA: 0x000279A8 File Offset: 0x00025BA8
	public static void Clear()
	{
		NGUIDebug.mLines.Clear();
	}

	// Token: 0x060005D9 RID: 1497 RVA: 0x000279B4 File Offset: 0x00025BB4
	public static void DrawBounds(Bounds b)
	{
		Vector3 center = b.center;
		Vector3 vector = b.center - b.extents;
		Vector3 vector2 = b.center + b.extents;
		Debug.DrawLine(new Vector3(vector.x, vector.y, center.z), new Vector3(vector2.x, vector.y, center.z), Color.red);
		Debug.DrawLine(new Vector3(vector.x, vector.y, center.z), new Vector3(vector.x, vector2.y, center.z), Color.red);
		Debug.DrawLine(new Vector3(vector2.x, vector.y, center.z), new Vector3(vector2.x, vector2.y, center.z), Color.red);
		Debug.DrawLine(new Vector3(vector.x, vector2.y, center.z), new Vector3(vector2.x, vector2.y, center.z), Color.red);
	}

	// Token: 0x060005DA RID: 1498 RVA: 0x00027AEC File Offset: 0x00025CEC
	private void OnGUI()
	{
		Rect rect;
		rect..ctor(5f, 5f, 1000f, 22f);
		if (NGUIDebug.mRayDebug)
		{
			UICamera.ControlScheme currentScheme = UICamera.currentScheme;
			string text = "Scheme: " + currentScheme;
			GUI.color = Color.black;
			GUI.Label(rect, text);
			rect.y -= 1f;
			rect.x -= 1f;
			GUI.color = Color.white;
			GUI.Label(rect, text);
			rect.y += 18f;
			rect.x += 1f;
			text = "Hover: " + NGUITools.GetHierarchy(UICamera.hoveredObject).Replace("\"", string.Empty);
			GUI.color = Color.black;
			GUI.Label(rect, text);
			rect.y -= 1f;
			rect.x -= 1f;
			GUI.color = Color.white;
			GUI.Label(rect, text);
			rect.y += 18f;
			rect.x += 1f;
			text = "Selection: " + NGUITools.GetHierarchy(UICamera.selectedObject).Replace("\"", string.Empty);
			GUI.color = Color.black;
			GUI.Label(rect, text);
			rect.y -= 1f;
			rect.x -= 1f;
			GUI.color = Color.white;
			GUI.Label(rect, text);
			rect.y += 18f;
			rect.x += 1f;
			text = "Controller: " + NGUITools.GetHierarchy(UICamera.controllerNavigationObject).Replace("\"", string.Empty);
			GUI.color = Color.black;
			GUI.Label(rect, text);
			rect.y -= 1f;
			rect.x -= 1f;
			GUI.color = Color.white;
			GUI.Label(rect, text);
			rect.y += 18f;
			rect.x += 1f;
			text = "Active events: " + UICamera.CountInputSources();
			if (UICamera.disableController)
			{
				text += ", disabled controller";
			}
			if (UICamera.ignoreControllerInput)
			{
				text += ", ignore controller";
			}
			if (UICamera.inputHasFocus)
			{
				text += ", input focus";
			}
			GUI.color = Color.black;
			GUI.Label(rect, text);
			rect.y -= 1f;
			rect.x -= 1f;
			GUI.color = Color.white;
			GUI.Label(rect, text);
			rect.y += 18f;
			rect.x += 1f;
		}
		int i = 0;
		int count = NGUIDebug.mLines.Count;
		while (i < count)
		{
			GUI.color = Color.black;
			GUI.Label(rect, NGUIDebug.mLines[i]);
			rect.y -= 1f;
			rect.x -= 1f;
			GUI.color = Color.white;
			GUI.Label(rect, NGUIDebug.mLines[i]);
			rect.y += 18f;
			rect.x += 1f;
			i++;
		}
	}

	// Token: 0x04000612 RID: 1554
	private static bool mRayDebug = false;

	// Token: 0x04000613 RID: 1555
	private static List<string> mLines = new List<string>();

	// Token: 0x04000614 RID: 1556
	private static NGUIDebug mInstance = null;
}
