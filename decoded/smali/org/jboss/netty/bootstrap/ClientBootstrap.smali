.class public Lorg/jboss/netty/bootstrap/ClientBootstrap;
.super Lorg/jboss/netty/bootstrap/Bootstrap;
.source "ClientBootstrap.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/jboss/netty/bootstrap/Bootstrap;-><init>()V

    .line 116
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/ChannelFactory;)V
    .locals 0
    .param p1, "channelFactory"    # Lorg/jboss/netty/channel/ChannelFactory;

    .prologue
    .line 122
    invoke-direct {p0, p1}, Lorg/jboss/netty/bootstrap/Bootstrap;-><init>(Lorg/jboss/netty/channel/ChannelFactory;)V

    .line 123
    return-void
.end method


# virtual methods
.method public bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 6
    .param p1, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 268
    if-nez p1, :cond_0

    .line 269
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "localAddress"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 274
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->getPipelineFactory()Lorg/jboss/netty/channel/ChannelPipelineFactory;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelPipelineFactory;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 280
    .local v2, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->getFactory()Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v4

    invoke-interface {v4, v2}, Lorg/jboss/netty/channel/ChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 281
    .local v0, "ch":Lorg/jboss/netty/channel/Channel;
    const/4 v3, 0x0

    .line 283
    .local v3, "success":Z
    :try_start_1
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v4

    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->getOptions()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/jboss/netty/channel/ChannelConfig;->setOptions(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 284
    const/4 v3, 0x1

    .line 286
    if-nez v3, :cond_1

    .line 287
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 292
    :cond_1
    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/Channel;->bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    return-object v4

    .line 275
    .end local v0    # "ch":Lorg/jboss/netty/channel/Channel;
    .end local v2    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .end local v3    # "success":Z
    :catch_0
    move-exception v1

    .line 276
    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/jboss/netty/channel/ChannelPipelineException;

    const-string v5, "Failed to initialize a pipeline."

    invoke-direct {v4, v5, v1}, Lorg/jboss/netty/channel/ChannelPipelineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 286
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "ch":Lorg/jboss/netty/channel/Channel;
    .restart local v2    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .restart local v3    # "success":Z
    :catchall_0
    move-exception v4

    if-nez v3, :cond_2

    .line 287
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 286
    :cond_2
    throw v4
.end method

.method public connect()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3

    .prologue
    .line 149
    const-string v1, "remoteAddress"

    invoke-virtual {p0, v1}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->getOption(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    .line 150
    .local v0, "remoteAddress":Ljava/net/SocketAddress;
    if-nez v0, :cond_0

    .line 151
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "remoteAddress option is not set."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 153
    :cond_0
    invoke-virtual {p0, v0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    return-object v1
.end method

.method public connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 178
    if-nez p1, :cond_0

    .line 179
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "remoteAddress"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 181
    :cond_0
    const-string v1, "localAddress"

    invoke-virtual {p0, v1}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->getOption(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    .line 182
    .local v0, "localAddress":Ljava/net/SocketAddress;
    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->connect(Ljava/net/SocketAddress;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    return-object v1
.end method

.method public connect(Ljava/net/SocketAddress;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 6
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;
    .param p2, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 200
    if-nez p1, :cond_0

    .line 201
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "remoteAddress"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 206
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->getPipelineFactory()Lorg/jboss/netty/channel/ChannelPipelineFactory;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelPipelineFactory;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 212
    .local v2, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->getFactory()Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v4

    invoke-interface {v4, v2}, Lorg/jboss/netty/channel/ChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 213
    .local v0, "ch":Lorg/jboss/netty/channel/Channel;
    const/4 v3, 0x0

    .line 215
    .local v3, "success":Z
    :try_start_1
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v4

    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->getOptions()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/jboss/netty/channel/ChannelConfig;->setOptions(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 216
    const/4 v3, 0x1

    .line 218
    if-nez v3, :cond_1

    .line 219
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 224
    :cond_1
    if-eqz p2, :cond_2

    .line 225
    invoke-interface {v0, p2}, Lorg/jboss/netty/channel/Channel;->bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 229
    :cond_2
    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/Channel;->connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    return-object v4

    .line 207
    .end local v0    # "ch":Lorg/jboss/netty/channel/Channel;
    .end local v2    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .end local v3    # "success":Z
    :catch_0
    move-exception v1

    .line 208
    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/jboss/netty/channel/ChannelPipelineException;

    const-string v5, "Failed to initialize a pipeline."

    invoke-direct {v4, v5, v1}, Lorg/jboss/netty/channel/ChannelPipelineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 218
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "ch":Lorg/jboss/netty/channel/Channel;
    .restart local v2    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .restart local v3    # "success":Z
    :catchall_0
    move-exception v4

    if-nez v3, :cond_3

    .line 219
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 218
    :cond_3
    throw v4
.end method
