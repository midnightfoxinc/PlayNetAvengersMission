.class Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;
.super Ljava/lang/Object;
.source "NTLMEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ntlm/NTLMEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HMACMD5"
.end annotation


# instance fields
.field protected ipad:[B

.field protected md5:Ljava/security/MessageDigest;

.field protected opad:[B


# direct methods
.method constructor <init>([B)V
    .locals 7
    .param p1, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x40

    .line 1462
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1463
    move-object v2, p1

    .line 1465
    .local v2, "key":[B
    :try_start_0
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    iput-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1473
    new-array v4, v6, [B

    iput-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->ipad:[B

    .line 1474
    new-array v4, v6, [B

    iput-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->opad:[B

    .line 1476
    array-length v3, v2

    .line 1477
    .local v3, "keyLength":I
    if-le v3, v6, :cond_0

    .line 1479
    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v4, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 1480
    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 1481
    array-length v3, v2

    .line 1483
    :cond_0
    const/4 v1, 0x0

    .line 1484
    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 1485
    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->ipad:[B

    aget-byte v5, v2, v1

    xor-int/lit8 v5, v5, 0x36

    int-to-byte v5, v5

    aput-byte v5, v4, v1

    .line 1486
    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->opad:[B

    aget-byte v5, v2, v1

    xor-int/lit8 v5, v5, 0x5c

    int-to-byte v5, v5

    aput-byte v5, v4, v1

    .line 1487
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1466
    .end local v1    # "i":I
    .end local v3    # "keyLength":I
    :catch_0
    move-exception v0

    .line 1469
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v4, Lcom/ning/http/client/ntlm/NTLMEngineException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error getting md5 message digest implementation: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 1489
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v1    # "i":I
    .restart local v3    # "keyLength":I
    :cond_1
    :goto_1
    if-ge v1, v6, :cond_2

    .line 1490
    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->ipad:[B

    const/16 v5, 0x36

    aput-byte v5, v4, v1

    .line 1491
    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->opad:[B

    const/16 v5, 0x5c

    aput-byte v5, v4, v1

    .line 1492
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1496
    :cond_2
    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v4}, Ljava/security/MessageDigest;->reset()V

    .line 1497
    iget-object v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;

    iget-object v5, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->ipad:[B

    invoke-virtual {v4, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 1499
    return-void
.end method


# virtual methods
.method getOutput()[B
    .locals 3

    .prologue
    .line 1503
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 1504
    .local v0, "digest":[B
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;

    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->opad:[B

    invoke-virtual {v1, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 1505
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    return-object v1
.end method

.method update([B)V
    .locals 1
    .param p1, "input"    # [B

    .prologue
    .line 1510
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$HMACMD5;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 1511
    return-void
.end method
