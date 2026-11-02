.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;
.super Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FileBodyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V
    .locals 0

    .prologue
    .line 2008
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 2008
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V

    return-void
.end method


# virtual methods
.method public doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
    .locals 12
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p3, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2023
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v4

    .line 2024
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v10

    invoke-virtual {p3, v10, v11}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentLengthLong(J)V

    .line 2025
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v10

    invoke-static {v10}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v3

    .line 2026
    .local v3, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$1900()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isSecure()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 2028
    :cond_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-interface {p2}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v10

    invoke-direct {v5, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 2029
    .local v5, "fis":Ljava/io/FileInputStream;
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getMemoryManager()Lorg/glassfish/grizzly/memory/MemoryManager;

    move-result-object v7

    .line 2030
    .local v7, "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    new-instance v9, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v9}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 2031
    .local v9, "written":Ljava/util/concurrent/atomic/AtomicInteger;
    const/4 v6, 0x0

    .line 2033
    .local v6, "last":Z
    :try_start_0
    sget v10, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;->MAX_CHUNK_SIZE:I

    new-array v1, v10, [B

    .local v1, "buf":[B
    :goto_0
    if-nez v6, :cond_4

    .line 2034
    const/4 v0, 0x0

    .line 2036
    .local v0, "b":Lorg/glassfish/grizzly/Buffer;
    invoke-virtual {v5, v1}, Ljava/io/FileInputStream;->read([B)I

    move-result v8

    .local v8, "read":I
    if-gez v8, :cond_1

    .line 2037
    const/4 v6, 0x1

    .line 2038
    sget-object v0, Lorg/glassfish/grizzly/memory/Buffers;->EMPTY_BUFFER:Lorg/glassfish/grizzly/Buffer;

    .line 2040
    :cond_1
    sget-object v10, Lorg/glassfish/grizzly/memory/Buffers;->EMPTY_BUFFER:Lorg/glassfish/grizzly/Buffer;

    if-eq v0, v10, :cond_2

    .line 2041
    invoke-virtual {v9, v8}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 2042
    const/4 v10, 0x0

    invoke-static {v7, v1, v10, v8}, Lorg/glassfish/grizzly/memory/Buffers;->wrap(Lorg/glassfish/grizzly/memory/MemoryManager;[BII)Lorg/glassfish/grizzly/Buffer;

    move-result-object v0

    .line 2045
    :cond_2
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->httpContentBuilder()Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v10

    invoke-virtual {v10, v0}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->content(Lorg/glassfish/grizzly/Buffer;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v10

    invoke-virtual {v10, v6}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->last(Z)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v10

    invoke-virtual {v10}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->build()Lorg/glassfish/grizzly/http/HttpContent;

    move-result-object v2

    .line 2048
    .local v2, "content":Lorg/glassfish/grizzly/http/HttpContent;
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v10

    if-nez v10, :cond_3

    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v10

    invoke-virtual {v10}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v10

    :goto_1
    invoke-virtual {p1, v2, v10}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 2051
    .end local v0    # "b":Lorg/glassfish/grizzly/Buffer;
    .end local v1    # "buf":[B
    .end local v2    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    .end local v8    # "read":I
    :catchall_0
    move-exception v10

    .line 2052
    :try_start_1
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2054
    :goto_2
    throw v10

    .line 2048
    .restart local v0    # "b":Lorg/glassfish/grizzly/Buffer;
    .restart local v1    # "buf":[B
    .restart local v2    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    .restart local v8    # "read":I
    :cond_3
    const/4 v10, 0x0

    goto :goto_1

    .line 2052
    .end local v0    # "b":Lorg/glassfish/grizzly/Buffer;
    .end local v2    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    .end local v8    # "read":I
    :cond_4
    :try_start_2
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 2076
    .end local v1    # "buf":[B
    .end local v5    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "last":Z
    .end local v7    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    .end local v9    # "written":Ljava/util/concurrent/atomic/AtomicInteger;
    :goto_3
    const/4 v10, 0x1

    return v10

    .line 2058
    :cond_5
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v10

    if-nez v10, :cond_6

    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v10

    invoke-virtual {v10}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v10

    :goto_4
    invoke-virtual {p1, p3, v10}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 2059
    new-instance v10, Lorg/glassfish/grizzly/FileTransfer;

    invoke-direct {v10, v4}, Lorg/glassfish/grizzly/FileTransfer;-><init>(Ljava/io/File;)V

    new-instance v11, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;

    invoke-direct {v11, p0, v3, p3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    invoke-virtual {p1, v10, v11}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    goto :goto_3

    .line 2058
    :cond_6
    const/4 v10, 0x0

    goto :goto_4

    .line 2053
    .restart local v1    # "buf":[B
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "last":Z
    .restart local v7    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    .restart local v9    # "written":Ljava/util/concurrent/atomic/AtomicInteger;
    :catch_0
    move-exception v10

    goto :goto_3

    .end local v1    # "buf":[B
    :catch_1
    move-exception v11

    goto :goto_2
.end method

.method protected getContentLength(Lcom/ning/http/client/Request;)J
    .locals 4
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 2081
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getContentLength()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getContentLength()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    goto :goto_0
.end method

.method public handlesBodyType(Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 2014
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
