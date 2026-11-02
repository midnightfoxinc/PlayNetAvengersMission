.class public Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;
.super Ljava/lang/Object;
.source "DefaultChannelGroupFuture.java"

# interfaces
.implements Lorg/jboss/netty/channel/group/ChannelGroupFuture;


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final childListener:Lorg/jboss/netty/channel/ChannelFutureListener;

.field private done:Z

.field failureCount:I

.field private firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

.field final futures:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/channel/ChannelFuture;",
            ">;"
        }
    .end annotation
.end field

.field private final group:Lorg/jboss/netty/channel/group/ChannelGroup;

.field private otherListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;",
            ">;"
        }
    .end annotation
.end field

.field successCount:I

.field private waiters:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Collection;)V
    .locals 5
    .param p1, "group"    # Lorg/jboss/netty/channel/group/ChannelGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/group/ChannelGroup;",
            "Ljava/util/Collection",
            "<",
            "Lorg/jboss/netty/channel/ChannelFuture;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p2, "futures":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jboss/netty/channel/ChannelFuture;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v3, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;

    invoke-direct {v3, p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;-><init>(Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;)V

    iput-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->childListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    .line 78
    if-nez p1, :cond_0

    .line 79
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "group"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 81
    :cond_0
    if-nez p2, :cond_1

    .line 82
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "futures"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 85
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->group:Lorg/jboss/netty/channel/group/ChannelGroup;

    .line 87
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 88
    .local v1, "futureMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/ChannelFuture;

    .line 89
    .local v0, "f":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 92
    .end local v0    # "f":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_2
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    iput-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    .line 94
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/ChannelFuture;

    .line 95
    .restart local v0    # "f":Lorg/jboss/netty/channel/ChannelFuture;
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->childListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v0, v3}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_1

    .line 99
    .end local v0    # "f":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_3
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 100
    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->setDone()Z

    .line 102
    :cond_4
    return-void
.end method

.method constructor <init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Map;)V
    .locals 3
    .param p1, "group"    # Lorg/jboss/netty/channel/group/ChannelGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/group/ChannelGroup;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/channel/ChannelFuture;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p2, "futures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;

    invoke-direct {v2, p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture$1;-><init>(Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;)V

    iput-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->childListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    .line 105
    iput-object p1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->group:Lorg/jboss/netty/channel/group/ChannelGroup;

    .line 106
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    iput-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    .line 107
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/ChannelFuture;

    .line 108
    .local v0, "f":Lorg/jboss/netty/channel/ChannelFuture;
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->childListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v0, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_0

    .line 112
    .end local v0    # "f":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 113
    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->setDone()Z

    .line 115
    :cond_1
    return-void
.end method

.method private await0(JZ)Z
    .locals 13
    .param p1, "timeoutNanos"    # J
    .param p3, "interruptable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 268
    if-eqz p3, :cond_0

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 269
    new-instance v6, Ljava/lang/InterruptedException;

    invoke-direct {v6}, Ljava/lang/InterruptedException;-><init>()V

    throw v6

    .line 272
    :cond_0
    cmp-long v8, p1, v6

    if-gtz v8, :cond_3

    move-wide v2, v6

    .line 273
    .local v2, "startTime":J
    :goto_0
    move-wide v4, p1

    .line 274
    .local v4, "waitTime":J
    const/4 v1, 0x0

    .line 277
    .local v1, "interrupted":Z
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 278
    :try_start_1
    iget-boolean v8, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z

    if-nez v8, :cond_1

    cmp-long v8, v4, v6

    if-gtz v8, :cond_4

    .line 279
    :cond_1
    iget-boolean v6, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 310
    if-eqz v1, :cond_2

    .line 311
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    :goto_1
    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    .line 301
    :cond_2
    return v6

    .line 272
    .end local v1    # "interrupted":Z
    .end local v2    # "startTime":J
    .end local v4    # "waitTime":J
    :cond_3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    goto :goto_0

    .line 282
    .restart local v1    # "interrupted":Z
    .restart local v2    # "startTime":J
    .restart local v4    # "waitTime":J
    :cond_4
    :try_start_2
    invoke-static {}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->checkDeadLock()V

    .line 283
    iget v8, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 287
    :cond_5
    const-wide/32 v8, 0xf4240

    :try_start_3
    div-long v8, v4, v8

    const-wide/32 v10, 0xf4240

    rem-long v10, v4, v10

    long-to-int v10, v10

    invoke-virtual {p0, v8, v9, v10}, Ljava/lang/Object;->wait(JI)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 296
    :goto_2
    :try_start_4
    iget-boolean v8, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v8, :cond_8

    .line 297
    const/4 v6, 0x1

    .line 306
    :try_start_5
    iget v7, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    .line 297
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 310
    if-eqz v1, :cond_2

    .line 311
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    goto :goto_1

    .line 288
    :catch_0
    move-exception v0

    .line 289
    .local v0, "e":Ljava/lang/InterruptedException;
    if-eqz p3, :cond_7

    .line 290
    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 306
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v6

    :try_start_7
    iget v7, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    throw v6

    .line 308
    :catchall_1
    move-exception v6

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v6
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 310
    :catchall_2
    move-exception v6

    if-eqz v1, :cond_6

    .line 311
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    .line 310
    :cond_6
    throw v6

    .line 292
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    :cond_7
    const/4 v1, 0x1

    goto :goto_2

    .line 299
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_8
    :try_start_9
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    sub-long/2addr v8, v2

    sub-long v4, p1, v8

    .line 300
    cmp-long v8, v4, v6

    if-gtz v8, :cond_5

    .line 301
    iget-boolean v6, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 306
    :try_start_a
    iget v7, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    .line 301
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 310
    if-eqz v1, :cond_2

    .line 311
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    goto :goto_1
.end method

.method private static checkDeadLock()V
    .locals 2

    .prologue
    .line 317
    sget-object v0, Lorg/jboss/netty/util/internal/DeadLockProofWorker;->PARENT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 318
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "await*() in I/O thread causes a dead lock or sudden performance drop. Use addListener() instead or call await*() from a different thread."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 323
    :cond_0
    return-void
.end method

.method private notifyListener(Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;)V
    .locals 4
    .param p1, "l"    # Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    .prologue
    .line 363
    :try_start_0
    invoke-interface {p1, p0}, Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;->operationComplete(Lorg/jboss/netty/channel/group/ChannelGroupFuture;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 371
    :cond_0
    :goto_0
    return-void

    .line 364
    :catch_0
    move-exception v0

    .line 365
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 366
    sget-object v1, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "An exception was thrown by "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-class v3, Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private notifyListeners()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 348
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    if-eqz v2, :cond_1

    .line 349
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    invoke-direct {p0, v2}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->notifyListener(Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;)V

    .line 350
    iput-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    .line 352
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    if-eqz v2, :cond_1

    .line 353
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    .line 354
    .local v1, "l":Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;
    invoke-direct {p0, v1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->notifyListener(Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;)V

    goto :goto_0

    .line 356
    .end local v1    # "l":Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;
    :cond_0
    iput-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    .line 359
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method


# virtual methods
.method public addListener(Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;)V
    .locals 3
    .param p1, "listener"    # Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    .prologue
    .line 155
    if-nez p1, :cond_0

    .line 156
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "listener"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 159
    :cond_0
    const/4 v0, 0x0

    .line 160
    .local v0, "notifyNow":Z
    monitor-enter p0

    .line 161
    :try_start_0
    iget-boolean v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z

    if-eqz v1, :cond_2

    .line 162
    const/4 v0, 0x1

    .line 173
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    if-eqz v0, :cond_1

    .line 176
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->notifyListener(Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;)V

    .line 178
    :cond_1
    return-void

    .line 164
    :cond_2
    :try_start_1
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    if-nez v1, :cond_3

    .line 165
    iput-object p1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    goto :goto_0

    .line 173
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 167
    :cond_3
    :try_start_2
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    if-nez v1, :cond_4

    .line 168
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    .line 170
    :cond_4
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public await()Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 202
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 205
    :cond_0
    monitor-enter p0

    .line 206
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z

    if-nez v0, :cond_1

    .line 207
    invoke-static {}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->checkDeadLock()V

    .line 208
    iget v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 212
    :try_start_2
    iget v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    goto :goto_0

    .line 215
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 212
    :catchall_1
    move-exception v0

    :try_start_3
    iget v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    throw v0

    .line 215
    :cond_1
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 216
    return-object p0
.end method

.method public await(J)Z
    .locals 3
    .param p1, "timeoutMillis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 225
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->await0(JZ)Z

    move-result v0

    return v0
.end method

.method public await(JLjava/util/concurrent/TimeUnit;)Z
    .locals 3
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 221
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->await0(JZ)Z

    move-result v0

    return v0
.end method

.method public awaitUninterruptibly()Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 4

    .prologue
    .line 229
    const/4 v1, 0x0

    .line 230
    .local v1, "interrupted":Z
    monitor-enter p0

    .line 231
    :goto_0
    :try_start_0
    iget-boolean v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z

    if-nez v2, :cond_0

    .line 232
    invoke-static {}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->checkDeadLock()V

    .line 233
    iget v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 239
    :try_start_2
    iget v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    goto :goto_0

    .line 242
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 236
    :catch_0
    move-exception v0

    .line 237
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 239
    :try_start_3
    iget v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    goto :goto_0

    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_1
    move-exception v2

    iget v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    throw v2

    .line 242
    :cond_0
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 244
    if-eqz v1, :cond_1

    .line 245
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 248
    :cond_1
    return-object p0
.end method

.method public awaitUninterruptibly(J)Z
    .locals 5
    .param p1, "timeoutMillis"    # J

    .prologue
    .line 261
    :try_start_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    const/4 v1, 0x0

    invoke-direct {p0, v2, v3, v1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->await0(JZ)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 262
    :catch_0
    move-exception v0

    .line 263
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Ljava/lang/InternalError;

    invoke-direct {v1}, Ljava/lang/InternalError;-><init>()V

    throw v1
.end method

.method public awaitUninterruptibly(JLjava/util/concurrent/TimeUnit;)Z
    .locals 5
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 253
    :try_start_0
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    const/4 v1, 0x0

    invoke-direct {p0, v2, v3, v1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->await0(JZ)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 254
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Ljava/lang/InternalError;

    invoke-direct {v1}, Ljava/lang/InternalError;-><init>()V

    throw v1
.end method

.method public find(Ljava/lang/Integer;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "channelId"    # Ljava/lang/Integer;

    .prologue
    .line 122
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/ChannelFuture;

    return-object v0
.end method

.method public find(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 126
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/ChannelFuture;

    return-object v0
.end method

.method public getGroup()Lorg/jboss/netty/channel/group/ChannelGroup;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->group:Lorg/jboss/netty/channel/group/ChannelGroup;

    return-object v0
.end method

.method public declared-synchronized isCompleteFailure()Z
    .locals 2

    .prologue
    .line 150
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v0

    .line 151
    .local v0, "futureCnt":I
    if-eqz v0, :cond_0

    iget v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->failureCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v1, v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    monitor-exit p0

    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 150
    .end local v0    # "futureCnt":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized isCompleteSuccess()Z
    .locals 2

    .prologue
    .line 138
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->successCount:I

    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isDone()Z
    .locals 1

    .prologue
    .line 134
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isPartialFailure()Z
    .locals 2

    .prologue
    .line 146
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->failureCount:I

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->failureCount:I

    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isPartialSuccess()Z
    .locals 2

    .prologue
    .line 142
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->successCount:I

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->successCount:I

    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jboss/netty/channel/ChannelFuture;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->futures:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public removeListener(Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    .prologue
    .line 181
    if-nez p1, :cond_0

    .line 182
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "listener"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 185
    :cond_0
    monitor-enter p0

    .line 186
    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z

    if-nez v0, :cond_1

    .line 187
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    if-ne p1, v0, :cond_3

    .line 188
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 189
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    iput-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    .line 197
    :cond_1
    :goto_0
    monitor-exit p0

    .line 198
    return-void

    .line 191
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->firstListener:Lorg/jboss/netty/channel/group/ChannelGroupFutureListener;

    goto :goto_0

    .line 197
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 193
    :cond_3
    :try_start_1
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 194
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->otherListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method setDone()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 326
    monitor-enter p0

    .line 328
    :try_start_0
    iget-boolean v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z

    if-eqz v1, :cond_0

    .line 329
    const/4 v0, 0x0

    monitor-exit p0

    .line 339
    :goto_0
    return v0

    .line 332
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->done:Z

    .line 333
    iget v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->waiters:I

    if-lez v1, :cond_1

    .line 334
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 336
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 338
    invoke-direct {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;->notifyListeners()V

    goto :goto_0

    .line 336
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
