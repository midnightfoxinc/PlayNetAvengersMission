.class public Lorg/jboss/netty/handler/execution/ChainedExecutor;
.super Ljava/lang/Object;
.source "ChainedExecutor.java"

# interfaces
.implements Ljava/util/concurrent/Executor;
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final cur:Ljava/util/concurrent/Executor;

.field private final filter:Lorg/jboss/netty/handler/execution/ChannelEventRunnableFilter;

.field private final next:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lorg/jboss/netty/handler/execution/ChainedExecutor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/execution/ChannelEventRunnableFilter;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "filter"    # Lorg/jboss/netty/handler/execution/ChannelEventRunnableFilter;
    .param p2, "cur"    # Ljava/util/concurrent/Executor;
    .param p3, "next"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    if-nez p1, :cond_0

    .line 46
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "filter"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_0
    if-nez p2, :cond_1

    .line 49
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cur"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_1
    if-nez p3, :cond_2

    .line 52
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "next"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_2
    iput-object p1, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->filter:Lorg/jboss/netty/handler/execution/ChannelEventRunnableFilter;

    .line 56
    iput-object p2, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->cur:Ljava/util/concurrent/Executor;

    .line 57
    iput-object p3, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->next:Ljava/util/concurrent/Executor;

    .line 58
    return-void
.end method

.method private static releaseExternal(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p0, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 86
    instance-of v0, p0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    if-eqz v0, :cond_0

    .line 87
    check-cast p0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    .end local p0    # "executor":Ljava/util/concurrent/Executor;
    invoke-interface {p0}, Lorg/jboss/netty/util/ExternalResourceReleasable;->releaseExternalResources()V

    .line 89
    :cond_0
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "command"    # Ljava/lang/Runnable;

    .prologue
    .line 66
    sget-boolean v0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    instance-of v0, p1, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 67
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->filter:Lorg/jboss/netty/handler/execution/ChannelEventRunnableFilter;

    move-object v0, p1

    check-cast v0, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    invoke-interface {v1, v0}, Lorg/jboss/netty/handler/execution/ChannelEventRunnableFilter;->filter(Lorg/jboss/netty/handler/execution/ChannelEventRunnable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 68
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->cur:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 72
    :goto_0
    return-void

    .line 70
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->next:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->cur:Ljava/util/concurrent/Executor;

    instance-of v0, v0, Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->cur:Ljava/util/concurrent/Executor;

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 78
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->next:Ljava/util/concurrent/Executor;

    instance-of v0, v0, Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_1

    .line 79
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->next:Ljava/util/concurrent/Executor;

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 81
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->cur:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lorg/jboss/netty/handler/execution/ChainedExecutor;->releaseExternal(Ljava/util/concurrent/Executor;)V

    .line 82
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChainedExecutor;->next:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lorg/jboss/netty/handler/execution/ChainedExecutor;->releaseExternal(Ljava/util/concurrent/Executor;)V

    .line 83
    return-void
.end method
