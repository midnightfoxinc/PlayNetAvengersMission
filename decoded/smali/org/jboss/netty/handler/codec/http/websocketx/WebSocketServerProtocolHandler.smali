.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "WebSocketServerProtocolHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# instance fields
.field private final allowExtensions:Z

.field private final subprotocols:Ljava/lang/String;

.field private final websocketPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "websocketPath"    # Ljava/lang/String;

    .prologue
    .line 45
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "websocketPath"    # Ljava/lang/String;
    .param p2, "subprotocols"    # Ljava/lang/String;

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "websocketPath"    # Ljava/lang/String;
    .param p2, "subprotocols"    # Ljava/lang/String;
    .param p3, "allowExtensions"    # Z

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 53
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->websocketPath:Ljava/lang/String;

    .line 54
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->subprotocols:Ljava/lang/String;

    .line 55
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->allowExtensions:Z

    .line 56
    return-void
.end method

.method static forbiddenHttpRequestResponder()Lorg/jboss/netty/channel/ChannelHandler;
    .locals 1

    .prologue
    .line 103
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler$1;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler$1;-><init>()V

    return-object v0
.end method

.method static getHandshaker(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;
    .locals 1
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 95
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;

    return-object v0
.end method

.method static setHandshaker(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;)V
    .locals 0
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "handshaker"    # Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;

    .prologue
    .line 99
    invoke-interface {p0, p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    .line 100
    return-void
.end method


# virtual methods
.method public afterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 8
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 59
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    .line 60
    .local v0, "cp":Lorg/jboss/netty/channel/ChannelPipeline;
    const-class v1, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v1

    if-nez v1, :cond_0

    .line 62
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->websocketPath:Ljava/lang/String;

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->subprotocols:Ljava/lang/String;

    iget-boolean v7, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->allowExtensions:Z

    invoke-direct {v4, v5, v6, v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v1, v2, v3, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->addBefore(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 65
    :cond_0
    return-void
.end method

.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 123
    return-void
.end method

.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 117
    return-void
.end method

.method public beforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 120
    return-void
.end method

.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ExceptionEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 85
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    if-eqz v1, :cond_0

    .line 86
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->BAD_REQUEST:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 87
    .local v0, "response":Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 88
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 92
    .end local v0    # "response":Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;
    :goto_0
    return-void

    .line 90
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 5
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 69
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    if-eqz v2, :cond_1

    .line 70
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    .line 71
    .local v0, "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    instance-of v2, v0, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    if-eqz v2, :cond_0

    .line 72
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->getHandshaker(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;

    move-result-object v1

    .line 73
    .local v1, "handshaker":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    check-cast v0, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    .end local v0    # "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    invoke-virtual {v1, v2, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->close(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 81
    .end local v1    # "handshaker":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;
    :goto_0
    return-void

    .line 75
    .restart local v0    # "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    :cond_0
    instance-of v2, v0, Lorg/jboss/netty/handler/codec/http/websocketx/PingWebSocketFrame;

    if-eqz v2, :cond_1

    .line 76
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    new-instance v3, Lorg/jboss/netty/handler/codec/http/websocketx/PongWebSocketFrame;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/http/websocketx/PongWebSocketFrame;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .line 80
    .end local v0    # "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    :cond_1
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method
