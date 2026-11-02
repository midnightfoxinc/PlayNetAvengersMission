.class final Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;
.super Ljava/lang/Object;
.source "WebSocketUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    return-void
.end method

.method static base64(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;
    .locals 2
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 85
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    sget-object v1, Lorg/jboss/netty/util/CharsetUtil;->UTF_8:Ljava/nio/charset/Charset;

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static md5(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 40
    :try_start_0
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 41
    .local v2, "md":Ljava/security/MessageDigest;
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 42
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v4

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    add-int v3, v4, v5

    .line 43
    .local v3, "offset":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    .line 44
    .local v1, "length":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v2, v4, v3, v1}, Ljava/security/MessageDigest;->update([BII)V

    .line 48
    .end local v1    # "length":I
    .end local v3    # "offset":I
    :goto_0
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    invoke-static {v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    return-object v4

    .line 46
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 49
    .end local v2    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/lang/InternalError;

    const-string v5, "MD5 not supported on this platform"

    invoke-direct {v4, v5}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method static randomBytes(I)[B
    .locals 4
    .param p0, "size"    # I

    .prologue
    .line 96
    new-array v0, p0, [B

    .line 98
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p0, :cond_0

    .line 99
    const/4 v2, 0x0

    const/16 v3, 0xff

    invoke-static {v2, v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomNumber(II)I

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 98
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 102
    :cond_0
    return-object v0
.end method

.method static randomNumber(II)I
    .locals 4
    .param p0, "min"    # I
    .param p1, "max"    # I

    .prologue
    .line 115
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    int-to-double v2, p1

    mul-double/2addr v0, v2

    int-to-double v2, p0

    add-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method static sha1(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 63
    :try_start_0
    const-string v4, "SHA1"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 64
    .local v2, "md":Ljava/security/MessageDigest;
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 65
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v4

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    add-int v3, v4, v5

    .line 66
    .local v3, "offset":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    .line 67
    .local v1, "length":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v2, v4, v3, v1}, Ljava/security/MessageDigest;->update([BII)V

    .line 71
    .end local v1    # "length":I
    .end local v3    # "offset":I
    :goto_0
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    invoke-static {v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    return-object v4

    .line 69
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 72
    .end local v2    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/lang/InternalError;

    const-string v5, "SHA-1 not supported on this platform"

    invoke-direct {v4, v5}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v4
.end method
