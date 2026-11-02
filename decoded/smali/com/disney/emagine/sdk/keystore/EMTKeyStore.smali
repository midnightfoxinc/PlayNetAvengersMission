.class public Lcom/disney/emagine/sdk/keystore/EMTKeyStore;
.super Ljava/lang/Object;
.source "EMTKeyStore.java"


# static fields
.field public static final ANALYTICS_DICTIONARY_KEY:Ljava/lang/String; = "EM_ANALYTICS_FILES"

.field public static final ANALYTICS_KEYCHAIN_SERVICE:Ljava/lang/String; = "EM_ANALYTICS_SERVICE"

.field public static final FACTORY_KEY:Ljava/lang/String; = "FACTORY_KEY"

.field public static final HASH_KEY:Ljava/lang/String; = "keyHash"

.field public static final KEYCHAIN_SERVICE:Ljava/lang/String; = "eMagine"

.field public static final OWNER_KEY:Ljava/lang/String; = "OWNER_KEY"

.field public static final SESSION_KEY:Ljava/lang/String; = "SESSION_KEY"

.field public static final SWID_KEY:Ljava/lang/String; = "swid"

.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;


# instance fields
.field private appKey:[B

.field private factoryKey:[B

.field public keysDict:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private ownerKey:[B

.field private sessionKey:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 53
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->keysDict:Ljava/util/HashMap;

    .line 54
    invoke-static {}, Lcom/disney/emagine/sdk/crypto/AESjni;->sharedInstance()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/crypto/AESjni;->getFactoryKey()[B

    move-result-object v1

    iput-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->factoryKey:[B

    .line 55
    const-string v1, "OWNER_KEY"

    const-string v2, "eMagine"

    invoke-static {v1, v2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->stringForKeyService(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "ownerKeyString":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 58
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->ownerKey:[B

    .line 61
    :cond_0
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->keysDict:Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "FACTORY_KEY"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->keysDict:Ljava/util/HashMap;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OWNER_KEY"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->keysDict:Ljava/util/HashMap;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "SESSION_KEY"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    return-void
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStore;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->instance:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->instance:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    .line 81
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->instance:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    return-object v0
.end method


# virtual methods
.method public appKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 282
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey:[B

    if-nez v0, :cond_0

    .line 284
    const/4 v0, 0x0

    .line 287
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey:[B

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public clearKeyForSlot(B)Z
    .locals 2
    .param p1, "slot"    # B

    .prologue
    .line 277
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->indexForKey(B)Ljava/lang/String;

    move-result-object v0

    const-string v1, "eMagine"

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeItemForKeyService(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public encryptProxyToken(Ljava/lang/String;[B)Ljava/lang/String;
    .locals 7
    .param p1, "tokenString"    # Ljava/lang/String;
    .param p2, "ivData"    # [B

    .prologue
    const/16 v6, 0x10

    const/4 v5, 0x0

    .line 141
    new-array v3, v6, [B

    .line 143
    .local v3, "iv":[B
    invoke-static {p2, v5, v3, v5, v6}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 145
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 146
    .local v1, "data":[B
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 148
    .local v4, "length":I
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->factoryKey:[B

    invoke-static {v1, v4, v3, v5}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->aesCCMEncrypt([BI[B[B)[B

    move-result-object v2

    .line 150
    .local v2, "encryptedData":[B
    if-nez v2, :cond_0

    .line 152
    const/4 v5, 0x0

    .line 157
    :goto_0
    return-object v5

    .line 155
    :cond_0
    array-length v5, v2

    invoke-static {v2, v5}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v0

    .line 157
    .local v0, "bytesEncoded":[B
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_0
.end method

.method public factoryKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->factoryKey:[B

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public generateAppKey()[B
    .locals 10

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 102
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->swid()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 104
    .local v3, "swidToken":Ljava/lang/String;
    iput-object v6, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey:[B

    .line 106
    new-instance v7, Lcom/disney/emagine/sdk/apple/NSAssert;

    if-eqz v3, :cond_1

    const/4 v4, 0x1

    :goto_0
    const-string v8, "Error: you need to set the swid value in order to gernerate the App Key"

    invoke-direct {v7, v4, v8}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 109
    const-string v4, "-"

    const-string v7, ""

    invoke-virtual {v3, v4, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 111
    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "*** SWID = \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 115
    .local v2, "swidData":[B
    const/4 v1, 0x0

    .line 119
    .local v1, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string v4, "SHA1"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 121
    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->factoryKey:[B

    invoke-virtual {v1, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 122
    invoke-virtual {v1, v2}, Ljava/security/MessageDigest;->update([B)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    if-eqz v1, :cond_0

    .line 133
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    const/16 v6, 0x10

    invoke-static {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v4

    iput-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey:[B

    .line 136
    :cond_0
    iget-object v4, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey:[B

    :goto_1
    return-object v4

    .end local v1    # "md":Ljava/security/MessageDigest;
    .end local v2    # "swidData":[B
    :cond_1
    move v4, v5

    .line 106
    goto :goto_0

    .line 124
    .restart local v1    # "md":Ljava/security/MessageDigest;
    .restart local v2    # "swidData":[B
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    move-object v4, v6

    .line 128
    goto :goto_1
.end method

.method public hashKeyForSlot(B)[B
    .locals 8
    .param p1, "slot"    # B

    .prologue
    .line 182
    const/4 v3, 0x0

    .line 183
    .local v3, "md":Ljava/security/MessageDigest;
    const/4 v0, 0x0

    .line 185
    .local v0, "digestData":[B
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey:[B

    if-nez v5, :cond_0

    .line 187
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->generateAppKey()[B

    .line 191
    :cond_0
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey:[B

    if-nez v5, :cond_1

    .line 193
    const/4 v5, 0x0

    .line 219
    :goto_0
    return-object v5

    .line 198
    :cond_1
    :try_start_0
    const-string v5, "SHA1"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 201
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey:[B

    invoke-virtual {v3, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 204
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->indexForKey(B)Ljava/lang/String;

    move-result-object v2

    .line 205
    .local v2, "keySlot":Ljava/lang/String;
    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8Bytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 207
    .local v4, "utfSlot":[B
    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->update([B)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    .end local v2    # "keySlot":Ljava/lang/String;
    .end local v4    # "utfSlot":[B
    :goto_1
    if-eqz v3, :cond_2

    .line 216
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    const/4 v6, 0x0

    const/16 v7, 0x14

    invoke-static {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v0

    :cond_2
    move-object v5, v0

    .line 219
    goto :goto_0

    .line 209
    :catch_0
    move-exception v1

    .line 211
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_1
.end method

.method public indexForKey(B)Ljava/lang/String;
    .locals 6
    .param p1, "slot"    # B

    .prologue
    .line 86
    const/4 v2, 0x0

    .line 90
    .local v2, "indexString":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->keysDict:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_0
    return-object v2

    .line 92
    :catch_0
    move-exception v1

    .line 94
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->TAG:Ljava/lang/String;

    const-string v5, "Error, keyIndex does not exist."

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public isKeyAvailable(B)Z
    .locals 4
    .param p1, "slot"    # B

    .prologue
    .line 404
    const/4 v1, 0x0

    .line 408
    .local v1, "result":Z
    packed-switch p1, :pswitch_data_0

    .line 430
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->indexForKey(B)Ljava/lang/String;

    move-result-object v2

    const-string v3, "eMagine"

    invoke-static {v2, v3}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->dataForKeyService(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 432
    .local v0, "encryptedKey":[B
    if-eqz v0, :cond_0

    .line 434
    const/4 v1, 0x1

    .line 444
    .end local v0    # "encryptedKey":[B
    :cond_0
    :goto_0
    return v1

    .line 411
    :pswitch_0
    const/4 v1, 0x1

    .line 412
    goto :goto_0

    .line 415
    :pswitch_1
    iget-object v2, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sessionKey:[B

    if-eqz v2, :cond_0

    .line 417
    const/4 v1, 0x1

    goto :goto_0

    .line 422
    :pswitch_2
    iget-object v2, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->ownerKey:[B

    if-eqz v2, :cond_0

    .line 424
    const/4 v1, 0x1

    goto :goto_0

    .line 408
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public keyForSlot(B)[B
    .locals 4
    .param p1, "slot"    # B

    .prologue
    .line 245
    const/4 v0, 0x0

    .line 247
    .local v0, "key":[B
    packed-switch p1, :pswitch_data_0

    .line 266
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->TAG:Ljava/lang/String;

    const-string v3, "Error: keyForSlot index undefined."

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    :goto_0
    return-object v0

    .line 250
    :pswitch_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->factoryKey:[B

    .line 252
    goto :goto_0

    .line 255
    :pswitch_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sessionKey:[B

    .line 257
    goto :goto_0

    .line 260
    :pswitch_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->ownerKey:[B

    .line 262
    goto :goto_0

    .line 247
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public keyHash()Ljava/lang/String;
    .locals 3

    .prologue
    .line 392
    const-string v1, "keyHash"

    const-string v2, "eMagine"

    invoke-static {v1, v2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->stringForKeyService(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 399
    .local v0, "keyHash":Ljava/lang/String;
    return-object v0
.end method

.method public ownerKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 337
    const/4 v0, 0x0

    .line 339
    .local v0, "ownerKeyString":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->ownerKey:[B

    if-nez v1, :cond_0

    .line 341
    const/4 v1, 0x0

    .line 353
    :goto_0
    return-object v1

    .line 345
    :cond_0
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->ownerKey:[B

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .line 353
    goto :goto_0
.end method

.method public proxyToken(Ljava/lang/String;[B)Ljava/lang/String;
    .locals 8
    .param p1, "encryptedTokenString"    # Ljava/lang/String;
    .param p2, "ivData"    # [B

    .prologue
    const/16 v7, 0x10

    const/4 v6, 0x0

    .line 162
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-static {p1, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    .line 163
    .local v1, "encryptedToken":[B
    array-length v3, v1

    .line 164
    .local v3, "length":I
    new-array v2, v7, [B

    .line 166
    .local v2, "iv":[B
    invoke-static {p2, v6, v2, v6, v7}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 168
    iget-object v5, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->factoryKey:[B

    invoke-static {v1, v3, v2, v5}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->aesCCMDecrypt([BI[B[B)[B

    move-result-object v0

    .line 170
    .local v0, "decryptedData":[B
    if-nez v0, :cond_0

    .line 172
    const/4 v4, 0x0

    .line 177
    :goto_0
    return-object v4

    .line 175
    :cond_0
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToASCIIString([B)Ljava/lang/String;

    move-result-object v4

    .line 177
    .local v4, "token":Ljava/lang/String;
    goto :goto_0
.end method

.method public sessionKey()Ljava/lang/String;
    .locals 3

    .prologue
    .line 369
    const-string v1, "SESSION_KEY"

    const-string v2, "eMagine"

    invoke-static {v1, v2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->stringForKeyService(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 376
    .local v0, "sessionKey":Ljava/lang/String;
    return-object v0
.end method

.method public setKeyForSlot([BB)V
    .locals 3
    .param p1, "key"    # [B
    .param p2, "slot"    # B

    .prologue
    .line 224
    packed-switch p2, :pswitch_data_0

    .line 241
    :cond_0
    :goto_0
    return-void

    .line 227
    :pswitch_0
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->setOwnerKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 229
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->TAG:Ljava/lang/String;

    const-string v2, "******* Set RADIO_KEY_OWNER failed."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 234
    :pswitch_1
    iput-object p1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sessionKey:[B

    goto :goto_0

    .line 224
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setKeyHash(Ljava/lang/String;)Z
    .locals 2
    .param p1, "keyHash"    # Ljava/lang/String;

    .prologue
    .line 386
    const-string v0, "keyHash"

    const-string v1, "eMagine"

    invoke-static {p1, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setStringForKeyService(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setOwnerKey(Ljava/lang/String;)Z
    .locals 2
    .param p1, "ownerKeyString"    # Ljava/lang/String;

    .prologue
    .line 329
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->ownerKey:[B

    .line 331
    const-string v0, "OWNER_KEY"

    const-string v1, "eMagine"

    invoke-static {p1, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setStringForKeyService(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setSessionKey(Ljava/lang/String;)Z
    .locals 2
    .param p1, "sessionKey"    # Ljava/lang/String;

    .prologue
    .line 363
    const-string v0, "SESSION_KEY"

    const-string v1, "eMagine"

    invoke-static {p1, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setStringForKeyService(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setSwid(Ljava/lang/String;)Z
    .locals 4
    .param p1, "swid"    # Ljava/lang/String;

    .prologue
    .line 302
    iget-object v0, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "******* Storing swid = \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    const-string v0, "swid"

    const-string v1, "eMagine"

    invoke-static {p1, v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setStringForKeyService(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public swid()Ljava/lang/String;
    .locals 5

    .prologue
    .line 311
    const-string v1, "swid"

    const-string v2, "eMagine"

    invoke-static {v1, v2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->stringForKeyService(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, "swid":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "******* Fetching swid = \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    return-object v0
.end method
