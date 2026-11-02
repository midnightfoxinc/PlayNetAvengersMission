.class final Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "DIDWebChromeClient.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private callback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;)V
    .locals 0
    .param p1, "webViewBridgeOwner"    # Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;->callback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    .line 22
    return-void
.end method


# virtual methods
.method public onCloseWindow(Landroid/webkit/WebView;)V
    .locals 2
    .param p1, "window"    # Landroid/webkit/WebView;

    .prologue
    .line 48
    const-string v0, "PRELOAD_INFO"

    const-string v1, "onCloseWindow() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onCloseWindow()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;->callback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    invoke-interface {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onCloseWindow()V

    .line 52
    return-void
.end method

.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 3
    .param p1, "cm"    # Landroid/webkit/ConsoleMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 39
    const-string v0, "PRELOAD_INFO"

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->messageLevel()Landroid/webkit/ConsoleMessage$MessageLevel;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/ConsoleMessage$MessageLevel;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -- From line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->lineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->sourceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    const/4 v0, 0x1

    return v0
.end method

.method public onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "isDialog"    # Z
    .param p3, "isUserGesture"    # Z
    .param p4, "resultMsg"    # Landroid/os/Message;

    .prologue
    .line 57
    const-string v0, "PRELOAD_INFO"

    const-string v1, "onCreateWindow() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onCreateWindow()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;->callback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z

    .line 60
    const/4 v0, 0x1

    return v0
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "result"    # Landroid/webkit/JsResult;

    .prologue
    .line 27
    const-string v0, "PRELOAD_INFO"

    const-string v1, "onJsAlert() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    const/4 v0, 0x1

    return v0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 33
    const-string v0, "PRELOAD_INFO"

    const-string v1, "onProgressChanged() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebChromeClient;->callback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    invoke-interface {v0, p2}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onProgressChanged(I)V

    .line 35
    return-void
.end method
