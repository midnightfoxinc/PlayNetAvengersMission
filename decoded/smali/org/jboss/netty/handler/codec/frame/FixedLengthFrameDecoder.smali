.class public Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;
.super Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.source "FixedLengthFrameDecoder.java"


# instance fields
.field private final allocateFullBuffer:Z

.field private final frameLength:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "frameLength"    # I

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;-><init>(IZ)V

    .line 49
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 3
    .param p1, "frameLength"    # I
    .param p2, "allocateFullBuffer"    # Z

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>()V

    .line 61
    if-gtz p1, :cond_0

    .line 62
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "frameLength must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;->frameLength:I

    .line 66
    iput-boolean p2, p0, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;->allocateFullBuffer:Z

    .line 67
    return-void
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 72
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    iget v2, p0, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;->frameLength:I

    if-ge v1, v2, :cond_0

    .line 73
    const/4 v0, 0x0

    .line 77
    :goto_0
    return-object v0

    .line 75
    :cond_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    iget v2, p0, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;->frameLength:I

    invoke-virtual {p0, p3, v1, v2}, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;->extractFrame(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 76
    .local v0, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget v1, p0, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;->frameLength:I

    invoke-interface {p3, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    goto :goto_0
.end method

.method protected newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "minimumCapacity"    # I

    .prologue
    .line 83
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    .line 84
    .local v0, "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;->allocateFullBuffer:Z

    if-eqz v1, :cond_0

    .line 85
    iget v1, p0, Lorg/jboss/netty/handler/codec/frame/FixedLengthFrameDecoder;->frameLength:I

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 87
    :goto_0
    return-object v1

    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    goto :goto_0
.end method
