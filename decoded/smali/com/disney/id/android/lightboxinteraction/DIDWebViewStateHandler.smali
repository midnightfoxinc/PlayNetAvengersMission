.class public Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;
.super Landroid/os/Handler;
.source "DIDWebViewStateHandler.java"


# static fields
.field public static final MSG_DISMISS_PROGRESS:I = 0x14

.field public static final MSG_ON_PROGRESS:I = 0x17

.field public static final MSG_REMOVE_TOP_WEB_VIEW:I = 0x12

.field public static final MSG_RESET_PROGRESS:I = 0x8

.field public static final MSG_RESTORE_WEB_VIEW:I = 0x10

.field public static final MSG_SET_NAVIGATION:I = 0x15

.field public static final MSG_SHOW_PROGRESS:I = 0x13

.field public static final MSG_SHOW_TOP_WEB_VIEW:I = 0x11

.field public static final MSG_START_PROGRESS:I = 0x9


# instance fields
.field private contextRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

.field private progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

.field private webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 32
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->contextRef:Ljava/lang/ref/WeakReference;

    .line 33
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 49
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 103
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 51
    :pswitch_1
    const-string v1, "PRELOAD_INFO"

    const-string v2, "About to handle showProgress()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->startProgress()V

    goto :goto_0

    .line 56
    :pswitch_2
    const-string v1, "PRELOAD_INFO"

    const-string v2, "About to handle dismissProgress()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->stopProgress()V

    goto :goto_0

    .line 61
    :pswitch_3
    const-string v1, "PRELOAD_INFO"

    const-string v2, "About to handle resetProgress()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->stopProgress()V

    .line 63
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->setTopWebViewState(I)V

    goto :goto_0

    .line 67
    :pswitch_4
    const-string v1, "PRELOAD_INFO"

    const-string v2, "About to handle startProgress()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->startProgress()V

    .line 69
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->setTopWebViewState(I)V

    goto :goto_0

    .line 73
    :pswitch_5
    const-string v1, "PRELOAD"

    const-string v2, "About to handle onProgress()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->onProgress(I)V

    goto :goto_0

    .line 78
    :pswitch_6
    const-string v1, "PRELOAD_INFO"

    const-string v2, "About to handle setNavigationUI()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 81
    .local v0, "shouldShowCloseButton":Z
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->contextRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v2, v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->setNavigationUI(Landroid/content/Context;Z)V

    goto :goto_0

    .line 85
    .end local v0    # "shouldShowCloseButton":Z
    :pswitch_7
    const-string v1, "PRELOAD_INFO"

    const-string v2, "About to handle restoreWebView()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->restoreWebView(Landroid/view/View;)V

    goto :goto_0

    .line 90
    :pswitch_8
    const-string v1, "PRELOAD_INFO"

    const-string v2, "About to handle showTopWebView()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->startProgress()V

    .line 92
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->hideAll()V

    goto/16 :goto_0

    .line 96
    :pswitch_9
    const-string v1, "PRELOAD_INFO"

    const-string v2, "About to handle removeTopWebView()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->peek()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 98
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->stopProgress()V

    .line 99
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->pop()V

    goto/16 :goto_0

    .line 49
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_1
        :pswitch_2
        :pswitch_6
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method public setLightBoxInteraction(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)V
    .locals 0
    .param p1, "lightBoxInteraction"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .line 37
    return-void
.end method

.method public setProgressTracking(Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;)V
    .locals 0
    .param p1, "progressTracking"    # Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    .line 45
    return-void
.end method

.method public setWebViewGroup(Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;)V
    .locals 0
    .param p1, "webViewGroup"    # Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    .line 41
    return-void
.end method
