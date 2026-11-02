.class Lcom/disney/id/android/DIDSession$1;
.super Ljava/lang/Object;
.source "DIDSession.java"

# interfaces
.implements Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDSession;
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
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDSession;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDSession;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/disney/id/android/DIDSession$1;->this$0:Lcom/disney/id/android/DIDSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession$1;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "ignore"    # Lorg/json/JSONObject;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/disney/id/android/DIDSession$1;->this$0:Lcom/disney/id/android/DIDSession;

    iget-object v0, v0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onLogin()V

    .line 31
    return-void
.end method
