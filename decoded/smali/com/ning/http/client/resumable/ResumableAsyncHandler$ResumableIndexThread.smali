.class Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;
.super Ljava/lang/Thread;
.source "ResumableAsyncHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/resumable/ResumableAsyncHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ResumableIndexThread"
.end annotation


# instance fields
.field public final resumableProcessors:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 221
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 219
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;->resumableProcessors:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 222
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/Runtime;->addShutdownHook(Ljava/lang/Thread;)V

    .line 223
    return-void
.end method


# virtual methods
.method public addResumableProcessor(Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;)V
    .locals 1
    .param p1, "p"    # Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;->resumableProcessors:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 227
    return-void
.end method

.method public run()V
    .locals 3

    .prologue
    .line 230
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;->resumableProcessors:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;

    .line 231
    .local v1, "p":Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;
    invoke-static {}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->access$200()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;->save(Ljava/util/Map;)V

    goto :goto_0

    .line 233
    .end local v1    # "p":Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;
    :cond_0
    return-void
.end method
