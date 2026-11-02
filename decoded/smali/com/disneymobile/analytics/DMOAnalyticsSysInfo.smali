.class public Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;
.super Ljava/lang/Object;
.source "DMOAnalyticsSysInfo.java"


# static fields
.field public static ANID:Ljava/lang/String; = null

.field public static GIDA:Ljava/lang/String; = null

.field public static ISLAT:Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "Analytics_Sys_Info"

.field private static USER_PREFS:Ljava/lang/String; = null

.field private static _context:Landroid/content/Context; = null

.field private static _sysInfo:Ljava/util/Map; = null
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

.field private static an_id:Ljava/lang/String; = null

.field private static app_version:Ljava/lang/String; = null

.field private static bundle_id:Ljava/lang/String; = null

.field public static defaultGida:Ljava/lang/String; = null

.field public static final defaultHost:Ljava/lang/String; = "https://api.disney.com/dismo/bi/v1"

.field private static deviceLocale:Ljava/lang/String;

.field private static deviceUid:Ljava/lang/String;

.field private static host:Ljava/lang/String;

.field private static isGidaCollected:Z

.field public static isLatDisabled:I

.field public static isLatEnabled:I

.field public static isLatException:I

.field private static mToken:Ljava/lang/String;

.field private static mUserPrefs:Landroid/content/SharedPreferences;

.field private static sessionId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 39
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    .line 40
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    .line 42
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->sessionId:Ljava/lang/String;

    .line 44
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->host:Ljava/lang/String;

    .line 45
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceUid:Ljava/lang/String;

    .line 46
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceLocale:Ljava/lang/String;

    .line 47
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->bundle_id:Ljava/lang/String;

    .line 48
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->app_version:Ljava/lang/String;

    .line 49
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mToken:Ljava/lang/String;

    .line 50
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->an_id:Ljava/lang/String;

    .line 54
    const-string v0, "gida"

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    .line 55
    const-string v0, "is_lat"

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    .line 56
    const-string v0, "an_id"

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    .line 58
    sput v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatDisabled:I

    .line 59
    const/4 v0, 0x1

    sput v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatEnabled:I

    .line 60
    const/4 v0, 0x2

    sput v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    .line 62
    const-string v0, "00000000-0000-0000-0000-000000000000"

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->defaultGida:Ljava/lang/String;

    .line 66
    sput-boolean v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isGidaCollected:Z

    .line 70
    const-string v0, "user_prefs"

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->USER_PREFS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAnID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 224
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 225
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 228
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getAppVersion()Ljava/lang/String;
    .locals 4

    .prologue
    .line 330
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->app_version:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 331
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setAppVersion()Ljava/lang/String;

    .line 333
    :cond_0
    const-string v0, "%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->app_version:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getBundleId()Ljava/lang/String;
    .locals 4

    .prologue
    .line 342
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->bundle_id:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 343
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setBundleId()Ljava/lang/String;

    .line 345
    :cond_0
    const-string v0, "%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->bundle_id:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getCachedAnID()Ljava/lang/String;
    .locals 4

    .prologue
    .line 142
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mUserPrefs:Landroid/content/SharedPreferences;

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 143
    .local v0, "cachedAnID":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 145
    :cond_0
    const/4 v0, 0x0

    .line 148
    :cond_1
    return-object v0
.end method

.method private static getCachedGIDA()Ljava/lang/String;
    .locals 4

    .prologue
    .line 132
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mUserPrefs:Landroid/content/SharedPreferences;

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->defaultGida:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "cachedGIDA":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 135
    :cond_0
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->defaultGida:Ljava/lang/String;

    .line 138
    :cond_1
    return-object v0
.end method

.method private static getCachedIsLat()I
    .locals 3

    .prologue
    .line 152
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mUserPrefs:Landroid/content/SharedPreferences;

    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getCellophanePassword()Ljava/lang/String;
    .locals 2

    .prologue
    .line 428
    const-string v1, "analyticsHostPassword"

    invoke-static {v1}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getFromManifest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 431
    .local v0, "analyticsHostPassword":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 432
    const-string v0, "AC364A88C2D12A352DC81DC5FBBC9FEEE8BCCB3D9CA155FB"

    .line 436
    :cond_0
    return-object v0
.end method

.method public static getCellophaneUsername()Ljava/lang/String;
    .locals 2

    .prologue
    .line 417
    const-string v1, "analyticsHostUsername"

    invoke-static {v1}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getFromManifest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 420
    .local v0, "analyticsHostUsername":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 421
    const-string v0, "3962215E-C235-4FA8-BD8D-78BB9DA7D3B4"

    .line 424
    :cond_0
    return-object v0
.end method

.method private static getFromManifest(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "metaName"    # Ljava/lang/String;

    .prologue
    .line 404
    const/4 v3, 0x0

    .line 406
    .local v3, "manifestString":Ljava/lang/String;
    :try_start_0
    sget-object v4, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    sget-object v5, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x80

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 408
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 409
    .local v1, "bundle":Landroid/os/Bundle;
    invoke-virtual {v1, p0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 413
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "bundle":Landroid/os/Bundle;
    :goto_0
    return-object v3

    .line 410
    :catch_0
    move-exception v2

    .line 411
    .local v2, "e":Ljava/lang/Exception;
    const-string v4, "Analytics_Sys_Info"

    const-string v5, "Exception while retreiving manifest data."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getGIDA()Ljava/lang/String;
    .locals 2

    .prologue
    .line 216
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 217
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 220
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getHost()Ljava/lang/String;
    .locals 4

    .prologue
    .line 282
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->host:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 283
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setHost()V

    .line 285
    :cond_0
    const-string v0, "%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->host:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getIsLat()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 232
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 233
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 236
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getLocale()Ljava/lang/String;
    .locals 4

    .prologue
    .line 294
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceLocale:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 295
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setDeviceLocale()Ljava/lang/String;

    .line 297
    :cond_0
    const-string v0, "%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceLocale:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMToken()Ljava/lang/String;
    .locals 4

    .prologue
    .line 318
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mToken:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 319
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setDeviceMacHash()Ljava/lang/String;

    .line 321
    :cond_0
    const-string v0, "%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mToken:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSessionId()Ljava/lang/String;
    .locals 4

    .prologue
    .line 270
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->sessionId:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 271
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setSessionId()Ljava/lang/String;

    .line 273
    :cond_0
    const-string v0, "%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->sessionId:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSysInfo(Landroid/content/Context;)Ljava/util/Map;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 258
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 259
    invoke-static {p0}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->init(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    .line 261
    :cond_0
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    return-object v0
.end method

.method public static getTokenInfo()Ljava/lang/String;
    .locals 4

    .prologue
    .line 306
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceUid:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 307
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setDeviceUID()Ljava/lang/String;

    .line 309
    :cond_0
    const-string v0, "%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceUid:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static init(Landroid/content/Context;)Ljava/util/Map;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    sget-object v1, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    invoke-virtual {v1}, Lcom/disneymobile/mocha/support/UIDevice;->init()V

    .line 80
    sput-object p0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    .line 81
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setHost()V

    .line 82
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setSessionId()Ljava/lang/String;

    .line 83
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->USER_PREFS:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    sput-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mUserPrefs:Landroid/content/SharedPreferences;

    .line 86
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    .line 89
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "os_type"

    const-string v3, "Android"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "app_version"

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getAppVersion()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "bundle_id"

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getBundleId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "DMOLibVersion"

    const-string v3, "3.1.10"

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "model"

    sget-object v3, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/support/UIDevice;->getModel()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "os_version"

    sget-object v3, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/support/UIDevice;->getSystemVersion()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v1, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    invoke-virtual {v1}, Lcom/disneymobile/mocha/support/UIDevice;->machineIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "machine":Ljava/lang/String;
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "machine"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "session_hash"

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getSessionId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    const-string v2, "app_locale"

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getLocale()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getCachedIsLat()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getCachedGIDA()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->defaultGida:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 109
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getCachedGIDA()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    :cond_0
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getCachedAnID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 114
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getCachedAnID()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :cond_1
    :goto_0
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    return-object v1

    .line 116
    :cond_2
    const-string v1, "amazon"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 118
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->an_id:Ljava/lang/String;

    .line 119
    const-string v1, "Analytics_Sys_Info"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "an_id should be set to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->an_id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->an_id:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static isGidaAvailable()Z
    .locals 3

    .prologue
    .line 244
    const/4 v0, 0x0

    .line 246
    .local v0, "goodGida":Z
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getGIDA()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getGIDA()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->defaultGida:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 247
    const/4 v0, 0x1

    .line 250
    :cond_0
    return v0
.end method

.method public static isGidaCollected()Z
    .locals 1

    .prologue
    .line 212
    sget-boolean v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isGidaCollected:Z

    return v0
.end method

.method public static setAnID(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "an_id"    # Ljava/lang/String;

    .prologue
    .line 186
    invoke-static {p0}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getSysInfo(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    .line 187
    .local v1, "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v1, :cond_0

    const-string v2, "machine"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v2, "machine"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "amazon"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 190
    :try_start_0
    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_sysInfo:Ljava/util/Map;

    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    invoke-static {p1}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setCachedAnID(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    :cond_0
    :goto_0
    return-void

    .line 193
    :catch_0
    move-exception v0

    .line 195
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "Analytics_Sys_Info"

    const-string v3, "Exception while trying to set the an_id"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static setAppVersion()Ljava/lang/String;
    .locals 4

    .prologue
    .line 383
    :try_start_0
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    sput-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->app_version:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 389
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->app_version:Ljava/lang/String;

    return-object v1

    .line 386
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 387
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v1, "Analytics_Sys_Info"

    const-string v2, "Error while retreiving Version from manifest data."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static setBundleId()Ljava/lang/String;
    .locals 4

    .prologue
    .line 394
    :try_start_0
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    sget-object v2, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->_context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    sput-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->bundle_id:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 400
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->bundle_id:Ljava/lang/String;

    return-object v1

    .line 397
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 398
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v1, "Analytics_Sys_Info"

    const-string v2, "Error while retreiving Package Name from manifest data."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static setCachedAnID(Ljava/lang/String;)V
    .locals 2
    .param p0, "anid"    # Ljava/lang/String;

    .prologue
    .line 168
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mUserPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 169
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 170
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 171
    return-void
.end method

.method private static setCachedGIDA(Ljava/lang/String;)V
    .locals 2
    .param p0, "gida"    # Ljava/lang/String;

    .prologue
    .line 161
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mUserPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 162
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 163
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 165
    return-void
.end method

.method private static setCachedIsLat(I)V
    .locals 2
    .param p0, "isLat"    # I

    .prologue
    .line 174
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mUserPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 175
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 176
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 177
    return-void
.end method

.method private static setDeviceLocale()Ljava/lang/String;
    .locals 1

    .prologue
    .line 349
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceLocale:Ljava/lang/String;

    .line 350
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceLocale:Ljava/lang/String;

    return-object v0
.end method

.method private static setDeviceMacHash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 359
    sget-object v0, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    invoke-virtual {v0}, Lcom/disneymobile/mocha/support/UIDevice;->getMacHash()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mToken:Ljava/lang/String;

    .line 360
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->mToken:Ljava/lang/String;

    return-object v0
.end method

.method private static setDeviceUID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 354
    sget-object v0, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    invoke-virtual {v0}, Lcom/disneymobile/mocha/support/UIDevice;->getUidInfo()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceUid:Ljava/lang/String;

    .line 355
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->deviceUid:Ljava/lang/String;

    return-object v0
.end method

.method public static setGida(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "gida"    # Ljava/lang/String;

    .prologue
    .line 180
    invoke-static {p0}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getSysInfo(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    .line 181
    .local v0, "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    invoke-static {p1}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setCachedGIDA(Ljava/lang/String;)V

    .line 183
    return-void
.end method

.method public static setGidaCollected(Z)V
    .locals 0
    .param p0, "gidaCollected"    # Z

    .prologue
    .line 208
    sput-boolean p0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isGidaCollected:Z

    .line 209
    return-void
.end method

.method private static setHost()V
    .locals 2

    .prologue
    .line 364
    const-string v1, "analyticsHost"

    invoke-static {v1}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getFromManifest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 365
    .local v0, "_host":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 366
    const-string v0, "https://api.disney.com/dismo/bi/v1"

    .line 369
    :cond_0
    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->host:Ljava/lang/String;

    .line 370
    return-void
.end method

.method public static setIsLat(Landroid/content/Context;I)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isLat"    # I

    .prologue
    .line 201
    invoke-static {p0}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getSysInfo(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    .line 202
    .local v0, "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    invoke-static {p1}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setCachedIsLat(I)V

    .line 204
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setGidaCollected(Z)V

    .line 205
    return-void
.end method

.method private static setSessionId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 373
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    .line 374
    .local v0, "uuid":Ljava/util/UUID;
    if-eqz v0, :cond_0

    .line 375
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->sessionId:Ljava/lang/String;

    .line 377
    :cond_0
    sget-object v1, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->sessionId:Ljava/lang/String;

    return-object v1
.end method
