.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StringBodyHandler;
.super Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "StringBodyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V
    .locals 0

    .prologue
    .line 1796
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StringBodyHandler;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 1796
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StringBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V

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
    const/4 v10, 0x1

    .line 1812
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getBodyEncoding()Ljava/lang/String;

    move-result-object v0

    .line 1813
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 1814
    sget-object v5, Lorg/glassfish/grizzly/utils/Charsets;->ASCII_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v5}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    .line 1816
    :cond_0
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getStringData()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 1817
    .local v2, "data":[B
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getMemoryManager()Lorg/glassfish/grizzly/memory/MemoryManager;

    move-result-object v4

    .line 1818
    .local v4, "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    invoke-static {v4, v2}, Lorg/glassfish/grizzly/memory/Buffers;->wrap(Lorg/glassfish/grizzly/memory/MemoryManager;[B)Lorg/glassfish/grizzly/Buffer;

    move-result-object v3

    .line 1819
    .local v3, "gBuffer":Lorg/glassfish/grizzly/Buffer;
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getContentLength()J

    move-result-wide v6

    const-wide/16 v8, -0x1

    cmp-long v5, v6, v8

    if-nez v5, :cond_1

    .line 1820
    array-length v5, v2

    int-to-long v6, v5

    invoke-virtual {p3, v6, v7}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentLengthLong(J)V

    .line 1822
    :cond_1
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->httpContentBuilder()Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->content(Lorg/glassfish/grizzly/Buffer;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v5

    invoke-virtual {v5, v10}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->last(Z)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->build()Lorg/glassfish/grizzly/http/HttpContent;

    move-result-object v1

    .line 1826
    .local v1, "content":Lorg/glassfish/grizzly/http/HttpContent;
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v5

    invoke-virtual {v5}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v5

    :goto_0
    invoke-virtual {p1, v1, v5}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 1827
    return v10

    .line 1826
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public handlesBodyType(Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1803
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getStringData()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
