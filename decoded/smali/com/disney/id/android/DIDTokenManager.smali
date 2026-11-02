.class Lcom/disney/id/android/DIDTokenManager;
.super Ljava/lang/Object;
.source "DIDTokenManager.java"

# interfaces
.implements Lcom/disney/id/android/log/DIDEventParams;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    .line 31
    new-instance v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    iget-object v1, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDTokenManager;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/DIDTokenManager;)Lcom/disney/id/android/localdata/DIDLocalDataHandler;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDTokenManager;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/id/android/DIDTokenManager;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDTokenManager;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    .line 23
    invoke-static {p0}, Lcom/disney/id/android/DIDTokenManager;->generatePPURequestData(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDTokenManager;
    .param p1, "x1"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDTokenManager;->startPPURequest(Lcom/disney/id/android/DIDRequest;)V

    return-void
.end method

.method static synthetic access$400(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDTokenManager;
    .param p1, "x1"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDTokenManager;->logout(Lcom/disney/id/android/DIDRequest;)V

    return-void
.end method

.method private static generatePPURequestData(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)Ljava/lang/String;
    .locals 4
    .param p0, "response"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    .line 304
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 306
    .local v0, "requestData":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "response"

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getRaw()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 307
    const-string v1, "status"

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getStatusCode()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 308
    const-string v1, "headers"

    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual {p0}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getHeaders()Ljava/util/Map;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 310
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 309
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private logout(Lcom/disney/id/android/DIDRequest;)V
    .locals 3
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {v0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->clearSessionData()V

    .line 57
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDResponse;

    const/4 v2, 0x4

    invoke-direct {v1, v2, p1}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 59
    return-void
.end method

.method private migrateFromBlueCookie(Lcom/disney/id/android/DIDRequest;)V
    .locals 10
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 223
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v3

    .line 224
    .local v3, "stateManager":Lcom/disney/id/android/DIDStateManager;
    invoke-virtual {v3}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart()V

    .line 225
    const-string v6, "event:login:bluecookie"

    .line 226
    .local v6, "actionName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 227
    .local v4, "serviceCallStartTime":J
    invoke-virtual {v3}, Lcom/disney/id/android/DIDStateManager;->getCurrentSessionIds()Ljava/util/Map;

    move-result-object v7

    .line 229
    .local v7, "stateHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v8, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v9

    new-instance v0, Lcom/disney/id/android/DIDTokenManager$3;

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/disney/id/android/DIDTokenManager$3;-><init>(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDStateManager;J)V

    invoke-static {v8, v9, v7, v0}, Lcom/disney/id/android/guestcontroller/GuestController;->loginBlue(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    .line 301
    return-void
.end method

.method private refreshGuestData(Lcom/disney/id/android/DIDRequest;)V
    .locals 9
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v3

    .line 157
    .local v3, "stateManager":Lcom/disney/id/android/DIDStateManager;
    invoke-virtual {v3}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart()V

    .line 158
    const-string v6, "event:guest:refresh"

    .line 159
    .local v6, "actionName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 160
    .local v4, "serviceCallStartTime":J
    invoke-virtual {v3}, Lcom/disney/id/android/DIDStateManager;->getCurrentSessionIds()Ljava/util/Map;

    move-result-object v7

    .line 162
    .local v7, "stateHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v8, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/disney/id/android/DIDTokenManager$2;

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/disney/id/android/DIDTokenManager$2;-><init>(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDStateManager;J)V

    invoke-static {v8, v7, v0}, Lcom/disney/id/android/guestcontroller/GuestController;->refreshGuestData(Landroid/content/Context;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    .line 218
    return-void
.end method

.method private startPPURequest(Lcom/disney/id/android/DIDRequest;)V
    .locals 3
    .param p1, "ppuReq"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 314
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getDoNotDisturb()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 315
    iget-object v1, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->broadcast(Landroid/content/Context;Lcom/disney/id/android/DIDRequest;)V

    .line 317
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    const-class v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 318
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.disney.id.android.REQUEST"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 319
    const v1, 0x30000004

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 320
    iget-object v1, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 324
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 322
    :cond_0
    invoke-static {p1}, Lcom/disney/id/android/DIDSessionConfig;->setCanUseSiteRequest(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0
.end method

.method private tokenRefresh(Lcom/disney/id/android/DIDRequest;Ljava/lang/String;)V
    .locals 9
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
    .param p2, "actionName"    # Ljava/lang/String;

    .prologue
    .line 67
    iget-object v1, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v4

    .line 68
    .local v4, "stateManager":Lcom/disney/id/android/DIDStateManager;
    invoke-virtual {v4}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart()V

    .line 69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 70
    .local v6, "serviceCallStartTime":J
    invoke-virtual {v4}, Lcom/disney/id/android/DIDStateManager;->getCurrentSessionIds()Ljava/util/Map;

    move-result-object v0

    .line 72
    .local v0, "stateHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v8, p0, Lcom/disney/id/android/DIDTokenManager;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/disney/id/android/DIDTokenManager$1;

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v7}, Lcom/disney/id/android/DIDTokenManager$1;-><init>(Lcom/disney/id/android/DIDTokenManager;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;J)V

    invoke-static {v8, v0, v1}, Lcom/disney/id/android/guestcontroller/GuestController;->forceTokenRefresh(Landroid/content/Context;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V

    .line 142
    return-void
.end method


# virtual methods
.method handleRequest(Lcom/disney/id/android/DIDRequest;)V
    .locals 1
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 35
    invoke-virtual {p1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 52
    :goto_0
    :pswitch_0
    return-void

    .line 37
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDTokenManager;->logout(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0

    .line 40
    :pswitch_2
    const-string v0, "event:token:refresh"

    invoke-direct {p0, p1, v0}, Lcom/disney/id/android/DIDTokenManager;->tokenRefresh(Lcom/disney/id/android/DIDRequest;Ljava/lang/String;)V

    goto :goto_0

    .line 43
    :pswitch_3
    const-string v0, "event:token:refresh:force"

    invoke-direct {p0, p1, v0}, Lcom/disney/id/android/DIDTokenManager;->tokenRefresh(Lcom/disney/id/android/DIDRequest;Ljava/lang/String;)V

    goto :goto_0

    .line 46
    :pswitch_4
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDTokenManager;->refreshGuestData(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0

    .line 49
    :pswitch_5
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDTokenManager;->migrateFromBlueCookie(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0

    .line 35
    :pswitch_data_0
    .packed-switch 0x200
        :pswitch_1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method
