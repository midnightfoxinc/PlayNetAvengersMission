.class Lcom/disney/id/android/DIDTokenManager$2;
.super Ljava/lang/Object;
.source "DIDTokenManager.java"

# interfaces
.implements Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDTokenManager;->refreshGuestData(Lcom/disney/id/android/DIDRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDTokenManager;

.field final synthetic val$request:Lcom/disney/id/android/DIDRequest;

.field final synthetic val$serviceCallStartTime:J

.field final synthetic val$stateManager:Lcom/disney/id/android/DIDStateManager;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDStateManager;J)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lcom/disney/id/android/DIDTokenManager$2;->this$0:Lcom/disney/id/android/DIDTokenManager;

    iput-object p2, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$request:Lcom/disney/id/android/DIDRequest;

    iput-object p3, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-wide p4, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$serviceCallStartTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 10
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 198
    const/4 v5, 0x0

    .line 199
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 200
    .local v6, "errorCategory":Ljava/lang/String;
    const/4 v4, 0x0

    .line 202
    .local v4, "success":Z
    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 203
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

    .line 204
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    move-object v0, p1

    .line 205
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    move-object v0, p1

    .line 206
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 207
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v6

    .line 211
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:guest:refresh"

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 213
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$2;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v1

    new-instance v2, Lcom/disney/id/android/DIDResponse;

    const/16 v3, 0x19

    iget-object v7, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$request:Lcom/disney/id/android/DIDRequest;

    if-eqz p1, :cond_1

    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-virtual {p1}, Lcom/disney/id/android/volley/VolleyError;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1}, Lcom/disney/id/android/volley/VolleyError;->getCause()Ljava/lang/Throwable;

    move-result-object v9

    invoke-direct {v0, v8, v9}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    invoke-direct {v2, v3, v7, v0}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    invoke-virtual {v1, v2}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 216
    return-void

    .line 213
    :cond_1
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0}, Lcom/disney/id/android/DIDException;-><init>()V

    goto :goto_0
.end method

.method public onResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 8
    .param p1, "response"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    .line 166
    const/4 v5, 0x0

    .line 167
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 168
    .local v6, "errorCategory":Ljava/lang/String;
    const/4 v4, 0x1

    .line 172
    .local v4, "success":Z
    :try_start_0
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 173
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    .line 174
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    .line 175
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 176
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v6

    .line 179
    :cond_0
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasData()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 181
    :try_start_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 185
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$2;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$000(Lcom/disney/id/android/DIDTokenManager;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    move-result-object v0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V

    .line 187
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$2;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/16 v2, 0x18

    iget-object v3, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$request:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 191
    :cond_1
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:guest:refresh"

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 193
    return-void

    .line 191
    :catchall_0
    move-exception v0

    move-object v7, v0

    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:guest:refresh"

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    throw v7

    .line 182
    :catch_0
    move-exception v0

    goto :goto_0
.end method
