.class public Lcom/ning/http/client/oauth/ThreadSafeHMAC;
.super Ljava/lang/Object;
.source "ThreadSafeHMAC.java"


# static fields
.field private static final HMAC_SHA1_ALGORITHM:Ljava/lang/String; = "HmacSHA1"


# instance fields
.field private final mac:Ljavax/crypto/Mac;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/oauth/ConsumerKey;Lcom/ning/http/client/oauth/RequestToken;)V
    .locals 5
    .param p1, "consumerAuth"    # Lcom/ning/http/client/oauth/ConsumerKey;
    .param p2, "userAuth"    # Lcom/ning/http/client/oauth/RequestToken;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v2

    .line 45
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Lcom/ning/http/client/oauth/ConsumerKey;->getSecret()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 46
    const/16 v4, 0x26

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    invoke-virtual {p2}, Lcom/ning/http/client/oauth/RequestToken;->getSecret()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 48
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {v2, v4}, Lcom/ning/http/util/StringUtils;->charSequence2Bytes(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)[B

    move-result-object v1

    .line 49
    .local v1, "keyBytes":[B
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "HmacSHA1"

    invoke-direct {v3, v1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 53
    .local v3, "signingKey":Ljavax/crypto/spec/SecretKeySpec;
    :try_start_0
    const-string v4, "HmacSHA1"

    invoke-static {v4}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v4

    iput-object v4, p0, Lcom/ning/http/client/oauth/ThreadSafeHMAC;->mac:Ljavax/crypto/Mac;

    .line 54
    iget-object v4, p0, Lcom/ning/http/client/oauth/ThreadSafeHMAC;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v4, v3}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method


# virtual methods
.method public declared-synchronized digest(Ljava/nio/ByteBuffer;)[B
    .locals 1
    .param p1, "message"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 62
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/oauth/ThreadSafeHMAC;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v0}, Ljavax/crypto/Mac;->reset()V

    .line 63
    iget-object v0, p0, Lcom/ning/http/client/oauth/ThreadSafeHMAC;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v0, p1}, Ljavax/crypto/Mac;->update(Ljava/nio/ByteBuffer;)V

    .line 64
    iget-object v0, p0, Lcom/ning/http/client/oauth/ThreadSafeHMAC;->mac:Ljavax/crypto/Mac;

    invoke-virtual {v0}, Ljavax/crypto/Mac;->doFinal()[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 62
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
