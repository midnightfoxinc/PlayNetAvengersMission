.class Lcom/disney/id/android/lightboxinteraction/DIDNullWebViewBridgeOwner;
.super Ljava/lang/Object;
.source "DIDNullWebViewBridgeOwner.java"

# interfaces
.implements Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public externalLogin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "options"    # Ljava/lang/String;

    .prologue
    .line 60
    return-void
.end method

.method public onCloseWindow()V
    .locals 0

    .prologue
    .line 30
    return-void
.end method

.method public onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "isDialog"    # Z
    .param p3, "isUserGesture"    # Z
    .param p4, "resultMsg"    # Landroid/os/Message;

    .prologue
    .line 34
    const/4 v0, 0x0

    return v0
.end method

.method public onFinish(Lcom/disney/id/android/DIDResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 45
    return-void
.end method

.method public onPageStarted()V
    .locals 0

    .prologue
    .line 15
    return-void
.end method

.method public onProgressChanged(I)V
    .locals 0
    .param p1, "newProgress"    # I

    .prologue
    .line 20
    return-void
.end method

.method public onReady()V
    .locals 0

    .prologue
    .line 25
    return-void
.end method

.method public onResponse(Lcom/disney/id/android/DIDResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 40
    return-void
.end method

.method public showClose(ZZ)V
    .locals 0
    .param p1, "showCloseButton"    # Z
    .param p2, "stopCloseEvent"    # Z

    .prologue
    .line 55
    return-void
.end method

.method public showLoader(Z)V
    .locals 0
    .param p1, "show"    # Z

    .prologue
    .line 50
    return-void
.end method
