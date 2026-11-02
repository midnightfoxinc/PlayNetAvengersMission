.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;
.source "WebSocketFrameAggregator.java"


# instance fields
.field private currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

.field private final maxFrameSize:I

.field private tooLongFrameFound:Z


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "maxFrameSize"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;-><init>()V

    .line 44
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 45
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxFrameSize must be > 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->maxFrameSize:I

    .line 48
    return-void
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "message"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    const/4 v4, 0x0

    .line 52
    instance-of v5, p3, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    if-nez v5, :cond_1

    move-object v3, p3

    .line 99
    :cond_0
    :goto_0
    return-object v3

    :cond_1
    move-object v3, p3

    .line 55
    check-cast v3, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    .line 56
    .local v3, "msg":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    if-nez v5, :cond_4

    .line 57
    iput-boolean v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->tooLongFrameFound:Z

    .line 58
    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->isFinalFragment()Z

    move-result v5

    if-nez v5, :cond_0

    .line 61
    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 63
    .local v0, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    instance-of v5, v3, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    if-eqz v5, :cond_2

    .line 64
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getRsv()I

    move-result v6

    invoke-direct {v5, v8, v6, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    :goto_1
    move-object v3, v4

    .line 71
    goto :goto_0

    .line 65
    :cond_2
    instance-of v5, v3, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    if-eqz v5, :cond_3

    .line 66
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getRsv()I

    move-result v6

    invoke-direct {v5, v8, v6, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    goto :goto_1

    .line 68
    :cond_3
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "WebSocket frame was not of type TextWebSocketFrame or BinaryWebSocketFrame"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 73
    .end local v0    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_4
    instance-of v5, v3, Lorg/jboss/netty/handler/codec/http/websocketx/ContinuationWebSocketFrame;

    if-eqz v5, :cond_0

    .line 74
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->tooLongFrameFound:Z

    if-eqz v5, :cond_6

    .line 75
    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->isFinalFragment()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 76
    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    :cond_5
    move-object v3, v4

    .line 78
    goto :goto_0

    .line 80
    :cond_6
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    invoke-virtual {v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 81
    .local v1, "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    iget v6, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->maxFrameSize:I

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    sub-int/2addr v6, v7

    if-le v5, v6, :cond_7

    .line 82
    iput-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->tooLongFrameFound:Z

    .line 83
    new-instance v4, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "WebSocketFrame length exceeded "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " bytes."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 87
    :cond_7
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    const/4 v6, 0x2

    new-array v6, v6, [Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v1, v6, v9

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 89
    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->isFinalFragment()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 90
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    .line 91
    .local v2, "currentFrame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;->currentFrame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    move-object v3, v2

    .line 92
    goto/16 :goto_0

    .end local v2    # "currentFrame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    :cond_8
    move-object v3, v4

    .line 94
    goto/16 :goto_0
.end method
