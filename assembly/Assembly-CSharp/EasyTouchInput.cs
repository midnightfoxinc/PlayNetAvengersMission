using System;
using UnityEngine;

// Token: 0x02000047 RID: 71
public class EasyTouchInput
{
	// Token: 0x06000281 RID: 641 RVA: 0x000108E0 File Offset: 0x0000EAE0
	public int TouchCount()
	{
		return this.getTouchCount(true);
	}

	// Token: 0x06000282 RID: 642 RVA: 0x000108EC File Offset: 0x0000EAEC
	private int getTouchCount(bool realTouch)
	{
		int num = 0;
		if (realTouch || EasyTouch.instance.enableRemote)
		{
			num = Input.touchCount;
		}
		else if (Input.GetMouseButton(0) || Input.GetMouseButtonUp(0))
		{
			num = 1;
			if (EasyTouch.GetSecondeFingerSimulation())
			{
				if (Input.GetKey(308) || Input.GetKey(EasyTouch.instance.twistKey) || Input.GetKey(306) || Input.GetKey(EasyTouch.instance.swipeKey))
				{
					num = 2;
				}
				if (Input.GetKeyUp(308) || Input.GetKeyUp(EasyTouch.instance.twistKey) || Input.GetKeyUp(306) || Input.GetKeyUp(EasyTouch.instance.swipeKey))
				{
					num = 2;
				}
			}
			if (num == 0)
			{
				this.complexCenter = Vector2.zero;
				this.oldMousePosition[0] = new Vector2(-1f, -1f);
				this.oldMousePosition[1] = new Vector2(-1f, -1f);
			}
		}
		return num;
	}

	// Token: 0x06000283 RID: 643 RVA: 0x00010A20 File Offset: 0x0000EC20
	public Finger GetMouseTouch(int fingerIndex, Finger myFinger)
	{
		Finger finger;
		if (myFinger != null)
		{
			finger = myFinger;
		}
		else
		{
			finger = new Finger();
			finger.gesture = EasyTouch.GestureType.None;
		}
		if (fingerIndex == 1 && (Input.GetKeyUp(308) || Input.GetKeyUp(EasyTouch.instance.twistKey) || Input.GetKeyUp(306) || Input.GetKeyUp(EasyTouch.instance.swipeKey)))
		{
			finger.fingerIndex = fingerIndex;
			finger.position = this.oldFinger2Position;
			finger.deltaPosition = finger.position - this.oldFinger2Position;
			finger.tapCount = this.tapCount[fingerIndex];
			finger.deltaTime = Time.realtimeSinceStartup - this.deltaTime[fingerIndex];
			finger.phase = 3;
			return finger;
		}
		if (Input.GetMouseButton(0))
		{
			finger.fingerIndex = fingerIndex;
			finger.position = this.GetPointerPosition(fingerIndex);
			if ((double)(Time.realtimeSinceStartup - this.tapeTime[fingerIndex]) > 0.5)
			{
				this.tapCount[fingerIndex] = 0;
			}
			if (Input.GetMouseButtonDown(0) || (fingerIndex == 1 && (Input.GetKeyDown(308) || Input.GetKeyDown(EasyTouch.instance.twistKey) || Input.GetKeyDown(306) || Input.GetKeyDown(EasyTouch.instance.swipeKey))))
			{
				finger.position = this.GetPointerPosition(fingerIndex);
				finger.deltaPosition = Vector2.zero;
				this.tapCount[fingerIndex] = this.tapCount[fingerIndex] + 1;
				finger.tapCount = this.tapCount[fingerIndex];
				this.startActionTime[fingerIndex] = Time.realtimeSinceStartup;
				this.deltaTime[fingerIndex] = this.startActionTime[fingerIndex];
				finger.deltaTime = 0f;
				finger.phase = 0;
				if (fingerIndex == 1)
				{
					this.oldFinger2Position = finger.position;
					this.oldMousePosition[fingerIndex] = finger.position;
				}
				else
				{
					this.oldMousePosition[fingerIndex] = finger.position;
				}
				if (this.tapCount[fingerIndex] == 1)
				{
					this.tapeTime[fingerIndex] = Time.realtimeSinceStartup;
				}
				return finger;
			}
			finger.deltaPosition = finger.position - this.oldMousePosition[fingerIndex];
			finger.tapCount = this.tapCount[fingerIndex];
			finger.deltaTime = Time.realtimeSinceStartup - this.deltaTime[fingerIndex];
			if (finger.deltaPosition.sqrMagnitude < 1f)
			{
				finger.phase = 2;
			}
			else
			{
				finger.phase = 1;
			}
			this.oldMousePosition[fingerIndex] = finger.position;
			this.deltaTime[fingerIndex] = Time.realtimeSinceStartup;
			return finger;
		}
		else
		{
			if (Input.GetMouseButtonUp(0))
			{
				finger.fingerIndex = fingerIndex;
				finger.position = this.GetPointerPosition(fingerIndex);
				finger.deltaPosition = finger.position - this.oldMousePosition[fingerIndex];
				finger.tapCount = this.tapCount[fingerIndex];
				finger.deltaTime = Time.realtimeSinceStartup - this.deltaTime[fingerIndex];
				finger.phase = 3;
				this.oldMousePosition[fingerIndex] = finger.position;
				return finger;
			}
			return null;
		}
	}

	// Token: 0x06000284 RID: 644 RVA: 0x00010D68 File Offset: 0x0000EF68
	public Vector2 GetSecondFingerPosition()
	{
		Vector2 result;
		result..ctor(-1f, -1f);
		if ((Input.GetKey(308) || Input.GetKey(EasyTouch.instance.twistKey)) && (Input.GetKey(306) || Input.GetKey(EasyTouch.instance.swipeKey)))
		{
			if (!this.bComplex)
			{
				this.bComplex = true;
				this.deltaFingerPosition = Input.mousePosition - this.oldFinger2Position;
			}
			result = this.GetComplex2finger();
			return result;
		}
		if (Input.GetKey(308) || Input.GetKey(EasyTouch.instance.twistKey))
		{
			result = this.GetPinchTwist2Finger(false);
			this.bComplex = false;
			return result;
		}
		if (Input.GetKey(306) || Input.GetKey(EasyTouch.instance.swipeKey))
		{
			result = this.GetComplex2finger();
			this.bComplex = false;
			return result;
		}
		return result;
	}

	// Token: 0x06000285 RID: 645 RVA: 0x00010E6C File Offset: 0x0000F06C
	private Vector2 GetPointerPosition(int index)
	{
		if (index == 0)
		{
			return Input.mousePosition;
		}
		return this.GetSecondFingerPosition();
	}

	// Token: 0x06000286 RID: 646 RVA: 0x00010E94 File Offset: 0x0000F094
	private Vector2 GetPinchTwist2Finger(bool newSim = false)
	{
		Vector2 result;
		if (this.complexCenter == Vector2.zero)
		{
			result.x = (float)Screen.width / 2f - (Input.mousePosition.x - (float)Screen.width / 2f);
			result.y = (float)Screen.height / 2f - (Input.mousePosition.y - (float)Screen.height / 2f);
		}
		else
		{
			result.x = this.complexCenter.x - (Input.mousePosition.x - this.complexCenter.x);
			result.y = this.complexCenter.y - (Input.mousePosition.y - this.complexCenter.y);
		}
		this.oldFinger2Position = result;
		return result;
	}

	// Token: 0x06000287 RID: 647 RVA: 0x00010F78 File Offset: 0x0000F178
	private Vector2 GetComplex2finger()
	{
		Vector2 result;
		result.x = Input.mousePosition.x - this.deltaFingerPosition.x;
		result.y = Input.mousePosition.y - this.deltaFingerPosition.y;
		this.complexCenter = new Vector2((Input.mousePosition.x + result.x) / 2f, (Input.mousePosition.y + result.y) / 2f);
		this.oldFinger2Position = result;
		return result;
	}

	// Token: 0x04000291 RID: 657
	private Vector2[] oldMousePosition = new Vector2[2];

	// Token: 0x04000292 RID: 658
	private int[] tapCount = new int[2];

	// Token: 0x04000293 RID: 659
	private float[] startActionTime = new float[2];

	// Token: 0x04000294 RID: 660
	private float[] deltaTime = new float[2];

	// Token: 0x04000295 RID: 661
	private float[] tapeTime = new float[2];

	// Token: 0x04000296 RID: 662
	private bool bComplex;

	// Token: 0x04000297 RID: 663
	private Vector2 deltaFingerPosition;

	// Token: 0x04000298 RID: 664
	private Vector2 oldFinger2Position;

	// Token: 0x04000299 RID: 665
	private Vector2 complexCenter;
}
