.class abstract Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;
.super Ljava/lang/Object;
.source "AbstractOioWorker.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/Worker;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/jboss/netty/channel/socket/Worker;"
    }
.end annotation


# instance fields
.field protected final channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field

.field private volatile done:Z

.field private final eventQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected volatile thread:Ljava/lang/Thread;


# direct methods
.method protected constructor <init>(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;, "Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker<TC;>;"
    .local p1, "channel":Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;, "TC;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->eventQueue:Ljava/util/Queue;

    .line 50
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    .line 51
    iput-object p0, p1, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->worker:Lorg/jboss/netty/channel/socket/Worker;

    .line 52
    return-void
.end method

.method static close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 203
    invoke-static {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->isIoThread(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)Z

    move-result v0

    invoke-static {p0, p1, v0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;Z)V

    .line 204
    return-void
.end method

.method private static close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;Z)V
    .locals 7
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "iothread"    # Z

    .prologue
    .line 207
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isConnected()Z

    move-result v1

    .line 208
    .local v1, "connected":Z
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isBound()Z

    move-result v0

    .line 211
    .local v0, "bound":Z
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->closeSocket()V

    .line 212
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->setClosed()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 213
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 214
    if-eqz v1, :cond_1

    .line 215
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    .line 216
    .local v2, "currentThread":Ljava/lang/Thread;
    iget-object v6, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->interestOpsLock:Ljava/lang/Object;

    monitor-enter v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    :try_start_1
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->workerThread:Ljava/lang/Thread;

    .line 223
    .local v4, "workerThread":Ljava/lang/Thread;
    if-eqz v4, :cond_0

    if-eq v2, v4, :cond_0

    .line 224
    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    .line 226
    :cond_0
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 228
    if-eqz p2, :cond_3

    .line 229
    :try_start_2
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V

    .line 234
    .end local v2    # "currentThread":Ljava/lang/Thread;
    .end local v4    # "workerThread":Ljava/lang/Thread;
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 235
    if-eqz p2, :cond_4

    .line 236
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 241
    :cond_2
    :goto_1
    if-eqz p2, :cond_5

    .line 242
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 257
    :goto_2
    return-void

    .line 226
    .restart local v2    # "currentThread":Ljava/lang/Thread;
    :catchall_0
    move-exception v5

    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v5
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    .line 249
    .end local v2    # "currentThread":Ljava/lang/Thread;
    :catch_0
    move-exception v3

    .line 250
    .local v3, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v3}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 251
    if-eqz p2, :cond_7

    .line 252
    invoke-static {p0, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 231
    .end local v3    # "t":Ljava/lang/Throwable;
    .restart local v2    # "currentThread":Ljava/lang/Thread;
    .restart local v4    # "workerThread":Ljava/lang/Thread;
    :cond_3
    :try_start_5
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnectedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .line 238
    .end local v2    # "currentThread":Ljava/lang/Thread;
    .end local v4    # "workerThread":Ljava/lang/Thread;
    :cond_4
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelUnboundLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_1

    .line 244
    :cond_5
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelClosedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_2

    .line 247
    :cond_6
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_2

    .line 254
    .restart local v3    # "t":Ljava/lang/Throwable;
    :cond_7
    invoke-static {p0, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_2
.end method

.method static isIoThread(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)Z
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    .prologue
    .line 115
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->workerThread:Ljava/lang/Thread;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private processEventQueue()V
    .locals 2

    .prologue
    .line 136
    .local p0, "this":Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;, "Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker<TC;>;"
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->eventQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 137
    .local v0, "task":Ljava/lang/Runnable;
    if-nez v0, :cond_0

    .line 142
    return-void

    .line 140
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method static setInterestOps(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V
    .locals 7
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "interestOps"    # I

    .prologue
    .line 157
    invoke-static {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->isIoThread(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)Z

    move-result v2

    .line 160
    .local v2, "iothread":Z
    and-int/lit8 p2, p2, -0x5

    .line 161
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->getInternalInterestOps()I

    move-result v5

    and-int/lit8 v5, v5, 0x4

    or-int/2addr p2, v5

    .line 163
    const/4 v0, 0x0

    .line 165
    .local v0, "changed":Z
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->getInternalInterestOps()I

    move-result v5

    if-eq v5, p2, :cond_0

    .line 166
    and-int/lit8 v5, p2, 0x1

    if-eqz v5, :cond_3

    .line 167
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->setInternalInterestOps(I)V

    .line 171
    :goto_0
    const/4 v0, 0x1

    .line 174
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 175
    if-eqz v0, :cond_2

    .line 176
    iget-object v6, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->interestOpsLock:Ljava/lang/Object;

    monitor-enter v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :try_start_1
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->setInternalInterestOps(I)V

    .line 180
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    .line 181
    .local v1, "currentThread":Ljava/lang/Thread;
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->workerThread:Ljava/lang/Thread;

    .line 182
    .local v4, "workerThread":Ljava/lang/Thread;
    if-eqz v4, :cond_1

    if-eq v1, v4, :cond_1

    .line 183
    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    .line 185
    :cond_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 186
    if-eqz v2, :cond_4

    .line 187
    :try_start_2
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelInterestChanged(Lorg/jboss/netty/channel/Channel;)V

    .line 200
    .end local v1    # "currentThread":Ljava/lang/Thread;
    .end local v4    # "workerThread":Ljava/lang/Thread;
    :cond_2
    :goto_1
    return-void

    .line 169
    :cond_3
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->setInternalInterestOps(I)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 192
    :catch_0
    move-exception v3

    .line 193
    .local v3, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v3}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 194
    if-eqz v2, :cond_5

    .line 195
    invoke-static {p0, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 185
    .end local v3    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v5

    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v5

    .line 189
    .restart local v1    # "currentThread":Ljava/lang/Thread;
    .restart local v4    # "workerThread":Ljava/lang/Thread;
    :cond_4
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelInterestChangedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 197
    .end local v1    # "currentThread":Ljava/lang/Thread;
    .end local v4    # "workerThread":Ljava/lang/Thread;
    .restart local v3    # "t":Ljava/lang/Throwable;
    :cond_5
    invoke-static {p0, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_1
.end method


# virtual methods
.method public executeInIoThread(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 123
    .local p0, "this":Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;, "Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker<TC;>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->thread:Ljava/lang/Thread;

    if-eq v1, v2, :cond_0

    iget-boolean v1, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->done:Z

    if-eqz v1, :cond_2

    .line 124
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 132
    :cond_1
    :goto_0
    return-void

    .line 126
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->eventQueue:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v0

    .line 128
    .local v0, "added":Z
    if-eqz v0, :cond_1

    goto :goto_0
.end method

.method abstract process()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public run()V
    .locals 8

    .prologue
    .local p0, "this":Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;, "Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker<TC;>;"
    const/4 v7, 0x1

    .line 55
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    iput-object v5, v4, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->workerThread:Ljava/lang/Thread;

    iput-object v5, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->thread:Ljava/lang/Thread;

    .line 56
    :cond_0
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isOpen()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 57
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    iget-object v5, v4, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->interestOpsLock:Ljava/lang/Object;

    monitor-enter v5

    .line 58
    :cond_1
    :goto_0
    :try_start_0
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isReadable()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_2

    .line 62
    :try_start_1
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    iget-object v4, v4, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->interestOpsLock:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 63
    :catch_0
    move-exception v1

    .line 64
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_2
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isOpen()Z

    move-result v4

    if-nez v4, :cond_1

    .line 69
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    const/4 v0, 0x0

    .line 73
    .local v0, "cont":Z
    :try_start_3
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->process()Z
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result v0

    .line 85
    :cond_3
    :goto_1
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->processEventQueue()V

    .line 88
    if-nez v0, :cond_0

    .line 93
    .end local v0    # "cont":Z
    :cond_4
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    iget-object v5, v4, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->interestOpsLock:Ljava/lang/Object;

    monitor-enter v5

    .line 100
    :try_start_4
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    const/4 v6, 0x0

    iput-object v6, v4, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->workerThread:Ljava/lang/Thread;

    .line 101
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 104
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    invoke-static {v5}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    invoke-static {v4, v5, v7}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;Z)V

    .line 108
    iput-boolean v7, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->done:Z

    .line 111
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->processEventQueue()V

    .line 112
    return-void

    .line 69
    :catchall_0
    move-exception v4

    :try_start_5
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v4

    .line 74
    .restart local v0    # "cont":Z
    :catch_1
    move-exception v3

    .line 75
    .local v3, "t":Ljava/lang/Throwable;
    :try_start_6
    instance-of v2, v3, Ljava/net/SocketTimeoutException;

    .line 76
    .local v2, "readTimeout":Z
    if-nez v2, :cond_5

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isSocketClosed()Z

    move-result v4

    if-nez v4, :cond_5

    .line 77
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    invoke-static {v4, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 79
    :cond_5
    if-eqz v2, :cond_3

    .line 82
    const/4 v0, 0x1

    goto :goto_1

    .line 85
    .end local v2    # "readTimeout":Z
    .end local v3    # "t":Ljava/lang/Throwable;
    :catchall_1
    move-exception v4

    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->processEventQueue()V

    throw v4

    .line 101
    .end local v0    # "cont":Z
    :catchall_2
    move-exception v4

    :try_start_7
    monitor-exit v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw v4
.end method
