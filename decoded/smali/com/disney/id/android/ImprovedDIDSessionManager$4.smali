.class Lcom/disney/id/android/ImprovedDIDSessionManager$4;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;->getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

.field final synthetic val$failureAction:Lcom/disney/id/android/IDIDSessionManager$RequestFailure;

.field final synthetic val$serviceCallStartTime:J

.field final synthetic val$stateManager:Lcom/disney/id/android/DIDStateManager;


# direct methods
.method constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/DIDStateManager;JLcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
    .locals 1

    .prologue
    .line 274
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$4;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    iput-object p2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$4;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-wide p3, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$4;->val$serviceCallStartTime:J

    iput-object p5, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$4;->val$failureAction:Lcom/disney/id/android/IDIDSessionManager$RequestFailure;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 8
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 277
    new-instance v7, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    invoke-direct {v7, p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;-><init>(Lcom/disney/id/android/volley/VolleyError;)V

    .line 278
    .local v7, "guestControllerError":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$4;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:activity-permission"

    iget-wide v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$4;->val$serviceCallStartTime:J

    invoke-virtual {v7}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->isSuccess()Z

    move-result v4

    invoke-virtual {v7}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getFormattedErrors()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCategory()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 283
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$4;->val$failureAction:Lcom/disney/id/android/IDIDSessionManager$RequestFailure;

    new-instance v1, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;

    invoke-virtual {v7}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCategory()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCode()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/disney/id/android/IDIDSessionManager$RequestFailure;->failure(Lcom/disney/id/android/DIDSessionManagerFailure;)V

    .line 284
    return-void
.end method
