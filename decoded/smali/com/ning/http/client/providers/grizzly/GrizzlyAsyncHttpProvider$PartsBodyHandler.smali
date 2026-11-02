.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;
.super Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PartsBodyHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1936
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 1936
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;-><init>()V

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
    .line 1950
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getParts()Ljava/util/List;

    move-result-object v5

    .line 1951
    .local v5, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/multipart/Part;>;"
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/ning/http/client/multipart/MultipartUtils;->newMultipartBody(Ljava/util/List;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/multipart/MultipartBody;

    move-result-object v4

    .line 1952
    .local v4, "multipartBody":Lcom/ning/http/client/multipart/MultipartBody;
    invoke-virtual {v4}, Lcom/ning/http/client/multipart/MultipartBody;->getContentLength()J

    move-result-wide v0

    .line 1953
    .local v0, "contentLength":J
    invoke-virtual {v4}, Lcom/ning/http/client/multipart/MultipartBody;->getContentType()Ljava/lang/String;

    move-result-object v2

    .line 1954
    .local v2, "contentType":Ljava/lang/String;
    invoke-virtual {p3, v0, v1}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentLengthLong(J)V

    .line 1955
    invoke-virtual {p3, v2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentType(Ljava/lang/String;)V

    .line 1956
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$100()Lorg/slf4j/Logger;

    move-result-object v6

    invoke-interface {v6}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1957
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$100()Lorg/slf4j/Logger;

    move-result-object v6

    const-string v7, "REQUEST(modified): contentLength={}, contentType={}"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getContentLength()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getContentType()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-interface {v6, v7, v8}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1960
    :cond_0
    new-instance v3, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$1;

    invoke-direct {v3, p0, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$1;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;Lcom/ning/http/client/multipart/MultipartBody;)V

    .line 1966
    .local v3, "generator":Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
    new-instance v6, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$2;

    invoke-direct {v6, p0, v3, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler$2;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V

    invoke-virtual {v3, v6}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->setFeeder(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;)V

    .line 2001
    invoke-virtual {v3, p1, p3}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->initializeAsynchronousTransfer(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 2002
    const/4 v6, 0x0

    return v6
.end method

.method public handlesBodyType(Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1942
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getParts()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method
