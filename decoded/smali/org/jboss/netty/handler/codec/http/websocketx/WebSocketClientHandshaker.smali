.class public abstract Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;
.super Ljava/lang/Object;
.source "WebSocketClientHandshaker.java"


# instance fields
.field private volatile actualSubprotocol:Ljava/lang/String;

.field protected final customHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final expectedSubprotocol:Ljava/lang/String;

.field private volatile handshakeComplete:Z

.field private final maxFramePayloadLength:J

.field private final version:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

.field private final webSocketUrl:Ljava/net/URI;


# direct methods
.method protected constructor <init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/util/Map;)V
    .locals 8
    .param p1, "webSocketUrl"    # Ljava/net/URI;
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
    .line 63
    .local p4, "customHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide v6, 0x7fffffffffffffffL

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;-><init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/util/Map;J)V

    .line 64
    return-void
.end method

.method protected constructor <init>(Ljava/net/URI;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;Ljava/lang/String;Ljava/util/Map;J)V
    .locals 1
    .param p1, "webSocketUrl"    # Ljava/net/URI;
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
    .line 82
    .local p4, "customHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->webSocketUrl:Ljava/net/URI;

    .line 84
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->version:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    .line 85
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->expectedSubprotocol:Ljava/lang/String;

    .line 86
    iput-object p4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->customHeaders:Ljava/util/Map;

    .line 87
    iput-wide p5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->maxFramePayloadLength:J

    .line 88
    return-void
.end method

.method static replaceDecoder(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "wsDecoder"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 168
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    .line 169
    .local v1, "p":Lorg/jboss/netty/channel/ChannelPipeline;
    const-class v2, Lorg/jboss/netty/handler/codec/http/HttpResponseDecoder;

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->getContext(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v0

    .line 170
    .local v0, "httpDecoderCtx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    if-nez v0, :cond_0

    .line 171
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "can\'t find an HTTP decoder from the pipeline"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 173
    :cond_0
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ws-decoder"

    invoke-interface {v1, v2, v3, p1}, Lorg/jboss/netty/channel/ChannelPipeline;->addAfter(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 174
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    .line 175
    return-void
.end method


# virtual methods
.method public abstract finishHandshake(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpResponse;)V
.end method

.method public getActualSubprotocol()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->actualSubprotocol:Ljava/lang/String;

    return-object v0
.end method

.method public getExpectedSubprotocol()Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->expectedSubprotocol:Ljava/lang/String;

    return-object v0
.end method

.method public getMaxFramePayloadLength()J
    .locals 2

    .prologue
    .line 108
    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->maxFramePayloadLength:J

    return-wide v0
.end method

.method public getVersion()Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->version:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketVersion;

    return-object v0
.end method

.method public getWebSocketUrl()Ljava/net/URI;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->webSocketUrl:Ljava/net/URI;

    return-object v0
.end method

.method public abstract handshake(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public isHandshakeComplete()Z
    .locals 1

    .prologue
    .line 115
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->handshakeComplete:Z

    return v0
.end method

.method protected setActualSubprotocol(Ljava/lang/String;)V
    .locals 0
    .param p1, "actualSubprotocol"    # Ljava/lang/String;

    .prologue
    .line 138
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->actualSubprotocol:Ljava/lang/String;

    .line 139
    return-void
.end method

.method protected setHandshakeComplete()V
    .locals 1

    .prologue
    .line 119
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker;->handshakeComplete:Z

    .line 120
    return-void
.end method
