.class Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;
.super Landroid/os/Handler;
.source "PMainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/webclient/PMainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CustomHandler"
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/disney/id/android/webclient/PMainActivity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/disney/id/android/webclient/PMainActivity;)V
    .locals 1
    .param p1, "activity"    # Lcom/disney/id/android/webclient/PMainActivity;

    .prologue
    .line 72
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 73
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;->mActivity:Ljava/lang/ref/WeakReference;

    .line 74
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 78
    iget-object v1, p0, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/webclient/PMainActivity;

    .line 80
    .local v0, "activity":Lcom/disney/id/android/webclient/PMainActivity;
    invoke-static {}, Lcom/disney/id/android/webclient/PMainActivity;->access$000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EMT message: ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    if-eqz v0, :cond_0

    .line 83
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 101
    :cond_0
    :goto_0
    :pswitch_0
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler$1;

    invoke-direct {v2, p0, v0}, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler$1;-><init>(Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;Lcom/disney/id/android/webclient/PMainActivity;)V

    const-wide/16 v4, 0x1f4

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 108
    return-void

    .line 88
    :pswitch_1
    invoke-static {v0}, Lcom/disney/id/android/webclient/PMainActivity;->access$100(Lcom/disney/id/android/webclient/PMainActivity;)V

    .line 89
    invoke-static {v0}, Lcom/disney/id/android/webclient/PMainActivity;->access$200(Lcom/disney/id/android/webclient/PMainActivity;)V

    goto :goto_0

    .line 93
    :pswitch_2
    invoke-static {v0}, Lcom/disney/id/android/webclient/PMainActivity;->access$200(Lcom/disney/id/android/webclient/PMainActivity;)V

    goto :goto_0

    .line 96
    :pswitch_3
    invoke-static {v0}, Lcom/disney/id/android/webclient/PMainActivity;->access$100(Lcom/disney/id/android/webclient/PMainActivity;)V

    goto :goto_0

    .line 83
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
