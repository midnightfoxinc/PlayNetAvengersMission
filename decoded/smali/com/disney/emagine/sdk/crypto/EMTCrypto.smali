.class public Lcom/disney/emagine/sdk/crypto/EMTCrypto;
.super Ljava/lang/Object;
.source "EMTCrypto.java"


# static fields
.field public static final AES_BLOCK_SIZE:I = 0x10

.field public static final AES_CBC:Ljava/lang/String; = "AES/CBC/NoPadding"

.field public static final AES_CBC_PKCS5:Ljava/lang/String; = "AES/CBC/PKCS5Padding"

.field public static final AES_CBC_PKCS7:Ljava/lang/String; = "AES/CBC/PKCS7Padding"

.field public static final AES_CCM:Ljava/lang/String; = "AES/CCM/NoPadding"

.field public static final AES_CCM_PKCS5:Ljava/lang/String; = "AES/CCM/PKCS5Padding"

.field public static final AES_CCM_PKCS7:Ljava/lang/String; = "AES/CCM/PKCS7Padding"

.field public static final AES_CTR:Ljava/lang/String; = "AES/CTR/NoPadding"

.field public static final AES_ECB_PKCS7:Ljava/lang/String; = "AES/ECB/PKCS7Padding"

.field public static final AES_KEY_SIZE:I = 0x10

.field public static final CCM_BLOCK_A0_FLAGS:B = 0x1t

.field public static final CCM_MAC_SIZE:I = 0x4

.field public static final CCM_NONCE_SIZE:I = 0xd

.field public static final CC_SHA1_DIGEST_LENGTH:I = 0x14

.field public static final CryptoDebug:Z = false

.field public static final CryptoKeyTest:Z = false

.field public static final CryptoOn:Z = true

.field public static final CryptoTest:Z

.field public static final CryptoTestText:Z

.field private static final TAG:Ljava/lang/String;

.field private static mConsole:Lcom/disney/emagine/sdk/EMTConsole;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 67
    return-void
.end method

.method private static AESJNI()Lcom/disney/emagine/sdk/crypto/AESjni;
    .locals 1

    .prologue
    .line 167
    invoke-static {}, Lcom/disney/emagine/sdk/crypto/AESjni;->sharedInstance()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v0

    return-object v0
.end method

.method public static aesCBCDecrypt([B[B[B)[B
    .locals 2
    .param p0, "data"    # [B
    .param p1, "iv"    # [B
    .param p2, "key"    # [B

    .prologue
    .line 259
    invoke-static {}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->AESJNI()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v0

    array-length v1, p0

    invoke-virtual {v0, p0, v1, p1, p2}, Lcom/disney/emagine/sdk/crypto/AESjni;->aesCBCDecrypt([BI[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static aesCBCEncrypt([B[B[B)[B
    .locals 2
    .param p0, "data"    # [B
    .param p1, "iv"    # [B
    .param p2, "key"    # [B

    .prologue
    .line 238
    invoke-static {}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->AESJNI()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v0

    array-length v1, p0

    invoke-virtual {v0, p0, v1, p1, p2}, Lcom/disney/emagine/sdk/crypto/AESjni;->aesCBCEncrypt([BI[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static aesCCMDecrypt([BI[B[B)[B
    .locals 1
    .param p0, "data"    # [B
    .param p1, "length"    # I
    .param p2, "nonce"    # [B
    .param p3, "key"    # [B

    .prologue
    .line 217
    invoke-static {}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->AESJNI()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/disney/emagine/sdk/crypto/AESjni;->aesCCMDecrypt([BI[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static aesCCMEncrypt([BI[B[B)[B
    .locals 1
    .param p0, "data"    # [B
    .param p1, "length"    # I
    .param p2, "nonce"    # [B
    .param p3, "key"    # [B

    .prologue
    .line 192
    invoke-static {}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->AESJNI()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/disney/emagine/sdk/crypto/AESjni;->aesCCMEncrypt([BI[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static aesDecrypt([B[B)[B
    .locals 5
    .param p0, "data"    # [B
    .param p1, "key"    # [B

    .prologue
    .line 421
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "AES"

    invoke-direct {v3, p1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 422
    .local v3, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v1, 0x0

    .line 426
    .local v1, "decrypted":[B
    :try_start_0
    const-string v4, "AES/CBC/PKCS5Padding"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 428
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v4, 0x2

    invoke-virtual {v0, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 430
    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_4

    move-result-object v1

    .line 453
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    :goto_0
    return-object v1

    .line 432
    :catch_0
    move-exception v2

    .line 434
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v2}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 436
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v2

    .line 438
    .local v2, "e":Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v2}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0

    .line 440
    .end local v2    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v2

    .line 442
    .local v2, "e":Ljava/security/InvalidKeyException;
    invoke-virtual {v2}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_0

    .line 444
    .end local v2    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v2

    .line 446
    .local v2, "e":Ljavax/crypto/IllegalBlockSizeException;
    invoke-virtual {v2}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_0

    .line 448
    .end local v2    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catch_4
    move-exception v2

    .line 450
    .local v2, "e":Ljavax/crypto/BadPaddingException;
    invoke-virtual {v2}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static aesEncrypt([B[B)[B
    .locals 5
    .param p0, "data"    # [B
    .param p1, "key"    # [B

    .prologue
    .line 376
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "AES"

    invoke-direct {v3, p1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 377
    .local v3, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v2, 0x0

    .line 381
    .local v2, "encrypted":[B
    :try_start_0
    const-string v4, "AES/CBC/PKCS5Padding"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 383
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v4, 0x1

    invoke-virtual {v0, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 385
    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_4

    move-result-object v2

    .line 408
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    :goto_0
    return-object v2

    .line 387
    :catch_0
    move-exception v1

    .line 389
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 391
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 393
    .local v1, "e":Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v1}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0

    .line 395
    .end local v1    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v1

    .line 397
    .local v1, "e":Ljava/security/InvalidKeyException;
    invoke-virtual {v1}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_0

    .line 399
    .end local v1    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v1

    .line 401
    .local v1, "e":Ljavax/crypto/IllegalBlockSizeException;
    invoke-virtual {v1}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_0

    .line 403
    .end local v1    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catch_4
    move-exception v1

    .line 405
    .local v1, "e":Ljavax/crypto/BadPaddingException;
    invoke-virtual {v1}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static decrypt(Ljava/lang/String;[B[B[B)[B
    .locals 6
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "data"    # [B
    .param p2, "iv"    # [B
    .param p3, "key"    # [B

    .prologue
    .line 326
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    const-string v5, "AES"

    invoke-direct {v4, p3, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 327
    .local v4, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, p2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 328
    .local v3, "nonceIV":Ljavax/crypto/spec/IvParameterSpec;
    const/4 v1, 0x0

    .line 332
    .local v1, "decrypted":[B
    :try_start_0
    invoke-static {p0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 334
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v5, 0x2

    invoke-virtual {v0, v5, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 336
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_5

    move-result-object v1

    .line 363
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    :goto_0
    return-object v1

    .line 338
    :catch_0
    move-exception v2

    .line 340
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v2}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 342
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v2

    .line 344
    .local v2, "e":Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v2}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0

    .line 346
    .end local v2    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v2

    .line 348
    .local v2, "e":Ljava/security/InvalidKeyException;
    invoke-virtual {v2}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_0

    .line 350
    .end local v2    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v2

    .line 352
    .local v2, "e":Ljavax/crypto/IllegalBlockSizeException;
    invoke-virtual {v2}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_0

    .line 354
    .end local v2    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catch_4
    move-exception v2

    .line 356
    .local v2, "e":Ljavax/crypto/BadPaddingException;
    invoke-virtual {v2}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_0

    .line 358
    .end local v2    # "e":Ljavax/crypto/BadPaddingException;
    :catch_5
    move-exception v2

    .line 360
    .local v2, "e":Ljava/security/InvalidAlgorithmParameterException;
    invoke-virtual {v2}, Ljava/security/InvalidAlgorithmParameterException;->printStackTrace()V

    goto :goto_0
.end method

.method public static encrypt(Ljava/lang/String;[B[B[B)[B
    .locals 6
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "data"    # [B
    .param p2, "iv"    # [B
    .param p3, "key"    # [B

    .prologue
    .line 274
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    const-string v5, "AES"

    invoke-direct {v4, p3, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 275
    .local v4, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, p2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 276
    .local v3, "nonceIV":Ljavax/crypto/spec/IvParameterSpec;
    const/4 v2, 0x0

    .line 280
    .local v2, "encrypted":[B
    :try_start_0
    invoke-static {p0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 282
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v5, 0x1

    invoke-virtual {v0, v5, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 284
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_5

    move-result-object v2

    .line 311
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    :goto_0
    return-object v2

    .line 286
    :catch_0
    move-exception v1

    .line 288
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 290
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 292
    .local v1, "e":Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v1}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0

    .line 294
    .end local v1    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_2
    move-exception v1

    .line 296
    .local v1, "e":Ljava/security/InvalidKeyException;
    invoke-virtual {v1}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_0

    .line 298
    .end local v1    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v1

    .line 300
    .local v1, "e":Ljavax/crypto/IllegalBlockSizeException;
    invoke-virtual {v1}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_0

    .line 302
    .end local v1    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catch_4
    move-exception v1

    .line 304
    .local v1, "e":Ljavax/crypto/BadPaddingException;
    invoke-virtual {v1}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_0

    .line 306
    .end local v1    # "e":Ljavax/crypto/BadPaddingException;
    :catch_5
    move-exception v1

    .line 308
    .local v1, "e":Ljava/security/InvalidAlgorithmParameterException;
    invoke-virtual {v1}, Ljava/security/InvalidAlgorithmParameterException;->printStackTrace()V

    goto :goto_0
.end method

.method public static generateNonceIV([B)[B
    .locals 4
    .param p0, "nonce"    # [B

    .prologue
    const/4 v3, 0x0

    .line 95
    const/16 v1, 0x10

    new-array v0, v1, [B

    .line 97
    .local v0, "nonceIV":[B
    invoke-static {v0, v3}, Lcom/disney/emagine/sdk/EMTData;->memsetBytes([BB)[B

    .line 99
    const/4 v1, 0x1

    const/16 v2, 0xd

    invoke-static {p0, v3, v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 101
    return-object v0
.end method

.method public static generateSeedBytes(I)[B
    .locals 2
    .param p0, "numBytes"    # I

    .prologue
    .line 78
    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    .line 79
    .local v1, "sr2":Ljava/security/SecureRandom;
    invoke-virtual {v1, p0}, Ljava/security/SecureRandom;->generateSeed(I)[B

    move-result-object v0

    .line 81
    .local v0, "bytes":[B
    return-object v0
.end method

.method public static print_block([B)V
    .locals 7
    .param p0, "block"    # [B

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 111
    if-nez p0, :cond_0

    .line 113
    sget-object v2, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->TAG:Ljava/lang/String;

    const-string v4, "Null"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    :goto_0
    return-void

    .line 118
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 120
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 122
    const-string v2, "%02X"

    new-array v3, v6, [Ljava/lang/Object;

    aget-byte v4, p0, v1

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 125
    :cond_1
    const-string v2, " (%d bytes)"

    new-array v3, v6, [Ljava/lang/Object;

    array-length v4, p0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    sget-object v2, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static print_block([BI)V
    .locals 7
    .param p0, "block"    # [B
    .param p1, "len"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 137
    if-nez p0, :cond_0

    .line 139
    sget-object v2, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->TAG:Ljava/lang/String;

    const-string v4, "Null"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    :goto_0
    return-void

    .line 144
    :cond_0
    array-length v2, p0

    if-le p1, v2, :cond_1

    .line 146
    array-length p1, p0

    .line 149
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 151
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    if-ge v1, p1, :cond_2

    .line 153
    const-string v2, "%02X"

    new-array v3, v6, [Ljava/lang/Object;

    aget-byte v4, p0, v1

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 151
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 156
    :cond_2
    const-string v2, " (%d bytes)"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 158
    sget-object v2, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
