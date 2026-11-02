.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;
.super Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ExpectHandler"
.end annotation


# instance fields
.field private final delegate:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

.field private request:Lcom/ning/http/client/Request;

.field private requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;)V
    .locals 0
    .param p1, "delegate"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    .prologue
    .line 1722
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;-><init>()V

    .line 1724
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->delegate:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    .line 1726
    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    .prologue
    .line 1713
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;)V

    return-void
.end method


# virtual methods
.method public doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
    .locals 4
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p3, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1738
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->request:Lcom/ning/http/client/Request;

    .line 1739
    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .line 1742
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->delegate:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    invoke-virtual {v2, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;->getContentLength(Lcom/ning/http/client/Request;)J

    move-result-wide v0

    .line 1743
    .local v0, "contentLength":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 1744
    invoke-virtual {p3, v0, v1}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setContentLengthLong(J)V

    .line 1747
    :cond_0
    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v2

    invoke-virtual {v2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v2

    :goto_0
    invoke-virtual {p1, p3, v2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 1748
    const/4 v2, 0x1

    return v2

    .line 1747
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public finish(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V
    .locals 3
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1752
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->delegate:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->request:Lcom/ning/http/client/Request;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    invoke-virtual {v0, p1, v1, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;->doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z

    .line 1753
    return-void
.end method

.method public handlesBodyType(Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 1733
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->delegate:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;->handlesBodyType(Lcom/ning/http/client/Request;)Z

    move-result v0

    return v0
.end method
