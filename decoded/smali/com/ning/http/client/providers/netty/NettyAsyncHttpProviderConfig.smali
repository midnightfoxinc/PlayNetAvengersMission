.class public Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
.super Ljava/lang/Object;
.source "NettyAsyncHttpProviderConfig.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHttpProviderConfig;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$DefaultNettyWebSocketFactory;,
        Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;,
        Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/AsyncHttpProviderConfig",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private bossExecutorService:Ljava/util/concurrent/ExecutorService;

.field private channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

.field private chunkedFileChunkSize:I

.field private connectionStrategy:Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;

.field private disableZeroCopy:Z

.field private handshakeTimeout:J

.field private httpAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

.field private httpClientCodecMaxChunkSize:I

.field private httpClientCodecMaxHeaderSize:I

.field private httpClientCodecMaxInitialLineLength:I

.field private httpsAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

.field private keepEncodingHeader:Z

.field private nettyTimer:Lorg/jboss/netty/util/Timer;

.field private nettyWebSocketFactory:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;

.field private final properties:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private socketChannelFactory:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;

.field private sslEngineFactory:Lcom/ning/http/client/SSLEngineFactory;

.field private useDeadLockChecker:Z

.field private webSocketMaxBufferSize:I

.field private webSocketMaxFrameSize:I

.field private wsAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

.field private wssAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/16 v2, 0x2000

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    .line 115
    const/16 v0, 0x1000

    iput v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxInitialLineLength:I

    .line 116
    iput v2, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxHeaderSize:I

    .line 117
    iput v2, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxChunkSize:I

    .line 133
    const-wide/16 v0, 0x2710

    iput-wide v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->handshakeTimeout:J

    .line 140
    iput v2, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->chunkedFileChunkSize:I

    .line 142
    new-instance v0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$DefaultNettyWebSocketFactory;

    invoke-direct {v0, p0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$DefaultNettyWebSocketFactory;-><init>(Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->nettyWebSocketFactory:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;

    .line 144
    const v0, 0x7a12000

    iput v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->webSocketMaxBufferSize:I

    .line 146
    const/16 v0, 0x2800

    iput v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->webSocketMaxFrameSize:I

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->keepEncodingHeader:Z

    .line 150
    new-instance v0, Lcom/ning/http/client/providers/netty/handler/Http1Point1ConnectionStrategy;

    invoke-direct {v0}, Lcom/ning/http/client/providers/netty/handler/Http1Point1ConnectionStrategy;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->connectionStrategy:Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;

    .line 329
    return-void
.end method


# virtual methods
.method public bridge synthetic addProperty(Ljava/lang/Object;Ljava/lang/Object;)Lcom/ning/http/client/AsyncHttpProviderConfig;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 36
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->addProperty(Ljava/lang/String;Ljava/lang/Object;)Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    move-result-object v0

    return-object v0
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/Object;)Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    return-object p0
.end method

.method public getBossExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->bossExecutorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public getChannelPool()Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    return-object v0
.end method

.method public getChunkedFileChunkSize()I
    .locals 1

    .prologue
    .line 273
    iget v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->chunkedFileChunkSize:I

    return v0
.end method

.method public getConnectionStrategy()Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;
    .locals 1

    .prologue
    .line 313
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->connectionStrategy:Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;

    return-object v0
.end method

.method public getHandshakeTimeout()J
    .locals 2

    .prologue
    .line 249
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->handshakeTimeout:J

    return-wide v0
.end method

.method public getHttpAdditionalPipelineInitializer()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    return-object v0
.end method

.method public getHttpClientCodecMaxChunkSize()I
    .locals 1

    .prologue
    .line 217
    iget v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxChunkSize:I

    return v0
.end method

.method public getHttpClientCodecMaxHeaderSize()I
    .locals 1

    .prologue
    .line 209
    iget v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxHeaderSize:I

    return v0
.end method

.method public getHttpClientCodecMaxInitialLineLength()I
    .locals 1

    .prologue
    .line 201
    iget v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxInitialLineLength:I

    return v0
.end method

.method public getHttpsAdditionalPipelineInitializer()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpsAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    return-object v0
.end method

.method public getNettyTimer()Lorg/jboss/netty/util/Timer;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->nettyTimer:Lorg/jboss/netty/util/Timer;

    return-object v0
.end method

.method public getNettyWebSocketFactory()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->nettyWebSocketFactory:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;

    return-object v0
.end method

.method public bridge synthetic getProperty(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 36
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 71
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "defaultValue":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 72
    .local v0, "value":Ljava/lang/Object;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    .line 75
    .end local p3    # "defaultValue":Ljava/lang/Object;, "TT;"
    :cond_0
    return-object p3
.end method

.method public getSocketChannelFactory()Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->socketChannelFactory:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;

    return-object v0
.end method

.method public getSslEngineFactory()Lcom/ning/http/client/SSLEngineFactory;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->sslEngineFactory:Lcom/ning/http/client/SSLEngineFactory;

    return-object v0
.end method

.method public getWebSocketMaxBufferSize()I
    .locals 1

    .prologue
    .line 289
    iget v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->webSocketMaxBufferSize:I

    return v0
.end method

.method public getWebSocketMaxFrameSize()I
    .locals 1

    .prologue
    .line 297
    iget v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->webSocketMaxFrameSize:I

    return v0
.end method

.method public getWsAdditionalPipelineInitializer()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->wsAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    return-object v0
.end method

.method public getWssAdditionalPipelineInitializer()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->wssAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    return-object v0
.end method

.method public isDisableZeroCopy()Z
    .locals 1

    .prologue
    .line 237
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->disableZeroCopy:Z

    return v0
.end method

.method public isKeepEncodingHeader()Z
    .locals 1

    .prologue
    .line 305
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->keepEncodingHeader:Z

    return v0
.end method

.method public isUseDeadLockChecker()Z
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->useDeadLockChecker:Z

    return v0
.end method

.method public propertiesSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic removeProperty(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 36
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->removeProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public removeProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setBossExecutorService(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1, "bossExecutorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->bossExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 166
    return-void
.end method

.method public setChannelPool(Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;)V
    .locals 0
    .param p1, "channelPool"    # Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    .prologue
    .line 261
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    .line 262
    return-void
.end method

.method public setChunkedFileChunkSize(I)V
    .locals 0
    .param p1, "chunkedFileChunkSize"    # I

    .prologue
    .line 277
    iput p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->chunkedFileChunkSize:I

    .line 278
    return-void
.end method

.method public setConnectionStrategy(Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;)V
    .locals 0
    .param p1, "connectionStrategy"    # Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;

    .prologue
    .line 317
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->connectionStrategy:Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;

    .line 318
    return-void
.end method

.method public setDisableZeroCopy(Z)V
    .locals 0
    .param p1, "disableZeroCopy"    # Z

    .prologue
    .line 233
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->disableZeroCopy:Z

    .line 234
    return-void
.end method

.method public setHandshakeTimeout(J)V
    .locals 1
    .param p1, "handshakeTimeout"    # J

    .prologue
    .line 253
    iput-wide p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->handshakeTimeout:J

    .line 254
    return-void
.end method

.method public setHttpAdditionalPipelineInitializer(Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;)V
    .locals 0
    .param p1, "httpAdditionalPipelineInitializer"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    .line 174
    return-void
.end method

.method public setHttpClientCodecMaxChunkSize(I)V
    .locals 0
    .param p1, "httpClientCodecMaxChunkSize"    # I

    .prologue
    .line 221
    iput p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxChunkSize:I

    .line 222
    return-void
.end method

.method public setHttpClientCodecMaxHeaderSize(I)V
    .locals 0
    .param p1, "httpClientCodecMaxHeaderSize"    # I

    .prologue
    .line 213
    iput p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxHeaderSize:I

    .line 214
    return-void
.end method

.method public setHttpClientCodecMaxInitialLineLength(I)V
    .locals 0
    .param p1, "httpClientCodecMaxInitialLineLength"    # I

    .prologue
    .line 205
    iput p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpClientCodecMaxInitialLineLength:I

    .line 206
    return-void
.end method

.method public setHttpsAdditionalPipelineInitializer(Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;)V
    .locals 0
    .param p1, "httpsAdditionalPipelineInitializer"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->httpsAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    .line 190
    return-void
.end method

.method public setKeepEncodingHeader(Z)V
    .locals 0
    .param p1, "keepEncodingHeader"    # Z

    .prologue
    .line 309
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->keepEncodingHeader:Z

    .line 310
    return-void
.end method

.method public setNettyTimer(Lorg/jboss/netty/util/Timer;)V
    .locals 0
    .param p1, "nettyTimer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->nettyTimer:Lorg/jboss/netty/util/Timer;

    .line 246
    return-void
.end method

.method public setNettyWebSocketFactory(Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;)V
    .locals 0
    .param p1, "nettyWebSocketFactory"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;

    .prologue
    .line 285
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->nettyWebSocketFactory:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;

    .line 286
    return-void
.end method

.method public setSocketChannelFactory(Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;)V
    .locals 0
    .param p1, "socketChannelFactory"    # Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->socketChannelFactory:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;

    .line 230
    return-void
.end method

.method public setSslEngineFactory(Lcom/ning/http/client/SSLEngineFactory;)V
    .locals 0
    .param p1, "sslEngineFactory"    # Lcom/ning/http/client/SSLEngineFactory;

    .prologue
    .line 269
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->sslEngineFactory:Lcom/ning/http/client/SSLEngineFactory;

    .line 270
    return-void
.end method

.method public setUseDeadLockChecker(Z)V
    .locals 0
    .param p1, "useDeadLockChecker"    # Z

    .prologue
    .line 157
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->useDeadLockChecker:Z

    .line 158
    return-void
.end method

.method public setWebSocketMaxBufferSize(I)V
    .locals 0
    .param p1, "webSocketMaxBufferSize"    # I

    .prologue
    .line 293
    iput p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->webSocketMaxBufferSize:I

    .line 294
    return-void
.end method

.method public setWebSocketMaxFrameSize(I)V
    .locals 0
    .param p1, "webSocketMaxFrameSize"    # I

    .prologue
    .line 301
    iput p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->webSocketMaxFrameSize:I

    .line 302
    return-void
.end method

.method public setWsAdditionalPipelineInitializer(Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;)V
    .locals 0
    .param p1, "wsAdditionalPipelineInitializer"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    .prologue
    .line 181
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->wsAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    .line 182
    return-void
.end method

.method public setWssAdditionalPipelineInitializer(Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;)V
    .locals 0
    .param p1, "wssAdditionalPipelineInitializer"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    .prologue
    .line 197
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->wssAdditionalPipelineInitializer:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$AdditionalPipelineInitializer;

    .line 198
    return-void
.end method
