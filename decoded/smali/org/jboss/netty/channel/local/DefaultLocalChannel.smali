.class final Lorg/jboss/netty/channel/local/DefaultLocalChannel;
.super Lorg/jboss/netty/channel/AbstractChannel;
.source "DefaultLocalChannel.java"

# interfaces
.implements Lorg/jboss/netty/channel/local/LocalChannel;


# static fields
.field private static final ST_BOUND:I = 0x1

.field private static final ST_CLOSED:I = -0x1

.field private static final ST_CONNECTED:I = 0x2

.field private static final ST_OPEN:I


# instance fields
.field private final config:Lorg/jboss/netty/channel/ChannelConfig;

.field private final delivering:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

.field volatile localAddress:Lorg/jboss/netty/channel/local/LocalAddress;

.field volatile pairedChannel:Lorg/jboss/netty/channel/local/DefaultLocalChannel;

.field volatile remoteAddress:Lorg/jboss/netty/channel/local/LocalAddress;

.field final state:Ljava/util/concurrent/atomic/AtomicInteger;

.field final writeBuffer:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/local/LocalServerChannel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Lorg/jboss/netty/channel/local/DefaultLocalChannel;)V
    .locals 2
    .param p1, "parent"    # Lorg/jboss/netty/channel/local/LocalServerChannel;
    .param p2, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p3, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p4, "sink"    # Lorg/jboss/netty/channel/ChannelSink;
    .param p5, "pairedChannel"    # Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .prologue
    .line 61
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/channel/AbstractChannel;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->state:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 50
    new-instance v0, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->delivering:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    .line 52
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->writeBuffer:Ljava/util/Queue;

    .line 62
    iput-object p5, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->pairedChannel:Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .line 63
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelConfig;

    invoke-direct {v0}, Lorg/jboss/netty/channel/DefaultChannelConfig;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->config:Lorg/jboss/netty/channel/ChannelConfig;

    .line 67
    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/local/DefaultLocalChannel$1;

    invoke-direct {v1, p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel$1;-><init>(Lorg/jboss/netty/channel/local/DefaultLocalChannel;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 73
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelOpen(Lorg/jboss/netty/channel/Channel;)V

    .line 74
    return-void
.end method


# virtual methods
.method closeNow(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 5
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 124
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->localAddress:Lorg/jboss/netty/channel/local/LocalAddress;

    .line 127
    .local v0, "localAddress":Lorg/jboss/netty/channel/local/LocalAddress;
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->setClosed()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_1

    .line 152
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 153
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    if-nez v3, :cond_0

    .line 154
    :goto_0
    invoke-static {v0}, Lorg/jboss/netty/channel/local/LocalChannelRegistry;->unregister(Lorg/jboss/netty/channel/local/LocalAddress;)Z

    .line 157
    :cond_0
    return-void

    .line 131
    :cond_1
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->pairedChannel:Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .line 132
    .local v2, "pairedChannel":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    if-eqz v2, :cond_2

    .line 133
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->pairedChannel:Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .line 134
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V

    .line 135
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 137
    :cond_2
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V

    .line 140
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->setClosed()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    if-nez v3, :cond_4

    .line 152
    :cond_3
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 153
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 144
    :cond_4
    :try_start_2
    iget-object v1, v2, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->pairedChannel:Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .line 145
    .local v1, "me":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    if-eqz v1, :cond_5

    .line 146
    const/4 v3, 0x0

    iput-object v3, v2, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->pairedChannel:Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .line 147
    invoke-static {v2}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V

    .line 148
    invoke-static {v2}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 150
    :cond_5
    invoke-static {v2}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 153
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 152
    .end local v1    # "me":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    .end local v2    # "pairedChannel":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    :catchall_0
    move-exception v3

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 153
    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    if-nez v4, :cond_6

    .line 154
    invoke-static {v0}, Lorg/jboss/netty/channel/local/LocalChannelRegistry;->unregister(Lorg/jboss/netty/channel/local/LocalAddress;)Z

    .line 152
    :cond_6
    throw v3
.end method

.method flushWriteBuffer()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 160
    iget-object v2, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->pairedChannel:Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .line 161
    .local v2, "pairedChannel":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    if-eqz v2, :cond_2

    .line 162
    invoke-virtual {v2}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 165
    iget-object v3, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->delivering:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    invoke-virtual {v3}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_0

    .line 166
    iget-object v3, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->delivering:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->set(Ljava/lang/Object;)V

    .line 169
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->writeBuffer:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    .local v1, "e":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v1, :cond_1

    .line 179
    iget-object v3, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->delivering:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->set(Ljava/lang/Object;)V

    .line 205
    .end local v1    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_0
    return-void

    .line 174
    .restart local v1    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_1
    :try_start_1
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    .line 175
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 176
    const-wide/16 v4, 0x1

    invoke-static {p0, v4, v5}, Lorg/jboss/netty/channel/Channels;->fireWriteComplete(Lorg/jboss/netty/channel/Channel;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 179
    .end local v1    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->delivering:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->set(Ljava/lang/Object;)V

    throw v3

    .line 189
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 190
    new-instance v0, Ljava/nio/channels/NotYetConnectedException;

    invoke-direct {v0}, Ljava/nio/channels/NotYetConnectedException;-><init>()V

    .line 196
    .local v0, "cause":Ljava/lang/Exception;
    :goto_1
    iget-object v3, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->writeBuffer:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 197
    .restart local v1    # "e":Lorg/jboss/netty/channel/MessageEvent;
    if-eqz v1, :cond_0

    .line 201
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 202
    invoke-static {p0, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 192
    .end local v0    # "cause":Ljava/lang/Exception;
    .end local v1    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_3
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    .restart local v0    # "cause":Ljava/lang/Exception;
    goto :goto_1
.end method

.method public getConfig()Lorg/jboss/netty/channel/ChannelConfig;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->config:Lorg/jboss/netty/channel/ChannelConfig;

    return-object v0
.end method

.method public bridge synthetic getLocalAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->getLocalAddress()Lorg/jboss/netty/channel/local/LocalAddress;

    move-result-object v0

    return-object v0
.end method

.method public getLocalAddress()Lorg/jboss/netty/channel/local/LocalAddress;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->localAddress:Lorg/jboss/netty/channel/local/LocalAddress;

    return-object v0
.end method

.method public bridge synthetic getRemoteAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->getRemoteAddress()Lorg/jboss/netty/channel/local/LocalAddress;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteAddress()Lorg/jboss/netty/channel/local/LocalAddress;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->remoteAddress:Lorg/jboss/netty/channel/local/LocalAddress;

    return-object v0
.end method

.method public isBound()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 86
    iget-object v1, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->state:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-lt v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isConnected()Z
    .locals 2

    .prologue
    .line 90
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->state:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->state:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method setBound()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/channels/ClosedChannelException;
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->state:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 95
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->state:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 99
    new-instance v0, Lorg/jboss/netty/channel/ChannelException;

    const-string v1, "already bound"

    invoke-direct {v0, v1}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :pswitch_0
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    throw v0

    .line 102
    :cond_0
    return-void

    .line 95
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method

.method protected setClosed()Z
    .locals 1

    .prologue
    .line 112
    invoke-super {p0}, Lorg/jboss/netty/channel/AbstractChannel;->setClosed()Z

    move-result v0

    return v0
.end method

.method setConnected()V
    .locals 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->state:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 106
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->state:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 108
    :cond_0
    return-void
.end method
