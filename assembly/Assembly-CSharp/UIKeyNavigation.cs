using System;
using UnityEngine;

// Token: 0x020000B2 RID: 178
[AddComponentMenu("NGUI/Interaction/Key Navigation")]
public class UIKeyNavigation : MonoBehaviour
{
	// Token: 0x17000034 RID: 52
	// (get) Token: 0x06000452 RID: 1106 RVA: 0x0001C4D4 File Offset: 0x0001A6D4
	public static UIKeyNavigation current
	{
		get
		{
			GameObject hoveredObject = UICamera.hoveredObject;
			if (hoveredObject == null)
			{
				return null;
			}
			return hoveredObject.GetComponent<UIKeyNavigation>();
		}
	}

	// Token: 0x17000035 RID: 53
	// (get) Token: 0x06000453 RID: 1107 RVA: 0x0001C4FC File Offset: 0x0001A6FC
	public bool isColliderEnabled
	{
		get
		{
			if (!base.enabled || !base.gameObject.activeInHierarchy)
			{
				return false;
			}
			Collider component = base.GetComponent<Collider>();
			if (component != null)
			{
				return component.enabled;
			}
			Collider2D component2 = base.GetComponent<Collider2D>();
			return component2 != null && component2.enabled;
		}
	}

	// Token: 0x06000454 RID: 1108 RVA: 0x0001C55C File Offset: 0x0001A75C
	protected virtual void OnEnable()
	{
		UIKeyNavigation.list.Add(this);
		if (this.mStarted)
		{
			this.Start();
		}
	}

	// Token: 0x06000455 RID: 1109 RVA: 0x0001C57C File Offset: 0x0001A77C
	private void Start()
	{
		this.mStarted = true;
		if (this.startsSelected && this.isColliderEnabled)
		{
			UICamera.hoveredObject = base.gameObject;
		}
	}

	// Token: 0x06000456 RID: 1110 RVA: 0x0001C5B4 File Offset: 0x0001A7B4
	protected virtual void OnDisable()
	{
		UIKeyNavigation.list.Remove(this);
	}

	// Token: 0x06000457 RID: 1111 RVA: 0x0001C5C4 File Offset: 0x0001A7C4
	private static bool IsActive(GameObject go)
	{
		if (!go || !go.activeInHierarchy)
		{
			return false;
		}
		Collider component = go.GetComponent<Collider>();
		if (component != null)
		{
			return component.enabled;
		}
		Collider2D component2 = go.GetComponent<Collider2D>();
		return component2 != null && component2.enabled;
	}

	// Token: 0x06000458 RID: 1112 RVA: 0x0001C620 File Offset: 0x0001A820
	public GameObject GetLeft()
	{
		if (UIKeyNavigation.IsActive(this.onLeft))
		{
			return this.onLeft;
		}
		if (this.constraint == UIKeyNavigation.Constraint.Vertical || this.constraint == UIKeyNavigation.Constraint.Explicit)
		{
			return null;
		}
		return this.Get(Vector3.left, 1f, 2f);
	}

	// Token: 0x06000459 RID: 1113 RVA: 0x0001C674 File Offset: 0x0001A874
	public GameObject GetRight()
	{
		if (UIKeyNavigation.IsActive(this.onRight))
		{
			return this.onRight;
		}
		if (this.constraint == UIKeyNavigation.Constraint.Vertical || this.constraint == UIKeyNavigation.Constraint.Explicit)
		{
			return null;
		}
		return this.Get(Vector3.right, 1f, 2f);
	}

	// Token: 0x0600045A RID: 1114 RVA: 0x0001C6C8 File Offset: 0x0001A8C8
	public GameObject GetUp()
	{
		if (UIKeyNavigation.IsActive(this.onUp))
		{
			return this.onUp;
		}
		if (this.constraint == UIKeyNavigation.Constraint.Horizontal || this.constraint == UIKeyNavigation.Constraint.Explicit)
		{
			return null;
		}
		return this.Get(Vector3.up, 2f, 1f);
	}

	// Token: 0x0600045B RID: 1115 RVA: 0x0001C71C File Offset: 0x0001A91C
	public GameObject GetDown()
	{
		if (UIKeyNavigation.IsActive(this.onDown))
		{
			return this.onDown;
		}
		if (this.constraint == UIKeyNavigation.Constraint.Horizontal || this.constraint == UIKeyNavigation.Constraint.Explicit)
		{
			return null;
		}
		return this.Get(Vector3.down, 2f, 1f);
	}

	// Token: 0x0600045C RID: 1116 RVA: 0x0001C770 File Offset: 0x0001A970
	public GameObject Get(Vector3 myDir, float x = 1f, float y = 1f)
	{
		Transform transform = base.transform;
		myDir = transform.TransformDirection(myDir);
		Vector3 center = UIKeyNavigation.GetCenter(base.gameObject);
		float num = float.MaxValue;
		GameObject result = null;
		for (int i = 0; i < UIKeyNavigation.list.size; i++)
		{
			UIKeyNavigation uikeyNavigation = UIKeyNavigation.list[i];
			if (!(uikeyNavigation == this) && uikeyNavigation.constraint != UIKeyNavigation.Constraint.Explicit && uikeyNavigation.isColliderEnabled)
			{
				UIWidget component = uikeyNavigation.GetComponent<UIWidget>();
				if (!(component != null) || component.alpha != 0f)
				{
					Vector3 vector = UIKeyNavigation.GetCenter(uikeyNavigation.gameObject) - center;
					float num2 = Vector3.Dot(myDir, vector.normalized);
					if (num2 >= 0.707f)
					{
						vector = transform.InverseTransformDirection(vector);
						vector.x *= x;
						vector.y *= y;
						float sqrMagnitude = vector.sqrMagnitude;
						if (sqrMagnitude <= num)
						{
							result = uikeyNavigation.gameObject;
							num = sqrMagnitude;
						}
					}
				}
			}
		}
		return result;
	}

	// Token: 0x0600045D RID: 1117 RVA: 0x0001C8A4 File Offset: 0x0001AAA4
	protected static Vector3 GetCenter(GameObject go)
	{
		UIWidget component = go.GetComponent<UIWidget>();
		UICamera uicamera = UICamera.FindCameraForLayer(go.layer);
		if (uicamera != null)
		{
			Vector3 vector = go.transform.position;
			if (component != null)
			{
				Vector3[] worldCorners = component.worldCorners;
				vector = (worldCorners[0] + worldCorners[2]) * 0.5f;
			}
			vector = uicamera.cachedCamera.WorldToScreenPoint(vector);
			vector.z = 0f;
			return vector;
		}
		if (component != null)
		{
			Vector3[] worldCorners2 = component.worldCorners;
			return (worldCorners2[0] + worldCorners2[2]) * 0.5f;
		}
		return go.transform.position;
	}

	// Token: 0x0600045E RID: 1118 RVA: 0x0001C97C File Offset: 0x0001AB7C
	public virtual void OnNavigate(KeyCode key)
	{
		if (UIPopupList.isOpen)
		{
			return;
		}
		if (UIKeyNavigation.mLastFrame == Time.frameCount)
		{
			return;
		}
		UIKeyNavigation.mLastFrame = Time.frameCount;
		GameObject gameObject = null;
		switch (key)
		{
		case 273:
			gameObject = this.GetUp();
			break;
		case 274:
			gameObject = this.GetDown();
			break;
		case 275:
			gameObject = this.GetRight();
			break;
		case 276:
			gameObject = this.GetLeft();
			break;
		}
		if (gameObject != null)
		{
			UICamera.hoveredObject = gameObject;
		}
	}

	// Token: 0x0600045F RID: 1119 RVA: 0x0001CA18 File Offset: 0x0001AC18
	public virtual void OnKey(KeyCode key)
	{
		if (UIPopupList.isOpen)
		{
			return;
		}
		if (UIKeyNavigation.mLastFrame == Time.frameCount)
		{
			return;
		}
		UIKeyNavigation.mLastFrame = Time.frameCount;
		if (key == 9)
		{
			GameObject gameObject = this.onTab;
			if (gameObject == null)
			{
				if (UICamera.GetKey(304) || UICamera.GetKey(303))
				{
					gameObject = this.GetLeft();
					if (gameObject == null)
					{
						gameObject = this.GetUp();
					}
					if (gameObject == null)
					{
						gameObject = this.GetDown();
					}
					if (gameObject == null)
					{
						gameObject = this.GetRight();
					}
				}
				else
				{
					gameObject = this.GetRight();
					if (gameObject == null)
					{
						gameObject = this.GetDown();
					}
					if (gameObject == null)
					{
						gameObject = this.GetUp();
					}
					if (gameObject == null)
					{
						gameObject = this.GetLeft();
					}
				}
			}
			if (gameObject != null)
			{
				UICamera.currentScheme = UICamera.ControlScheme.Controller;
				UICamera.hoveredObject = gameObject;
				UIInput component = gameObject.GetComponent<UIInput>();
				if (component != null)
				{
					component.isSelected = true;
				}
			}
		}
	}

	// Token: 0x06000460 RID: 1120 RVA: 0x0001CB44 File Offset: 0x0001AD44
	protected virtual void OnClick()
	{
		if (NGUITools.GetActive(this.onClick))
		{
			UICamera.hoveredObject = this.onClick;
		}
	}

	// Token: 0x0400049F RID: 1183
	public static BetterList<UIKeyNavigation> list = new BetterList<UIKeyNavigation>();

	// Token: 0x040004A0 RID: 1184
	public UIKeyNavigation.Constraint constraint;

	// Token: 0x040004A1 RID: 1185
	public GameObject onUp;

	// Token: 0x040004A2 RID: 1186
	public GameObject onDown;

	// Token: 0x040004A3 RID: 1187
	public GameObject onLeft;

	// Token: 0x040004A4 RID: 1188
	public GameObject onRight;

	// Token: 0x040004A5 RID: 1189
	public GameObject onClick;

	// Token: 0x040004A6 RID: 1190
	public GameObject onTab;

	// Token: 0x040004A7 RID: 1191
	public bool startsSelected;

	// Token: 0x040004A8 RID: 1192
	[NonSerialized]
	private bool mStarted;

	// Token: 0x040004A9 RID: 1193
	public static int mLastFrame = 0;

	// Token: 0x020000B3 RID: 179
	public enum Constraint
	{
		// Token: 0x040004AB RID: 1195
		None,
		// Token: 0x040004AC RID: 1196
		Vertical,
		// Token: 0x040004AD RID: 1197
		Horizontal,
		// Token: 0x040004AE RID: 1198
		Explicit
	}
}
