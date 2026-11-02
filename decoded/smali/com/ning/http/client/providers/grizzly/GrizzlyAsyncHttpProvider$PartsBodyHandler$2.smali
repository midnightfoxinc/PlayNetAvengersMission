.class Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$2;
.super Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;->doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;

.field final synthetic val$ctx:Lorg/glassfish/grizzly/filterchain/FilterChainContext;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V
    .locals 0
    .param p2, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 1966
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$2;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;

    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$2;->val$ctx:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    invoke-direct {p0, p2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V

    return-void
.end method


# virtual methods
.method public flush()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    .line 1969
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$2;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-virtual {v6}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->createBody()Lcom/ning/http/client/Body;

    move-result-object v0

    .line 1971
    .local v0, "bodyLocal":Lcom/ning/http/client/Body;
    :try_start_0
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$2;->val$ctx:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    invoke-virtual {v6}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getMemoryManager()Lorg/glassfish/grizzly/memory/MemoryManager;

    move-result-object v3

    .line 1972
    .local v3, "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    const/4 v2, 0x0

    .line 1973
    .local v2, "last":Z
    :goto_0
    if-nez v2, :cond_3

    .line 1974
    sget v6, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;->MAX_CHUNK_SIZE:I

    invoke-interface {v3, v6}, Lorg/glassfish/grizzly/memory/MemoryManager;->allocate(I)Lorg/glassfish/grizzly/Buffer;

    move-result-object v1

    .line 1975
    .local v1, "buffer":Lorg/glassfish/grizzly/Buffer;
    const/4 v6, 0x1

    invoke-interface {v1, v6}, Lorg/glassfish/grizzly/Buffer;->allowBufferDispose(Z)V

    .line 1976
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-interface {v0, v6}, Lcom/ning/http/client/Body;->read(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    .line 1977
    .local v4, "readBytes":J
    cmp-long v6, v4, v8

    if-lez v6, :cond_1

    .line 1978
    long-to-int v6, v4

    invoke-interface {v1, v6}, Lorg/glassfish/grizzly/Buffer;->position(I)Lorg/glassfish/grizzly/Buffer;

    .line 1979
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->trim()V

    .line 1989
    :goto_1
    invoke-virtual {p0, v1, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$2;->feed(Lorg/glassfish/grizzly/Buffer;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1992
    .end local v1    # "buffer":Lorg/glassfish/grizzly/Buffer;
    .end local v2    # "last":Z
    .end local v3    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    .end local v4    # "readBytes":J
    :catchall_0
    move-exception v6

    if-eqz v0, :cond_0

    .line 1994
    :try_start_1
    invoke-interface {v0}, Lcom/ning/http/client/Body;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1996
    :cond_0
    :goto_2
    throw v6

    .line 1981
    .restart local v1    # "buffer":Lorg/glassfish/grizzly/Buffer;
    .restart local v2    # "last":Z
    .restart local v3    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    .restart local v4    # "readBytes":J
    :cond_1
    :try_start_2
    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->dispose()V

    .line 1982
    cmp-long v6, v4, v8

    if-gez v6, :cond_2

    .line 1983
    const/4 v2, 0x1

    .line 1984
    sget-object v1, Lorg/glassfish/grizzly/memory/Buffers;->EMPTY_BUFFER:Lorg/glassfish/grizzly/Buffer;

    goto :goto_1

    .line 1986
    :cond_2
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "MultipartBody unexpectedly returned 0 bytes available"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1992
    .end local v1    # "buffer":Lorg/glassfish/grizzly/Buffer;
    .end local v4    # "readBytes":J
    :cond_3
    if-eqz v0, :cond_4

    .line 1994
    :try_start_3
    invoke-interface {v0}, Lcom/ning/http/client/Body;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 1999
    :cond_4
    :goto_3
    return-void

    .line 1995
    :catch_0
    move-exception v6

    goto :goto_3

    .end local v2    # "last":Z
    .end local v3    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    :catch_1
    move-exception v7

    goto :goto_2
.end method
