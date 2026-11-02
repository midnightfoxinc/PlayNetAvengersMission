using System;

// Token: 0x02000234 RID: 564
[Serializable]
public class SFRepClass
{
	// Token: 0x06000FD3 RID: 4051 RVA: 0x000706EC File Offset: 0x0006E8EC
	public SFRepClass()
	{
	}

	// Token: 0x06000FD4 RID: 4052 RVA: 0x000706F4 File Offset: 0x0006E8F4
	public SFRepClass(int sf, int xp)
	{
		this.sf = sf;
		this.xp = xp;
	}

	// Token: 0x06000FD5 RID: 4053 RVA: 0x0007070C File Offset: 0x0006E90C
	public SFRepClass(int sf, int xp, int prev_xp)
	{
		this.sf = sf;
		this.xp = xp;
		this.prev_xp = prev_xp;
	}

	// Token: 0x06000FD6 RID: 4054 RVA: 0x0007072C File Offset: 0x0006E92C
	public SFRepClass(JSONObject obj)
	{
		if (obj.HasField("sf"))
		{
			this.sf = (int)obj["sf"].n;
		}
		if (obj.HasField("xp"))
		{
			this.xp = (int)obj["xp"].n;
		}
	}

	// Token: 0x170001ED RID: 493
	// (get) Token: 0x06000FD7 RID: 4055 RVA: 0x00070790 File Offset: 0x0006E990
	public int level
	{
		get
		{
			return globals.sf_level_from_xp(this.xp);
		}
	}

	// Token: 0x06000FD8 RID: 4056 RVA: 0x000707A0 File Offset: 0x0006E9A0
	public JSONObject to_json()
	{
		JSONObject jsonobject = new JSONObject();
		jsonobject.AddField("sf", this.sf);
		jsonobject.AddField("xp", this.xp);
		return jsonobject;
	}

	// Token: 0x04000FE4 RID: 4068
	public int sf;

	// Token: 0x04000FE5 RID: 4069
	public int xp;

	// Token: 0x04000FE6 RID: 4070
	public int prev_xp;
}
