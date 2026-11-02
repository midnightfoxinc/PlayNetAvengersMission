.class public abstract Lcom/ning/http/client/providers/netty/handler/Protocol;
.super Ljava/lang/Object;
.source "Protocol.java"


# static fields
.field public static final REDIRECT_STATUSES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

.field protected final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field protected final hasIOExceptionFilters:Z

.field private final hasResponseFilters:Z

.field protected final logger:Lorg/slf4j/Logger;

.field private final maxRedirectException:Lcom/ning/http/client/MaxRedirectException;

.field protected final nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

.field protected final requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 67
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->REDIRECT_STATUSES:Ljava/util/Set;

    .line 69
    sget-object v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->REDIRECT_STATUSES:Ljava/util/Set;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->MOVED_PERMANENTLY:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 70
    sget-object v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->REDIRECT_STATUSES:Ljava/util/Set;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->FOUND:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 71
    sget-object v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->REDIRECT_STATUSES:Ljava/util/Set;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->SEE_OTHER:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 72
    sget-object v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->REDIRECT_STATUSES:Ljava/util/Set;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->TEMPORARY_REDIRECT:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 73
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;)V
    .locals 4
    .param p1, "channelManager"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p3, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .param p4, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->logger:Lorg/slf4j/Logger;

    .line 77
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .line 78
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 79
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .line 80
    iput-object p4, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    .line 82
    invoke-virtual {p2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getResponseFilters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->hasResponseFilters:Z

    .line 83
    invoke-virtual {p2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIOExceptionFilters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->hasIOExceptionFilters:Z

    .line 84
    new-instance v0, Lcom/ning/http/client/MaxRedirectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Maximum redirect reached: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxRedirects()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ning/http/client/MaxRedirectException;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->maxRedirectException:Lcom/ning/http/client/MaxRedirectException;

    .line 85
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->maxRedirectException:Lcom/ning/http/client/MaxRedirectException;

    new-array v1, v2, [Ljava/lang/StackTraceElement;

    invoke-virtual {v0, v1}, Lcom/ning/http/client/MaxRedirectException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 86
    return-void

    :cond_0
    move v0, v2

    .line 82
    goto :goto_0

    :cond_1
    move v1, v2

    .line 83
    goto :goto_1
.end method

.method private propagatedHeaders(Lcom/ning/http/client/Request;Z)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 2
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "switchToGet"    # Z

    .prologue
    .line 96
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    .line 97
    .local v0, "originalHeaders":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    const-string v1, "Host"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 98
    const-string v1, "Content-Length"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 99
    if-eqz p2, :cond_0

    .line 100
    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 101
    :cond_0
    return-object v0
.end method


# virtual methods
.method protected exitAfterHandlingRedirect(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/Request;I)Z
    .locals 18
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p4, "request"    # Lcom/ning/http/client/Request;
    .param p5, "statusCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/handler/codec/http/HttpResponse;",
            "Lcom/ning/http/client/Request;",
            "I)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 111
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v0, p4

    invoke-static {v15, v0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->followRedirect(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Z

    move-result v15

    if-eqz v15, :cond_a

    sget-object v15, Lcom/ning/http/client/providers/netty/handler/Protocol;->REDIRECT_STATUSES:Ljava/util/Set;

    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_a

    .line 112
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->incrementAndGetCurrentRedirectCount()I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxRedirects()I

    move-result v16

    move/from16 v0, v16

    if-lt v15, v0, :cond_0

    .line 113
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->maxRedirectException:Lcom/ning/http/client/MaxRedirectException;

    throw v15

    .line 117
    :cond_0
    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAndSetAuth(Z)Z

    .line 119
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v12

    .line 120
    .local v12, "responseHeaders":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    const-string v15, "Location"

    invoke-virtual {v12, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 121
    .local v7, "location":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v15

    invoke-static {v15, v7}, Lcom/ning/http/client/uri/Uri;->create(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v14

    .line 123
    .local v14, "uri":Lcom/ning/http/client/uri/Uri;
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/ning/http/client/uri/Uri;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_a

    .line 124
    new-instance v11, Lcom/ning/http/client/RequestBuilder;

    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v15

    invoke-direct {v11, v15}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    .line 128
    .local v11, "requestBuilder":Lcom/ning/http/client/RequestBuilder;
    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v15

    const-string v16, "GET"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_5

    const/16 v15, 0x12f

    move/from16 v0, p5

    if-eq v0, v15, :cond_1

    const/16 v15, 0x12e

    move/from16 v0, p5

    if-ne v0, v15, :cond_5

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v15}, Lcom/ning/http/client/AsyncHttpClientConfig;->isStrict302Handling()Z

    move-result v15

    if-nez v15, :cond_5

    :cond_1
    const/4 v13, 0x1

    .line 129
    .local v13, "switchToGet":Z
    :goto_0
    if-eqz v13, :cond_2

    .line 130
    const-string v15, "GET"

    invoke-virtual {v11, v15}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 133
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isKeepAlive()Z

    move-result v5

    .line 134
    .local v5, "initialConnectionKeepAlive":Z
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getPartition()Ljava/lang/String;

    move-result-object v6

    .line 136
    .local v6, "initialPartition":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setUri(Lcom/ning/http/client/uri/Uri;)V

    .line 137
    invoke-virtual {v14}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v8

    .line 138
    .local v8, "newUrl":Ljava/lang/String;
    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v15

    invoke-virtual {v15}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v15

    const-string v16, "ws"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 139
    const-string v15, "http"

    const-string v16, "ws"

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 142
    :cond_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->logger:Lorg/slf4j/Logger;

    const-string v16, "Redirecting to {}"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v8}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    const-string v15, "Set-Cookie"

    invoke-virtual {v12, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 145
    .local v3, "cookieStr":Ljava/lang/String;
    invoke-static {v3}, Lcom/ning/http/client/cookie/CookieDecoder;->decode(Ljava/lang/String;)Lcom/ning/http/client/cookie/Cookie;

    move-result-object v2

    .line 146
    .local v2, "c":Lcom/ning/http/client/cookie/Cookie;
    if-eqz v2, :cond_4

    .line 147
    invoke-virtual {v11, v2}, Lcom/ning/http/client/RequestBuilder;->addOrReplaceCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilder;

    goto :goto_1

    .line 128
    .end local v2    # "c":Lcom/ning/http/client/cookie/Cookie;
    .end local v3    # "cookieStr":Ljava/lang/String;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "initialConnectionKeepAlive":Z
    .end local v6    # "initialPartition":Ljava/lang/String;
    .end local v8    # "newUrl":Ljava/lang/String;
    .end local v13    # "switchToGet":Z
    :cond_5
    const/4 v13, 0x0

    goto :goto_0

    .line 150
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v5    # "initialConnectionKeepAlive":Z
    .restart local v6    # "initialPartition":Ljava/lang/String;
    .restart local v8    # "newUrl":Ljava/lang/String;
    .restart local v13    # "switchToGet":Z
    :cond_6
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v13}, Lcom/ning/http/client/providers/netty/handler/Protocol;->propagatedHeaders(Lcom/ning/http/client/Request;Z)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v15

    invoke-virtual {v11, v15}, Lcom/ning/http/client/RequestBuilder;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilder;

    .line 152
    invoke-virtual {v11, v8}, Lcom/ning/http/client/RequestBuilder;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v15

    invoke-virtual {v15}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v9

    .line 154
    .local v9, "nextRequest":Lcom/ning/http/client/Request;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->logger:Lorg/slf4j/Logger;

    const-string v16, "Sending redirect to {}"

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v17

    invoke-interface/range {v15 .. v17}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 156
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isKeepAlive()Z

    move-result v15

    if-eqz v15, :cond_9

    invoke-static/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v15

    if-nez v15, :cond_9

    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->isChunked()Z

    move-result v15

    if-nez v15, :cond_9

    .line 158
    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v15

    invoke-virtual {v15}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v9}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v15

    invoke-virtual {v15}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v9}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v15

    invoke-virtual {v15}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v15

    invoke-interface {v9}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_7

    const/4 v10, 0x1

    .line 162
    .local v10, "redirectToSameHost":Z
    :goto_2
    if-eqz v10, :cond_8

    .line 163
    const/4 v15, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setReuseChannel(Z)V

    .line 173
    .end local v10    # "redirectToSameHost":Z
    :goto_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    move-object/from16 v0, p2

    invoke-virtual {v15, v9, v0}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendNextRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    .line 174
    const/4 v15, 0x1

    .line 178
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "initialConnectionKeepAlive":Z
    .end local v6    # "initialPartition":Ljava/lang/String;
    .end local v7    # "location":Ljava/lang/String;
    .end local v8    # "newUrl":Ljava/lang/String;
    .end local v9    # "nextRequest":Lcom/ning/http/client/Request;
    .end local v11    # "requestBuilder":Lcom/ning/http/client/RequestBuilder;
    .end local v12    # "responseHeaders":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .end local v13    # "switchToGet":Z
    .end local v14    # "uri":Lcom/ning/http/client/uri/Uri;
    :goto_4
    return v15

    .line 158
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v5    # "initialConnectionKeepAlive":Z
    .restart local v6    # "initialPartition":Ljava/lang/String;
    .restart local v7    # "location":Ljava/lang/String;
    .restart local v8    # "newUrl":Ljava/lang/String;
    .restart local v9    # "nextRequest":Lcom/ning/http/client/Request;
    .restart local v11    # "requestBuilder":Lcom/ning/http/client/RequestBuilder;
    .restart local v12    # "responseHeaders":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .restart local v13    # "switchToGet":Z
    .restart local v14    # "uri":Lcom/ning/http/client/uri/Uri;
    :cond_7
    const/4 v10, 0x0

    goto :goto_2

    .line 165
    .restart local v10    # "redirectToSameHost":Z
    :cond_8
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v15, v0, v1, v5, v6}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->drainChannelAndOffer(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLjava/lang/String;)V

    goto :goto_3

    .line 170
    .end local v10    # "redirectToSameHost":Z
    :cond_9
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/handler/Protocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_3

    .line 178
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "initialConnectionKeepAlive":Z
    .end local v6    # "initialPartition":Ljava/lang/String;
    .end local v7    # "location":Ljava/lang/String;
    .end local v8    # "newUrl":Ljava/lang/String;
    .end local v9    # "nextRequest":Lcom/ning/http/client/Request;
    .end local v11    # "requestBuilder":Lcom/ning/http/client/RequestBuilder;
    .end local v12    # "responseHeaders":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .end local v13    # "switchToGet":Z
    .end local v14    # "uri":Lcom/ning/http/client/uri/Uri;
    :cond_a
    const/4 v15, 0x0

    goto :goto_4
.end method

.method protected exitAfterProcessingFilters(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;)Z
    .locals 6
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p4, "status"    # Lcom/ning/http/client/HttpResponseStatus;
    .param p5, "responseHeaders"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;",
            "Lcom/ning/http/client/HttpResponseStatus;",
            "Lcom/ning/http/client/HttpResponseHeaders;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    .local p3, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    iget-boolean v4, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->hasResponseFilters:Z

    if-eqz v4, :cond_2

    .line 190
    new-instance v4, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct {v4}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>()V

    invoke-virtual {v4, p3}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v4

    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseStatus(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v4

    invoke-virtual {v4, p5}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseHeaders(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;

    move-result-object v2

    .line 193
    .local v2, "fc":Lcom/ning/http/client/filter/FilterContext;
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v4}, Lcom/ning/http/client/AsyncHttpClientConfig;->getResponseFilters()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/filter/ResponseFilter;

    .line 195
    .local v0, "asyncFilter":Lcom/ning/http/client/filter/ResponseFilter;
    :try_start_0
    invoke-interface {v0, v2}, Lcom/ning/http/client/filter/ResponseFilter;->filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;

    move-result-object v2

    .line 197
    if-nez v2, :cond_0

    .line 198
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "FilterContext is null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Lcom/ning/http/client/filter/FilterException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    :catch_0
    move-exception v1

    .line 201
    .local v1, "efe":Lcom/ning/http/client/filter/FilterException;
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v4, p1, p2, v1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 206
    .end local v0    # "asyncFilter":Lcom/ning/http/client/filter/ResponseFilter;
    .end local v1    # "efe":Lcom/ning/http/client/filter/FilterException;
    :cond_1
    invoke-virtual {v2}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setAsyncHandler(Lcom/ning/http/client/AsyncHandler;)V

    .line 209
    invoke-virtual {v2}, Lcom/ning/http/client/filter/FilterContext;->replayRequest()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 210
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/handler/Protocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v4, p2, v2, p1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->replayRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/filter/FilterContext;Lorg/jboss/netty/channel/Channel;)V

    .line 211
    const/4 v4, 0x1

    .line 214
    .end local v2    # "fc":Lcom/ning/http/client/filter/FilterContext;
    .end local v3    # "i$":Ljava/util/Iterator;
    :goto_1
    return v4

    :cond_2
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public abstract handle(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract onClose(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)V"
        }
    .end annotation
.end method

.method public abstract onError(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation
.end method
