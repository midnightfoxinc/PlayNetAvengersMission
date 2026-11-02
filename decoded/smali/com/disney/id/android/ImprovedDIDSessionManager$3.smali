.class Lcom/disney/id/android/ImprovedDIDSessionManager$3;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;->loginWithBlueCookie(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/disney/id/android/volley/Response$Listener",
        "<",
        "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

.field final synthetic val$serviceCallStartTime:J

.field final synthetic val$stateManager:Lcom/disney/id/android/DIDStateManager;

.field final synthetic val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;


# direct methods
.method constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/DIDStateManager;JLcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V
    .locals 1

    .prologue
    .line 128
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    iput-object p2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    iput-wide p3, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->val$serviceCallStartTime:J

    iput-object p5, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V
    .locals 5
    .param p1, "response"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    .prologue
    .line 131
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->val$stateManager:Lcom/disney/id/android/DIDStateManager;

    const-string v1, "event:login:bluecookie"

    iget-wide v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->val$serviceCallStartTime:J

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZ)V

    .line 132
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->val$successAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    invoke-static {v0, p1, v1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$300(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V

    .line 133
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 128
    check-cast p1, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/ImprovedDIDSessionManager$3;->onResponse(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V

    return-void
.end method
