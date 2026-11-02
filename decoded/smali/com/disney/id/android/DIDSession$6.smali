.class Lcom/disney/id/android/DIDSession$6;
.super Ljava/lang/Object;
.source "DIDSession.java"

# interfaces
.implements Lcom/disney/id/android/IDIDSessionManager$RequestFailure;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDSession;->migrateFromBlueCookie(Ljava/lang/String;Lcom/disney/id/android/DIDSession$RequestSuccess;Lcom/disney/id/android/DIDSession$RequestFailure;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDSession;

.field final synthetic val$loginFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDSession$RequestFailure;)V
    .locals 0

    .prologue
    .line 591
    iput-object p1, p0, Lcom/disney/id/android/DIDSession$6;->this$0:Lcom/disney/id/android/DIDSession;

    iput-object p2, p0, Lcom/disney/id/android/DIDSession$6;->val$loginFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/disney/id/android/DIDSessionManagerFailure;)V
    .locals 2
    .param p1, "error"    # Lcom/disney/id/android/DIDSessionManagerFailure;

    .prologue
    .line 594
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0, p1}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/Throwable;)V

    .line 595
    .local v0, "failure":Lcom/disney/id/android/DIDException;
    iget-object v1, p0, Lcom/disney/id/android/DIDSession$6;->this$0:Lcom/disney/id/android/DIDSession;

    iget-object v1, v1, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v1, v0}, Lcom/disney/id/android/DIDSessionDelegate;->onLoginBlueFailure(Lcom/disney/id/android/DIDException;)V

    .line 596
    iget-object v1, p0, Lcom/disney/id/android/DIDSession$6;->val$loginFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    if-eqz v1, :cond_0

    .line 597
    iget-object v1, p0, Lcom/disney/id/android/DIDSession$6;->val$loginFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    invoke-interface {v1, v0}, Lcom/disney/id/android/DIDSession$RequestFailure;->onFailure(Lcom/disney/id/android/DIDException;)V

    .line 599
    :cond_0
    return-void
.end method
