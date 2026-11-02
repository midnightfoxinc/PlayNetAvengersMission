using System;

namespace Prime31
{
	// Token: 0x0200000C RID: 12
	public class IAPProduct
	{
		// Token: 0x060000A4 RID: 164 RVA: 0x000040A4 File Offset: 0x000022A4
		public IAPProduct(GoogleSkuInfo prod)
		{
			this.productId = prod.productId;
			this.title = prod.title;
			this.price = prod.price;
			this.description = prod.description;
			this.currencyCode = prod.priceCurrencyCode;
		}

		// Token: 0x17000001 RID: 1
		// (get) Token: 0x060000A5 RID: 165 RVA: 0x000040F4 File Offset: 0x000022F4
		// (set) Token: 0x060000A6 RID: 166 RVA: 0x000040FC File Offset: 0x000022FC
		public string productId { get; private set; }

		// Token: 0x17000002 RID: 2
		// (get) Token: 0x060000A7 RID: 167 RVA: 0x00004108 File Offset: 0x00002308
		// (set) Token: 0x060000A8 RID: 168 RVA: 0x00004110 File Offset: 0x00002310
		public string title { get; private set; }

		// Token: 0x17000003 RID: 3
		// (get) Token: 0x060000A9 RID: 169 RVA: 0x0000411C File Offset: 0x0000231C
		// (set) Token: 0x060000AA RID: 170 RVA: 0x00004124 File Offset: 0x00002324
		public string price { get; private set; }

		// Token: 0x17000004 RID: 4
		// (get) Token: 0x060000AB RID: 171 RVA: 0x00004130 File Offset: 0x00002330
		// (set) Token: 0x060000AC RID: 172 RVA: 0x00004138 File Offset: 0x00002338
		public string description { get; private set; }

		// Token: 0x17000005 RID: 5
		// (get) Token: 0x060000AD RID: 173 RVA: 0x00004144 File Offset: 0x00002344
		// (set) Token: 0x060000AE RID: 174 RVA: 0x0000414C File Offset: 0x0000234C
		public string currencyCode { get; private set; }

		// Token: 0x060000AF RID: 175 RVA: 0x00004158 File Offset: 0x00002358
		public override string ToString()
		{
			return string.Format("[IAPProduct[: productId: {0}, title: {1}, price: {2}, description: {3}, priceCurrencyCode: {4}]", new object[]
			{
				this.productId,
				this.title,
				this.price,
				this.description,
				this.currencyCode
			});
		}
	}
}
