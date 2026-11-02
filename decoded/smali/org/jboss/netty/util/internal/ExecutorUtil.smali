.class public final Lorg/jboss/netty/util/internal/ExecutorUtil;
.super Ljava/lang/Object;
.source "ExecutorUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    return-void
.end method

.method public static isShutdown(Ljava/util/concurrent/Executor;)Z
    .locals 1
    .param p0, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 61
    instance-of v0, p0, Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 62
    check-cast p0, Ljava/util/concurrent/ExecutorService;

    .end local p0    # "executor":Ljava/util/concurrent/Executor;
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    const/4 v0, 0x1

    .line 66
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static shutdownNow(Ljava/util/concurrent/Executor;)V
    .locals 3
    .param p0, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 34
    instance-of v2, p0, Ljava/util/concurrent/ExecutorService;

    if-eqz v2, :cond_0

    move-object v0, p0

    .line 35
    check-cast v0, Ljava/util/concurrent/ExecutorService;

    .line 37
    .local v0, "es":Ljava/util/concurrent/ExecutorService;
    :try_start_0
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_2

    .line 52
    .end local v0    # "es":Ljava/util/concurrent/ExecutorService;
    :cond_0
    :goto_0
    return-void

    .line 38
    .restart local v0    # "es":Ljava/util/concurrent/ExecutorService;
    :catch_0
    move-exception v1

    .line 41
    .local v1, "ex":Ljava/lang/SecurityException;
    :try_start_1
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_0

    .line 42
    :catch_1
    move-exception v2

    goto :goto_0

    .line 48
    .end local v1    # "ex":Ljava/lang/SecurityException;
    :catch_2
    move-exception v2

    goto :goto_0

    .line 45
    .restart local v1    # "ex":Ljava/lang/SecurityException;
    :catch_3
    move-exception v2

    goto :goto_0
.end method

.method public static varargs terminate(Ljava/lang/ThreadLocal;[Ljava/util/concurrent/Executor;)V
    .locals 13
    .param p1, "executors"    # [Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/concurrent/Executor;",
            ">;[",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "deadLockChecker":Ljava/lang/ThreadLocal;, "Ljava/lang/ThreadLocal<Ljava/util/concurrent/Executor;>;"
    if-nez p1, :cond_0

    .line 81
    new-instance v10, Ljava/lang/NullPointerException;

    const-string v11, "executors"

    invoke-direct {v10, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 84
    :cond_0
    array-length v10, p1

    new-array v5, v10, [Ljava/util/concurrent/Executor;

    .line 85
    .local v5, "executorsCopy":[Ljava/util/concurrent/Executor;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    array-length v10, p1

    if-ge v6, v10, :cond_2

    .line 86
    aget-object v10, p1, v6

    if-nez v10, :cond_1

    .line 87
    new-instance v10, Ljava/lang/NullPointerException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "executors["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x5d

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 89
    :cond_1
    aget-object v10, p1, v6

    aput-object v10, v5, v6

    .line 85
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 93
    :cond_2
    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/Executor;

    .line 94
    .local v1, "currentParent":Ljava/util/concurrent/Executor;
    if-eqz v1, :cond_4

    .line 95
    move-object v0, v5

    .local v0, "arr$":[Ljava/util/concurrent/Executor;
    array-length v9, v0

    .local v9, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_1
    if-ge v7, v9, :cond_4

    aget-object v2, v0, v7

    .line 96
    .local v2, "e":Ljava/util/concurrent/Executor;
    if-ne v2, v1, :cond_3

    .line 97
    new-instance v10, Ljava/lang/IllegalStateException;

    const-string v11, "An Executor cannot be shut down from the thread acquired from itself.  Please make sure you are not calling releaseExternalResources() from an I/O worker thread."

    invoke-direct {v10, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 95
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 107
    .end local v0    # "arr$":[Ljava/util/concurrent/Executor;
    .end local v2    # "e":Ljava/util/concurrent/Executor;
    .end local v7    # "i$":I
    .end local v9    # "len$":I
    :cond_4
    const/4 v8, 0x0

    .line 108
    .local v8, "interrupted":Z
    move-object v0, v5

    .restart local v0    # "arr$":[Ljava/util/concurrent/Executor;
    array-length v9, v0

    .restart local v9    # "len$":I
    const/4 v7, 0x0

    .restart local v7    # "i$":I
    :goto_2
    if-ge v7, v9, :cond_7

    aget-object v2, v0, v7

    .line 109
    .restart local v2    # "e":Ljava/util/concurrent/Executor;
    instance-of v10, v2, Ljava/util/concurrent/ExecutorService;

    if-nez v10, :cond_5

    .line 108
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_5
    move-object v3, v2

    .line 113
    check-cast v3, Ljava/util/concurrent/ExecutorService;

    .line 115
    .local v3, "es":Ljava/util/concurrent/ExecutorService;
    :cond_6
    :goto_4
    invoke-static {v3}, Lorg/jboss/netty/util/internal/ExecutorUtil;->shutdownNow(Ljava/util/concurrent/Executor;)V

    .line 118
    const-wide/16 v10, 0x64

    :try_start_0
    sget-object v12, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v10, v11, v12}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    if-eqz v10, :cond_6

    goto :goto_3

    .line 121
    :catch_0
    move-exception v4

    .line 122
    .local v4, "ex":Ljava/lang/InterruptedException;
    const/4 v8, 0x1

    .line 123
    goto :goto_4

    .line 127
    .end local v2    # "e":Ljava/util/concurrent/Executor;
    .end local v3    # "es":Ljava/util/concurrent/ExecutorService;
    .end local v4    # "ex":Ljava/lang/InterruptedException;
    :cond_7
    if-eqz v8, :cond_8

    .line 128
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->interrupt()V

    .line 130
    :cond_8
    return-void
.end method

.method public static varargs terminate([Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p0, "executors"    # [Ljava/util/concurrent/Executor;

    .prologue
    .line 73
    sget-object v0, Lorg/jboss/netty/util/internal/DeadLockProofWorker;->PARENT:Ljava/lang/ThreadLocal;

    invoke-static {v0, p0}, Lorg/jboss/netty/util/internal/ExecutorUtil;->terminate(Ljava/lang/ThreadLocal;[Ljava/util/concurrent/Executor;)V

    .line 74
    return-void
.end method
