.class public Lcom/disney/id/android/volley/VolleyManager;
.super Ljava/lang/Object;
.source "VolleyManager.java"


# static fields
.field private static final DEFAULT_NETWORK_THREAD_POOL_SIZE:I = 0x4

.field private static final TAG:Ljava/lang/String;

.field private static mContext:Landroid/content/Context;

.field private static mInstance:Lcom/disney/id/android/volley/VolleyManager;


# instance fields
.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/disney/id/android/volley/VolleyManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/volley/VolleyManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/volley/VolleyManager;->mContext:Landroid/content/Context;

    .line 36
    invoke-virtual {p0}, Lcom/disney/id/android/volley/VolleyManager;->getRequestQueue()Lcom/disney/id/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/volley/VolleyManager;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    .line 37
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/disney/id/android/volley/VolleyManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    const-class v1, Lcom/disney/id/android/volley/VolleyManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/disney/id/android/volley/VolleyManager;->mInstance:Lcom/disney/id/android/volley/VolleyManager;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/disney/id/android/volley/VolleyManager;

    invoke-direct {v0, p0}, Lcom/disney/id/android/volley/VolleyManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/disney/id/android/volley/VolleyManager;->mInstance:Lcom/disney/id/android/volley/VolleyManager;

    .line 43
    :cond_0
    sget-object v0, Lcom/disney/id/android/volley/VolleyManager;->mInstance:Lcom/disney/id/android/volley/VolleyManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 40
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addToRequestQueue(Lcom/disney/id/android/volley/Request;Ljava/lang/String;)V
    .locals 3
    .param p2, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/disney/id/android/volley/Request",
            "<TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, "req":Lcom/disney/id/android/volley/Request;, "Lcom/disney/id/android/volley/Request<TT;>;"
    if-eqz p1, :cond_1

    .line 84
    sget-object v0, Lcom/disney/id/android/volley/VolleyManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    invoke-static {p2}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p2, Lcom/disney/id/android/volley/VolleyManager;->TAG:Ljava/lang/String;

    .end local p2    # "tag":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1, p2}, Lcom/disney/id/android/volley/Request;->setTag(Ljava/lang/Object;)Lcom/disney/id/android/volley/Request;

    .line 89
    invoke-virtual {p0}, Lcom/disney/id/android/volley/VolleyManager;->getRequestQueue()Lcom/disney/id/android/volley/RequestQueue;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/id/android/volley/RequestQueue;->add(Lcom/disney/id/android/volley/Request;)Lcom/disney/id/android/volley/Request;

    .line 91
    :cond_1
    return-void
.end method

.method public cancelPendingRequests(Ljava/lang/Object;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/disney/id/android/volley/VolleyManager;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/disney/id/android/volley/VolleyManager;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 97
    :cond_0
    return-void
.end method

.method public getRequestQueue()Lcom/disney/id/android/volley/RequestQueue;
    .locals 11

    .prologue
    .line 47
    iget-object v8, p0, Lcom/disney/id/android/volley/VolleyManager;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    if-nez v8, :cond_0

    .line 48
    new-instance v0, Ljava/io/File;

    sget-object v8, Lcom/disney/id/android/volley/VolleyManager;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;->getCacheBaseDir(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .local v0, "cacheDir":Ljava/io/File;
    const-string v7, "volley/0"

    .line 52
    .local v7, "userAgent":Ljava/lang/String;
    :try_start_0
    sget-object v8, Lcom/disney/id/android/volley/VolleyManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 53
    .local v4, "packageName":Ljava/lang/String;
    sget-object v8, Lcom/disney/id/android/volley/VolleyManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v4, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 54
    .local v2, "info":Landroid/content/pm/PackageInfo;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 59
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    .end local v4    # "packageName":Ljava/lang/String;
    :goto_0
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x9

    if-lt v8, v9, :cond_1

    .line 60
    new-instance v6, Lcom/disney/id/android/volley/toolbox/HurlStack;

    invoke-direct {v6}, Lcom/disney/id/android/volley/toolbox/HurlStack;-><init>()V

    .line 67
    .local v6, "stack":Lcom/disney/id/android/volley/toolbox/HttpStack;
    :goto_1
    new-instance v3, Lcom/disney/id/android/volley/DIDNetwork;

    sget-object v8, Lcom/disney/id/android/volley/VolleyManager;->mContext:Landroid/content/Context;

    invoke-direct {v3, v6, v8}, Lcom/disney/id/android/volley/DIDNetwork;-><init>(Lcom/disney/id/android/volley/toolbox/HttpStack;Landroid/content/Context;)V

    .line 69
    .local v3, "network":Lcom/disney/id/android/volley/Network;
    new-instance v8, Landroid/os/HandlerThread;

    sget-object v9, Lcom/disney/id/android/volley/VolleyManager;->TAG:Ljava/lang/String;

    const/16 v10, 0xa

    invoke-direct {v8, v9, v10}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v8, p0, Lcom/disney/id/android/volley/VolleyManager;->mHandlerThread:Landroid/os/HandlerThread;

    .line 70
    iget-object v8, p0, Lcom/disney/id/android/volley/VolleyManager;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v8}, Landroid/os/HandlerThread;->start()V

    .line 72
    new-instance v1, Lcom/disney/id/android/volley/ExecutorDelivery;

    new-instance v8, Landroid/os/Handler;

    iget-object v9, p0, Lcom/disney/id/android/volley/VolleyManager;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v9}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v1, v8}, Lcom/disney/id/android/volley/ExecutorDelivery;-><init>(Landroid/os/Handler;)V

    .line 73
    .local v1, "delivery":Lcom/disney/id/android/volley/ResponseDelivery;
    new-instance v5, Lcom/disney/id/android/volley/RequestQueue;

    new-instance v8, Lcom/disney/id/android/volley/toolbox/DiskBasedCache;

    invoke-direct {v8, v0}, Lcom/disney/id/android/volley/toolbox/DiskBasedCache;-><init>(Ljava/io/File;)V

    const/4 v9, 0x4

    invoke-direct {v5, v8, v3, v9, v1}, Lcom/disney/id/android/volley/RequestQueue;-><init>(Lcom/disney/id/android/volley/Cache;Lcom/disney/id/android/volley/Network;ILcom/disney/id/android/volley/ResponseDelivery;)V

    .line 75
    .local v5, "queue":Lcom/disney/id/android/volley/RequestQueue;
    invoke-virtual {v5}, Lcom/disney/id/android/volley/RequestQueue;->start()V

    .line 77
    iput-object v5, p0, Lcom/disney/id/android/volley/VolleyManager;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    .line 79
    .end local v0    # "cacheDir":Ljava/io/File;
    .end local v1    # "delivery":Lcom/disney/id/android/volley/ResponseDelivery;
    .end local v3    # "network":Lcom/disney/id/android/volley/Network;
    .end local v5    # "queue":Lcom/disney/id/android/volley/RequestQueue;
    .end local v6    # "stack":Lcom/disney/id/android/volley/toolbox/HttpStack;
    .end local v7    # "userAgent":Ljava/lang/String;
    :cond_0
    iget-object v8, p0, Lcom/disney/id/android/volley/VolleyManager;->mRequestQueue:Lcom/disney/id/android/volley/RequestQueue;

    return-object v8

    .line 64
    .restart local v0    # "cacheDir":Ljava/io/File;
    .restart local v7    # "userAgent":Ljava/lang/String;
    :cond_1
    new-instance v6, Lcom/disney/id/android/volley/toolbox/HttpClientStack;

    invoke-static {v7}, Landroid/net/http/AndroidHttpClient;->newInstance(Ljava/lang/String;)Landroid/net/http/AndroidHttpClient;

    move-result-object v8

    invoke-direct {v6, v8}, Lcom/disney/id/android/volley/toolbox/HttpClientStack;-><init>(Lorg/apache/http/client/HttpClient;)V

    .restart local v6    # "stack":Lcom/disney/id/android/volley/toolbox/HttpStack;
    goto :goto_1

    .line 55
    .end local v6    # "stack":Lcom/disney/id/android/volley/toolbox/HttpStack;
    :catch_0
    move-exception v8

    goto :goto_0
.end method
