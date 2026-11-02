.class public final Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;
.super Ljava/lang/Object;
.source "GrizzlyConnectionPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DelayedExecutor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;
    }
.end annotation


# static fields
.field public static final UNSET_TIMEOUT:J = -0x1L


# instance fields
.field private final checkIntervalMs:J

.field private volatile isStarted:Z

.field private final queues:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;",
            ">;"
        }
    .end annotation
.end field

.field private final runnable:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;

.field private final sync:Ljava/lang/Object;

.field private final threadPool:Ljava/util/concurrent/ExecutorService;

.field private final totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ExecutorService;JLjava/util/concurrent/TimeUnit;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)V
    .locals 2
    .param p1, "threadPool"    # Ljava/util/concurrent/ExecutorService;
    .param p2, "checkInterval"    # J
    .param p4, "timeunit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "connectionsPool"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;

    .prologue
    .line 285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 264
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->runnable:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;

    .line 265
    const-class v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    invoke-static {v0}, Lorg/glassfish/grizzly/utils/DataStructures;->getLTQInstance(Ljava/lang/Class;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->queues:Ljava/util/concurrent/BlockingQueue;

    .line 267
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->sync:Ljava/lang/Object;

    .line 286
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->threadPool:Ljava/util/concurrent/ExecutorService;

    .line 287
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p2, p3, p4}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->checkIntervalMs:J

    .line 288
    invoke-static {p5}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 289
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)V
    .locals 6
    .param p1, "threadPool"    # Ljava/util/concurrent/ExecutorService;
    .param p2, "connectionsPool"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;

    .prologue
    .line 278
    const-wide/16 v2, 0x3e8

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;-><init>(Ljava/util/concurrent/ExecutorService;JLjava/util/concurrent/TimeUnit;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)V

    .line 279
    return-void
.end method

.method static synthetic access$100(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    .line 260
    iget-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->isStarted:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    .line 260
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    .line 260
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->sync:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)J
    .locals 2
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    .line 260
    iget-wide v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->checkIntervalMs:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)V
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    .line 260
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->start()V

    return-void
.end method

.method static synthetic access$300(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;JJ)Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;
    .param p1, "x1"    # J
    .param p3, "x2"    # J

    .prologue
    .line 260
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->createIdleConnectionQueue(JJ)Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)V
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    .line 260
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->stop()V

    return-void
.end method

.method static synthetic access$500(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/util/concurrent/ExecutorService;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    .line 260
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/util/concurrent/BlockingQueue;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    .line 260
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->queues:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method static synthetic access$900(JJ)Z
    .locals 2
    .param p0, "x0"    # J
    .param p2, "x1"    # J

    .prologue
    .line 260
    invoke-static {p0, p1, p2, p3}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->wasModified(JJ)Z

    move-result v0

    return v0
.end method

.method private createIdleConnectionQueue(JJ)Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "maxConnectionLifeTime"    # J

    .prologue
    .line 318
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;JJ)V

    .line 319
    .local v0, "queue":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->queues:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1, v0}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 320
    return-object v0
.end method

.method private getThreadPool()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->threadPool:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private start()V
    .locals 3

    .prologue
    .line 296
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->sync:Ljava/lang/Object;

    monitor-enter v1

    .line 297
    :try_start_0
    iget-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->isStarted:Z

    if-nez v0, :cond_0

    .line 298
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->isStarted:Z

    .line 299
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->threadPool:Ljava/util/concurrent/ExecutorService;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->runnable:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;

    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 301
    :cond_0
    monitor-exit v1

    .line 302
    return-void

    .line 301
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private stop()V
    .locals 2

    .prologue
    .line 305
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->sync:Ljava/lang/Object;

    monitor-enter v1

    .line 306
    :try_start_0
    iget-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->isStarted:Z

    if-eqz v0, :cond_0

    .line 307
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->isStarted:Z

    .line 308
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->sync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 310
    :cond_0
    monitor-exit v1

    .line 311
    return-void

    .line 310
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static wasModified(JJ)Z
    .locals 2
    .param p0, "l1"    # J
    .param p2, "l2"    # J

    .prologue
    .line 325
    cmp-long v0, p0, p2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
