using System;
using System.Collections.Generic;

namespace emcore.GameData
{
	// Token: 0x02000272 RID: 626
	public class Level
	{
		// Token: 0x060010E7 RID: 4327 RVA: 0x00078A58 File Offset: 0x00076C58
		public Level(string n, int x)
		{
			this.rank = n;
			this.xp = x;
		}

		// Token: 0x060010E8 RID: 4328 RVA: 0x00078A70 File Offset: 0x00076C70
		public static List<Level> fromJSON(JSONObject j)
		{
			List<Level> list = new List<Level>();
			foreach (JSONObject jsonobject in j.list)
			{
				try
				{
					list.Add(new Level(jsonobject["rank"].str, (int)jsonobject["xp"].n));
				}
				catch (Exception log)
				{
					globals.debugException(log);
				}
			}
			return list;
		}

		// Token: 0x060010E9 RID: 4329 RVA: 0x00078B2C File Offset: 0x00076D2C
		public static JSONObject toJSON(List<Level> levelList)
		{
			JSONObject jsonobject = new JSONObject(JSONObject.Type.ARRAY);
			foreach (Level level in levelList)
			{
				JSONObject jsonobject2 = new JSONObject(JSONObject.Type.OBJECT);
				jsonobject2.AddField("rank", level.rank);
				jsonobject2.AddField("xp", level.xp);
				jsonobject.Add(jsonobject2);
			}
			return jsonobject;
		}

		// Token: 0x060010EA RID: 4330 RVA: 0x00078BC0 File Offset: 0x00076DC0
		public static Level getLevel(List<Level> levels, int curXp)
		{
			if (levels.Count == 0)
			{
				return null;
			}
			int num = levels.BinarySearch(new Level(string.Empty, curXp));
			if (num < 0)
			{
				num = ((~num <= 0) ? 0 : (~num - 1));
			}
			return levels[num];
		}

		// Token: 0x0400114A RID: 4426
		public string rank;

		// Token: 0x0400114B RID: 4427
		public int xp;
	}
}
