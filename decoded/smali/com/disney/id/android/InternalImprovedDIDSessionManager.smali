.class public Lcom/disney/id/android/InternalImprovedDIDSessionManager;
.super Ljava/lang/Object;
.source "InternalImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/IDIDSessionManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/InternalImprovedDIDSessionManager$InternalImprovedDIDSessionManagerLoader;
    }
.end annotation


# instance fields
.field private loginEventNotificationHandler:Landroid/os/Handler;

.field private oneShotLoginSuccessAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->loginEventNotificationHandler:Landroid/os/Handler;

    .line 83
    return-void
.end method

.method synthetic constructor <init>(Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/disney/id/android/InternalImprovedDIDSessionManager;)Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->oneShotLoginSuccessAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    return-object v0
.end method

.method static synthetic access$102(Lcom/disney/id/android/InternalImprovedDIDSessionManager;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/InternalImprovedDIDSessionManager;
    .param p1, "x1"    # Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    .prologue
    .line 13
    iput-object p1, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->oneShotLoginSuccessAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    return-object p1
.end method

.method public static sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-static {}, Lcom/disney/id/android/InternalImprovedDIDSessionManager$InternalImprovedDIDSessionManagerLoader;->access$000()Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v0

    .line 25
    .local v0, "instance":Lcom/disney/id/android/InternalImprovedDIDSessionManager;
    invoke-static {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/ImprovedDIDSessionManager;

    move-result-object v1

    iput-object v1, v0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;

    .line 27
    return-object v0
.end method


# virtual methods
.method public finalizeLogin()V
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->finalizeLogin()V

    .line 62
    return-void
.end method

.method public fireOneShotLoginSuccessAction()V
    .locals 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->loginEventNotificationHandler:Landroid/os/Handler;

    new-instance v1, Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;

    invoke-direct {v1, p0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager$1;-><init>(Lcom/disney/id/android/InternalImprovedDIDSessionManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 79
    return-void
.end method

.method public forceTokenRefresh()V
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->forceTokenRefresh()V

    .line 48
    return-void
.end method

.method public getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
    .locals 1
    .param p1, "activityCode"    # Ljava/lang/String;
    .param p3, "failureAction"    # Lcom/disney/id/android/IDIDSessionManager$RequestFailure;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
            "<",
            "Lcom/disney/id/android/DIDActivityStatusResult;",
            ">;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestFailure;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p2, "successAction":Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;, "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess<Lcom/disney/id/android/DIDActivityStatusResult;>;"
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/id/android/ImprovedDIDSessionManager;->getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V

    .line 53
    return-void
.end method

.method public loginWithBlueCookie(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
    .locals 1
    .param p1, "blueCookie"    # Ljava/lang/String;
    .param p2    # Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "failureAction"    # Lcom/disney/id/android/IDIDSessionManager$RequestFailure;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
            "<",
            "Lcom/disney/id/android/AdditionalAction;",
            ">;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestFailure;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p2, "successAction":Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;, "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess<Lcom/disney/id/android/AdditionalAction;>;"
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/id/android/ImprovedDIDSessionManager;->loginWithBlueCookie(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V

    .line 43
    return-void
.end method

.method public logout()V
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->logout()V

    .line 58
    return-void
.end method

.method public scheduleInitialRefreshForLoggedInGuest()V
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->scheduleInitialRefreshForLoggedInGuest()V

    .line 38
    return-void
.end method

.method public setDelegate(Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;)V
    .locals 1
    .param p1, "delegate"    # Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->proxySessionManager:Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->setDelegate(Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;)V

    .line 33
    return-void
.end method

.method setOneShotLoginSuccessAction(Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
            "<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p1, "oneShotLoginSuccessAction":Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;, "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess<Lorg/json/JSONObject;>;"
    iput-object p1, p0, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->oneShotLoginSuccessAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    .line 66
    return-void
.end method
