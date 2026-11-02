.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;
.super Lorg/glassfish/grizzly/filterchain/BaseFilter;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AsyncHttpClientFilter"
.end annotation


# instance fields
.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 0
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 618
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {p0}, Lorg/glassfish/grizzly/filterchain/BaseFilter;-><init>()V

    .line 620
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 622
    return-void
.end method

.method private addAcceptHeaders(Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 3
    .param p1, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    .line 925
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getHeaders()Lorg/glassfish/grizzly/http/util/MimeHeaders;

    move-result-object v0

    .line 926
    .local v0, "headers":Lorg/glassfish/grizzly/http/util/MimeHeaders;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isCompressionEnforced()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->AcceptEncoding:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->contains(Lorg/glassfish/grizzly/http/util/Header;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 928
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->AcceptEncoding:Lorg/glassfish/grizzly/http/util/Header;

    const-string v2, "gzip"

    invoke-virtual {p1, v1, v2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 931
    :cond_0
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Accept:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->contains(Lorg/glassfish/grizzly/http/util/Header;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 932
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Accept:Lorg/glassfish/grizzly/http/util/Header;

    const-string v2, "*/*"

    invoke-virtual {p1, v1, v2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 934
    :cond_1
    return-void
.end method

.method private addAuthorizationHeader(Lcom/ning/http/client/Realm;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 2
    .param p1, "realm"    # Lcom/ning/http/client/Realm;
    .param p2, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    .line 817
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getUsePreemptiveAuth()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 818
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->generateAuthHeader(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v0

    .line 819
    .local v0, "authHeaderValue":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 820
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Authorization:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {p2, v1, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 823
    .end local v0    # "authHeaderValue":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private addCookies(Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 5
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    .line 939
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getCookies()Ljava/util/Collection;

    move-result-object v0

    .line 940
    .local v0, "cookies":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/ning/http/client/cookie/Cookie;>;"
    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 941
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x80

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 942
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v3

    new-array v1, v3, [Lorg/glassfish/grizzly/http/Cookie;

    .line 944
    .local v1, "gCookies":[Lorg/glassfish/grizzly/http/Cookie;
    invoke-direct {p0, v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->convertCookies(Ljava/util/Collection;[Lorg/glassfish/grizzly/http/Cookie;)V

    .line 945
    invoke-static {v2, v1}, Lorg/glassfish/grizzly/http/util/CookieSerializerUtils;->serializeClientCookies(Ljava/lang/StringBuilder;[Lorg/glassfish/grizzly/http/Cookie;)V

    .line 946
    sget-object v3, Lorg/glassfish/grizzly/http/util/Header;->Cookie:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v3, v4}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 949
    .end local v1    # "gCookies":[Lorg/glassfish/grizzly/http/Cookie;
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    return-void
.end method

.method private addHostHeaderIfNeeded(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 4
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    .line 840
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Host:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {p3, v1}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->containsHeader(Lorg/glassfish/grizzly/http/util/Header;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 841
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v0

    .line 842
    .local v0, "host":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 843
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Host:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {p3, v1, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 852
    .end local v0    # "host":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 845
    .restart local v0    # "host":Ljava/lang/String;
    :cond_1
    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .line 846
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Host:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1, v2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    goto :goto_0

    .line 848
    :cond_2
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Host:Lorg/glassfish/grizzly/http/util/Header;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1, v2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private addProxyHeaders(Lcom/ning/http/client/ProxyServer;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 2
    .param p1, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p2, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    .line 828
    invoke-virtual {p2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getHeaders()Lorg/glassfish/grizzly/http/util/MimeHeaders;

    move-result-object v0

    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->ProxyConnection:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->contains(Lorg/glassfish/grizzly/http/util/Header;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 829
    sget-object v0, Lorg/glassfish/grizzly/http/util/Header;->ProxyConnection:Lorg/glassfish/grizzly/http/util/Header;

    const-string v1, "keep-alive"

    invoke-virtual {p2, v0, v1}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 832
    :cond_0
    invoke-virtual {p1}, Lcom/ning/http/client/ProxyServer;->getPrincipal()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 833
    sget-object v0, Lorg/glassfish/grizzly/http/util/Header;->ProxyAuthorization:Lorg/glassfish/grizzly/http/util/Header;

    invoke-static {p1}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 836
    :cond_1
    return-void
.end method

.method private addServiceHeaders(Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 3
    .param p1, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    .line 914
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getHeaders()Lorg/glassfish/grizzly/http/util/MimeHeaders;

    move-result-object v0

    .line 915
    .local v0, "headers":Lorg/glassfish/grizzly/http/util/MimeHeaders;
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Connection:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->contains(Lorg/glassfish/grizzly/http/util/Header;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 916
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Connection:Lorg/glassfish/grizzly/http/util/Header;

    const-string v2, "keep-alive"

    invoke-virtual {p1, v1, v2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 919
    :cond_0
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->UserAgent:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->contains(Lorg/glassfish/grizzly/http/util/Header;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 920
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->UserAgent:Lorg/glassfish/grizzly/http/util/Header;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getUserAgent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Lorg/glassfish/grizzly/http/util/Header;Ljava/lang/String;)V

    .line 922
    :cond_1
    return-void
.end method

.method private convertCookies(Ljava/util/Collection;[Lorg/glassfish/grizzly/http/Cookie;)V
    .locals 7
    .param p2, "gCookies"    # [Lorg/glassfish/grizzly/http/Cookie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;[",
            "Lorg/glassfish/grizzly/http/Cookie;",
            ")V"
        }
    .end annotation

    .prologue
    .line 954
    .local p1, "cookies":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/ning/http/client/cookie/Cookie;>;"
    const/4 v2, 0x0

    .line 955
    .local v2, "idx":I
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/cookie/Cookie;

    .line 956
    .local v0, "cookie":Lcom/ning/http/client/cookie/Cookie;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "idx":I
    .local v3, "idx":I
    new-instance v4, Lorg/glassfish/grizzly/http/Cookie;

    invoke-virtual {v0}, Lcom/ning/http/client/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/ning/http/client/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/glassfish/grizzly/http/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v4, p2, v2

    move v2, v3

    .line 958
    .end local v3    # "idx":I
    .restart local v2    # "idx":I
    goto :goto_0

    .line 960
    .end local v0    # "cookie":Lcom/ning/http/client/cookie/Cookie;
    :cond_0
    return-void
.end method

.method private convertToUpgradeRequest(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V
    .locals 3
    .param p1, "ctx"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    .line 887
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->requestUri:Lcom/ning/http/client/uri/Uri;

    .line 889
    .local v0, "requestUri":Lcom/ning/http/client/uri/Uri;
    iput-object v0, p1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->wsRequestURI:Lcom/ning/http/client/uri/Uri;

    .line 890
    const-string v1, "ws"

    invoke-virtual {v0}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "http"

    :goto_0
    invoke-virtual {v0, v1}, Lcom/ning/http/client/uri/Uri;->withNewScheme(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    iput-object v1, p1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->requestUri:Lcom/ning/http/client/uri/Uri;

    .line 894
    return-void

    .line 890
    :cond_0
    const-string v1, "https"

    goto :goto_0
.end method

.method private copyHeaders(Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 8
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    .line 899
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v6

    .line 900
    .local v6, "map":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    invoke-static {v6}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Map;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 901
    invoke-virtual {v6}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 902
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 903
    .local v1, "headerName":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 904
    .local v3, "headerValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v3}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 905
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 906
    .local v2, "headerValue":Ljava/lang/String;
    invoke-virtual {p2, v1, v2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 911
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v1    # "headerName":Ljava/lang/String;
    .end local v2    # "headerValue":Ljava/lang/String;
    .end local v3    # "headerValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method private establishConnectTunnel(Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z
    .locals 5
    .param p1, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p2, "httpCtx"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .param p3, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p4, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 768
    invoke-virtual {p4}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    .line 770
    .local v0, "connection":Lorg/glassfish/grizzly/Connection;
    invoke-static {}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->builder()Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    move-result-object v3

    sget-object v4, Lorg/glassfish/grizzly/http/Protocol;->HTTP_1_0:Lorg/glassfish/grizzly/http/Protocol;

    invoke-virtual {v3, v4}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->protocol(Lorg/glassfish/grizzly/http/Protocol;)Lorg/glassfish/grizzly/http/HttpHeader$Builder;

    move-result-object v3

    check-cast v3, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    sget-object v4, Lorg/glassfish/grizzly/http/Method;->CONNECT:Lorg/glassfish/grizzly/http/Method;

    invoke-virtual {v3, v4}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->method(Lorg/glassfish/grizzly/http/Method;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    move-result-object v3

    invoke-static {p3}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getAuthority(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->uri(Ljava/lang/String;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->build()Lorg/glassfish/grizzly/http/HttpRequestPacket;

    move-result-object v2

    .line 777
    .local v2, "requestPacket":Lorg/glassfish/grizzly/http/HttpRequestPacket;
    const/4 v3, 0x1

    iput-boolean v3, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->establishingTunnel:Z

    .line 780
    new-instance v3, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;-><init>(ZLorg/glassfish/grizzly/Connection;)V

    invoke-virtual {p4, v3}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->notifyDownstream(Lorg/glassfish/grizzly/filterchain/FilterChainEvent;)V

    .line 782
    iget-object v1, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    .line 783
    .local v1, "request":Lcom/ning/http/client/Request;
    invoke-direct {p0, v1, p3, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addHostHeaderIfNeeded(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 784
    invoke-direct {p0, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addServiceHeaders(Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 785
    invoke-direct {p0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->getRealm(Lcom/ning/http/client/Request;)Lcom/ning/http/client/Realm;

    move-result-object v3

    invoke-direct {p0, v3, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addAuthorizationHeader(Lcom/ning/http/client/Realm;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 786
    invoke-direct {p0, p1, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addProxyHeaders(Lcom/ning/http/client/ProxyServer;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 788
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    const/4 v4, 0x0

    invoke-virtual {v3, p2, p4, v2, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->sendRequest(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;)Z

    move-result v3

    return v3
.end method

.method private generateAuthHeader(Lcom/ning/http/client/Realm;)Ljava/lang/String;
    .locals 3
    .param p1, "realm"    # Lcom/ning/http/client/Realm;

    .prologue
    .line 860
    :try_start_0
    sget-object v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$5;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    invoke-virtual {p1}, Lcom/ning/http/client/Realm;->getScheme()Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/Realm$AuthScheme;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 868
    const/4 v1, 0x0

    :goto_0
    return-object v1

    .line 862
    :pswitch_0
    invoke-static {p1}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 864
    :pswitch_1
    invoke-static {p1}, Lcom/ning/http/util/AuthenticatorUtils;->computeDigestAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 866
    :pswitch_2
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$600()Lcom/ning/http/client/ntlm/NTLMEngine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/ntlm/NTLMEngine;->generateType1Msg()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 870
    :catch_0
    move-exception v0

    .line 871
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 860
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private getRealm(Lcom/ning/http/client/Request;)Lcom/ning/http/client/Realm;
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 855
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v0

    goto :goto_0
.end method

.method private isPayloadAllowed(Lorg/glassfish/grizzly/http/Method;)Z
    .locals 2
    .param p1, "method"    # Lorg/glassfish/grizzly/http/Method;

    .prologue
    .line 813
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/Method;->getPayloadExpectation()Lorg/glassfish/grizzly/http/Method$PayloadExpectation;

    move-result-object v0

    sget-object v1, Lorg/glassfish/grizzly/http/Method$PayloadExpectation;->NOT_ALLOWED:Lorg/glassfish/grizzly/http/Method$PayloadExpectation;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isUpgradeRequest(Lcom/ning/http/client/AsyncHandler;)Z
    .locals 1
    .param p1, "handler"    # Lcom/ning/http/client/AsyncHandler;

    .prologue
    .line 877
    instance-of v0, p1, Lcom/ning/http/client/UpgradeHandler;

    return v0
.end method

.method private isWSRequest(Lcom/ning/http/client/uri/Uri;)Z
    .locals 2
    .param p1, "requestUri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 882
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ws"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private sendAsGrizzlyRequest(Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z
    .locals 23
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 667
    invoke-virtual/range {p2 .. p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v6

    .line 669
    .local v6, "connection":Lorg/glassfish/grizzly/Connection;
    invoke-static {v6}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v10

    .line 670
    .local v10, "httpCtx":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-object v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->isUpgradeRequest(Lcom/ning/http/client/AsyncHandler;)Z

    move-result v20

    if-eqz v20, :cond_0

    iget-object v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->requestUri:Lcom/ning/http/client/uri/Uri;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->isWSRequest(Lcom/ning/http/client/uri/Uri;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 671
    const/16 v20, 0x1

    move/from16 v0, v20

    iput-boolean v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isWSRequest:Z

    .line 672
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->convertToUpgradeRequest(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V

    .line 674
    :cond_0
    iget-object v14, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    .line 675
    .local v14, "req":Lcom/ning/http/client/Request;
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lorg/glassfish/grizzly/http/Method;->valueOf(Ljava/lang/String;)Lorg/glassfish/grizzly/http/Method;

    move-result-object v12

    .line 676
    .local v12, "method":Lorg/glassfish/grizzly/http/Method;
    invoke-interface {v14}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v17

    .line 678
    .local v17, "uri":Lcom/ning/http/client/uri/Uri;
    const-string v20, "https"

    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    .line 680
    .local v16, "secure":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcom/ning/http/util/ProxyUtils;->getProxyServer(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Lcom/ning/http/client/ProxyServer;

    move-result-object v13

    .line 681
    .local v13, "proxy":Lcom/ning/http/client/ProxyServer;
    if-eqz v13, :cond_2

    const/16 v18, 0x1

    .line 683
    .local v18, "useProxy":Z
    :goto_0
    if-eqz v18, :cond_3

    if-nez v16, :cond_1

    iget-boolean v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isWSRequest:Z

    move/from16 v20, v0

    if-eqz v20, :cond_3

    :cond_1
    invoke-virtual {v10, v6}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isTunnelEstablished(Lorg/glassfish/grizzly/Connection;)Z

    move-result v20

    if-nez v20, :cond_3

    const/4 v11, 0x1

    .line 687
    .local v11, "isEstablishingConnectTunnel":Z
    :goto_1
    if-eqz v11, :cond_4

    .line 690
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p2

    invoke-direct {v0, v13, v10, v1, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->establishConnectTunnel(Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z

    move-result v20

    .line 758
    :goto_2
    return v20

    .line 681
    .end local v11    # "isEstablishingConnectTunnel":Z
    .end local v18    # "useProxy":Z
    :cond_2
    const/16 v18, 0x0

    goto :goto_0

    .line 683
    .restart local v18    # "useProxy":Z
    :cond_3
    const/4 v11, 0x0

    goto :goto_1

    .line 693
    .restart local v11    # "isEstablishingConnectTunnel":Z
    :cond_4
    invoke-static {}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->builder()Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    move-result-object v20

    sget-object v21, Lorg/glassfish/grizzly/http/Protocol;->HTTP_1_1:Lorg/glassfish/grizzly/http/Protocol;

    invoke-virtual/range {v20 .. v21}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->protocol(Lorg/glassfish/grizzly/http/Protocol;)Lorg/glassfish/grizzly/http/HttpHeader$Builder;

    move-result-object v20

    check-cast v20, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->method(Lorg/glassfish/grizzly/http/Method;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    move-result-object v5

    .line 698
    .local v5, "builder":Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;
    if-eqz v18, :cond_a

    .line 699
    if-nez v16, :cond_5

    iget-boolean v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isWSRequest:Z

    move/from16 v20, v0

    if-eqz v20, :cond_9

    .line 700
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/ning/http/client/AsyncHttpClientConfig;->isUseRelativeURIsWithConnectProxies()Z

    move-result v20

    if-eqz v20, :cond_8

    .line 701
    invoke-static/range {v17 .. v17}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getNonEmptyPath(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->uri(Ljava/lang/String;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    .line 702
    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->query(Ljava/lang/String;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    .line 715
    :goto_3
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->isPayloadAllowed(Lorg/glassfish/grizzly/http/Method;)Z

    move-result v20

    if-eqz v20, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$400(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;->getBodyHandler(Lcom/ning/http/client/Request;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    move-result-object v4

    .line 719
    .local v4, "bodyHandler":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    :goto_4
    if-eqz v4, :cond_6

    .line 720
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getContentLength()J

    move-result-wide v8

    .line 721
    .local v8, "contentLength":J
    const-wide/16 v20, 0x0

    cmp-long v20, v8, v20

    if-ltz v20, :cond_c

    .line 722
    invoke-virtual {v5, v8, v9}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->contentLength(J)Lorg/glassfish/grizzly/http/HttpHeader$Builder;

    .line 723
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->chunked(Z)Lorg/glassfish/grizzly/http/HttpHeader$Builder;

    .line 729
    .end local v8    # "contentLength":J
    :cond_6
    :goto_5
    iget-boolean v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isWSRequest:Z

    move/from16 v20, v0

    if-eqz v20, :cond_d

    .line 731
    :try_start_0
    iget-object v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->wsRequestURI:Lcom/ning/http/client/uri/Uri;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/ning/http/client/uri/Uri;->toJavaNetURI()Ljava/net/URI;

    move-result-object v19

    .line 732
    .local v19, "wsURI":Ljava/net/URI;
    const-string v20, "wss"

    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v16

    .line 733
    sget-object v20, Lorg/glassfish/grizzly/websockets/Version;->RFC6455:Lorg/glassfish/grizzly/websockets/Version;

    const/16 v21, 0x1

    invoke-virtual/range {v20 .. v21}, Lorg/glassfish/grizzly/websockets/Version;->createHandler(Z)Lorg/glassfish/grizzly/websockets/ProtocolHandler;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->protocolHandler:Lorg/glassfish/grizzly/websockets/ProtocolHandler;

    .line 734
    iget-object v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->protocolHandler:Lorg/glassfish/grizzly/websockets/ProtocolHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/websockets/ProtocolHandler;->createHandShake(Ljava/net/URI;)Lorg/glassfish/grizzly/websockets/HandShake;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handshake:Lorg/glassfish/grizzly/websockets/HandShake;

    .line 735
    iget-object v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handshake:Lorg/glassfish/grizzly/websockets/HandShake;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/glassfish/grizzly/websockets/HandShake;->composeHeaders()Lorg/glassfish/grizzly/http/HttpContent;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lorg/glassfish/grizzly/http/HttpContent;->getHttpHeader()Lorg/glassfish/grizzly/http/HttpHeader;

    move-result-object v15

    check-cast v15, Lorg/glassfish/grizzly/http/HttpRequestPacket;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 743
    .end local v19    # "wsURI":Ljava/net/URI;
    .local v15, "requestPacket":Lorg/glassfish/grizzly/http/HttpRequestPacket;
    :goto_6
    invoke-virtual/range {v15 .. v16}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setSecure(Z)V

    .line 744
    new-instance v20, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;

    move-object/from16 v0, v20

    move/from16 v1, v16

    invoke-direct {v0, v1, v6}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;-><init>(ZLorg/glassfish/grizzly/Connection;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->notifyDownstream(Lorg/glassfish/grizzly/filterchain/FilterChainEvent;)V

    .line 746
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v15}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->copyHeaders(Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 747
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v15}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addCookies(Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 749
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2, v15}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addHostHeaderIfNeeded(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 750
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addServiceHeaders(Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 751
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addAcceptHeaders(Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 752
    invoke-direct/range {p0 .. p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->getRealm(Lcom/ning/http/client/Request;)Lcom/ning/http/client/Realm;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v15}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addAuthorizationHeader(Lcom/ning/http/client/Realm;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 754
    if-eqz v18, :cond_7

    .line 755
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v15}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->addProxyHeaders(Lcom/ning/http/client/ProxyServer;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V

    .line 758
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v15}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->wrapWithExpectHandlerIfNeeded(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    move-object/from16 v2, v21

    invoke-virtual {v0, v10, v1, v15, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->sendRequest(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;)Z

    move-result v20

    goto/16 :goto_2

    .line 704
    .end local v4    # "bodyHandler":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    .end local v15    # "requestPacket":Lorg/glassfish/grizzly/http/HttpRequestPacket;
    :cond_8
    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->uri(Ljava/lang/String;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    goto/16 :goto_3

    .line 707
    :cond_9
    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->uri(Ljava/lang/String;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    goto/16 :goto_3

    .line 710
    :cond_a
    invoke-static/range {v17 .. v17}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getNonEmptyPath(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->uri(Ljava/lang/String;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    .line 711
    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->query(Ljava/lang/String;)Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;

    goto/16 :goto_3

    .line 715
    :cond_b
    const/4 v4, 0x0

    goto/16 :goto_4

    .line 725
    .restart local v4    # "bodyHandler":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    .restart local v8    # "contentLength":J
    :cond_c
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->chunked(Z)Lorg/glassfish/grizzly/http/HttpHeader$Builder;

    goto/16 :goto_5

    .line 736
    .end local v8    # "contentLength":J
    :catch_0
    move-exception v7

    .line 737
    .local v7, "e":Ljava/net/URISyntaxException;
    new-instance v20, Ljava/lang/IllegalArgumentException;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Invalid WS URI: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget-object v0, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->wsRequestURI:Lcom/ning/http/client/uri/Uri;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 740
    .end local v7    # "e":Ljava/net/URISyntaxException;
    :cond_d
    invoke-virtual {v5}, Lorg/glassfish/grizzly/http/HttpRequestPacket$Builder;->build()Lorg/glassfish/grizzly/http/HttpRequestPacket;

    move-result-object v15

    .restart local v15    # "requestPacket":Lorg/glassfish/grizzly/http/HttpRequestPacket;
    goto/16 :goto_6
.end method

.method private wrapWithExpectHandlerIfNeeded(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    .locals 5
    .param p1, "bodyHandler"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    .param p2, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    const/4 v3, 0x0

    .line 798
    if-nez p1, :cond_1

    move-object p1, v3

    .line 806
    .end local p1    # "bodyHandler":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    :cond_0
    :goto_0
    return-object p1

    .line 803
    .restart local p1    # "bodyHandler":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    :cond_1
    invoke-virtual {p2}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getHeaders()Lorg/glassfish/grizzly/http/util/MimeHeaders;

    move-result-object v1

    .line 804
    .local v1, "headers":Lorg/glassfish/grizzly/http/util/MimeHeaders;
    sget-object v2, Lorg/glassfish/grizzly/http/util/Header;->Expect:Lorg/glassfish/grizzly/http/util/Header;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->indexOf(Lorg/glassfish/grizzly/http/util/Header;I)I

    move-result v0

    .line 806
    .local v0, "expectHeaderIdx":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    invoke-virtual {v1, v0}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->getValue(I)Lorg/glassfish/grizzly/http/util/DataChunk;

    move-result-object v2

    const-string v4, "100-Continue"

    invoke-virtual {v2, v4}, Lorg/glassfish/grizzly/http/util/DataChunk;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;

    invoke-direct {v2, p1, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    move-object p1, v2

    goto :goto_0
.end method


# virtual methods
.method public handleEvent(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/filterchain/FilterChainEvent;)Lorg/glassfish/grizzly/filterchain/NextAction;
    .locals 3
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "event"    # Lorg/glassfish/grizzly/filterchain/FilterChainEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 650
    invoke-interface {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainEvent;->type()Ljava/lang/Object;

    move-result-object v1

    .line 651
    .local v1, "type":Ljava/lang/Object;
    const-class v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;

    if-ne v1, v2, :cond_0

    move-object v0, p2

    .line 652
    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;

    .line 653
    .local v0, "continueEvent":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;
    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;->access$300(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v2

    iget-object v2, v2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->bodyHandler:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    check-cast v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;

    invoke-virtual {v2, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;->finish(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V

    .line 656
    .end local v0    # "continueEvent":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;
    :cond_0
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getStopAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v2

    return-object v2
.end method

.method public handleWrite(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Lorg/glassfish/grizzly/filterchain/NextAction;
    .locals 2
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 632
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getMessage()Ljava/lang/Object;

    move-result-object v0

    .line 633
    .local v0, "message":Ljava/lang/Object;
    instance-of v1, v0, Lcom/ning/http/client/Request;

    if-eqz v1, :cond_0

    .line 634
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->setMessage(Ljava/lang/Object;)V

    .line 635
    check-cast v0, Lcom/ning/http/client/Request;

    .end local v0    # "message":Ljava/lang/Object;
    invoke-direct {p0, v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;->sendAsGrizzlyRequest(Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 636
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getSuspendAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v1

    .line 642
    :goto_0
    return-object v1

    .line 638
    .restart local v0    # "message":Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Lorg/glassfish/grizzly/Buffer;

    if-eqz v1, :cond_1

    .line 639
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getInvokeAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v1

    goto :goto_0

    .line 642
    .end local v0    # "message":Ljava/lang/Object;
    :cond_1
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getStopAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v1

    goto :goto_0
.end method
