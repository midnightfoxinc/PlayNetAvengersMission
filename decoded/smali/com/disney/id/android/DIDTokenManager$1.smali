.class Lcom/disney/id/android/DIDTokenManager$1;
.super Ljava/lang/Object;
.source "DIDTokenManager.java"

# interfaces
.implements Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDTokenManager;->tokenRefresh(Lcom/disney/id/android/DIDRequest;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDTokenManager;

.field final synthetic val$actionName:Ljava/lang/String;

.field final synthetic val$request:Lcom/disney/id/android/DIDRequest;

.field final synthetic val$serviceCallStartTime:J

.field final synthetic val$stateManager:Lcom/disney/id/android/DIDStateManager;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;J)V
    .locals 1

    .prologue
    .line 72
    iput-object p1, p0, Lcom/disney/id/android/DIDTokenManager$1;->this$0:Lcom/disney/id/android/DIDTokenManager;

    iput-object p2, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$request:Lcom/disney/id/android/DIDRequest;

    iput-object p3, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-object p4, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$actionName:Ljava/lang/String;

    iput-wide p5, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$serviceCallStartTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 11
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 112
    const/4 v5, 0x0

    .line 113
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 114
    .local v6, "errorCategory":Ljava/lang/String;
    const/4 v4, 0x0

    .line 116
    .local v4, "success":Z
    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 117
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 118
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    move-object v0, p1

    .line 119
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    move-object v0, p1

    .line 120
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 121
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v6

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iget-object v1, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$actionName:Ljava/lang/String;

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v1

    new-instance v2, Lcom/disney/id/android/DIDResponse;

    const/16 v3, 0x13

    iget-object v8, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$request:Lcom/disney/id/android/DIDRequest;

    if-eqz p1, :cond_3

    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-virtual {p1}, Lcom/disney/id/android/volley/VolleyError;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1}, Lcom/disney/id/android/volley/VolleyError;->getCause()Ljava/lang/Throwable;

    move-result-object v10

    invoke-direct {v0, v9, v10}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    invoke-direct {v2, v3, v8, v0}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    invoke-virtual {v1, v2}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 130
    if-eqz p1, :cond_2

    instance-of v0, p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 131
    check-cast p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    .end local p1    # "error":Lcom/disney/id/android/volley/VolleyError;
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v7

    .line 133
    .local v7, "response":Lcom/disney/id/android/guestcontroller/GuestControllerResponse;
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->secondsUntilTokenExpiration()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    invoke-virtual {v7}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0x190

    if-ne v0, v1, :cond_2

    invoke-virtual {v7}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getKeyError()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AUTHORIZATION_UNEXPECTED_ERROR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v7}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getKeyError()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AUTHORIZATION_INVALID_REFRESH_TOKEN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v7}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getKeyError()Ljava/lang/String;

    move-result-object v0

    const-string v1, "S2_COOKIE_GENERATION_ERROR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 137
    :cond_1
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->this$0:Lcom/disney/id/android/DIDTokenManager;

    new-instance v1, Lcom/disney/id/android/DIDRequest;

    const/16 v2, 0x200

    invoke-direct {v1, v2}, Lcom/disney/id/android/DIDRequest;-><init>(I)V

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDTokenManager;->access$400(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;)V

    .line 140
    .end local v7    # "response":Lcom/disney/id/android/guestcontroller/GuestControllerResponse;
    :cond_2
    return-void

    .line 127
    .restart local p1    # "error":Lcom/disney/id/android/volley/VolleyError;
    :cond_3
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0}, Lcom/disney/id/android/DIDException;-><init>()V

    goto :goto_0
.end method

.method public onResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 10
    .param p1, "response"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    const/4 v4, 0x1

    .line 76
    const/4 v5, 0x0

    .line 77
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 80
    .local v6, "errorCategory":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    .line 82
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v6

    .line 86
    :cond_0
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasData()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "token"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    .line 89
    :try_start_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$000(Lcom/disney/id/android/DIDTokenManager;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    move-result-object v0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$request:Lcom/disney/id/android/DIDRequest;

    const/16 v1, 0x202

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDRequest;->setRequestCode(I)V

    .line 96
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/16 v2, 0x12

    iget-object v3, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$request:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 97
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->hasKeyCategory()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ACTIONABLE_INPUT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 98
    new-instance v8, Lcom/disney/id/android/DIDRequest;

    const/16 v0, 0x204

    invoke-static {p1}, Lcom/disney/id/android/DIDTokenManager;->access$200(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v0, v1}, Lcom/disney/id/android/DIDRequest;-><init>(ILjava/lang/String;)V

    .line 99
    .local v8, "ppuReq":Lcom/disney/id/android/DIDRequest;
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0, v8}, Lcom/disney/id/android/DIDTokenManager;->access$300(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    .end local v8    # "ppuReq":Lcom/disney/id/android/DIDRequest;
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iget-object v1, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$actionName:Ljava/lang/String;

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 108
    return-void

    .line 102
    :cond_2
    :try_start_3
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v7, Lcom/disney/id/android/DIDException;

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getKeyError()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/String;)V

    .line 103
    .local v7, "exception":Lcom/disney/id/android/DIDException;
    :goto_2
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/16 v2, 0x13

    iget-object v3, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$request:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v1, v2, v3, v7}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 106
    .end local v7    # "exception":Lcom/disney/id/android/DIDException;
    :catchall_0
    move-exception v0

    move-object v9, v0

    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iget-object v1, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$actionName:Ljava/lang/String;

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$1;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    throw v9

    .line 102
    :cond_3
    :try_start_4
    new-instance v7, Lcom/disney/id/android/DIDException;

    invoke-direct {v7}, Lcom/disney/id/android/DIDException;-><init>()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 90
    :catch_0
    move-exception v0

    goto/16 :goto_0
.end method
