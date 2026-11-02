.class public abstract Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;
.super Ljava/lang/Object;
.source "WebSocketServerHandshaker.java"


# static fields
.field public static final HANDSHAKE_LISTENER:Lorg/jboss/netty/channel/ChannelFutureListener;

.field public static final SUB_PROTOCOL_WILDCARD:Ljava/lang/String; = "*"


# instance fields
.field private final maxFramePayloadLength:J

.field private selectedSubprotocol:Ljava/lang/String;

.field private final subprotocols:[Ljava/lang/String;

.field private final version:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

.field private final webSocketUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$1;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$1;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->HANDSHAKE_LISTENER:Lorg/jboss/netty/channel/ChannelFutureListener;

    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;
    .param p2, "webSocketUrl"    # Ljava/lang/String;
    .param p3, "subprotocols"    # Ljava/lang/String;

    .prologue
    .line 83
    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;-><init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/lang/String;J)V

    .line 84
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;
    .param p2, "webSocketUrl"    # Ljava/lang/String;
    .param p3, "subprotocols"    # Ljava/lang/String;
    .param p4, "maxFramePayloadLength"    # J

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->version:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    .line 104
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->webSocketUrl:Ljava/lang/String;

    .line 105
    if-eqz p3, :cond_1

    .line 106
    const/16 v2, 0x2c

    invoke-static {p3, v2}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "subprotocolArray":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 108
    aget-object v2, v1, v0

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 110
    :cond_0
    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->subprotocols:[Ljava/lang/String;

    .line 114
    .end local v0    # "i":I
    .end local v1    # "subprotocolArray":[Ljava/lang/String;
    :goto_1
    iput-wide p4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->maxFramePayloadLength:J

    .line 115
    return-void

    .line 112
    :cond_1
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->subprotocols:[Ljava/lang/String;

    goto :goto_1
.end method


# virtual methods
.method public abstract close(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;)Lorg/jboss/netty/channel/ChannelFuture;
.end method

.method public getMaxFramePayloadLength()J
    .locals 2

    .prologue
    .line 144
    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->maxFramePayloadLength:J

    return-wide v0
.end method

.method public getSelectedSubprotocol()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->selectedSubprotocol:Ljava/lang/String;

    return-object v0
.end method

.method public getSubprotocols()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 128
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 129
    .local v0, "ret":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->subprotocols:[Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 130
    return-object v0
.end method

.method public getVersion()Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->version:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    return-object v0
.end method

.method public getWebSocketUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->webSocketUrl:Ljava/lang/String;

    return-object v0
.end method

.method public abstract handshake(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpRequest;)Lorg/jboss/netty/channel/ChannelFuture;
.end method

.method protected selectSubprotocol(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "requestedSubprotocols"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 199
    if-eqz p1, :cond_0

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->subprotocols:[Ljava/lang/String;

    array-length v11, v11

    if-nez v11, :cond_2

    :cond_0
    move-object v7, v10

    .line 216
    :cond_1
    :goto_0
    return-object v7

    .line 203
    :cond_2
    const/16 v11, 0x2c

    invoke-static {p1, v11}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v8

    .line 204
    .local v8, "requestedSubprotocolArray":[Ljava/lang/String;
    move-object v0, v8

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v3, v2

    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v4    # "len$":I
    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_4

    aget-object v6, v0, v3

    .line 205
    .local v6, "p":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 207
    .local v7, "requestedSubprotocol":Ljava/lang/String;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->subprotocols:[Ljava/lang/String;

    .local v1, "arr$":[Ljava/lang/String;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v2, 0x0

    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    :goto_2
    if-ge v2, v5, :cond_3

    aget-object v9, v1, v2

    .line 208
    .local v9, "supportedSubprotocol":Ljava/lang/String;
    const-string v11, "*"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 207
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 204
    .end local v9    # "supportedSubprotocol":Ljava/lang/String;
    :cond_3
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    .end local v2    # "i$":I
    .restart local v3    # "i$":I
    goto :goto_1

    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v5    # "len$":I
    .end local v6    # "p":Ljava/lang/String;
    .end local v7    # "requestedSubprotocol":Ljava/lang/String;
    :cond_4
    move-object v7, v10

    .line 216
    goto :goto_0
.end method

.method protected setSelectedSubprotocol(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 230
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->selectedSubprotocol:Ljava/lang/String;

    .line 231
    return-void
.end method

.method protected writeHandshakeResponse(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/channel/ChannelHandler;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 5
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "res"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p3, "encoder"    # Lorg/jboss/netty/channel/ChannelHandler;
    .param p4, "decoder"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 162
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v2

    .line 163
    .local v2, "p":Lorg/jboss/netty/channel/ChannelPipeline;
    const-class v3, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 164
    const-class v3, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;

    .line 167
    :cond_0
    const-class v3, Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelPipeline;->getContext(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v1

    .line 168
    .local v1, "httpEncoderName":Ljava/lang/String;
    const-string v3, "wsencoder"

    invoke-interface {v2, v1, v3, p3}, Lorg/jboss/netty/channel/ChannelPipeline;->addAfter(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 169
    const-class v3, Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;

    const-string v4, "wsdecoder"

    invoke-virtual {v3, v4, p4}, Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;->replace(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 171
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 172
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v3, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$2;

    invoke-direct {v3, p0, v2, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$2;-><init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/String;)V

    invoke-interface {v0, v3}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 178
    return-object v0
.end method
