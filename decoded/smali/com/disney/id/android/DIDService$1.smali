.class Lcom/disney/id/android/DIDService$1;
.super Ljava/lang/Object;
.source "DIDService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/DIDService;->scheduleLowTrust()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDService;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDService;)V
    .locals 0

    .prologue
    .line 230
    iput-object p1, p0, Lcom/disney/id/android/DIDService$1;->this$0:Lcom/disney/id/android/DIDService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 233
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->getLowTrust()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/disney/id/android/DIDService$1;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v0}, Lcom/disney/id/android/DIDService;->access$700(Lcom/disney/id/android/DIDService;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/16 v2, 0x14

    new-instance v3, Lcom/disney/id/android/DIDRequest;

    const/16 v4, 0x205

    invoke-direct {v3, v4}, Lcom/disney/id/android/DIDRequest;-><init>(I)V

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 238
    :cond_0
    return-void
.end method
