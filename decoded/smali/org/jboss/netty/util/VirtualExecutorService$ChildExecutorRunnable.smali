.class Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;
.super Ljava/lang/Object;
.source "VirtualExecutorService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/VirtualExecutorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChildExecutorRunnable"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final runnable:Ljava/lang/Runnable;

.field final synthetic this$0:Lorg/jboss/netty/util/VirtualExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 161
    const-class v0, Lorg/jboss/netty/util/VirtualExecutorService;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lorg/jboss/netty/util/VirtualExecutorService;Ljava/lang/Runnable;)V
    .locals 0
    .param p2, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 165
    iput-object p1, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    iput-object p2, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->runnable:Ljava/lang/Runnable;

    .line 167
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 170
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    .line 171
    .local v1, "thread":Ljava/lang/Thread;
    iget-object v2, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    iget-object v3, v2, Lorg/jboss/netty/util/VirtualExecutorService;->startStopLock:Ljava/lang/Object;

    monitor-enter v3

    .line 172
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    iget-object v2, v2, Lorg/jboss/netty/util/VirtualExecutorService;->activeThreads:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 173
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 175
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->runnable:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 177
    iget-object v2, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    iget-object v3, v2, Lorg/jboss/netty/util/VirtualExecutorService;->startStopLock:Ljava/lang/Object;

    monitor-enter v3

    .line 178
    :try_start_2
    iget-object v2, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    iget-object v2, v2, Lorg/jboss/netty/util/VirtualExecutorService;->activeThreads:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 179
    .local v0, "removed":Z
    sget-boolean v2, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    if-nez v0, :cond_2

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 183
    .end local v0    # "removed":Z
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 173
    :catchall_1
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2

    .line 180
    .restart local v0    # "removed":Z
    :cond_0
    :try_start_4
    iget-object v4, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    invoke-virtual {v4}, Lorg/jboss/netty/util/VirtualExecutorService;->isTerminated()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 181
    iget-object v4, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    iget-object v4, v4, Lorg/jboss/netty/util/VirtualExecutorService;->startStopLock:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 183
    :cond_1
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 177
    throw v2

    .line 180
    :cond_2
    :try_start_5
    iget-object v2, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    invoke-virtual {v2}, Lorg/jboss/netty/util/VirtualExecutorService;->isTerminated()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 181
    iget-object v2, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    iget-object v2, v2, Lorg/jboss/netty/util/VirtualExecutorService;->startStopLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 183
    :cond_3
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 185
    return-void

    .line 177
    .end local v0    # "removed":Z
    :catchall_2
    move-exception v2

    iget-object v3, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    iget-object v3, v3, Lorg/jboss/netty/util/VirtualExecutorService;->startStopLock:Ljava/lang/Object;

    monitor-enter v3

    .line 178
    :try_start_6
    iget-object v4, p0, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->this$0:Lorg/jboss/netty/util/VirtualExecutorService;

    iget-object v4, v4, Lorg/jboss/netty/util/VirtualExecutorService;->activeThreads:Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 179
    .restart local v0    # "removed":Z
    sget-boolean v4, Lorg/jboss/netty/util/VirtualExecutorService$ChildExecutorRunnable;->$assertionsDisabled:Z

    if-nez v4, :cond_0

    if-nez v0, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 183
    .end local v0    # "removed":Z
    :catchall_3
    move-exception v2

    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v2
.end method
