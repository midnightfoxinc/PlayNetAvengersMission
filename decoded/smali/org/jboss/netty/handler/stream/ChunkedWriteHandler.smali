.class public Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;
.super Ljava/lang/Object;
.source "ChunkedWriteHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/stream/ChunkedWriteHandler$3;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private volatile ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private currentEvent:Lorg/jboss/netty/channel/MessageEvent;

.field private final flush:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private volatile flushNeeded:Z

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
    .line 75
    const-class v0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->$assertionsDisabled:Z

    .line 78
    const-class v0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void

    .line 75
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->queue:Ljava/util/Queue;

    .line 84
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method static closeInput(Lorg/jboss/netty/handler/stream/ChunkedInput;)V
    .locals 3
    .param p0, "chunks"    # Lorg/jboss/netty/handler/stream/ChunkedInput;

    .prologue
    .line 303
    :try_start_0
    invoke-interface {p0}, Lorg/jboss/netty/handler/stream/ChunkedInput;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 309
    :cond_0
    :goto_0
    return-void

    .line 304
    :catch_0
    move-exception v0

    .line 305
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 306
    sget-object v1, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to close a chunked input."

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private discard(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "fireNow"    # Z

    .prologue
    .line 146
    const/4 v0, 0x0

    .line 149
    .local v0, "cause":Ljava/nio/channels/ClosedChannelException;
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 151
    .local v1, "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    iget-object v3, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    if-nez v3, :cond_1

    .line 152
    iget-object v3, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->queue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 157
    .restart local v1    # "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    :goto_1
    if-nez v1, :cond_2

    .line 173
    if-eqz v0, :cond_0

    .line 174
    if-eqz p2, :cond_5

    .line 175
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-static {v3, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 180
    :cond_0
    :goto_2
    return-void

    .line 154
    :cond_1
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    goto :goto_1

    .line 161
    :cond_2
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    .line 162
    .local v2, "m":Ljava/lang/Object;
    instance-of v3, v2, Lorg/jboss/netty/handler/stream/ChunkedInput;

    if-eqz v3, :cond_3

    .line 163
    check-cast v2, Lorg/jboss/netty/handler/stream/ChunkedInput;

    .end local v2    # "m":Ljava/lang/Object;
    invoke-static {v2}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->closeInput(Lorg/jboss/netty/handler/stream/ChunkedInput;)V

    .line 167
    :cond_3
    if-nez v0, :cond_4

    .line 168
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    .end local v0    # "cause":Ljava/nio/channels/ClosedChannelException;
    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    .line 170
    .restart local v0    # "cause":Ljava/nio/channels/ClosedChannelException;
    :cond_4
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_0

    .line 177
    :cond_5
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-static {v3, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_2
.end method

.method private flush(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V
    .locals 14
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "fireNow"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    const/4 v13, 0x0

    .line 184
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    .line 185
    .local v2, "channel":Lorg/jboss/netty/channel/Channel;
    const/4 v8, 0x0

    .line 186
    .local v8, "suspend":Z
    iput-boolean v12, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flushNeeded:Z

    .line 188
    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v11, v13, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    .local v1, "acquired":Z
    if-eqz v1, :cond_4

    .line 189
    iput-boolean v13, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flushNeeded:Z

    .line 191
    :try_start_0
    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v11

    if-nez v11, :cond_1

    .line 192
    invoke-direct/range {p0 .. p2}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->discard(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 291
    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    :goto_0
    invoke-virtual {v11, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 299
    :cond_0
    :goto_1
    return-void

    .line 196
    :cond_1
    :try_start_1
    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isWritable()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 197
    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    if-nez v11, :cond_2

    .line 198
    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->queue:Ljava/util/Queue;

    invoke-interface {v11}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/jboss/netty/channel/MessageEvent;

    iput-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 201
    :cond_2
    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v11, :cond_7

    .line 291
    :cond_3
    :goto_2
    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v11, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 295
    :cond_4
    if-eqz v1, :cond_0

    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isWritable()Z

    move-result v11

    if-eqz v11, :cond_5

    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->queue:Ljava/util/Queue;

    invoke-interface {v11}, Ljava/util/Queue;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_5

    if-eqz v8, :cond_6

    :cond_5
    iget-boolean v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flushNeeded:Z

    if-eqz v11, :cond_0

    .line 297
    :cond_6
    invoke-direct/range {p0 .. p2}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    goto :goto_1

    .line 205
    :cond_7
    :try_start_2
    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {v11}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v11

    invoke-interface {v11}, Lorg/jboss/netty/channel/ChannelFuture;->isDone()Z

    move-result v11

    if-eqz v11, :cond_8

    .line 208
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 284
    :goto_3
    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v11

    if-nez v11, :cond_1

    .line 285
    invoke-direct/range {p0 .. p2}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->discard(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 291
    iget-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    goto :goto_0

    .line 210
    :cond_8
    :try_start_3
    iget-object v5, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 211
    .local v5, "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v5}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v7

    .line 212
    .local v7, "m":Ljava/lang/Object;
    instance-of v11, v7, Lorg/jboss/netty/handler/stream/ChunkedInput;

    if-eqz v11, :cond_d

    .line 213
    move-object v0, v7

    check-cast v0, Lorg/jboss/netty/handler/stream/ChunkedInput;

    move-object v4, v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 217
    .local v4, "chunks":Lorg/jboss/netty/handler/stream/ChunkedInput;
    :try_start_4
    invoke-interface {v4}, Lorg/jboss/netty/handler/stream/ChunkedInput;->nextChunk()Ljava/lang/Object;

    move-result-object v3

    .line 218
    .local v3, "chunk":Ljava/lang/Object;
    invoke-interface {v4}, Lorg/jboss/netty/handler/stream/ChunkedInput;->isEndOfInput()Z

    move-result v6

    .line 219
    .local v6, "endOfInput":Z
    if-nez v3, :cond_a

    .line 220
    sget-object v3, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 222
    .local v3, "chunk":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-nez v6, :cond_9

    move v8, v12

    .line 240
    .end local v3    # "chunk":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_4
    if-nez v8, :cond_3

    .line 247
    if-eqz v6, :cond_c

    .line 248
    const/4 v11, 0x0

    :try_start_5
    iput-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 249
    invoke-interface {v5}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v10

    .line 256
    .local v10, "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v11, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler$1;

    invoke-direct {v11, p0, v4}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler$1;-><init>(Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;Lorg/jboss/netty/handler/stream/ChunkedInput;)V

    invoke-interface {v10, v11}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 274
    :goto_5
    invoke-interface {v5}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v11

    invoke-static {p1, v10, v3, v11}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    .line 291
    .end local v4    # "chunks":Lorg/jboss/netty/handler/stream/ChunkedInput;
    .end local v5    # "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    .end local v6    # "endOfInput":Z
    .end local v7    # "m":Ljava/lang/Object;
    .end local v10    # "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :catchall_0
    move-exception v11

    iget-object v12, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v12, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    throw v11

    .restart local v3    # "chunk":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v4    # "chunks":Lorg/jboss/netty/handler/stream/ChunkedInput;
    .restart local v5    # "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    .restart local v6    # "endOfInput":Z
    .restart local v7    # "m":Ljava/lang/Object;
    :cond_9
    move v8, v13

    .line 222
    goto :goto_4

    .line 224
    .local v3, "chunk":Ljava/lang/Object;
    :cond_a
    const/4 v8, 0x0

    goto :goto_4

    .line 226
    .end local v3    # "chunk":Ljava/lang/Object;
    .end local v6    # "endOfInput":Z
    :catch_0
    move-exception v9

    .line 227
    .local v9, "t":Ljava/lang/Throwable;
    const/4 v11, 0x0

    :try_start_6
    iput-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 229
    invoke-interface {v5}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v11

    invoke-interface {v11, v9}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 230
    if-eqz p2, :cond_b

    .line 231
    invoke-static {p1, v9}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 236
    :goto_6
    invoke-static {v4}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->closeInput(Lorg/jboss/netty/handler/stream/ChunkedInput;)V

    goto/16 :goto_2

    .line 233
    :cond_b
    invoke-static {p1, v9}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_6

    .line 263
    .end local v9    # "t":Ljava/lang/Throwable;
    .restart local v6    # "endOfInput":Z
    :cond_c
    invoke-static {v2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v10

    .line 264
    .restart local v10    # "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v11, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler$2;

    invoke-direct {v11, p0, v5}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler$2;-><init>(Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;Lorg/jboss/netty/channel/MessageEvent;)V

    invoke-interface {v10, v11}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_5

    .line 279
    .end local v4    # "chunks":Lorg/jboss/netty/handler/stream/ChunkedInput;
    .end local v6    # "endOfInput":Z
    .end local v10    # "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_d
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 280
    invoke-interface {p1, v5}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3
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
    .line 317
    return-void
.end method

.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 5
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 330
    const/4 v0, 0x0

    .line 331
    .local v0, "cause":Ljava/lang/Throwable;
    const/4 v2, 0x0

    .line 334
    .local v2, "fireExceptionCaught":Z
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 336
    .local v1, "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    iget-object v4, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    if-nez v4, :cond_1

    .line 337
    iget-object v4, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->queue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 342
    .restart local v1    # "currentEvent":Lorg/jboss/netty/channel/MessageEvent;
    :goto_1
    if-nez v1, :cond_2

    .line 359
    if-eqz v2, :cond_0

    .line 360
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    invoke-static {v4, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 362
    :cond_0
    return-void

    .line 339
    :cond_1
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->currentEvent:Lorg/jboss/netty/channel/MessageEvent;

    goto :goto_1

    .line 346
    :cond_2
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v3

    .line 347
    .local v3, "m":Ljava/lang/Object;
    instance-of v4, v3, Lorg/jboss/netty/handler/stream/ChunkedInput;

    if-eqz v4, :cond_3

    .line 348
    check-cast v3, Lorg/jboss/netty/handler/stream/ChunkedInput;

    .end local v3    # "m":Ljava/lang/Object;
    invoke-static {v3}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->closeInput(Lorg/jboss/netty/handler/stream/ChunkedInput;)V

    .line 352
    :cond_3
    if-nez v0, :cond_4

    .line 353
    new-instance v0, Ljava/io/IOException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    const-string v4, "Unable to flush event, discarding"

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 355
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_4
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v4, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 356
    const/4 v2, 0x1

    .line 357
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
    .line 313
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
    .line 323
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    .line 324
    return-void
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
    .line 108
    instance-of v2, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-nez v2, :cond_1

    .line 109
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 123
    .end local p2    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    :cond_0
    :goto_0
    return-void

    .line 113
    .restart local p2    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->queue:Ljava/util/Queue;

    check-cast p2, Lorg/jboss/netty/channel/MessageEvent;

    .end local p2    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    invoke-interface {v2, p2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v1

    .line 114
    .local v1, "offered":Z
    sget-boolean v2, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    if-nez v1, :cond_2

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 116
    :cond_2
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 119
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isWritable()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v2

    if-nez v2, :cond_0

    .line 120
    :cond_3
    iput-object p1, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 121
    const/4 v2, 0x0

    invoke-direct {p0, p1, v2}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    goto :goto_0
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 127
    instance-of v1, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v1, :cond_0

    move-object v0, p2

    .line 128
    check-cast v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 129
    .local v0, "cse":Lorg/jboss/netty/channel/ChannelStateEvent;
    sget-object v1, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler$3;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 142
    .end local v0    # "cse":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_0
    :goto_0
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 143
    return-void

    .line 132
    .restart local v0    # "cse":Lorg/jboss/netty/channel/ChannelStateEvent;
    :pswitch_0
    invoke-direct {p0, p1, v3}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    goto :goto_0

    .line 135
    :pswitch_1
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 137
    invoke-direct {p0, p1, v3}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    goto :goto_0

    .line 129
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public resumeTransfer()V
    .locals 4

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 93
    .local v0, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    if-nez v0, :cond_1

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 98
    :cond_1
    const/4 v2, 0x0

    :try_start_0
    invoke-direct {p0, v0, v2}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->flush(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 99
    :catch_0
    move-exception v1

    .line 100
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 101
    sget-object v2, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v3, "Unexpected exception while sending chunks."

    invoke-interface {v2, v3, v1}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
