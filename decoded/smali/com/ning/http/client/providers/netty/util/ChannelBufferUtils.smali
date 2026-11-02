.class public Lcom/ning/http/client/providers/netty/util/ChannelBufferUtils;
.super Ljava/lang/Object;
.source "ChannelBufferUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static channelBuffer2bytes(Lorg/jboss/netty/buffer/ChannelBuffer;)[B
    .locals 5
    .param p0, "b"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 21
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    .line 22
    .local v2, "readable":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    .line 23
    .local v3, "readerIndex":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 24
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v0

    .line 25
    .local v0, "array":[B
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v4

    if-nez v4, :cond_0

    if-nez v3, :cond_0

    array-length v4, v0

    if-ne v4, v2, :cond_0

    move-object v1, v0

    .line 31
    .end local v0    # "array":[B
    .local v1, "array":[B
    :goto_0
    return-object v1

    .line 29
    .end local v1    # "array":[B
    :cond_0
    new-array v0, v2, [B

    .line 30
    .restart local v0    # "array":[B
    invoke-interface {p0, v3, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[B)V

    move-object v1, v0

    .line 31
    .end local v0    # "array":[B
    .restart local v1    # "array":[B
    goto :goto_0
.end method
