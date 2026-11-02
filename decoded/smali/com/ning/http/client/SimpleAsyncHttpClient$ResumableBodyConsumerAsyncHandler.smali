.class final Lcom/ning/http/client/SimpleAsyncHttpClient$ResumableBodyConsumerAsyncHandler;
.super Lcom/ning/http/client/resumable/ResumableAsyncHandler;
.source "SimpleAsyncHttpClient.java"

# interfaces
.implements Lcom/ning/http/client/ProgressAsyncHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/SimpleAsyncHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ResumableBodyConsumerAsyncHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/ning/http/client/resumable/ResumableAsyncHandler",
        "<",
        "Lcom/ning/http/client/Response;",
        ">;",
        "Lcom/ning/http/client/ProgressAsyncHandler",
        "<",
        "Lcom/ning/http/client/Response;",
        ">;"
    }
.end annotation


# instance fields
.field private final delegate:Lcom/ning/http/client/ProgressAsyncHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/ProgressAsyncHandler",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLcom/ning/http/client/ProgressAsyncHandler;)V
    .locals 1
    .param p1, "byteTransferred"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/ning/http/client/ProgressAsyncHandler",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 692
    .local p3, "delegate":Lcom/ning/http/client/ProgressAsyncHandler;, "Lcom/ning/http/client/ProgressAsyncHandler<Lcom/ning/http/client/Response;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;-><init>(JLcom/ning/http/client/AsyncHandler;)V

    .line 693
    iput-object p3, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$ResumableBodyConsumerAsyncHandler;->delegate:Lcom/ning/http/client/ProgressAsyncHandler;

    .line 694
    return-void
.end method


# virtual methods
.method public onContentWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1

    .prologue
    .line 701
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$ResumableBodyConsumerAsyncHandler;->delegate:Lcom/ning/http/client/ProgressAsyncHandler;

    invoke-interface {v0}, Lcom/ning/http/client/ProgressAsyncHandler;->onContentWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method

.method public onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 9
    .param p1, "amount"    # J
    .param p3, "current"    # J
    .param p5, "total"    # J

    .prologue
    .line 705
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$ResumableBodyConsumerAsyncHandler;->delegate:Lcom/ning/http/client/ProgressAsyncHandler;

    move-wide v2, p1

    move-wide v4, p3

    move-wide v6, p5

    invoke-interface/range {v1 .. v7}, Lcom/ning/http/client/ProgressAsyncHandler;->onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method

.method public onHeaderWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1

    .prologue
    .line 697
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$ResumableBodyConsumerAsyncHandler;->delegate:Lcom/ning/http/client/ProgressAsyncHandler;

    invoke-interface {v0}, Lcom/ning/http/client/ProgressAsyncHandler;->onHeaderWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method
