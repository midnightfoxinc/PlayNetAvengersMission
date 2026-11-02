.class Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;
.super Landroid/webkit/WebViewClient;
.source "DIDWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/lightboxinteraction/DIDWebView;->createWebViewClient(Landroid/content/Context;)Landroid/webkit/WebViewClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "WebViewClient"


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 116
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    iput-object p2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 135
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageFinished() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const-string v0, "WebViewClient"

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageFinished() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$202(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Z)Z

    .line 138
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$300(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;->onPageFinished(Ljava/lang/String;)V

    .line 139
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "facIcon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$202(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Z)Z

    .line 130
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$300(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;->onPageStarted(Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 143
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceivedError(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with failing URL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    const-string v0, "WebViewClient"

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceivedError(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " failingUrl: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$202(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Z)Z

    .line 147
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$300(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;->onReceivedError(I)V

    .line 148
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 121
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "shouldOverrideUrlLoading() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    const-string v0, "WebViewClient"

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "shouldOverrideUrlLoading() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$2;->val$context:Landroid/content/Context;

    invoke-static {v0, p2}, Lcom/disney/id/android/DIDWebUtils;->externalTargetUrl(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
