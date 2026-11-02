.class public Lnet/hockeyapp/android/tasks/ParseFeedbackTask;
.super Landroid/os/AsyncTask;
.source "ParseFeedbackTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lnet/hockeyapp/android/objects/FeedbackResponse;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private feedbackResponse:Ljava/lang/String;

.field private handler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "feedbackResponse"    # Ljava/lang/String;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 22
    iput-object p1, p0, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->context:Landroid/content/Context;

    .line 23
    iput-object p2, p0, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->feedbackResponse:Ljava/lang/String;

    .line 24
    iput-object p3, p0, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->handler:Landroid/os/Handler;

    .line 25
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->doInBackground([Ljava/lang/Void;)Lnet/hockeyapp/android/objects/FeedbackResponse;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Lnet/hockeyapp/android/objects/FeedbackResponse;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 29
    iget-object v0, p0, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->context:Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->feedbackResponse:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 30
    invoke-static {}, Lnet/hockeyapp/android/utils/FeedbackParser;->getInstance()Lnet/hockeyapp/android/utils/FeedbackParser;

    move-result-object v0

    iget-object v1, p0, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->feedbackResponse:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lnet/hockeyapp/android/utils/FeedbackParser;->parseFeedbackResponse(Ljava/lang/String;)Lnet/hockeyapp/android/objects/FeedbackResponse;

    move-result-object v0

    .line 33
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lnet/hockeyapp/android/objects/FeedbackResponse;

    invoke-virtual {p0, p1}, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->onPostExecute(Lnet/hockeyapp/android/objects/FeedbackResponse;)V

    return-void
.end method

.method protected onPostExecute(Lnet/hockeyapp/android/objects/FeedbackResponse;)V
    .locals 3
    .param p1, "result"    # Lnet/hockeyapp/android/objects/FeedbackResponse;

    .prologue
    .line 38
    if-eqz p1, :cond_0

    iget-object v2, p0, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->handler:Landroid/os/Handler;

    if-eqz v2, :cond_0

    .line 39
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 40
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 42
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "parse_feedback_response"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 43
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 45
    iget-object v2, p0, Lnet/hockeyapp/android/tasks/ParseFeedbackTask;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 47
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "msg":Landroid/os/Message;
    :cond_0
    return-void
.end method
