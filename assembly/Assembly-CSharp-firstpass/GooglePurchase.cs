using System;
using System.Collections.Generic;

namespace Prime31
{
	// Token: 0x02000010 RID: 16
	public class GooglePurchase
	{
		// Token: 0x06000110 RID: 272 RVA: 0x00004734 File Offset: 0x00002934
		public GooglePurchase(Dictionary<string, object> dict)
		{
			if (dict.ContainsKey("packageName"))
			{
				this.packageName = dict["packageName"].ToString();
			}
			if (dict.ContainsKey("orderId"))
			{
				this.orderId = dict["orderId"].ToString();
			}
			if (dict.ContainsKey("productId"))
			{
				this.productId = dict["productId"].ToString();
			}
			if (dict.ContainsKey("developerPayload"))
			{
				this.developerPayload = dict["developerPayload"].ToString();
			}
			if (dict.ContainsKey("type"))
			{
				this.type = (dict["type"] as string);
			}
			if (dict.ContainsKey("purchaseTime"))
			{
				this.purchaseTime = long.Parse(dict["purchaseTime"].ToString());
			}
			if (dict.ContainsKey("purchaseState"))
			{
				this.purchaseState = (GooglePurchase.GooglePurchaseState)int.Parse(dict["purchaseState"].ToString());
			}
			if (dict.ContainsKey("purchaseToken"))
			{
				this.purchaseToken = dict["purchaseToken"].ToString();
			}
			if (dict.ContainsKey("signature"))
			{
				this.signature = dict["signature"].ToString();
			}
			if (dict.ContainsKey("originalJson"))
			{
				this.originalJson = dict["originalJson"].ToString();
			}
		}

		// Token: 0x17000006 RID: 6
		// (get) Token: 0x06000111 RID: 273 RVA: 0x000048D0 File Offset: 0x00002AD0
		// (set) Token: 0x06000112 RID: 274 RVA: 0x000048D8 File Offset: 0x00002AD8
		public string packageName { get; private set; }

		// Token: 0x17000007 RID: 7
		// (get) Token: 0x06000113 RID: 275 RVA: 0x000048E4 File Offset: 0x00002AE4
		// (set) Token: 0x06000114 RID: 276 RVA: 0x000048EC File Offset: 0x00002AEC
		public string orderId { get; private set; }

		// Token: 0x17000008 RID: 8
		// (get) Token: 0x06000115 RID: 277 RVA: 0x000048F8 File Offset: 0x00002AF8
		// (set) Token: 0x06000116 RID: 278 RVA: 0x00004900 File Offset: 0x00002B00
		public string productId { get; private set; }

		// Token: 0x17000009 RID: 9
		// (get) Token: 0x06000117 RID: 279 RVA: 0x0000490C File Offset: 0x00002B0C
		// (set) Token: 0x06000118 RID: 280 RVA: 0x00004914 File Offset: 0x00002B14
		public string developerPayload { get; private set; }

		// Token: 0x1700000A RID: 10
		// (get) Token: 0x06000119 RID: 281 RVA: 0x00004920 File Offset: 0x00002B20
		// (set) Token: 0x0600011A RID: 282 RVA: 0x00004928 File Offset: 0x00002B28
		public string type { get; private set; }

		// Token: 0x1700000B RID: 11
		// (get) Token: 0x0600011B RID: 283 RVA: 0x00004934 File Offset: 0x00002B34
		// (set) Token: 0x0600011C RID: 284 RVA: 0x0000493C File Offset: 0x00002B3C
		public long purchaseTime { get; private set; }

		// Token: 0x1700000C RID: 12
		// (get) Token: 0x0600011D RID: 285 RVA: 0x00004948 File Offset: 0x00002B48
		// (set) Token: 0x0600011E RID: 286 RVA: 0x00004950 File Offset: 0x00002B50
		public GooglePurchase.GooglePurchaseState purchaseState { get; private set; }

		// Token: 0x1700000D RID: 13
		// (get) Token: 0x0600011F RID: 287 RVA: 0x0000495C File Offset: 0x00002B5C
		// (set) Token: 0x06000120 RID: 288 RVA: 0x00004964 File Offset: 0x00002B64
		public string purchaseToken { get; private set; }

		// Token: 0x1700000E RID: 14
		// (get) Token: 0x06000121 RID: 289 RVA: 0x00004970 File Offset: 0x00002B70
		// (set) Token: 0x06000122 RID: 290 RVA: 0x00004978 File Offset: 0x00002B78
		public string signature { get; private set; }

		// Token: 0x1700000F RID: 15
		// (get) Token: 0x06000123 RID: 291 RVA: 0x00004984 File Offset: 0x00002B84
		// (set) Token: 0x06000124 RID: 292 RVA: 0x0000498C File Offset: 0x00002B8C
		public string originalJson { get; private set; }

		// Token: 0x06000125 RID: 293 RVA: 0x00004998 File Offset: 0x00002B98
		public static List<GooglePurchase> fromList(List<object> items)
		{
			List<GooglePurchase> list = new List<GooglePurchase>();
			foreach (object obj in items)
			{
				Dictionary<string, object> dict = (Dictionary<string, object>)obj;
				list.Add(new GooglePurchase(dict));
			}
			return list;
		}

		// Token: 0x06000126 RID: 294 RVA: 0x00004A0C File Offset: 0x00002C0C
		public override string ToString()
		{
			return string.Format("<GooglePurchase> packageName: {0}, orderId: {1}, productId: {2}, developerPayload: {3}, purchaseToken: {4}, purchaseState: {5}, signature: {6}, type: {7}, json: {8}", new object[]
			{
				this.packageName,
				this.orderId,
				this.productId,
				this.developerPayload,
				this.purchaseToken,
				this.purchaseState,
				this.signature,
				this.type,
				this.originalJson
			});
		}

		// Token: 0x02000011 RID: 17
		public enum GooglePurchaseState
		{
			// Token: 0x0400005C RID: 92
			Purchased,
			// Token: 0x0400005D RID: 93
			Canceled,
			// Token: 0x0400005E RID: 94
			Refunded
		}
	}
}
