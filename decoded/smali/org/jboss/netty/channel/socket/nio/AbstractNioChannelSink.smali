.class public abstract Lorg/jboss/netty/channel/socket/nio/AbstractNioChannelSink;
.super Lorg/jboss/netty/channel/AbstractChannelSink;
.source "AbstractNioChannelSink.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/jboss/netty/channel/AbstractChannelSink;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 4
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 30
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelPipeline;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 31
    .local v0, "ch":Lorg/jboss/netty/channel/Channel;
    instance-of v3, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    if-eqz v3, :cond_0

    move-object v1, v0

    .line 32
    check-cast v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    .line 33
    .local v1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    new-instance v2, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelPipeline;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-direct {v2, v3, p2}, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Runnable;)V

    .line 34
    .local v2, "wrapper":Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;
    iget-object v3, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v3, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->executeInIoThread(Ljava/lang/Runnable;)V

    .line 37
    .end local v1    # "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    .end local v2    # "wrapper":Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;
    :goto_0
    return-object v2

    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/AbstractChannelSink;->execute(Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    goto :goto_0
.end method

.method protected isFireExceptionCaughtLater(Lorg/jboss/netty/channel/ChannelEvent;Ljava/lang/Throwable;)Z
    .locals 3
    .param p1, "event"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p2, "actualCause"    # Ljava/lang/Throwable;

    .prologue
    .line 42
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 43
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    const/4 v1, 0x0

    .line 44
    .local v1, "fireLater":Z
    instance-of v2, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    if-eqz v2, :cond_0

    .line 45
    check-cast v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    .end local v0    # "channel":Lorg/jboss/netty/channel/Channel;
    invoke-static {v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->isIoThread(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v1, 0x1

    .line 47
    :cond_0
    :goto_0
    return v1

    .line 45
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
