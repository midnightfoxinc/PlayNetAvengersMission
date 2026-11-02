.class Lcom/disney/id/android/DIDTokenManager$3;
.super Ljava/lang/Object;
.source "DIDTokenManager.java"

# interfaces
.implements Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDTokenManager;->migrateFromBlueCookie(Lcom/disney/id/android/DIDRequest;)V
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
    .line 229
    iput-object p1, p0, Lcom/disney/id/android/DIDTokenManager$3;->this$0:Lcom/disney/id/android/DIDTokenManager;

    iput-object p2, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$request:Lcom/disney/id/android/DIDRequest;

    iput-object p3, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-wide p4, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$serviceCallStartTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 10
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 281
    const/4 v5, 0x0

    .line 282
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 283
    .local v6, "errorCategory":Ljava/lang/String;
    const/4 v4, 0x0

    .line 285
    .local v4, "success":Z
    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 286
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

    .line 287
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    move-object v0, p1

    .line 288
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    move-object v0, p1

    .line 289
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 290
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v6

    .line 294
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:bluecookie"

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 296
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v1

    new-instance v2, Lcom/disney/id/android/DIDResponse;

    const/16 v3, 0x21

    iget-object v7, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$request:Lcom/disney/id/android/DIDRequest;

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

    .line 299
    return-void

    .line 296
    :cond_1
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0}, Lcom/disney/id/android/DIDException;-><init>()V

    goto :goto_0
.end method

.method public onResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 11
    .param p1, "response"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    .line 233
    const/4 v5, 0x0

    .line 234
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 235
    .local v6, "errorCategory":Ljava/lang/String;
    const/4 v4, 0x1

    .line 238
    .local v4, "success":Z
    :try_start_0
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 239
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    .line 240
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v6

    .line 244
    :cond_0
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasData()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "token"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_3

    .line 247
    :try_start_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 251
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$000(Lcom/disney/id/android/DIDTokenManager;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    move-result-object v0

    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->createAuthenticatorData()Lcom/disney/id/android/localdata/DIDLocalData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setData(Lcom/disney/id/android/localdata/DIDLocalData;)V

    .line 252
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$000(Lcom/disney/id/android/DIDTokenManager;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    move-result-object v0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V

    .line 254
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/16 v2, 0x20

    iget-object v3, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$request:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 257
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getCachedLightBoxInteraction()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v8

    .line 258
    .local v8, "interaction":Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    invoke-virtual {v8}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleNativeSynchronization()V

    .line 260
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 261
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    .line 262
    const-string v0, "PPU_LEGAL"

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getKeyError()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "PPU_MARKETING"

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getKeyError()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 264
    :cond_1
    new-instance v9, Lcom/disney/id/android/DIDRequest;

    const/16 v0, 0x204

    invoke-static {p1}, Lcom/disney/id/android/DIDTokenManager;->access$200(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, v0, v1}, Lcom/disney/id/android/DIDRequest;-><init>(ILjava/lang/String;)V

    .line 265
    .local v9, "ppuReq":Lcom/disney/id/android/DIDRequest;
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0, v9}, Lcom/disney/id/android/DIDTokenManager;->access$300(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 275
    .end local v8    # "interaction":Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    .end local v9    # "ppuReq":Lcom/disney/id/android/DIDRequest;
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:bluecookie"

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 277
    return-void

    .line 269
    :cond_3
    :try_start_3
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v7, Lcom/disney/id/android/DIDException;

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getKeyError()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/String;)V

    .line 271
    .local v7, "exception":Lcom/disney/id/android/DIDException;
    :goto_2
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->this$0:Lcom/disney/id/android/DIDTokenManager;

    invoke-static {v0}, Lcom/disney/id/android/DIDTokenManager;->access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/16 v2, 0x21

    iget-object v3, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$request:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v1, v2, v3, v7}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 275
    .end local v7    # "exception":Lcom/disney/id/android/DIDException;
    :catchall_0
    move-exception v0

    move-object v10, v0

    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:bluecookie"

    iget-wide v2, p0, Lcom/disney/id/android/DIDTokenManager$3;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    throw v10

    .line 269
    :cond_4
    :try_start_4
    new-instance v7, Lcom/disney/id/android/DIDException;

    invoke-direct {v7}, Lcom/disney/id/android/DIDException;-><init>()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 248
    :catch_0
    move-exception v0

    goto/16 :goto_0
.end method
