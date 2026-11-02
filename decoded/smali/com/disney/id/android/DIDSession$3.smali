.class Lcom/disney/id/android/DIDSession$3;
.super Ljava/lang/Object;
.source "DIDSession.java"

# interfaces
.implements Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDSession;->getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/DIDSession$RequestSuccess;Lcom/disney/id/android/DIDSession$RequestFailure;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
        "<",
        "Lcom/disney/id/android/DIDActivityStatusResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDSession;

.field final synthetic val$successAction:Lcom/disney/id/android/DIDSession$RequestSuccess;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDSession$RequestSuccess;)V
    .locals 0

    .prologue
    .line 437
    iput-object p1, p0, Lcom/disney/id/android/DIDSession$3;->this$0:Lcom/disney/id/android/DIDSession;

    iput-object p2, p0, Lcom/disney/id/android/DIDSession$3;->val$successAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/disney/id/android/DIDActivityStatusResult;)V
    .locals 3
    .param p1, "result"    # Lcom/disney/id/android/DIDActivityStatusResult;

    .prologue
    .line 440
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 441
    .local v0, "resultToReturn":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "activityCode"

    invoke-interface {p1}, Lcom/disney/id/android/DIDActivityStatusResult;->getActivityCode()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    const-string v1, "approvalStatus"

    invoke-interface {p1}, Lcom/disney/id/android/DIDActivityStatusResult;->getApprovalStatus()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    iget-object v1, p0, Lcom/disney/id/android/DIDSession$3;->val$successAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-interface {v1, v2}, Lcom/disney/id/android/DIDSession$RequestSuccess;->onSuccess(Lorg/json/JSONObject;)V

    .line 445
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 437
    check-cast p1, Lcom/disney/id/android/DIDActivityStatusResult;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession$3;->success(Lcom/disney/id/android/DIDActivityStatusResult;)V

    return-void
.end method
