.class public Lorg/jboss/netty/handler/queue/BufferedWriteHandler;
.super Lorg/jboss/netty/channel/SimpleChannelHandler;
.source "BufferedWriteHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final consolidateOnFlush:Z

.field private volatile ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private final flush:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final queue:Ljava/util/Queue;
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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 164
    const-class v0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 176
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;-><init>(Z)V

    .line 177
    return-void
.end method

.method public constructor <init>(Ljava/util/Queue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, "queue":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;-><init>(Ljava/util/Queue;Z)V

    .line 187
    return-void
.end method

.method public constructor <init>(Ljava/util/Queue;Z)V
    .locals 2
    .param p2, "consolidateOnFlush"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 209
    .local p1, "queue":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 169
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 210
    if-nez p1, :cond_0

    .line 211
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "queue"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->queue:Ljava/util/Queue;

    .line 214
    iput-boolean p2, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidateOnFlush:Z

    .line 215
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "consolidateOnFlush"    # Z

    .prologue
    .line 197
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;-><init>(Ljava/util/Queue;Z)V

    .line 198
    return-void
.end method

.method private consolidatedWrite(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 295
    .local p1, "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    .line 296
    .local v4, "size":I
    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 297
    iget-object v6, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    const/4 v5, 0x0

    invoke-interface {p1, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jboss/netty/channel/ChannelEvent;

    invoke-interface {v6, v5}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 328
    .end local p1    # "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    :cond_0
    :goto_0
    return-object p1

    .line 300
    .restart local p1    # "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    :cond_1
    if-eqz v4, :cond_0

    .line 304
    new-array v1, v4, [Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 305
    .local v1, "data":[Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v5, v1

    if-ge v3, v5, :cond_2

    .line 306
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {v5}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v5, v1, v3

    .line 305
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 309
    :cond_2
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 310
    .local v0, "composite":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v5, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v5

    invoke-static {v5}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 311
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v5, Lorg/jboss/netty/handler/queue/BufferedWriteHandler$1;

    invoke-direct {v5, p0, p1}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler$1;-><init>(Lorg/jboss/netty/handler/queue/BufferedWriteHandler;Ljava/util/List;)V

    invoke-interface {v2, v5}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 327
    iget-object v5, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v5, v2, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 328
    const/4 p1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public afterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 399
    return-void
.end method

.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 411
    const/4 v0, 0x0

    .line 413
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->queue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 415
    .local v1, "ev":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v1, :cond_1

    .line 425
    if-eqz v0, :cond_0

    .line 426
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-static {v2, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 428
    :cond_0
    return-void

    .line 419
    :cond_1
    if-nez v0, :cond_2

    .line 420
    new-instance v0, Ljava/io/IOException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    const-string v2, "Unable to flush message"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 422
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_2
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    invoke-interface {v2, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_0
.end method

.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 395
    return-void
.end method

.method public beforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 403
    iget-boolean v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidateOnFlush:Z

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush(Z)V

    .line 404
    return-void
.end method

.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 373
    const/4 v0, 0x0

    .line 375
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->queue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 377
    .local v1, "ev":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v1, :cond_1

    .line 386
    if-eqz v0, :cond_0

    .line 387
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-static {v2, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 390
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelHandler;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 391
    return-void

    .line 381
    :cond_1
    if-nez v0, :cond_2

    .line 382
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    .line 384
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_2
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    invoke-interface {v2, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_0
.end method

.method public closeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 361
    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidateOnFlush:Z

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 363
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 365
    return-void

    .line 363
    :catchall_0
    move-exception v0

    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    throw v0
.end method

.method public disconnectRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 351
    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidateOnFlush:Z

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 353
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 355
    return-void

    .line 353
    :catchall_0
    move-exception v0

    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    throw v0
.end method

.method public flush()V
    .locals 1

    .prologue
    .line 233
    iget-boolean v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidateOnFlush:Z

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush(Z)V

    .line 234
    return-void
.end method

.method public flush(Z)V
    .locals 9
    .param p1, "consolidateOnFlush"    # Z

    .prologue
    const/4 v8, 0x0

    .line 244
    iget-object v2, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 245
    .local v2, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    if-nez v2, :cond_1

    .line 292
    :cond_0
    :goto_0
    return-void

    .line 249
    :cond_1
    invoke-interface {v2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    .line 253
    .local v1, "channel":Lorg/jboss/netty/channel/Channel;
    iget-object v6, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v7, 0x1

    invoke-virtual {v6, v8, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    .local v0, "acquired":Z
    if-eqz v0, :cond_3

    .line 254
    invoke-virtual {p0}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->getQueue()Ljava/util/Queue;

    move-result-object v5

    .line 255
    .local v5, "queue":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    if-eqz p1, :cond_9

    .line 256
    invoke-interface {v5}, Ljava/util/Queue;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 257
    iget-object v6, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0

    .line 261
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 263
    .local v4, "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    :goto_1
    invoke-interface {v5}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/channel/MessageEvent;

    .line 264
    .local v3, "e":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v3, :cond_5

    .line 276
    invoke-direct {p0, v4}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidatedWrite(Ljava/util/List;)Ljava/util/List;

    .line 286
    .end local v4    # "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    :goto_2
    iget-object v6, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 289
    .end local v3    # "e":Lorg/jboss/netty/channel/MessageEvent;
    .end local v5    # "queue":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    :cond_3
    if-eqz v0, :cond_0

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->isWritable()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->queue:Ljava/util/Queue;

    invoke-interface {v6}, Ljava/util/Queue;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 290
    :cond_4
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->flush(Z)V

    goto :goto_0

    .line 267
    .restart local v3    # "e":Lorg/jboss/netty/channel/MessageEvent;
    .restart local v4    # "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    .restart local v5    # "queue":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    :cond_5
    invoke-interface {v3}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v6

    instance-of v6, v6, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v6, :cond_7

    .line 268
    invoke-direct {p0, v4}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidatedWrite(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    if-nez v4, :cond_6

    .line 269
    new-instance v4, Ljava/util/ArrayList;

    .end local v4    # "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .restart local v4    # "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    :cond_6
    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_1

    .line 273
    :cond_7
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 283
    .end local v4    # "pendingWrites":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/MessageEvent;>;"
    :cond_8
    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 279
    .end local v3    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_9
    invoke-interface {v5}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/channel/MessageEvent;

    .line 280
    .restart local v3    # "e":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v3, :cond_8

    goto :goto_2
.end method

.method protected getQueue()Ljava/util/Queue;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 226
    iget-object v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->queue:Ljava/util/Queue;

    return-object v0
.end method

.method public isConsolidateOnFlush()Z
    .locals 1

    .prologue
    .line 218
    iget-boolean v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidateOnFlush:Z

    return v0
.end method

.method public writeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 338
    iget-object v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-nez v0, :cond_1

    .line 339
    iput-object p1, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 344
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->getQueue()Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 345
    return-void

    .line 341
    :cond_1
    sget-boolean v0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-eq v0, p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
