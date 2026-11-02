.class Lcom/kochava/android/tracker/lite/MCrypt;
.super Ljava/lang/Object;
.source "MCrypt.java"


# static fields
.field private static final ALPHA_NUMERIC_STRING:Ljava/lang/String; = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

.field private static final DATA:Ljava/lang/String; = "d"

.field private static final IV:Ljava/lang/String; = "i"

.field private static final KEY:Ljava/lang/String; = "k"

.field protected static final LOGTAG:Ljava/lang/String; = "KochavaSDKLite"


# instance fields
.field private SecretKey:Ljava/lang/String;

.field private cipher:Ljavax/crypto/Cipher;

.field private ivspec:Ljavax/crypto/spec/IvParameterSpec;

.field private ivstring:Ljava/lang/String;

.field private keyspec:Ljavax/crypto/spec/SecretKeySpec;


# direct methods
.method protected constructor <init>()V
    .locals 7

    .prologue
    const/16 v5, 0x10

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {v5}, Lcom/kochava/android/tracker/lite/MCrypt;->randomAlphaNumeric(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/kochava/android/tracker/lite/MCrypt;->SecretKey:Ljava/lang/String;

    .line 42
    invoke-static {v5}, Lcom/kochava/android/tracker/lite/MCrypt;->randomAlphaNumeric(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/kochava/android/tracker/lite/MCrypt;->ivstring:Ljava/lang/String;

    .line 44
    const/4 v3, 0x0

    .line 46
    .local v3, "iv":[B
    :try_start_0
    iget-object v4, p0, Lcom/kochava/android/tracker/lite/MCrypt;->ivstring:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 53
    :goto_0
    new-instance v4, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v4, v3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    iput-object v4, p0, Lcom/kochava/android/tracker/lite/MCrypt;->ivspec:Ljavax/crypto/spec/IvParameterSpec;

    .line 57
    :try_start_1
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v5, p0, Lcom/kochava/android/tracker/lite/MCrypt;->SecretKey:Ljava/lang/String;

    const-string v6, "UTF-8"

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    const-string v6, "AES"

    invoke-direct {v4, v5, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    iput-object v4, p0, Lcom/kochava/android/tracker/lite/MCrypt;->keyspec:Ljavax/crypto/spec/SecretKeySpec;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 65
    :goto_1
    :try_start_2
    const-string v4, "AES/CBC/PKCS7Padding"

    const-string v5, "BC"

    invoke-static {v4, v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    iput-object v4, p0, Lcom/kochava/android/tracker/lite/MCrypt;->cipher:Ljavax/crypto/Cipher;
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/security/NoSuchProviderException; {:try_start_2 .. :try_end_2} :catch_4

    .line 78
    :goto_2
    return-void

    .line 47
    :catch_0
    move-exception v2

    .line 49
    .local v2, "e2":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 58
    .end local v2    # "e2":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v1

    .line 60
    .local v1, "e1":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1

    .line 67
    .end local v1    # "e1":Ljava/io/UnsupportedEncodingException;
    :catch_2
    move-exception v0

    .line 69
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_2

    .line 71
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_3
    move-exception v0

    .line 73
    .local v0, "e":Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v0}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_2

    .line 74
    .end local v0    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_4
    move-exception v0

    .line 76
    .local v0, "e":Ljava/security/NoSuchProviderException;
    invoke-virtual {v0}, Ljava/security/NoSuchProviderException;->printStackTrace()V

    goto :goto_2
.end method

.method private encryptAES(Ljava/lang/String;)[B
    .locals 8
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 121
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v0, :cond_1

    .line 122
    :cond_0
    const-string v0, "KochavaSDKLite"

    const-string v2, "Trying to encrypt an empty string."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    :cond_1
    const/4 v4, 0x0

    .line 129
    .local v4, "encrypted":[B
    :try_start_0
    invoke-static {p1}, Lcom/kochava/android/tracker/lite/MCrypt;->padString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "UTF-8"

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 130
    .local v1, "data":[B
    iget-object v0, p0, Lcom/kochava/android/tracker/lite/MCrypt;->cipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/kochava/android/tracker/lite/MCrypt;->keyspec:Ljavax/crypto/spec/SecretKeySpec;

    iget-object v5, p0, Lcom/kochava/android/tracker/lite/MCrypt;->ivspec:Ljavax/crypto/spec/IvParameterSpec;

    invoke-virtual {v0, v2, v3, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 131
    iget-object v0, p0, Lcom/kochava/android/tracker/lite/MCrypt;->cipher:Ljavax/crypto/Cipher;

    array-length v2, v1

    invoke-virtual {v0, v2}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v0

    new-array v4, v0, [B

    .line 132
    iget-object v0, p0, Lcom/kochava/android/tracker/lite/MCrypt;->cipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x0

    array-length v3, v1

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    move-result v6

    .line 133
    .local v6, "ctLength":I
    iget-object v0, p0, Lcom/kochava/android/tracker/lite/MCrypt;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v0, v4, v6}, Ljavax/crypto/Cipher;->doFinal([BI)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    add-int/2addr v0, v6

    .line 141
    .end local v1    # "data":[B
    .end local v6    # "ctLength":I
    :cond_2
    :goto_0
    return-object v4

    .line 135
    :catch_0
    move-exception v7

    .line 138
    .local v7, "e":Ljava/lang/Exception;
    sget-boolean v0, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v0, :cond_2

    const-string v0, "KochavaSDKLite"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[encrypt] error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static encryptRSA(Ljava/lang/String;)[B
    .locals 4
    .param p0, "in"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/spec/InvalidKeySpecException;,
            Ljava/security/InvalidKeyException;,
            Ljavax/crypto/NoSuchPaddingException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 230
    const/4 v2, 0x0

    .line 232
    .local v2, "pkPublic":Ljava/security/PublicKey;
    :try_start_0
    invoke-static {}, Lcom/kochava/android/tracker/lite/MCrypt;->getPublicKey()Ljava/security/PublicKey;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 239
    :goto_0
    const-string v3, "RSA/ECB/PKCS1PADDING"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 240
    .local v1, "pkCipher":Ljavax/crypto/Cipher;
    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 241
    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v3

    return-object v3

    .line 233
    .end local v1    # "pkCipher":Ljavax/crypto/Cipher;
    :catch_0
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static getBytesFromStream(Ljava/io/InputStream;)[B
    .locals 6
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x400

    const/4 v4, 0x0

    .line 246
    new-array v0, v5, [B

    .line 248
    .local v0, "buffer":[B
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 249
    .local v2, "output":Ljava/io/ByteArrayOutputStream;
    :goto_0
    invoke-virtual {p0, v0, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .local v1, "bytesRead":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    .line 253
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 251
    :cond_0
    invoke-virtual {v2, v0, v4, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0
.end method

.method private static getPublicKey()Ljava/security/PublicKey;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 258
    const-class v4, Lcom/kochava/android/tracker/lite/KochavaSDKLite;

    const-string v5, "public_key.der"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 259
    .local v0, "is":Ljava/io/InputStream;
    invoke-static {v0}, Lcom/kochava/android/tracker/lite/MCrypt;->getBytesFromStream(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 261
    .local v1, "keyBytes":[B
    new-instance v3, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v3, v1}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 262
    .local v3, "spec":Ljava/security/spec/X509EncodedKeySpec;
    const-string v4, "RSA"

    invoke-static {v4}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v2

    .line 263
    .local v2, "kf":Ljava/security/KeyFactory;
    invoke-virtual {v2, v3}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v4

    return-object v4
.end method

.method private static padString(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "source"    # Ljava/lang/String;

    .prologue
    .line 213
    const/16 v2, 0x20

    .line 214
    .local v2, "paddingChar":C
    const/16 v3, 0x10

    .line 215
    .local v3, "size":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    rem-int v4, v5, v3

    .line 216
    .local v4, "x":I
    sub-int v1, v3, v4

    .line 218
    .local v1, "padLength":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 223
    return-object p0

    .line 220
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 218
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static randomAlphaNumeric(I)Ljava/lang/String;
    .locals 8
    .param p0, "count"    # I

    .prologue
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .local v0, "builder":Ljava/lang/StringBuilder;
    move v2, p0

    .line 83
    .end local p0    # "count":I
    .local v2, "count":I
    :goto_0
    add-int/lit8 p0, v2, -0x1

    .end local v2    # "count":I
    .restart local p0    # "count":I
    if-nez v2, :cond_0

    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 85
    :cond_0
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v4

    const-string v3, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v6, v3

    mul-double/2addr v4, v6

    double-to-int v1, v4

    .line 86
    .local v1, "character":I
    const-string v3, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v2, p0

    .end local p0    # "count":I
    .restart local v2    # "count":I
    goto :goto_0
.end method


# virtual methods
.method protected getJSONEncryptedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 93
    const-string v1, ""

    .line 96
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "{\"k\":\""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/kochava/android/tracker/lite/MCrypt;->SecretKey:Ljava/lang/String;

    invoke-static {v3}, Lcom/kochava/android/tracker/lite/MCrypt;->encryptRSA(Ljava/lang/String;)[B

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 97
    const-string v3, "\",\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "d"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\":\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p1}, Lcom/kochava/android/tracker/lite/MCrypt;->encryptAES(Ljava/lang/String;)[B

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\",\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "i"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\":\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 98
    iget-object v3, p0, Lcom/kochava/android/tracker/lite/MCrypt;->ivstring:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\"}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 96
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6

    move-result-object v1

    .line 116
    :goto_0
    return-object v1

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/security/InvalidKeyException;
    invoke-virtual {v0}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_0

    .line 101
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_1
    move-exception v0

    .line 102
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 103
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2
    move-exception v0

    .line 104
    .local v0, "e":Ljava/security/spec/InvalidKeySpecException;
    invoke-virtual {v0}, Ljava/security/spec/InvalidKeySpecException;->printStackTrace()V

    goto :goto_0

    .line 105
    .end local v0    # "e":Ljava/security/spec/InvalidKeySpecException;
    :catch_3
    move-exception v0

    .line 106
    .local v0, "e":Ljavax/crypto/NoSuchPaddingException;
    invoke-virtual {v0}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0

    .line 107
    .end local v0    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_4
    move-exception v0

    .line 108
    .local v0, "e":Ljavax/crypto/IllegalBlockSizeException;
    invoke-virtual {v0}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_0

    .line 109
    .end local v0    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catch_5
    move-exception v0

    .line 110
    .local v0, "e":Ljavax/crypto/BadPaddingException;
    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_0

    .line 111
    .end local v0    # "e":Ljavax/crypto/BadPaddingException;
    :catch_6
    move-exception v0

    .line 112
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
