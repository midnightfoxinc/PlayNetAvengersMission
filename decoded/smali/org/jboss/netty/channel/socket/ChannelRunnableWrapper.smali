.class public Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;
.super Lorg/jboss/netty/channel/DefaultChannelFuture;
.source "ChannelRunnableWrapper.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private started:Z

.field private final task:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 27
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/channel/DefaultChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;Z)V

    .line 28
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;->task:Ljava/lang/Runnable;

    .line 29
    return-void
.end method


# virtual methods
.method public declared-synchronized cancel()Z
    .locals 1

    .prologue
    .line 49
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;->started:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 50
    const/4 v0, 0x0

    .line 52
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-super {p0}, Lorg/jboss/netty/channel/DefaultChannelFuture;->cancel()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 32
    monitor-enter p0

    .line 33
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 34
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;->started:Z

    .line 38
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    :try_start_1
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;->task:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 41
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;->setSuccess()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 45
    :goto_0
    return-void

    .line 36
    :cond_0
    :try_start_2
    monitor-exit p0

    goto :goto_0

    .line 38
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lorg/jboss/netty/channel/socket/ChannelRunnableWrapper;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_0
.end method
