using System;
using UnityEngine;

// Token: 0x020000F3 RID: 243
public abstract class UIRect : MonoBehaviour
{
	// Token: 0x170000A4 RID: 164
	// (get) Token: 0x0600071B RID: 1819 RVA: 0x00035DAC File Offset: 0x00033FAC
	public GameObject cachedGameObject
	{
		get
		{
			if (this.mGo == null)
			{
				this.mGo = base.gameObject;
			}
			return this.mGo;
		}
	}

	// Token: 0x170000A5 RID: 165
	// (get) Token: 0x0600071C RID: 1820 RVA: 0x00035DD4 File Offset: 0x00033FD4
	public Transform cachedTransform
	{
		get
		{
			if (this.mTrans == null)
			{
				this.mTrans = base.transform;
			}
			return this.mTrans;
		}
	}

	// Token: 0x170000A6 RID: 166
	// (get) Token: 0x0600071D RID: 1821 RVA: 0x00035DFC File Offset: 0x00033FFC
	public Camera anchorCamera
	{
		get
		{
			if (!this.mAnchorsCached)
			{
				this.ResetAnchors();
			}
			return this.mCam;
		}
	}

	// Token: 0x170000A7 RID: 167
	// (get) Token: 0x0600071E RID: 1822 RVA: 0x00035E18 File Offset: 0x00034018
	public bool isFullyAnchored
	{
		get
		{
			return this.leftAnchor.target && this.rightAnchor.target && this.topAnchor.target && this.bottomAnchor.target;
		}
	}

	// Token: 0x170000A8 RID: 168
	// (get) Token: 0x0600071F RID: 1823 RVA: 0x00035E78 File Offset: 0x00034078
	public virtual bool isAnchoredHorizontally
	{
		get
		{
			return this.leftAnchor.target || this.rightAnchor.target;
		}
	}

	// Token: 0x170000A9 RID: 169
	// (get) Token: 0x06000720 RID: 1824 RVA: 0x00035EB0 File Offset: 0x000340B0
	public virtual bool isAnchoredVertically
	{
		get
		{
			return this.bottomAnchor.target || this.topAnchor.target;
		}
	}

	// Token: 0x170000AA RID: 170
	// (get) Token: 0x06000721 RID: 1825 RVA: 0x00035EE8 File Offset: 0x000340E8
	public virtual bool canBeAnchored
	{
		get
		{
			return true;
		}
	}

	// Token: 0x170000AB RID: 171
	// (get) Token: 0x06000722 RID: 1826 RVA: 0x00035EEC File Offset: 0x000340EC
	public UIRect parent
	{
		get
		{
			if (!this.mParentFound)
			{
				this.mParentFound = true;
				this.mParent = NGUITools.FindInParents<UIRect>(this.cachedTransform.parent);
			}
			return this.mParent;
		}
	}

	// Token: 0x170000AC RID: 172
	// (get) Token: 0x06000723 RID: 1827 RVA: 0x00035F28 File Offset: 0x00034128
	public UIRoot root
	{
		get
		{
			if (this.parent != null)
			{
				return this.mParent.root;
			}
			if (!this.mRootSet)
			{
				this.mRootSet = true;
				this.mRoot = NGUITools.FindInParents<UIRoot>(this.cachedTransform);
			}
			return this.mRoot;
		}
	}

	// Token: 0x170000AD RID: 173
	// (get) Token: 0x06000724 RID: 1828 RVA: 0x00035F7C File Offset: 0x0003417C
	public bool isAnchored
	{
		get
		{
			return (this.leftAnchor.target || this.rightAnchor.target || this.topAnchor.target || this.bottomAnchor.target) && this.canBeAnchored;
		}
	}

	// Token: 0x170000AE RID: 174
	// (get) Token: 0x06000725 RID: 1829
	// (set) Token: 0x06000726 RID: 1830
	public abstract float alpha { get; set; }

	// Token: 0x06000727 RID: 1831
	public abstract float CalculateFinalAlpha(int frameID);

	// Token: 0x170000AF RID: 175
	// (get) Token: 0x06000728 RID: 1832
	public abstract Vector3[] localCorners { get; }

	// Token: 0x170000B0 RID: 176
	// (get) Token: 0x06000729 RID: 1833
	public abstract Vector3[] worldCorners { get; }

	// Token: 0x170000B1 RID: 177
	// (get) Token: 0x0600072A RID: 1834 RVA: 0x00035FE8 File Offset: 0x000341E8
	protected float cameraRayDistance
	{
		get
		{
			if (this.anchorCamera == null)
			{
				return 0f;
			}
			if (!this.mCam.orthographic)
			{
				Transform cachedTransform = this.cachedTransform;
				Transform transform = this.mCam.transform;
				Plane plane;
				plane..ctor(cachedTransform.rotation * Vector3.back, cachedTransform.position);
				Ray ray;
				ray..ctor(transform.position, transform.rotation * Vector3.forward);
				float result;
				if (plane.Raycast(ray, ref result))
				{
					return result;
				}
			}
			return Mathf.Lerp(this.mCam.nearClipPlane, this.mCam.farClipPlane, 0.5f);
		}
	}

	// Token: 0x0600072B RID: 1835 RVA: 0x0003609C File Offset: 0x0003429C
	public virtual void Invalidate(bool includeChildren)
	{
		this.mChanged = true;
		if (includeChildren)
		{
			for (int i = 0; i < this.mChildren.size; i++)
			{
				this.mChildren.buffer[i].Invalidate(true);
			}
		}
	}

	// Token: 0x0600072C RID: 1836 RVA: 0x000360E8 File Offset: 0x000342E8
	public virtual Vector3[] GetSides(Transform relativeTo)
	{
		if (this.anchorCamera != null)
		{
			return this.mCam.GetSides(this.cameraRayDistance, relativeTo);
		}
		Vector3 position = this.cachedTransform.position;
		for (int i = 0; i < 4; i++)
		{
			UIRect.mSides[i] = position;
		}
		if (relativeTo != null)
		{
			for (int j = 0; j < 4; j++)
			{
				UIRect.mSides[j] = relativeTo.InverseTransformPoint(UIRect.mSides[j]);
			}
		}
		return UIRect.mSides;
	}

	// Token: 0x0600072D RID: 1837 RVA: 0x00036194 File Offset: 0x00034394
	protected Vector3 GetLocalPos(UIRect.AnchorPoint ac, Transform trans)
	{
		if (this.anchorCamera == null || ac.targetCam == null)
		{
			return this.cachedTransform.localPosition;
		}
		Rect rect = ac.targetCam.rect;
		Vector3 vector = ac.targetCam.WorldToViewportPoint(ac.target.position);
		Vector3 vector2;
		vector2..ctor(vector.x * rect.width + rect.x, vector.y * rect.height + rect.y, vector.z);
		vector2 = this.mCam.ViewportToWorldPoint(vector2);
		if (trans != null)
		{
			vector2 = trans.InverseTransformPoint(vector2);
		}
		vector2.x = Mathf.Floor(vector2.x + 0.5f);
		vector2.y = Mathf.Floor(vector2.y + 0.5f);
		return vector2;
	}

	// Token: 0x0600072E RID: 1838 RVA: 0x00036284 File Offset: 0x00034484
	protected virtual void OnEnable()
	{
		this.mUpdateFrame = -1;
		if (this.updateAnchors == UIRect.AnchorUpdate.OnEnable)
		{
			this.mAnchorsCached = false;
			this.mUpdateAnchors = true;
		}
		if (this.mStarted)
		{
			this.OnInit();
		}
		this.mUpdateFrame = -1;
	}

	// Token: 0x0600072F RID: 1839 RVA: 0x000362CC File Offset: 0x000344CC
	protected virtual void OnInit()
	{
		this.mChanged = true;
		this.mRootSet = false;
		this.mParentFound = false;
		if (this.parent != null)
		{
			this.mParent.mChildren.Add(this);
		}
	}

	// Token: 0x06000730 RID: 1840 RVA: 0x00036308 File Offset: 0x00034508
	protected virtual void OnDisable()
	{
		if (this.mParent)
		{
			this.mParent.mChildren.Remove(this);
		}
		this.mParent = null;
		this.mRoot = null;
		this.mRootSet = false;
		this.mParentFound = false;
	}

	// Token: 0x06000731 RID: 1841 RVA: 0x00036354 File Offset: 0x00034554
	protected virtual void Awake()
	{
		this.mStarted = false;
		this.mGo = base.gameObject;
		this.mTrans = base.transform;
	}

	// Token: 0x06000732 RID: 1842 RVA: 0x00036378 File Offset: 0x00034578
	protected void Start()
	{
		this.mStarted = true;
		this.OnInit();
		this.OnStart();
	}

	// Token: 0x06000733 RID: 1843 RVA: 0x00036390 File Offset: 0x00034590
	public void Update()
	{
		if (!this.mAnchorsCached)
		{
			this.ResetAnchors();
		}
		int frameCount = Time.frameCount;
		if (this.mUpdateFrame != frameCount)
		{
			if (this.updateAnchors == UIRect.AnchorUpdate.OnUpdate || this.mUpdateAnchors)
			{
				this.UpdateAnchorsInternal(frameCount);
			}
			this.OnUpdate();
		}
	}

	// Token: 0x06000734 RID: 1844 RVA: 0x000363E4 File Offset: 0x000345E4
	protected void UpdateAnchorsInternal(int frame)
	{
		this.mUpdateFrame = frame;
		this.mUpdateAnchors = false;
		bool flag = false;
		if (this.leftAnchor.target)
		{
			flag = true;
			if (this.leftAnchor.rect != null && this.leftAnchor.rect.mUpdateFrame != frame)
			{
				this.leftAnchor.rect.Update();
			}
		}
		if (this.bottomAnchor.target)
		{
			flag = true;
			if (this.bottomAnchor.rect != null && this.bottomAnchor.rect.mUpdateFrame != frame)
			{
				this.bottomAnchor.rect.Update();
			}
		}
		if (this.rightAnchor.target)
		{
			flag = true;
			if (this.rightAnchor.rect != null && this.rightAnchor.rect.mUpdateFrame != frame)
			{
				this.rightAnchor.rect.Update();
			}
		}
		if (this.topAnchor.target)
		{
			flag = true;
			if (this.topAnchor.rect != null && this.topAnchor.rect.mUpdateFrame != frame)
			{
				this.topAnchor.rect.Update();
			}
		}
		if (flag)
		{
			this.OnAnchor();
		}
	}

	// Token: 0x06000735 RID: 1845 RVA: 0x0003655C File Offset: 0x0003475C
	public void UpdateAnchors()
	{
		if (this.isAnchored)
		{
			this.mUpdateFrame = -1;
			this.mUpdateAnchors = true;
			this.UpdateAnchorsInternal(Time.frameCount);
		}
	}

	// Token: 0x06000736 RID: 1846
	protected abstract void OnAnchor();

	// Token: 0x06000737 RID: 1847 RVA: 0x00036590 File Offset: 0x00034790
	public void SetAnchor(Transform t)
	{
		this.leftAnchor.target = t;
		this.rightAnchor.target = t;
		this.topAnchor.target = t;
		this.bottomAnchor.target = t;
		this.ResetAnchors();
		this.UpdateAnchors();
	}

	// Token: 0x06000738 RID: 1848 RVA: 0x000365DC File Offset: 0x000347DC
	public void SetAnchor(GameObject go)
	{
		Transform target = (!(go != null)) ? null : go.transform;
		this.leftAnchor.target = target;
		this.rightAnchor.target = target;
		this.topAnchor.target = target;
		this.bottomAnchor.target = target;
		this.ResetAnchors();
		this.UpdateAnchors();
	}

	// Token: 0x06000739 RID: 1849 RVA: 0x00036640 File Offset: 0x00034840
	public void SetAnchor(GameObject go, int left, int bottom, int right, int top)
	{
		Transform target = (!(go != null)) ? null : go.transform;
		this.leftAnchor.target = target;
		this.rightAnchor.target = target;
		this.topAnchor.target = target;
		this.bottomAnchor.target = target;
		this.leftAnchor.relative = 0f;
		this.rightAnchor.relative = 1f;
		this.bottomAnchor.relative = 0f;
		this.topAnchor.relative = 1f;
		this.leftAnchor.absolute = left;
		this.rightAnchor.absolute = right;
		this.bottomAnchor.absolute = bottom;
		this.topAnchor.absolute = top;
		this.ResetAnchors();
		this.UpdateAnchors();
	}

	// Token: 0x0600073A RID: 1850 RVA: 0x00036714 File Offset: 0x00034914
	public void SetAnchor(GameObject go, float left, float bottom, float right, float top)
	{
		Transform target = (!(go != null)) ? null : go.transform;
		this.leftAnchor.target = target;
		this.rightAnchor.target = target;
		this.topAnchor.target = target;
		this.bottomAnchor.target = target;
		this.leftAnchor.relative = left;
		this.rightAnchor.relative = right;
		this.bottomAnchor.relative = bottom;
		this.topAnchor.relative = top;
		this.leftAnchor.absolute = 0;
		this.rightAnchor.absolute = 0;
		this.bottomAnchor.absolute = 0;
		this.topAnchor.absolute = 0;
		this.ResetAnchors();
		this.UpdateAnchors();
	}

	// Token: 0x0600073B RID: 1851 RVA: 0x000367D8 File Offset: 0x000349D8
	public void SetAnchor(GameObject go, float left, int leftOffset, float bottom, int bottomOffset, float right, int rightOffset, float top, int topOffset)
	{
		Transform target = (!(go != null)) ? null : go.transform;
		this.leftAnchor.target = target;
		this.rightAnchor.target = target;
		this.topAnchor.target = target;
		this.bottomAnchor.target = target;
		this.leftAnchor.relative = left;
		this.rightAnchor.relative = right;
		this.bottomAnchor.relative = bottom;
		this.topAnchor.relative = top;
		this.leftAnchor.absolute = leftOffset;
		this.rightAnchor.absolute = rightOffset;
		this.bottomAnchor.absolute = bottomOffset;
		this.topAnchor.absolute = topOffset;
		this.ResetAnchors();
		this.UpdateAnchors();
	}

	// Token: 0x0600073C RID: 1852 RVA: 0x000368A0 File Offset: 0x00034AA0
	public void SetAnchor(float left, int leftOffset, float bottom, int bottomOffset, float right, int rightOffset, float top, int topOffset)
	{
		Transform parent = this.cachedTransform.parent;
		this.leftAnchor.target = parent;
		this.rightAnchor.target = parent;
		this.topAnchor.target = parent;
		this.bottomAnchor.target = parent;
		this.leftAnchor.relative = left;
		this.rightAnchor.relative = right;
		this.bottomAnchor.relative = bottom;
		this.topAnchor.relative = top;
		this.leftAnchor.absolute = leftOffset;
		this.rightAnchor.absolute = rightOffset;
		this.bottomAnchor.absolute = bottomOffset;
		this.topAnchor.absolute = topOffset;
		this.ResetAnchors();
		this.UpdateAnchors();
	}

	// Token: 0x0600073D RID: 1853 RVA: 0x0003695C File Offset: 0x00034B5C
	public void SetScreenRect(int left, int top, int width, int height)
	{
		this.SetAnchor(0f, left, 1f, -top - height, 0f, left + width, 1f, -top);
	}

	// Token: 0x0600073E RID: 1854 RVA: 0x00036990 File Offset: 0x00034B90
	public void ResetAnchors()
	{
		this.mAnchorsCached = true;
		this.leftAnchor.rect = ((!this.leftAnchor.target) ? null : this.leftAnchor.target.GetComponent<UIRect>());
		this.bottomAnchor.rect = ((!this.bottomAnchor.target) ? null : this.bottomAnchor.target.GetComponent<UIRect>());
		this.rightAnchor.rect = ((!this.rightAnchor.target) ? null : this.rightAnchor.target.GetComponent<UIRect>());
		this.topAnchor.rect = ((!this.topAnchor.target) ? null : this.topAnchor.target.GetComponent<UIRect>());
		this.mCam = NGUITools.FindCameraForLayer(this.cachedGameObject.layer);
		this.FindCameraFor(this.leftAnchor);
		this.FindCameraFor(this.bottomAnchor);
		this.FindCameraFor(this.rightAnchor);
		this.FindCameraFor(this.topAnchor);
		this.mUpdateAnchors = true;
	}

	// Token: 0x0600073F RID: 1855 RVA: 0x00036ACC File Offset: 0x00034CCC
	public void ResetAndUpdateAnchors()
	{
		this.ResetAnchors();
		this.UpdateAnchors();
	}

	// Token: 0x06000740 RID: 1856
	public abstract void SetRect(float x, float y, float width, float height);

	// Token: 0x06000741 RID: 1857 RVA: 0x00036ADC File Offset: 0x00034CDC
	private void FindCameraFor(UIRect.AnchorPoint ap)
	{
		if (ap.target == null || ap.rect != null)
		{
			ap.targetCam = null;
		}
		else
		{
			ap.targetCam = NGUITools.FindCameraForLayer(ap.target.gameObject.layer);
		}
	}

	// Token: 0x06000742 RID: 1858 RVA: 0x00036B34 File Offset: 0x00034D34
	public virtual void ParentHasChanged()
	{
		this.mParentFound = false;
		UIRect uirect = NGUITools.FindInParents<UIRect>(this.cachedTransform.parent);
		if (this.mParent != uirect)
		{
			if (this.mParent)
			{
				this.mParent.mChildren.Remove(this);
			}
			this.mParent = uirect;
			if (this.mParent)
			{
				this.mParent.mChildren.Add(this);
			}
			this.mRootSet = false;
		}
	}

	// Token: 0x06000743 RID: 1859
	protected abstract void OnStart();

	// Token: 0x06000744 RID: 1860 RVA: 0x00036BBC File Offset: 0x00034DBC
	protected virtual void OnUpdate()
	{
	}

	// Token: 0x040006D8 RID: 1752
	public UIRect.AnchorPoint leftAnchor = new UIRect.AnchorPoint();

	// Token: 0x040006D9 RID: 1753
	public UIRect.AnchorPoint rightAnchor = new UIRect.AnchorPoint(1f);

	// Token: 0x040006DA RID: 1754
	public UIRect.AnchorPoint bottomAnchor = new UIRect.AnchorPoint();

	// Token: 0x040006DB RID: 1755
	public UIRect.AnchorPoint topAnchor = new UIRect.AnchorPoint(1f);

	// Token: 0x040006DC RID: 1756
	public UIRect.AnchorUpdate updateAnchors = UIRect.AnchorUpdate.OnUpdate;

	// Token: 0x040006DD RID: 1757
	[NonSerialized]
	protected GameObject mGo;

	// Token: 0x040006DE RID: 1758
	[NonSerialized]
	protected Transform mTrans;

	// Token: 0x040006DF RID: 1759
	[NonSerialized]
	protected BetterList<UIRect> mChildren = new BetterList<UIRect>();

	// Token: 0x040006E0 RID: 1760
	[NonSerialized]
	protected bool mChanged = true;

	// Token: 0x040006E1 RID: 1761
	[NonSerialized]
	protected bool mParentFound;

	// Token: 0x040006E2 RID: 1762
	[NonSerialized]
	private bool mUpdateAnchors = true;

	// Token: 0x040006E3 RID: 1763
	[NonSerialized]
	private int mUpdateFrame = -1;

	// Token: 0x040006E4 RID: 1764
	[NonSerialized]
	private bool mAnchorsCached;

	// Token: 0x040006E5 RID: 1765
	[NonSerialized]
	private UIRoot mRoot;

	// Token: 0x040006E6 RID: 1766
	[NonSerialized]
	private UIRect mParent;

	// Token: 0x040006E7 RID: 1767
	[NonSerialized]
	private bool mRootSet;

	// Token: 0x040006E8 RID: 1768
	[NonSerialized]
	protected Camera mCam;

	// Token: 0x040006E9 RID: 1769
	protected bool mStarted;

	// Token: 0x040006EA RID: 1770
	[NonSerialized]
	public float finalAlpha = 1f;

	// Token: 0x040006EB RID: 1771
	protected static Vector3[] mSides = new Vector3[4];

	// Token: 0x020000F4 RID: 244
	[Serializable]
	public class AnchorPoint
	{
		// Token: 0x06000745 RID: 1861 RVA: 0x00036BC0 File Offset: 0x00034DC0
		public AnchorPoint()
		{
		}

		// Token: 0x06000746 RID: 1862 RVA: 0x00036BC8 File Offset: 0x00034DC8
		public AnchorPoint(float relative)
		{
			this.relative = relative;
		}

		// Token: 0x06000747 RID: 1863 RVA: 0x00036BD8 File Offset: 0x00034DD8
		public void Set(float relative, float absolute)
		{
			this.relative = relative;
			this.absolute = Mathf.FloorToInt(absolute + 0.5f);
		}

		// Token: 0x06000748 RID: 1864 RVA: 0x00036BF4 File Offset: 0x00034DF4
		public void Set(Transform target, float relative, float absolute)
		{
			this.target = target;
			this.relative = relative;
			this.absolute = Mathf.FloorToInt(absolute + 0.5f);
		}

		// Token: 0x06000749 RID: 1865 RVA: 0x00036C24 File Offset: 0x00034E24
		public void SetToNearest(float abs0, float abs1, float abs2)
		{
			this.SetToNearest(0f, 0.5f, 1f, abs0, abs1, abs2);
		}

		// Token: 0x0600074A RID: 1866 RVA: 0x00036C40 File Offset: 0x00034E40
		public void SetToNearest(float rel0, float rel1, float rel2, float abs0, float abs1, float abs2)
		{
			float num = Mathf.Abs(abs0);
			float num2 = Mathf.Abs(abs1);
			float num3 = Mathf.Abs(abs2);
			if (num < num2 && num < num3)
			{
				this.Set(rel0, abs0);
			}
			else if (num2 < num && num2 < num3)
			{
				this.Set(rel1, abs1);
			}
			else
			{
				this.Set(rel2, abs2);
			}
		}

		// Token: 0x0600074B RID: 1867 RVA: 0x00036CA8 File Offset: 0x00034EA8
		public void SetHorizontal(Transform parent, float localPos)
		{
			if (this.rect)
			{
				Vector3[] sides = this.rect.GetSides(parent);
				float num = Mathf.Lerp(sides[0].x, sides[2].x, this.relative);
				this.absolute = Mathf.FloorToInt(localPos - num + 0.5f);
			}
			else
			{
				Vector3 vector = this.target.position;
				if (parent != null)
				{
					vector = parent.InverseTransformPoint(vector);
				}
				this.absolute = Mathf.FloorToInt(localPos - vector.x + 0.5f);
			}
		}

		// Token: 0x0600074C RID: 1868 RVA: 0x00036D4C File Offset: 0x00034F4C
		public void SetVertical(Transform parent, float localPos)
		{
			if (this.rect)
			{
				Vector3[] sides = this.rect.GetSides(parent);
				float num = Mathf.Lerp(sides[3].y, sides[1].y, this.relative);
				this.absolute = Mathf.FloorToInt(localPos - num + 0.5f);
			}
			else
			{
				Vector3 vector = this.target.position;
				if (parent != null)
				{
					vector = parent.InverseTransformPoint(vector);
				}
				this.absolute = Mathf.FloorToInt(localPos - vector.y + 0.5f);
			}
		}

		// Token: 0x0600074D RID: 1869 RVA: 0x00036DF0 File Offset: 0x00034FF0
		public Vector3[] GetSides(Transform relativeTo)
		{
			if (this.target != null)
			{
				if (this.rect != null)
				{
					return this.rect.GetSides(relativeTo);
				}
				if (this.target.GetComponent<Camera>() != null)
				{
					return this.target.GetComponent<Camera>().GetSides(relativeTo);
				}
			}
			return null;
		}

		// Token: 0x040006EC RID: 1772
		public Transform target;

		// Token: 0x040006ED RID: 1773
		public float relative;

		// Token: 0x040006EE RID: 1774
		public int absolute;

		// Token: 0x040006EF RID: 1775
		[NonSerialized]
		public UIRect rect;

		// Token: 0x040006F0 RID: 1776
		[NonSerialized]
		public Camera targetCam;
	}

	// Token: 0x020000F5 RID: 245
	public enum AnchorUpdate
	{
		// Token: 0x040006F2 RID: 1778
		OnEnable,
		// Token: 0x040006F3 RID: 1779
		OnUpdate,
		// Token: 0x040006F4 RID: 1780
		OnStart
	}
}
