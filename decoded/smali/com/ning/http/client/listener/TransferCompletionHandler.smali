.class public Lcom/ning/http/client/listener/TransferCompletionHandler;
.super Lcom/ning/http/client/AsyncCompletionHandlerBase;
.source "TransferCompletionHandler.java"


# static fields
.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final accumulateResponseBytes:Z

.field private expectedTotal:J

.field private headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

.field private final listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/ning/http/client/listener/TransferListener;",
            ">;"
        }
    .end annotation
.end field

.field private seen:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const-class v0, Lcom/ning/http/client/listener/TransferCompletionHandler;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/listener/TransferCompletionHandler;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/ning/http/client/listener/TransferCompletionHandler;-><init>(Z)V

    .line 74
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "accumulateResponseBytes"    # Z

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/ning/http/client/AsyncCompletionHandlerBase;-><init>()V

    .line 62
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 84
    iput-boolean p1, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->accumulateResponseBytes:Z

    .line 85
    return-void
.end method

.method private fireOnBytesReceived([B)V
    .locals 4
    .param p1, "b"    # [B

    .prologue
    .line 204
    iget-object v3, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/listener/TransferListener;

    .line 206
    .local v1, "l":Lcom/ning/http/client/listener/TransferListener;
    :try_start_0
    invoke-interface {v1, p1}, Lcom/ning/http/client/listener/TransferListener;->onBytesReceived([B)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 207
    :catch_0
    move-exception v2

    .line 208
    .local v2, "t":Ljava/lang/Throwable;
    invoke-interface {v1, v2}, Lcom/ning/http/client/listener/TransferListener;->onThrowable(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 211
    .end local v1    # "l":Lcom/ning/http/client/listener/TransferListener;
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method private fireOnBytesSent(JJJ)V
    .locals 9
    .param p1, "amount"    # J
    .param p3, "current"    # J
    .param p5, "total"    # J

    .prologue
    .line 214
    iget-object v2, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/listener/TransferListener;

    .local v1, "l":Lcom/ning/http/client/listener/TransferListener;
    move-wide v2, p1

    move-wide v4, p3

    move-wide v6, p5

    .line 216
    :try_start_0
    invoke-interface/range {v1 .. v7}, Lcom/ning/http/client/listener/TransferListener;->onBytesSent(JJJ)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 217
    :catch_0
    move-exception v8

    .line 218
    .local v8, "t":Ljava/lang/Throwable;
    invoke-interface {v1, v8}, Lcom/ning/http/client/listener/TransferListener;->onThrowable(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 221
    .end local v1    # "l":Lcom/ning/http/client/listener/TransferListener;
    .end local v8    # "t":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method private fireOnEnd()V
    .locals 4

    .prologue
    .line 194
    iget-object v3, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/listener/TransferListener;

    .line 196
    .local v1, "l":Lcom/ning/http/client/listener/TransferListener;
    :try_start_0
    invoke-interface {v1}, Lcom/ning/http/client/listener/TransferListener;->onRequestResponseCompleted()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 197
    :catch_0
    move-exception v2

    .line 198
    .local v2, "t":Ljava/lang/Throwable;
    invoke-interface {v1, v2}, Lcom/ning/http/client/listener/TransferListener;->onThrowable(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 201
    .end local v1    # "l":Lcom/ning/http/client/listener/TransferListener;
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method private fireOnHeaderReceived(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
    .locals 4
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 184
    iget-object v3, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/listener/TransferListener;

    .line 186
    .local v1, "l":Lcom/ning/http/client/listener/TransferListener;
    :try_start_0
    invoke-interface {v1, p1}, Lcom/ning/http/client/listener/TransferListener;->onResponseHeadersReceived(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 187
    :catch_0
    move-exception v2

    .line 188
    .local v2, "t":Ljava/lang/Throwable;
    invoke-interface {v1, v2}, Lcom/ning/http/client/listener/TransferListener;->onThrowable(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 191
    .end local v1    # "l":Lcom/ning/http/client/listener/TransferListener;
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method private fireOnHeadersSent(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
    .locals 4
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 173
    iget-object v3, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/listener/TransferListener;

    .line 175
    .local v1, "l":Lcom/ning/http/client/listener/TransferListener;
    :try_start_0
    invoke-interface {v1, p1}, Lcom/ning/http/client/listener/TransferListener;->onRequestHeadersSent(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 176
    :catch_0
    move-exception v2

    .line 177
    .local v2, "t":Ljava/lang/Throwable;
    invoke-interface {v1, v2}, Lcom/ning/http/client/listener/TransferListener;->onThrowable(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 180
    .end local v1    # "l":Lcom/ning/http/client/listener/TransferListener;
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method private fireOnThrowable(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 224
    iget-object v3, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/listener/TransferListener;

    .line 226
    .local v1, "l":Lcom/ning/http/client/listener/TransferListener;
    :try_start_0
    invoke-interface {v1, p1}, Lcom/ning/http/client/listener/TransferListener;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 227
    :catch_0
    move-exception v2

    .line 228
    .local v2, "t2":Ljava/lang/Throwable;
    sget-object v3, Lcom/ning/http/client/listener/TransferCompletionHandler;->logger:Lorg/slf4j/Logger;

    const-string v4, "onThrowable"

    invoke-interface {v3, v4, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 231
    .end local v1    # "l":Lcom/ning/http/client/listener/TransferListener;
    .end local v2    # "t2":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method


# virtual methods
.method public addTransferListener(Lcom/ning/http/client/listener/TransferListener;)Lcom/ning/http/client/listener/TransferCompletionHandler;
    .locals 1
    .param p1, "t"    # Lcom/ning/http/client/listener/TransferListener;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 96
    return-object p0
.end method

.method public headers(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
    .locals 4
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 120
    const-string v1, "Content-Length"

    invoke-virtual {p1, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "contentLength":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 122
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->expectedTotal:J

    .line 123
    :cond_0
    return-void
.end method

.method public onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 2
    .param p1, "content"    # Lcom/ning/http/client/HttpResponseBodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 133
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 134
    .local v0, "s":Lcom/ning/http/client/AsyncHandler$STATE;
    iget-boolean v1, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->accumulateResponseBytes:Z

    if-eqz v1, :cond_0

    .line 135
    invoke-super {p0, p1}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    .line 137
    :cond_0
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/listener/TransferCompletionHandler;->fireOnBytesReceived([B)V

    .line 138
    return-object v0
.end method

.method public onCompleted(Lcom/ning/http/client/Response;)Lcom/ning/http/client/Response;
    .locals 8
    .param p1, "response"    # Lcom/ning/http/client/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 144
    iget-wide v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->seen:J

    iget-wide v2, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->expectedTotal:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 146
    iget-wide v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->expectedTotal:J

    iget-wide v2, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->seen:J

    sub-long v2, v0, v2

    iget-wide v4, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->expectedTotal:J

    iget-wide v6, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->expectedTotal:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/ning/http/client/listener/TransferCompletionHandler;->fireOnBytesSent(JJJ)V

    .line 148
    :cond_0
    invoke-direct {p0}, Lcom/ning/http/client/listener/TransferCompletionHandler;->fireOnEnd()V

    .line 149
    return-object p1
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
    .line 60
    invoke-virtual {p0, p1}, Lcom/ning/http/client/listener/TransferCompletionHandler;->onCompleted(Lcom/ning/http/client/Response;)Lcom/ning/http/client/Response;

    move-result-object v0

    return-object v0
.end method

.method public onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 3
    .param p1, "amount"    # J
    .param p3, "current"    # J
    .param p5, "total"    # J

    .prologue
    .line 162
    iget-wide v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->seen:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->seen:J

    .line 163
    invoke-direct/range {p0 .. p6}, Lcom/ning/http/client/listener/TransferCompletionHandler;->fireOnBytesSent(JJJ)V

    .line 164
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onHeaderWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {p0, v0}, Lcom/ning/http/client/listener/TransferCompletionHandler;->fireOnHeadersSent(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    .line 157
    :cond_0
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

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
    .line 127
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ning/http/client/listener/TransferCompletionHandler;->fireOnHeaderReceived(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    .line 128
    invoke-super {p0, p1}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 169
    invoke-direct {p0, p1}, Lcom/ning/http/client/listener/TransferCompletionHandler;->fireOnThrowable(Ljava/lang/Throwable;)V

    .line 170
    return-void
.end method

.method public removeTransferListener(Lcom/ning/http/client/listener/TransferListener;)Lcom/ning/http/client/listener/TransferCompletionHandler;
    .locals 1
    .param p1, "t"    # Lcom/ning/http/client/listener/TransferListener;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/ning/http/client/listener/TransferCompletionHandler;->listeners:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 108
    return-object p0
.end method
