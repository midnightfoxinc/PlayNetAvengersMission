.class Lcom/disney/id/android/ImprovedDIDSessionManager$5;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;->getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/disney/id/android/volley/Response$Listener",
        "<",
        "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

.field final synthetic val$activityCode:Ljava/lang/String;

.field final synthetic val$serviceCallStartTime:J

.field final synthetic val$stateManager:Lcom/disney/id/android/DIDStateManager;

.field final synthetic val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;


# direct methods
.method constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/DIDStateManager;JLcom/disney/id/android/IDIDSessionManager$RequestSuccess;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 244
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    iput-object p2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-wide p3, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->val$serviceCallStartTime:J

    iput-object p5, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    iput-object p6, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->val$activityCode:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V
    .locals 6
    .param p1, "response"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    .prologue
    .line 248
    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v2, "event:activity-permission"

    iget-wide v4, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->val$serviceCallStartTime:J

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v4, v5, v3}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZ)V

    .line 249
    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v0

    .line 251
    .local v0, "responseContents":Lorg/json/JSONObject;
    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    new-instance v2, Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager$5;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;Lorg/json/JSONObject;)V

    invoke-interface {v1, v2}, Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;->success(Ljava/lang/Object;)V

    .line 270
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 244
    check-cast p1, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->onResponse(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V

    return-void
.end method
