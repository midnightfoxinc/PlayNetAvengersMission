.class public Lorg/jboss/netty/handler/codec/protobuf/ProtobufVarint32FrameDecoder;
.super Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.source "ProtobufVarint32FrameDecoder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>()V

    return-void
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 48
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->markReaderIndex()V

    .line 49
    const/4 v4, 0x5

    new-array v0, v4, [B

    .line 50
    .local v0, "buf":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v0

    if-ge v1, v4, :cond_4

    .line 51
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v4

    if-nez v4, :cond_0

    .line 52
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->resetReaderIndex()V

    .line 67
    :goto_1
    return-object v3

    .line 56
    :cond_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v4

    aput-byte v4, v0, v1

    .line 57
    aget-byte v4, v0, v1

    if-ltz v4, :cond_3

    .line 58
    const/4 v4, 0x0

    add-int/lit8 v5, v1, 0x1

    invoke-static {v0, v4, v5}, Lcom/google/protobuf/CodedInputStream;->newInstance([BII)Lcom/google/protobuf/CodedInputStream;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/protobuf/CodedInputStream;->readRawVarint32()I

    move-result v2

    .line 59
    .local v2, "length":I
    if-gez v2, :cond_1

    .line 60
    new-instance v3, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "negative length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 63
    :cond_1
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    if-ge v4, v2, :cond_2

    .line 64
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->resetReaderIndex()V

    goto :goto_1

    .line 67
    :cond_2
    invoke-interface {p3, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    goto :goto_1

    .line 50
    .end local v2    # "length":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 73
    :cond_4
    new-instance v3, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;

    const-string v4, "length wider than 32-bit"

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
