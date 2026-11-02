using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x02000275 RID: 629
	public class PlayerRank : IComparable<PlayerRank>
	{
		// Token: 0x060010F2 RID: 4338 RVA: 0x000792CC File Offset: 0x000774CC
		public int CompareTo(PlayerRank other)
		{
			return this.gmedals - other.gmedals;
		}

		// Token: 0x060010F3 RID: 4339 RVA: 0x000792DC File Offset: 0x000774DC
		public static List<PlayerRank> fromJSON(JSONObject j)
		{
			List<PlayerRank> list = new List<PlayerRank>();
			JSONObject jsonobject = j["levels"];
			foreach (JSONObject jsonobject2 in jsonobject.list)
			{
				try
				{
					list.Add(new PlayerRank
					{
						gmedals = (int)jsonobject2["gmedals"].n,
						rank = jsonobject2["rank"].str
					});
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return list;
		}

		// Token: 0x060010F4 RID: 4340 RVA: 0x000793B8 File Offset: 0x000775B8
		public static JSONObject toJSON(List<PlayerRank> playerRanks)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
			JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
			jsonobject.AddField("levels", jsonobject2);
			foreach (PlayerRank playerRank in playerRanks)
			{
				JSONObject jsonobject3 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject3.AddField("rank", playerRank.rank);
				jsonobject3.AddField("gmedals", playerRank.gmedals);
				jsonobject2.Add(jsonobject3);
			}
			return jsonobject;
		}

		// Token: 0x0400115D RID: 4445
		public int gmedals;

		// Token: 0x0400115E RID: 4446
		public string rank;
	}
}
