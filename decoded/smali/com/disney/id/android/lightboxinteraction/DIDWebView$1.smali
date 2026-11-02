.class Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;
.super Landroid/webkit/WebView;
.source "DIDWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/lightboxinteraction/DIDWebView;-><init>(Landroid/content/Context;Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;


# direct methods
.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Landroid/content/Context;)V
    .locals 0
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-direct {p0, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public canGoBack()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 56
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$000(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Ljava/util/Stack;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-le v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public goBack()V
    .locals 2

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$000(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 48
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$000(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/util/EmptyStackException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    :cond_0
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    goto :goto_0
.end method
