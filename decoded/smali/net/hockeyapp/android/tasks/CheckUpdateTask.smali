.class public Lnet/hockeyapp/android/tasks/CheckUpdateTask;
.super Landroid/os/AsyncTask;
.source "CheckUpdateTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lorg/json/JSONArray;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_NUMBER_OF_VERSIONS:I = 0x19


# instance fields
.field private activity:Landroid/app/Activity;

.field protected appIdentifier:Ljava/lang/String;

.field private listener:Lnet/hockeyapp/android/UpdateManagerListener;

.field private mandatory:Ljava/lang/Boolean;

.field protected urlString:Ljava/lang/String;

.field private usageTime:J


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;)V
    .locals 3
    .param p2, "urlString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "weakActivity":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    const/4 v2, 0x0

    .line 90
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 82
    iput-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->urlString:Ljava/lang/String;

    .line 83
    iput-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    .line 85
    iput-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 86
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->mandatory:Ljava/lang/Boolean;

    .line 88
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->usageTime:J

    .line 91
    iput-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    .line 92
    iput-object p2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->urlString:Ljava/lang/String;

    .line 94
    if-eqz p1, :cond_0

    .line 95
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 98
    :cond_0
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 99
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/Tracking;->getUsageTime(Landroid/content/Context;)J

    move-result-wide v0

    iput-wide v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->usageTime:J

    .line 100
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/Constants;->loadFromContext(Landroid/content/Context;)V

    .line 102
    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p2, "urlString"    # Ljava/lang/String;
    .param p3, "appIdentifier"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "weakActivity":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    const/4 v0, 0x0

    .line 104
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 82
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->urlString:Ljava/lang/String;

    .line 83
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    .line 85
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 86
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->mandatory:Ljava/lang/Boolean;

    .line 88
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->usageTime:J

    .line 105
    iput-object p3, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    .line 106
    iput-object p2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->urlString:Ljava/lang/String;

    .line 108
    if-eqz p1, :cond_0

    .line 109
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 112
    :cond_0
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 113
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/Tracking;->getUsageTime(Landroid/content/Context;)J

    move-result-wide v0

    iput-wide v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->usageTime:J

    .line 114
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/Constants;->loadFromContext(Landroid/content/Context;)V

    .line 116
    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/String;Lnet/hockeyapp/android/UpdateManagerListener;)V
    .locals 2
    .param p2, "urlString"    # Ljava/lang/String;
    .param p3, "appIdentifier"    # Ljava/lang/String;
    .param p4, "listener"    # Lnet/hockeyapp/android/UpdateManagerListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lnet/hockeyapp/android/UpdateManagerListener;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "weakActivity":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    const/4 v0, 0x0

    .line 118
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 82
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->urlString:Ljava/lang/String;

    .line 83
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    .line 85
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 86
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->mandatory:Ljava/lang/Boolean;

    .line 88
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->usageTime:J

    .line 119
    iput-object p3, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    .line 120
    iput-object p2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->urlString:Ljava/lang/String;

    .line 121
    iput-object p4, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    .line 123
    if-eqz p1, :cond_0

    .line 124
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 127
    :cond_0
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 128
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/Tracking;->getUsageTime(Landroid/content/Context;)J

    move-result-wide v0

    iput-wide v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->usageTime:J

    .line 129
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/Constants;->loadFromContext(Landroid/content/Context;)V

    .line 131
    :cond_1
    return-void
.end method

.method static synthetic access$2(Lnet/hockeyapp/android/tasks/CheckUpdateTask;)V
    .locals 0

    .prologue
    .line 241
    invoke-direct {p0}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->cleanUp()V

    return-void
.end method

.method static synthetic access$3(Lnet/hockeyapp/android/tasks/CheckUpdateTask;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$4(Lnet/hockeyapp/android/tasks/CheckUpdateTask;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 354
    invoke-direct {p0, p1}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->showUpdateFragment(Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic access$5(Lnet/hockeyapp/android/tasks/CheckUpdateTask;Lorg/json/JSONArray;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 329
    invoke-direct {p0, p1, p2}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->startUpdateIntent(Lorg/json/JSONArray;Ljava/lang/Boolean;)V

    return-void
.end method

.method private cleanUp()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 242
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 243
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->urlString:Ljava/lang/String;

    .line 244
    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    .line 245
    return-void
.end method

.method private static convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 6
    .param p0, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 386
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v5, 0x400

    invoke-direct {v2, v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 387
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 389
    .local v3, "stringBuilder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 391
    .local v1, "line":Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 400
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 406
    :goto_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 392
    :cond_0
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 395
    :catch_0
    move-exception v0

    .line 396
    .local v0, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 400
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 402
    :catch_1
    move-exception v0

    .line 403
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 398
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 400
    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 405
    :goto_2
    throw v4

    .line 402
    :catch_2
    move-exception v0

    .line 403
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 402
    .end local v0    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 403
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private encodeParam(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "param"    # Ljava/lang/String;

    .prologue
    .line 274
    :try_start_0
    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 278
    :goto_0
    return-object v1

    .line 276
    :catch_0
    move-exception v0

    .line 278
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v1, ""

    goto :goto_0
.end method

.method private findNewVersion(Lorg/json/JSONArray;I)Z
    .locals 6
    .param p1, "json"    # Lorg/json/JSONArray;
    .param p2, "versionCode"    # I

    .prologue
    const/4 v3, 0x0

    .line 195
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v2, v4, :cond_0

    .line 209
    :goto_1
    return v3

    .line 196
    :cond_0
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 197
    .local v1, "entry":Lorg/json/JSONObject;
    const-string v4, "version"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    if-le v4, p2, :cond_2

    .line 198
    const-string v4, "minimum_os_version"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-static {v4, v5}, Lnet/hockeyapp/android/utils/VersionHelper;->compareVersionStrings(Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-gtz v4, :cond_2

    .line 199
    const-string v4, "mandatory"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 200
    const-string v4, "mandatory"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->mandatory:Ljava/lang/Boolean;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    :cond_1
    const/4 v3, 0x1

    goto :goto_1

    .line 195
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 208
    .end local v1    # "entry":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 209
    .local v0, "e":Lorg/json/JSONException;
    goto :goto_1
.end method

.method private limitResponseSize(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 4
    .param p1, "json"    # Lorg/json/JSONArray;

    .prologue
    .line 214
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 215
    .local v1, "result":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/16 v3, 0x19

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 222
    return-object v1

    .line 217
    :cond_0
    :try_start_0
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 219
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method private showDialog(Lorg/json/JSONArray;)V
    .locals 5
    .param p1, "updateInfo"    # Lorg/json/JSONArray;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 284
    invoke-virtual {p0}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->getCachingEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 285
    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lnet/hockeyapp/android/utils/VersionCache;->setVersionInfo(Landroid/content/Context;Ljava/lang/String;)V

    .line 288
    :cond_0
    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 326
    :cond_1
    :goto_0
    return-void

    .line 292
    :cond_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 293
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    const/16 v2, 0x9

    invoke-static {v1, v2}, Lnet/hockeyapp/android/Strings;->get(Lnet/hockeyapp/android/StringListener;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 295
    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->mandatory:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_3

    .line 296
    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Lnet/hockeyapp/android/Strings;->get(Lnet/hockeyapp/android/StringListener;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 298
    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    const/16 v2, 0xb

    invoke-static {v1, v2}, Lnet/hockeyapp/android/Strings;->get(Lnet/hockeyapp/android/StringListener;I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lnet/hockeyapp/android/tasks/CheckUpdateTask$1;

    invoke-direct {v2, p0}, Lnet/hockeyapp/android/tasks/CheckUpdateTask$1;-><init>(Lnet/hockeyapp/android/tasks/CheckUpdateTask;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 304
    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    const/16 v2, 0xc

    invoke-static {v1, v2}, Lnet/hockeyapp/android/Strings;->get(Lnet/hockeyapp/android/StringListener;I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lnet/hockeyapp/android/tasks/CheckUpdateTask$2;

    invoke-direct {v2, p0, p1}, Lnet/hockeyapp/android/tasks/CheckUpdateTask$2;-><init>(Lnet/hockeyapp/android/tasks/CheckUpdateTask;Lorg/json/JSONArray;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 320
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 323
    :cond_3
    iget-object v1, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    const/16 v3, 0x8

    invoke-static {v2, v3}, Lnet/hockeyapp/android/Strings;->get(Lnet/hockeyapp/android/StringListener;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 324
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->startUpdateIntent(Lorg/json/JSONArray;Ljava/lang/Boolean;)V

    goto :goto_0
.end method

.method private showUpdateFragment(Lorg/json/JSONArray;)V
    .locals 11
    .param p1, "updateInfo"    # Lorg/json/JSONArray;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v10, 0x0

    .line 355
    iget-object v6, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    if-eqz v6, :cond_2

    .line 356
    iget-object v6, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    .line 357
    .local v3, "fragmentTransaction":Landroid/app/FragmentTransaction;
    const/16 v6, 0x1001

    invoke-virtual {v3, v6}, Landroid/app/FragmentTransaction;->setTransition(I)Landroid/app/FragmentTransaction;

    .line 359
    iget-object v6, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v6}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v6

    const-string v7, "hockey_update_dialog"

    invoke-virtual {v6, v7}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    .line 360
    .local v1, "existingFragment":Landroid/app/Fragment;
    if-eqz v1, :cond_0

    .line 361
    invoke-virtual {v3, v1}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 363
    :cond_0
    invoke-virtual {v3, v8}, Landroid/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 366
    const-class v2, Lnet/hockeyapp/android/UpdateFragment;

    .line 367
    .local v2, "fragmentClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lnet/hockeyapp/android/UpdateFragment;>;"
    iget-object v6, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    if-eqz v6, :cond_1

    .line 368
    iget-object v6, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    invoke-virtual {v6}, Lnet/hockeyapp/android/UpdateManagerListener;->getUpdateFragmentClass()Ljava/lang/Class;

    move-result-object v2

    .line 372
    :cond_1
    :try_start_0
    const-string v6, "newInstance"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Lorg/json/JSONArray;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-class v9, Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-virtual {v2, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 373
    .local v4, "method":Ljava/lang/reflect/Method;
    const/4 v6, 0x0

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    const-string v9, "apk"

    invoke-virtual {p0, v9}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->getURLString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v4, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/DialogFragment;

    .line 374
    .local v5, "updateFragment":Landroid/app/DialogFragment;
    const-string v6, "hockey_update_dialog"

    invoke-virtual {v5, v3, v6}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentTransaction;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 383
    .end local v1    # "existingFragment":Landroid/app/Fragment;
    .end local v2    # "fragmentClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lnet/hockeyapp/android/UpdateFragment;>;"
    .end local v3    # "fragmentTransaction":Landroid/app/FragmentTransaction;
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "updateFragment":Landroid/app/DialogFragment;
    :cond_2
    :goto_0
    return-void

    .line 376
    .restart local v1    # "existingFragment":Landroid/app/Fragment;
    .restart local v2    # "fragmentClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lnet/hockeyapp/android/UpdateFragment;>;"
    .restart local v3    # "fragmentTransaction":Landroid/app/FragmentTransaction;
    :catch_0
    move-exception v0

    .line 377
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "HockeyApp"

    const-string v7, "An exception happened while showing the update fragment:"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 379
    const-string v6, "HockeyApp"

    const-string v7, "Showing update activity instead."

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-direct {p0, p1, v6}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->startUpdateIntent(Lorg/json/JSONArray;Ljava/lang/Boolean;)V

    goto :goto_0
.end method

.method private startUpdateIntent(Lorg/json/JSONArray;Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "updateInfo"    # Lorg/json/JSONArray;
    .param p2, "finish"    # Ljava/lang/Boolean;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 330
    const/4 v0, 0x0

    .line 331
    .local v0, "activityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    if-eqz v2, :cond_0

    .line 332
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    invoke-virtual {v2}, Lnet/hockeyapp/android/UpdateManagerListener;->getUpdateActivityClass()Ljava/lang/Class;

    move-result-object v0

    .line 334
    :cond_0
    if-nez v0, :cond_1

    .line 335
    const-class v0, Lnet/hockeyapp/android/UpdateActivity;

    .line 338
    :cond_1
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    if-eqz v2, :cond_2

    .line 339
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 340
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 341
    const-string v2, "json"

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 342
    const-string v2, "url"

    const-string v3, "apk"

    invoke-virtual {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->getURLString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 343
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 345
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 346
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 350
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_2
    invoke-direct {p0}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->cleanUp()V

    .line 351
    return-void
.end method


# virtual methods
.method public attach(Ljava/lang/ref/WeakReference;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p1, "weakActivity":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    if-eqz p1, :cond_0

    .line 135
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 138
    :cond_0
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/Constants;->loadFromContext(Landroid/content/Context;)V

    .line 141
    :cond_1
    return-void
.end method

.method protected createConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 184
    .local v0, "connection":Ljava/net/URLConnection;
    const-string v1, "User-Agent"

    const-string v2, "HockeySDK/Android"

    invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    const-string v1, "Authorization"

    const-string v2, " FD 5F20D8F8-9411-45D7-ADAC-F186C5B3574C:72C6967910F6B3FD03DF0AAF9C692860409908D8AD8CCC9E"

    invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-gt v1, v2, :cond_0

    .line 188
    const-string v1, "connection"

    const-string v2, "close"

    invoke-virtual {v0, v1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    :cond_0
    return-object v0
.end method

.method public detach()V
    .locals 1

    .prologue
    .line 144
    const/4 v0, 0x0

    iput-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    .line 145
    return-void
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->doInBackground([Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 8
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 154
    :try_start_0
    invoke-virtual {p0}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->getVersionCode()I

    move-result v6

    .line 156
    .local v6, "versionCode":I
    new-instance v3, Lorg/json/JSONArray;

    iget-object v7, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-static {v7}, Lnet/hockeyapp/android/utils/VersionCache;->getVersionInfo(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 157
    .local v3, "json":Lorg/json/JSONArray;
    invoke-virtual {p0}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->getCachingEnabled()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-direct {p0, v3, v6}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->findNewVersion(Lorg/json/JSONArray;I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 179
    .end local v3    # "json":Lorg/json/JSONArray;
    .end local v6    # "versionCode":I
    :goto_0
    return-object v3

    .line 161
    .restart local v3    # "json":Lorg/json/JSONArray;
    .restart local v6    # "versionCode":I
    :cond_0
    new-instance v5, Ljava/net/URL;

    const-string v7, "json"

    invoke-virtual {p0, v7}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->getURLString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 162
    .local v5, "url":Ljava/net/URL;
    invoke-virtual {p0, v5}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->createConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    .line 163
    .local v0, "connection":Ljava/net/URLConnection;
    invoke-virtual {v0}, Ljava/net/URLConnection;->connect()V

    .line 165
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 166
    .local v2, "inputStream":Ljava/io/InputStream;
    invoke-static {v2}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v4

    .line 167
    .local v4, "jsonString":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 169
    new-instance v3, Lorg/json/JSONArray;

    .end local v3    # "json":Lorg/json/JSONArray;
    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 170
    .restart local v3    # "json":Lorg/json/JSONArray;
    invoke-direct {p0, v3, v6}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->findNewVersion(Lorg/json/JSONArray;I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 171
    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->limitResponseSize(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 172
    goto :goto_0

    .line 175
    .end local v0    # "connection":Ljava/net/URLConnection;
    .end local v2    # "inputStream":Ljava/io/InputStream;
    .end local v3    # "json":Lorg/json/JSONArray;
    .end local v4    # "jsonString":Ljava/lang/String;
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "versionCode":I
    :catch_0
    move-exception v1

    .line 176
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 179
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method protected getCachingEnabled()Z
    .locals 1

    .prologue
    .line 410
    const/4 v0, 0x1

    return v0
.end method

.method protected getURLString(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 248
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 249
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->urlString:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    const-string v2, "apps/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->appIdentifier:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "?format="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 255
    .local v1, "deviceIdentifier":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 256
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&udid="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "android_id"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->encodeParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    :cond_0
    const-string v2, "&os=Android"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&os_version="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lnet/hockeyapp/android/Constants;->ANDROID_VERSION:Ljava/lang/String;

    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->encodeParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&device="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lnet/hockeyapp/android/Constants;->PHONE_MODEL:Ljava/lang/String;

    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->encodeParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&oem="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lnet/hockeyapp/android/Constants;->PHONE_MANUFACTURER:Ljava/lang/String;

    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->encodeParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&app_version="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lnet/hockeyapp/android/Constants;->APP_VERSION:Ljava/lang/String;

    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->encodeParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&sdk="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "HockeySDK"

    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->encodeParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&sdk_version="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "3.0.1"

    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->encodeParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&lang="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->encodeParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "&usage_time="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v4, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->usageTime:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 251
    .end local v1    # "deviceIdentifier":Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method

.method protected getVersionCode()I
    .locals 1

    .prologue
    .line 148
    sget-object v0, Lnet/hockeyapp/android/Constants;->APP_VERSION:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lorg/json/JSONArray;

    invoke-virtual {p0, p1}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->onPostExecute(Lorg/json/JSONArray;)V

    return-void
.end method

.method protected onPostExecute(Lorg/json/JSONArray;)V
    .locals 1
    .param p1, "updateInfo"    # Lorg/json/JSONArray;

    .prologue
    .line 227
    if-eqz p1, :cond_2

    .line 228
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    invoke-virtual {v0}, Lnet/hockeyapp/android/UpdateManagerListener;->onUpdateAvailable()V

    .line 232
    :cond_0
    invoke-direct {p0, p1}, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->showDialog(Lorg/json/JSONArray;)V

    .line 239
    :cond_1
    :goto_0
    return-void

    .line 235
    :cond_2
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    if-eqz v0, :cond_1

    .line 236
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/CheckUpdateTask;->listener:Lnet/hockeyapp/android/UpdateManagerListener;

    invoke-virtual {v0}, Lnet/hockeyapp/android/UpdateManagerListener;->onNoUpdateAvailable()V

    goto :goto_0
.end method
