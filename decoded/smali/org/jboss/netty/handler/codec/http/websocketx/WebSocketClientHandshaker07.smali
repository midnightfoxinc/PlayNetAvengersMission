.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;
.super Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;
.source "WebSocketClientHandshaker07.java"


# static fields
.field public static final MAGIC_GUID:Ljava/lang/String; = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final allowExtensions:Z

.field private expectedChallengeResponseString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-class v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;ZLjava/util/Map;J)V
    .locals 8
    .param p1, "webSocketURL"    # Ljava/net/URI;
    .param p2, "version"    # Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;
    .param p3, "subprotocol"    # Ljava/lang/String;
    .param p4, "allowExtensions"    # Z
    .param p6, "maxFramePayloadLength"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p5, "customHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p5

    move-wide v6, p6

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;-><init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/util/Map;J)V

    .line 79
    iput-boolean p4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->allowExtensions:Z

    .line 80
    return-void
.end method


# virtual methods
.method public finishHandshake(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpResponse;)V
    .locals 11
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .prologue
    const/4 v10, 0x0

    .line 199
    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->SWITCHING_PROTOCOLS:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    .line 201
    .local v2, "status":Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 202
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid handshake response status: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 205
    :cond_0
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Upgrade"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 206
    .local v4, "upgrade":Ljava/lang/String;
    const-string v5, "WebSocket"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 207
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid handshake response upgrade: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Upgrade"

    invoke-virtual {v7, v8}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 211
    :cond_1
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Connection"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 212
    .local v1, "connection":Ljava/lang/String;
    const-string v5, "Upgrade"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 213
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid handshake response connection: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Connection"

    invoke-virtual {v7, v8}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 217
    :cond_2
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Sec-WebSocket-Accept"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "accept":Ljava/lang/String;
    if-eqz v0, :cond_3

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->expectedChallengeResponseString:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 219
    :cond_3
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    const-string v6, "Invalid challenge. Actual: %s. Expected: %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v0, v7, v10

    const/4 v8, 0x1

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->expectedChallengeResponseString:Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 223
    :cond_4
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Sec-WebSocket-Protocol"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 224
    .local v3, "subprotocol":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->setActualSubprotocol(Ljava/lang/String;)V

    .line 226
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->setHandshakeComplete()V

    .line 227
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket07FrameDecoder;

    iget-boolean v6, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->allowExtensions:Z

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->getMaxFramePayloadLength()J

    move-result-wide v8

    invoke-direct {v5, v10, v6, v8, v9}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket07FrameDecoder;-><init>(ZZJ)V

    invoke-static {p1, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->replaceDecoder(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 230
    return-void
.end method

.method public handshake(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 22
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 105
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->getWebSocketUrl()Ljava/net/URI;

    move-result-object v16

    .line 106
    .local v16, "wsURL":Ljava/net/URI;
    invoke-virtual/range {v16 .. v16}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v12

    .line 107
    .local v12, "path":Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_0

    invoke-virtual/range {v16 .. v16}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-lez v17, :cond_0

    .line 108
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v16 .. v16}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x3f

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v16 .. v16}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 111
    :cond_0
    if-eqz v12, :cond_1

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v17

    if-nez v17, :cond_2

    .line 112
    :cond_1
    const-string v12, "/"

    .line 116
    :cond_2
    const/16 v17, 0x10

    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomBytes(I)[B

    move-result-object v10

    .line 117
    .local v10, "nonce":[B
    invoke-static {v10}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->base64(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v9

    .line 119
    .local v9, "key":Ljava/lang/String;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 120
    .local v3, "acceptSeed":Ljava/lang/String;
    sget-object v17, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    move-object/from16 v0, v17

    invoke-static {v3, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->sha1(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v14

    .line 121
    .local v14, "sha1":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-static {v14}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->base64(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->expectedChallengeResponseString:Ljava/lang/String;

    .line 123
    sget-object v17, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_3

    .line 124
    sget-object v17, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v18, "WS Version 07 Client Handshake key: %s. Expected response: %s."

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v9, v19, v20

    const/16 v20, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->expectedChallengeResponseString:Ljava/lang/String;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 129
    :cond_3
    new-instance v13, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;

    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    sget-object v18, Lorg/jboss/netty/handler/codec/http/HttpMethod;->GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v13, v0, v1, v12}, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpMethod;Ljava/lang/String;)V

    .line 130
    .local v13, "request":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Upgrade"

    const-string v19, "WebSocket"

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 131
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Connection"

    const-string v19, "Upgrade"

    invoke-virtual/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 132
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Sec-WebSocket-Key"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 133
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Host"

    invoke-virtual/range {v16 .. v16}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 135
    invoke-virtual/range {v16 .. v16}, Ljava/net/URI;->getPort()I

    move-result v15

    .line 136
    .local v15, "wsPort":I
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "http://"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v16 .. v16}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 137
    .local v11, "originValue":Ljava/lang/String;
    const/16 v17, 0x50

    move/from16 v0, v17

    if-eq v15, v0, :cond_4

    const/16 v17, 0x1bb

    move/from16 v0, v17

    if-eq v15, v0, :cond_4

    .line 140
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x3a

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 142
    :cond_4
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Sec-WebSocket-Origin"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v11}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 144
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->getExpectedSubprotocol()Ljava/lang/String;

    move-result-object v5

    .line 145
    .local v5, "expectedSubprotocol":Ljava/lang/String;
    if-eqz v5, :cond_5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v17

    if-lez v17, :cond_5

    .line 146
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Sec-WebSocket-Protocol"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v5}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 149
    :cond_5
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Sec-WebSocket-Version"

    const-string v19, "7"

    invoke-virtual/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->customHeaders:Ljava/util/Map;

    move-object/from16 v17, v0

    if-eqz v17, :cond_6

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;->customHeaders:Ljava/util/Map;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 153
    .local v4, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v18

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 157
    .end local v4    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "i$":Ljava/util/Iterator;
    :cond_6
    new-instance v7, Lorg/jboss/netty/channel/DefaultChannelFuture;

    const/16 v17, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-direct {v7, v0, v1}, Lorg/jboss/netty/channel/DefaultChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;Z)V

    .line 158
    .local v7, "handshakeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v6

    .line 159
    .local v6, "future":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v17, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07$1;-><init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker07;Lorg/jboss/netty/channel/ChannelFuture;)V

    move-object/from16 v0, v17

    invoke-interface {v6, v0}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 175
    return-object v7
.end method
