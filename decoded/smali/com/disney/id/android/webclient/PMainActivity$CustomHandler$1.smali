.class Lcom/disney/id/android/webclient/PMainActivity$CustomHandler$1;
.super Ljava/lang/Object;
.source "PMainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;

.field final synthetic val$activity:Lcom/disney/id/android/webclient/PMainActivity;


# direct methods
.method constructor <init>(Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;Lcom/disney/id/android/webclient/PMainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler$1;->this$0:Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;

    iput-object p2, p0, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler$1;->val$activity:Lcom/disney/id/android/webclient/PMainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 103
    invoke-static {}, Lcom/disney/id/android/webclient/PMainActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onDestroy after half second"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    iget-object v0, p0, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler$1;->val$activity:Lcom/disney/id/android/webclient/PMainActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/webclient/PMainActivity;->setResult(I)V

    .line 105
    iget-object v0, p0, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler$1;->val$activity:Lcom/disney/id/android/webclient/PMainActivity;

    invoke-virtual {v0}, Lcom/disney/id/android/webclient/PMainActivity;->finish()V

    .line 106
    return-void
.end method
