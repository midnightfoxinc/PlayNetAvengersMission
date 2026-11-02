.class public Lorg/jboss/netty/handler/execution/ExecutionHandler;
.super Ljava/lang/Object;
.source "ExecutionHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private final handleDownstream:Z

.field private final handleUpstream:Z


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 120
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/jboss/netty/handler/execution/ExecutionHandler;-><init>(Ljava/util/concurrent/Executor;ZZ)V

    .line 121
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;ZZ)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "handleDownstream"    # Z
    .param p3, "handleUpstream"    # Z

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    if-nez p1, :cond_0

    .line 129
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "executor"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_0
    if-nez p2, :cond_1

    if-nez p3, :cond_1

    .line 132
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must handle at least handle one event type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->executor:Ljava/util/concurrent/Executor;

    .line 135
    iput-boolean p2, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->handleDownstream:Z

    .line 136
    iput-boolean p3, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->handleUpstream:Z

    .line 137
    return-void
.end method


# virtual methods
.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 172
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/handler/execution/ExecutionHandler;->handleReadSuspend(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 173
    iget-boolean v0, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->handleDownstream:Z

    if-eqz v0, :cond_1

    .line 174
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lorg/jboss/netty/handler/execution/ChannelDownstreamEventRunnable;

    iget-object v2, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->executor:Ljava/util/concurrent/Executor;

    invoke-direct {v1, p1, p2, v2}, Lorg/jboss/netty/handler/execution/ChannelDownstreamEventRunnable;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/util/concurrent/Executor;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 179
    :cond_0
    :goto_0
    return-void

    .line 176
    :cond_1
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method

.method protected handleReadSuspend(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Z
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 185
    instance-of v2, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v2, :cond_1

    move-object v0, p2

    .line 186
    check-cast v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 187
    .local v0, "cse":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v2

    sget-object v5, Lorg/jboss/netty/channel/ChannelState;->INTEREST_OPS:Lorg/jboss/netty/channel/ChannelState;

    if-ne v2, v5, :cond_1

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    .line 191
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    move v1, v3

    .line 192
    .local v1, "readSuspended":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 195
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    invoke-interface {v2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    move v2, v3

    .line 201
    .end local v0    # "cse":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v1    # "readSuspended":Z
    :goto_1
    return v2

    .restart local v0    # "cse":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_0
    move v1, v4

    .line 191
    goto :goto_0

    .end local v0    # "cse":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_1
    move v2, v4

    .line 201
    goto :goto_1
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 3
    .param p1, "context"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 162
    iget-boolean v0, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->handleUpstream:Z

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;

    iget-object v2, p0, Lorg/jboss/netty/handler/execution/ExecutionHandler;->executor:Ljava/util/concurrent/Executor;

    invoke-direct {v1, p1, p2, v2}, Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/util/concurrent/Executor;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 167
    :goto_0
    return-void

    .line 165
    :cond_0
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method

.method public releaseExternalResources()V
    .locals 2

    .prologue
    .line 151
    invoke-virtual {p0}, Lorg/jboss/netty/handler/execution/ExecutionHandler;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    .line 152
    .local v0, "executor":Ljava/util/concurrent/Executor;
    instance-of v1, v0, Ljava/util/concurrent/ExecutorService;

    if-eqz v1, :cond_0

    move-object v1, v0

    .line 153
    check-cast v1, Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 155
    :cond_0
    instance-of v1, v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    if-eqz v1, :cond_1

    .line 156
    check-cast v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    .end local v0    # "executor":Ljava/util/concurrent/Executor;
    invoke-interface {v0}, Lorg/jboss/netty/util/ExternalResourceReleasable;->releaseExternalResources()V

    .line 158
    :cond_1
    return-void
.end method
