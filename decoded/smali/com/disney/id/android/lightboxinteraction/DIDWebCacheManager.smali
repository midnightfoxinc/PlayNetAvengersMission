.class public final Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;
.super Ljava/lang/Object;
.source "DIDWebCacheManager.java"


# static fields
.field public static final CACHE_MAX_SIZE:J = 0x500000L

.field private static final CACHE_TTL:J = 0xea60L

.field private static final DID_CACHE_DIR:Ljava/lang/String; = "/DisneyID"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static clearCacheFolder(Ljava/io/File;J)I
    .locals 11
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "ttl"    # J

    .prologue
    .line 47
    const/4 v2, 0x0

    .line 48
    .local v2, "deletedFiles":I
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 50
    :try_start_0
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v6, v8, p1

    .line 51
    .local v6, "ttlMod":J
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v1, v0, v3

    .line 53
    .local v1, "child":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 54
    invoke-static {v1, p1, p2}, Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;->clearCacheFolder(Ljava/io/File;J)I

    move-result v5

    add-int/2addr v2, v5

    .line 56
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    cmp-long v5, v8, v6

    if-gez v5, :cond_1

    .line 57
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_1

    .line 58
    add-int/lit8 v2, v2, 0x1

    .line 51
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 62
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "child":Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "ttlMod":J
    :catch_0
    move-exception v5

    .line 64
    :cond_2
    return v2
.end method

.method private static createCacheDirectory(Ljava/io/File;)Z
    .locals 1
    .param p0, "cacheDir"    # Ljava/io/File;

    .prologue
    .line 43
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getCacheBaseDir(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/DisneyID"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static setCache(Landroid/content/Context;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    if-nez p0, :cond_1

    .line 35
    :cond_0
    :goto_0
    return-void

    .line 19
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;->getCacheBaseDir(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 20
    .local v0, "cacheDir":Ljava/io/File;
    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;->createCacheDirectory(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 21
    const-wide/32 v4, 0xea60

    invoke-static {v0, v4, v5}, Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;->clearCacheFolder(Ljava/io/File;J)I

    move-result v1

    .line 22
    .local v1, "numDeletedFiles":I
    if-lez v1, :cond_0

    .line 24
    :try_start_0
    new-instance v2, Landroid/webkit/WebView;

    invoke-direct {v2, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 25
    .local v2, "webView":Landroid/webkit/WebView;
    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    .line 26
    .local v3, "ws":Landroid/webkit/WebSettings;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 27
    invoke-static {p0}, Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;->getCacheBaseDir(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 28
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 29
    invoke-virtual {v2}, Landroid/webkit/WebView;->destroy()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 30
    .end local v2    # "webView":Landroid/webkit/WebView;
    .end local v3    # "ws":Landroid/webkit/WebSettings;
    :catch_0
    move-exception v4

    goto :goto_0
.end method
