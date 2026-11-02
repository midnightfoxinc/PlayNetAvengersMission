.class Lcom/disney/id/android/ImprovedDIDSessionManager$6;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;->refreshToken(Ljava/lang/String;)V
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

.field final synthetic val$actionCode:Ljava/lang/String;

.field final synthetic val$serviceCallStartTime:J


# direct methods
.method constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Ljava/lang/String;J)V
    .locals 1

    .prologue
    .line 311
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$6;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    iput-object p2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$6;->val$actionCode:Ljava/lang/String;

    iput-wide p3, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$6;->val$serviceCallStartTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V
    .locals 5
    .param p1, "response"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    .prologue
    .line 316
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$6;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$400(Lcom/disney/id/android/ImprovedDIDSessionManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$6;->val$actionCode:Ljava/lang/String;

    iget-wide v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$6;->val$serviceCallStartTime:J

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd(Ljava/lang/String;JZ)V

    .line 317
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager$6;->this$0:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-static {v0, p1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$500(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V

    .line 318
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 311
    check-cast p1, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/ImprovedDIDSessionManager$6;->onResponse(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V

    return-void
.end method
