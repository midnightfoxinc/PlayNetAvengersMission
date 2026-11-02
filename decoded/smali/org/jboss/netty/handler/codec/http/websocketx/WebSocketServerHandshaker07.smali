.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;
.super Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;
.source "WebSocketServerHandshaker07.java"


# static fields
.field public static final WEBSOCKET_07_ACCEPT_GUID:Ljava/lang/String; = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final allowExtensions:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 6
    .param p1, "webSocketURL"    # Ljava/lang/String;
    .param p2, "subprotocols"    # Ljava/lang/String;
    .param p3, "allowExtensions"    # Z
    .param p4, "maxFramePayloadLength"    # J

    .prologue
    .line 66
    sget-object v1, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->V07:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;-><init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/lang/String;J)V

    .line 67
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->allowExtensions:Z

    .line 68
    return-void
.end method


# virtual methods
.method public close(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "frame"    # Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    .prologue
    .line 158
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 159
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    sget-object v1, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 160
    return-object v0
.end method

.method public handshake(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpRequest;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 13
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "req"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 111
    sget-object v7, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v7}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 112
    sget-object v7, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v8, "Channel %s WS Version 7 server handshake"

    new-array v9, v12, [Ljava/lang/Object;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 114
    :cond_0
    new-instance v3, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;

    sget-object v7, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    sget-object v8, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->SWITCHING_PROTOCOLS:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-direct {v3, v7, v8}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 116
    .local v3, "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Sec-WebSocket-Key"

    invoke-virtual {v7, v8}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 117
    .local v2, "key":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 118
    new-instance v7, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    const-string v8, "not a WebSocket request: missing key"

    invoke-direct {v7, v8}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 120
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 121
    .local v1, "acceptSeed":Ljava/lang/String;
    sget-object v7, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-static {v1, v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    invoke-static {v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->sha1(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    .line 122
    .local v5, "sha1":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->base64(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "accept":Ljava/lang/String;
    sget-object v7, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v7}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 125
    sget-object v7, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v8, "WS Version 7 Server Handshake key: %s. Response: %s."

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v2, v9, v11

    aput-object v0, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 128
    :cond_2
    sget-object v7, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->SWITCHING_PROTOCOLS:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-interface {v3, v7}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->setStatus(Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 129
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Upgrade"

    const-string v9, "WebSocket"

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 130
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Connection"

    const-string v9, "Upgrade"

    invoke-virtual {v7, v8, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 131
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Sec-WebSocket-Accept"

    invoke-virtual {v7, v8, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 132
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Sec-WebSocket-Protocol"

    invoke-virtual {v7, v8}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 133
    .local v6, "subprotocols":Ljava/lang/String;
    if-eqz v6, :cond_4

    .line 134
    invoke-virtual {p0, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->selectSubprotocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 135
    .local v4, "selectedSubprotocol":Ljava/lang/String;
    if-nez v4, :cond_3

    .line 136
    new-instance v7, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Requested subprotocol(s) not supported: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 138
    :cond_3
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Sec-WebSocket-Protocol"

    invoke-virtual {v7, v8, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 139
    invoke-virtual {p0, v4}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->setSelectedSubprotocol(Ljava/lang/String;)V

    .line 143
    .end local v4    # "selectedSubprotocol":Ljava/lang/String;
    :cond_4
    new-instance v7, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket07FrameEncoder;

    invoke-direct {v7, v11}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket07FrameEncoder;-><init>(Z)V

    new-instance v8, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket07FrameDecoder;

    iget-boolean v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->allowExtensions:Z

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->getMaxFramePayloadLength()J

    move-result-wide v10

    invoke-direct {v8, v12, v9, v10, v11}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket07FrameDecoder;-><init>(ZZJ)V

    invoke-virtual {p0, p1, v3, v7, v8}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker07;->writeHandshakeResponse(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/channel/ChannelHandler;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v7

    return-object v7
.end method
