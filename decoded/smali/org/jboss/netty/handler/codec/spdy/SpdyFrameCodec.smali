.class public Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;
.super Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.source "SpdyFrameCodec.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec$1;
    }
.end annotation


# static fields
.field private static final INVALID_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;


# instance fields
.field private volatile ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private final spdyFrameDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;

.field private final spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

.field private final spdyHeaderBlockDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;

.field private final spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

.field private spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

.field private spdySettingsFrame:Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 39
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    const-string v1, "Received invalid frame"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->INVALID_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V
    .locals 7
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    .prologue
    .line 60
    const/16 v2, 0x2000

    const/16 v3, 0x4000

    const/4 v4, 0x6

    const/16 v5, 0xf

    const/16 v6, 0x8

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;IIIII)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;IIIII)V
    .locals 2
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "maxChunkSize"    # I
    .param p3, "maxHeaderSize"    # I
    .param p4, "compressionLevel"    # I
    .param p5, "windowBits"    # I
    .param p6, "memLevel"    # I

    .prologue
    .line 69
    invoke-static {p1, p3}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;->newInstance(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;

    move-result-object v0

    invoke-static {p1, p4, p5, p6}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;->newInstance(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;III)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;ILorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;)V

    .line 72
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;ILorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;)V
    .locals 1
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "maxChunkSize"    # I
    .param p3, "spdyHeaderBlockDecoder"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;
    .param p4, "spdyHeaderBlockEncoder"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>()V

    .line 76
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;

    invoke-direct {v0, p1, p0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;I)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;

    .line 77
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    .line 78
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;

    .line 79
    iput-object p4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    .line 80
    return-void
.end method


# virtual methods
.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 84
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 85
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 86
    return-void
.end method

.method protected cleanup(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    :try_start_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cleanup(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 99
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;->end()V

    .line 100
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    monitor-enter v1

    .line 101
    :try_start_1
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;->end()V

    .line 102
    monitor-exit v1

    .line 104
    return-void

    .line 102
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 99
    :catchall_1
    move-exception v0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;->end()V

    .line 100
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    monitor-enter v1

    .line 101
    :try_start_2
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;->end()V

    .line 102
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;

    invoke-virtual {v0, p3}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 91
    const/4 v0, 0x0

    return-object v0
.end method

.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 21
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 107
    move-object/from16 v0, p2

    instance-of v1, v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v1, :cond_0

    move-object/from16 v8, p2

    .line 108
    check-cast v8, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 109
    .local v8, "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-interface {v8}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 121
    .end local v8    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_0
    :goto_0
    move-object/from16 v0, p2

    instance-of v1, v0, Lorg/jboss/netty/channel/MessageEvent;

    if-nez v1, :cond_2

    .line 122
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 244
    :goto_1
    return-void

    .line 113
    .restart local v8    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :pswitch_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v8}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v8}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 114
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    monitor-enter v2

    .line 115
    :try_start_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;->end()V

    .line 116
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .end local v8    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_2
    move-object/from16 v8, p2

    .line 126
    check-cast v8, Lorg/jboss/netty/channel/MessageEvent;

    .line 127
    .local v8, "e":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v10

    .line 129
    .local v10, "msg":Ljava/lang/Object;
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    if-eqz v1, :cond_3

    move-object v11, v10

    .line 131
    check-cast v11, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    .line 132
    .local v11, "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getStreamId()I

    move-result v2

    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->isLast()Z

    move-result v3

    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodeDataFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 137
    .local v9, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_1

    .line 141
    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v11    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    :cond_3
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    if-eqz v1, :cond_4

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    move-object/from16 v20, v0

    monitor-enter v20

    .line 144
    :try_start_1
    move-object v0, v10

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    move-object/from16 v18, v0

    .line 145
    .local v18, "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getStreamId()I

    move-result v2

    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getAssociatedToStreamId()I

    move-result v3

    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getPriority()B

    move-result v4

    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isLast()Z

    move-result v5

    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isUnidirectional()Z

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;->encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    invoke-virtual/range {v1 .. v7}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodeSynStreamFrame(IIBZZLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 154
    .restart local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 155
    monitor-exit v20

    goto/16 :goto_1

    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v18    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    :catchall_1
    move-exception v1

    monitor-exit v20
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v1

    .line 159
    :cond_4
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    if-eqz v1, :cond_5

    .line 161
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    monitor-enter v2

    .line 162
    :try_start_2
    move-object v0, v10

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    move-object/from16 v17, v0

    .line 163
    .local v17, "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->getStreamId()I

    move-result v3

    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->isLast()Z

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;->encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodeSynReplyFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 169
    .restart local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v3}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 170
    monitor-exit v2

    goto/16 :goto_1

    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v17    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    :catchall_2
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v1

    .line 174
    :cond_5
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    if-eqz v1, :cond_6

    move-object v15, v10

    .line 176
    check-cast v15, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    .line 177
    .local v15, "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-interface {v15}, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;->getStreamId()I

    move-result v2

    invoke-interface {v15}, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;->getStatus()Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->getCode()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodeRstStreamFrame(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 181
    .restart local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto/16 :goto_1

    .line 185
    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v15    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_6
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    if-eqz v1, :cond_7

    move-object/from16 v16, v10

    .line 187
    check-cast v16, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    .line 188
    .local v16, "spdySettingsFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodeSettingsFrame(Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 191
    .restart local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto/16 :goto_1

    .line 195
    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v16    # "spdySettingsFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;
    :cond_7
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;

    if-eqz v1, :cond_8

    move-object v14, v10

    .line 197
    check-cast v14, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;

    .line 198
    .local v14, "spdyPingFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-interface {v14}, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodePingFrame(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 201
    .restart local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto/16 :goto_1

    .line 205
    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v14    # "spdyPingFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;
    :cond_8
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;

    if-eqz v1, :cond_9

    move-object v12, v10

    .line 207
    check-cast v12, Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;

    .line 208
    .local v12, "spdyGoAwayFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;->getLastGoodStreamId()I

    move-result v2

    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;->getStatus()Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->getCode()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodeGoAwayFrame(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 212
    .restart local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto/16 :goto_1

    .line 216
    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v12    # "spdyGoAwayFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;
    :cond_9
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    if-eqz v1, :cond_a

    .line 218
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    monitor-enter v2

    .line 219
    :try_start_3
    move-object v0, v10

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    move-object v13, v0

    .line 220
    .local v13, "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->getStreamId()I

    move-result v3

    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isLast()Z

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;

    invoke-virtual {v5, v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;->encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodeHeadersFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 226
    .restart local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v3}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 227
    monitor-exit v2

    goto/16 :goto_1

    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v13    # "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    :catchall_3
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    throw v1

    .line 231
    :cond_a
    instance-of v1, v10, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;

    if-eqz v1, :cond_b

    move-object/from16 v19, v10

    .line 233
    check-cast v19, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;

    .line 234
    .local v19, "spdyWindowUpdateFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyFrameEncoder:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;

    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;->getStreamId()I

    move-result v2

    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;->getDeltaWindowSize()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->encodeWindowUpdateFrame(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    .line 238
    .restart local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v8}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v1, v9, v2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto/16 :goto_1

    .line 243
    .end local v9    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v19    # "spdyWindowUpdateFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;
    :cond_b
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_1

    .line 109
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public readDataFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p1, "streamId"    # I
    .param p2, "last"    # Z
    .param p3, "data"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 247
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;-><init>(I)V

    .line 248
    .local v0, "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface {v0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setLast(Z)V

    .line 249
    invoke-interface {v0, p3}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 250
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V

    .line 251
    return-void
.end method

.method public readFrameError(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 330
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->INVALID_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 331
    return-void
.end method

.method public readGoAwayFrame(II)V
    .locals 2
    .param p1, "lastGoodStreamId"    # I
    .param p2, "statusCode"    # I

    .prologue
    .line 293
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;

    invoke-direct {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;-><init>(II)V

    .line 294
    .local v0, "spdyGoAwayFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V

    .line 295
    return-void
.end method

.method public readHeaderBlock(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 3
    .param p1, "headerBlock"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 309
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    invoke-virtual {v1, p1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 313
    :goto_0
    return-void

    .line 310
    :catch_0
    move-exception v0

    .line 311
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public readHeaderBlockEnd()V
    .locals 4

    .prologue
    .line 316
    const/4 v1, 0x0

    .line 318
    .local v1, "frame":Ljava/lang/Object;
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeaderBlockDecoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    invoke-virtual {v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;->endHeaderBlock(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 319
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .line 320
    .local v1, "frame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    .end local v1    # "frame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    :goto_0
    if-eqz v1, :cond_0

    .line 325
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v2, v1}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V

    .line 327
    :cond_0
    return-void

    .line 321
    :catch_0
    move-exception v0

    .line 322
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v2, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public readHeadersFrame(IZ)V
    .locals 1
    .param p1, "streamId"    # I
    .param p2, "last"    # Z

    .prologue
    .line 298
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .line 299
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    invoke-interface {v0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setLast(Z)V

    .line 300
    return-void
.end method

.method public readPingFrame(I)V
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 288
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyPingFrame;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyPingFrame;-><init>(I)V

    .line 289
    .local v0, "spdyPingFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V

    .line 290
    return-void
.end method

.method public readRstStreamFrame(II)V
    .locals 2
    .param p1, "streamId"    # I
    .param p2, "statusCode"    # I

    .prologue
    .line 268
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    invoke-direct {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(II)V

    .line 269
    .local v0, "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V

    .line 270
    return-void
.end method

.method public readSetting(IIZZ)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "value"    # I
    .param p3, "persistValue"    # Z
    .param p4, "persisted"    # Z

    .prologue
    .line 278
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdySettingsFrame:Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->setValue(IIZZ)V

    .line 279
    return-void
.end method

.method public readSettingsEnd()V
    .locals 2

    .prologue
    .line 282
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdySettingsFrame:Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    .line 283
    .local v0, "frame":Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdySettingsFrame:Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    .line 284
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V

    .line 285
    return-void
.end method

.method public readSettingsFrame(Z)V
    .locals 1
    .param p1, "clearPersisted"    # Z

    .prologue
    .line 273
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdySettingsFrame:Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    .line 274
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdySettingsFrame:Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->setClearPreviouslyPersistedSettings(Z)V

    .line 275
    return-void
.end method

.method public readSynReplyFrame(IZ)V
    .locals 1
    .param p1, "streamId"    # I
    .param p2, "last"    # Z

    .prologue
    .line 262
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynReplyFrame;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynReplyFrame;-><init>(I)V

    .line 263
    .local v0, "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    invoke-interface {v0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->setLast(Z)V

    .line 264
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .line 265
    return-void
.end method

.method public readSynStreamFrame(IIBZZ)V
    .locals 1
    .param p1, "streamId"    # I
    .param p2, "associatedToStreamId"    # I
    .param p3, "priority"    # B
    .param p4, "last"    # Z
    .param p5, "unidirectional"    # Z

    .prologue
    .line 255
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;

    invoke-direct {v0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;-><init>(IIB)V

    .line 256
    .local v0, "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    invoke-interface {v0, p4}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->setLast(Z)V

    .line 257
    invoke-interface {v0, p5}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->setUnidirectional(Z)V

    .line 258
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->spdyHeadersFrame:Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .line 259
    return-void
.end method

.method public readWindowUpdateFrame(II)V
    .locals 2
    .param p1, "streamId"    # I
    .param p2, "deltaWindowSize"    # I

    .prologue
    .line 303
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyWindowUpdateFrame;

    invoke-direct {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyWindowUpdateFrame;-><init>(II)V

    .line 304
    .local v0, "spdyWindowUpdateFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V

    .line 305
    return-void
.end method
