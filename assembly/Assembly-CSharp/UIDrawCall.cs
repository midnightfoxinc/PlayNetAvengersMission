using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000EF RID: 239
[AddComponentMenu("NGUI/Internal/Draw Call")]
[ExecuteInEditMode]
public class UIDrawCall : MonoBehaviour
{
	// Token: 0x17000093 RID: 147
	// (get) Token: 0x060006DA RID: 1754 RVA: 0x00034184 File Offset: 0x00032384
	[Obsolete("Use UIDrawCall.activeList")]
	public static BetterList<UIDrawCall> list
	{
		get
		{
			return UIDrawCall.mActiveList;
		}
	}

	// Token: 0x17000094 RID: 148
	// (get) Token: 0x060006DB RID: 1755 RVA: 0x0003418C File Offset: 0x0003238C
	public static BetterList<UIDrawCall> activeList
	{
		get
		{
			return UIDrawCall.mActiveList;
		}
	}

	// Token: 0x17000095 RID: 149
	// (get) Token: 0x060006DC RID: 1756 RVA: 0x00034194 File Offset: 0x00032394
	public static BetterList<UIDrawCall> inactiveList
	{
		get
		{
			return UIDrawCall.mInactiveList;
		}
	}

	// Token: 0x17000096 RID: 150
	// (get) Token: 0x060006DD RID: 1757 RVA: 0x0003419C File Offset: 0x0003239C
	// (set) Token: 0x060006DE RID: 1758 RVA: 0x000341A4 File Offset: 0x000323A4
	public int renderQueue
	{
		get
		{
			return this.mRenderQueue;
		}
		set
		{
			if (this.mRenderQueue != value)
			{
				this.mRenderQueue = value;
				if (this.mDynamicMat != null)
				{
					this.mDynamicMat.renderQueue = value;
				}
			}
		}
	}

	// Token: 0x17000097 RID: 151
	// (get) Token: 0x060006DF RID: 1759 RVA: 0x000341E4 File Offset: 0x000323E4
	// (set) Token: 0x060006E0 RID: 1760 RVA: 0x00034214 File Offset: 0x00032414
	public int sortingOrder
	{
		get
		{
			return (!(this.mRenderer != null)) ? 0 : this.mRenderer.sortingOrder;
		}
		set
		{
			if (this.mRenderer != null && this.mRenderer.sortingOrder != value)
			{
				this.mRenderer.sortingOrder = value;
			}
		}
	}

	// Token: 0x17000098 RID: 152
	// (get) Token: 0x060006E1 RID: 1761 RVA: 0x00034250 File Offset: 0x00032450
	// (set) Token: 0x060006E2 RID: 1762 RVA: 0x00034280 File Offset: 0x00032480
	public string sortingLayerName
	{
		get
		{
			return (!(this.mRenderer != null)) ? null : this.mRenderer.sortingLayerName;
		}
		set
		{
			if (this.mRenderer != null && this.mRenderer.sortingLayerName != value)
			{
				this.mRenderer.sortingLayerName = value;
			}
		}
	}

	// Token: 0x17000099 RID: 153
	// (get) Token: 0x060006E3 RID: 1763 RVA: 0x000342B8 File Offset: 0x000324B8
	public int finalRenderQueue
	{
		get
		{
			return (!(this.mDynamicMat != null)) ? this.mRenderQueue : this.mDynamicMat.renderQueue;
		}
	}

	// Token: 0x1700009A RID: 154
	// (get) Token: 0x060006E4 RID: 1764 RVA: 0x000342E4 File Offset: 0x000324E4
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

	// Token: 0x1700009B RID: 155
	// (get) Token: 0x060006E5 RID: 1765 RVA: 0x0003430C File Offset: 0x0003250C
	// (set) Token: 0x060006E6 RID: 1766 RVA: 0x00034314 File Offset: 0x00032514
	public Material baseMaterial
	{
		get
		{
			return this.mMaterial;
		}
		set
		{
			if (this.mMaterial != value)
			{
				this.mMaterial = value;
				this.mRebuildMat = true;
			}
		}
	}

	// Token: 0x1700009C RID: 156
	// (get) Token: 0x060006E7 RID: 1767 RVA: 0x00034338 File Offset: 0x00032538
	public Material dynamicMaterial
	{
		get
		{
			return this.mDynamicMat;
		}
	}

	// Token: 0x1700009D RID: 157
	// (get) Token: 0x060006E8 RID: 1768 RVA: 0x00034340 File Offset: 0x00032540
	// (set) Token: 0x060006E9 RID: 1769 RVA: 0x00034348 File Offset: 0x00032548
	public Texture mainTexture
	{
		get
		{
			return this.mTexture;
		}
		set
		{
			this.mTexture = value;
			if (this.mDynamicMat != null)
			{
				this.mDynamicMat.mainTexture = value;
			}
		}
	}

	// Token: 0x1700009E RID: 158
	// (get) Token: 0x060006EA RID: 1770 RVA: 0x0003437C File Offset: 0x0003257C
	// (set) Token: 0x060006EB RID: 1771 RVA: 0x00034384 File Offset: 0x00032584
	public Shader shader
	{
		get
		{
			return this.mShader;
		}
		set
		{
			if (this.mShader != value)
			{
				this.mShader = value;
				this.mRebuildMat = true;
			}
		}
	}

	// Token: 0x1700009F RID: 159
	// (get) Token: 0x060006EC RID: 1772 RVA: 0x000343A8 File Offset: 0x000325A8
	public int triangles
	{
		get
		{
			return (!(this.mMesh != null)) ? 0 : this.mTriangles;
		}
	}

	// Token: 0x170000A0 RID: 160
	// (get) Token: 0x060006ED RID: 1773 RVA: 0x000343C8 File Offset: 0x000325C8
	public bool isClipped
	{
		get
		{
			return this.mClipCount != 0;
		}
	}

	// Token: 0x060006EE RID: 1774 RVA: 0x000343D8 File Offset: 0x000325D8
	private void CreateMaterial()
	{
		this.mTextureClip = false;
		this.mLegacyShader = false;
		this.mClipCount = ((!(this.panel != null)) ? 0 : this.panel.clipCount);
		string text = (!(this.mShader != null)) ? ((!(this.mMaterial != null)) ? "Unlit/Transparent Colored" : this.mMaterial.shader.name) : this.mShader.name;
		text = text.Replace("GUI/Text Shader", "Unlit/Text");
		if (text.Length > 2 && text.get_Chars(text.Length - 2) == ' ')
		{
			int num = (int)text.get_Chars(text.Length - 1);
			if (num > 48 && num <= 57)
			{
				text = text.Substring(0, text.Length - 2);
			}
		}
		if (text.StartsWith("Hidden/"))
		{
			text = text.Substring(7);
		}
		text = text.Replace(" (SoftClip)", string.Empty);
		text = text.Replace(" (TextureClip)", string.Empty);
		if (this.panel != null && this.panel.clipping == UIDrawCall.Clipping.TextureMask)
		{
			this.mTextureClip = true;
			this.shader = Shader.Find("Hidden/" + text + " (TextureClip)");
		}
		else if (this.mClipCount != 0)
		{
			this.shader = Shader.Find(string.Concat(new object[]
			{
				"Hidden/",
				text,
				" ",
				this.mClipCount
			}));
			if (this.shader == null)
			{
				this.shader = Shader.Find(text + " " + this.mClipCount);
			}
			if (this.shader == null && this.mClipCount == 1)
			{
				this.mLegacyShader = true;
				this.shader = Shader.Find(text + " (SoftClip)");
			}
		}
		else
		{
			this.shader = Shader.Find(text);
		}
		if (this.shader == null)
		{
			this.shader = Shader.Find("Unlit/Transparent Colored");
		}
		if (this.mMaterial != null)
		{
			this.mDynamicMat = new Material(this.mMaterial);
			this.mDynamicMat.name = "[NGUI] " + this.mMaterial.name;
			this.mDynamicMat.hideFlags = 60;
			this.mDynamicMat.CopyPropertiesFromMaterial(this.mMaterial);
			string[] shaderKeywords = this.mMaterial.shaderKeywords;
			for (int i = 0; i < shaderKeywords.Length; i++)
			{
				this.mDynamicMat.EnableKeyword(shaderKeywords[i]);
			}
			if (this.shader != null)
			{
				this.mDynamicMat.shader = this.shader;
			}
			else if (this.mClipCount != 0)
			{
				Debug.LogError(string.Concat(new object[]
				{
					text,
					" shader doesn't have a clipped shader version for ",
					this.mClipCount,
					" clip regions"
				}));
			}
		}
		else
		{
			this.mDynamicMat = new Material(this.shader);
			this.mDynamicMat.name = "[NGUI] " + this.shader.name;
			this.mDynamicMat.hideFlags = 60;
		}
	}

	// Token: 0x060006EF RID: 1775 RVA: 0x0003476C File Offset: 0x0003296C
	private Material RebuildMaterial()
	{
		NGUITools.DestroyImmediate(this.mDynamicMat);
		this.CreateMaterial();
		this.mDynamicMat.renderQueue = this.mRenderQueue;
		if (this.mTexture != null)
		{
			this.mDynamicMat.mainTexture = this.mTexture;
		}
		if (this.mRenderer != null)
		{
			this.mRenderer.sharedMaterials = new Material[]
			{
				this.mDynamicMat
			};
		}
		return this.mDynamicMat;
	}

	// Token: 0x060006F0 RID: 1776 RVA: 0x000347F0 File Offset: 0x000329F0
	private void UpdateMaterials()
	{
		if (this.panel == null)
		{
			return;
		}
		if (this.mRebuildMat || this.mDynamicMat == null || this.mClipCount != this.panel.clipCount || this.mTextureClip != (this.panel.clipping == UIDrawCall.Clipping.TextureMask))
		{
			this.RebuildMaterial();
			this.mRebuildMat = false;
		}
		else if (this.mRenderer.sharedMaterial != this.mDynamicMat)
		{
			this.mRenderer.sharedMaterials = new Material[]
			{
				this.mDynamicMat
			};
		}
	}

	// Token: 0x060006F1 RID: 1777 RVA: 0x000348A4 File Offset: 0x00032AA4
	public void UpdateGeometry(int widgetCount)
	{
		this.widgetCount = widgetCount;
		int size = this.verts.size;
		if (size > 0 && size == this.uvs.size && size == this.cols.size && size % 4 == 0)
		{
			if (this.mFilter == null)
			{
				this.mFilter = base.gameObject.GetComponent<MeshFilter>();
			}
			if (this.mFilter == null)
			{
				this.mFilter = base.gameObject.AddComponent<MeshFilter>();
			}
			if (this.verts.size < 65000)
			{
				int num = (size >> 1) * 3;
				bool flag = this.mIndices == null || this.mIndices.Length != num;
				if (this.mMesh == null)
				{
					this.mMesh = new Mesh();
					this.mMesh.hideFlags = 52;
					this.mMesh.name = ((!(this.mMaterial != null)) ? "[NGUI] Mesh" : ("[NGUI] " + this.mMaterial.name));
					this.mMesh.MarkDynamic();
					flag = true;
				}
				bool flag2 = this.uvs.buffer.Length != this.verts.buffer.Length || this.cols.buffer.Length != this.verts.buffer.Length || (this.norms.buffer != null && this.norms.buffer.Length != this.verts.buffer.Length) || (this.tans.buffer != null && this.tans.buffer.Length != this.verts.buffer.Length);
				if (!flag2 && this.panel != null && this.panel.renderQueue != UIPanel.RenderQueue.Automatic)
				{
					flag2 = (this.mMesh == null || this.mMesh.vertexCount != this.verts.buffer.Length);
				}
				this.mTriangles = this.verts.size >> 1;
				if (flag2 || this.verts.buffer.Length > 65000)
				{
					if (flag2 || this.mMesh.vertexCount != this.verts.size)
					{
						this.mMesh.Clear();
						flag = true;
					}
					this.mMesh.vertices = this.verts.ToArray();
					this.mMesh.uv = this.uvs.ToArray();
					this.mMesh.colors32 = this.cols.ToArray();
					if (this.norms != null)
					{
						this.mMesh.normals = this.norms.ToArray();
					}
					if (this.tans != null)
					{
						this.mMesh.tangents = this.tans.ToArray();
					}
				}
				else
				{
					if (this.mMesh.vertexCount != this.verts.buffer.Length)
					{
						this.mMesh.Clear();
						flag = true;
					}
					this.mMesh.vertices = this.verts.buffer;
					this.mMesh.uv = this.uvs.buffer;
					this.mMesh.colors32 = this.cols.buffer;
					if (this.norms != null)
					{
						this.mMesh.normals = this.norms.buffer;
					}
					if (this.tans != null)
					{
						this.mMesh.tangents = this.tans.buffer;
					}
				}
				if (flag)
				{
					this.mIndices = this.GenerateCachedIndexBuffer(size, num);
					this.mMesh.triangles = this.mIndices;
				}
				if (flag2 || !this.alwaysOnScreen)
				{
					this.mMesh.RecalculateBounds();
				}
				this.mFilter.mesh = this.mMesh;
			}
			else
			{
				this.mTriangles = 0;
				if (this.mFilter.mesh != null)
				{
					this.mFilter.mesh.Clear();
				}
				Debug.LogError("Too many vertices on one panel: " + this.verts.size);
			}
			if (this.mRenderer == null)
			{
				this.mRenderer = base.gameObject.GetComponent<MeshRenderer>();
			}
			if (this.mRenderer == null)
			{
				this.mRenderer = base.gameObject.AddComponent<MeshRenderer>();
			}
			this.UpdateMaterials();
		}
		else
		{
			if (this.mFilter.mesh != null)
			{
				this.mFilter.mesh.Clear();
			}
			Debug.LogError("UIWidgets must fill the buffer with 4 vertices per quad. Found " + size);
		}
		this.verts.Clear();
		this.uvs.Clear();
		this.cols.Clear();
		this.norms.Clear();
		this.tans.Clear();
	}

	// Token: 0x060006F2 RID: 1778 RVA: 0x00034DD8 File Offset: 0x00032FD8
	private int[] GenerateCachedIndexBuffer(int vertexCount, int indexCount)
	{
		int i = 0;
		int count = UIDrawCall.mCache.Count;
		while (i < count)
		{
			int[] array = UIDrawCall.mCache[i];
			if (array != null && array.Length == indexCount)
			{
				return array;
			}
			i++;
		}
		int[] array2 = new int[indexCount];
		int num = 0;
		for (int j = 0; j < vertexCount; j += 4)
		{
			array2[num++] = j;
			array2[num++] = j + 1;
			array2[num++] = j + 2;
			array2[num++] = j + 2;
			array2[num++] = j + 3;
			array2[num++] = j;
		}
		if (UIDrawCall.mCache.Count > 10)
		{
			UIDrawCall.mCache.RemoveAt(0);
		}
		UIDrawCall.mCache.Add(array2);
		return array2;
	}

	// Token: 0x060006F3 RID: 1779 RVA: 0x00034EB4 File Offset: 0x000330B4
	private void OnWillRenderObject()
	{
		this.UpdateMaterials();
		if (this.onRender != null)
		{
			this.onRender(this.mDynamicMat ?? this.mMaterial);
		}
		if (this.mDynamicMat == null || this.mClipCount == 0)
		{
			return;
		}
		if (this.mTextureClip)
		{
			Vector4 drawCallClipRange = this.panel.drawCallClipRange;
			Vector2 clipSoftness = this.panel.clipSoftness;
			Vector2 vector;
			vector..ctor(1000f, 1000f);
			if (clipSoftness.x > 0f)
			{
				vector.x = drawCallClipRange.z / clipSoftness.x;
			}
			if (clipSoftness.y > 0f)
			{
				vector.y = drawCallClipRange.w / clipSoftness.y;
			}
			this.mDynamicMat.SetVector(UIDrawCall.ClipRange[0], new Vector4(-drawCallClipRange.x / drawCallClipRange.z, -drawCallClipRange.y / drawCallClipRange.w, 1f / drawCallClipRange.z, 1f / drawCallClipRange.w));
			this.mDynamicMat.SetTexture("_ClipTex", this.clipTexture);
		}
		else if (!this.mLegacyShader)
		{
			UIPanel parentPanel = this.panel;
			int num = 0;
			while (parentPanel != null)
			{
				if (parentPanel.hasClipping)
				{
					float angle = 0f;
					Vector4 drawCallClipRange2 = parentPanel.drawCallClipRange;
					if (parentPanel != this.panel)
					{
						Vector3 vector2 = parentPanel.cachedTransform.InverseTransformPoint(this.panel.cachedTransform.position);
						drawCallClipRange2.x -= vector2.x;
						drawCallClipRange2.y -= vector2.y;
						Vector3 eulerAngles = this.panel.cachedTransform.rotation.eulerAngles;
						Vector3 eulerAngles2 = parentPanel.cachedTransform.rotation.eulerAngles;
						Vector3 vector3 = eulerAngles2 - eulerAngles;
						vector3.x = NGUIMath.WrapAngle(vector3.x);
						vector3.y = NGUIMath.WrapAngle(vector3.y);
						vector3.z = NGUIMath.WrapAngle(vector3.z);
						if (Mathf.Abs(vector3.x) > 0.001f || Mathf.Abs(vector3.y) > 0.001f)
						{
							Debug.LogWarning("Panel can only be clipped properly if X and Y rotation is left at 0", this.panel);
						}
						angle = vector3.z;
					}
					this.SetClipping(num++, drawCallClipRange2, parentPanel.clipSoftness, angle);
				}
				parentPanel = parentPanel.parentPanel;
			}
		}
		else
		{
			Vector2 clipSoftness2 = this.panel.clipSoftness;
			Vector4 drawCallClipRange3 = this.panel.drawCallClipRange;
			Vector2 mainTextureOffset;
			mainTextureOffset..ctor(-drawCallClipRange3.x / drawCallClipRange3.z, -drawCallClipRange3.y / drawCallClipRange3.w);
			Vector2 mainTextureScale;
			mainTextureScale..ctor(1f / drawCallClipRange3.z, 1f / drawCallClipRange3.w);
			Vector2 vector4;
			vector4..ctor(1000f, 1000f);
			if (clipSoftness2.x > 0f)
			{
				vector4.x = drawCallClipRange3.z / clipSoftness2.x;
			}
			if (clipSoftness2.y > 0f)
			{
				vector4.y = drawCallClipRange3.w / clipSoftness2.y;
			}
			this.mDynamicMat.mainTextureOffset = mainTextureOffset;
			this.mDynamicMat.mainTextureScale = mainTextureScale;
			this.mDynamicMat.SetVector("_ClipSharpness", vector4);
		}
	}

	// Token: 0x060006F4 RID: 1780 RVA: 0x00035264 File Offset: 0x00033464
	private void SetClipping(int index, Vector4 cr, Vector2 soft, float angle)
	{
		angle *= -0.017453292f;
		Vector2 vector;
		vector..ctor(1000f, 1000f);
		if (soft.x > 0f)
		{
			vector.x = cr.z / soft.x;
		}
		if (soft.y > 0f)
		{
			vector.y = cr.w / soft.y;
		}
		if (index < UIDrawCall.ClipRange.Length)
		{
			this.mDynamicMat.SetVector(UIDrawCall.ClipRange[index], new Vector4(-cr.x / cr.z, -cr.y / cr.w, 1f / cr.z, 1f / cr.w));
			this.mDynamicMat.SetVector(UIDrawCall.ClipArgs[index], new Vector4(vector.x, vector.y, Mathf.Sin(angle), Mathf.Cos(angle)));
		}
	}

	// Token: 0x060006F5 RID: 1781 RVA: 0x0003536C File Offset: 0x0003356C
	private void Awake()
	{
		if (UIDrawCall.ClipRange == null)
		{
			UIDrawCall.ClipRange = new int[]
			{
				Shader.PropertyToID("_ClipRange0"),
				Shader.PropertyToID("_ClipRange1"),
				Shader.PropertyToID("_ClipRange2"),
				Shader.PropertyToID("_ClipRange4")
			};
		}
		if (UIDrawCall.ClipArgs == null)
		{
			UIDrawCall.ClipArgs = new int[]
			{
				Shader.PropertyToID("_ClipArgs0"),
				Shader.PropertyToID("_ClipArgs1"),
				Shader.PropertyToID("_ClipArgs2"),
				Shader.PropertyToID("_ClipArgs3")
			};
		}
	}

	// Token: 0x060006F6 RID: 1782 RVA: 0x0003540C File Offset: 0x0003360C
	private void OnEnable()
	{
		this.mRebuildMat = true;
	}

	// Token: 0x060006F7 RID: 1783 RVA: 0x00035418 File Offset: 0x00033618
	private void OnDisable()
	{
		this.depthStart = int.MaxValue;
		this.depthEnd = int.MinValue;
		this.panel = null;
		this.manager = null;
		this.mMaterial = null;
		this.mTexture = null;
		this.clipTexture = null;
		if (this.mRenderer != null)
		{
			this.mRenderer.sharedMaterials = new Material[0];
		}
		NGUITools.DestroyImmediate(this.mDynamicMat);
		this.mDynamicMat = null;
	}

	// Token: 0x060006F8 RID: 1784 RVA: 0x00035494 File Offset: 0x00033694
	private void OnDestroy()
	{
		NGUITools.DestroyImmediate(this.mMesh);
		this.mMesh = null;
	}

	// Token: 0x060006F9 RID: 1785 RVA: 0x000354A8 File Offset: 0x000336A8
	public static UIDrawCall Create(UIPanel panel, Material mat, Texture tex, Shader shader)
	{
		return UIDrawCall.Create(null, panel, mat, tex, shader);
	}

	// Token: 0x060006FA RID: 1786 RVA: 0x000354B4 File Offset: 0x000336B4
	private static UIDrawCall Create(string name, UIPanel pan, Material mat, Texture tex, Shader shader)
	{
		UIDrawCall uidrawCall = UIDrawCall.Create(name);
		uidrawCall.gameObject.layer = pan.cachedGameObject.layer;
		uidrawCall.baseMaterial = mat;
		uidrawCall.mainTexture = tex;
		uidrawCall.shader = shader;
		uidrawCall.renderQueue = pan.startingRenderQueue;
		uidrawCall.sortingOrder = pan.sortingOrder;
		uidrawCall.manager = pan;
		return uidrawCall;
	}

	// Token: 0x060006FB RID: 1787 RVA: 0x00035514 File Offset: 0x00033714
	private static UIDrawCall Create(string name)
	{
		while (UIDrawCall.mInactiveList.size > 0)
		{
			UIDrawCall uidrawCall = UIDrawCall.mInactiveList.Pop();
			if (uidrawCall != null)
			{
				UIDrawCall.mActiveList.Add(uidrawCall);
				if (name != null)
				{
					uidrawCall.name = name;
				}
				NGUITools.SetActive(uidrawCall.gameObject, true);
				return uidrawCall;
			}
		}
		GameObject gameObject = new GameObject(name);
		Object.DontDestroyOnLoad(gameObject);
		UIDrawCall uidrawCall2 = gameObject.AddComponent<UIDrawCall>();
		UIDrawCall.mActiveList.Add(uidrawCall2);
		return uidrawCall2;
	}

	// Token: 0x060006FC RID: 1788 RVA: 0x00035594 File Offset: 0x00033794
	public static void ClearAll()
	{
		bool isPlaying = Application.isPlaying;
		int i = UIDrawCall.mActiveList.size;
		while (i > 0)
		{
			UIDrawCall uidrawCall = UIDrawCall.mActiveList[--i];
			if (uidrawCall)
			{
				if (isPlaying)
				{
					NGUITools.SetActive(uidrawCall.gameObject, false);
				}
				else
				{
					NGUITools.DestroyImmediate(uidrawCall.gameObject);
				}
			}
		}
		UIDrawCall.mActiveList.Clear();
	}

	// Token: 0x060006FD RID: 1789 RVA: 0x00035608 File Offset: 0x00033808
	public static void ReleaseAll()
	{
		UIDrawCall.ClearAll();
		UIDrawCall.ReleaseInactive();
	}

	// Token: 0x060006FE RID: 1790 RVA: 0x00035614 File Offset: 0x00033814
	public static void ReleaseInactive()
	{
		int i = UIDrawCall.mInactiveList.size;
		while (i > 0)
		{
			UIDrawCall uidrawCall = UIDrawCall.mInactiveList[--i];
			if (uidrawCall)
			{
				NGUITools.DestroyImmediate(uidrawCall.gameObject);
			}
		}
		UIDrawCall.mInactiveList.Clear();
	}

	// Token: 0x060006FF RID: 1791 RVA: 0x00035668 File Offset: 0x00033868
	public static int Count(UIPanel panel)
	{
		int num = 0;
		for (int i = 0; i < UIDrawCall.mActiveList.size; i++)
		{
			if (UIDrawCall.mActiveList[i].manager == panel)
			{
				num++;
			}
		}
		return num;
	}

	// Token: 0x06000700 RID: 1792 RVA: 0x000356B4 File Offset: 0x000338B4
	public static void Destroy(UIDrawCall dc)
	{
		if (dc)
		{
			dc.onRender = null;
			if (Application.isPlaying)
			{
				if (UIDrawCall.mActiveList.Remove(dc))
				{
					NGUITools.SetActive(dc.gameObject, false);
					UIDrawCall.mInactiveList.Add(dc);
				}
			}
			else
			{
				UIDrawCall.mActiveList.Remove(dc);
				NGUITools.DestroyImmediate(dc.gameObject);
			}
		}
	}

	// Token: 0x0400069A RID: 1690
	private const int maxIndexBufferCache = 10;

	// Token: 0x0400069B RID: 1691
	private static BetterList<UIDrawCall> mActiveList = new BetterList<UIDrawCall>();

	// Token: 0x0400069C RID: 1692
	private static BetterList<UIDrawCall> mInactiveList = new BetterList<UIDrawCall>();

	// Token: 0x0400069D RID: 1693
	[HideInInspector]
	[NonSerialized]
	public int widgetCount;

	// Token: 0x0400069E RID: 1694
	[HideInInspector]
	[NonSerialized]
	public int depthStart = int.MaxValue;

	// Token: 0x0400069F RID: 1695
	[HideInInspector]
	[NonSerialized]
	public int depthEnd = int.MinValue;

	// Token: 0x040006A0 RID: 1696
	[HideInInspector]
	[NonSerialized]
	public UIPanel manager;

	// Token: 0x040006A1 RID: 1697
	[HideInInspector]
	[NonSerialized]
	public UIPanel panel;

	// Token: 0x040006A2 RID: 1698
	[HideInInspector]
	[NonSerialized]
	public Texture2D clipTexture;

	// Token: 0x040006A3 RID: 1699
	[HideInInspector]
	[NonSerialized]
	public bool alwaysOnScreen;

	// Token: 0x040006A4 RID: 1700
	[HideInInspector]
	[NonSerialized]
	public BetterList<Vector3> verts = new BetterList<Vector3>();

	// Token: 0x040006A5 RID: 1701
	[HideInInspector]
	[NonSerialized]
	public BetterList<Vector3> norms = new BetterList<Vector3>();

	// Token: 0x040006A6 RID: 1702
	[HideInInspector]
	[NonSerialized]
	public BetterList<Vector4> tans = new BetterList<Vector4>();

	// Token: 0x040006A7 RID: 1703
	[HideInInspector]
	[NonSerialized]
	public BetterList<Vector2> uvs = new BetterList<Vector2>();

	// Token: 0x040006A8 RID: 1704
	[HideInInspector]
	[NonSerialized]
	public BetterList<Color32> cols = new BetterList<Color32>();

	// Token: 0x040006A9 RID: 1705
	private Material mMaterial;

	// Token: 0x040006AA RID: 1706
	private Texture mTexture;

	// Token: 0x040006AB RID: 1707
	private Shader mShader;

	// Token: 0x040006AC RID: 1708
	private int mClipCount;

	// Token: 0x040006AD RID: 1709
	private Transform mTrans;

	// Token: 0x040006AE RID: 1710
	private Mesh mMesh;

	// Token: 0x040006AF RID: 1711
	private MeshFilter mFilter;

	// Token: 0x040006B0 RID: 1712
	private MeshRenderer mRenderer;

	// Token: 0x040006B1 RID: 1713
	private Material mDynamicMat;

	// Token: 0x040006B2 RID: 1714
	private int[] mIndices;

	// Token: 0x040006B3 RID: 1715
	private bool mRebuildMat = true;

	// Token: 0x040006B4 RID: 1716
	private bool mLegacyShader;

	// Token: 0x040006B5 RID: 1717
	private int mRenderQueue = 3000;

	// Token: 0x040006B6 RID: 1718
	private int mTriangles;

	// Token: 0x040006B7 RID: 1719
	[NonSerialized]
	public bool isDirty;

	// Token: 0x040006B8 RID: 1720
	[NonSerialized]
	private bool mTextureClip;

	// Token: 0x040006B9 RID: 1721
	public UIDrawCall.OnRenderCallback onRender;

	// Token: 0x040006BA RID: 1722
	private static List<int[]> mCache = new List<int[]>(10);

	// Token: 0x040006BB RID: 1723
	private static int[] ClipRange = null;

	// Token: 0x040006BC RID: 1724
	private static int[] ClipArgs = null;

	// Token: 0x020000F0 RID: 240
	public enum Clipping
	{
		// Token: 0x040006BE RID: 1726
		None,
		// Token: 0x040006BF RID: 1727
		TextureMask,
		// Token: 0x040006C0 RID: 1728
		SoftClip = 3,
		// Token: 0x040006C1 RID: 1729
		ConstrainButDontClip
	}

	// Token: 0x02000346 RID: 838
	// (Invoke) Token: 0x0600153A RID: 5434
	public delegate void OnRenderCallback(Material mat);
}
