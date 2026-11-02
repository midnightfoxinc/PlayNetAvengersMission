using System;
using UnityEngine;

// Token: 0x02000280 RID: 640
public static class Component_extensions
{
	// Token: 0x06001122 RID: 4386 RVA: 0x0007A444 File Offset: 0x00078644
	public static Component CopyInPlace(this Component source)
	{
		Component component = Object.Instantiate<Component>(source);
		component.transform.parent = source.transform.parent;
		component.transform.position = source.transform.position;
		component.transform.rotation = source.transform.rotation;
		component.transform.localScale = source.transform.localScale;
		return component;
	}
}
