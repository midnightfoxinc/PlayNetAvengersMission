.class Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;
.super Ljava/lang/Object;
.source "DIDSocialRegistrationActivity.java"

# interfaces
.implements Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->updateGuestMarketing(Lorg/json/JSONObject;)V
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
    .line 408
    iput-object p1, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    iput-object p2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-wide p3, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->val$serviceCallStartTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 7
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 439
    const/4 v5, 0x0

    .line 440
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 441
    .local v6, "errorCategory":Ljava/lang/String;
    const/4 v4, 0x0

    .line 443
    .local v4, "success":Z
    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 444
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

    .line 445
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    move-object v0, p1

    .line 446
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    move-object v0, p1

    .line 447
    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 448
    check-cast p1, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    .end local p1    # "error":Lcom/disney/id/android/volley/VolleyError;
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;

    move-result-object v6

    .line 452
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:update:guest:marketing"

    iget-wide v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 454
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->finish()V

    .line 455
    return-void
.end method

.method public onResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 8
    .param p1, "response"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    .line 413
    const/4 v5, 0x0

    .line 414
    .local v5, "errorCodes":Ljava/lang/String;
    const/4 v6, 0x0

    .line 415
    .local v6, "errorCategory":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->isSuccess()Z

    move-result v4

    .line 418
    .local v4, "success":Z
    :try_start_0
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasData()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 419
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->hasError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 420
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getErrorCodes()Ljava/lang/String;

    move-result-object v5

    .line 421
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 422
    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getError()Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->getKeyCategory()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v6

    .line 426
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {p1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 429
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->this$0:Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-static {v0}, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;->access$400(Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    move-result-object v0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 433
    :cond_1
    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:update:guest:marketing"

    iget-wide v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    .line 435
    return-void

    .line 433
    :catchall_0
    move-exception v0

    move-object v7, v0

    iget-object v0, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:update:guest:marketing"

    iget-wide v2, p0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity$4;->val$serviceCallStartTime:J

    invoke-virtual/range {v0 .. v6}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V

    throw v7

    .line 427
    :catch_0
    move-exception v0

    goto :goto_0
.end method
