.class Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;
.super Ljava/lang/Object;
.source "NTLMEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ntlm/NTLMEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CipherGen"
.end annotation


# instance fields
.field protected final challenge:[B

.field protected clientChallenge:[B

.field protected clientChallenge2:[B

.field protected final domain:Ljava/lang/String;

.field protected lanManagerSessionKey:[B

.field protected lm2SessionResponse:[B

.field protected lmHash:[B

.field protected lmResponse:[B

.field protected lmUserSessionKey:[B

.field protected lmv2Hash:[B

.field protected lmv2Response:[B

.field protected ntlm2SessionResponse:[B

.field protected ntlm2SessionResponseUserSessionKey:[B

.field protected ntlmHash:[B

.field protected ntlmResponse:[B

.field protected ntlmUserSessionKey:[B

.field protected ntlmv2Blob:[B

.field protected ntlmv2Hash:[B

.field protected ntlmv2Response:[B

.field protected ntlmv2UserSessionKey:[B

.field protected final password:Ljava/lang/String;

.field protected secondaryKey:[B

.field protected final target:Ljava/lang/String;

.field protected final targetInformation:[B

.field protected timestamp:[B

.field protected final user:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B)V
    .locals 11
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "challenge"    # [B
    .param p5, "target"    # Ljava/lang/String;
    .param p6, "targetInformation"    # [B

    .prologue
    .line 259
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    invoke-direct/range {v0 .. v10}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B[B[B[B[B)V

    .line 260
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B[B[B[B[B)V
    .locals 1
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "challenge"    # [B
    .param p5, "target"    # Ljava/lang/String;
    .param p6, "targetInformation"    # [B
    .param p7, "clientChallenge"    # [B
    .param p8, "clientChallenge2"    # [B
    .param p9, "secondaryKey"    # [B
    .param p10, "timestamp"    # [B

    .prologue
    const/4 v0, 0x0

    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmHash:[B

    .line 226
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmResponse:[B

    .line 227
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmHash:[B

    .line 228
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmResponse:[B

    .line 229
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Hash:[B

    .line 230
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmv2Hash:[B

    .line 231
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmv2Response:[B

    .line 232
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Blob:[B

    .line 233
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Response:[B

    .line 234
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlm2SessionResponse:[B

    .line 235
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lm2SessionResponse:[B

    .line 236
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmUserSessionKey:[B

    .line 237
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmUserSessionKey:[B

    .line 238
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2UserSessionKey:[B

    .line 239
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlm2SessionResponseUserSessionKey:[B

    .line 240
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lanManagerSessionKey:[B

    .line 245
    iput-object p1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->domain:Ljava/lang/String;

    .line 246
    iput-object p5, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->target:Ljava/lang/String;

    .line 247
    iput-object p2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->user:Ljava/lang/String;

    .line 248
    iput-object p3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->password:Ljava/lang/String;

    .line 249
    iput-object p4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    .line 250
    iput-object p6, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->targetInformation:[B

    .line 251
    iput-object p7, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->clientChallenge:[B

    .line 252
    iput-object p8, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->clientChallenge2:[B

    .line 253
    iput-object p9, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->secondaryKey:[B

    .line 254
    iput-object p10, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->timestamp:[B

    .line 255
    return-void
.end method


# virtual methods
.method public getClientChallenge()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 264
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->clientChallenge:[B

    if-nez v0, :cond_0

    .line 265
    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$100()[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->clientChallenge:[B

    .line 267
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->clientChallenge:[B

    return-object v0
.end method

.method public getClientChallenge2()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 272
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->clientChallenge2:[B

    if-nez v0, :cond_0

    .line 273
    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$100()[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->clientChallenge2:[B

    .line 275
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->clientChallenge2:[B

    return-object v0
.end method

.method public getLM2SessionResponse()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 384
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lm2SessionResponse:[B

    if-nez v1, :cond_0

    .line 385
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getClientChallenge()[B

    move-result-object v0

    .line 386
    .local v0, "clntChallenge":[B
    const/16 v1, 0x18

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lm2SessionResponse:[B

    .line 387
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lm2SessionResponse:[B

    array-length v2, v0

    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 388
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lm2SessionResponse:[B

    array-length v2, v0

    iget-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lm2SessionResponse:[B

    array-length v3, v3

    invoke-static {v1, v2, v3, v4}, Ljava/util/Arrays;->fill([BIIB)V

    .line 390
    .end local v0    # "clntChallenge":[B
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lm2SessionResponse:[B

    return-object v1
.end method

.method public getLMHash()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 288
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmHash:[B

    if-nez v0, :cond_0

    .line 289
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->password:Ljava/lang/String;

    invoke-static {v0}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$300(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmHash:[B

    .line 291
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmHash:[B

    return-object v0
.end method

.method public getLMResponse()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 296
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmResponse:[B

    if-nez v0, :cond_0

    .line 297
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMHash()[B

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    invoke-static {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$400([B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmResponse:[B

    .line 299
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmResponse:[B

    return-object v0
.end method

.method public getLMUserSessionKey()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x10

    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 395
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmUserSessionKey:[B

    if-nez v0, :cond_0

    .line 396
    new-array v0, v4, [B

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmUserSessionKey:[B

    .line 397
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMHash()[B

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmUserSessionKey:[B

    invoke-static {v0, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 398
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmUserSessionKey:[B

    invoke-static {v0, v3, v4, v2}, Ljava/util/Arrays;->fill([BIIB)V

    .line 400
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmUserSessionKey:[B

    return-object v0
.end method

.method public getLMv2Hash()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 320
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmv2Hash:[B

    if-nez v0, :cond_0

    .line 321
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->domain:Ljava/lang/String;

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->user:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMHash()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$600(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmv2Hash:[B

    .line 323
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmv2Hash:[B

    return-object v0
.end method

.method public getLMv2Response()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 368
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmv2Response:[B

    if-nez v0, :cond_0

    .line 369
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMv2Hash()[B

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getClientChallenge()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$900([B[B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmv2Response:[B

    .line 371
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lmv2Response:[B

    return-object v0
.end method

.method public getLanManagerSessionKey()[B
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 438
    iget-object v8, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lanManagerSessionKey:[B

    if-nez v8, :cond_0

    .line 440
    const/16 v8, 0xe

    :try_start_0
    new-array v4, v8, [B

    .line 441
    .local v4, "keyBytes":[B
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMHash()[B

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v11, 0x8

    invoke-static {v8, v9, v4, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 442
    const/16 v8, 0x8

    array-length v9, v4

    const/16 v10, -0x43

    invoke-static {v4, v8, v9, v10}, Ljava/util/Arrays;->fill([BIIB)V

    .line 443
    const/4 v8, 0x0

    invoke-static {v4, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$1200([BI)Ljava/security/Key;

    move-result-object v5

    .line 444
    .local v5, "lowKey":Ljava/security/Key;
    const/4 v8, 0x7

    invoke-static {v4, v8}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$1200([BI)Ljava/security/Key;

    move-result-object v2

    .line 445
    .local v2, "highKey":Ljava/security/Key;
    const/16 v8, 0x8

    new-array v7, v8, [B

    .line 446
    .local v7, "truncatedResponse":[B
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLMResponse()[B

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    array-length v11, v7

    invoke-static {v8, v9, v7, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 447
    const-string v8, "DES/ECB/NoPadding"

    invoke-static {v8}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 448
    .local v0, "des":Ljavax/crypto/Cipher;
    const/4 v8, 0x1

    invoke-virtual {v0, v8, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 449
    invoke-virtual {v0, v7}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v6

    .line 450
    .local v6, "lowPart":[B
    const-string v8, "DES/ECB/NoPadding"

    invoke-static {v8}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 451
    const/4 v8, 0x1

    invoke-virtual {v0, v8, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 452
    invoke-virtual {v0, v7}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v3

    .line 453
    .local v3, "highPart":[B
    const/16 v8, 0x10

    new-array v8, v8, [B

    iput-object v8, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lanManagerSessionKey:[B

    .line 454
    const/4 v8, 0x0

    iget-object v9, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lanManagerSessionKey:[B

    const/4 v10, 0x0

    array-length v11, v6

    invoke-static {v6, v8, v9, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 455
    const/4 v8, 0x0

    iget-object v9, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lanManagerSessionKey:[B

    array-length v10, v6

    array-length v11, v3

    invoke-static {v3, v8, v9, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 460
    .end local v0    # "des":Ljavax/crypto/Cipher;
    .end local v2    # "highKey":Ljava/security/Key;
    .end local v3    # "highPart":[B
    .end local v4    # "keyBytes":[B
    .end local v5    # "lowKey":Ljava/security/Key;
    .end local v6    # "lowPart":[B
    .end local v7    # "truncatedResponse":[B
    :cond_0
    iget-object v8, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->lanManagerSessionKey:[B

    return-object v8

    .line 456
    :catch_0
    move-exception v1

    .line 457
    .local v1, "e":Ljava/lang/Exception;
    new-instance v8, Lcom/ning/http/client/ntlm/NTLMEngineException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v1}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
.end method

.method public getNTLM2SessionResponse()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 376
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlm2SessionResponse:[B

    if-nez v0, :cond_0

    .line 377
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMHash()[B

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getClientChallenge()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$1000([B[B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlm2SessionResponse:[B

    .line 379
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlm2SessionResponse:[B

    return-object v0
.end method

.method public getNTLM2SessionResponseUserSessionKey()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 426
    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlm2SessionResponseUserSessionKey:[B

    if-nez v2, :cond_0

    .line 427
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getLM2SessionResponse()[B

    move-result-object v0

    .line 428
    .local v0, "ntlm2SessionResponseNonce":[B
    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    array-length v2, v2

    array-length v3, v0

    add-int/2addr v2, v3

    new-array v1, v2, [B

    .line 429
    .local v1, "sessionNonce":[B
    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    iget-object v3, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    array-length v3, v3

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 430
    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    array-length v2, v2

    array-length v3, v0

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 431
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMUserSessionKey()[B

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$1100([B[B)[B

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlm2SessionResponseUserSessionKey:[B

    .line 433
    .end local v0    # "ntlm2SessionResponseNonce":[B
    .end local v1    # "sessionNonce":[B
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlm2SessionResponseUserSessionKey:[B

    return-object v2
.end method

.method public getNTLMHash()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 304
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmHash:[B

    if-nez v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->password:Ljava/lang/String;

    invoke-static {v0}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$500(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmHash:[B

    .line 307
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmHash:[B

    return-object v0
.end method

.method public getNTLMResponse()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 312
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmResponse:[B

    if-nez v0, :cond_0

    .line 313
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMHash()[B

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    invoke-static {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$400([B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmResponse:[B

    .line 315
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmResponse:[B

    return-object v0
.end method

.method public getNTLMUserSessionKey()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 405
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmUserSessionKey:[B

    if-nez v1, :cond_0

    .line 406
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;

    invoke-direct {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;-><init>()V

    .line 407
    .local v0, "md4":Lcom/ning/http/client/ntlm/NTLMEngine$MD4;
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMHash()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->update([B)V

    .line 408
    invoke-virtual {v0}, Lcom/ning/http/client/ntlm/NTLMEngine$MD4;->getOutput()[B

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmUserSessionKey:[B

    .line 410
    .end local v0    # "md4":Lcom/ning/http/client/ntlm/NTLMEngine$MD4;
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmUserSessionKey:[B

    return-object v1
.end method

.method public getNTLMv2Blob()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 352
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Blob:[B

    if-nez v0, :cond_0

    .line 353
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getClientChallenge2()[B

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->targetInformation:[B

    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getTimestamp()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$800([B[B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Blob:[B

    .line 355
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Blob:[B

    return-object v0
.end method

.method public getNTLMv2Hash()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 328
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Hash:[B

    if-nez v0, :cond_0

    .line 329
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->domain:Ljava/lang/String;

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->user:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMHash()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$700(Ljava/lang/String;Ljava/lang/String;[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Hash:[B

    .line 331
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Hash:[B

    return-object v0
.end method

.method public getNTLMv2Response()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 360
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Response:[B

    if-nez v0, :cond_0

    .line 361
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMv2Hash()[B

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->challenge:[B

    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMv2Blob()[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$900([B[B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Response:[B

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2Response:[B

    return-object v0
.end method

.method public getNTLMv2UserSessionKey()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x10

    const/4 v3, 0x0

    .line 415
    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2UserSessionKey:[B

    if-nez v2, :cond_0

    .line 416
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMv2Hash()[B

    move-result-object v0

    .line 417
    .local v0, "ntlmv2hash":[B
    new-array v1, v4, [B

    .line 418
    .local v1, "truncatedResponse":[B
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->getNTLMv2Response()[B

    move-result-object v2

    invoke-static {v2, v3, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 419
    invoke-static {v1, v0}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$1100([B[B)[B

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2UserSessionKey:[B

    .line 421
    .end local v0    # "ntlmv2hash":[B
    .end local v1    # "truncatedResponse":[B
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->ntlmv2UserSessionKey:[B

    return-object v2
.end method

.method public getSecondaryKey()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 280
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->secondaryKey:[B

    if-nez v0, :cond_0

    .line 281
    invoke-static {}, Lcom/ning/http/client/ntlm/NTLMEngine;->access$200()[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->secondaryKey:[B

    .line 283
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->secondaryKey:[B

    return-object v0
.end method

.method public getTimestamp()[B
    .locals 7

    .prologue
    const/16 v6, 0x8

    .line 336
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->timestamp:[B

    if-nez v1, :cond_0

    .line 337
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 338
    .local v2, "time":J
    const-wide v4, 0xa9730b66800L

    add-long/2addr v2, v4

    .line 339
    const-wide/16 v4, 0x2710

    mul-long/2addr v2, v4

    .line 341
    new-array v1, v6, [B

    iput-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->timestamp:[B

    .line 342
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v6, :cond_0

    .line 343
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->timestamp:[B

    long-to-int v4, v2

    int-to-byte v4, v4

    aput-byte v4, v1, v0

    .line 344
    ushr-long/2addr v2, v6

    .line 342
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 347
    .end local v0    # "i":I
    .end local v2    # "time":J
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/ntlm/NTLMEngine$CipherGen;->timestamp:[B

    return-object v1
.end method
