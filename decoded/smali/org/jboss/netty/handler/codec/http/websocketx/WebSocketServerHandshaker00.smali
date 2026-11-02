.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;
.super Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;
.source "WebSocketServerHandshaker00.java"


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const-class v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "webSocketURL"    # Ljava/lang/String;
    .param p2, "subprotocols"    # Ljava/lang/String;

    .prologue
    .line 59
    const-wide v0, 0x7fffffffffffffffL

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 7
    .param p1, "webSocketURL"    # Ljava/lang/String;
    .param p2, "subprotocols"    # Ljava/lang/String;
    .param p3, "maxFramePayloadLength"    # J

    .prologue
    .line 75
    sget-object v1, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;->V00:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;-><init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/lang/String;J)V

    .line 76
    return-void
.end method


# virtual methods
.method public close(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "frame"    # Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    .prologue
    .line 196
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public handshake(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpRequest;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 19
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "req"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .prologue
    .line 126
    sget-object v14, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v14}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v14

    if-eqz v14, :cond_0

    .line 127
    sget-object v14, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v15, "Channel %s WS Version 00 server handshake"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v14, v15}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 131
    :cond_0
    const-string v14, "Upgrade"

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v15

    const-string v16, "Connection"

    invoke-virtual/range {v15 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1

    const-string v14, "WebSocket"

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v15

    const-string v16, "Upgrade"

    invoke-virtual/range {v15 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_2

    .line 133
    :cond_1
    new-instance v14, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    const-string v15, "not a WebSocket handshake request: missing upgrade"

    invoke-direct {v14, v15}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 137
    :cond_2
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Sec-WebSocket-Key1"

    invoke-virtual {v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Sec-WebSocket-Key2"

    invoke-virtual {v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    const/4 v7, 0x1

    .line 140
    .local v7, "isHixie76":Z
    :goto_0
    new-instance v11, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;

    sget-object v15, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    new-instance v16, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    const/16 v17, 0x65

    if-eqz v7, :cond_4

    const-string v14, "WebSocket Protocol Handshake"

    :goto_1
    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v0, v1, v14}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, v16

    invoke-direct {v11, v15, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 142
    .local v11, "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Upgrade"

    const-string v16, "WebSocket"

    invoke-virtual/range {v14 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 143
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Connection"

    const-string v16, "Upgrade"

    invoke-virtual/range {v14 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 146
    if-eqz v7, :cond_8

    .line 148
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Sec-WebSocket-Origin"

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v16

    const-string v17, "Origin"

    invoke-virtual/range {v16 .. v17}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 149
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Sec-WebSocket-Location"

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->getWebSocketUrl()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 150
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Sec-WebSocket-Protocol"

    invoke-virtual {v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 151
    .local v13, "subprotocols":Ljava/lang/String;
    if-eqz v13, :cond_6

    .line 152
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->selectSubprotocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 153
    .local v12, "selectedSubprotocol":Ljava/lang/String;
    if-nez v12, :cond_5

    .line 154
    new-instance v14, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Requested subprotocol(s) not supported: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 137
    .end local v7    # "isHixie76":Z
    .end local v11    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .end local v12    # "selectedSubprotocol":Ljava/lang/String;
    .end local v13    # "subprotocols":Ljava/lang/String;
    :cond_3
    const/4 v7, 0x0

    goto :goto_0

    .line 140
    .restart local v7    # "isHixie76":Z
    :cond_4
    const-string v14, "Web Socket Protocol Handshake"

    goto :goto_1

    .line 156
    .restart local v11    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .restart local v12    # "selectedSubprotocol":Ljava/lang/String;
    .restart local v13    # "subprotocols":Ljava/lang/String;
    :cond_5
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Sec-WebSocket-Protocol"

    invoke-virtual {v14, v15, v12}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 157
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->setSelectedSubprotocol(Ljava/lang/String;)V

    .line 162
    .end local v12    # "selectedSubprotocol":Ljava/lang/String;
    :cond_6
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Sec-WebSocket-Key1"

    invoke-virtual {v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 163
    .local v8, "key1":Ljava/lang/String;
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "Sec-WebSocket-Key2"

    invoke-virtual {v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 164
    .local v9, "key2":Ljava/lang/String;
    const-string v14, "[^0-9]"

    const-string v15, ""

    invoke-virtual {v8, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    const-string v16, "[^ ]"

    const-string v17, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v16

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    div-long v14, v14, v16

    long-to-int v2, v14

    .line 165
    .local v2, "a":I
    const-string v14, "[^0-9]"

    const-string v15, ""

    invoke-virtual {v9, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    const-string v16, "[^ ]"

    const-string v17, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v9, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v16

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    div-long v14, v14, v16

    long-to-int v3, v14

    .line 166
    .local v3, "b":I
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v14

    invoke-interface {v14}, Lorg/jboss/netty/buffer/ChannelBuffer;->readLong()J

    move-result-wide v4

    .line 167
    .local v4, "c":J
    const/16 v14, 0x10

    invoke-static {v14}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 168
    .local v6, "input":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v6, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 169
    invoke-interface {v6, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 170
    invoke-interface {v6, v4, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeLong(J)V

    .line 171
    invoke-static {v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->md5(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v14

    invoke-interface {v11, v14}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 182
    .end local v2    # "a":I
    .end local v3    # "b":I
    .end local v4    # "c":J
    .end local v6    # "input":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v8    # "key1":Ljava/lang/String;
    .end local v9    # "key2":Ljava/lang/String;
    .end local v13    # "subprotocols":Ljava/lang/String;
    :cond_7
    :goto_2
    new-instance v14, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameEncoder;

    invoke-direct {v14}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameEncoder;-><init>()V

    new-instance v15, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->getMaxFramePayloadLength()J

    move-result-wide v16

    invoke-direct/range {v15 .. v17}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;-><init>(J)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v11, v14, v15}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->writeHandshakeResponse(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/channel/ChannelHandler;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v14

    return-object v14

    .line 174
    :cond_8
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "WebSocket-Origin"

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v16

    const-string v17, "Origin"

    invoke-virtual/range {v16 .. v17}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 175
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "WebSocket-Location"

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->getWebSocketUrl()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 176
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "WebSocket-Protocol"

    invoke-virtual {v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 177
    .local v10, "protocol":Ljava/lang/String;
    if-eqz v10, :cond_7

    .line 178
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v14

    const-string v15, "WebSocket-Protocol"

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker00;->selectSubprotocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_2
.end method
