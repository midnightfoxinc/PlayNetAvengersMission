.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;
.super Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;
.source "WebSocketClientHandshaker00.java"


# instance fields
.field private expectedChallengeResponseBytes:Lorg/jboss/netty/buffer/ChannelBuffer;


# direct methods
.method public constructor <init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/util/Map;)V
    .locals 8
    .param p1, "webSocketURL"    # Ljava/net/URI;
    .param p2, "version"    # Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;
    .param p3, "subprotocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p4, "customHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide v6, 0x7fffffffffffffffL

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;-><init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/util/Map;J)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/util/Map;J)V
    .locals 1
    .param p1, "webSocketURL"    # Ljava/net/URI;
    .param p2, "version"    # Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;
    .param p3, "subprotocol"    # Ljava/lang/String;
    .param p5, "maxFramePayloadLength"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p4, "customHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;-><init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/util/Map;J)V

    .line 89
    return-void
.end method

.method private static insertRandomCharacters(Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x0

    .line 268
    const/4 v8, 0x1

    const/16 v9, 0xc

    invoke-static {v8, v9}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomNumber(II)I

    move-result v0

    .line 270
    .local v0, "count":I
    new-array v6, v0, [C

    .line 271
    .local v6, "randomChars":[C
    const/4 v5, 0x0

    .line 272
    .local v5, "randCount":I
    :cond_0
    :goto_0
    if-ge v5, v0, :cond_3

    .line 273
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v8

    const-wide v10, 0x405f800000000000L    # 126.0

    mul-double/2addr v8, v10

    const-wide v10, 0x4040800000000000L    # 33.0

    add-double/2addr v8, v10

    double-to-int v4, v8

    .line 274
    .local v4, "rand":I
    const/16 v8, 0x21

    if-ge v8, v4, :cond_1

    const/16 v8, 0x2f

    if-lt v4, v8, :cond_2

    :cond_1
    const/16 v8, 0x3a

    if-ge v8, v4, :cond_0

    const/16 v8, 0x7e

    if-ge v4, v8, :cond_0

    .line 275
    :cond_2
    int-to-char v8, v4

    aput-char v8, v6, v5

    .line 276
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 280
    .end local v4    # "rand":I
    :cond_3
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_4

    .line 281
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v12, v8}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomNumber(II)I

    move-result v7

    .line 282
    .local v7, "split":I
    invoke-virtual {p0, v12, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 283
    .local v2, "part1":Ljava/lang/String;
    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 284
    .local v3, "part2":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-char v9, v6, v1

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 280
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 287
    .end local v2    # "part1":Ljava/lang/String;
    .end local v3    # "part2":Ljava/lang/String;
    .end local v7    # "split":I
    :cond_4
    return-object p0
.end method

.method private static insertSpaces(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "spaces"    # I

    .prologue
    .line 291
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 292
    const/4 v4, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-static {v4, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomNumber(II)I

    move-result v3

    .line 293
    .local v3, "split":I
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 294
    .local v1, "part1":Ljava/lang/String;
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 295
    .local v2, "part2":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 291
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 298
    .end local v1    # "part1":Ljava/lang/String;
    .end local v2    # "part2":Ljava/lang/String;
    .end local v3    # "split":I
    :cond_0
    return-object p0
.end method


# virtual methods
.method public finishHandshake(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpResponse;)V
    .locals 8
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .prologue
    .line 237
    new-instance v2, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    const/16 v5, 0x65

    const-string v6, "WebSocket Protocol Handshake"

    invoke-direct {v2, v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;-><init>(ILjava/lang/String;)V

    .line 239
    .local v2, "status":Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 240
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

    .line 243
    :cond_0
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Upgrade"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 244
    .local v4, "upgrade":Ljava/lang/String;
    const-string v5, "WebSocket"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 245
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid handshake response upgrade: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 249
    :cond_1
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Connection"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 250
    .local v1, "connection":Ljava/lang/String;
    const-string v5, "Upgrade"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 251
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid handshake response connection: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 255
    :cond_2
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 256
    .local v0, "challenge":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->expectedChallengeResponseBytes:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 257
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;

    const-string v6, "Invalid challenge"

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketHandshakeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 260
    :cond_3
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Sec-WebSocket-Protocol"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 261
    .local v3, "subprotocol":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->setActualSubprotocol(Ljava/lang/String;)V

    .line 263
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->setHandshakeComplete()V

    .line 264
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->getMaxFramePayloadLength()J

    move-result-wide v6

    invoke-direct {v5, v6, v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameDecoder;-><init>(J)V

    invoke-static {p1, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->replaceDecoder(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 265
    return-void
.end method

.method public handshake(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 32
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 114
    const/16 v29, 0x1

    const/16 v30, 0xc

    invoke-static/range {v29 .. v30}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomNumber(II)I

    move-result v25

    .line 115
    .local v25, "spaces1":I
    const/16 v29, 0x1

    const/16 v30, 0xc

    invoke-static/range {v29 .. v30}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomNumber(II)I

    move-result v26

    .line 117
    .local v26, "spaces2":I
    const v29, 0x7fffffff

    div-int v14, v29, v25

    .line 118
    .local v14, "max1":I
    const v29, 0x7fffffff

    div-int v15, v29, v26

    .line 120
    .local v15, "max2":I
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-static {v0, v14}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomNumber(II)I

    move-result v16

    .line 121
    .local v16, "number1":I
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-static {v0, v15}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomNumber(II)I

    move-result v18

    .line 123
    .local v18, "number2":I
    mul-int v22, v16, v25

    .line 124
    .local v22, "product1":I
    mul-int v23, v18, v26

    .line 126
    .local v23, "product2":I
    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    .line 127
    .local v11, "key1":Ljava/lang/String;
    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    .line 129
    .local v12, "key2":Ljava/lang/String;
    invoke-static {v11}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->insertRandomCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 130
    invoke-static {v12}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->insertRandomCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 132
    move/from16 v0, v25

    invoke-static {v11, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->insertSpaces(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    .line 133
    move/from16 v0, v26

    invoke-static {v12, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->insertSpaces(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v12

    .line 135
    const/16 v29, 0x8

    invoke-static/range {v29 .. v29}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->randomBytes(I)[B

    move-result-object v13

    .line 137
    .local v13, "key3":[B
    const/16 v29, 0x4

    invoke-static/range {v29 .. v29}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 138
    .local v4, "buffer":Ljava/nio/ByteBuffer;
    move/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 139
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v17

    .line 140
    .local v17, "number1Array":[B
    const/16 v29, 0x4

    invoke-static/range {v29 .. v29}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 141
    move/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 142
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v19

    .line 144
    .local v19, "number2Array":[B
    const/16 v29, 0x10

    move/from16 v0, v29

    new-array v5, v0, [B

    .line 145
    .local v5, "challenge":[B
    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x4

    move-object/from16 v0, v17

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-static {v0, v1, v5, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 146
    const/16 v29, 0x0

    const/16 v30, 0x4

    const/16 v31, 0x4

    move-object/from16 v0, v19

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-static {v0, v1, v5, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 147
    const/16 v29, 0x0

    const/16 v30, 0x8

    const/16 v31, 0x8

    move/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v13, v0, v5, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketUtil;->md5(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->expectedChallengeResponseBytes:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 151
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->getWebSocketUrl()Ljava/net/URI;

    move-result-object v28

    .line 152
    .local v28, "wsURL":Ljava/net/URI;
    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v21

    .line 153
    .local v21, "path":Ljava/lang/String;
    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v29

    if-eqz v29, :cond_0

    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v29

    if-lez v29, :cond_0

    .line 154
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const/16 v30, 0x3f

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 157
    :cond_0
    if-eqz v21, :cond_1

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v29

    if-nez v29, :cond_2

    .line 158
    :cond_1
    const-string v21, "/"

    .line 162
    :cond_2
    new-instance v24, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;

    sget-object v29, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    sget-object v30, Lorg/jboss/netty/handler/codec/http/HttpMethod;->GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-object/from16 v0, v24

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpMethod;Ljava/lang/String;)V

    .line 163
    .local v24, "request":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v29

    const-string v30, "Upgrade"

    const-string v31, "WebSocket"

    invoke-virtual/range {v29 .. v31}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 164
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v29

    const-string v30, "Connection"

    const-string v31, "Upgrade"

    invoke-virtual/range {v29 .. v31}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 165
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v29

    const-string v30, "Host"

    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v29 .. v31}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 167
    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getPort()I

    move-result v27

    .line 168
    .local v27, "wsPort":I
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "http://"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 169
    .local v20, "originValue":Ljava/lang/String;
    const/16 v29, 0x50

    move/from16 v0, v27

    move/from16 v1, v29

    if-eq v0, v1, :cond_3

    const/16 v29, 0x1bb

    move/from16 v0, v27

    move/from16 v1, v29

    if-eq v0, v1, :cond_3

    .line 172
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v29

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const/16 v30, 0x3a

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 174
    :cond_3
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v29

    const-string v30, "Origin"

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 176
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v29

    const-string v30, "Sec-WebSocket-Key1"

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v0, v1, v11}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 177
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v29

    const-string v30, "Sec-WebSocket-Key2"

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v0, v1, v12}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 178
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->getExpectedSubprotocol()Ljava/lang/String;

    move-result-object v7

    .line 179
    .local v7, "expectedSubprotocol":Ljava/lang/String;
    if-eqz v7, :cond_4

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v29

    if-eqz v29, :cond_4

    .line 180
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v29

    const-string v30, "Sec-WebSocket-Protocol"

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v0, v1, v7}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 183
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->customHeaders:Ljava/util/Map;

    move-object/from16 v29, v0

    if-eqz v29, :cond_5

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;->customHeaders:Ljava/util/Map;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v29

    invoke-interface/range {v29 .. v29}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 185
    .local v6, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v30

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v31

    move-object/from16 v0, v30

    move-object/from16 v1, v29

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 191
    .end local v6    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "i$":Ljava/util/Iterator;
    :cond_5
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v29

    const-string v30, "Content-Length"

    array-length v0, v13

    move/from16 v31, v0

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    invoke-virtual/range {v29 .. v31}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 192
    invoke-static {v13}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v29

    move-object/from16 v0, v24

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 194
    new-instance v9, Lorg/jboss/netty/channel/DefaultChannelFuture;

    const/16 v29, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-direct {v9, v0, v1}, Lorg/jboss/netty/channel/DefaultChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;Z)V

    .line 195
    .local v9, "handshakeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v8

    .line 197
    .local v8, "future":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v29, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00$1;

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v9}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00$1;-><init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker00;Lorg/jboss/netty/channel/ChannelFuture;)V

    move-object/from16 v0, v29

    invoke-interface {v8, v0}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 210
    return-object v9
.end method
