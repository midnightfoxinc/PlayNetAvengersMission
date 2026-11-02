.class Lcom/disney/id/android/ImprovedDIDSessionManager$2;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;->loginWithBlueCookie(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
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

.field final synthetic val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;


# direct methods
.method constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/DIDStateManager;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;JLcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V
    .locals 0

    .prologue
    .line 136
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    iput-object p2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-object p3, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$failureAction:Lcom/disney/id/android/IDIDSessionManager$RequestFailure;

    iput-wide p4, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$serviceCallStartTime:J

    iput-object p6, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 11
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    const/4 v10, 0x0

    .line 139
    iget-object v8, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    .line 140
    .local v8, "networkResponse":Lcom/disney/id/android/volley/NetworkResponse;
    new-instance v9, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    invoke-direct {v9, v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;-><init>(Lcom/disney/id/android/volley/NetworkResponse;)V

    .line 141
    .local v9, "response":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;
    invoke-virtual {v9}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->isConnectivityError()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 142
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:bluecookie"

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;)V

    .line 143
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0, v10}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$202(Lcom/disney/id/android/ImprovedDIDSessionManager;Z)Z

    .line 144
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$failureAction:Lcom/disney/id/android/IDIDSessionManager$RequestFailure;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$failureAction:Lcom/disney/id/android/IDIDSessionManager$RequestFailure;

    invoke-static {}, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->getDefaultError()Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/disney/id/android/IDIDSessionManager$RequestFailure;->failure(Lcom/disney/id/android/DIDSessionManagerFailure;)V

    .line 165
    :cond_0
    :goto_0
    return-void

    .line 149
    :cond_1
    invoke-virtual {v9}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->hasData()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 150
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:bluecookie"

    iget-wide v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$serviceCallStartTime:J

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZ)V

    .line 151
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    invoke-static {v0, v9, v1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$300(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V

    goto :goto_0

    .line 155
    :cond_2
    invoke-virtual {v9}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getError()Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    move-result-object v7

    .line 156
    .local v7, "guestControllerError":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:bluecookie"

    iget-wide v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$serviceCallStartTime:J

    invoke-virtual {v7}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->isSuccess()Z

    move-result v4

    invoke-virtual {v7}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getFormattedErrors()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCategory()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 161
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0, v10}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$202(Lcom/disney/id/android/ImprovedDIDSessionManager;Z)Z

    .line 162
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$failureAction:Lcom/disney/id/android/IDIDSessionManager$RequestFailure;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$2;->val$failureAction:Lcom/disney/id/android/IDIDSessionManager$RequestFailure;

    new-instance v1, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;

    iget v2, v8, Lcom/disney/id/android/volley/NetworkResponse;->statusCode:I

    iget-object v3, v8, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v8}, Lcom/disney/id/android/improvedguestcontroller/DIDNetworkResponseUtils;->getJSONObjectFromResponseSilently(Lcom/disney/id/android/volley/NetworkResponse;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4, v7}, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;-><init>(ILjava/util/Map;Lorg/json/JSONObject;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;)V

    invoke-interface {v0, v1}, Lcom/disney/id/android/IDIDSessionManager$RequestFailure;->failure(Lcom/disney/id/android/DIDSessionManagerFailure;)V

    goto :goto_0
.end method
