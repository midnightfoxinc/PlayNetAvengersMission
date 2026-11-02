.class Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;
.super Ljava/lang/Object;
.source "DIDWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/lightboxinteraction/DIDWebView;->loadPageFromExistingData(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

.field final synthetic val$baseURL:Ljava/lang/String;

.field final synthetic val$existingPage:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 174
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    iput-object p2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;->val$baseURL:Ljava/lang/String;

    iput-object p3, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;->val$existingPage:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 177
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$400(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;->val$baseURL:Ljava/lang/String;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$3;->val$existingPage:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "UTF-8"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    return-void
.end method
