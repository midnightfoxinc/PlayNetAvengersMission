.class Lcom/disney/id/android/DIDService$CustomHandler;
.super Landroid/os/Handler;
.source "DIDService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CustomHandler"
.end annotation


# instance fields
.field private final mService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/disney/id/android/DIDService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Looper;Lcom/disney/id/android/DIDService;)V
    .locals 1
    .param p1, "looper"    # Landroid/os/Looper;
    .param p2, "service"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 46
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDService$CustomHandler;->mService:Ljava/lang/ref/WeakReference;

    .line 47
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 51
    iget-object v1, p0, Lcom/disney/id/android/DIDService$CustomHandler;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/DIDService;

    .line 52
    .local v0, "service":Lcom/disney/id/android/DIDService;
    if-eqz v0, :cond_0

    .line 53
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/disney/id/android/DIDRequest;

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDService;->access$000(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;)V

    .line 55
    :cond_0
    return-void
.end method
