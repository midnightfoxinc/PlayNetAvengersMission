.class Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;
.super Ljava/lang/Object;
.source "DIDSocialRegistrationActivity.java"

# interfaces
.implements Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->loginSocial()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

.field final synthetic val$serviceCallStartTime:J

.field final synthetic val$stateManager:Lcom/disney/id/android/DIDStateManager;


# direct methods
.method constructor <init>(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/DIDStateManager;J)V
    .locals 1

    .prologue
    .line 197
    iput-object p1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    iput-object p2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-wide p3, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$serviceCallStartTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 10
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 292
    const-string v2, "PRELOAD_INFO"

    const-string v3, "about to handle onErrorResponse() callback for call to GuestController\'s loginSocial()"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    const/4 v7, 0x0

    .line 294
    .local v7, "errorCodes":Ljava/lang/String;
    const/4 v8, 0x0

    .line 295
    .local v8, "errorCategory":Ljava/lang/String;
    const/4 v6, 0x0

    .line 298
    .local v6, "success":Z
    if-eqz p1, :cond_1

    :try_start_0
    instance-of v2, p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    if-eqz v2, :cond_1

    .line 300
    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v2

    if-eqz v2, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 301
    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v7

    .line 302
    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v6

    .line 303
    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 304
    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v8

    .line 307
    :cond_0
    const-string v2, "PRELOAD_INFO"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The social login error\'s key category: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    iget-object v3, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getRaw()Lorg/json/JSONObject;

    move-result-object v4

    move-object v0, p1

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getStatusCode()I

    move-result v2

    check-cast p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    .end local p1    # "error":Lcom/disney/id/android/volley/VolleyError;
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v5

    invoke-virtual {v5}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getHeaders()Ljava/util/Map;

    move-result-object v5

    invoke-static {v3, v4, v2, v5}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$700(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lorg/json/JSONObject;ILjava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 319
    :goto_0
    iget-object v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v3, "event:login:social:namespace"

    iget-wide v4, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v2 .. v8}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 321
    return-void

    .line 313
    .restart local p1    # "error":Lcom/disney/id/android/volley/VolleyError;
    :cond_1
    if-eqz p1, :cond_2

    :try_start_1
    iget-object v2, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    if-eqz v2, :cond_2

    .line 314
    iget-object v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    const/4 v3, 0x0

    iget-object v4, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    iget v4, v4, Lcom/disney/id/android/volley/NetworkResponse;->statusCode:I

    iget-object v5, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    iget-object v5, v5, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v2, v3, v4, v5}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$700(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lorg/json/JSONObject;ILjava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 319
    .end local p1    # "error":Lcom/disney/id/android/volley/VolleyError;
    :catchall_0
    move-exception v2

    move-object v9, v2

    iget-object v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v3, "event:login:social:namespace"

    iget-wide v4, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v2 .. v8}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    throw v9

    .line 316
    .restart local p1    # "error":Lcom/disney/id/android/volley/VolleyError;
    :cond_2
    :try_start_2
    iget-object v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    const/4 v3, 0x0

    const/16 v4, 0x190

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$700(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lorg/json/JSONObject;ILjava/util/Map;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public onResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 15
    .param p1, "response"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    .line 200
    const-string v0, "PRELOAD_INFO"

    const-string v1, "about to handle onResponse() callback for call to GuestController\'s loginSocial()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getCachedLightBoxInteraction()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v10

    .line 202
    .local v10, "lightBoxInteraction":Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    const/4 v5, 0x0

    .line 203
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 204
    .local v6, "errorCategory":Ljava/lang/String;
    const/4 v4, 0x1

    .line 207
    .local v4, "success":Z
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    .line 209
    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    .line 210
    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v6

    .line 213
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasData()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    .line 217
    :try_start_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 221
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$400(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    move-result-object v0

    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->createAuthenticatorData()Lcom/disney/id/android/localdata/DIDLocalData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setData(Lcom/disney/id/android/localdata/DIDLocalData;)V

    .line 222
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$400(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    move-result-object v0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V

    .line 223
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v3}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-static {v0, v1}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$300(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lcom/disney/id/android/DIDResponse;)V

    .line 224
    invoke-virtual {v10}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleSocialSynchronization()V

    .line 226
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    .line 228
    :try_start_3
    new-instance v13, Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v13, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 229
    .local v13, "requestData":Lorg/json/JSONObject;
    const-string v0, "marketing"

    invoke-static {v13, v0}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 231
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 232
    .local v11, "marketing":Lorg/json/JSONObject;
    const-string v0, "marketing"

    const-string v1, "marketing"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 233
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->setResult(ILandroid/content/Intent;)V

    .line 234
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0, v11}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$500(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lorg/json/JSONObject;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 286
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:social:namespace"

    iget-wide v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 288
    .end local v11    # "marketing":Lorg/json/JSONObject;
    .end local v13    # "requestData":Lorg/json/JSONObject;
    :goto_1
    return-void

    .line 237
    :catch_0
    move-exception v0

    .line 286
    :cond_1
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:social:namespace"

    iget-wide v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 242
    :cond_2
    :try_start_4
    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->hasErrors()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 243
    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    .line 244
    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getErrors()Ljava/util/ArrayList;

    move-result-object v8

    .line 245
    .local v8, "errors":Ljava/util/List;, "Ljava/util/List<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    const/4 v12, 0x1

    .line 246
    .local v12, "ppuMarketingOnly":Z
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;

    .line 247
    .local v7, "error":Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;
    invoke-virtual {v7}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->hasCode()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v7}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->getCode()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PPU_MARKETING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v0

    if-nez v0, :cond_3

    .line 249
    :cond_4
    const/4 v12, 0x0

    .line 254
    .end local v7    # "error":Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;
    :cond_5
    if-eqz v12, :cond_6

    .line 257
    :try_start_5
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_5
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 261
    :goto_2
    :try_start_6
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$400(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    move-result-object v0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V

    .line 262
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$600(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v3}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 265
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result v0

    if-nez v0, :cond_6

    .line 268
    :try_start_7
    new-instance v13, Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$200(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v13, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 269
    .restart local v13    # "requestData":Lorg/json/JSONObject;
    const-string v0, "marketing"

    invoke-static {v13, v0}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 271
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 272
    .restart local v11    # "marketing":Lorg/json/JSONObject;
    const-string v0, "marketing"

    const-string v1, "marketing"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 273
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-virtual {v2}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->setResult(ILandroid/content/Intent;)V

    .line 274
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0, v11}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$500(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lorg/json/JSONObject;)V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 286
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:social:namespace"

    iget-wide v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 277
    .end local v11    # "marketing":Lorg/json/JSONObject;
    .end local v13    # "requestData":Lorg/json/JSONObject;
    :catch_1
    move-exception v0

    .line 284
    .end local v8    # "errors":Ljava/util/List;, "Ljava/util/List<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v12    # "ppuMarketingOnly":Z
    :cond_6
    :try_start_8
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getRaw()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getStatusCode()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getHeaders()Ljava/util/Map;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$700(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;Lorg/json/JSONObject;ILjava/util/Map;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 286
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:social:namespace"

    iget-wide v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    move-object v14, v0

    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:social:namespace"

    iget-wide v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$2;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    throw v14

    .line 258
    .restart local v8    # "errors":Ljava/util/List;, "Ljava/util/List<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    .restart local v9    # "i$":Ljava/util/Iterator;
    .restart local v12    # "ppuMarketingOnly":Z
    :catch_2
    move-exception v0

    goto/16 :goto_2

    .line 218
    .end local v8    # "errors":Ljava/util/List;, "Ljava/util/List<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v12    # "ppuMarketingOnly":Z
    :catch_3
    move-exception v0

    goto/16 :goto_0
.end method
