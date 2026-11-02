.class Lcom/disney/id/android/ImprovedDIDSessionManager$7;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;->refreshToken(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

.field final synthetic val$actionCode:Ljava/lang/String;

.field final synthetic val$serviceCallStartTime:J


# direct methods
.method constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Ljava/lang/String;J)V
    .locals 1

    .prologue
    .line 321
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    iput-object p2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->val$actionCode:Ljava/lang/String;

    iput-wide p3, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->val$serviceCallStartTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 12
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    const/4 v11, 0x0

    .line 324
    new-instance v10, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    iget-object v0, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    invoke-direct {v10, v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;-><init>(Lcom/disney/id/android/volley/NetworkResponse;)V

    .line 325
    .local v10, "response":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;
    invoke-virtual {v10}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->isConnectivityError()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 326
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$400(Lcom/disney/id/android/ImprovedDIDSessionManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->val$actionCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;)V

    .line 328
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->isAccessTokenExpired()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->isRefreshTokenExpired()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    new-instance v7, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;

    const-string v0, "FAILURE_BY_DESIGN"

    const-string v1, "AUTHORIZATION_INVALID_REFRESH_TOKEN"

    invoke-direct {v7, v0, v1}, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    .local v7, "failure":Lcom/disney/id/android/DIDSessionManagerFailure;
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->logout()V

    .line 335
    :goto_0
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0, v11}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$202(Lcom/disney/id/android/ImprovedDIDSessionManager;Z)Z

    .line 337
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$700(Lcom/disney/id/android/ImprovedDIDSessionManager;)Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    move-result-object v0

    invoke-interface {v0, v7}, Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;->onTokenRefreshFailure(Lcom/disney/id/android/DIDSessionManagerFailure;)V

    .line 372
    .end local v7    # "failure":Lcom/disney/id/android/DIDSessionManagerFailure;
    :goto_1
    return-void

    .line 332
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$600(Lcom/disney/id/android/ImprovedDIDSessionManager;)V

    .line 333
    invoke-static {}, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;->getDefaultError()Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;

    move-result-object v7

    .restart local v7    # "failure":Lcom/disney/id/android/DIDSessionManagerFailure;
    goto :goto_0

    .line 344
    .end local v7    # "failure":Lcom/disney/id/android/DIDSessionManagerFailure;
    :cond_1
    invoke-virtual {v10}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->hasData()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 345
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$400(Lcom/disney/id/android/ImprovedDIDSessionManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->val$actionCode:Ljava/lang/String;

    iget-wide v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->val$serviceCallStartTime:J

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZ)V

    .line 346
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0, v10}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$500(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V

    goto :goto_1

    .line 350
    :cond_2
    invoke-virtual {v10}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getError()Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;

    move-result-object v8

    .line 351
    .local v8, "guestControllerError":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$400(Lcom/disney/id/android/ImprovedDIDSessionManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->val$actionCode:Ljava/lang/String;

    iget-wide v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->val$serviceCallStartTime:J

    invoke-virtual {v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->isSuccess()Z

    move-result v4

    invoke-virtual {v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getFormattedErrors()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->getKeyErrorCategory()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 360
    invoke-virtual {v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerError;->isCriticalError()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->isAccessTokenExpired()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->isRefreshTokenExpired()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 361
    :cond_3
    new-instance v7, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;

    const-string v0, "FAILURE_BY_DESIGN"

    const-string v1, "AUTHORIZATION_INVALID_REFRESH_TOKEN"

    invoke-direct {v7, v0, v1}, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    .restart local v7    # "failure":Lcom/disney/id/android/DIDSessionManagerFailure;
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->logout()V

    .line 370
    :goto_2
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0, v11}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$202(Lcom/disney/id/android/ImprovedDIDSessionManager;Z)Z

    .line 371
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$700(Lcom/disney/id/android/ImprovedDIDSessionManager;)Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    move-result-object v0

    invoke-interface {v0, v7}, Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;->onTokenRefreshFailure(Lcom/disney/id/android/DIDSessionManagerFailure;)V

    goto :goto_1

    .line 364
    .end local v7    # "failure":Lcom/disney/id/android/DIDSessionManagerFailure;
    :cond_4
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$600(Lcom/disney/id/android/ImprovedDIDSessionManager;)V

    .line 366
    iget-object v9, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    .line 367
    .local v9, "networkResponse":Lcom/disney/id/android/volley/NetworkResponse;
    new-instance v7, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;

    iget v0, v9, Lcom/disney/id/android/volley/NetworkResponse;->statusCode:I

    iget-object v1, v9, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v9}, Lcom/disney/id/android/improvedguestcontroller/DIDNetworkResponseUtils;->getJSONObjectFromResponseSilently(Lcom/disney/id/android/volley/NetworkResponse;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v7, v0, v1, v2}, Lcom/disney/id/android/DIDSessionManagerRecoverableFailure;-><init>(ILjava/util/Map;Lorg/json/JSONObject;)V

    .restart local v7    # "failure":Lcom/disney/id/android/DIDSessionManagerFailure;
    goto :goto_2
.end method
