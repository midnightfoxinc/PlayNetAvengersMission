.class Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;
.super Landroid/os/AsyncTask;
.source "EMTRestClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/networking/EMTRestClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EMTRestTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private handler:Lcom/disney/emagine/sdk/networking/EMTRestHandler;

.field private request:Lorg/apache/http/client/methods/HttpUriRequest;

.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/networking/EMTRestClient;Lorg/apache/http/client/methods/HttpUriRequest;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V
    .locals 1
    .param p2, "r"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p3, "h"    # Lcom/disney/emagine/sdk/networking/EMTRestHandler;

    .prologue
    const/4 v0, 0x0

    .line 490
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 486
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 487
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->handler:Lcom/disney/emagine/sdk/networking/EMTRestHandler;

    .line 491
    iput-object p2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 492
    iput-object p3, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->handler:Lcom/disney/emagine/sdk/networking/EMTRestHandler;

    .line 493
    return-void
.end method

.method private onCleanup()V
    .locals 2

    .prologue
    .line 543
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-static {v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->access$100(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 544
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-static {v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->access$100(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-static {v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->access$200(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 545
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-static {v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->access$200(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->removeRestClient(Lcom/disney/emagine/sdk/networking/EMTRestClient;)V

    .line 547
    :cond_0
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 484
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 6
    .param p1, "arg0"    # [Ljava/lang/Void;

    .prologue
    const/4 v5, 0x0

    .line 499
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 523
    :cond_0
    :goto_0
    return-object v5

    .line 503
    :cond_1
    const/4 v2, 0x0

    .line 504
    .local v2, "response":Lorg/apache/http/HttpResponse;
    const/4 v1, 0x0

    .line 508
    .local v1, "exception":Ljava/lang/Exception;
    :try_start_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 515
    :goto_1
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_0

    .line 519
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->handler:Lcom/disney/emagine/sdk/networking/EMTRestHandler;

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-static {v4}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->access$000(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Lorg/apache/http/client/HttpClient;

    move-result-object v4

    invoke-virtual {v3, v4, v2, v1}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->onCompleted(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpResponse;Ljava/lang/Exception;)V

    .line 521
    invoke-direct {p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->onCleanup()V

    goto :goto_0

    .line 510
    :catch_0
    move-exception v0

    .line 512
    .local v0, "e":Ljava/lang/Exception;
    move-object v1, v0

    goto :goto_1
.end method

.method protected onCancelled()V
    .locals 0

    .prologue
    .line 539
    invoke-direct {p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->onCleanup()V

    .line 540
    return-void
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 484
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->onCancelled(Ljava/lang/Void;)V

    return-void
.end method

.method protected onCancelled(Ljava/lang/Void;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/Void;

    .prologue
    .line 534
    invoke-direct {p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->onCleanup()V

    .line 535
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 484
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/Void;

    .prologue
    .line 528
    invoke-direct {p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->onCleanup()V

    .line 530
    return-void
.end method
