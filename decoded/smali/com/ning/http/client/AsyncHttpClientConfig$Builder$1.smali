.class Lcom/ning/http/client/AsyncHttpClientConfig$Builder$1;
.super Ljava/lang/Object;
.source "AsyncHttpClientConfig.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->build()Lcom/ning/http/client/AsyncHttpClientConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;


# direct methods
.method constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig$Builder;)V
    .locals 0

    .prologue
    .line 953
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder$1;->this$0:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 955
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "AsyncHttpClient-Callback"

    invoke-direct {v0, p1, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 956
    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 957
    return-object v0
.end method
