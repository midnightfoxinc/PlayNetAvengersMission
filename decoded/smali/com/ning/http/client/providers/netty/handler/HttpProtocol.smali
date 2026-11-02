.class public final Lcom/ning/http/client/providers/netty/handler/HttpProtocol;
.super Lcom/ning/http/client/providers/netty/handler/Protocol;
.source "HttpProtocol.java"


# instance fields
.field private final connectionStrategy:Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;)V
    .locals 1
    .param p1, "channelManager"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p3, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .param p4, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    .prologue
    .line 62
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ning/http/client/providers/netty/handler/Protocol;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;)V

    .line 64
    invoke-virtual {p3}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getConnectionStrategy()Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->connectionStrategy:Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;

    .line 65
    return-void
.end method

.method private addNTLMAuthorizationHeader(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Ljava/lang/String;Z)V
    .locals 3
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .param p2, "challengeHeader"    # Ljava/lang/String;
    .param p3, "proxyInd"    # Z

    .prologue
    .line 131
    invoke-direct {p0, p3}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->authorizationHeaderName(Z)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "NTLM "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 132
    return-void
.end method

.method private addType3NTLMAuthorizationHeader(Ljava/lang/String;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/Realm;Z)V
    .locals 7
    .param p1, "auth"    # Ljava/lang/String;
    .param p2, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .param p3, "realm"    # Lcom/ning/http/client/Realm;
    .param p4, "proxyInd"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 173
    invoke-direct {p0, p4}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->authorizationHeaderName(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 175
    invoke-static {p1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "NTLM "

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    const-string v0, "NTLM "

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 177
    .local v5, "serverChallenge":Ljava/lang/String;
    sget-object v0, Lcom/ning/http/client/ntlm/NTLMEngine;->INSTANCE:Lcom/ning/http/client/ntlm/NTLMEngine;

    invoke-virtual {p3}, Lcom/ning/http/client/Realm;->getPrincipal()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Lcom/ning/http/client/Realm;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Lcom/ning/http/client/Realm;->getNtlmDomain()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3}, Lcom/ning/http/client/Realm;->getNtlmHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v0 .. v5}, Lcom/ning/http/client/ntlm/NTLMEngine;->generateType3Msg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 178
    .local v6, "challengeHeader":Ljava/lang/String;
    invoke-direct {p0, p2, v6, p4}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->addNTLMAuthorizationHeader(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Ljava/lang/String;Z)V

    .line 180
    .end local v5    # "serverChallenge":Ljava/lang/String;
    .end local v6    # "challengeHeader":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private authorizationHeaderName(Z)Ljava/lang/String;
    .locals 1
    .param p1, "proxyInd"    # Z

    .prologue
    .line 127
    if-eqz p1, :cond_0

    const-string v0, "Proxy-Authorization"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "Authorization"

    goto :goto_0
.end method

.method private exitAfterHandling100(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;I)Z
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "statusCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;I)Z"
        }
    .end annotation

    .prologue
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 271
    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->CONTINUE:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v2

    if-ne p3, v2, :cond_0

    .line 272
    invoke-virtual {p2, v0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setHeadersAlreadyWrittenOnContinue(Z)V

    .line 273
    invoke-virtual {p2, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setDontWriteBodyBecauseExpectContinue(Z)V

    .line 275
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v1, p2, p1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->writeRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;)V

    .line 279
    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method private exitAfterHandling401(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/Request;ILcom/ning/http/client/Realm;)Z
    .locals 13
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p4, "request"    # Lcom/ning/http/client/Request;
    .param p5, "statusCode"    # I
    .param p6, "realm"    # Lcom/ning/http/client/Realm;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/handler/codec/http/HttpResponse;",
            "Lcom/ning/http/client/Request;",
            "I",
            "Lcom/ning/http/client/Realm;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 223
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->UNAUTHORIZED:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v1

    move/from16 v0, p5

    if-ne v0, v1, :cond_4

    if-eqz p6, :cond_4

    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAndSetAuth(Z)Z

    move-result v1

    if-nez v1, :cond_4

    .line 225
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    const-string v3, "WWW-Authenticate"

    invoke-virtual {v1, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 227
    .local v5, "authHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 228
    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    invoke-virtual {p2, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setState(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;)V

    .line 229
    const/4 v11, 0x0

    .line 231
    .local v11, "newRealm":Lcom/ning/http/client/Realm;
    const-string v1, "Negotiate"

    invoke-interface {v5, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    .line 232
    .local v10, "negociate":Z
    invoke-static {v5}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->getNTLM(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    .line 233
    .local v2, "ntlmAuthenticate":Ljava/lang/String;
    const-string v1, "Kerberos"

    invoke-interface {v5, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v2, :cond_1

    .line 235
    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v4

    move-object v1, p0

    move-object/from16 v3, p4

    move-object/from16 v5, p6

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->ntlmChallenge(Ljava/lang/String;Lcom/ning/http/client/Request;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/Realm;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;

    .end local v5    # "authHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-result-object v11

    .line 253
    :cond_0
    :goto_0
    new-instance v1, Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/ning/http/client/RequestBuilder;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/ning/http/client/RequestBuilder;->setRealm(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v12

    .line 255
    .local v12, "nextRequest":Lcom/ning/http/client/Request;
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->logger:Lorg/slf4j/Logger;

    const-string v3, "Sending authentication to {}"

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 256
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isKeepAlive()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->isChunked()Z

    move-result v1

    if-nez v1, :cond_3

    .line 257
    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setReuseChannel(Z)V

    .line 262
    :goto_1
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v1, v12, p2}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendNextRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    .line 263
    const/4 v1, 0x1

    .line 267
    .end local v2    # "ntlmAuthenticate":Ljava/lang/String;
    .end local v10    # "negociate":Z
    .end local v11    # "newRealm":Lcom/ning/http/client/Realm;
    .end local v12    # "nextRequest":Lcom/ning/http/client/Request;
    :goto_2
    return v1

    .line 237
    .restart local v2    # "ntlmAuthenticate":Ljava/lang/String;
    .restart local v5    # "authHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v10    # "negociate":Z
    .restart local v11    # "newRealm":Lcom/ning/http/client/Realm;
    :cond_1
    if-eqz v10, :cond_2

    .line 239
    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v7

    move-object v3, p0

    move-object v4, p1

    move-object/from16 v6, p4

    move-object/from16 v8, p6

    move-object v9, p2

    invoke-direct/range {v3 .. v9}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->kerberosChallenge(Lorg/jboss/netty/channel/Channel;Ljava/util/List;Lcom/ning/http/client/Request;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/Realm;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;

    move-result-object v11

    .line 240
    if-nez v11, :cond_0

    .line 241
    const/4 v1, 0x1

    goto :goto_2

    .line 245
    :cond_2
    new-instance v1, Lcom/ning/http/client/Realm$RealmBuilder;

    invoke-direct {v1}, Lcom/ning/http/client/Realm$RealmBuilder;-><init>()V

    move-object/from16 v0, p6

    invoke-virtual {v1, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->clone(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setUsePreemptiveAuth(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v3

    const/4 v1, 0x0

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->parseWWWAuthenticateHeader(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;

    move-result-object v11

    goto/16 :goto_0

    .line 259
    .end local v5    # "authHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v12    # "nextRequest":Lcom/ning/http/client/Request;
    :cond_3
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v1, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_1

    .line 267
    .end local v2    # "ntlmAuthenticate":Ljava/lang/String;
    .end local v10    # "negociate":Z
    .end local v11    # "newRealm":Lcom/ning/http/client/Realm;
    .end local v12    # "nextRequest":Lcom/ning/http/client/Request;
    :cond_4
    const/4 v1, 0x0

    goto :goto_2
.end method

.method private exitAfterHandling407(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/Request;ILcom/ning/http/client/ProxyServer;)Z
    .locals 16
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p4, "request"    # Lcom/ning/http/client/Request;
    .param p5, "statusCode"    # I
    .param p6, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/handler/codec/http/HttpResponse;",
            "Lcom/ning/http/client/Request;",
            "I",
            "Lcom/ning/http/client/ProxyServer;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 290
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->PROXY_AUTHENTICATION_REQUIRED:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v1

    move/from16 v0, p5

    if-ne v0, v1, :cond_4

    if-eqz p6, :cond_4

    const/4 v1, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAndSetAuth(Z)Z

    move-result v1

    if-nez v1, :cond_4

    .line 292
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    const-string v3, "Proxy-Authenticate"

    invoke-virtual {v1, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    .line 294
    .local v8, "proxyAuthHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 295
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->logger:Lorg/slf4j/Logger;

    const-string v3, "Sending proxy authentication to {}"

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 297
    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setState(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;)V

    .line 298
    const/4 v14, 0x0

    .line 299
    .local v14, "newRealm":Lcom/ning/http/client/Realm;
    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v5

    .line 301
    .local v5, "requestHeaders":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    const-string v1, "Negotiate"

    invoke-interface {v8, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    .line 302
    .local v13, "negociate":Z
    invoke-static {v8}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->getNTLM(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    .line 303
    .local v2, "ntlmAuthenticate":Ljava/lang/String;
    const-string v1, "Kerberos"

    invoke-interface {v8, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v2, :cond_1

    move-object/from16 v1, p0

    move-object/from16 v3, p4

    move-object/from16 v4, p6

    move-object/from16 v6, p2

    .line 305
    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->ntlmProxyChallenge(Ljava/lang/String;Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;

    move-result-object v14

    .line 324
    :cond_0
    :goto_0
    new-instance v1, Lcom/ning/http/client/RequestBuilder;

    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/ning/http/client/RequestBuilder;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v1

    invoke-virtual {v1, v14}, Lcom/ning/http/client/RequestBuilder;->setRealm(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v15

    .line 326
    .local v15, "nextRequest":Lcom/ning/http/client/Request;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->logger:Lorg/slf4j/Logger;

    const-string v3, "Sending proxy authentication to {}"

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 327
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isKeepAlive()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->isChunked()Z

    move-result v1

    if-nez v1, :cond_3

    .line 328
    const/4 v1, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setConnectAllowed(Z)V

    .line 329
    const/4 v1, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setReuseChannel(Z)V

    .line 334
    :goto_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    move-object/from16 v0, p2

    invoke-virtual {v1, v15, v0}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendNextRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    .line 335
    const/4 v1, 0x1

    .line 338
    .end local v2    # "ntlmAuthenticate":Ljava/lang/String;
    .end local v5    # "requestHeaders":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .end local v8    # "proxyAuthHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v13    # "negociate":Z
    .end local v14    # "newRealm":Lcom/ning/http/client/Realm;
    .end local v15    # "nextRequest":Lcom/ning/http/client/Request;
    :goto_2
    return v1

    .line 307
    .restart local v2    # "ntlmAuthenticate":Ljava/lang/String;
    .restart local v5    # "requestHeaders":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .restart local v8    # "proxyAuthHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v13    # "negociate":Z
    .restart local v14    # "newRealm":Lcom/ning/http/client/Realm;
    :cond_1
    if-eqz v13, :cond_2

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v9, p4

    move-object/from16 v10, p6

    move-object v11, v5

    move-object/from16 v12, p2

    .line 309
    invoke-direct/range {v6 .. v12}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->kerberosProxyChallenge(Lorg/jboss/netty/channel/Channel;Ljava/util/List;Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;

    move-result-object v14

    .line 310
    if-nez v14, :cond_0

    .line 311
    const/4 v1, 0x1

    goto :goto_2

    .line 315
    :cond_2
    invoke-virtual/range {p6 .. p6}, Lcom/ning/http/client/ProxyServer;->realmBuilder()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setOmitQuery(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-interface/range {p4 .. p4}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setUsePreemptiveAuth(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v3

    const/4 v1, 0x0

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->parseProxyAuthenticateHeader(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;

    move-result-object v14

    goto/16 :goto_0

    .line 331
    .restart local v15    # "nextRequest":Lcom/ning/http/client/Request;
    :cond_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_1

    .line 338
    .end local v2    # "ntlmAuthenticate":Ljava/lang/String;
    .end local v5    # "requestHeaders":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .end local v8    # "proxyAuthHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v13    # "negociate":Z
    .end local v14    # "newRealm":Lcom/ning/http/client/Realm;
    .end local v15    # "nextRequest":Lcom/ning/http/client/Request;
    :cond_4
    const/4 v1, 0x0

    goto :goto_2
.end method

.method private exitAfterHandlingBody(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/AsyncHandler;)Z
    .locals 4
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/handler/codec/http/HttpResponse;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    .local p4, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 397
    invoke-interface {p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->isChunked()Z

    move-result v2

    if-nez v2, :cond_1

    .line 399
    invoke-interface {p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    if-lez v2, :cond_0

    .line 401
    new-instance v2, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    const/4 v3, 0x0

    invoke-direct {v2, p3, v3, v0}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;-><init>(Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/handler/codec/http/HttpChunk;Z)V

    invoke-direct {p0, p2, p4, v2}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->updateBodyAndInterrupt(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;)Z

    .line 402
    :cond_0
    invoke-direct {p0, p2, p1, v1}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->finishUpdate(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;Z)V

    .line 405
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method private exitAfterHandlingConnect(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;ILorg/jboss/netty/handler/codec/http/HttpRequest;)Z
    .locals 9
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "request"    # Lcom/ning/http/client/Request;
    .param p4, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p5, "statusCode"    # I
    .param p6, "httpRequest"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/ProxyServer;",
            "I",
            "Lorg/jboss/netty/handler/codec/http/HttpRequest;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 349
    sget-object v7, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->OK:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v7

    if-ne p5, v7, :cond_1

    invoke-interface {p6}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v7

    sget-object v8, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    if-ne v7, v8, :cond_1

    .line 351
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isKeepAlive()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 352
    invoke-virtual {p2, p1, v5}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->attachChannel(Lorg/jboss/netty/channel/Channel;Z)V

    .line 355
    :cond_0
    :try_start_0
    invoke-interface {p3}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v3

    .line 356
    .local v3, "requestUri":Lcom/ning/http/client/uri/Uri;
    invoke-virtual {v3}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    .line 357
    .local v4, "scheme":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 358
    .local v1, "host":Ljava/lang/String;
    invoke-static {v3}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getDefaultPort(Lcom/ning/http/client/uri/Uri;)I

    move-result v2

    .line 360
    .local v2, "port":I
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->logger:Lorg/slf4j/Logger;

    const-string v8, "Connecting to proxy {} for scheme {}"

    invoke-interface {v7, v8, p4, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 361
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v8

    invoke-virtual {v7, v8, v4, v1, v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->upgradeProtocol(Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 367
    .end local v1    # "host":Ljava/lang/String;
    .end local v2    # "port":I
    .end local v3    # "requestUri":Lcom/ning/http/client/uri/Uri;
    .end local v4    # "scheme":Ljava/lang/String;
    :goto_0
    invoke-virtual {p2, v5}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setReuseChannel(Z)V

    .line 368
    invoke-virtual {p2, v6}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setConnectAllowed(Z)V

    .line 369
    iget-object v6, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    new-instance v7, Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    invoke-virtual {v7}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v7

    invoke-virtual {v6, v7, p2}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendNextRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    .line 373
    :goto_1
    return v5

    .line 363
    :catch_0
    move-exception v0

    .line 364
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v7, p1, p2, v0}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    goto :goto_0

    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_1
    move v5, v6

    .line 373
    goto :goto_1
.end method

.method private exitAfterHandlingHeaders(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;)Z
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p5, "responseHeaders"    # Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/handler/codec/http/HttpResponse;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;",
            "Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 387
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    .local p4, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    invoke-interface {p3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p4, p5}, Lcom/ning/http/client/AsyncHandler;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    sget-object v1, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    if-eq v0, v1, :cond_0

    .line 388
    invoke-static {p3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v0

    invoke-direct {p0, p2, p1, v0}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->finishUpdate(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;Z)V

    .line 389
    const/4 v0, 0x1

    .line 391
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private exitAfterHandlingStatus(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;)Z
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p5, "status"    # Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/handler/codec/http/HttpResponse;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;",
            "Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    .local p4, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    const/4 v0, 0x1

    .line 378
    invoke-virtual {p2, v0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAndSetStatusReceived(Z)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {p4, p5}, Lcom/ning/http/client/AsyncHandler;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    if-eq v1, v2, :cond_0

    .line 379
    invoke-static {p3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v1

    invoke-direct {p0, p2, p1, v1}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->finishUpdate(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;Z)V

    .line 382
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private finishUpdate(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;Z)V
    .locals 3
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "expectOtherChunks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/channel/Channel;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isKeepAlive()Z

    move-result v0

    .line 185
    .local v0, "keepAlive":Z
    if-eqz p3, :cond_0

    if-eqz v0, :cond_0

    .line 186
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v1, p2, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->drainChannelAndOffer(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    .line 189
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->markAsDone(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;)V

    .line 190
    return-void

    .line 188
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getPartition()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p2, v0, v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->tryToOfferChannelToPool(Lorg/jboss/netty/channel/Channel;ZLjava/lang/String;)V

    goto :goto_0
.end method

.method private handleChunk(Lorg/jboss/netty/handler/codec/http/HttpChunk;Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;)V
    .locals 5
    .param p1, "chunk"    # Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/http/HttpChunk;",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 445
    .local p3, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    .local p4, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v1

    .line 447
    .local v1, "last":Z
    if-nez v1, :cond_0

    new-instance v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    const/4 v4, 0x0

    invoke-direct {v3, v4, p1, v1}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;-><init>(Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/handler/codec/http/HttpChunk;Z)V

    invoke-direct {p0, p3, p4, v3}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->updateBodyAndInterrupt(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 450
    :cond_0
    instance-of v3, p1, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    if-eqz v3, :cond_1

    move-object v0, p1

    .line 451
    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    .line 452
    .local v0, "chunkTrailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;->trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 453
    new-instance v2, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;

    invoke-virtual {p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getHttpHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;->trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;-><init>(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V

    .line 454
    .local v2, "responseHeaders":Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;
    invoke-interface {p4, v2}, Lcom/ning/http/client/AsyncHandler;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    .line 457
    .end local v0    # "chunkTrailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    .end local v2    # "responseHeaders":Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;
    :cond_1
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v3, 0x1

    :goto_0
    invoke-direct {p0, p3, p2, v3}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->finishUpdate(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;Z)V

    .line 459
    :cond_2
    return-void

    .line 457
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private handleHttpResponse(Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;)Z
    .locals 27
    .param p1, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/http/HttpResponse;",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 413
    .local p3, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    .local p4, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    invoke-virtual/range {p3 .. p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v26

    .line 414
    .local v26, "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-virtual/range {p3 .. p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getProxyServer()Lcom/ning/http/client/ProxyServer;

    move-result-object v24

    .line 415
    .local v24, "proxyServer":Lcom/ning/http/client/ProxyServer;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->logger:Lorg/slf4j/Logger;

    const-string v6, "\n\nRequest {}\n\nResponse {}\n"

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-interface {v5, v6, v0, v1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 419
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setHttpHeaders(Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V

    .line 421
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->connectionStrategy:Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-interface {v5, v0, v1}, Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;->keepAlive(Lorg/jboss/netty/handler/codec/http/HttpRequest;Lorg/jboss/netty/handler/codec/http/HttpResponse;)Z

    move-result v5

    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setKeepAlive(Z)V

    .line 423
    new-instance v9, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;

    invoke-virtual/range {p3 .. p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v0, p1

    invoke-direct {v9, v5, v6, v0}, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;-><init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;Lorg/jboss/netty/handler/codec/http/HttpResponse;)V

    .line 424
    .local v9, "status":Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v16

    .line 425
    .local v16, "statusCode":I
    invoke-virtual/range {p3 .. p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v15

    .line 426
    .local v15, "request":Lcom/ning/http/client/Request;
    invoke-interface {v15}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-interface {v15}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v17

    .line 427
    .local v17, "realm":Lcom/ning/http/client/Realm;
    :goto_0
    new-instance v10, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;

    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    invoke-direct {v10, v5}, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;-><init>(Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V

    .local v10, "responseHeaders":Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;
    move-object/from16 v5, p0

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    .line 429
    invoke-virtual/range {v5 .. v10}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterProcessingFilters(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;)Z

    move-result v5

    if-nez v5, :cond_0

    move-object/from16 v11, p0

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p1

    invoke-direct/range {v11 .. v17}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterHandling401(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/Request;ILcom/ning/http/client/Realm;)Z

    move-result v5

    if-nez v5, :cond_0

    move-object/from16 v18, p0

    move-object/from16 v19, p2

    move-object/from16 v20, p3

    move-object/from16 v21, p1

    move-object/from16 v22, v15

    move/from16 v23, v16

    invoke-direct/range {v18 .. v24}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterHandling407(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/Request;ILcom/ning/http/client/ProxyServer;)Z

    move-result v5

    if-nez v5, :cond_0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move/from16 v3, v16

    invoke-direct {v0, v1, v2, v3}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterHandling100(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;I)Z

    move-result v5

    if-nez v5, :cond_0

    move-object/from16 v11, p0

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p1

    invoke-virtual/range {v11 .. v16}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterHandlingRedirect(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/Request;I)Z

    move-result v5

    if-nez v5, :cond_0

    move-object/from16 v20, p0

    move-object/from16 v21, p2

    move-object/from16 v22, p3

    move-object/from16 v23, v15

    move/from16 v25, v16

    invoke-direct/range {v20 .. v26}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterHandlingConnect(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;ILorg/jboss/netty/handler/codec/http/HttpRequest;)Z

    move-result v5

    if-nez v5, :cond_0

    move-object/from16 v18, p0

    move-object/from16 v19, p2

    move-object/from16 v20, p3

    move-object/from16 v21, p1

    move-object/from16 v22, p4

    move-object/from16 v23, v9

    invoke-direct/range {v18 .. v23}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterHandlingStatus(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;)Z

    move-result v5

    if-nez v5, :cond_0

    move-object/from16 v18, p0

    move-object/from16 v19, p2

    move-object/from16 v20, p3

    move-object/from16 v21, p1

    move-object/from16 v22, p4

    move-object/from16 v23, v10

    invoke-direct/range {v18 .. v23}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterHandlingHeaders(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;)Z

    move-result v5

    if-nez v5, :cond_0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p1

    move-object/from16 v4, p4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->exitAfterHandlingBody(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/AsyncHandler;)Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_0
    const/4 v5, 0x1

    :goto_1
    return v5

    .line 426
    .end local v10    # "responseHeaders":Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;
    .end local v17    # "realm":Lcom/ning/http/client/Realm;
    :cond_1
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v5}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v17

    goto/16 :goto_0

    .line 429
    .restart local v10    # "responseHeaders":Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;
    .restart local v17    # "realm":Lcom/ning/http/client/Realm;
    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private kerberosChallenge(Lorg/jboss/netty/channel/Channel;Ljava/util/List;Lcom/ning/http/client/Request;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/Realm;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;
    .locals 11
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "request"    # Lcom/ning/http/client/Request;
    .param p4, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .param p5, "realm"    # Lcom/ning/http/client/Realm;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;",
            "Lcom/ning/http/client/Realm;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)",
            "Lcom/ning/http/client/Realm;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 74
    .local p2, "authHeaders":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p6, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-interface {p3}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v10

    .line 75
    .local v10, "uri":Lcom/ning/http/client/uri/Uri;
    invoke-interface {p3}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {v10}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v8

    .line 77
    .local v8, "host":Ljava/lang/String;
    :goto_0
    :try_start_0
    sget-object v1, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->INSTANCE:Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;

    invoke-virtual {v1, v8}, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->generateToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 78
    .local v7, "challengeHeader":Ljava/lang/String;
    const-string v1, "Authorization"

    invoke-virtual {p4, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 79
    const-string v1, "Authorization"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Negotiate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4, v1, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 81
    new-instance v1, Lcom/ning/http/client/Realm$RealmBuilder;

    invoke-direct {v1}, Lcom/ning/http/client/Realm$RealmBuilder;-><init>()V

    move-object/from16 v0, p5

    invoke-virtual {v1, v0}, Lcom/ning/http/client/Realm$RealmBuilder;->clone(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-interface {p3}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    sget-object v3, Lcom/ning/http/client/Realm$AuthScheme;->KERBEROS:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v1, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 93
    .end local v7    # "challengeHeader":Ljava/lang/String;
    :goto_1
    return-object v1

    .line 75
    .end local v8    # "host":Ljava/lang/String;
    :cond_0
    invoke-interface {p3}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    .line 87
    .restart local v8    # "host":Ljava/lang/String;
    :catch_0
    move-exception v9

    .line 88
    .local v9, "throwable":Ljava/lang/Throwable;
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->getNTLM(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "ntlmAuthenticate":Ljava/lang/String;
    if-eqz v2, :cond_1

    move-object v1, p0

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    .line 90
    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->ntlmChallenge(Ljava/lang/String;Lcom/ning/http/client/Request;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/Realm;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;

    move-result-object v1

    goto :goto_1

    .line 92
    :cond_1
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    move-object/from16 v0, p6

    invoke-virtual {v1, p1, v0, v9}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    .line 93
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private kerberosProxyChallenge(Lorg/jboss/netty/channel/Channel;Ljava/util/List;Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;
    .locals 9
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "request"    # Lcom/ning/http/client/Request;
    .param p4, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p5, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/ProxyServer;",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)",
            "Lcom/ning/http/client/Realm;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 104
    .local p2, "proxyAuth":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p6, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-interface {p3}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v8

    .line 106
    .local v8, "uri":Lcom/ning/http/client/uri/Uri;
    :try_start_0
    sget-object v0, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->INSTANCE:Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;

    invoke-virtual {p4}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->generateToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 107
    .local v6, "challengeHeader":Ljava/lang/String;
    const-string v0, "Authorization"

    invoke-virtual {p5, v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 108
    const-string v0, "Authorization"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Negotiate "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p5, v0, v2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 110
    invoke-virtual {p4}, Lcom/ning/http/client/ProxyServer;->realmBuilder()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-interface {p3}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    sget-object v2, Lcom/ning/http/client/Realm$AuthScheme;->KERBEROS:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v0, v2}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 122
    .end local v6    # "challengeHeader":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 116
    :catch_0
    move-exception v7

    .line 117
    .local v7, "throwable":Ljava/lang/Throwable;
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->getNTLM(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "ntlmAuthenticate":Ljava/lang/String;
    if-eqz v1, :cond_0

    move-object v0, p0

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 119
    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->ntlmProxyChallenge(Ljava/lang/String;Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;

    move-result-object v0

    goto :goto_0

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v0, p1, p6, v7}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    .line 122
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private markAsDone(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;)V
    .locals 3
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/channel/Channel;",
            ")V"
        }
    .end annotation

    .prologue
    .line 204
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    :try_start_0
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->done()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    :goto_0
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isKeepAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    .line 211
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v1, p2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 213
    :cond_1
    return-void

    .line 205
    :catch_0
    move-exception v0

    .line 207
    .local v0, "t":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->logger:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private ntlmChallenge(Ljava/lang/String;Lcom/ning/http/client/Request;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/Realm;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;
    .locals 4
    .param p1, "wwwAuth"    # Ljava/lang/String;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p3, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .param p4, "realm"    # Lcom/ning/http/client/Realm;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;",
            "Lcom/ning/http/client/Realm;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)",
            "Lcom/ning/http/client/Realm;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .local p5, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v3, 0x0

    .line 137
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    .line 139
    .local v1, "uri":Lcom/ning/http/client/uri/Uri;
    const-string v2, "NTLM"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 141
    sget-object v2, Lcom/ning/http/client/ntlm/NTLMEngine;->INSTANCE:Lcom/ning/http/client/ntlm/NTLMEngine;

    invoke-virtual {v2}, Lcom/ning/http/client/ntlm/NTLMEngine;->generateType1Msg()Ljava/lang/String;

    move-result-object v0

    .line 143
    .local v0, "challengeHeader":Ljava/lang/String;
    invoke-direct {p0, p3, v0, v3}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->addNTLMAuthorizationHeader(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Ljava/lang/String;Z)V

    .line 144
    invoke-virtual {p5, v3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAndSetAuth(Z)Z

    .line 151
    .end local v0    # "challengeHeader":Ljava/lang/String;
    :goto_0
    new-instance v2, Lcom/ning/http/client/Realm$RealmBuilder;

    invoke-direct {v2}, Lcom/ning/http/client/Realm$RealmBuilder;-><init>()V

    invoke-virtual {v2, p4}, Lcom/ning/http/client/Realm$RealmBuilder;->clone(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v2

    invoke-interface {p2}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;

    move-result-object v2

    return-object v2

    .line 148
    :cond_0
    invoke-direct {p0, p1, p3, p4, v3}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->addType3NTLMAuthorizationHeader(Ljava/lang/String;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/Realm;Z)V

    goto :goto_0
.end method

.method private ntlmProxyChallenge(Ljava/lang/String;Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Lcom/ning/http/client/Realm;
    .locals 3
    .param p1, "wwwAuth"    # Ljava/lang/String;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p3, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p4, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/ProxyServer;",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)",
            "Lcom/ning/http/client/Realm;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 159
    .local p5, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v1, 0x0

    invoke-virtual {p5, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAndSetAuth(Z)Z

    .line 160
    const-string v1, "Proxy-Authorization"

    invoke-virtual {p4, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 162
    invoke-virtual {p3}, Lcom/ning/http/client/ProxyServer;->realmBuilder()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/Realm$AuthScheme;->NTLM:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v1, v2}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-interface {p2}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-interface {p2}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;

    move-result-object v0

    .line 167
    .local v0, "realm":Lcom/ning/http/client/Realm;
    const/4 v1, 0x1

    invoke-direct {p0, p1, p4, v0, v1}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->addType3NTLMAuthorizationHeader(Ljava/lang/String;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/Realm;Z)V

    .line 169
    return-object v0
.end method

.method private updateBodyAndInterrupt(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;)Z
    .locals 4
    .param p3, "bodyPart"    # Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;",
            "Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    .local p2, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    const/4 v1, 0x0

    .line 194
    invoke-interface {p2, p3}, Lcom/ning/http/client/AsyncHandler;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v2

    sget-object v3, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    if-eq v2, v3, :cond_1

    const/4 v0, 0x1

    .line 195
    .local v0, "interrupt":Z
    :goto_0
    invoke-virtual {p3}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->isUnderlyingConnectionToBeClosed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 196
    invoke-virtual {p1, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setKeepAlive(Z)V

    .line 197
    :cond_0
    return v0

    .end local v0    # "interrupt":Z
    :cond_1
    move v0, v1

    .line 194
    goto :goto_0
.end method


# virtual methods
.method public handle(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Object;)V
    .locals 6
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "e"    # Ljava/lang/Object;
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

    .prologue
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v5, 0x0

    .line 464
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch()V

    .line 467
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 469
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v3, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 500
    .end local p3    # "e":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 473
    .restart local p3    # "e":Ljava/lang/Object;
    :cond_1
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v1

    .line 475
    .local v1, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    :try_start_0
    instance-of v3, p3, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v3, :cond_2

    .line 476
    check-cast p3, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .end local p3    # "e":Ljava/lang/Object;
    invoke-direct {p0, p3, p1, p2, v1}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->handleHttpResponse(Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 479
    .restart local p3    # "e":Ljava/lang/Object;
    :cond_2
    instance-of v3, p3, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v3, :cond_0

    .line 480
    check-cast p3, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    .end local p3    # "e":Ljava/lang/Object;
    invoke-direct {p0, p3, p1, p2, v1}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->handleChunk(Lorg/jboss/netty/handler/codec/http/HttpChunk;Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 482
    :catch_0
    move-exception v2

    .line 484
    .local v2, "t":Ljava/lang/Exception;
    iget-boolean v3, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->hasIOExceptionFilters:Z

    if-eqz v3, :cond_3

    instance-of v3, v2, Ljava/io/IOException;

    if-eqz v3, :cond_3

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    const-class v3, Ljava/io/IOException;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/IOException;

    invoke-virtual {v4, p2, v3, p1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->applyIoExceptionFiltersAndReplayRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/io/IOException;Lorg/jboss/netty/channel/Channel;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 492
    :cond_3
    :try_start_1
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v3, p1, p2, v2}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 496
    invoke-direct {p0, p2, p1, v5}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->finishUpdate(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;Z)V

    .line 498
    :goto_1
    throw v2

    .line 493
    :catch_1
    move-exception v0

    .line 494
    .local v0, "abortException":Ljava/lang/Exception;
    :try_start_2
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->logger:Lorg/slf4j/Logger;

    const-string v4, "Abort failed"

    invoke-interface {v3, v4, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 496
    invoke-direct {p0, p2, p1, v5}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->finishUpdate(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;Z)V

    goto :goto_1

    .end local v0    # "abortException":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-direct {p0, p2, p1, v5}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;->finishUpdate(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;Z)V

    throw v3
.end method

.method public onClose(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 506
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    return-void
.end method

.method public onError(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V
    .locals 0
    .param p2, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 503
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    return-void
.end method
