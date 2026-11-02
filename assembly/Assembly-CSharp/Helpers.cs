using System;
using UnityEngine;

// Token: 0x02000231 RID: 561
public static class Helpers
{
	// Token: 0x06000F76 RID: 3958 RVA: 0x0006D474 File Offset: 0x0006B674
	public static GameObject createSinglePrefab(string prefab, string path = "")
	{
		GameObject gameObject = GameObject.Find(prefab);
		if (gameObject == null)
		{
			Object @object = Object.Instantiate(Resources.Load("Prefabs/" + path + prefab));
			if (@object)
			{
				string[] array = new string[]
				{
					"(Clone)"
				};
				@object.name = @object.name.Split(array, 0)[0];
			}
			gameObject = (@object as GameObject);
		}
		return gameObject;
	}

	// Token: 0x06000F77 RID: 3959 RVA: 0x0006D4E4 File Offset: 0x0006B6E4
	public static GameObject createPrefab(string prefab, string path = "")
	{
		Object @object = Object.Instantiate(Resources.Load("Prefabs/" + path + prefab));
		if (@object)
		{
			string[] array = new string[]
			{
				"(Clone)"
			};
			@object.name = @object.name.Split(array, 0)[0];
		}
		return @object as GameObject;
	}

	// Token: 0x06000F78 RID: 3960 RVA: 0x0006D540 File Offset: 0x0006B740
	public static void setAtlas(UIAtlas atlas, string atlasName)
	{
		if (atlas.name != atlasName)
		{
			GameObject gameObject = Resources.Load(atlasName) as GameObject;
			if (gameObject != null)
			{
				atlas = gameObject.GetComponent<UIAtlas>();
			}
		}
	}
}
