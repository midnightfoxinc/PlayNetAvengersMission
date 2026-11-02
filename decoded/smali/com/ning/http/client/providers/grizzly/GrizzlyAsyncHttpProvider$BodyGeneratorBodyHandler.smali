.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyGeneratorBodyHandler;
.super Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BodyGeneratorBodyHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 2088
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 2088
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyGeneratorBodyHandler;-><init>()V

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
    .line 2103
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v3

    .line 2104
    .local v3, "generator":Lcom/ning/http/client/BodyGenerator;
    invoke-interface {v3}, Lcom/ning/http/client/BodyGenerator;->createBody()Lcom/ning/http/client/Body;

    move-result-object v0

    .line 2105
    .local v0, "bodyLocal":Lcom/ning/http/client/Body;
    invoke-interface {v0}, Lcom/ning/http/client/Body;->getContentLength()J

    move-result-wide v6

    .line 2106
    .local v6, "len":J
    const-wide/16 v10, 0x0

    cmp-long v10, v6, v10

    if-ltz v10, :cond_0

    .line 2107
    invoke-virtual {p3, v6, v7}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentLengthLong(J)V

    .line 2112
    :goto_0
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getMemoryManager()Lorg/glassfish/grizzly/memory/MemoryManager;

    move-result-object v5

    .line 2113
    .local v5, "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    const/4 v4, 0x0

    .line 2115
    .local v4, "last":Z
    :goto_1
    if-nez v4, :cond_5

    .line 2116
    sget v10, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyGeneratorBodyHandler;->MAX_CHUNK_SIZE:I

    invoke-interface {v5, v10}, Lorg/glassfish/grizzly/memory/MemoryManager;->allocate(I)Lorg/glassfish/grizzly/Buffer;

    move-result-object v1

    .line 2117
    .local v1, "buffer":Lorg/glassfish/grizzly/Buffer;
    const/4 v10, 0x1

    invoke-interface {v1, v10}, Lorg/glassfish/grizzly/Buffer;->allowBufferDispose(Z)V

    .line 2119
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v10

    invoke-interface {v0, v10}, Lcom/ning/http/client/Body;->read(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    .line 2120
    .local v8, "readBytes":J
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-lez v10, :cond_1

    .line 2121
    long-to-int v10, v8

    invoke-interface {v1, v10}, Lorg/glassfish/grizzly/Buffer;->position(I)Lorg/glassfish/grizzly/Buffer;

    .line 2122
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->trim()V

    .line 2141
    :goto_2
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->httpContentBuilder()Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v10

    invoke-virtual {v10, v1}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->content(Lorg/glassfish/grizzly/Buffer;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v10

    invoke-virtual {v10, v4}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->last(Z)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v10

    invoke-virtual {v10}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->build()Lorg/glassfish/grizzly/http/HttpContent;

    move-result-object v2

    .line 2144
    .local v2, "content":Lorg/glassfish/grizzly/http/HttpContent;
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v10

    if-nez v10, :cond_4

    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v10

    invoke-virtual {v10}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v10

    :goto_3
    invoke-virtual {p1, v2, v10}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    goto :goto_1

    .line 2109
    .end local v1    # "buffer":Lorg/glassfish/grizzly/Buffer;
    .end local v2    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    .end local v4    # "last":Z
    .end local v5    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    .end local v8    # "readBytes":J
    :cond_0
    const/4 v10, 0x1

    invoke-virtual {p3, v10}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setChunked(Z)V

    goto :goto_0

    .line 2124
    .restart local v1    # "buffer":Lorg/glassfish/grizzly/Buffer;
    .restart local v4    # "last":Z
    .restart local v5    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    .restart local v8    # "readBytes":J
    :cond_1
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->dispose()V

    .line 2126
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-gez v10, :cond_2

    .line 2127
    const/4 v4, 0x1

    .line 2128
    sget-object v1, Lorg/glassfish/grizzly/memory/Buffers;->EMPTY_BUFFER:Lorg/glassfish/grizzly/Buffer;

    goto :goto_2

    .line 2132
    :cond_2
    instance-of v10, v3, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    if-eqz v10, :cond_3

    .line 2133
    check-cast v3, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .end local v3    # "generator":Lcom/ning/http/client/BodyGenerator;
    invoke-virtual {v3, p1, p3}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->initializeAsynchronousTransfer(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 2134
    const/4 v10, 0x0

    .line 2147
    .end local v1    # "buffer":Lorg/glassfish/grizzly/Buffer;
    .end local v8    # "readBytes":J
    :goto_4
    return v10

    .line 2136
    .restart local v1    # "buffer":Lorg/glassfish/grizzly/Buffer;
    .restart local v3    # "generator":Lcom/ning/http/client/BodyGenerator;
    .restart local v8    # "readBytes":J
    :cond_3
    new-instance v10, Ljava/lang/IllegalStateException;

    const-string v11, "BodyGenerator unexpectedly returned 0 bytes available"

    invoke-direct {v10, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 2144
    .restart local v2    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    :cond_4
    const/4 v10, 0x0

    goto :goto_3

    .line 2147
    .end local v1    # "buffer":Lorg/glassfish/grizzly/Buffer;
    .end local v2    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    .end local v8    # "readBytes":J
    :cond_5
    const/4 v10, 0x1

    goto :goto_4
.end method

.method public handlesBodyType(Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 2094
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
