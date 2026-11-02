.class Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;
.super Ljava/lang/Object;
.source "DIDWebViewGroup.java"


# instance fields
.field private webViewGroup:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;)V
    .locals 3
    .param p1, "webViewGroup"    # Landroid/widget/LinearLayout;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    .line 21
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-le v0, v1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 23
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->setLayerType(ILandroid/graphics/Paint;)V

    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method clearViews()V
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 80
    return-void
.end method

.method count()I
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    return v0
.end method

.method hideAll()V
    .locals 4

    .prologue
    .line 67
    const-string v2, "PRELOAD_INFO"

    const-string v3, "hiding all webviews"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    if-nez v2, :cond_1

    .line 76
    :cond_0
    return-void

    .line 72
    :cond_1
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    .line 73
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 74
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method peek()Landroid/view/View;
    .locals 2

    .prologue
    .line 28
    const-string v0, "PRELOAD_INFO"

    const-string v1, "top web view being looked at."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    .line 30
    const/4 v0, 0x0

    .line 33
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0
.end method

.method pop()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 46
    const-string v0, "PRELOAD_INFO"

    const-string v1, "popping a webview"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    .line 53
    :goto_0
    return-void

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    .line 52
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method push(Landroid/view/View;)V
    .locals 2
    .param p1, "webView"    # Landroid/view/View;

    .prologue
    .line 37
    const-string v0, "PRELOAD_INFO"

    const-string v1, "pushing web view."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    .line 43
    :goto_0
    return-void

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    goto :goto_0
.end method

.method restoreWebView(Landroid/view/View;)V
    .locals 2
    .param p1, "webView"    # Landroid/view/View;

    .prologue
    .line 56
    const-string v0, "PRELOAD_INFO"

    const-string v1, "restoring a webview"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    .line 64
    :goto_0
    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 62
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 63
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->invalidate()V

    goto :goto_0
.end method

.method setNavigationUI(Landroid/content/Context;Z)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "showCloseButton"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v5, 0x10

    const/4 v2, 0x0

    .line 100
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_0

    invoke-static {p1}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 101
    iget-object v3, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getSystemUiVisibility()I

    move-result v3

    and-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_1

    const/4 v1, 0x1

    .line 104
    .local v1, "visible":Z
    :goto_0
    if-nez v1, :cond_3

    if-eqz p2, :cond_3

    .line 105
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v5, :cond_2

    .line 106
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    const/16 v3, 0x100

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setSystemUiVisibility(I)V

    .line 121
    .end local v1    # "visible":Z
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v1, v2

    .line 101
    goto :goto_0

    .line 108
    .restart local v1    # "visible":Z
    :cond_2
    iget-object v3, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setSystemUiVisibility(I)V

    goto :goto_1

    .line 110
    :cond_3
    if-eqz v1, :cond_0

    if-nez p2, :cond_0

    .line 111
    const/4 v0, 0x2

    .line 112
    .local v0, "newUiOptions":I
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v5, :cond_4

    .line 113
    or-int/lit16 v0, v0, 0x100

    .line 115
    :cond_4
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_5

    .line 116
    or-int/lit16 v0, v0, 0x800

    .line 118
    :cond_5
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setSystemUiVisibility(I)V

    goto :goto_1
.end method

.method setTopWebViewState(I)V
    .locals 3
    .param p1, "webViewState"    # I

    .prologue
    .line 83
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    if-nez v1, :cond_1

    .line 92
    :cond_0
    :goto_0
    return-void

    .line 87
    :cond_1
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 88
    .local v0, "topWebView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 90
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->webViewGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method
