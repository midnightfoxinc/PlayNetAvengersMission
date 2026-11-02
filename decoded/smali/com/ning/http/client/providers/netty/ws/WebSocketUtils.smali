.class public final Lcom/ning/http/client/providers/netty/ws/WebSocketUtils;
.super Ljava/lang/Object;
.source "WebSocketUtils.java"


# static fields
.field public static final MAGIC_GUID:Ljava/lang/String; = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static base64Encode([B)Ljava/lang/String;
    .locals 1
    .param p0, "bytes"    # [B

    .prologue
    .line 55
    invoke-static {p0}, Lcom/ning/http/util/Base64;->encode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static createRandomBytes(I)[B
    .locals 4
    .param p0, "size"    # I

    .prologue
    .line 59
    new-array v0, p0, [B

    .line 61
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p0, :cond_0

    .line 62
    const/4 v2, 0x0

    const/16 v3, 0xff

    invoke-static {v2, v3}, Lcom/ning/http/client/providers/netty/ws/WebSocketUtils;->createRandomNumber(II)I

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 61
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 65
    :cond_0
    return-object v0
.end method

.method public static createRandomNumber(II)I
    .locals 4
    .param p0, "min"    # I
    .param p1, "max"    # I

    .prologue
    .line 69
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    int-to-double v2, p1

    mul-double/2addr v0, v2

    int-to-double v2, p0

    add-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method public static getAcceptKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "acceptSeed":Ljava/lang/String;
    const-string v2, "US-ASCII"

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/ws/WebSocketUtils;->sha1([B)[B

    move-result-object v1

    .line 33
    .local v1, "sha1":[B
    invoke-static {v1}, Lcom/ning/http/client/providers/netty/ws/WebSocketUtils;->base64Encode([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 26
    const/16 v1, 0x10

    invoke-static {v1}, Lcom/ning/http/client/providers/netty/ws/WebSocketUtils;->createRandomBytes(I)[B

    move-result-object v0

    .line 27
    .local v0, "nonce":[B
    invoke-static {v0}, Lcom/ning/http/client/providers/netty/ws/WebSocketUtils;->base64Encode([B)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static md5([B)[B
    .locals 4
    .param p0, "bytes"    # [B

    .prologue
    .line 38
    :try_start_0
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 39
    .local v1, "md":Ljava/security/MessageDigest;
    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 40
    .end local v1    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/lang/InternalError;

    const-string v3, "MD5 not supported on this platform"

    invoke-direct {v2, v3}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static sha1([B)[B
    .locals 4
    .param p0, "bytes"    # [B

    .prologue
    .line 47
    :try_start_0
    const-string v2, "SHA1"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 48
    .local v1, "md":Ljava/security/MessageDigest;
    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 49
    .end local v1    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/lang/InternalError;

    const-string v3, "SHA-1 not supported on this platform"

    invoke-direct {v2, v3}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v2
.end method
