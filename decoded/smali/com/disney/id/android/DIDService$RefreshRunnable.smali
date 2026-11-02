.class final Lcom/disney/id/android/DIDService$RefreshRunnable;
.super Ljava/lang/Object;
.source "DIDService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "RefreshRunnable"
.end annotation


# instance fields
.field private final request:Lcom/disney/id/android/DIDRequest;

.field final synthetic this$0:Lcom/disney/id/android/DIDService;


# direct methods
.method public constructor <init>(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;)V
    .locals 0
    .param p2, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 288
    iput-object p1, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->this$0:Lcom/disney/id/android/DIDService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 289
    iput-object p2, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->request:Lcom/disney/id/android/DIDRequest;

    .line 290
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 294
    iget-object v1, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v1}, Lcom/disney/id/android/DIDService;->access$700(Lcom/disney/id/android/DIDService;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/disney/id/android/DIDWebUtils;->isConnected(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->request:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v1

    invoke-static {v1}, Lcom/disney/id/android/DIDWebUtils;->isOfflineRequest(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 297
    iget-object v1, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->request:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v1

    invoke-static {v1}, Lcom/disney/id/android/DIDWebUtils;->isInternalRequest(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 298
    iget-object v1, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v1}, Lcom/disney/id/android/DIDService;->access$700(Lcom/disney/id/android/DIDService;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->request:Lcom/disney/id/android/DIDRequest;

    invoke-static {v1, v2}, Lcom/disney/id/android/DIDWebUtils;->reportNetworkError(Landroid/content/Context;Lcom/disney/id/android/DIDRequest;)V

    .line 304
    :cond_0
    :goto_0
    return-void

    .line 301
    :cond_1
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 302
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->request:Lcom/disney/id/android/DIDRequest;

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 303
    iget-object v1, p0, Lcom/disney/id/android/DIDService$RefreshRunnable;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v1}, Lcom/disney/id/android/DIDService;->access$800(Lcom/disney/id/android/DIDService;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
