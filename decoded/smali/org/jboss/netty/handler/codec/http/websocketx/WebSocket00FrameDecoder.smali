.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;
.super Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
.source "WebSocket00FrameDecoder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
        "<",
        "Lorg/jboss/netty/handler/codec/replay/VoidEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_MAX_FRAME_SIZE:J = 0x4000L


# instance fields
.field private final maxFrameSize:J

.field private receivedClosingHandshake:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 42
    const-wide/16 v0, 0x4000

    invoke-direct {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;-><init>(J)V

    .line 43
    return-void
.end method

.method public constructor <init>(J)V
    .locals 1
    .param p1, "maxFrameSize"    # J

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>()V

    .line 53
    iput-wide p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->maxFrameSize:J

    .line 54
    return-void
.end method

.method private decodeBinaryFrame(BLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    .locals 6
    .param p1, "type"    # B
    .param p2, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;
        }
    .end annotation

    .prologue
    .line 78
    const-wide/16 v2, 0x0

    .line 79
    .local v2, "frameSize":J
    const/4 v1, 0x0

    .line 82
    .local v1, "lengthFieldSize":I
    :cond_0
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    .line 83
    .local v0, "b":B
    const/4 v4, 0x7

    shl-long/2addr v2, v4

    .line 84
    and-int/lit8 v4, v0, 0x7f

    int-to-long v4, v4

    or-long/2addr v2, v4

    .line 85
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->maxFrameSize:J

    cmp-long v4, v2, v4

    if-lez v4, :cond_1

    .line 86
    new-instance v4, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    invoke-direct {v4}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>()V

    throw v4

    .line 88
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 89
    const/16 v4, 0x8

    if-le v1, v4, :cond_2

    .line 91
    new-instance v4, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    invoke-direct {v4}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>()V

    throw v4

    .line 93
    :cond_2
    and-int/lit16 v4, v0, 0x80

    const/16 v5, 0x80

    if-eq v4, v5, :cond_0

    .line 95
    const/4 v4, -0x1

    if-ne p1, v4, :cond_3

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_3

    .line 96
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->receivedClosingHandshake:Z

    .line 97
    new-instance v4, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    invoke-direct {v4}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;-><init>()V

    .line 100
    :goto_0
    return-object v4

    :cond_3
    new-instance v4, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    long-to-int v5, v2

    invoke-interface {p2, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0
.end method

.method private decodeTextFrame(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    .locals 11
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;
        }
    .end annotation

    .prologue
    const/4 v10, -0x1

    .line 104
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    .line 105
    .local v5, "ridx":I
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->actualReadableBytes()I

    move-result v4

    .line 106
    .local v4, "rbytes":I
    add-int v6, v5, v4

    invoke-interface {p1, v5, v6, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->indexOf(IIB)I

    move-result v1

    .line 107
    .local v1, "delimPos":I
    if-ne v1, v10, :cond_1

    .line 109
    int-to-long v6, v4

    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->maxFrameSize:J

    cmp-long v6, v6, v8

    if-lez v6, :cond_0

    .line 111
    new-instance v6, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    invoke-direct {v6}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>()V

    throw v6

    .line 114
    :cond_0
    const/4 v6, 0x0

    .line 131
    :goto_0
    return-object v6

    .line 118
    :cond_1
    sub-int v3, v1, v5

    .line 119
    .local v3, "frameSize":I
    int-to-long v6, v3

    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->maxFrameSize:J

    cmp-long v6, v6, v8

    if-lez v6, :cond_2

    .line 120
    new-instance v6, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    invoke-direct {v6}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>()V

    throw v6

    .line 123
    :cond_2
    invoke-interface {p1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 124
    .local v0, "binaryData":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v6, 0x1

    invoke-interface {p1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 126
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v6

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v7

    invoke-interface {v0, v6, v7, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->indexOf(IIB)I

    move-result v2

    .line 127
    .local v2, "ffDelimPos":I
    if-ltz v2, :cond_3

    .line 128
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "a text frame should not contain 0xFF."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 131
    :cond_3
    new-instance v6, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    invoke-direct {v6, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0
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
    .line 34
    check-cast p4, Lorg/jboss/netty/handler/codec/replay/VoidEnum;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/replay/VoidEnum;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/replay/VoidEnum;)Ljava/lang/Object;
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
    .line 61
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->receivedClosingHandshake:Z

    if-eqz v1, :cond_0

    .line 62
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->actualReadableBytes()I

    move-result v1

    invoke-interface {p3, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 63
    const/4 v1, 0x0

    .line 73
    :goto_0
    return-object v1

    .line 67
    :cond_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    .line 68
    .local v0, "type":B
    and-int/lit16 v1, v0, 0x80

    const/16 v2, 0x80

    if-ne v1, v2, :cond_1

    .line 70
    invoke-direct {p0, v0, p3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->decodeBinaryFrame(BLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    move-result-object v1

    goto :goto_0

    .line 73
    :cond_1
    invoke-direct {p0, p3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;->decodeTextFrame(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    move-result-object v1

    goto :goto_0
.end method
