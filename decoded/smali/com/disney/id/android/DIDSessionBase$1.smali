.class Lcom/disney/id/android/DIDSessionBase$1;
.super Ljava/lang/Object;
.source "DIDSessionBase.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDSessionBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDSessionBase;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSessionBase;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    const/4 v4, 0x1

    .line 49
    move-object v0, p2

    check-cast v0, Lcom/disney/id/android/DIDService$SessionBinder;

    .line 50
    .local v0, "binder":Lcom/disney/id/android/DIDService$SessionBinder;
    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDService$SessionBinder;->getService()Lcom/disney/id/android/DIDService;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/disney/id/android/DIDSessionBase;->access$002(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDService;)Lcom/disney/id/android/DIDService;

    .line 51
    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    iput-boolean v4, v2, Lcom/disney/id/android/DIDSessionBase;->mIsBound:Z

    .line 54
    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    iget-object v2, v2, Lcom/disney/id/android/DIDSessionBase;->mServiceConnection:Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;

    if-eqz v2, :cond_0

    .line 55
    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    iget-object v2, v2, Lcom/disney/id/android/DIDSessionBase;->mServiceConnection:Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;

    invoke-interface {v2}, Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;->onServiceConnected()V

    .line 57
    :cond_0
    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    invoke-static {v2}, Lcom/disney/id/android/DIDSessionBase;->access$100(Lcom/disney/id/android/DIDSessionBase;)Ljava/util/Queue;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    invoke-static {v2}, Lcom/disney/id/android/DIDSessionBase;->access$100(Lcom/disney/id/android/DIDSessionBase;)Ljava/util/Queue;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 58
    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    invoke-static {v2}, Lcom/disney/id/android/DIDSessionBase;->access$100(Lcom/disney/id/android/DIDSessionBase;)Ljava/util/Queue;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 59
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/disney/id/android/DIDRequest;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 60
    iget-object v3, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v3, v2, v4}, Lcom/disney/id/android/DIDSessionBase;->startRequest(Lcom/disney/id/android/DIDRequest;Z)V

    .line 61
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 65
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/disney/id/android/DIDRequest;>;"
    :cond_1
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/disney/id/android/DIDSessionBase;->mIsBound:Z

    .line 72
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionBase;->mServiceConnection:Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionBase$1;->this$0:Lcom/disney/id/android/DIDSessionBase;

    iget-object v0, v0, Lcom/disney/id/android/DIDSessionBase;->mServiceConnection:Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;->onServiceDisconnected()V

    .line 74
    :cond_0
    return-void
.end method
