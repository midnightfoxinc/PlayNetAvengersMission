.class public Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;
.super Ljava/lang/Object;
.source "EMTRestClient.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/networking/EMTRestClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "restCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lorg/apache/http/HttpResponse;",
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
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EMTRestClient;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p3, "handler"    # Lcom/disney/emagine/sdk/networking/EMTRestHandler;

    .prologue
    const/4 v0, 0x0

    .line 557
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 553
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 554
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->handler:Lcom/disney/emagine/sdk/networking/EMTRestHandler;

    .line 558
    iput-object p2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 559
    iput-object p3, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->handler:Lcom/disney/emagine/sdk/networking/EMTRestHandler;

    .line 560
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 551
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->call()Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/apache/http/HttpResponse;
    .locals 5

    .prologue
    .line 565
    const/4 v2, 0x0

    .line 566
    .local v2, "response":Lorg/apache/http/HttpResponse;
    const/4 v1, 0x0

    .line 570
    .local v1, "exception":Ljava/lang/Exception;
    :try_start_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 577
    :goto_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->handler:Lcom/disney/emagine/sdk/networking/EMTRestHandler;

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-static {v4}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->access$000(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Lorg/apache/http/client/HttpClient;

    move-result-object v4

    invoke-virtual {v3, v4, v2, v1}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->onCompleted(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpResponse;Ljava/lang/Exception;)V

    .line 579
    return-object v2

    .line 572
    :catch_0
    move-exception v0

    .line 574
    .local v0, "e":Ljava/lang/Exception;
    move-object v1, v0

    goto :goto_0
.end method
