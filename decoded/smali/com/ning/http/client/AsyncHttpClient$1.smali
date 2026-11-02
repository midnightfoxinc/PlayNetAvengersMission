.class Lcom/ning/http/client/AsyncHttpClient$1;
.super Ljava/lang/Object;
.source "AsyncHttpClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/AsyncHttpClient;->closeAsynchronously()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/AsyncHttpClient;

.field final synthetic val$e:Ljava/util/concurrent/ExecutorService;


# direct methods
.method constructor <init>(Lcom/ning/http/client/AsyncHttpClient;Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    .prologue
    .line 345
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClient$1;->this$0:Lcom/ning/http/client/AsyncHttpClient;

    iput-object p2, p0, Lcom/ning/http/client/AsyncHttpClient$1;->val$e:Ljava/util/concurrent/ExecutorService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 348
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/AsyncHttpClient$1;->this$0:Lcom/ning/http/client/AsyncHttpClient;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClient;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 352
    iget-object v1, p0, Lcom/ning/http/client/AsyncHttpClient$1;->val$e:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 354
    :goto_0
    return-void

    .line 349
    :catch_0
    move-exception v0

    .line 350
    .local v0, "t":Ljava/lang/Throwable;
    :try_start_1
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClient;->access$000()Lorg/slf4j/Logger;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 352
    iget-object v1, p0, Lcom/ning/http/client/AsyncHttpClient$1;->val$e:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    goto :goto_0

    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/ning/http/client/AsyncHttpClient$1;->val$e:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v2}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    throw v1
.end method
