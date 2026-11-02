.class public Lcom/disney/id/android/ImprovedDIDSessionManager;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/IDIDSessionManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/ImprovedDIDSessionManager$ImprovedDIDSessionManagerLoader;
    }
.end annotation


# static fields
.field private static final CONTINUOUS_VALID_ACCESS_TOKEN_BUFFER_PERCENTAGE:D = 0.9

.field private static final GUEST_CONTROLLER_REQUEST_TRACKING_TAG:Ljava/lang/String; = "com.disney.id.android.improvedguestcontroller.GUEST_CONTROLLER_REQUEST_TRACKING_TAG"

.field private static final NULL_DELEGATE:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

.field private static final TAG:Ljava/lang/String;

.field private static final TOKEN_REFRESH_TIME_UNIT:Ljava/util/concurrent/TimeUnit;


# instance fields
.field private context:Landroid/content/Context;

.field private delegate:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

.field private guestController:Lcom/disney/id/android/improvedguestcontroller/IGuestController;

.field private volatile isRunningRequest:Z

.field private mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

.field private nextTokenRefreshTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private tokenRefreshExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field private tokenRefreshRunnable:Ljava/lang/Runnable;

.field private wasInitialized:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/disney/id/android/ImprovedDIDSessionManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    .line 39
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sput-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->TOKEN_REFRESH_TIME_UNIT:Ljava/util/concurrent/TimeUnit;

    .line 480
    new-instance v0, Lcom/disney/id/android/ImprovedDIDSessionManager$8;

    invoke-direct {v0}, Lcom/disney/id/android/ImprovedDIDSessionManager$8;-><init>()V

    sput-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->NULL_DELEGATE:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 470
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->NULL_DELEGATE:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    iput-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->delegate:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    .line 51
    new-instance v0, Lcom/disney/id/android/ImprovedDIDSessionManager$1;

    invoke-direct {v0, p0}, Lcom/disney/id/android/ImprovedDIDSessionManager$1;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager;)V

    iput-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->tokenRefreshRunnable:Ljava/lang/Runnable;

    .line 471
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->tokenRefreshExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 472
    iput-boolean v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->isRunningRequest:Z

    .line 473
    iput-boolean v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->wasInitialized:Z

    .line 474
    return-void
.end method

.method synthetic constructor <init>(Lcom/disney/id/android/ImprovedDIDSessionManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disney/id/android/ImprovedDIDSessionManager$1;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/ImprovedDIDSessionManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/ImprovedDIDSessionManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->refreshToken(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(Lcom/disney/id/android/ImprovedDIDSessionManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/ImprovedDIDSessionManager;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->isRunningRequest:Z

    return p1
.end method

.method static synthetic access$300(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/ImprovedDIDSessionManager;
    .param p1, "x1"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;
    .param p2, "x2"    # Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Lcom/disney/id/android/ImprovedDIDSessionManager;->handleSuccessfulBlueCookieLogin(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V

    return-void
.end method

.method static synthetic access$400(Lcom/disney/id/android/ImprovedDIDSessionManager;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/ImprovedDIDSessionManager;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/ImprovedDIDSessionManager;
    .param p1, "x1"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->handleSuccessfulTokenRefresh(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V

    return-void
.end method

.method static synthetic access$600(Lcom/disney/id/android/ImprovedDIDSessionManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/ImprovedDIDSessionManager;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->scheduleNextTokenRefreshBasedOnNetworkState()V

    return-void
.end method

.method static synthetic access$700(Lcom/disney/id/android/ImprovedDIDSessionManager;)Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/ImprovedDIDSessionManager;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->delegate:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    return-object v0
.end method

.method static synthetic access$900()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private static getGuestControllerBaseGuestURL()Landroid/net/Uri$Builder;
    .locals 2

    .prologue
    .line 463
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "guest"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static getGuestControllerSiteConfigurationURL()Landroid/net/Uri$Builder;
    .locals 2

    .prologue
    .line 467
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "configuration"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "site"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    return-object v0
.end method

.method private handleSuccessfulBlueCookieLogin(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V
    .locals 6
    .param p1, "response"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;
    .param p2    # Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
            "<",
            "Lcom/disney/id/android/AdditionalAction;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 176
    .local p2, "successAction":Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;, "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess<Lcom/disney/id/android/AdditionalAction;>;"
    const/4 v1, 0x0

    .line 178
    .local v1, "copyOfRawResponse":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getRawResponse()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "copyOfRawResponse":Lorg/json/JSONObject;
    .local v2, "copyOfRawResponse":Lorg/json/JSONObject;
    move-object v1, v2

    .line 184
    .end local v2    # "copyOfRawResponse":Lorg/json/JSONObject;
    .restart local v1    # "copyOfRawResponse":Lorg/json/JSONObject;
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_1 .. :try_end_1} :catch_1

    .line 188
    :goto_1
    iget-object v4, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V

    .line 190
    invoke-virtual {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->finalizeLogin()V

    .line 192
    invoke-virtual {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->synchronizeLightBox()V

    .line 194
    const/4 v0, 0x0

    .line 195
    .local v0, "additionalAction":Lcom/disney/id/android/AdditionalAction;
    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->hasError()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 196
    new-instance v0, Lcom/disney/id/android/AdditionalAction;

    .end local v0    # "additionalAction":Lcom/disney/id/android/AdditionalAction;
    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getStatusCode()I

    move-result v4

    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getHeaders()Ljava/util/Map;

    move-result-object v5

    invoke-direct {v0, v4, v5, v1}, Lcom/disney/id/android/AdditionalAction;-><init>(ILjava/util/Map;Lorg/json/JSONObject;)V

    .line 199
    .restart local v0    # "additionalAction":Lcom/disney/id/android/AdditionalAction;
    :cond_0
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->isRunningRequest:Z

    .line 200
    invoke-interface {p2, v0}, Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;->success(Ljava/lang/Object;)V

    .line 201
    return-void

    .line 179
    .end local v0    # "additionalAction":Lcom/disney/id/android/AdditionalAction;
    :catch_0
    move-exception v3

    .line 180
    .local v3, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    const-string v5, "Something went wrong copying the raw response data when handling a successful token refresh"

    invoke-static {v4, v5}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 185
    .end local v3    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v3

    .line 186
    .local v3, "e":Lcom/disney/id/android/DIDGuest$GuestException;
    sget-object v4, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Something went wrong forcing an update of the guest\'s token data."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private handleSuccessfulTokenRefresh(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;)V
    .locals 6
    .param p1, "response"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    .prologue
    .line 402
    const/4 v1, 0x0

    .line 404
    .local v1, "copyOfRawResponse":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getRawResponse()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "copyOfRawResponse":Lorg/json/JSONObject;
    .local v2, "copyOfRawResponse":Lorg/json/JSONObject;
    move-object v1, v2

    .line 410
    .end local v2    # "copyOfRawResponse":Lorg/json/JSONObject;
    .restart local v1    # "copyOfRawResponse":Lorg/json/JSONObject;
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getData()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_1 .. :try_end_1} :catch_1

    .line 414
    :goto_1
    iget-object v4, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V

    .line 416
    invoke-direct {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->scheduleNextTokenRefreshWithProtectiveDelay()V

    .line 418
    const/4 v0, 0x0

    .line 419
    .local v0, "additionalAction":Lcom/disney/id/android/AdditionalAction;
    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->hasError()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 420
    new-instance v0, Lcom/disney/id/android/AdditionalAction;

    .end local v0    # "additionalAction":Lcom/disney/id/android/AdditionalAction;
    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getStatusCode()I

    move-result v4

    invoke-virtual {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;->getHeaders()Ljava/util/Map;

    move-result-object v5

    invoke-direct {v0, v4, v5, v1}, Lcom/disney/id/android/AdditionalAction;-><init>(ILjava/util/Map;Lorg/json/JSONObject;)V

    .line 423
    .restart local v0    # "additionalAction":Lcom/disney/id/android/AdditionalAction;
    :cond_0
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->isRunningRequest:Z

    .line 424
    iget-object v4, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->delegate:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    invoke-interface {v4, v0}, Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;->onTokenRefreshSuccess(Lcom/disney/id/android/AdditionalAction;)V

    .line 425
    return-void

    .line 405
    .end local v0    # "additionalAction":Lcom/disney/id/android/AdditionalAction;
    :catch_0
    move-exception v3

    .line 406
    .local v3, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    const-string v5, "Something went wrong copying the raw response data when handling a successful token refresh"

    invoke-static {v4, v5}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 411
    .end local v3    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v3

    .line 412
    .local v3, "e":Lcom/disney/id/android/DIDGuest$GuestException;
    sget-object v4, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Something went wrong forcing an update of the guest\'s token data."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private refreshToken(Ljava/lang/String;)V
    .locals 12
    .param p1, "actionCode"    # Ljava/lang/String;

    .prologue
    .line 293
    iget-boolean v8, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->isRunningRequest:Z

    if-eqz v8, :cond_0

    .line 294
    sget-object v8, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    invoke-static {v8}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "Couldn\'t refresh the token because a request is currently running."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    :goto_0
    return-void

    .line 298
    :cond_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v8

    invoke-virtual {v8}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v6

    .line 299
    .local v6, "token":Lcom/disney/id/android/DIDToken;
    invoke-virtual {v6}, Lcom/disney/id/android/DIDToken;->hasRefreshToken()Z

    move-result v8

    if-nez v8, :cond_1

    invoke-virtual {v6}, Lcom/disney/id/android/DIDToken;->hasBlueCookie()Z

    move-result v8

    if-nez v8, :cond_1

    .line 300
    invoke-virtual {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->logout()V

    .line 301
    iget-object v8, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->delegate:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    new-instance v9, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;

    const-string v10, "FAILURE_BY_DESIGN"

    const-string v11, "AUTHORIZATION_INVALID_REFRESH_TOKEN"

    invoke-direct {v9, v10, v11}, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v9}, Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;->onTokenRefreshFailure(Lcom/disney/id/android/DIDSessionManagerFailure;)V

    goto :goto_0

    .line 305
    :cond_1
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->isRunningRequest:Z

    .line 307
    iget-object v8, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->context:Landroid/content/Context;

    invoke-static {v8}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v4

    .line 308
    .local v4, "stateManager":Lcom/disney/id/android/DIDStateManager;
    invoke-virtual {v4}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart()V

    .line 309
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 311
    .local v2, "serviceCallStartTime":J
    new-instance v5, Lcom/disney/id/android/ImprovedDIDSessionManager$6;

    invoke-direct {v5, p0, p1, v2, v3}, Lcom/disney/id/android/ImprovedDIDSessionManager$6;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Ljava/lang/String;J)V

    .line 321
    .local v5, "success":Lcom/disney/id/android/volley/Response$Listener;, "Lcom/disney/id/android/volley/Response$Listener<Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;>;"
    new-instance v0, Lcom/disney/id/android/ImprovedDIDSessionManager$7;

    invoke-direct {v0, p0, p1, v2, v3}, Lcom/disney/id/android/ImprovedDIDSessionManager$7;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Ljava/lang/String;J)V

    .line 375
    .local v0, "failure":Lcom/disney/id/android/volley/Response$ErrorListener;
    invoke-static {}, Lcom/disney/id/android/ImprovedDIDSessionManager;->getGuestControllerBaseGuestURL()Landroid/net/Uri$Builder;

    move-result-object v7

    .line 376
    .local v7, "url":Landroid/net/Uri$Builder;
    invoke-virtual {v6}, Lcom/disney/id/android/DIDToken;->hasRefreshToken()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 377
    const-string v8, "refresh-auth"

    invoke-virtual {v7, v8}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    invoke-virtual {v6}, Lcom/disney/id/android/DIDToken;->getRefreshToken()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 382
    :goto_1
    new-instance v8, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    sget-object v9, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->POST:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    invoke-virtual {v7}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;-><init>(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/disney/id/android/DIDStateManager;->getCurrentSessionIds()Ljava/util/Map;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->headers(Ljava/util/Map;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->listener(Lcom/disney/id/android/volley/Response$Listener;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v8

    invoke-virtual {v8, v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->errorListener(Lcom/disney/id/android/volley/Response$ErrorListener;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->build()Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;

    move-result-object v1

    .line 388
    .local v1, "request":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;
    const-string v8, "com.disney.id.android.improvedguestcontroller.GUEST_CONTROLLER_REQUEST_TRACKING_TAG"

    invoke-virtual {v1, v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;->setTag(Ljava/lang/Object;)Lcom/disney/id/android/volley/Request;

    .line 389
    iget-object v8, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->guestController:Lcom/disney/id/android/improvedguestcontroller/IGuestController;

    invoke-interface {v8, v1}, Lcom/disney/id/android/improvedguestcontroller/IGuestController;->handleRequest(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;)V

    goto/16 :goto_0

    .line 379
    .end local v1    # "request":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;
    :cond_2
    const-string v8, "login"

    invoke-virtual {v7, v8}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    const-string v9, "blue"

    invoke-virtual {v8, v9}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1
.end method

.method private scheduleNextTokenRefresh(J)V
    .locals 3
    .param p1, "delay"    # J

    .prologue
    .line 439
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->tokenRefreshExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->tokenRefreshRunnable:Ljava/lang/Runnable;

    sget-object v2, Lcom/disney/id/android/ImprovedDIDSessionManager;->TOKEN_REFRESH_TIME_UNIT:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, p1, p2, v2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->nextTokenRefreshTask:Ljava/util/concurrent/Future;

    .line 440
    return-void
.end method

.method private scheduleNextTokenRefreshBasedOnNetworkState()V
    .locals 2

    .prologue
    .line 393
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDWebUtils;->isConnected(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 394
    invoke-direct {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->scheduleNextTokenRefreshWithProtectiveDelay()V

    .line 398
    :goto_0
    return-void

    .line 396
    :cond_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->secondsUntilRefreshTokenExpiration()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->scheduleNextTokenRefresh(J)V

    goto :goto_0
.end method

.method private scheduleNextTokenRefreshWithProtectiveDelay()V
    .locals 8

    .prologue
    .line 428
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDToken;->getSecondsUntilAccessTokenExpiration()J

    move-result-wide v0

    .line 432
    .local v0, "secondsUntilAccessTokenExpiration":J
    long-to-double v4, v0

    const-wide v6, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v4, v6

    double-to-int v3, v4

    const/16 v4, 0x1e

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 434
    .local v2, "tokenRefreshTriggerTime":I
    int-to-long v4, v2

    invoke-direct {p0, v4, v5}, Lcom/disney/id/android/ImprovedDIDSessionManager;->scheduleNextTokenRefresh(J)V

    .line 435
    return-void
.end method

.method public static sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/ImprovedDIDSessionManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 62
    invoke-static {}, Lcom/disney/id/android/ImprovedDIDSessionManager$ImprovedDIDSessionManagerLoader;->access$100()Lcom/disney/id/android/ImprovedDIDSessionManager;

    move-result-object v0

    .line 64
    .local v0, "instance":Lcom/disney/id/android/ImprovedDIDSessionManager;
    iget-object v1, v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->guestController:Lcom/disney/id/android/improvedguestcontroller/IGuestController;

    if-nez v1, :cond_0

    .line 65
    new-instance v1, Lcom/disney/id/android/improvedguestcontroller/DIDImprovedGuestController;

    invoke-direct {v1, p0}, Lcom/disney/id/android/improvedguestcontroller/DIDImprovedGuestController;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->guestController:Lcom/disney/id/android/improvedguestcontroller/IGuestController;

    .line 68
    :cond_0
    iput-object p0, v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->context:Landroid/content/Context;

    .line 69
    new-instance v1, Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-direct {v1, p0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    .line 71
    return-object v0
.end method


# virtual methods
.method finalizeLogin()V
    .locals 2

    .prologue
    .line 204
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->createAuthenticatorData()Lcom/disney/id/android/localdata/DIDLocalData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setData(Lcom/disney/id/android/localdata/DIDLocalData;)V

    .line 205
    invoke-direct {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->scheduleNextTokenRefreshWithProtectiveDelay()V

    .line 206
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->load()V

    .line 207
    return-void
.end method

.method public forceTokenRefresh()V
    .locals 2

    .prologue
    .line 213
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->isLoggedIn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 214
    sget-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    const-string v1, "Attempting to force token refresh when there\'s no guest logged in."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    :goto_0
    return-void

    .line 218
    :cond_0
    const-string v0, "event:token:refresh:force"

    invoke-direct {p0, v0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->refreshToken(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
    .locals 12
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
    .line 223
    .local p2, "successAction":Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;, "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess<Lcom/disney/id/android/DIDActivityStatusResult;>;"
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->isLoggedIn()Z

    move-result v1

    if-nez v1, :cond_0

    .line 224
    sget-object v1, Lcom/disney/id/android/ImprovedDIDSessionManager;->TAG:Ljava/lang/String;

    const-string v2, "Attempting to get activity status when there\'s no guest logged in."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    :goto_0
    return-void

    .line 229
    :cond_0
    const-string v0, "event:activity-permission"

    .line 230
    .local v0, "actionCode":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 231
    .local v4, "serviceCallStartTime":J
    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v3

    .line 233
    .local v3, "stateManager":Lcom/disney/id/android/DIDStateManager;
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 234
    .local v8, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Authorization"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "BEARER "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v6

    invoke-virtual {v6}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v6

    invoke-virtual {v6}, Lcom/disney/id/android/DIDToken;->getAccessToken()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v8, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    invoke-static {}, Lcom/disney/id/android/ImprovedDIDSessionManager;->getGuestControllerBaseGuestURL()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "activity-permission"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDToken;->getSWID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "activityCode"

    invoke-virtual {v1, v2, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v10

    .line 241
    .local v10, "url":Landroid/net/Uri$Builder;
    new-instance v1, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    sget-object v2, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->GET:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    invoke-virtual {v10}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v2, v6}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;-><init>(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->headers(Ljava/util/Map;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v11

    new-instance v1, Lcom/disney/id/android/ImprovedDIDSessionManager$5;

    move-object v2, p0

    move-object v6, p2

    move-object v7, p1

    invoke-direct/range {v1 .. v7}, Lcom/disney/id/android/ImprovedDIDSessionManager$5;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/DIDStateManager;JLcom/disney/id/android/IDIDSessionManager$RequestSuccess;Ljava/lang/String;)V

    invoke-virtual {v11, v1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->listener(Lcom/disney/id/android/volley/Response$Listener;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v7

    new-instance v1, Lcom/disney/id/android/ImprovedDIDSessionManager$4;

    move-object v2, p0

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/disney/id/android/ImprovedDIDSessionManager$4;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/DIDStateManager;JLcom/disney/id/android/IDIDSessionManager$RequestFailure;)V

    invoke-virtual {v7, v1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->errorListener(Lcom/disney/id/android/volley/Response$ErrorListener;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->build()Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;

    move-result-object v9

    .line 289
    .local v9, "request":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;
    iget-object v1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->guestController:Lcom/disney/id/android/improvedguestcontroller/IGuestController;

    invoke-interface {v1, v9}, Lcom/disney/id/android/improvedguestcontroller/IGuestController;->handleRequest(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;)V

    goto/16 :goto_0
.end method

.method public loginWithBlueCookie(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
    .locals 17
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
    .line 109
    .local p2, "successAction":Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;, "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess<Lcom/disney/id/android/AdditionalAction;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->guestController:Lcom/disney/id/android/improvedguestcontroller/IGuestController;

    const-string v4, "com.disney.id.android.improvedguestcontroller.GUEST_CONTROLLER_REQUEST_TRACKING_TAG"

    invoke-interface {v3, v4}, Lcom/disney/id/android/improvedguestcontroller/IGuestController;->cancelAll(Ljava/lang/Object;)V

    .line 111
    if-nez p1, :cond_0

    .line 112
    new-instance v3, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;

    const-string v4, "FAILURE_BY_DESIGN"

    const-string v8, "AUTHORIZATION_BLUE_COOKIE_INVALID"

    invoke-direct {v3, v4, v8}, Lcom/disney/id/android/DIDSessionManagerUnrecoverableFailure;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lcom/disney/id/android/IDIDSessionManager$RequestFailure;->failure(Lcom/disney/id/android/DIDSessionManagerFailure;)V

    .line 173
    :goto_0
    return-void

    .line 116
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v5

    .line 117
    .local v5, "stateManager":Lcom/disney/id/android/DIDStateManager;
    invoke-virtual {v5}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart()V

    .line 119
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 120
    .local v6, "serviceCallStartTime":J
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 121
    .local v2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "blueCookie"

    move-object/from16 v0, p1

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    invoke-static {}, Lcom/disney/id/android/ImprovedDIDSessionManager;->getGuestControllerBaseGuestURL()Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "login"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "blue"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v16

    .line 124
    .local v16, "url":Landroid/net/Uri$Builder;
    new-instance v3, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    sget-object v4, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->POST:Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v3, v4, v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;-><init>(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;Ljava/lang/String;)V

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v3, v4}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->requestBody(Lorg/json/JSONObject;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v3

    invoke-virtual {v5}, Lcom/disney/id/android/DIDStateManager;->getCurrentSessionIds()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->headers(Ljava/util/Map;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v9

    new-instance v3, Lcom/disney/id/android/ImprovedDIDSessionManager$3;

    move-object/from16 v4, p0

    move-object/from16 v8, p2

    invoke-direct/range {v3 .. v8}, Lcom/disney/id/android/ImprovedDIDSessionManager$3;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/DIDStateManager;JLcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V

    invoke-virtual {v9, v3}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->listener(Lcom/disney/id/android/volley/Response$Listener;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v3

    new-instance v8, Lcom/disney/id/android/ImprovedDIDSessionManager$2;

    move-object/from16 v9, p0

    move-object v10, v5

    move-object/from16 v11, p3

    move-wide v12, v6

    move-object/from16 v14, p2

    invoke-direct/range {v8 .. v14}, Lcom/disney/id/android/ImprovedDIDSessionManager$2;-><init>(Lcom/disney/id/android/ImprovedDIDSessionManager;Lcom/disney/id/android/DIDStateManager;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;JLcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V

    invoke-virtual {v3, v8}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->errorListener(Lcom/disney/id/android/volley/Response$ErrorListener;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->build()Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;

    move-result-object v15

    .line 169
    .local v15, "request":Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->isRunningRequest:Z

    .line 171
    const-string v3, "com.disney.id.android.improvedguestcontroller.GUEST_CONTROLLER_REQUEST_TRACKING_TAG"

    invoke-virtual {v15, v3}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;->setTag(Ljava/lang/Object;)Lcom/disney/id/android/volley/Request;

    .line 172
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->guestController:Lcom/disney/id/android/improvedguestcontroller/IGuestController;

    invoke-interface {v3, v15}, Lcom/disney/id/android/improvedguestcontroller/IGuestController;->handleRequest(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;)V

    goto :goto_0
.end method

.method public logout()V
    .locals 2

    .prologue
    .line 444
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->isLoggedIn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 456
    :goto_0
    return-void

    .line 448
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->nextTokenRefreshTask:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_1

    .line 449
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->nextTokenRefreshTask:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 450
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->nextTokenRefreshTask:Ljava/util/concurrent/Future;

    .line 452
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->isRunningRequest:Z

    .line 453
    iget-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {v0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->clearSessionData()V

    .line 455
    invoke-virtual {p0}, Lcom/disney/id/android/ImprovedDIDSessionManager;->synchronizeLightBox()V

    goto :goto_0
.end method

.method public scheduleInitialRefreshForLoggedInGuest()V
    .locals 6

    .prologue
    .line 90
    iget-boolean v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->wasInitialized:Z

    if-nez v2, :cond_1

    .line 91
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->wasInitialized:Z

    .line 94
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDGuest;->isLoggedIn()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDToken;->getSecondsUntilAccessTokenExpiration()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v2, v4

    double-to-long v0, v2

    .line 98
    .local v0, "timeUntilAccessTokenExpiration":J
    const-wide/16 v2, 0x1e

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    .line 99
    const-wide/16 v0, 0x0

    .line 102
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/disney/id/android/ImprovedDIDSessionManager;->scheduleNextTokenRefresh(J)V

    .line 105
    .end local v0    # "timeUntilAccessTokenExpiration":J
    :cond_1
    return-void
.end method

.method public setDelegate(Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;)V
    .locals 1
    .param p1, "delegate"    # Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    .prologue
    .line 76
    if-nez p1, :cond_0

    .line 77
    sget-object v0, Lcom/disney/id/android/ImprovedDIDSessionManager;->NULL_DELEGATE:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    iput-object v0, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->delegate:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    .line 81
    :goto_0
    return-void

    .line 79
    :cond_0
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->delegate:Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;

    goto :goto_0
.end method

.method setGuestController(Lcom/disney/id/android/improvedguestcontroller/IGuestController;)V
    .locals 0
    .param p1, "guestController"    # Lcom/disney/id/android/improvedguestcontroller/IGuestController;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 85
    iput-object p1, p0, Lcom/disney/id/android/ImprovedDIDSessionManager;->guestController:Lcom/disney/id/android/improvedguestcontroller/IGuestController;

    .line 86
    return-void
.end method

.method synchronizeLightBox()V
    .locals 0

    return-void
.end method
