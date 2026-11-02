using System;
using UnityEngine;

// Token: 0x020000E4 RID: 228
[AddComponentMenu("NGUI/Internal/Property Binding")]
[ExecuteInEditMode]
public class PropertyBinding : MonoBehaviour
{
	// Token: 0x06000695 RID: 1685 RVA: 0x00030DA4 File Offset: 0x0002EFA4
	private void Start()
	{
		this.UpdateTarget();
		if (this.update == PropertyBinding.UpdateCondition.OnStart)
		{
			base.enabled = false;
		}
	}

	// Token: 0x06000696 RID: 1686 RVA: 0x00030DC0 File Offset: 0x0002EFC0
	private void Update()
	{
		if (this.update == PropertyBinding.UpdateCondition.OnUpdate)
		{
			this.UpdateTarget();
		}
	}

	// Token: 0x06000697 RID: 1687 RVA: 0x00030DD4 File Offset: 0x0002EFD4
	private void LateUpdate()
	{
		if (this.update == PropertyBinding.UpdateCondition.OnLateUpdate)
		{
			this.UpdateTarget();
		}
	}

	// Token: 0x06000698 RID: 1688 RVA: 0x00030DE8 File Offset: 0x0002EFE8
	private void FixedUpdate()
	{
		if (this.update == PropertyBinding.UpdateCondition.OnFixedUpdate)
		{
			this.UpdateTarget();
		}
	}

	// Token: 0x06000699 RID: 1689 RVA: 0x00030DFC File Offset: 0x0002EFFC
	private void OnValidate()
	{
		if (this.source != null)
		{
			this.source.Reset();
		}
		if (this.target != null)
		{
			this.target.Reset();
		}
	}

	// Token: 0x0600069A RID: 1690 RVA: 0x00030E38 File Offset: 0x0002F038
	[ContextMenu("Update Now")]
	public void UpdateTarget()
	{
		if (this.source != null && this.target != null && this.source.isValid && this.target.isValid)
		{
			if (this.direction == PropertyBinding.Direction.SourceUpdatesTarget)
			{
				this.target.Set(this.source.Get());
			}
			else if (this.direction == PropertyBinding.Direction.TargetUpdatesSource)
			{
				this.source.Set(this.target.Get());
			}
			else if (this.source.GetPropertyType() == this.target.GetPropertyType())
			{
				object obj = this.source.Get();
				if (this.mLastValue == null || !this.mLastValue.Equals(obj))
				{
					this.mLastValue = obj;
					this.target.Set(obj);
				}
				else
				{
					obj = this.target.Get();
					if (!this.mLastValue.Equals(obj))
					{
						this.mLastValue = obj;
						this.source.Set(obj);
					}
				}
			}
		}
	}

	// Token: 0x04000659 RID: 1625
	public PropertyReference source;

	// Token: 0x0400065A RID: 1626
	public PropertyReference target;

	// Token: 0x0400065B RID: 1627
	public PropertyBinding.Direction direction;

	// Token: 0x0400065C RID: 1628
	public PropertyBinding.UpdateCondition update = PropertyBinding.UpdateCondition.OnUpdate;

	// Token: 0x0400065D RID: 1629
	public bool editMode = true;

	// Token: 0x0400065E RID: 1630
	private object mLastValue;

	// Token: 0x020000E5 RID: 229
	public enum UpdateCondition
	{
		// Token: 0x04000660 RID: 1632
		OnStart,
		// Token: 0x04000661 RID: 1633
		OnUpdate,
		// Token: 0x04000662 RID: 1634
		OnLateUpdate,
		// Token: 0x04000663 RID: 1635
		OnFixedUpdate
	}

	// Token: 0x020000E6 RID: 230
	public enum Direction
	{
		// Token: 0x04000665 RID: 1637
		SourceUpdatesTarget,
		// Token: 0x04000666 RID: 1638
		TargetUpdatesSource,
		// Token: 0x04000667 RID: 1639
		BiDirectional
	}
}
