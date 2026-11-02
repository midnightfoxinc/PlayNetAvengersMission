.class public Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;
.super Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
.source "CompatibleMarshallingDecoder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
        "<",
        "Lorg/jboss/netty/handler/codec/replay/VoidEnum;",
        ">;"
    }
.end annotation


# instance fields
.field private discardingTooLongFrame:Z

.field protected final maxObjectSize:I

.field protected final provider:Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;I)V
    .locals 0
    .param p1, "provider"    # Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;
    .param p2, "maxObjectSize"    # I

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>()V

    .line 57
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->provider:Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;

    .line 58
    iput p2, p0, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->maxObjectSize:I

    .line 59
    return-void
.end method


# virtual methods
.method protected bridge synthetic decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "x2"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "x3"    # Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    check-cast p4, Lorg/jboss/netty/handler/codec/replay/VoidEnum;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/replay/VoidEnum;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/replay/VoidEnum;)Ljava/lang/Object;
    .locals 8
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/replay/VoidEnum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 64
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->discardingTooLongFrame:Z

    if-eqz v5, :cond_0

    .line 65
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->actualReadableBytes()I

    move-result v5

    invoke-interface {p3, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 66
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->checkpoint()V

    .line 67
    const/4 v3, 0x0

    .line 79
    :goto_0
    return-object v3

    .line 70
    :cond_0
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->provider:Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;

    invoke-interface {v5, p1}, Lorg/jboss/netty/handler/codec/marshalling/UnmarshallerProvider;->getUnmarshaller(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/marshalling/Unmarshaller;

    move-result-object v4

    .line 71
    .local v4, "unmarshaller":Lorg/jboss/marshalling/Unmarshaller;
    new-instance v1, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;

    invoke-direct {v1, p3}, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 72
    .local v1, "input":Lorg/jboss/marshalling/ByteInput;
    iget v5, p0, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->maxObjectSize:I

    const v6, 0x7fffffff

    if-eq v5, v6, :cond_1

    .line 73
    new-instance v2, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;

    iget v5, p0, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->maxObjectSize:I

    int-to-long v6, v5

    invoke-direct {v2, v1, v6, v7}, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;-><init>(Lorg/jboss/marshalling/ByteInput;J)V

    .end local v1    # "input":Lorg/jboss/marshalling/ByteInput;
    .local v2, "input":Lorg/jboss/marshalling/ByteInput;
    move-object v1, v2

    .line 76
    .end local v2    # "input":Lorg/jboss/marshalling/ByteInput;
    .restart local v1    # "input":Lorg/jboss/marshalling/ByteInput;
    :cond_1
    :try_start_0
    invoke-interface {v4, v1}, Lorg/jboss/marshalling/Unmarshaller;->start(Lorg/jboss/marshalling/ByteInput;)V

    .line 77
    invoke-interface {v4}, Lorg/jboss/marshalling/Unmarshaller;->readObject()Ljava/lang/Object;

    move-result-object v3

    .line 78
    .local v3, "obj":Ljava/lang/Object;
    invoke-interface {v4}, Lorg/jboss/marshalling/Unmarshaller;->finish()V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    invoke-interface {v4}, Lorg/jboss/marshalling/Unmarshaller;->close()V

    goto :goto_0

    .line 80
    .end local v3    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;
    const/4 v5, 0x1

    :try_start_1
    iput-boolean v5, p0, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->discardingTooLongFrame:Z

    .line 82
    new-instance v5, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    invoke-direct {v5}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>()V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    .end local v0    # "e":Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;
    :catchall_0
    move-exception v5

    invoke-interface {v4}, Lorg/jboss/marshalling/Unmarshaller;->close()V

    throw v5
.end method

.method protected bridge synthetic decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "x2"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "x3"    # Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    check-cast p4, Lorg/jboss/netty/handler/codec/replay/VoidEnum;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/replay/VoidEnum;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/replay/VoidEnum;)Ljava/lang/Object;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/replay/VoidEnum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 94
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 105
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/marshalling/CompatibleMarshallingDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/replay/VoidEnum;)Ljava/lang/Object;

    move-result-object v0

    .line 106
    :goto_0
    :pswitch_0
    return-object v0

    .line 99
    :pswitch_1
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    invoke-interface {p3, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v1

    const/16 v2, 0x79

    if-ne v1, v2, :cond_0

    .line 100
    const/4 v1, 0x1

    invoke-interface {p3, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    goto :goto_0

    .line 94
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ExceptionEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 114
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    if-eqz v0, :cond_0

    .line 115
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 119
    :goto_0
    return-void

    .line 117
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V

    goto :goto_0
.end method
