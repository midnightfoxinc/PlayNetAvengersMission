.class final Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;
.super Lcom/ning/http/client/AsyncCompletionHandlerBase;
.source "SimpleAsyncHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/SimpleAsyncHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BodyConsumerAsyncHandler"
.end annotation


# instance fields
.field private accumulateBody:Z

.field private amount:I

.field private final bodyConsumer:Lcom/ning/http/client/BodyConsumer;

.field private final errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

.field private final exceptionHandler:Lcom/ning/http/client/ThrowableHandler;

.field private final listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

.field private omitBody:Z

.field private total:J

.field private final uri:Lcom/ning/http/client/uri/Uri;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/simple/SimpleAHCTransferListener;)V
    .locals 2
    .param p1, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p2, "exceptionHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .param p3, "errorDocumentBehaviour"    # Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;
    .param p4, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p5, "listener"    # Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    .prologue
    const/4 v0, 0x0

    .line 722
    invoke-direct {p0}, Lcom/ning/http/client/AsyncCompletionHandlerBase;-><init>()V

    .line 717
    iput-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->accumulateBody:Z

    .line 718
    iput-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->omitBody:Z

    .line 719
    iput v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->amount:I

    .line 720
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->total:J

    .line 723
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->bodyConsumer:Lcom/ning/http/client/BodyConsumer;

    .line 724
    iput-object p2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->exceptionHandler:Lcom/ning/http/client/ThrowableHandler;

    .line 725
    iput-object p3, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    .line 726
    iput-object p4, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->uri:Lcom/ning/http/client/uri/Uri;

    .line 727
    iput-object p5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    .line 728
    return-void
.end method

.method private calculateTotal(Lcom/ning/http/client/HttpResponseHeaders;)V
    .locals 4
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;

    .prologue
    .line 804
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v2

    const-string v3, "Content-Length"

    invoke-virtual {v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 807
    .local v1, "length":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->total:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 811
    :goto_0
    return-void

    .line 808
    :catch_0
    move-exception v0

    .line 809
    .local v0, "e":Ljava/lang/Exception;
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->total:J

    goto :goto_0
.end method

.method private closeConsumer()V
    .locals 1

    .prologue
    .line 766
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->bodyConsumer:Lcom/ning/http/client/BodyConsumer;

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 767
    return-void
.end method

.method private fireCompleted(Lcom/ning/http/client/Response;)V
    .locals 4
    .param p1, "response"    # Lcom/ning/http/client/Response;

    .prologue
    .line 848
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    if-eqz v0, :cond_0

    .line 849
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-interface {p1}, Lcom/ning/http/client/Response;->getStatusCode()I

    move-result v2

    invoke-interface {p1}, Lcom/ning/http/client/Response;->getStatusText()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/ning/http/client/simple/SimpleAHCTransferListener;->onCompleted(Lcom/ning/http/client/uri/Uri;ILjava/lang/String;)V

    .line 851
    :cond_0
    return-void
.end method

.method private fireHeaders(Lcom/ning/http/client/HttpResponseHeaders;)V
    .locals 4
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;

    .prologue
    .line 836
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    if-eqz v0, :cond_0

    .line 837
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->uri:Lcom/ning/http/client/uri/Uri;

    new-instance v2, Lcom/ning/http/client/simple/HeaderMap;

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/ning/http/client/simple/HeaderMap;-><init>(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    invoke-interface {v0, v1, v2}, Lcom/ning/http/client/simple/SimpleAHCTransferListener;->onHeaders(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/simple/HeaderMap;)V

    .line 839
    :cond_0
    return-void
.end method

.method private fireReceived(Lcom/ning/http/client/HttpResponseBodyPart;)V
    .locals 9
    .param p1, "content"    # Lcom/ning/http/client/HttpResponseBodyPart;

    .prologue
    .line 826
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    .line 828
    .local v8, "remaining":I
    iget v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->amount:I

    add-int/2addr v0, v8

    iput v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->amount:I

    .line 830
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    if-eqz v0, :cond_0

    .line 831
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->uri:Lcom/ning/http/client/uri/Uri;

    iget v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->amount:I

    int-to-long v2, v2

    int-to-long v4, v8

    iget-wide v6, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->total:J

    invoke-interface/range {v0 .. v7}, Lcom/ning/http/client/simple/SimpleAHCTransferListener;->onBytesReceived(Lcom/ning/http/client/uri/Uri;JJJ)V

    .line 833
    :cond_0
    return-void
.end method

.method private fireSent(Lcom/ning/http/client/uri/Uri;JJJ)V
    .locals 8
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "amount"    # J
    .param p4, "current"    # J
    .param p6, "total"    # J

    .prologue
    .line 842
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    if-eqz v0, :cond_0

    .line 843
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-wide v6, p6

    invoke-interface/range {v0 .. v7}, Lcom/ning/http/client/simple/SimpleAHCTransferListener;->onBytesSent(Lcom/ning/http/client/uri/Uri;JJJ)V

    .line 845
    :cond_0
    return-void
.end method

.method private fireStatus(Lcom/ning/http/client/HttpResponseStatus;)V
    .locals 4
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;

    .prologue
    .line 820
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    if-eqz v0, :cond_0

    .line 821
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseStatus;->getStatusText()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/ning/http/client/simple/SimpleAHCTransferListener;->onStatus(Lcom/ning/http/client/uri/Uri;ILjava/lang/String;)V

    .line 823
    :cond_0
    return-void
.end method

.method private isErrorStatus(Lcom/ning/http/client/HttpResponseStatus;)Z
    .locals 2
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;

    .prologue
    .line 790
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v0

    const/16 v1, 0x190

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 2
    .param p1, "content"    # Lcom/ning/http/client/HttpResponseBodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 744
    invoke-direct {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->fireReceived(Lcom/ning/http/client/HttpResponseBodyPart;)V

    .line 745
    iget-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->omitBody:Z

    if-eqz v0, :cond_0

    .line 746
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 754
    :goto_0
    return-object v0

    .line 749
    :cond_0
    iget-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->accumulateBody:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->bodyConsumer:Lcom/ning/http/client/BodyConsumer;

    if-eqz v0, :cond_1

    .line 750
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->bodyConsumer:Lcom/ning/http/client/BodyConsumer;

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ning/http/client/BodyConsumer;->consume(Ljava/nio/ByteBuffer;)V

    .line 754
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    goto :goto_0

    .line 752
    :cond_1
    invoke-super {p0, p1}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    goto :goto_0
.end method

.method public onCompleted(Lcom/ning/http/client/Response;)Lcom/ning/http/client/Response;
    .locals 1
    .param p1, "response"    # Lcom/ning/http/client/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 760
    invoke-direct {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->fireCompleted(Lcom/ning/http/client/Response;)V

    .line 761
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->closeConsumer()V

    .line 762
    invoke-super {p0, p1}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onCompleted(Lcom/ning/http/client/Response;)Lcom/ning/http/client/Response;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic onCompleted(Lcom/ning/http/client/Response;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 709
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->onCompleted(Lcom/ning/http/client/Response;)Lcom/ning/http/client/Response;

    move-result-object v0

    return-object v0
.end method

.method public onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 9
    .param p1, "amount"    # J
    .param p3, "current"    # J
    .param p5, "total"    # J

    .prologue
    .line 815
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->uri:Lcom/ning/http/client/uri/Uri;

    move-object v0, p0

    move-wide v2, p1

    move-wide v4, p3

    move-wide v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->fireSent(Lcom/ning/http/client/uri/Uri;JJJ)V

    .line 816
    invoke-super/range {p0 .. p6}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method

.method public onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 796
    invoke-direct {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->calculateTotal(Lcom/ning/http/client/HttpResponseHeaders;)V

    .line 798
    invoke-direct {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->fireHeaders(Lcom/ning/http/client/HttpResponseHeaders;)V

    .line 800
    invoke-super {p0, p1}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method

.method public onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 3
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 772
    invoke-direct {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->fireStatus(Lcom/ning/http/client/HttpResponseStatus;)V

    .line 774
    invoke-direct {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->isErrorStatus(Lcom/ning/http/client/HttpResponseStatus;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 775
    sget-object v0, Lcom/ning/http/client/SimpleAsyncHttpClient$1;->$SwitchMap$com$ning$http$client$SimpleAsyncHttpClient$ErrorDocumentBehaviour:[I

    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    invoke-virtual {v1}, Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 786
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0

    .line 777
    :pswitch_0
    iput-boolean v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->accumulateBody:Z

    goto :goto_0

    .line 780
    :pswitch_1
    iput-boolean v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->omitBody:Z

    goto :goto_0

    .line 775
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 733
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->exceptionHandler:Lcom/ning/http/client/ThrowableHandler;

    if-eqz v0, :cond_0

    .line 734
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->exceptionHandler:Lcom/ning/http/client/ThrowableHandler;

    invoke-interface {v0, p1}, Lcom/ning/http/client/ThrowableHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 739
    :goto_0
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->closeConsumer()V

    .line 741
    return-void

    .line 736
    :cond_0
    :try_start_1
    invoke-super {p0, p1}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 739
    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;->closeConsumer()V

    throw v0
.end method
