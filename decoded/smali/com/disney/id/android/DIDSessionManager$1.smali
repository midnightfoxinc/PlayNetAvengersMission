.class Lcom/disney/id/android/DIDSessionManager$1;
.super Ljava/lang/Object;
.source "DIDSessionManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDSessionManager;

.field final synthetic val$response:Lcom/disney/id/android/DIDResponse;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSessionManager;Lcom/disney/id/android/DIDResponse;)V
    .locals 0

    .prologue
    .line 88
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionManager$1;->this$0:Lcom/disney/id/android/DIDSessionManager;

    iput-object p2, p0, Lcom/disney/id/android/DIDSessionManager$1;->val$response:Lcom/disney/id/android/DIDResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 90
    iget-object v3, p0, Lcom/disney/id/android/DIDSessionManager$1;->this$0:Lcom/disney/id/android/DIDSessionManager;

    invoke-static {v3}, Lcom/disney/id/android/DIDSessionManager;->access$000(Lcom/disney/id/android/DIDSessionManager;)Ljava/util/List;

    move-result-object v4

    monitor-enter v4

    .line 91
    :try_start_0
    iget-object v3, p0, Lcom/disney/id/android/DIDSessionManager$1;->this$0:Lcom/disney/id/android/DIDSessionManager;

    invoke-static {v3}, Lcom/disney/id/android/DIDSessionManager;->access$000(Lcom/disney/id/android/DIDSessionManager;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/DIDSessionDelegate;

    .line 92
    .local v0, "callback":Lcom/disney/id/android/DIDSessionDelegate;
    new-instance v1, Lcom/disney/id/android/DIDSessionManager$1$1;

    invoke-direct {v1, p0, v0}, Lcom/disney/id/android/DIDSessionManager$1$1;-><init>(Lcom/disney/id/android/DIDSessionManager$1;Lcom/disney/id/android/DIDSessionDelegate;)V

    .line 166
    .local v1, "closure":Ljava/lang/Runnable;
    iget-object v3, p0, Lcom/disney/id/android/DIDSessionManager$1;->this$0:Lcom/disney/id/android/DIDSessionManager;

    invoke-static {v3}, Lcom/disney/id/android/DIDSessionManager;->access$200(Lcom/disney/id/android/DIDSessionManager;)Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 168
    .end local v0    # "callback":Lcom/disney/id/android/DIDSessionDelegate;
    .end local v1    # "closure":Ljava/lang/Runnable;
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    return-void
.end method
