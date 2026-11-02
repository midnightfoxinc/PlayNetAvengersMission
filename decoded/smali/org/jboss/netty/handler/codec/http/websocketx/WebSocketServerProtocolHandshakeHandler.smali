.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "WebSocketServerProtocolHandshakeHandler.java"


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final allowExtensions:Z

.field private final subprotocols:Ljava/lang/String;

.field private final websocketPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const-class v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "websocketPath"    # Ljava/lang/String;
    .param p2, "subprotocols"    # Ljava/lang/String;
    .param p3, "allowExtensions"    # Z

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->websocketPath:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->subprotocols:Ljava/lang/String;

    .line 53
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->allowExtensions:Z

    .line 54
    return-void
.end method

.method private static getWebSocketLocation(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "cp"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p1, "req"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 99
    const-string v0, "ws"

    .line 100
    .local v0, "protocol":Ljava/lang/String;
    const-class v1, Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-interface {p0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 102
    const-string v0, "wss"

    .line 104
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v2

    const-string v3, "Host"

    invoke-virtual {v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static sendHttpResponse(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/codec/http/HttpRequest;Lorg/jboss/netty/handler/codec/http/HttpResponse;)V
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "req"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "res"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .prologue
    .line 92
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1, p2}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 93
    .local v0, "f":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v1

    const/16 v2, 0xc8

    if-eq v1, v2, :cond_1

    .line 94
    :cond_0
    sget-object v1, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 96
    :cond_1
    return-void
.end method


# virtual methods
.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 87
    sget-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v1, "Exception Caught"

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/logging/InternalLogger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 89
    return-void
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    if-eqz v4, :cond_0

    .line 59
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 60
    .local v2, "req":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v4

    sget-object v5, Lorg/jboss/netty/handler/codec/http/HttpMethod;->GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    if-eq v4, v5, :cond_1

    .line 61
    new-instance v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;

    sget-object v5, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    sget-object v6, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->FORBIDDEN:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-direct {v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    invoke-static {p1, v2, v4}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->sendHttpResponse(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/codec/http/HttpRequest;Lorg/jboss/netty/handler/codec/http/HttpResponse;)V

    .line 84
    .end local v2    # "req":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    :cond_0
    :goto_0
    return-void

    .line 65
    .restart local v2    # "req":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    :cond_1
    new-instance v3, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->websocketPath:Ljava/lang/String;

    invoke-static {v4, v2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->getWebSocketLocation(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->subprotocols:Ljava/lang/String;

    iget-boolean v6, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;->allowExtensions:Z

    invoke-direct {v3, v4, v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 67
    .local v3, "wsFactory":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;
    invoke-virtual {v3, v2}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->newHandshaker(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;

    move-result-object v1

    .line 68
    .local v1, "handshaker":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;
    if-nez v1, :cond_2

    .line 69
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->sendUnsupportedWebSocketVersionResponse(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .line 71
    :cond_2
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    invoke-virtual {v1, v4, v2}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->handshake(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpRequest;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 72
    .local v0, "handshakeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v4, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler$1;

    invoke-direct {v4, p0, p1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler$1;-><init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandshakeHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    invoke-interface {v0, v4}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 79
    invoke-static {p1, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->setHandshaker(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;)V

    .line 80
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v4

    const-string v5, "WS403Responder"

    invoke-static {}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->forbiddenHttpRequestResponder()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v6

    invoke-interface {v4, p0, v5, v6}, Lorg/jboss/netty/channel/ChannelPipeline;->replace(Lorg/jboss/netty/channel/ChannelHandler;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    goto :goto_0
.end method
