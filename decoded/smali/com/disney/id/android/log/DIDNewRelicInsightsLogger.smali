.class public Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;
.super Ljava/lang/Object;
.source "DIDNewRelicInsightsLogger.java"

# interfaces
.implements Lcom/disney/id/android/log/DIDEventParams;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$1;,
        Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;,
        Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;
    }
.end annotation


# static fields
.field private static final APP_ID:Ljava/lang/String; = "DTSS-DISNEYID-UI"

.field private static final BASE_LOGGING_URI:Landroid/net/Uri;

.field private static final DEFAULT_LOGGING_URL:Ljava/lang/String; = "https://log.go.com/log"

.field private static final DELAY_AFTER_SUCCESSFUL_LOG_ATTEMPT:J

.field private static final DISNEY_ID_STORAGE:Ljava/lang/String; = "DisneyID"

.field private static final NEWRELIC_UUID_PARAM:Ljava/lang/String; = "newrelic.uuid"

.field private static final TAG:Ljava/lang/String;

.field private static final TIME_TO_WAIT_AFTER_FAILURE:J

.field private static final mLock:Ljava/lang/Object;

.field private static sInstance:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;


# instance fields
.field private final baseParameters:Ljava/util/Map;
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

.field private mContext:Landroid/content/Context;

.field private mInternetIsReachable:Z

.field private final mReachability:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;

.field private mThread:Ljava/lang/Thread;

.field private mUuid:Ljava/lang/String;

.field private requestQueue:Lcom/disney/id/android/log/CircularLoggingRequestQueue;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 37
    const-class v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TAG:Ljava/lang/String;

    .line 38
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mLock:Ljava/lang/Object;

    .line 42
    const-string v0, "https://log.go.com/log"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->BASE_LOGGING_URI:Landroid/net/Uri;

    .line 44
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->DELAY_AFTER_SUCCESSFUL_LOG_ATTEMPT:J

    .line 45
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x5

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TIME_TO_WAIT_AFTER_FAILURE:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;-><init>(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$1;)V

    iput-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mReachability:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->baseParameters:Ljava/util/Map;

    .line 72
    iput-object p1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mContext:Landroid/content/Context;

    .line 73
    invoke-direct {p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->init()V

    .line 74
    return-void
.end method

.method static synthetic access$100()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Z
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mInternetIsReachable:Z

    return v0
.end method

.method static synthetic access$202(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;
    .param p1, "x1"    # Z

    .prologue
    .line 36
    iput-boolean p1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mInternetIsReachable:Z

    return p1
.end method

.method static synthetic access$300(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Lcom/disney/id/android/log/CircularLoggingRequestQueue;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->requestQueue:Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    return-object v0
.end method

.method static synthetic access$400(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Ljava/lang/Thread;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mThread:Ljava/lang/Thread;

    return-object v0
.end method

.method static synthetic access$402(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mThread:Ljava/lang/Thread;

    return-object p1
.end method

.method static synthetic access$500(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$600()J
    .locals 2

    .prologue
    .line 36
    sget-wide v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TIME_TO_WAIT_AFTER_FAILURE:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;
    .param p1, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->buildLoggingUrl(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800()J
    .locals 2

    .prologue
    .line 36
    sget-wide v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->DELAY_AFTER_SUCCESSFUL_LOG_ATTEMPT:J

    return-wide v0
.end method

.method private buildLoggingUrl(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 7
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 321
    sget-object v4, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->BASE_LOGGING_URI:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    .line 322
    .local v3, "url":Landroid/net/Uri$Builder;
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .line 323
    .local v2, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 324
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 326
    .local v1, "key":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 327
    :catch_0
    move-exception v0

    .line 328
    .local v0, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TAG:Ljava/lang/String;

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "error building query parameter, key :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 332
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 61
    sget-object v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->sInstance:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    if-nez v0, :cond_1

    .line 62
    sget-object v1, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 63
    :try_start_0
    sget-object v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->sInstance:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    if-nez v0, :cond_0

    .line 64
    new-instance v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-direct {v0, p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->sInstance:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    .line 66
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    :cond_1
    sget-object v0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->sInstance:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    return-object v0

    .line 66
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private init()V
    .locals 6

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->initBaseParams()V

    .line 81
    new-instance v2, Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    iget-object v3, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "log_go_logging_event"

    invoke-direct {v2, v3, v4}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->requestQueue:Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    .line 82
    iget-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mReachability:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 84
    iget-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mContext:Landroid/content/Context;

    const-string v3, "DisneyID"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 85
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 86
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "newrelic.uuid"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mUuid:Ljava/lang/String;

    .line 87
    iget-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mUuid:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 88
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mUuid:Ljava/lang/String;

    .line 89
    const-string v2, "newrelic.uuid"

    iget-object v3, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mUuid:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 90
    invoke-direct {p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logInstallation()V

    .line 91
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 94
    :cond_0
    iget-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mReachability:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;

    invoke-virtual {v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$Reachability;->isConnected()Z

    move-result v2

    iput-boolean v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mInternetIsReachable:Z

    .line 95
    return-void
.end method

.method private initBaseParams()V
    .locals 4

    .prologue
    .line 102
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->baseParameters:Ljava/util/Map;

    const-string v1, "make_model"

    invoke-direct {p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->parseMakeAndModel()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->baseParameters:Ljava/util/Map;

    const-string v1, "os"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Android "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->baseParameters:Ljava/util/Map;

    const-string v1, "sdk_version"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Android "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/disney/id/android/DIDWebUtils;->getVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->baseParameters:Ljava/util/Map;

    const-string v1, "appid"

    const-string v2, "DTSS-DISNEYID-UI"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    return-void
.end method

.method private logDisneyEvent(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 187
    .local p1, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->baseParameters:Ljava/util/Map;

    invoke-interface {p1, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 188
    const-string v1, "direct_flow_version"

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 189
    const-string v1, "direct_flow_version"

    const-string v2, "native_call"

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 194
    .local v0, "obj":Lorg/json/JSONObject;
    const-string v1, "client_id"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getClientId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getCoreServicesEnv()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 196
    iget-object v1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mUuid:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 197
    const-string v1, "mobile_install_id"

    iget-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mUuid:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 200
    :cond_1
    const-string v1, "connection_type"

    iget-object v2, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/disney/id/android/DIDWebUtils;->determineConnectionType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 203
    const-string v1, "conversationIdTimeStamp"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 204
    const-string v1, "conversationIdTimeStamp"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 207
    :cond_2
    invoke-direct {p0, v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logEvent(Lorg/json/JSONObject;)V

    .line 208
    return-void
.end method

.method private logEvent(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "eventData"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 211
    const-string v1, "timestamp"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 213
    :try_start_0
    const-string v1, "timestamp"

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    :cond_0
    :goto_0
    sget-object v2, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 220
    :try_start_1
    iget-object v1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->requestQueue:Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    invoke-virtual {v1, p1}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->add(Lorg/json/JSONObject;)V

    .line 221
    iget-object v1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/DIDWebUtils;->isConnected(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 222
    iget-object v1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mThread:Ljava/lang/Thread;

    if-nez v1, :cond_1

    .line 223
    new-instance v1, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;

    invoke-direct {v1, p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger$LoggerThread;-><init>(Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;)V

    iput-object v1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mThread:Ljava/lang/Thread;

    .line 224
    iget-object v1, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 226
    :cond_1
    sget-object v1, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 228
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 229
    return-void

    .line 214
    :catch_0
    move-exception v0

    .line 215
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error putting a timestamp in the event"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 228
    .end local v0    # "e":Lorg/json/JSONException;
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private logInstallation()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 126
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 127
    .local v0, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "action_name"

    const-string v2, "event:sdk:install"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    const-string v1, "anon"

    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const-string v1, "success"

    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    const-string v1, "process_time"

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    :try_start_0
    invoke-direct {p0, v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logDisneyEvent(Ljava/util/Map;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :goto_0
    return-void

    .line 134
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private logStartup(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, "currentStateParam":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 146
    .local v0, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "action_name"

    const-string v2, "event:sdk:startup"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    const-string v1, "success"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    const-string v1, "process_time"

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    return-void
.end method

.method private parseMake()Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    return-object v0
.end method

.method private parseMakeAndModel()Ljava/lang/String;
    .locals 2

    .prologue
    .line 110
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    const-string v1, "goldfish"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    const-string v0, "Android Emulator"

    .line 114
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->parseMake()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->parseModel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private parseModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public logDispatchEvent(Ljava/util/Map;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 166
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "stateParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {p1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 169
    :try_start_0
    invoke-direct {p0, p1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logDisneyEvent(Ljava/util/Map;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    :goto_0
    return-void

    .line 170
    :catch_0
    move-exception v0

    .line 171
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public logDispatchEvent(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 176
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "stateParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "overrides":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {p1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 177
    invoke-interface {p1, p3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 180
    :try_start_0
    invoke-direct {p0, p1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logDisneyEvent(Ljava/util/Map;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :goto_0
    return-void

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .param p1, "eventCode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p2, "stateParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v2, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LogStandardEvent :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 154
    .local v1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 155
    const-string v2, "action_name"

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    :try_start_0
    invoke-direct {p0, v1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logDisneyEvent(Ljava/util/Map;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    :goto_0
    return-void

    .line 160
    :catch_0
    move-exception v0

    .line 161
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public start(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 139
    .local p1, "currentStateParam":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v1, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 140
    :try_start_0
    invoke-direct {p0, p1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStartup(Ljava/util/Map;)V

    .line 141
    monitor-exit v1

    .line 142
    return-void

    .line 141
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public term()V
    .locals 2

    .prologue
    .line 232
    sget-object v1, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 233
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 236
    :cond_0
    monitor-exit v1

    .line 237
    return-void

    .line 236
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
