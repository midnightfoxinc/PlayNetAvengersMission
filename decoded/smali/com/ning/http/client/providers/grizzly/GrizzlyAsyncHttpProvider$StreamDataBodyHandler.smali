.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StreamDataBodyHandler;
.super Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StreamDataBodyHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1883
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 1883
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StreamDataBodyHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
    .locals 11
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p3, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x200

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1898
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getMemoryManager()Lorg/glassfish/grizzly/memory/MemoryManager;

    move-result-object v5

    .line 1899
    .local v5, "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    invoke-interface {v5, v7}, Lorg/glassfish/grizzly/memory/MemoryManager;->allocate(I)Lorg/glassfish/grizzly/Buffer;

    move-result-object v1

    .line 1900
    .local v1, "buffer":Lorg/glassfish/grizzly/Buffer;
    new-array v0, v7, [B

    .line 1902
    .local v0, "b":[B
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getStreamData()Ljava/io/InputStream;

    move-result-object v3

    .line 1904
    .local v3, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v3}, Ljava/io/InputStream;->reset()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1910
    :cond_0
    :goto_0
    invoke-virtual {v3}, Ljava/io/InputStream;->markSupported()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1911
    invoke-virtual {v3, v9}, Ljava/io/InputStream;->mark(I)V

    .line 1914
    :cond_1
    :goto_1
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .local v6, "read":I
    const/4 v7, -0x1

    if-eq v6, v7, :cond_3

    .line 1915
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->remaining()I

    move-result v7

    if-le v6, v7, :cond_2

    .line 1916
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->capacity()I

    move-result v7

    add-int/lit16 v7, v7, 0x200

    invoke-interface {v5, v1, v7}, Lorg/glassfish/grizzly/memory/MemoryManager;->reallocate(Lorg/glassfish/grizzly/Buffer;I)Lorg/glassfish/grizzly/Buffer;

    move-result-object v1

    .line 1918
    :cond_2
    invoke-interface {v1, v0, v9, v6}, Lorg/glassfish/grizzly/Buffer;->put([BII)Lorg/glassfish/grizzly/Buffer;

    goto :goto_1

    .line 1905
    .end local v6    # "read":I
    :catch_0
    move-exception v4

    .line 1906
    .local v4, "ioe":Ljava/io/IOException;
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$100()Lorg/slf4j/Logger;

    move-result-object v7

    invoke-interface {v7}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1907
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$100()Lorg/slf4j/Logger;

    move-result-object v7

    invoke-virtual {v4}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1920
    .end local v4    # "ioe":Ljava/io/IOException;
    .restart local v6    # "read":I
    :cond_3
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->trim()V

    .line 1921
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->hasRemaining()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1922
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->httpContentBuilder()Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v7

    invoke-virtual {v7, v1}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->content(Lorg/glassfish/grizzly/Buffer;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v7

    invoke-virtual {v7, v10}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->last(Z)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->build()Lorg/glassfish/grizzly/http/HttpContent;

    move-result-object v2

    .line 1926
    .local v2, "content":Lorg/glassfish/grizzly/http/HttpContent;
    invoke-interface {v1, v9}, Lorg/glassfish/grizzly/Buffer;->allowBufferDispose(Z)V

    .line 1927
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v7

    invoke-virtual {v7}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v7

    :goto_2
    invoke-virtual {p1, v2, v7}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 1930
    .end local v2    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    :cond_4
    return v10

    .line 1927
    .restart local v2    # "content":Lorg/glassfish/grizzly/http/HttpContent;
    :cond_5
    const/4 v7, 0x0

    goto :goto_2
.end method

.method public handlesBodyType(Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1889
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getStreamData()Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
