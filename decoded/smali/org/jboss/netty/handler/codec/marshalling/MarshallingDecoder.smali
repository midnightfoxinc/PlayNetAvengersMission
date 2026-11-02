.class public Lorg/jboss/netty/handler/codec/marshalling/MarshallingDecoder;
.super Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;
.source "MarshallingDecoder.java"


# instance fields
.field private final provider:Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;)V
    .locals 1
    .param p1, "provider"    # Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;

    .prologue
    .line 46
    const/high16 v0, 0x100000

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/marshalling/MarshallingDecoder;-><init>(Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;I)V

    .line 47
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;I)V
    .locals 6
    .param p1, "provider"    # Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;
    .param p2, "maxObjectSize"    # I

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 58
    move-object v0, p0

    move v1, p2

    move v4, v2

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;-><init>(IIIII)V

    .line 59
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/marshalling/MarshallingDecoder;->provider:Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;

    .line 60
    return-void
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 5
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 66
    invoke-super {p0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 67
    .local v0, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-nez v0, :cond_0

    .line 68
    const/4 v2, 0x0

    .line 78
    :goto_0
    return-object v2

    .line 71
    :cond_0
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/marshalling/MarshallingDecoder;->provider:Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;

    invoke-interface {v4, p1}, Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;->getUnmarshaller(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/marshalling/Unmarshaller;

    move-result-object v3

    .line 72
    .local v3, "unmarshaller":Lorg/jboss/marshalling/Unmarshaller;
    new-instance v1, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;

    invoke-direct {v1, v0}, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 75
    .local v1, "input":Lorg/jboss/marshalling/ByteInput;
    :try_start_0
    invoke-interface {v3, v1}, Lorg/jboss/marshalling/Unmarshaller;->start(Lorg/jboss/marshalling/ByteInput;)V

    .line 76
    invoke-interface {v3}, Lorg/jboss/marshalling/Unmarshaller;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 77
    .local v2, "obj":Ljava/lang/Object;
    invoke-interface {v3}, Lorg/jboss/marshalling/Unmarshaller;->finish()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    invoke-interface {v3}, Lorg/jboss/marshalling/Unmarshaller;->close()V

    goto :goto_0

    .end local v2    # "obj":Ljava/lang/Object;
    :catchall_0
    move-exception v4

    invoke-interface {v3}, Lorg/jboss/marshalling/Unmarshaller;->close()V

    throw v4
.end method

.method protected extractFrame(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "index"    # I
    .param p3, "length"    # I

    .prologue
    .line 88
    invoke-interface {p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method
