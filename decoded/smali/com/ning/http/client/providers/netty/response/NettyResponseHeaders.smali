.class public Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;
.super Lcom/ning/http/client/HttpResponseHeaders;
.source "NettyResponseHeaders.java"


# instance fields
.field private final headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

.field private final responseHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

.field private final trailingHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V
    .locals 1
    .param p1, "responseHeaders"    # Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;-><init>(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V
    .locals 1
    .param p1, "responseHeaders"    # Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .param p2, "traillingHeaders"    # Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .prologue
    .line 38
    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-direct {p0, v0}, Lcom/ning/http/client/HttpResponseHeaders;-><init>(Z)V

    .line 39
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;->responseHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 40
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;->trailingHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 41
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;->computerHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 42
    return-void

    .line 38
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private computerHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 5

    .prologue
    .line 45
    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    .line 46
    .local v0, "h":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;->responseHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 47
    .local v1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 50
    .end local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;->trailingHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    if-eqz v3, :cond_1

    .line 51
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;->trailingHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 52
    .restart local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_1

    .line 56
    .end local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-object v0
.end method


# virtual methods
.method public getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    return-object v0
.end method
