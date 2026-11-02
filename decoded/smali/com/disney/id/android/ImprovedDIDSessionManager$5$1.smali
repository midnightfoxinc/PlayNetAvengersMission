.class Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/DIDActivityStatusResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager$5;->onResponse(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/disney/id/android/ImprovedDIDSessionManager$5;

.field final synthetic val$response:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

.field final synthetic val$responseContents:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager$5;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 251
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;->this$1:Lcom/disney/id/android/ImprovedDIDSessionManager$5;

    iput-object p2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;->val$response:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    iput-object p3, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;->val$responseContents:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getActivityCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;->this$1:Lcom/disney/id/android/ImprovedDIDSessionManager$5;

    iget-object v0, v0, Lcom/disney/id/android/ImprovedDIDSessionManager$5;->val$activityCode:Ljava/lang/String;

    return-object v0
.end method

.method public getApprovalStatus()Ljava/lang/String;
    .locals 3

    .prologue
    .line 259
    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;->val$response:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    invoke-virtual {v1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->hasError()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 260
    const-string v0, "ERROR"

    .line 267
    :cond_0
    :goto_0
    return-object v0

    .line 263
    :cond_1
    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$5$1;->val$responseContents:Lorg/json/JSONObject;

    const-string v2, "approvalStatus"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 264
    .local v0, "approvalStatus":Ljava/lang/String;
    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 265
    const-string v0, "UNKNOWN"

    goto :goto_0
.end method
