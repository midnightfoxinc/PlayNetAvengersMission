.class Lcom/disney/id/android/DIDSession$5;
.super Ljava/lang/Object;
.source "DIDSession.java"

# interfaces
.implements Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDSession;->migrateFromBlueCookie(Ljava/lang/String;Lcom/disney/id/android/DIDSession$RequestSuccess;Lcom/disney/id/android/DIDSession$RequestFailure;)V
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
        "Lcom/disney/id/android/AdditionalAction;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDSession;

.field final synthetic val$loginSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDSession$RequestSuccess;)V
    .locals 0

    .prologue
    .line 581
    iput-object p1, p0, Lcom/disney/id/android/DIDSession$5;->this$0:Lcom/disney/id/android/DIDSession;

    iput-object p2, p0, Lcom/disney/id/android/DIDSession$5;->val$loginSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/disney/id/android/AdditionalAction;)V
    .locals 2
    .param p1, "additionalAction"    # Lcom/disney/id/android/AdditionalAction;

    .prologue
    .line 584
    iget-object v0, p0, Lcom/disney/id/android/DIDSession$5;->this$0:Lcom/disney/id/android/DIDSession;

    iget-object v0, v0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onLoginBlueSuccess()V

    .line 585
    iget-object v0, p0, Lcom/disney/id/android/DIDSession$5;->val$loginSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    if-eqz v0, :cond_0

    .line 587
    iget-object v0, p0, Lcom/disney/id/android/DIDSession$5;->val$loginSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/disney/id/android/DIDSession$RequestSuccess;->onSuccess(Lorg/json/JSONObject;)V

    .line 589
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDSession$5;->this$0:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/DIDSession;->handleAdditionalAction(Lcom/disney/id/android/AdditionalAction;)V

    .line 590
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 581
    check-cast p1, Lcom/disney/id/android/AdditionalAction;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession$5;->success(Lcom/disney/id/android/AdditionalAction;)V

    return-void
.end method
