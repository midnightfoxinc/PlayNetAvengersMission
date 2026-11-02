using System;
using UnityEngine;

// Token: 0x0200004E RID: 78
[Serializable]
public class ETCAxis
{
	// Token: 0x0600029A RID: 666 RVA: 0x00011644 File Offset: 0x0000F844
	public ETCAxis(string axisName)
	{
		this.name = axisName;
		this.enable = true;
		this.range = ETCAxis.AxisRange.Classical;
		this.speed = 15f;
		this.invertedAxis = false;
		this.isEnertia = false;
		this.inertia = 0f;
		this.inertiaThreshold = 0.08f;
		this.axisValue = 0f;
		this.axisSpeedValue = 0f;
		this.gravity = 0f;
		this.isAutoStab = false;
		this.autoStabThreshold = 0.01f;
		this.autoStabSpeed = 10f;
		this.maxAngle = 90f;
		this.minAngle = 90f;
		this.axisState = ETCAxis.AxisState.None;
		this.maxOverTimeValue = 1f;
		this.overTimeStep = 1f;
		this.isValueOverTime = false;
		this.axisThreshold = 0.5f;
		this.deadValue = 0.1f;
		this.actionOn = ETCAxis.ActionOn.Press;
	}

	// Token: 0x1700001E RID: 30
	// (get) Token: 0x0600029B RID: 667 RVA: 0x00011730 File Offset: 0x0000F930
	// (set) Token: 0x0600029C RID: 668 RVA: 0x00011738 File Offset: 0x0000F938
	public Transform directTransform
	{
		get
		{
			return this._directTransform;
		}
		set
		{
			this._directTransform = value;
			if (this._directTransform != null)
			{
				this.directCharacterController = this._directTransform.GetComponent<CharacterController>();
				this.directRigidBody = this._directTransform.GetComponent<Rigidbody>();
			}
			else
			{
				this.directCharacterController = null;
			}
		}
	}

	// Token: 0x0600029D RID: 669 RVA: 0x0001178C File Offset: 0x0000F98C
	public void InitAxis()
	{
		this.startAngle = this.GetAngle();
	}

	// Token: 0x0600029E RID: 670 RVA: 0x0001179C File Offset: 0x0000F99C
	public void UpdateAxis(float realValue, bool isOnDrag, ETCBase.ControlType type, bool deltaTime = true)
	{
		if (this.isAutoStab && this.axisValue == 0f)
		{
			this.DoAutoStabilisation();
		}
		if (this.invertedAxis)
		{
			realValue *= -1f;
		}
		if (this.isValueOverTime && realValue != 0f)
		{
			this.axisValue += this.overTimeStep * Mathf.Sign(realValue) * Time.deltaTime;
			if (Mathf.Sign(this.axisValue) > 0f)
			{
				this.axisValue = Mathf.Clamp(this.axisValue, 0f, this.maxOverTimeValue);
			}
			else
			{
				this.axisValue = Mathf.Clamp(this.axisValue, -this.maxOverTimeValue, 0f);
			}
		}
		this.ComputAxisValue(realValue, type, isOnDrag, deltaTime);
	}

	// Token: 0x0600029F RID: 671 RVA: 0x00011874 File Offset: 0x0000FA74
	public void UpdateButton()
	{
		if (this.isValueOverTime)
		{
			this.axisValue += this.overTimeStep * Time.deltaTime;
			this.axisValue = Mathf.Clamp(this.axisValue, 0f, this.maxOverTimeValue);
		}
		else if (this.axisState == ETCAxis.AxisState.Press || this.axisState == ETCAxis.AxisState.Down)
		{
			this.axisValue = 1f;
		}
		else
		{
			this.axisValue = 0f;
		}
		this.axisSpeedValue = this.axisValue * this.speed * Time.deltaTime;
		ETCAxis.ActionOn actionOn = this.actionOn;
		if (actionOn != ETCAxis.ActionOn.Down)
		{
			if (actionOn == ETCAxis.ActionOn.Press)
			{
				if (this.axisState == ETCAxis.AxisState.Press)
				{
					this.DoDirectAction();
				}
			}
		}
		else if (this.axisState == ETCAxis.AxisState.Down)
		{
			this.DoDirectAction();
		}
	}

	// Token: 0x060002A0 RID: 672 RVA: 0x0001195C File Offset: 0x0000FB5C
	public void ResetAxis()
	{
		if (!this.isEnertia || (this.isEnertia && Mathf.Abs(this.axisValue) < this.inertiaThreshold))
		{
			this.axisValue = 0f;
			this.axisSpeedValue = 0f;
		}
	}

	// Token: 0x060002A1 RID: 673 RVA: 0x000119AC File Offset: 0x0000FBAC
	public void DoDirectAction()
	{
		if (this.directTransform)
		{
			Vector3 influencedAxis = this.GetInfluencedAxis();
			switch (this.directAction)
			{
			case ETCAxis.DirectAction.Rotate:
				this.directTransform.Rotate(influencedAxis * this.axisSpeedValue, 0);
				break;
			case ETCAxis.DirectAction.RotateLocal:
				this.directTransform.Rotate(influencedAxis * this.axisSpeedValue, 1);
				break;
			case ETCAxis.DirectAction.Translate:
				if (this.directCharacterController == null)
				{
					this.directTransform.Translate(influencedAxis * this.axisSpeedValue, 0);
				}
				else
				{
					Vector3 vector = influencedAxis * this.axisSpeedValue;
					this.directCharacterController.Move(vector);
				}
				break;
			case ETCAxis.DirectAction.TranslateLocal:
				if (this.directCharacterController == null)
				{
					this.directTransform.Translate(influencedAxis * this.axisSpeedValue, 1);
				}
				else
				{
					Vector3 vector2 = this.directCharacterController.transform.TransformDirection(influencedAxis) * this.axisSpeedValue;
					this.directCharacterController.Move(vector2);
				}
				break;
			case ETCAxis.DirectAction.Scale:
				this.directTransform.localScale += influencedAxis * this.axisSpeedValue;
				break;
			case ETCAxis.DirectAction.Force:
				if (this.directRigidBody != null)
				{
					this.directRigidBody.AddForce(influencedAxis * this.axisValue * this.speed);
				}
				else
				{
					Debug.LogWarning("ETCAxis : " + this.name + " No rigidbody on gameobject : " + this._directTransform.name);
				}
				break;
			case ETCAxis.DirectAction.RelativeForce:
				if (this.directRigidBody != null)
				{
					this.directRigidBody.AddRelativeForce(influencedAxis * this.axisValue * this.speed);
				}
				else
				{
					Debug.LogWarning("ETCAxis : " + this.name + " No rigidbody on gameobject : " + this._directTransform.name);
				}
				break;
			case ETCAxis.DirectAction.Torque:
				if (this.directRigidBody != null)
				{
					this.directRigidBody.AddTorque(influencedAxis * this.axisValue * this.speed);
				}
				else
				{
					Debug.LogWarning("ETCAxis : " + this.name + " No rigidbody on gameobject : " + this._directTransform.name);
				}
				break;
			case ETCAxis.DirectAction.RelativeTorque:
				if (this.directRigidBody != null)
				{
					this.directRigidBody.AddRelativeTorque(influencedAxis * this.axisValue * this.speed);
				}
				else
				{
					Debug.LogWarning("ETCAxis : " + this.name + " No rigidbody on gameobject : " + this._directTransform.name);
				}
				break;
			}
		}
		if (this.isClampRotation && this.directAction == ETCAxis.DirectAction.RotateLocal)
		{
			this.DoAngleLimitation();
		}
	}

	// Token: 0x060002A2 RID: 674 RVA: 0x00011CB8 File Offset: 0x0000FEB8
	public void DoGravity()
	{
		if (this.directCharacterController != null && this.gravity != 0f)
		{
			this.directCharacterController.Move(Vector3.down * this.gravity * Time.deltaTime);
		}
	}

	// Token: 0x060002A3 RID: 675 RVA: 0x00011D0C File Offset: 0x0000FF0C
	private void ComputAxisValue(float realValue, ETCBase.ControlType type, bool isOnDrag, bool deltaTime)
	{
		if (this.enable)
		{
			if (type == ETCBase.ControlType.Joystick)
			{
				float num = Mathf.Max(Mathf.Abs(realValue), 0.001f);
				float num2 = Mathf.Max(num - this.deadValue, 0f) / (1f - this.deadValue) / num;
				realValue *= num2;
			}
			if (this.isEnertia)
			{
				realValue -= this.axisValue;
				realValue /= this.inertia;
				this.axisValue += realValue;
				if (Mathf.Abs(this.axisValue) < this.inertiaThreshold && !isOnDrag)
				{
					this.axisValue = 0f;
				}
			}
			else if (!this.isValueOverTime || (this.isValueOverTime && realValue == 0f))
			{
				this.axisValue = realValue;
			}
			if (deltaTime)
			{
				this.axisSpeedValue = this.axisValue * this.speed * Time.deltaTime;
			}
			else
			{
				this.axisSpeedValue = this.axisValue * this.speed;
			}
		}
		else
		{
			this.axisValue = 0f;
			this.axisSpeedValue = 0f;
		}
	}

	// Token: 0x060002A4 RID: 676 RVA: 0x00011E38 File Offset: 0x00010038
	private Vector3 GetInfluencedAxis()
	{
		Vector3 result = Vector3.zero;
		switch (this.axisInfluenced)
		{
		case ETCAxis.AxisInfluenced.X:
			result = Vector3.right;
			break;
		case ETCAxis.AxisInfluenced.Y:
			result = Vector3.up;
			break;
		case ETCAxis.AxisInfluenced.Z:
			result = Vector3.forward;
			break;
		}
		return result;
	}

	// Token: 0x060002A5 RID: 677 RVA: 0x00011E8C File Offset: 0x0001008C
	private float GetAngle()
	{
		float num = 0f;
		if (this._directTransform != null)
		{
			switch (this.axisInfluenced)
			{
			case ETCAxis.AxisInfluenced.X:
				num = this._directTransform.localRotation.eulerAngles.x;
				break;
			case ETCAxis.AxisInfluenced.Y:
				num = this._directTransform.localRotation.eulerAngles.y;
				break;
			case ETCAxis.AxisInfluenced.Z:
				num = this._directTransform.localRotation.eulerAngles.z;
				break;
			}
			if (num <= 360f && num >= 180f)
			{
				num -= 360f;
			}
		}
		return num;
	}

	// Token: 0x060002A6 RID: 678 RVA: 0x00011F54 File Offset: 0x00010154
	private void DoAutoStabilisation()
	{
		float num = this.GetAngle();
		if (num <= 360f && num >= 180f)
		{
			num -= 360f;
		}
		if (num > this.startAngle - this.autoStabThreshold || num < this.startAngle + this.autoStabThreshold)
		{
			float num2 = 0f;
			Vector3 zero = Vector3.zero;
			if (num > this.startAngle - this.autoStabThreshold)
			{
				num2 = num + this.autoStabSpeed / 100f * Mathf.Abs(num - this.startAngle) * Time.deltaTime * -1f;
			}
			if (num < this.startAngle + this.autoStabThreshold)
			{
				num2 = num + this.autoStabSpeed / 100f * Mathf.Abs(num - this.startAngle) * Time.deltaTime;
			}
			switch (this.axisInfluenced)
			{
			case ETCAxis.AxisInfluenced.X:
				zero..ctor(num2, this._directTransform.localRotation.eulerAngles.y, this._directTransform.localRotation.eulerAngles.z);
				break;
			case ETCAxis.AxisInfluenced.Y:
				zero..ctor(this._directTransform.localRotation.eulerAngles.x, num2, this._directTransform.localRotation.eulerAngles.z);
				break;
			case ETCAxis.AxisInfluenced.Z:
				zero..ctor(this._directTransform.localRotation.eulerAngles.x, this._directTransform.localRotation.eulerAngles.y, num2);
				break;
			}
			this._directTransform.localRotation = Quaternion.Euler(zero);
		}
	}

	// Token: 0x060002A7 RID: 679 RVA: 0x00012130 File Offset: 0x00010330
	private void DoAngleLimitation()
	{
		float num = this.GetAngle();
		num = Mathf.Clamp(num, -this.minAngle, this.maxAngle);
		switch (this.axisInfluenced)
		{
		case ETCAxis.AxisInfluenced.X:
			this._directTransform.localEulerAngles = new Vector3(num, this._directTransform.localEulerAngles.y, this._directTransform.localEulerAngles.z);
			break;
		case ETCAxis.AxisInfluenced.Y:
			this._directTransform.localEulerAngles = new Vector3(this._directTransform.localEulerAngles.x, num, this._directTransform.localEulerAngles.z);
			break;
		case ETCAxis.AxisInfluenced.Z:
			this._directTransform.localEulerAngles = new Vector3(this._directTransform.localEulerAngles.x, this._directTransform.localEulerAngles.y, num);
			break;
		}
	}

	// Token: 0x040002C3 RID: 707
	public string name;

	// Token: 0x040002C4 RID: 708
	public bool enable;

	// Token: 0x040002C5 RID: 709
	public ETCAxis.AxisRange range;

	// Token: 0x040002C6 RID: 710
	public bool invertedAxis;

	// Token: 0x040002C7 RID: 711
	public float speed;

	// Token: 0x040002C8 RID: 712
	public float deadValue;

	// Token: 0x040002C9 RID: 713
	public bool isEnertia;

	// Token: 0x040002CA RID: 714
	public float inertia;

	// Token: 0x040002CB RID: 715
	public float inertiaThreshold;

	// Token: 0x040002CC RID: 716
	public bool isAutoStab;

	// Token: 0x040002CD RID: 717
	public float autoStabThreshold;

	// Token: 0x040002CE RID: 718
	public float autoStabSpeed;

	// Token: 0x040002CF RID: 719
	private float startAngle;

	// Token: 0x040002D0 RID: 720
	public bool isClampRotation;

	// Token: 0x040002D1 RID: 721
	public float maxAngle;

	// Token: 0x040002D2 RID: 722
	public float minAngle;

	// Token: 0x040002D3 RID: 723
	public bool isValueOverTime;

	// Token: 0x040002D4 RID: 724
	public float overTimeStep;

	// Token: 0x040002D5 RID: 725
	public float maxOverTimeValue;

	// Token: 0x040002D6 RID: 726
	public float axisValue;

	// Token: 0x040002D7 RID: 727
	public float axisSpeedValue;

	// Token: 0x040002D8 RID: 728
	public float axisThreshold;

	// Token: 0x040002D9 RID: 729
	public ETCAxis.AxisState axisState;

	// Token: 0x040002DA RID: 730
	[SerializeField]
	private Transform _directTransform;

	// Token: 0x040002DB RID: 731
	public ETCAxis.DirectAction directAction;

	// Token: 0x040002DC RID: 732
	public ETCAxis.AxisInfluenced axisInfluenced;

	// Token: 0x040002DD RID: 733
	public ETCAxis.ActionOn actionOn;

	// Token: 0x040002DE RID: 734
	public CharacterController directCharacterController;

	// Token: 0x040002DF RID: 735
	public Rigidbody directRigidBody;

	// Token: 0x040002E0 RID: 736
	public float gravity;

	// Token: 0x040002E1 RID: 737
	public KeyCode positivekey;

	// Token: 0x040002E2 RID: 738
	public KeyCode negativeKey;

	// Token: 0x0200004F RID: 79
	public enum DirectAction
	{
		// Token: 0x040002E4 RID: 740
		Rotate,
		// Token: 0x040002E5 RID: 741
		RotateLocal,
		// Token: 0x040002E6 RID: 742
		Translate,
		// Token: 0x040002E7 RID: 743
		TranslateLocal,
		// Token: 0x040002E8 RID: 744
		Scale,
		// Token: 0x040002E9 RID: 745
		Force,
		// Token: 0x040002EA RID: 746
		RelativeForce,
		// Token: 0x040002EB RID: 747
		Torque,
		// Token: 0x040002EC RID: 748
		RelativeTorque
	}

	// Token: 0x02000050 RID: 80
	public enum AxisInfluenced
	{
		// Token: 0x040002EE RID: 750
		X,
		// Token: 0x040002EF RID: 751
		Y,
		// Token: 0x040002F0 RID: 752
		Z
	}

	// Token: 0x02000051 RID: 81
	public enum AxisRange
	{
		// Token: 0x040002F2 RID: 754
		Classical,
		// Token: 0x040002F3 RID: 755
		Positif
	}

	// Token: 0x02000052 RID: 82
	public enum AxisState
	{
		// Token: 0x040002F5 RID: 757
		None,
		// Token: 0x040002F6 RID: 758
		Down,
		// Token: 0x040002F7 RID: 759
		Press,
		// Token: 0x040002F8 RID: 760
		Up,
		// Token: 0x040002F9 RID: 761
		DownUp,
		// Token: 0x040002FA RID: 762
		DownDown,
		// Token: 0x040002FB RID: 763
		DownLeft,
		// Token: 0x040002FC RID: 764
		DownRight,
		// Token: 0x040002FD RID: 765
		PressUp,
		// Token: 0x040002FE RID: 766
		PressDown,
		// Token: 0x040002FF RID: 767
		PressLeft,
		// Token: 0x04000300 RID: 768
		PressRight
	}

	// Token: 0x02000053 RID: 83
	public enum ActionOn
	{
		// Token: 0x04000302 RID: 770
		Down,
		// Token: 0x04000303 RID: 771
		Press
	}
}
