.class public Lcom/disneymobile/analytics/DMOAnalytics;
.super Ljava/lang/Object;
.source "DMOAnalytics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;
    }
.end annotation


# static fields
.field public static final APP_BACKGROUND:Ljava/lang/String; = "app_background"

.field public static final APP_END:Ljava/lang/String; = "app_end"

.field public static final APP_FOREGROUND:Ljava/lang/String; = "app_foreground"

.field public static final APP_START:Ljava/lang/String; = "app_start"

.field public static final GAME_ACTION:Ljava/lang/String; = "game_action"

.field public static final GAME_END:Ljava/lang/String; = "game_end"

.field public static final GAME_START:Ljava/lang/String; = "game_start"

.field public static final MONEY_ACTION:Ljava/lang/String; = "money"

.field public static final TAG:Ljava/lang/String; = "DMOAnalytics"

.field public static final VERSION:Ljava/lang/String; = "3.1.10"

.field private static _context:Landroid/content/Context;

.field private static autoBacklogMode:Z

.field private static isAppEndSent:Z

.field private static isAppStartSent:Z

.field private static sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

.field private static sysInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private APP_KEY:Ljava/lang/String;

.field private APP_SECRET:Ljava/lang/String;

.field private backend:Lcom/disneymobile/network/DMOBackendConnection;

.field private canUseNetwork:Z

.field private connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

.field private debugLogging:Z

.field private delegate:Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;

.field gidaThread:Ljava/lang/Thread;

.field private restrictedTracking:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 89
    const/4 v0, 0x0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sysInfo:Ljava/util/Map;

    .line 91
    sput-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->isAppStartSent:Z

    .line 92
    sput-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->isAppEndSent:Z

    .line 94
    const/4 v0, 0x1

    sput-boolean v0, Lcom/disneymobile/analytics/DMOAnalytics;->autoBacklogMode:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "secret"    # Ljava/lang/String;

    .prologue
    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    const-string v0, "MISSING_APP_KEY"

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->APP_KEY:Ljava/lang/String;

    .line 64
    const-string v0, "MISSING_APP_SECRET"

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->APP_SECRET:Ljava/lang/String;

    .line 100
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/disneymobile/analytics/DMOAnalytics$1;

    invoke-direct {v1, p0}, Lcom/disneymobile/analytics/DMOAnalytics$1;-><init>(Lcom/disneymobile/analytics/DMOAnalytics;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->gidaThread:Ljava/lang/Thread;

    .line 216
    sput-object p1, Lcom/disneymobile/analytics/DMOAnalytics;->_context:Landroid/content/Context;

    .line 217
    invoke-static {p1}, Lcom/disneymobile/mocha/support/Support;->setContext(Landroid/content/Context;)V

    .line 218
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->getSysInfo()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sysInfo:Ljava/util/Map;

    .line 219
    iput-object p2, p0, Lcom/disneymobile/analytics/DMOAnalytics;->APP_KEY:Ljava/lang/String;

    .line 220
    iput-object p3, p0, Lcom/disneymobile/analytics/DMOAnalytics;->APP_SECRET:Ljava/lang/String;

    .line 221
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->APP_KEY:Ljava/lang/String;

    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->APP_SECRET:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->initWithAppKeyAndSecret(Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/analytics/DMOAnalytics;

    .line 222
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->gidaThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 223
    return-void
.end method

.method static synthetic access$000()Landroid/content/Context;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->_context:Landroid/content/Context;

    return-object v0
.end method

.method private static endpoint()Lcom/disneymobile/mocha/NSURL;
    .locals 2

    .prologue
    .line 311
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 312
    .local v0, "host":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 313
    const-string v0, "https://api.disney.com/dismo/bi/v1"

    .line 315
    :cond_0
    invoke-static {v0}, Lcom/disneymobile/mocha/NSURL;->URLWithString(Ljava/lang/String;)Lcom/disneymobile/mocha/NSURL;

    move-result-object v1

    return-object v1
.end method

.method public static getSysInfo()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 341
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sysInfo:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 342
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getSysInfo(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sysInfo:Ljava/util/Map;

    .line 344
    :cond_0
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sysInfo:Ljava/util/Map;

    return-object v0
.end method

.method private initWithAppKeyAndSecret(Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/analytics/DMOAnalytics;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "secret"    # Ljava/lang/String;

    .prologue
    .line 328
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    if-nez v0, :cond_0

    .line 329
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->endpoint()Lcom/disneymobile/mocha/NSURL;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lcom/disneymobile/analytics/DMOAnalytics;->initWithURLAppKeyAndSecret(Lcom/disneymobile/mocha/NSURL;Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    .line 331
    :cond_0
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    return-object v0
.end method

.method private initWithURLAppKeyAndSecret(Lcom/disneymobile/mocha/NSURL;Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/analytics/DMOAnalytics;
    .locals 3
    .param p1, "url"    # Lcom/disneymobile/mocha/NSURL;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "secret"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x0

    .line 359
    sput-object p0, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    .line 360
    iput-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->restrictedTracking:Z

    .line 361
    iput-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->debugLogging:Z

    .line 362
    iput-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->canUseNetwork:Z

    .line 367
    new-instance v0, Lcom/disneymobile/network/DMOBackendConnection;

    invoke-direct {v0}, Lcom/disneymobile/network/DMOBackendConnection;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->backend:Lcom/disneymobile/network/DMOBackendConnection;

    .line 368
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->backend:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disneymobile/network/DMOBackendConnection;->initWithURLKeyAndSecret(Lcom/disneymobile/mocha/NSURL;Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendConnection;

    .line 369
    new-instance v0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-direct {v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;-><init>()V

    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->backend:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v0, v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->initWithBackendConnection(Lcom/disneymobile/network/DMOBackendConnection;)Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    .line 374
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->backend:Lcom/disneymobile/network/DMOBackendConnection;

    if-nez v0, :cond_0

    .line 375
    const-string v0, "DMOAnalytics"

    const-string v1, "ERROR: No backend connection."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    sput-object v2, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    .line 383
    :goto_0
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    return-object v0

    .line 377
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    if-nez v0, :cond_1

    .line 378
    const-string v0, "DMOAnalytics"

    const-string v1, "ERROR: No analytics connection."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    sput-object v2, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    goto :goto_0

    .line 381
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/disneymobile/analytics/DMOAnalytics;->setCanUseNetwork(Z)V

    goto :goto_0
.end method

.method private logToConsole(Ljava/lang/String;)V
    .locals 3
    .param p1, "stuff"    # Ljava/lang/String;

    .prologue
    .line 395
    iget-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->debugLogging:Z

    if-eqz v0, :cond_0

    .line 396
    const-string v0, "DMOAnalytics"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DMOAnalytics Event:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    :cond_0
    return-void
.end method

.method public static sharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;
    .locals 2

    .prologue
    .line 293
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    if-nez v0, :cond_0

    .line 294
    const-string v0, "DMOAnalytics"

    const-string v1, "DMOAnalytics needs to be initialized with one of it\'s designated initializers, e.g. initWithURL:appKey:secret:"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "DMOAnalytics not initialized."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 298
    :cond_0
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalytics;->sharedDMOAnalyticsManager:Lcom/disneymobile/analytics/DMOAnalytics;

    return-object v0
.end method


# virtual methods
.method public flushAnalyticsQueue()V
    .locals 1

    .prologue
    .line 408
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->restoreQueue()V

    .line 409
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->flushQueue()V

    .line 410
    return-void
.end method

.method public get()Z
    .locals 1

    .prologue
    .line 231
    iget-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->debugLogging:Z

    return v0
.end method

.method public getAdInfo()Ljava/util/HashMap;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 161
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 164
    .local v4, "adInfoMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    const-string v10, "com.google.android.gms.ads.identifier.AdvertisingIdClient"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 166
    .local v0, "adIdClientClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v10, "getAdvertisingIdInfo"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Class;

    const/4 v12, 0x0

    const-class v13, Landroid/content/Context;

    aput-object v13, v11, v12

    invoke-virtual {v0, v10, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 167
    .local v6, "getAdvertisingIdInfoMethod":Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    sget-object v13, Lcom/disneymobile/analytics/DMOAnalytics;->_context:Landroid/content/Context;

    aput-object v13, v11, v12

    invoke-virtual {v6, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 169
    .local v2, "adInfo":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 171
    .local v1, "adIdClientInfoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v10, "getId"

    const/4 v11, 0x0

    invoke-virtual {v1, v10, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 173
    .local v7, "getIdMethod":Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    invoke-virtual {v7, v2, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 175
    .local v3, "adInfoId":Ljava/lang/String;
    const-string v10, "isLimitAdTrackingEnabled"

    const/4 v11, 0x0

    invoke-virtual {v1, v10, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 176
    .local v9, "isLimitAdTrackingEnabledMethod":Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    invoke-virtual {v9, v2, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    .line 177
    .local v8, "isLatStatus":Z
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-virtual {v4, v10, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    if-eqz v8, :cond_0

    .line 180
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatEnabled:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .end local v0    # "adIdClientClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "adIdClientInfoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "adInfo":Ljava/lang/Object;
    .end local v3    # "adInfoId":Ljava/lang/String;
    .end local v6    # "getAdvertisingIdInfoMethod":Ljava/lang/reflect/Method;
    .end local v7    # "getIdMethod":Ljava/lang/reflect/Method;
    .end local v8    # "isLatStatus":Z
    .end local v9    # "isLimitAdTrackingEnabledMethod":Ljava/lang/reflect/Method;
    :goto_0
    return-object v4

    .line 183
    .restart local v0    # "adIdClientClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "adIdClientInfoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "adInfo":Ljava/lang/Object;
    .restart local v3    # "adInfoId":Ljava/lang/String;
    .restart local v6    # "getAdvertisingIdInfoMethod":Ljava/lang/reflect/Method;
    .restart local v7    # "getIdMethod":Ljava/lang/reflect/Method;
    .restart local v8    # "isLatStatus":Z
    .restart local v9    # "isLimitAdTrackingEnabledMethod":Ljava/lang/reflect/Method;
    :cond_0
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatDisabled:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    goto :goto_0

    .line 186
    .end local v0    # "adIdClientClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "adIdClientInfoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "adInfo":Ljava/lang/Object;
    .end local v3    # "adInfoId":Ljava/lang/String;
    .end local v6    # "getAdvertisingIdInfoMethod":Ljava/lang/reflect/Method;
    .end local v7    # "getIdMethod":Ljava/lang/reflect/Method;
    .end local v8    # "isLatStatus":Z
    .end local v9    # "isLimitAdTrackingEnabledMethod":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v5

    .line 187
    .local v5, "e":Ljava/lang/ClassNotFoundException;
    const-string v10, "DMOAnalytics"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "[GIDA] ClassNotFoundException. AdvertisingIdClient not available: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/ClassNotFoundException;->getCause()Ljava/lang/Throwable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 189
    .end local v5    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v5

    .line 190
    .local v5, "e":Ljava/lang/SecurityException;
    const-string v10, "DMOAnalytics"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "[GIDA] SecurityException. AdvertisingIdClient not available: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/SecurityException;->getCause()Ljava/lang/Throwable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 192
    .end local v5    # "e":Ljava/lang/SecurityException;
    :catch_2
    move-exception v5

    .line 193
    .local v5, "e":Ljava/lang/NoSuchMethodException;
    const-string v10, "DMOAnalytics"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "[GIDA] NoSuchMethodException. AdvertisingIdClient not available: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/NoSuchMethodException;->getCause()Ljava/lang/Throwable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 195
    .end local v5    # "e":Ljava/lang/NoSuchMethodException;
    :catch_3
    move-exception v5

    .line 196
    .local v5, "e":Ljava/lang/IllegalArgumentException;
    const-string v10, "DMOAnalytics"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "[GIDA] IllegalArgumentException. AdvertisingIdClient not available: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/IllegalArgumentException;->getCause()Ljava/lang/Throwable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 198
    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    :catch_4
    move-exception v5

    .line 199
    .local v5, "e":Ljava/lang/IllegalAccessException;
    const-string v10, "DMOAnalytics"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "[GIDA] IllegalAccessException. AdvertisingIdClient not available: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/IllegalAccessException;->getCause()Ljava/lang/Throwable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 201
    .end local v5    # "e":Ljava/lang/IllegalAccessException;
    :catch_5
    move-exception v5

    .line 202
    .local v5, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v10, "DMOAnalytics"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "[GIDA] InvocationTargetException. AdvertisingIdClient not available: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 204
    .end local v5    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_6
    move-exception v5

    .line 205
    .local v5, "e":Ljava/lang/Exception;
    const-string v10, "DMOAnalytics"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "[GIDA] AdvertisingIdClient not available: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    sget-object v10, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v11, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0
.end method

.method public getAutoBacklogMode()Z
    .locals 1

    .prologue
    .line 433
    sget-boolean v0, Lcom/disneymobile/analytics/DMOAnalytics;->autoBacklogMode:Z

    return v0
.end method

.method public getCanUseNetwork()Z
    .locals 1

    .prologue
    .line 255
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->delegate:Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->delegate:Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;

    invoke-interface {v0}, Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;->analyticsCanUseNetwork()Z

    move-result v0

    .line 258
    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->canUseNetwork:Z

    goto :goto_0
.end method

.method public getDelegate()Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->delegate:Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;

    return-object v0
.end method

.method public isRestrictedTracking()Z
    .locals 1

    .prologue
    .line 273
    iget-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->restrictedTracking:Z

    return v0
.end method

.method public logAnalyticsEvent(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 1
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    .line 722
    invoke-virtual {p0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->logEventInternal(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    return-object v0
.end method

.method public logAnalyticsEventAppBackground()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 1

    .prologue
    .line 710
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppBackgroundInternal()Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    return-object v0
.end method

.method public logAnalyticsEventAppEnd()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 1

    .prologue
    .line 718
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppEndInternal()Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    return-object v0
.end method

.method public logAnalyticsEventAppForeground()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 1

    .prologue
    .line 714
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppForegroundInternal()Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    return-object v0
.end method

.method public logAnalyticsEventAppStart()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 1

    .prologue
    .line 706
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppStartInternal()Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    return-object v0
.end method

.method public logAnalyticsEventWithContext(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 1
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "details"    # Lorg/json/JSONObject;

    .prologue
    .line 726
    invoke-virtual {p0, p1, p2}, Lcom/disneymobile/analytics/DMOAnalytics;->logEventWithContextInternal(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    return-object v0
.end method

.method public logAppBackground()V
    .locals 0

    .prologue
    .line 449
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppBackgroundInternal()Lcom/disneymobile/network/DMOBackendResponse;

    .line 450
    return-void
.end method

.method public logAppBackgroundInternal()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3

    .prologue
    .line 545
    const-string v1, "app_background"

    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logToConsole(Ljava/lang/String;)V

    .line 546
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v1

    if-nez v1, :cond_1

    .line 547
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    const-string v2, "app_background"

    invoke-virtual {v1, v2}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->analyticsEvent(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 549
    .local v0, "response":Lcom/disneymobile/network/DMOBackendResponse;
    sget-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->autoBacklogMode:Z

    if-eqz v1, :cond_0

    .line 550
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->saveQueue()V

    .line 554
    .end local v0    # "response":Lcom/disneymobile/network/DMOBackendResponse;
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logAppEnd()V
    .locals 0

    .prologue
    .line 465
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppEndInternal()Lcom/disneymobile/network/DMOBackendResponse;

    .line 466
    return-void
.end method

.method public logAppEndInternal()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3

    .prologue
    .line 582
    sget-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->isAppEndSent:Z

    if-nez v1, :cond_1

    .line 583
    const/4 v1, 0x1

    sput-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->isAppEndSent:Z

    .line 584
    const-string v1, "app_end"

    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logToConsole(Ljava/lang/String;)V

    .line 585
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v1

    if-nez v1, :cond_1

    .line 586
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    const-string v2, "app_end"

    invoke-virtual {v1, v2}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->analyticsEnd(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 588
    .local v0, "response":Lcom/disneymobile/network/DMOBackendResponse;
    sget-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->autoBacklogMode:Z

    if-eqz v1, :cond_0

    .line 589
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->saveQueue()V

    .line 594
    .end local v0    # "response":Lcom/disneymobile/network/DMOBackendResponse;
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logAppForeground()V
    .locals 0

    .prologue
    .line 457
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppForegroundInternal()Lcom/disneymobile/network/DMOBackendResponse;

    .line 458
    return-void
.end method

.method public logAppForegroundInternal()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3

    .prologue
    .line 564
    sget-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->autoBacklogMode:Z

    if-eqz v1, :cond_0

    .line 565
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->restoreQueue()V

    .line 566
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->flushQueue()V

    .line 568
    :cond_0
    const-string v1, "app_foreground"

    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logToConsole(Ljava/lang/String;)V

    .line 569
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v1

    if-nez v1, :cond_1

    .line 570
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    const-string v2, "app_foreground"

    invoke-virtual {v1, v2}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->analyticsForeground(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 573
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logAppStart()V
    .locals 0

    .prologue
    .line 441
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppStartInternal()Lcom/disneymobile/network/DMOBackendResponse;

    .line 442
    return-void
.end method

.method public logAppStartInternal()Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3

    .prologue
    .line 521
    sget-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->isAppStartSent:Z

    if-nez v1, :cond_1

    .line 522
    const/4 v1, 0x1

    sput-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->isAppStartSent:Z

    .line 525
    sget-boolean v1, Lcom/disneymobile/analytics/DMOAnalytics;->autoBacklogMode:Z

    if-eqz v1, :cond_0

    .line 526
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->restoreQueue()V

    .line 529
    :cond_0
    const-string v1, "app_start"

    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logToConsole(Ljava/lang/String;)V

    .line 530
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v1

    if-nez v1, :cond_1

    .line 531
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    const-string v2, "app_start"

    invoke-virtual {v1, v2}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->analyticsStart(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 536
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logEvent(Ljava/lang/String;)V
    .locals 0
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    .line 511
    invoke-virtual {p0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->logEventInternal(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    .line 512
    return-void
.end method

.method public logEventInternal(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 2
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    .line 634
    invoke-direct {p0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->logToConsole(Ljava/lang/String;)V

    .line 635
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v1

    if-nez v1, :cond_0

    .line 636
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1, p1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->analyticsEvent(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 639
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logEventWithContext(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "details"    # Lorg/json/JSONObject;

    .prologue
    .line 491
    invoke-virtual {p0, p1, p2}, Lcom/disneymobile/analytics/DMOAnalytics;->logEventWithContextInternal(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;

    .line 492
    return-void
.end method

.method public logEventWithContextInternal(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 2
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "details"    # Lorg/json/JSONObject;

    .prologue
    .line 657
    invoke-direct {p0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->logToConsole(Ljava/lang/String;)V

    .line 658
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v1

    if-nez v1, :cond_0

    .line 659
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1, p1, p2}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->analyticsEventWithContext(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 662
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logGameAction(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "eventContext"    # Lorg/json/JSONObject;

    .prologue
    .line 473
    invoke-virtual {p0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->logGameActionInternal(Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;

    .line 474
    return-void
.end method

.method public logGameActionInternal(Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 2
    .param p1, "eventContext"    # Lorg/json/JSONObject;

    .prologue
    .line 603
    const-string v1, "game_action"

    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logToConsole(Ljava/lang/String;)V

    .line 604
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v1

    if-nez v1, :cond_0

    .line 605
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1, p1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->gameAction(Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 608
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logMoneyAction(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "eventContext"    # Lorg/json/JSONObject;

    .prologue
    .line 500
    invoke-virtual {p0, p1}, Lcom/disneymobile/analytics/DMOAnalytics;->logMoneyActionInternal(Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;

    .line 501
    return-void
.end method

.method public logMoneyActionInternal(Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 2
    .param p1, "eventContext"    # Lorg/json/JSONObject;

    .prologue
    .line 617
    const-string v1, "money"

    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logToConsole(Ljava/lang/String;)V

    .line 618
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->isRestrictedTracking()Z

    move-result v1

    if-nez v1, :cond_0

    .line 619
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1, p1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->moneyAction(Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 622
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public persistAnalyticsQueue()V
    .locals 1

    .prologue
    .line 416
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->saveQueue()V

    .line 417
    return-void
.end method

.method public setAutoBacklogMode(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 429
    sput-boolean p1, Lcom/disneymobile/analytics/DMOAnalytics;->autoBacklogMode:Z

    .line 430
    return-void
.end method

.method public setCanUseNetwork(Z)V
    .locals 1
    .param p1, "flag"    # Z

    .prologue
    .line 261
    iput-boolean p1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->canUseNetwork:Z

    .line 262
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v0, p1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->setCanPost(Z)V

    .line 263
    return-void
.end method

.method public setDebugLogging(Z)V
    .locals 0
    .param p1, "debugLogging"    # Z

    .prologue
    .line 234
    iput-boolean p1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->debugLogging:Z

    .line 235
    return-void
.end method

.method public setDelegate(Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;)V
    .locals 0
    .param p1, "delegate"    # Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;

    .prologue
    .line 246
    iput-object p1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->delegate:Lcom/disneymobile/analytics/DMOAnalytics$DMOAnalyticsDelegate;

    .line 247
    return-void
.end method

.method public setRestrictedTracking(Z)V
    .locals 0
    .param p1, "restrictedTracking"    # Z

    .prologue
    .line 284
    iput-boolean p1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->restrictedTracking:Z

    .line 285
    return-void
.end method

.method public startAutoEventService()V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 692
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 694
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/disneymobile/analytics/DMOAnalyticsService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 695
    return-void
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 684
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalytics;->stopAutoEventService()V

    .line 685
    return-void
.end method

.method public stopAutoEventService()V
    .locals 3

    .prologue
    .line 701
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 702
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/disneymobile/analytics/DMOAnalyticsService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 703
    return-void
.end method

.method public testBackLogEvent(Lcom/disneymobile/mocha/support/BacklogRequest;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 2
    .param p1, "backlogRequest"    # Lcom/disneymobile/mocha/support/BacklogRequest;

    .prologue
    .line 644
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalytics;->connection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-virtual {v1, p1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->sendBacklogEvent(Lcom/disneymobile/mocha/support/BacklogRequest;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 646
    .local v0, "response":Lcom/disneymobile/network/DMOBackendResponse;
    return-object v0
.end method
