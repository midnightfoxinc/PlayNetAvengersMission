.class public Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;
.super Lorg/jboss/netty/bootstrap/Bootstrap;
.source "ConnectionlessBootstrap.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 124
    invoke-direct {p0}, Lorg/jboss/netty/bootstrap/Bootstrap;-><init>()V

    .line 125
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/ChannelFactory;)V
    .locals 0
    .param p1, "channelFactory"    # Lorg/jboss/netty/channel/ChannelFactory;

    .prologue
    .line 131
    invoke-direct {p0, p1}, Lorg/jboss/netty/bootstrap/Bootstrap;-><init>(Lorg/jboss/netty/channel/ChannelFactory;)V

    .line 132
    return-void
.end method


# virtual methods
.method public bind()Lorg/jboss/netty/channel/Channel;
    .locals 3

    .prologue
    .line 156
    const-string v1, "localAddress"

    invoke-virtual {p0, v1}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getOption(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    .line 157
    .local v0, "localAddress":Ljava/net/SocketAddress;
    if-nez v0, :cond_0

    .line 158
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "localAddress option is not set."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 160
    :cond_0
    invoke-virtual {p0, v0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    return-object v1
.end method

.method public bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/Channel;
    .locals 8
    .param p1, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 173
    if-nez p1, :cond_0

    .line 174
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "localAddress"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 179
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getPipelineFactory()Lorg/jboss/netty/channel/ChannelPipelineFactory;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelPipelineFactory;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 184
    .local v3, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getFactory()Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v5

    invoke-interface {v5, v3}, Lorg/jboss/netty/channel/ChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 187
    .local v0, "ch":Lorg/jboss/netty/channel/Channel;
    const/4 v4, 0x0

    .line 189
    .local v4, "success":Z
    :try_start_1
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v5

    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getOptions()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/jboss/netty/channel/ChannelConfig;->setOptions(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 190
    const/4 v4, 0x1

    .line 192
    if-nez v4, :cond_1

    .line 193
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 198
    :cond_1
    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/Channel;->bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 201
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v2}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    .line 202
    invoke-interface {v2}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v5

    if-nez v5, :cond_3

    .line 203
    invoke-interface {v2}, Lorg/jboss/netty/channel/ChannelFuture;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    .line 204
    new-instance v5, Lorg/jboss/netty/channel/ChannelException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to bind to: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 180
    .end local v0    # "ch":Lorg/jboss/netty/channel/Channel;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v3    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .end local v4    # "success":Z
    :catch_0
    move-exception v1

    .line 181
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Lorg/jboss/netty/channel/ChannelPipelineException;

    const-string v6, "Failed to initialize a pipeline."

    invoke-direct {v5, v6, v1}, Lorg/jboss/netty/channel/ChannelPipelineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 192
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "ch":Lorg/jboss/netty/channel/Channel;
    .restart local v3    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .restart local v4    # "success":Z
    :catchall_0
    move-exception v5

    if-nez v4, :cond_2

    .line 193
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 192
    :cond_2
    throw v5

    .line 207
    .restart local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_3
    return-object v0
.end method

.method public connect()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3

    .prologue
    .line 234
    const-string v1, "remoteAddress"

    invoke-virtual {p0, v1}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getOption(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    .line 235
    .local v0, "remoteAddress":Ljava/net/SocketAddress;
    if-nez v0, :cond_0

    .line 236
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "remoteAddress option is not set."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 238
    :cond_0
    invoke-virtual {p0, v0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    return-object v1
.end method

.method public connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 264
    if-nez p1, :cond_0

    .line 265
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "remotedAddress"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 267
    :cond_0
    const-string v1, "localAddress"

    invoke-virtual {p0, v1}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getOption(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    .line 268
    .local v0, "localAddress":Ljava/net/SocketAddress;
    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->connect(Ljava/net/SocketAddress;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    return-object v1
.end method

.method public connect(Ljava/net/SocketAddress;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 6
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;
    .param p2, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 286
    if-nez p1, :cond_0

    .line 287
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "remoteAddress"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 292
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getPipelineFactory()Lorg/jboss/netty/channel/ChannelPipelineFactory;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelPipelineFactory;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 298
    .local v2, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getFactory()Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v4

    invoke-interface {v4, v2}, Lorg/jboss/netty/channel/ChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 299
    .local v0, "ch":Lorg/jboss/netty/channel/Channel;
    const/4 v3, 0x0

    .line 301
    .local v3, "success":Z
    :try_start_1
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v4

    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ConnectionlessBootstrap;->getOptions()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/jboss/netty/channel/ChannelConfig;->setOptions(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 302
    const/4 v3, 0x1

    .line 304
    if-nez v3, :cond_1

    .line 305
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 310
    :cond_1
    if-eqz p2, :cond_2

    .line 311
    invoke-interface {v0, p2}, Lorg/jboss/netty/channel/Channel;->bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 315
    :cond_2
    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/Channel;->connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    return-object v4

    .line 293
    .end local v0    # "ch":Lorg/jboss/netty/channel/Channel;
    .end local v2    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .end local v3    # "success":Z
    :catch_0
    move-exception v1

    .line 294
    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/jboss/netty/channel/ChannelPipelineException;

    const-string v5, "Failed to initialize a pipeline."

    invoke-direct {v4, v5, v1}, Lorg/jboss/netty/channel/ChannelPipelineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 304
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "ch":Lorg/jboss/netty/channel/Channel;
    .restart local v2    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .restart local v3    # "success":Z
    :catchall_0
    move-exception v4

    if-nez v3, :cond_3

    .line 305
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 304
    :cond_3
    throw v4
.end method
