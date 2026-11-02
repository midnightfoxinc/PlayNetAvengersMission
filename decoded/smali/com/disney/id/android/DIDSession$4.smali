.class Lcom/disney/id/android/DIDSession$4;
.super Ljava/lang/Object;
.source "DIDSession.java"

# interfaces
.implements Lcom/disney/id/android/IDIDSessionManager$RequestFailure;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDSession;->getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/DIDSession$RequestSuccess;Lcom/disney/id/android/DIDSession$RequestFailure;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDSession;

.field final synthetic val$failureAction:Lcom/disney/id/android/DIDSession$RequestFailure;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDSession$RequestFailure;)V
    .locals 0

    .prologue
    .line 447
    iput-object p1, p0, Lcom/disney/id/android/DIDSession$4;->this$0:Lcom/disney/id/android/DIDSession;

    iput-object p2, p0, Lcom/disney/id/android/DIDSession$4;->val$failureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/disney/id/android/DIDSessionManagerFailure;)V
    .locals 2
    .param p1, "error"    # Lcom/disney/id/android/DIDSessionManagerFailure;

    .prologue
    .line 450
    iget-object v0, p0, Lcom/disney/id/android/DIDSession$4;->val$failureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    new-instance v1, Lcom/disney/id/android/DIDException;

    invoke-direct {v1, p1}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Lcom/disney/id/android/DIDSession$RequestFailure;->onFailure(Lcom/disney/id/android/DIDException;)V

    .line 451
    return-void
.end method
