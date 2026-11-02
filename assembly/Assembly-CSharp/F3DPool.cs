using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200000D RID: 13
public class F3DPool : MonoBehaviour
{
	// Token: 0x0600006A RID: 106 RVA: 0x00005268 File Offset: 0x00003468
	private void Start()
	{
		F3DPool.instance = this;
		if (this.poolItems.Length > 0)
		{
			this.pool = new Dictionary<Transform, Transform[]>();
			for (int i = 0; i < this.poolItems.Length; i++)
			{
				Transform[] array = new Transform[this.poolLength[i]];
				for (int j = 0; j < this.poolLength[i]; j++)
				{
					Transform transform = (Transform)Object.Instantiate(this.poolItems[i], Vector3.zero, Quaternion.identity);
					transform.gameObject.SetActive(false);
					transform.parent = base.transform;
					array[j] = transform;
				}
				this.pool.Add(this.poolItems[i], array);
			}
		}
		if (this.audioPoolItems.Length > 0)
		{
			this.audioPool = new Dictionary<AudioClip, AudioSource[]>();
			for (int k = 0; k < this.audioPoolItems.Length; k++)
			{
				AudioSource[] array2 = new AudioSource[this.audioPoolLength[k]];
				for (int l = 0; l < this.audioPoolLength[k]; l++)
				{
					AudioSource component = ((Transform)Object.Instantiate(this.audioSourcePrefab, Vector3.zero, Quaternion.identity)).GetComponent<AudioSource>();
					component.clip = this.audioPoolItems[k];
					component.gameObject.SetActive(false);
					component.transform.parent = base.transform;
					array2[l] = component;
				}
				this.audioPool.Add(this.audioPoolItems[k], array2);
			}
		}
	}

	// Token: 0x0600006B RID: 107 RVA: 0x000053F4 File Offset: 0x000035F4
	public Transform Spawn(Transform obj, Vector3 pos, Quaternion rot, Transform parent)
	{
		for (int i = 0; i < this.pool[obj].Length; i++)
		{
			if (!this.pool[obj][i].gameObject.activeSelf)
			{
				Transform transform = this.pool[obj][i];
				transform.parent = parent;
				transform.position = pos;
				transform.rotation = rot;
				transform.gameObject.SetActive(true);
				transform.BroadcastMessage("OnSpawned", 1);
				return transform;
			}
		}
		return null;
	}

	// Token: 0x0600006C RID: 108 RVA: 0x00005480 File Offset: 0x00003680
	public AudioSource SpawnAudio(AudioClip clip, Vector3 pos, Transform parent)
	{
		for (int i = 0; i < this.audioPool[clip].Length; i++)
		{
			if (!this.audioPool[clip][i].gameObject.activeSelf)
			{
				AudioSource audioSource = this.audioPool[clip][i];
				audioSource.transform.parent = parent;
				audioSource.transform.position = pos;
				audioSource.gameObject.SetActive(true);
				audioSource.BroadcastMessage("OnSpawned", 1);
				return audioSource;
			}
		}
		return null;
	}

	// Token: 0x0600006D RID: 109 RVA: 0x0000550C File Offset: 0x0000370C
	public void Despawn(Transform obj)
	{
		obj.BroadcastMessage("OnDespawned", 1);
		obj.gameObject.SetActive(false);
	}

	// Token: 0x040000AF RID: 175
	public static F3DPool instance;

	// Token: 0x040000B0 RID: 176
	[Header("VFX Pool")]
	public Transform[] poolItems;

	// Token: 0x040000B1 RID: 177
	public int[] poolLength;

	// Token: 0x040000B2 RID: 178
	[Header("Audio Pool")]
	public Transform audioSourcePrefab;

	// Token: 0x040000B3 RID: 179
	public AudioClip[] audioPoolItems;

	// Token: 0x040000B4 RID: 180
	public int[] audioPoolLength;

	// Token: 0x040000B5 RID: 181
	private Dictionary<Transform, Transform[]> pool;

	// Token: 0x040000B6 RID: 182
	private Dictionary<AudioClip, AudioSource[]> audioPool;
}
