.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;
.super Ljava/lang/Object;
.source "WebSocketServerHandshakerFactory.java"


# instance fields
.field private final allowExtensions:Z

.field private final maxFramePayloadLength:J

.field private final subprotocols:Ljava/lang/String;

.field private final webSocketURL:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .param p1, "webSocketURL"    # Ljava/lang/String;
    .param p2, "subprotocols"    # Ljava/lang/String;
    .param p3, "allowExtensions"    # Z

    .prologue
    .line 49
    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;-><init>(Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 0
    .param p1, "webSocketURL"    # Ljava/lang/String;
    .param p2, "subprotocols"    # Ljava/lang/String;
    .param p3, "allowExtensions"    # Z
    .param p4, "maxFramePayloadLength"    # J

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->webSocketURL:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->subprotocols:Ljava/lang/String;

    .line 70
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->allowExtensions:Z

    .line 71
    iput-wide p4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->maxFramePayloadLength:J

    .line 72
    return-void
.end method


# virtual methods
.method public newHandshaker(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;
    .locals 7
    .param p1, "req"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .prologue
    .line 82
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Sec-WebSocket-Version"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 84
    .local v6, "version":Ljava/lang/String;
    if-eqz v6, :cond_3

    .line 85
    sget-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->V13:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->toHttpHeaderValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker13;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->webSocketURL:Ljava/lang/String;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->subprotocols:Ljava/lang/String;

    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->allowExtensions:Z

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->maxFramePayloadLength:J

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker13;-><init>(Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 102
    :goto_0
    return-object v0

    .line 89
    :cond_0
    sget-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->V08:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->toHttpHeaderValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 91
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker08;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->webSocketURL:Ljava/lang/String;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->subprotocols:Ljava/lang/String;

    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->allowExtensions:Z

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->maxFramePayloadLength:J

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker08;-><init>(Ljava/lang/String;Ljava/lang/String;ZJ)V

    goto :goto_0

    .line 93
    :cond_1
    sget-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->V07:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->toHttpHeaderValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 95
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->webSocketURL:Ljava/lang/String;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->subprotocols:Ljava/lang/String;

    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->allowExtensions:Z

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->maxFramePayloadLength:J

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;-><init>(Ljava/lang/String;Ljava/lang/String;ZJ)V

    goto :goto_0

    .line 98
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 102
    :cond_3
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->webSocketURL:Ljava/lang/String;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->subprotocols:Ljava/lang/String;

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshakerFactory;->maxFramePayloadLength:J

    invoke-direct {v0, v1, v2, v4, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_0
.end method

.method public sendUnsupportedWebSocketVersionResponse(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 4
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 114
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->SWITCHING_PROTOCOLS:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 117
    .local v0, "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->UPGRADE_REQUIRED:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->setStatus(Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 118
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    const-string v2, "Sec-WebSocket-Version"

    sget-object v3, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->V13:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->toHttpHeaderValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 119
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    return-object v1
.end method
