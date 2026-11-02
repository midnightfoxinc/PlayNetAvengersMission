.class Lcom/disney/id/android/lightboxinteraction/DIDWebView$4;
.super Ljava/lang/Object;
.source "DIDWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/lightboxinteraction/DIDWebView;->load(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

.field final synthetic val$data:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDWebView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 188
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$4;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    iput-object p2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$4;->val$data:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$4;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->access$400(Lcom/disney/id/android/lightboxinteraction/DIDWebView;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebView$4;->val$data:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 192
    return-void
.end method
