.class Lcom/ning/http/client/ntlm/NTLMEngine$MD4;
.super Ljava/lang/Object;
.source "NTLMEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ntlm/NTLMEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MD4"
.end annotation


# instance fields
.field protected A:I

.field protected B:I

.field protected C:I

.field protected D:I

.field protected count:J

.field protected dataBuffer:[B


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 1304
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1297
    const v0, 0x67452301

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1298
    const v0, -0x10325477

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1299
    const v0, -0x67452302

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1300
    const v0, 0x10325476

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1301
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->count:J

    .line 1302
    const/16 v0, 0x40

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    .line 1305
    return-void
.end method


# virtual methods
.method getOutput()[B
    .locals 12

    .prologue
    const/16 v11, 0x8

    const/4 v10, 0x0

    .line 1338
    iget-wide v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->count:J

    const-wide/16 v8, 0x3f

    and-long/2addr v6, v8

    long-to-int v0, v6

    .line 1339
    .local v0, "bufferIndex":I
    const/16 v5, 0x38

    if-ge v0, v5, :cond_0

    rsub-int/lit8 v2, v0, 0x38

    .line 1340
    .local v2, "padLen":I
    :goto_0
    add-int/lit8 v5, v2, 0x8

    new-array v3, v5, [B

    .line 1343
    .local v3, "postBytes":[B
    const/16 v5, -0x80

    aput-byte v5, v3, v10

    .line 1345
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v11, :cond_1

    .line 1346
    add-int v5, v2, v1

    iget-wide v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->count:J

    const-wide/16 v8, 0x8

    mul-long/2addr v6, v8

    mul-int/lit8 v8, v1, 0x8

    ushr-long/2addr v6, v8

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v3, v5

    .line 1345
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1339
    .end local v1    # "i":I
    .end local v2    # "padLen":I
    .end local v3    # "postBytes":[B
    :cond_0
    rsub-int/lit8 v2, v0, 0x78

    goto :goto_0

    .line 1350
    .restart local v1    # "i":I
    .restart local v2    # "padLen":I
    .restart local v3    # "postBytes":[B
    :cond_1
    invoke-virtual {p0, v3}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->update([B)V

    .line 1353
    const/16 v5, 0x10

    new-array v4, v5, [B

    .line 1354
    .local v4, "result":[B
    iget v5, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v4, v5, v10}, Lcom/ning/http/client/ntlm/NTLMEngine;->writeULong([BII)V

    .line 1355
    iget v5, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    const/4 v6, 0x4

    invoke-static {v4, v5, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->writeULong([BII)V

    .line 1356
    iget v5, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v4, v5, v11}, Lcom/ning/http/client/ntlm/NTLMEngine;->writeULong([BII)V

    .line 1357
    iget v5, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    const/16 v6, 0xc

    invoke-static {v4, v5, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->writeULong([BII)V

    .line 1358
    return-object v4
.end method

.method protected processBuffer()V
    .locals 10

    .prologue
    const/16 v9, 0x10

    .line 1363
    new-array v4, v9, [I

    .line 1365
    .local v4, "d":[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v9, :cond_0

    .line 1366
    iget-object v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    mul-int/lit8 v7, v5, 0x4

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    iget-object v7, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    mul-int/lit8 v8, v5, 0x4

    add-int/lit8 v8, v8, 0x1

    aget-byte v7, v7, v8

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    mul-int/lit8 v8, v5, 0x4

    add-int/lit8 v8, v8, 0x2

    aget-byte v7, v7, v8

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x10

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    mul-int/lit8 v8, v5, 0x4

    add-int/lit8 v8, v8, 0x3

    aget-byte v7, v7, v8

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x18

    add-int/2addr v6, v7

    aput v6, v4, v5

    .line 1365
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1371
    :cond_0
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1372
    .local v0, "AA":I
    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1373
    .local v1, "BB":I
    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1374
    .local v2, "CC":I
    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1375
    .local v3, "DD":I
    invoke-virtual {p0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->round1([I)V

    .line 1376
    invoke-virtual {p0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->round2([I)V

    .line 1377
    invoke-virtual {p0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->round3([I)V

    .line 1378
    iget v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    add-int/2addr v6, v0

    iput v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1379
    iget v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    add-int/2addr v6, v1

    iput v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1380
    iget v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    add-int/2addr v6, v2

    iput v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1381
    iget v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    add-int/2addr v6, v3

    iput v6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1383
    return-void
.end method

.method protected round1([I)V
    .locals 8
    .param p1, "d"    # [I

    .prologue
    const/16 v7, 0x13

    const/16 v6, 0xb

    const/4 v5, 0x7

    const/4 v4, 0x3

    .line 1386
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x0

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1387
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x1

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1388
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x2

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1389
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v4

    add-int/2addr v0, v1

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1391
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x4

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1392
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x5

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1393
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1394
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v5

    add-int/2addr v0, v1

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1396
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x8

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1397
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x9

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1398
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xa

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1399
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v6

    add-int/2addr v0, v1

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1401
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xc

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1402
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xd

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1403
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xe

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1404
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xf

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1405
    return-void
.end method

.method protected round2([I)V
    .locals 9
    .param p1, "d"    # [I

    .prologue
    const/16 v8, 0xd

    const/16 v7, 0x9

    const/4 v6, 0x5

    const/4 v5, 0x3

    const v4, 0x5a827999

    .line 1408
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x0

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1409
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x4

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1410
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x8

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1411
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xc

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1413
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x1

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1414
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v6

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1415
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v7

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1416
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v8

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1418
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x2

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1419
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1420
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xa

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1421
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xe

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1423
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v5

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1424
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x7

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1425
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xb

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1426
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xf

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1428
    return-void
.end method

.method protected round3([I)V
    .locals 9
    .param p1, "d"    # [I

    .prologue
    const/16 v8, 0xf

    const/16 v7, 0xb

    const/16 v6, 0x9

    const/4 v5, 0x3

    const v4, 0x6ed9eba1

    .line 1431
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x0

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1432
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x8

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1433
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x4

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1434
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xc

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1436
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x2

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1437
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xa

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1438
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1439
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xe

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1441
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x1

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1442
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v6

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1443
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x5

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1444
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xd

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1446
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v5

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    .line 1447
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v7

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    .line 1448
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x7

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    .line 1449
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    iget v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->C:I

    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->D:I

    iget v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v8

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->B:I

    .line 1450
    return-void
.end method

.method update([B)V
    .locals 8
    .param p1, "input"    # [B

    .prologue
    .line 1311
    iget-wide v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->count:J

    const-wide/16 v6, 0x3f

    and-long/2addr v4, v6

    long-to-int v0, v4

    .line 1312
    .local v0, "curBufferPos":I
    const/4 v1, 0x0

    .line 1313
    .local v1, "inputIndex":I
    :goto_0
    array-length v3, p1

    sub-int/2addr v3, v1

    add-int/2addr v3, v0

    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    array-length v4, v4

    if-lt v3, v4, :cond_0

    .line 1317
    iget-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    array-length v3, v3

    sub-int v2, v3, v0

    .line 1318
    .local v2, "transferAmt":I
    iget-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    invoke-static {p1, v1, v3, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1319
    iget-wide v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->count:J

    int-to-long v6, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->count:J

    .line 1320
    const/4 v0, 0x0

    .line 1321
    add-int/2addr v1, v2

    .line 1322
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->processBuffer()V

    goto :goto_0

    .line 1327
    .end local v2    # "transferAmt":I
    :cond_0
    array-length v3, p1

    if-ge v1, v3, :cond_1

    .line 1328
    array-length v3, p1

    sub-int v2, v3, v1

    .line 1329
    .restart local v2    # "transferAmt":I
    iget-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->dataBuffer:[B

    invoke-static {p1, v1, v3, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1330
    iget-wide v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->count:J

    int-to-long v6, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->count:J

    .line 1331
    add-int/2addr v0, v2

    .line 1333
    .end local v2    # "transferAmt":I
    :cond_1
    return-void
.end method
