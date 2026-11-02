.class Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;
.super Ljava/lang/Object;
.source "InternalImprovedDIDSessionManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/InternalImprovedDIDSessionManager;->fireOneShotLoginSuccessAction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/InternalImprovedDIDSessionManager;


# direct methods
.method constructor <init>(Lcom/disney/id/android/InternalImprovedDIDSessionManager;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;->this$0:Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 73
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;->this$0:Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->access$100(Lcom/disney/id/android/InternalImprovedDIDSessionManager;)Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;->this$0:Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->access$100(Lcom/disney/id/android/InternalImprovedDIDSessionManager;)Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;->success(Ljava/lang/Object;)V

    .line 75
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;->this$0:Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    invoke-static {v0, v1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->access$102(Lcom/disney/id/android/InternalImprovedDIDSessionManager;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    .line 77
    :cond_0
    return-void
.end method
