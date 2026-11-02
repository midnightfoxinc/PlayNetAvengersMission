using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200006C RID: 108
public class ETCInput : ETCSingleton<ETCInput>
{
	// Token: 0x060002E3 RID: 739 RVA: 0x00013904 File Offset: 0x00011B04
	public void RegisterControl(ETCBase ctrl)
	{
		if (this.controls.ContainsKey(ctrl.name))
		{
			Debug.LogWarning("ETCInput control : " + ctrl.name + " already exists");
		}
		else
		{
			this.controls.Add(ctrl.name, ctrl);
			if (ctrl.GetType() == typeof(ETCJoystick))
			{
				this.RegisterAxis((ctrl as ETCJoystick).axisX);
				this.RegisterAxis((ctrl as ETCJoystick).axisY);
			}
			else if (ctrl.GetType() == typeof(ETCTouchPad))
			{
				this.RegisterAxis((ctrl as ETCTouchPad).axisX);
				this.RegisterAxis((ctrl as ETCTouchPad).axisY);
			}
			else if (ctrl.GetType() == typeof(ETCDPad))
			{
				this.RegisterAxis((ctrl as ETCDPad).axisX);
				this.RegisterAxis((ctrl as ETCDPad).axisY);
			}
			else if (ctrl.GetType() == typeof(ETCButton))
			{
				this.RegisterAxis((ctrl as ETCButton).axis);
			}
		}
	}

	// Token: 0x060002E4 RID: 740 RVA: 0x00013A34 File Offset: 0x00011C34
	public void UnRegisterControl(ETCBase ctrl)
	{
		if (this.controls.ContainsKey(ctrl.name) && ctrl.enabled)
		{
			this.controls.Remove(ctrl.name);
			if (ctrl.GetType() == typeof(ETCJoystick))
			{
				this.UnRegisterAxis((ctrl as ETCJoystick).axisX);
				this.UnRegisterAxis((ctrl as ETCJoystick).axisY);
			}
			else if (ctrl.GetType() == typeof(ETCTouchPad))
			{
				this.UnRegisterAxis((ctrl as ETCTouchPad).axisX);
				this.UnRegisterAxis((ctrl as ETCTouchPad).axisY);
			}
			else if (ctrl.GetType() == typeof(ETCDPad))
			{
				this.UnRegisterAxis((ctrl as ETCDPad).axisX);
				this.UnRegisterAxis((ctrl as ETCDPad).axisY);
			}
			else if (ctrl.GetType() == typeof(ETCButton))
			{
				this.UnRegisterAxis((ctrl as ETCButton).axis);
			}
		}
	}

	// Token: 0x060002E5 RID: 741 RVA: 0x00013B50 File Offset: 0x00011D50
	public static void SetControlVisible(string ctrlName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			ETCInput.control.visible = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		}
	}

	// Token: 0x060002E6 RID: 742 RVA: 0x00013B9C File Offset: 0x00011D9C
	public static bool GetControlVisible(string ctrlName)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			return ETCInput.control.visible;
		}
		Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		return false;
	}

	// Token: 0x060002E7 RID: 743 RVA: 0x00013BE4 File Offset: 0x00011DE4
	public static void SetControlActivated(string ctrlName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			ETCInput.control.activated = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		}
	}

	// Token: 0x060002E8 RID: 744 RVA: 0x00013C30 File Offset: 0x00011E30
	public static bool GetControlActivated(string ctrlName)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			return ETCInput.control.activated;
		}
		Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		return false;
	}

	// Token: 0x060002E9 RID: 745 RVA: 0x00013C78 File Offset: 0x00011E78
	public static void SetControlSwipeIn(string ctrlName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			ETCInput.control.isSwipeIn = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		}
	}

	// Token: 0x060002EA RID: 746 RVA: 0x00013CC4 File Offset: 0x00011EC4
	public static bool GetControlSwipeIn(string ctrlName)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			return ETCInput.control.isSwipeIn;
		}
		Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		return false;
	}

	// Token: 0x060002EB RID: 747 RVA: 0x00013D04 File Offset: 0x00011F04
	public static void SetControlSwipeOut(string ctrlName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			ETCInput.control.isSwipeOut = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		}
	}

	// Token: 0x060002EC RID: 748 RVA: 0x00013D50 File Offset: 0x00011F50
	public static bool GetControlSwipeOut(string ctrlName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			return ETCInput.control.isSwipeOut;
		}
		Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		return false;
	}

	// Token: 0x060002ED RID: 749 RVA: 0x00013D90 File Offset: 0x00011F90
	public static void SetDPadAxesCount(string ctrlName, ETCBase.DPadAxis value)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			ETCInput.control.dPadAxisCount = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		}
	}

	// Token: 0x060002EE RID: 750 RVA: 0x00013DDC File Offset: 0x00011FDC
	public static ETCBase.DPadAxis GetDPadAxesCount(string ctrlName)
	{
		if (ETCSingleton<ETCInput>.instance.controls.TryGetValue(ctrlName, ref ETCInput.control))
		{
			return ETCInput.control.dPadAxisCount;
		}
		Debug.LogWarning("ETCInput : " + ctrlName + " doesn't exist");
		return ETCBase.DPadAxis.Two_Axis;
	}

	// Token: 0x060002EF RID: 751 RVA: 0x00013E1C File Offset: 0x0001201C
	public static void ResetAxis(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.axisValue = 0f;
			ETCInput.axis.axisSpeedValue = 0f;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002F0 RID: 752 RVA: 0x00013E7C File Offset: 0x0001207C
	public static void SetAxisEnabled(string axisName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.enable = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002F1 RID: 753 RVA: 0x00013EC8 File Offset: 0x000120C8
	public static bool GetAxisEnabled(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.enable;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return false;
	}

	// Token: 0x060002F2 RID: 754 RVA: 0x00013F08 File Offset: 0x00012108
	public static void SetAxisInverted(string axisName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.invertedAxis = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002F3 RID: 755 RVA: 0x00013F54 File Offset: 0x00012154
	public static bool GetAxisInverted(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.invertedAxis;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return false;
	}

	// Token: 0x060002F4 RID: 756 RVA: 0x00013F94 File Offset: 0x00012194
	public static void SetAxisDeadValue(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.deadValue = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002F5 RID: 757 RVA: 0x00013FE0 File Offset: 0x000121E0
	public static float GetAxisDeadValue(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.deadValue;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x060002F6 RID: 758 RVA: 0x0001402C File Offset: 0x0001222C
	public static void SetAxisSensitivity(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.speed = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002F7 RID: 759 RVA: 0x00014078 File Offset: 0x00012278
	public static float GetAxisSensitivity(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.speed;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x060002F8 RID: 760 RVA: 0x000140C4 File Offset: 0x000122C4
	public static void SetAxisThreshold(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.axisThreshold = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002F9 RID: 761 RVA: 0x00014110 File Offset: 0x00012310
	public static float GetAxisThreshold(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisThreshold;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x060002FA RID: 762 RVA: 0x0001415C File Offset: 0x0001235C
	public static void SetAxisInertia(string axisName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.isEnertia = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002FB RID: 763 RVA: 0x000141A8 File Offset: 0x000123A8
	public static bool GetAxisInertia(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.isEnertia;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return false;
	}

	// Token: 0x060002FC RID: 764 RVA: 0x000141E8 File Offset: 0x000123E8
	public static void SetAxisInertiaSpeed(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.inertia = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002FD RID: 765 RVA: 0x00014234 File Offset: 0x00012434
	public static float GetAxisInertiaSpeed(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.inertia;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x060002FE RID: 766 RVA: 0x00014280 File Offset: 0x00012480
	public static void SetAxisInertiaThreshold(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.inertiaThreshold = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x060002FF RID: 767 RVA: 0x000142CC File Offset: 0x000124CC
	public static float GetAxisInertiaThreshold(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.inertiaThreshold;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x06000300 RID: 768 RVA: 0x00014318 File Offset: 0x00012518
	public static void SetAxisAutoStabilization(string axisName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.isAutoStab = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000301 RID: 769 RVA: 0x00014364 File Offset: 0x00012564
	public static bool GetAxisAutoStabilization(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.isAutoStab;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return false;
	}

	// Token: 0x06000302 RID: 770 RVA: 0x000143A4 File Offset: 0x000125A4
	public static void SetAxisAutoStabilizationSpeed(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.autoStabSpeed = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000303 RID: 771 RVA: 0x000143F0 File Offset: 0x000125F0
	public static float GetAxisAutoStabilizationSpeed(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.autoStabSpeed;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x06000304 RID: 772 RVA: 0x0001443C File Offset: 0x0001263C
	public static void SetAxisAutoStabilizationThreshold(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.autoStabThreshold = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000305 RID: 773 RVA: 0x00014488 File Offset: 0x00012688
	public static float GetAxisAutoStabilizationThreshold(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.autoStabThreshold;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x06000306 RID: 774 RVA: 0x000144D4 File Offset: 0x000126D4
	public static void SetAxisClampRotation(string axisName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.isClampRotation = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000307 RID: 775 RVA: 0x00014520 File Offset: 0x00012720
	public static bool GetAxisClampRotation(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.isClampRotation;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return false;
	}

	// Token: 0x06000308 RID: 776 RVA: 0x00014560 File Offset: 0x00012760
	public static void SetAxisClampRotationValue(string axisName, float min, float max)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.minAngle = min;
			ETCInput.axis.maxAngle = max;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000309 RID: 777 RVA: 0x000145B8 File Offset: 0x000127B8
	public static void SetAxisClampRotationMinValue(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.minAngle = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x0600030A RID: 778 RVA: 0x00014604 File Offset: 0x00012804
	public static void SetAxisClampRotationMaxValue(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.maxAngle = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x0600030B RID: 779 RVA: 0x00014650 File Offset: 0x00012850
	public static float GetAxisClampRotationMinValue(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.minAngle;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x0600030C RID: 780 RVA: 0x0001469C File Offset: 0x0001289C
	public static float GetAxisClampRotationMaxValue(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.maxAngle;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x0600030D RID: 781 RVA: 0x000146E8 File Offset: 0x000128E8
	public static void SetAxisDirecTransform(string axisName, Transform value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.directTransform = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x0600030E RID: 782 RVA: 0x00014734 File Offset: 0x00012934
	public static Transform GetAxisDirectTransform(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.directTransform;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return null;
	}

	// Token: 0x0600030F RID: 783 RVA: 0x0001477C File Offset: 0x0001297C
	public static void SetAxisDirectAction(string axisName, ETCAxis.DirectAction value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.directAction = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000310 RID: 784 RVA: 0x000147C8 File Offset: 0x000129C8
	public static ETCAxis.DirectAction GetAxisDirectAction(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.directAction;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return ETCAxis.DirectAction.Rotate;
	}

	// Token: 0x06000311 RID: 785 RVA: 0x00014808 File Offset: 0x00012A08
	public static void SetAxisAffectedAxis(string axisName, ETCAxis.AxisInfluenced value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.axisInfluenced = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000312 RID: 786 RVA: 0x00014854 File Offset: 0x00012A54
	public static ETCAxis.AxisInfluenced GetAxisAffectedAxis(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisInfluenced;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return ETCAxis.AxisInfluenced.X;
	}

	// Token: 0x06000313 RID: 787 RVA: 0x00014894 File Offset: 0x00012A94
	public static void SetAxisOverTime(string axisName, bool value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.isValueOverTime = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000314 RID: 788 RVA: 0x000148E0 File Offset: 0x00012AE0
	public static bool GetAxisOverTime(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.isValueOverTime;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return false;
	}

	// Token: 0x06000315 RID: 789 RVA: 0x00014920 File Offset: 0x00012B20
	public static void SetAxisOverTimeStep(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.overTimeStep = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000316 RID: 790 RVA: 0x0001496C File Offset: 0x00012B6C
	public static float GetAxisOverTimeStep(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.overTimeStep;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x06000317 RID: 791 RVA: 0x000149B8 File Offset: 0x00012BB8
	public static void SetAxisOverTimeMaxValue(string axisName, float value)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			ETCInput.axis.maxOverTimeValue = value;
		}
		else
		{
			Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		}
	}

	// Token: 0x06000318 RID: 792 RVA: 0x00014A04 File Offset: 0x00012C04
	public static float GetAxisOverTimeMaxValue(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.maxOverTimeValue;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return -1f;
	}

	// Token: 0x06000319 RID: 793 RVA: 0x00014A50 File Offset: 0x00012C50
	public static float GetAxis(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisValue;
		}
		Debug.LogWarning("ETCInput : " + axisName + " doesn't exist");
		return 0f;
	}

	// Token: 0x0600031A RID: 794 RVA: 0x00014A9C File Offset: 0x00012C9C
	public static float GetAxisSpeed(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisSpeedValue;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return 0f;
	}

	// Token: 0x0600031B RID: 795 RVA: 0x00014AE4 File Offset: 0x00012CE4
	public static bool GetAxisDownUp(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.DownUp;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return false;
	}

	// Token: 0x0600031C RID: 796 RVA: 0x00014B30 File Offset: 0x00012D30
	public static bool GetAxisDownDown(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.DownDown;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return false;
	}

	// Token: 0x0600031D RID: 797 RVA: 0x00014B7C File Offset: 0x00012D7C
	public static bool GetAxisDownRight(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.DownRight;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return false;
	}

	// Token: 0x0600031E RID: 798 RVA: 0x00014BC8 File Offset: 0x00012DC8
	public static bool GetAxisDownLeft(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.DownLeft;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return false;
	}

	// Token: 0x0600031F RID: 799 RVA: 0x00014C14 File Offset: 0x00012E14
	public static bool GetAxisPressedUp(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.PressUp;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return false;
	}

	// Token: 0x06000320 RID: 800 RVA: 0x00014C60 File Offset: 0x00012E60
	public static bool GetAxisPressedDown(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.PressDown;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return false;
	}

	// Token: 0x06000321 RID: 801 RVA: 0x00014CB0 File Offset: 0x00012EB0
	public static bool GetAxisPressedRight(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.PressRight;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return false;
	}

	// Token: 0x06000322 RID: 802 RVA: 0x00014D00 File Offset: 0x00012F00
	public static bool GetAxisPressedLeft(string axisName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(axisName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.PressLeft;
		}
		Debug.LogWarning(axisName + " doesn't exist");
		return false;
	}

	// Token: 0x06000323 RID: 803 RVA: 0x00014D50 File Offset: 0x00012F50
	public static bool GetButtonDown(string buttonName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(buttonName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.Down;
		}
		Debug.LogWarning(buttonName + " doesn't exist");
		return false;
	}

	// Token: 0x06000324 RID: 804 RVA: 0x00014D9C File Offset: 0x00012F9C
	public static bool GetButton(string buttonName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(buttonName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.Down || ETCInput.axis.axisState == ETCAxis.AxisState.Press;
		}
		Debug.LogWarning(buttonName + " doesn't exist");
		return false;
	}

	// Token: 0x06000325 RID: 805 RVA: 0x00014DF8 File Offset: 0x00012FF8
	public static bool GetButtonUp(string buttonName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(buttonName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisState == ETCAxis.AxisState.Up;
		}
		Debug.LogWarning(buttonName + " doesn't exist");
		return false;
	}

	// Token: 0x06000326 RID: 806 RVA: 0x00014E44 File Offset: 0x00013044
	public static float GetButtonValue(string buttonName)
	{
		if (ETCSingleton<ETCInput>.instance.axes.TryGetValue(buttonName, ref ETCInput.axis))
		{
			return ETCInput.axis.axisValue;
		}
		Debug.LogWarning(buttonName + " doesn't exist");
		return -1f;
	}

	// Token: 0x06000327 RID: 807 RVA: 0x00014E8C File Offset: 0x0001308C
	private void RegisterAxis(ETCAxis axis)
	{
		if (ETCSingleton<ETCInput>.instance.axes.ContainsKey(axis.name))
		{
			Debug.LogWarning("ETCInput axis : " + axis.name + " already exists");
		}
		else
		{
			this.axes.Add(axis.name, axis);
		}
	}

	// Token: 0x06000328 RID: 808 RVA: 0x00014EE4 File Offset: 0x000130E4
	private void UnRegisterAxis(ETCAxis axis)
	{
		if (ETCSingleton<ETCInput>.instance.axes.ContainsKey(axis.name))
		{
			this.axes.Remove(axis.name);
		}
	}

	// Token: 0x04000356 RID: 854
	private Dictionary<string, ETCAxis> axes = new Dictionary<string, ETCAxis>();

	// Token: 0x04000357 RID: 855
	private Dictionary<string, ETCBase> controls = new Dictionary<string, ETCBase>();

	// Token: 0x04000358 RID: 856
	private static ETCBase control;

	// Token: 0x04000359 RID: 857
	private static ETCAxis axis;
}
