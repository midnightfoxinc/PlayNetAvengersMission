.class Lcom/disney/id/android/lightboxinteraction/DIDWebView;
.super Ljava/lang/Object;
.source "DIDWebView.java"

# interfaces
.implements Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private coordination:Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;

.field private isLoading:Z

.field private final pageLoadingHandler:Landroid/os/Handler;

.field private final storedUrls:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private webView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "coordination"    # Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi",
            "AddJavascriptInterface"
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-class v1, Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->TAG:Ljava/lang/String;

    .line 28
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->pageLoadingHandler:Landroid/os/Handler;

    .line 29
    new-instance v1, Ljava/util/Stack;

    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    iput-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->storedUrls:Ljava/util/Stack;

    .line 30
    iput-boolean v3, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->isLoading:Z

    .line 41
    iput-object p2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;

    .line 42
    new-instance v1, Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;

    invoke-direct {v1, p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    .line 60
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-direct {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->createWebViewClient(Landroid/content/Context;)Landroid/webkit/WebViewClient;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 61
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 62
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 63
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 65
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-le v1, v2, :cond_0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_0

    .line 69
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 72
    :cond_0
    invoke-direct {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->setWebViewSettings(Landroid/content/Context;)V

    .line 73
    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Ljava/util/Stack;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->storedUrls:Ljava/util/Stack;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDWebView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->loadURL(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDWebView;
    .param p1, "x1"    # Z

    .prologue
    .line 24
    iput-boolean p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->isLoading:Z

    return p1
.end method

.method static synthetic access$300(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;

    return-object v0
.end method

.method static synthetic access$400(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method private createWebViewClient(Landroid/content/Context;)Landroid/webkit/WebViewClient;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 116
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;

    invoke-direct {v0, p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Landroid/content/Context;)V

    return-object v0
.end method

.method private load(Ljava/lang/String;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 188
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->pageLoadingHandler:Landroid/os/Handler;

    new-instance v1, Lcom/disney/id/android/lightboxinteraction/DIDWebView$4;

    invoke-direct {v1, p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView$4;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 194
    return-void
.end method

.method private loadURL(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 183
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadURL(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    invoke-direct {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->load(Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method private setWebViewSettings(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi",
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/16 v7, 0x13

    const/16 v6, 0x12

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 81
    const-string v1, "PRELOAD_INFO"

    const-string v2, "setWebViewSettings() called"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 83
    .local v0, "ws":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 84
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 85
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 86
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 87
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 88
    invoke-static {p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;->getCacheBaseDir(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 90
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v1, v6, :cond_0

    .line 91
    const-wide/32 v2, 0x500000

    invoke-virtual {v0, v2, v3}, Landroid/webkit/WebSettings;->setAppCacheMaxSize(J)V

    .line 94
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v1, v7, :cond_1

    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/databases/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    .line 98
    :cond_1
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 99
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 100
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 101
    invoke-virtual {v0, v5}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 102
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v1, v6, :cond_2

    .line 103
    invoke-virtual {v0, v5}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 104
    :cond_2
    invoke-virtual {v0, v5}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 105
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v7, :cond_3

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getDebug()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 107
    invoke-static {v4}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

    .line 109
    :cond_3
    return-void
.end method


# virtual methods
.method addJavascriptInterface(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;)V
    .locals 1
    .param p1, "jsInterface"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p2, "interfaceName"    # Ljava/lang/String;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method attemptUrlStore(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->storedUrls:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->storedUrls:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->storedUrls:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    :cond_1
    return-void
.end method

.method cleanUp(Ljava/lang/String;)V
    .locals 1
    .param p1, "jsInterfaceName"    # Ljava/lang/String;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 210
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    .line 211
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->removeAllViews()V

    .line 212
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 213
    return-void
.end method

.method getWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method isLoading()Z
    .locals 1

    .prologue
    .line 205
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->isLoading:Z

    return v0
.end method

.method public loadJS(Ljava/lang/String;)V
    .locals 3
    .param p1, "js"    # Ljava/lang/String;

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 165
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadJS(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    invoke-direct {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->load(Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method loadPageFromExistingData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "baseURL"    # Ljava/lang/String;
    .param p2, "existingPage"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->pageLoadingHandler:Landroid/os/Handler;

    new-instance v1, Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 180
    return-void
.end method

.method reuseExistingPage()V
    .locals 1

    .prologue
    .line 170
    const-string v0, "didNativeToWeb.sync().then(didWebToNative.bridgeReady());"

    invoke-virtual {p0, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->loadJS(Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method stopLoading()V
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 198
    return-void
.end method

.method updateCallback(Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;)V
    .locals 2
    .param p1, "callback"    # Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;

    invoke-direct {v1, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 154
    return-void
.end method
