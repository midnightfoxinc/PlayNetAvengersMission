.class public Lcom/disneymobile/mocha/support/Support;
.super Ljava/lang/Object;
.source "Support.java"


# static fields
.field public static final ADS_ENABLED:Z = true

.field public static final AIRMAIL_APP_KEY:Ljava/lang/String; = "siFnLAaYTtibL8JkxH86KQ"

.field public static final DEBUG_CONNECTION:Z = false

.field public static final DEBUG_NSURL_CONNECTION:Z = false

.field public static final DEBUG_RESPONSES:Z = false

.field public static final DEBUG_TO_FILE:Z = false

.field public static final DMO_USE_ANALYTICS_DEBUG_FLAG:Z = false

.field public static final SHOW_SPONSOR:Z = true

.field public static final USE_DEVELOPER_OPTIONS:Z = true

.field public static final USE_DEV_SDCARD_FOR_INTERNAL_STORAGE:Z

.field public static final USE_DEV_SELECTOR_VALIDATION:Z

.field private static context:Landroid/content/Context;

.field public static prefs_proxy_host:Ljava/lang/String;

.field public static prefs_proxy_port:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/disneymobile/mocha/support/Support;->prefs_proxy_host:Ljava/lang/String;

    .line 14
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/mocha/support/Support;->prefs_proxy_port:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAssetsFalseDir()Ljava/lang/String;
    .locals 3

    .prologue
    .line 73
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    sget-object v2, Lcom/disneymobile/mocha/support/Support;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageResourcePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "assets"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/disneymobile/mocha/support/PathUtils;->combine([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/disneymobile/mocha/support/Support;->context:Landroid/content/Context;

    return-object v0
.end method

.method public static getExternalCacheDir(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "subfolder"    # Ljava/lang/String;

    .prologue
    .line 69
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getExternalDir()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "cache"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    aput-object p0, v0, v1

    invoke-static {v0}, Lcom/disneymobile/mocha/support/PathUtils;->combine([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getExternalDir()Ljava/lang/String;
    .locals 3

    .prologue
    .line 61
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Android/data"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/disneymobile/mocha/support/Support;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/disneymobile/mocha/support/PathUtils;->combine([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getExternalFilesDir()Ljava/lang/String;
    .locals 3

    .prologue
    .line 65
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getExternalDir()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "files"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/disneymobile/mocha/support/PathUtils;->combine([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInternalCacheDir(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "subfolder"    # Ljava/lang/String;

    .prologue
    .line 57
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    sget-object v2, Lcom/disneymobile/mocha/support/Support;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p0, v0, v1

    invoke-static {v0}, Lcom/disneymobile/mocha/support/PathUtils;->combine([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInternalFilesDir()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/disneymobile/mocha/support/Support;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getProxyHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/disneymobile/mocha/support/Support;->prefs_proxy_host:Ljava/lang/String;

    return-object v0
.end method

.method public static getProxyPort()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/disneymobile/mocha/support/Support;->prefs_proxy_port:Ljava/lang/Integer;

    return-object v0
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0
    .param p0, "aContext"    # Landroid/content/Context;

    .prologue
    .line 18
    sput-object p0, Lcom/disneymobile/mocha/support/Support;->context:Landroid/content/Context;

    .line 19
    return-void
.end method

.method public static setProxyHost(Ljava/lang/String;)V
    .locals 0
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 34
    sput-object p0, Lcom/disneymobile/mocha/support/Support;->prefs_proxy_host:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public static setProxyPort(Ljava/lang/Integer;)V
    .locals 0
    .param p0, "port"    # Ljava/lang/Integer;

    .prologue
    .line 42
    sput-object p0, Lcom/disneymobile/mocha/support/Support;->prefs_proxy_port:Ljava/lang/Integer;

    .line 43
    return-void
.end method

.method public static useProxy()Z
    .locals 1

    .prologue
    .line 26
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getProxyHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getProxyPort()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public openFile(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getAssetsFalseDir()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "assetsFalseDir":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    sget-object v1, Lcom/disneymobile/mocha/support/Support;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 81
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method
