.class public Lorg/jboss/netty/bootstrap/ServerBootstrap;
.super Lorg/jboss/netty/bootstrap/Bootstrap;
.source "ServerBootstrap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/bootstrap/ServerBootstrap$Binder;
    }
.end annotation


# instance fields
.field private volatile parentHandler:Lorg/jboss/netty/channel/ChannelHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 166
    invoke-direct {p0}, Lorg/jboss/netty/bootstrap/Bootstrap;-><init>()V

    .line 167
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/ChannelFactory;)V
    .locals 0
    .param p1, "channelFactory"    # Lorg/jboss/netty/channel/ChannelFactory;

    .prologue
    .line 173
    invoke-direct {p0, p1}, Lorg/jboss/netty/bootstrap/Bootstrap;-><init>(Lorg/jboss/netty/channel/ChannelFactory;)V

    .line 174
    return-void
.end method


# virtual methods
.method public bind()Lorg/jboss/netty/channel/Channel;
    .locals 3

    .prologue
    .line 248
    const-string v1, "localAddress"

    invoke-virtual {p0, v1}, Lorg/jboss/netty/bootstrap/ServerBootstrap;->getOption(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    .line 249
    .local v0, "localAddress":Ljava/net/SocketAddress;
    if-nez v0, :cond_0

    .line 250
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "localAddress option is not set."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 252
    :cond_0
    invoke-virtual {p0, v0}, Lorg/jboss/netty/bootstrap/ServerBootstrap;->bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    return-object v1
.end method

.method public bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/Channel;
    .locals 4
    .param p1, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 266
    invoke-virtual {p0, p1}, Lorg/jboss/netty/bootstrap/ServerBootstrap;->bindAsync(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 269
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    .line 270
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v1

    if-nez v1, :cond_0

    .line 271
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    .line 272
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to bind to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 275
    :cond_0
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    return-object v1
.end method

.method public bindAsync()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3

    .prologue
    .line 302
    const-string v1, "localAddress"

    invoke-virtual {p0, v1}, Lorg/jboss/netty/bootstrap/ServerBootstrap;->getOption(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    .line 303
    .local v0, "localAddress":Ljava/net/SocketAddress;
    if-nez v0, :cond_0

    .line 304
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "localAddress option is not set."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 306
    :cond_0
    invoke-virtual {p0, v0}, Lorg/jboss/netty/bootstrap/ServerBootstrap;->bindAsync(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    return-object v1
.end method

.method public bindAsync(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 7
    .param p1, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 317
    if-nez p1, :cond_0

    .line 318
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "localAddress"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 320
    :cond_0
    new-instance v1, Lorg/jboss/netty/bootstrap/ServerBootstrap$Binder;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/bootstrap/ServerBootstrap$Binder;-><init>(Lorg/jboss/netty/bootstrap/ServerBootstrap;Ljava/net/SocketAddress;)V

    .line 321
    .local v1, "binder":Lorg/jboss/netty/bootstrap/ServerBootstrap$Binder;
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ServerBootstrap;->getParentHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v4

    .line 323
    .local v4, "parentHandler":Lorg/jboss/netty/channel/ChannelHandler;
    invoke-static {}, Lorg/jboss/netty/channel/Channels;->pipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v2

    .line 324
    .local v2, "bossPipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    const-string v5, "binder"

    invoke-interface {v2, v5, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 325
    if-eqz v4, :cond_1

    .line 326
    const-string v5, "userHandler"

    invoke-interface {v2, v5, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 329
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/bootstrap/ServerBootstrap;->getFactory()Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v5

    invoke-interface {v5, v2}, Lorg/jboss/netty/channel/ChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    .line 330
    .local v3, "channel":Lorg/jboss/netty/channel/Channel;
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelFuture;

    const/4 v5, 0x0

    invoke-direct {v0, v3, v5}, Lorg/jboss/netty/channel/DefaultChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;Z)V

    .line 331
    .local v0, "bfuture":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-static {v1}, Lorg/jboss/netty/bootstrap/ServerBootstrap$Binder;->access$000(Lorg/jboss/netty/bootstrap/ServerBootstrap$Binder;)Lorg/jboss/netty/channel/DefaultChannelFuture;

    move-result-object v5

    new-instance v6, Lorg/jboss/netty/bootstrap/ServerBootstrap$1;

    invoke-direct {v6, p0, v0}, Lorg/jboss/netty/bootstrap/ServerBootstrap$1;-><init>(Lorg/jboss/netty/bootstrap/ServerBootstrap;Lorg/jboss/netty/channel/ChannelFuture;)V

    invoke-virtual {v5, v6}, Lorg/jboss/netty/channel/DefaultChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 342
    return-object v0
.end method

.method public getParentHandler()Lorg/jboss/netty/channel/ChannelHandler;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lorg/jboss/netty/bootstrap/ServerBootstrap;->parentHandler:Lorg/jboss/netty/channel/ChannelHandler;

    return-object v0
.end method

.method public setFactory(Lorg/jboss/netty/channel/ChannelFactory;)V
    .locals 3
    .param p1, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;

    .prologue
    .line 189
    if-nez p1, :cond_0

    .line 190
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "factory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_0
    instance-of v0, p1, Lorg/jboss/netty/channel/ServerChannelFactory;

    if-nez v0, :cond_1

    .line 193
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "factory must be a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lorg/jboss/netty/channel/ServerChannelFactory;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_1
    invoke-super {p0, p1}, Lorg/jboss/netty/bootstrap/Bootstrap;->setFactory(Lorg/jboss/netty/channel/ChannelFactory;)V

    .line 199
    return-void
.end method

.method public setParentHandler(Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 0
    .param p1, "parentHandler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 221
    iput-object p1, p0, Lorg/jboss/netty/bootstrap/ServerBootstrap;->parentHandler:Lorg/jboss/netty/channel/ChannelHandler;

    .line 222
    return-void
.end method
