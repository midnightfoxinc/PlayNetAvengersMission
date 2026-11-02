.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ByteArrayBodyHandler;
.super Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ByteArrayBodyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V
    .locals 0

    .prologue
    .line 1758
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ByteArrayBodyHandler;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 1758
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ByteArrayBodyHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V

    return-void
.end method


# virtual methods
.method public doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
    .locals 9
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p3, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 1773
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getMemoryManager()Lorg/glassfish/grizzly/memory/MemoryManager;

    move-result-object v3

    .line 1774
    .local v3, "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v1

    .line 1775
    .local v1, "data":[B
    invoke-static {v3, v1}, Lorg/glassfish/grizzly/memory/Buffers;->wrap(Lorg/glassfish/grizzly/memory/MemoryManager;[B)Lorg/glassfish/grizzly/Buffer;

    move-result-object v2

    .line 1776
    .local v2, "gBuffer":Lorg/glassfish/grizzly/Buffer;
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getContentLength()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 1777
    array-length v4, v1

    int-to-long v4, v4

    invoke-virtual {p3, v4, v5}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentLengthLong(J)V

    .line 1779
    :cond_0
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->httpContentBuilder()Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->content(Lorg/glassfish/grizzly/Buffer;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v4

    invoke-virtual {v4, v8}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->last(Z)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->build()Lorg/glassfish/grizzly/http/HttpContent;

    move-result-object v0

    .line 1783
    .local v0, "content":Lorg/glassfish/grizzly/http/HttpContent;
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v4

    invoke-virtual {v4}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v4

    :goto_0
    invoke-virtual {p1, v0, v4}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 1784
    return v8

    .line 1783
    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method protected getContentLength(Lcom/ning/http/client/Request;)J
    .locals 4
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1789
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
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v0

    array-length v0, v0

    int-to-long v0, v0

    goto :goto_0
.end method

.method public handlesBodyType(Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1764
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
