.class public final Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;
.super Ljava/lang/Object;
.source "OrderedMemoryAwareThreadPoolExecutor.java"

# interfaces
.implements Ljava/util/concurrent/Executor;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ChildExecutor"
.end annotation


# instance fields
.field private final isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final tasks:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;


# direct methods
.method protected constructor <init>(Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;)V
    .locals 1

    .prologue
    .line 282
    iput-object p1, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->this$0:Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 283
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->tasks:Ljava/util/Queue;

    .line 284
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "command"    # Ljava/lang/Runnable;

    .prologue
    .line 288
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->tasks:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 290
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 291
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->this$0:Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;

    invoke-virtual {v0, p0}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;->doUnorderedExecute(Ljava/lang/Runnable;)V

    .line 293
    :cond_0
    return-void
.end method

.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 300
    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v6, 0x1

    invoke-virtual {v5, v7, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 301
    const/4 v0, 0x1

    .line 303
    .local v0, "acquired":Z
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    .line 305
    .local v4, "thread":Ljava/lang/Thread;
    :goto_0
    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->tasks:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 307
    .local v3, "task":Ljava/lang/Runnable;
    if-nez v3, :cond_1

    .line 326
    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 329
    if-eqz v0, :cond_0

    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->tasks:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 330
    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->this$0:Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;

    invoke-virtual {v5, p0}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;->doUnorderedExecute(Ljava/lang/Runnable;)V

    .line 333
    .end local v0    # "acquired":Z
    .end local v3    # "task":Ljava/lang/Runnable;
    .end local v4    # "thread":Ljava/lang/Thread;
    :cond_0
    return-void

    .line 311
    .restart local v0    # "acquired":Z
    .restart local v3    # "task":Ljava/lang/Runnable;
    .restart local v4    # "thread":Ljava/lang/Thread;
    :cond_1
    const/4 v2, 0x0

    .line 312
    .local v2, "ran":Z
    :try_start_1
    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->this$0:Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;

    invoke-virtual {v5, v4, v3}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;->beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 314
    :try_start_2
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 315
    const/4 v2, 0x1

    .line 316
    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->this$0:Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;->onAfterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 317
    :catch_0
    move-exception v1

    .line 318
    .local v1, "e":Ljava/lang/RuntimeException;
    if-nez v2, :cond_2

    .line 319
    :try_start_3
    iget-object v5, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->this$0:Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;

    invoke-virtual {v5, v3, v1}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;->onAfterExecute(Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    .line 321
    :cond_2
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 326
    .end local v1    # "e":Ljava/lang/RuntimeException;
    .end local v2    # "ran":Z
    .end local v3    # "task":Ljava/lang/Runnable;
    .end local v4    # "thread":Ljava/lang/Thread;
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    throw v5
.end method
