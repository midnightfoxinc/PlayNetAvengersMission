using System;
using System.Collections.Generic;

namespace Prime31
{
	// Token: 0x02000012 RID: 18
	public class GoogleSkuInfo
	{
		// Token: 0x06000127 RID: 295 RVA: 0x00004A80 File Offset: 0x00002C80
		public GoogleSkuInfo(Dictionary<string, object> dict)
		{
			if (dict.ContainsKey("title"))
			{
				this.title = (dict["title"] as string);
			}
			if (dict.ContainsKey("price"))
			{
				this.price = (dict["price"] as string);
			}
			if (dict.ContainsKey("type"))
			{
				this.type = (dict["type"] as string);
			}
			if (dict.ContainsKey("description"))
			{
				this.description = (dict["description"] as string);
			}
			if (dict.ContainsKey("productId"))
			{
				this.productId = (dict["productId"] as string);
			}
			if (dict.ContainsKey("price_currency_code"))
			{
				this.priceCurrencyCode = (dict["price_currency_code"] as string);
			}
			if (dict.ContainsKey("price_amount_micros"))
			{
				long? num = dict["price_amount_micros"] as long?;
				if (num != null)
				{
					this.priceAmountMicros = num.Value;
				}
			}
		}

		// Token: 0x17000010 RID: 16
		// (get) Token: 0x06000128 RID: 296 RVA: 0x00004BB8 File Offset: 0x00002DB8
		// (set) Token: 0x06000129 RID: 297 RVA: 0x00004BC0 File Offset: 0x00002DC0
		public string title { get; private set; }

		// Token: 0x17000011 RID: 17
		// (get) Token: 0x0600012A RID: 298 RVA: 0x00004BCC File Offset: 0x00002DCC
		// (set) Token: 0x0600012B RID: 299 RVA: 0x00004BD4 File Offset: 0x00002DD4
		public string price { get; private set; }

		// Token: 0x17000012 RID: 18
		// (get) Token: 0x0600012C RID: 300 RVA: 0x00004BE0 File Offset: 0x00002DE0
		// (set) Token: 0x0600012D RID: 301 RVA: 0x00004BE8 File Offset: 0x00002DE8
		public string type { get; private set; }

		// Token: 0x17000013 RID: 19
		// (get) Token: 0x0600012E RID: 302 RVA: 0x00004BF4 File Offset: 0x00002DF4
		// (set) Token: 0x0600012F RID: 303 RVA: 0x00004BFC File Offset: 0x00002DFC
		public string description { get; private set; }

		// Token: 0x17000014 RID: 20
		// (get) Token: 0x06000130 RID: 304 RVA: 0x00004C08 File Offset: 0x00002E08
		// (set) Token: 0x06000131 RID: 305 RVA: 0x00004C10 File Offset: 0x00002E10
		public string productId { get; private set; }

		// Token: 0x17000015 RID: 21
		// (get) Token: 0x06000132 RID: 306 RVA: 0x00004C1C File Offset: 0x00002E1C
		// (set) Token: 0x06000133 RID: 307 RVA: 0x00004C24 File Offset: 0x00002E24
		public string priceCurrencyCode { get; private set; }

		// Token: 0x17000016 RID: 22
		// (get) Token: 0x06000134 RID: 308 RVA: 0x00004C30 File Offset: 0x00002E30
		// (set) Token: 0x06000135 RID: 309 RVA: 0x00004C38 File Offset: 0x00002E38
		public long priceAmountMicros { get; private set; }

		// Token: 0x06000136 RID: 310 RVA: 0x00004C44 File Offset: 0x00002E44
		public static List<GoogleSkuInfo> fromList(List<object> items)
		{
			List<GoogleSkuInfo> list = new List<GoogleSkuInfo>();
			foreach (object obj in items)
			{
				Dictionary<string, object> dict = (Dictionary<string, object>)obj;
				list.Add(new GoogleSkuInfo(dict));
			}
			return list;
		}

		// Token: 0x06000137 RID: 311 RVA: 0x00004CB8 File Offset: 0x00002EB8
		public override string ToString()
		{
			return string.Format("<GoogleSkuInfo> title: {0}, price: {1}, type: {2}, description: {3}, productId: {4}, priceCurrencyCode: {5}", new object[]
			{
				this.title,
				this.price,
				this.type,
				this.description,
				this.productId,
				this.priceCurrencyCode
			});
		}
	}
}
