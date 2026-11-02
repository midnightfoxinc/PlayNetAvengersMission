.class public final Lcom/ning/http/client/listenable/ExecutionList;
.super Ljava/lang/Object;
.source "ExecutionList.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/listenable/ExecutionList$RunnableExecutorPair;
    }
.end annotation


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field private executed:Z

.field private final runnables:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/ning/http/client/listenable/ExecutionList$RunnableExecutorPair;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lcom/ning/http/client/listenable/ExecutionList;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/listenable/ExecutionList;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/listenable/ExecutionList;->runnables:Ljava/util/Queue;

    .line 59
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/listenable/ExecutionList;->executed:Z

    .line 117
    return-void
.end method

.method static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/ning/http/client/listenable/ExecutionList;->log:Ljava/util/logging/Logger;

    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    .locals 4
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 67
    if-nez p1, :cond_0

    .line 68
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Runnable is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_0
    if-nez p2, :cond_1

    .line 72
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Executor is null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :cond_1
    const/4 v0, 0x0

    .line 80
    .local v0, "executeImmediate":Z
    iget-object v2, p0, Lcom/ning/http/client/listenable/ExecutionList;->runnables:Ljava/util/Queue;

    monitor-enter v2

    .line 81
    :try_start_0
    iget-boolean v1, p0, Lcom/ning/http/client/listenable/ExecutionList;->executed:Z

    if-nez v1, :cond_3

    .line 82
    iget-object v1, p0, Lcom/ning/http/client/listenable/ExecutionList;->runnables:Ljava/util/Queue;

    new-instance v3, Lcom/ning/http/client/listenable/ExecutionList$RunnableExecutorPair;

    invoke-direct {v3, p1, p2}, Lcom/ning/http/client/listenable/ExecutionList$RunnableExecutorPair;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    invoke-interface {v1, v3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 86
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    invoke-interface {p2, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 95
    :cond_2
    return-void

    .line 84
    :cond_3
    const/4 v0, 0x1

    goto :goto_0

    .line 86
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public run()V
    .locals 2

    .prologue
    .line 106
    iget-object v1, p0, Lcom/ning/http/client/listenable/ExecutionList;->runnables:Ljava/util/Queue;

    monitor-enter v1

    .line 107
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/ning/http/client/listenable/ExecutionList;->executed:Z

    .line 108
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    :goto_0
    iget-object v0, p0, Lcom/ning/http/client/listenable/ExecutionList;->runnables:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/ning/http/client/listenable/ExecutionList;->runnables:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/listenable/ExecutionList$RunnableExecutorPair;

    invoke-virtual {v0}, Lcom/ning/http/client/listenable/ExecutionList$RunnableExecutorPair;->execute()V

    goto :goto_0

    .line 108
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 115
    :cond_0
    return-void
.end method
