.class final Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;
.super Ljava/lang/Object;
.source "JDKAsyncHttpProvider.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AsyncHttpUrlConnection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final asyncHandler:Lcom/ning/http/client/AsyncHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;"
        }
    .end annotation
.end field

.field private cachedBytes:[B

.field private cachedBytesLenght:I

.field private currentRedirectCount:I

.field private final future:Lcom/ning/http/client/providers/jdk/JDKFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/providers/jdk/JDKFuture",
            "<TT;>;"
        }
    .end annotation
.end field

.field private isAuth:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private request:Lcom/ning/http/client/Request;

.field private terminate:Z

.field final synthetic this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

.field private urlConnection:Ljava/net/HttpURLConnection;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Ljava/net/HttpURLConnection;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/jdk/JDKFuture;)V
    .locals 2
    .param p2, "urlConnection"    # Ljava/net/HttpURLConnection;
    .param p3, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lcom/ning/http/client/providers/jdk/JDKFuture",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;, "Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection<TT;>;"
    .local p4, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    .local p5, "future":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->isAuth:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 216
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    .line 219
    iput-object p2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    .line 220
    iput-object p3, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    .line 221
    iput-object p4, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 222
    iput-object p5, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->future:Lcom/ning/http/client/providers/jdk/JDKFuture;

    .line 223
    iput-object p3, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    .line 224
    return-void
.end method

.method private configure(Lcom/ning/http/client/uri/Uri;Ljava/net/HttpURLConnection;Lcom/ning/http/client/Request;)V
    .locals 35
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "urlConnection"    # Ljava/net/HttpURLConnection;
    .param p3, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/naming/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 435
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;, "Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection<TT;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->requestTimeout(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)I

    move-result v28

    .line 437
    .local v28, "requestTimeout":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/ning/http/client/AsyncHttpClientConfig;->getConnectTimeout()I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 439
    const/16 v30, -0x1

    move/from16 v0, v28

    move/from16 v1, v30

    if-eq v0, v1, :cond_0

    .line 440
    move-object/from16 v0, p2

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 442
    :cond_0
    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 443
    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v13

    .line 444
    .local v13, "host":Ljava/lang/String;
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v20

    .line 446
    .local v20, "method":Ljava/lang/String;
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v30

    if-eqz v30, :cond_1

    .line 447
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v13

    .line 450
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v30

    const/16 v31, -0x1

    move/from16 v0, v30

    move/from16 v1, v31

    if-eq v0, v1, :cond_2

    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v30

    if-eqz v30, :cond_6

    .line 451
    :cond_2
    const-string v30, "Host"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/ning/http/client/AsyncHttpClientConfig;->isCompressionEnforced()Z

    move-result v30

    if-eqz v30, :cond_3

    .line 458
    const-string v30, "Accept-Encoding"

    const-string v31, "gzip"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    :cond_3
    const-string v30, "CONNECT"

    move-object/from16 v0, v20

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_7

    .line 462
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v12

    .line 463
    .local v12, "h":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    if-eqz v12, :cond_7

    .line 464
    invoke-virtual {v12}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keySet()Ljava/util/Set;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_7

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 465
    .local v22, "name":Ljava/lang/String;
    const-string v30, "host"

    move-object/from16 v0, v30

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_4

    .line 466
    move-object/from16 v0, v22

    invoke-virtual {v12, v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, "i$":Ljava/util/Iterator;
    :cond_5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_4

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    .line 467
    .local v29, "value":Ljava/lang/String;
    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    const-string v30, "Expect"

    move-object/from16 v0, v22

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v30

    if-eqz v30, :cond_5

    .line 469
    new-instance v30, Ljava/lang/IllegalStateException;

    const-string v31, "Expect: 100-Continue not supported"

    invoke-direct/range {v30 .. v31}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 453
    .end local v12    # "h":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .end local v15    # "i$":Ljava/util/Iterator;
    .end local v22    # "name":Ljava/lang/String;
    .end local v29    # "value":Ljava/lang/String;
    :cond_6
    const-string v30, "Host"

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v31

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, ":"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 477
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lcom/ning/http/util/AsyncHttpProviderUtils;->keepAliveHeaderValue(Lcom/ning/http/client/AsyncHttpClientConfig;)Ljava/lang/String;

    move-result-object v16

    .line 478
    .local v16, "ka":Ljava/lang/String;
    const-string v30, "Connection"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 479
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lcom/ning/http/util/ProxyUtils;->getProxyServer(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Lcom/ning/http/client/ProxyServer;

    move-result-object v24

    .line 480
    .local v24, "proxyServer":Lcom/ning/http/client/ProxyServer;
    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v24

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lcom/ning/http/util/ProxyUtils;->avoidProxy(Lcom/ning/http/client/ProxyServer;Ljava/lang/String;)Z

    move-result v4

    .line 481
    .local v4, "avoidProxy":Z
    if-nez v4, :cond_9

    .line 482
    const-string v30, "Connection"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    invoke-virtual/range {v24 .. v24}, Lcom/ning/http/client/ProxyServer;->getPrincipal()Ljava/lang/String;

    move-result-object v30

    if-eqz v30, :cond_8

    .line 484
    const-string v30, "Proxy-Authorization"

    invoke-static/range {v24 .. v24}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 487
    :cond_8
    invoke-virtual/range {v24 .. v24}, Lcom/ning/http/client/ProxyServer;->getProtocol()Lcom/ning/http/client/ProxyServer$Protocol;

    move-result-object v30

    sget-object v31, Lcom/ning/http/client/ProxyServer$Protocol;->NTLM:Lcom/ning/http/client/ProxyServer$Protocol;

    invoke-virtual/range {v30 .. v31}, Lcom/ning/http/client/ProxyServer$Protocol;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_9

    .line 488
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    const-string v31, "http.auth.ntlm.domain"

    invoke-static/range {v31 .. v31}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v30 .. v31}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$602(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Ljava/lang/String;)Ljava/lang/String;

    .line 489
    const-string v30, "http.auth.ntlm.domain"

    invoke-virtual/range {v24 .. v24}, Lcom/ning/http/client/ProxyServer;->getNtlmDomain()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v30 .. v31}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 493
    :cond_9
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v30

    if-eqz v30, :cond_a

    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v26

    .line 494
    .local v26, "realm":Lcom/ning/http/client/Realm;
    :goto_1
    if-eqz v26, :cond_b

    invoke-virtual/range {v26 .. v26}, Lcom/ning/http/client/Realm;->getUsePreemptiveAuth()Z

    move-result v30

    if-eqz v30, :cond_b

    .line 495
    sget-object v30, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$2;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    invoke-virtual/range {v26 .. v26}, Lcom/ning/http/client/Realm;->getScheme()Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lcom/ning/http/client/Realm$AuthScheme;->ordinal()I

    move-result v31

    aget v30, v30, v31

    packed-switch v30, :pswitch_data_0

    .line 513
    new-instance v30, Ljava/lang/IllegalStateException;

    const-string v31, "Invalid Authentication %s"

    const/16 v32, 0x1

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual/range {v26 .. v26}, Lcom/ning/http/client/Realm;->toString()Ljava/lang/String;

    move-result-object v34

    aput-object v34, v32, v33

    invoke-static/range {v31 .. v32}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 493
    .end local v26    # "realm":Lcom/ning/http/client/Realm;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v26

    goto :goto_1

    .line 497
    .restart local v26    # "realm":Lcom/ning/http/client/Realm;
    :pswitch_0
    const-string v30, "Authorization"

    invoke-static/range {v26 .. v26}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    :cond_b
    :goto_2
    :pswitch_1
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v30

    const-string v31, "Accept"

    invoke-virtual/range {v30 .. v31}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    if-nez v30, :cond_c

    .line 520
    const-string v30, "Accept"

    const-string v31, "*/*"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    :cond_c
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v30

    const-string v31, "User-Agent"

    invoke-virtual/range {v30 .. v31}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    if-eqz v30, :cond_11

    .line 524
    const-string v30, "User-Agent"

    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v31

    const-string v32, "User-Agent"

    invoke-virtual/range {v31 .. v32}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    :cond_d
    :goto_3
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getCookies()Ljava/util/Collection;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v30

    if-eqz v30, :cond_e

    .line 530
    const-string v30, "Cookie"

    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getCookies()Ljava/util/Collection;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Lcom/ning/http/client/cookie/CookieEncoder;->encode(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    :cond_e
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v27

    .line 534
    .local v27, "reqType":Ljava/lang/String;
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 536
    const-string v30, "POST"

    move-object/from16 v0, v30

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-nez v30, :cond_f

    const-string v30, "PUT"

    move-object/from16 v0, v30

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_10

    .line 537
    :cond_f
    const-string v30, "Content-Length"

    const-string v31, "0"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 538
    const/16 v30, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 539
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getBodyEncoding()Ljava/lang/String;

    move-result-object v30

    if-nez v30, :cond_12

    sget-object v30, Lcom/ning/http/util/AsyncHttpProviderUtils;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual/range {v30 .. v30}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v7

    .line 541
    .local v7, "bodyCharset":Ljava/lang/String;
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytes:[B

    move-object/from16 v30, v0

    if-eqz v30, :cond_13

    .line 542
    const-string v30, "Content-Length"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytesLenght:I

    move/from16 v31, v0

    invoke-static/range {v31 .. v31}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytesLenght:I

    move/from16 v30, v0

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 544
    invoke-virtual/range {p2 .. p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytes:[B

    move-object/from16 v31, v0

    const/16 v32, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytesLenght:I

    move/from16 v33, v0

    invoke-virtual/range {v30 .. v33}, Ljava/io/OutputStream;->write([BII)V

    .line 637
    .end local v7    # "bodyCharset":Ljava/lang/String;
    :cond_10
    :goto_5
    return-void

    .line 501
    .end local v27    # "reqType":Ljava/lang/String;
    :pswitch_2
    invoke-virtual/range {v26 .. v26}, Lcom/ning/http/client/Realm;->getNonce()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v30

    if-eqz v30, :cond_b

    .line 502
    const-string v30, "Authorization"

    invoke-static/range {v26 .. v26}, Lcom/ning/http/util/AuthenticatorUtils;->computeDigestAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 507
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    const-string v31, "http.auth.ntlm.domain"

    invoke-static/range {v31 .. v31}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v30 .. v31}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$602(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Ljava/lang/String;)Ljava/lang/String;

    .line 508
    const-string v30, "http.auth.ntlm.domain"

    invoke-virtual/range {v26 .. v26}, Lcom/ning/http/client/Realm;->getNtlmDomain()Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v30 .. v31}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_2

    .line 525
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/ning/http/client/AsyncHttpClientConfig;->getUserAgent()Ljava/lang/String;

    move-result-object v30

    if-eqz v30, :cond_d

    .line 526
    const-string v30, "User-Agent"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v31, v0

    invoke-static/range {v31 .. v31}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lcom/ning/http/client/AsyncHttpClientConfig;->getUserAgent()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 539
    .restart local v27    # "reqType":Ljava/lang/String;
    :cond_12
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getBodyEncoding()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_4

    .line 545
    .restart local v7    # "bodyCharset":Ljava/lang/String;
    :cond_13
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v30

    if-eqz v30, :cond_14

    .line 546
    const-string v30, "Content-Length"

    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v31

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    invoke-static/range {v31 .. v31}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 547
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v30

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 549
    invoke-virtual/range {p2 .. p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v30

    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/io/OutputStream;->write([B)V

    goto/16 :goto_5

    .line 550
    :cond_14
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getStringData()Ljava/lang/String;

    move-result-object v30

    if-eqz v30, :cond_16

    .line 551
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v30

    const-string v31, "Content-Type"

    invoke-virtual/range {v30 .. v31}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->containsKey(Ljava/lang/Object;)Z

    move-result v30

    if-nez v30, :cond_15

    .line 552
    const-string v30, "Content-Type"

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "text/html;"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    :cond_15
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getStringData()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    .line 555
    .local v5, "b":[B
    const-string v30, "Content-Length"

    array-length v0, v5

    move/from16 v31, v0

    invoke-static/range {v31 .. v31}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 556
    invoke-virtual/range {p2 .. p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v5}, Ljava/io/OutputStream;->write([B)V

    goto/16 :goto_5

    .line 557
    .end local v5    # "b":[B
    :cond_16
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getStreamData()Ljava/io/InputStream;

    move-result-object v30

    if-eqz v30, :cond_17

    .line 558
    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [I

    move-object/from16 v19, v0

    .line 559
    .local v19, "lengthWrapper":[I
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getStreamData()Ljava/io/InputStream;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->readFully(Ljava/io/InputStream;[I)[B

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytes:[B

    .line 560
    const/16 v30, 0x0

    aget v30, v19, v30

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytesLenght:I

    .line 561
    const-string v30, "Content-Length"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytesLenght:I

    move/from16 v31, v0

    invoke-static/range {v31 .. v31}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytesLenght:I

    move/from16 v30, v0

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 564
    invoke-virtual/range {p2 .. p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytes:[B

    move-object/from16 v31, v0

    const/16 v32, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->cachedBytesLenght:I

    move/from16 v33, v0

    invoke-virtual/range {v30 .. v33}, Ljava/io/OutputStream;->write([BII)V

    goto/16 :goto_5

    .line 565
    .end local v19    # "lengthWrapper":[I
    :cond_17
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v30

    if-eqz v30, :cond_19

    .line 566
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lcom/ning/http/util/AsyncHttpProviderUtils;->urlEncodeFormParams0(Ljava/util/List;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 567
    .local v11, "formBody":Ljava/lang/String;
    const-string v30, "Content-Length"

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v31

    invoke-static/range {v31 .. v31}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 568
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 570
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v30

    const-string v31, "Content-Type"

    invoke-virtual/range {v30 .. v31}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->containsKey(Ljava/lang/Object;)Z

    move-result v30

    if-nez v30, :cond_18

    .line 571
    const-string v30, "Content-Type"

    const-string v31, "application/x-www-form-urlencoded"

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 573
    :cond_18
    invoke-virtual/range {p2 .. p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v30

    invoke-virtual {v11, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/io/OutputStream;->write([B)V

    goto/16 :goto_5

    .line 574
    .end local v11    # "formBody":Ljava/lang/String;
    :cond_19
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getParts()Ljava/util/List;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v30

    if-eqz v30, :cond_1c

    .line 575
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getContentLength()J

    move-result-wide v30

    move-wide/from16 v0, v30

    long-to-int v0, v0

    move/from16 v17, v0

    .line 576
    .local v17, "lenght":I
    const/16 v30, -0x1

    move/from16 v0, v17

    move/from16 v1, v30

    if-eq v0, v1, :cond_1a

    .line 577
    const-string v30, "Content-Length"

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 578
    move-object/from16 v0, p2

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 581
    :cond_1a
    const/16 v30, -0x1

    move/from16 v0, v17

    move/from16 v1, v30

    if-ne v0, v1, :cond_1b

    .line 582
    const/16 v17, 0x2000

    .line 585
    :cond_1b
    new-instance v21, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;

    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getParts()Ljava/util/List;

    move-result-object v30

    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v31

    move-object/from16 v0, v21

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;-><init>(Ljava/util/List;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    .line 587
    .local v21, "mre":Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;
    const-string v30, "Content-Type"

    invoke-virtual/range {v21 .. v21}, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->getContentType()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    const-string v30, "Content-Length"

    invoke-virtual/range {v21 .. v21}, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->getContentLength()J

    move-result-wide v32

    invoke-static/range {v32 .. v33}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    invoke-virtual/range {p2 .. p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v30

    move-object/from16 v0, v21

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->writeRequest(Ljava/io/OutputStream;)V

    goto/16 :goto_5

    .line 591
    .end local v17    # "lenght":I
    .end local v21    # "mre":Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;
    :cond_1c
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v30

    if-eqz v30, :cond_1f

    .line 592
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v9

    .line 593
    .local v9, "file":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    move-result v30

    if-nez v30, :cond_1d

    .line 594
    new-instance v30, Ljava/io/IOException;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "File %s is not a file or doesn\'t exist"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    const/16 v32, 0x1

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v34

    aput-object v34, v32, v33

    invoke-static/range {v31 .. v32}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v30

    .line 597
    :cond_1d
    const-string v30, "Content-Length"

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v32

    invoke-static/range {v32 .. v33}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v30

    move-wide/from16 v0, v30

    long-to-int v0, v0

    move/from16 v30, v0

    move-object/from16 v0, p2

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 600
    new-instance v10, Ljava/io/FileInputStream;

    invoke-direct {v10, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 602
    .local v10, "fis":Ljava/io/FileInputStream;
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v23

    .line 603
    .local v23, "os":Ljava/io/OutputStream;
    const/16 v30, 0x4000

    move/from16 v0, v30

    new-array v8, v0, [B

    .line 604
    .local v8, "buffer":[B
    :goto_6
    invoke-virtual {v10, v8}, Ljava/io/FileInputStream;->read([B)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v25

    .line 605
    .local v25, "read":I
    if-gez v25, :cond_1e

    .line 611
    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V

    goto/16 :goto_5

    .line 608
    :cond_1e
    const/16 v30, 0x0

    :try_start_1
    move-object/from16 v0, v23

    move/from16 v1, v30

    move/from16 v2, v25

    invoke-virtual {v0, v8, v1, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_6

    .line 611
    .end local v8    # "buffer":[B
    .end local v23    # "os":Ljava/io/OutputStream;
    .end local v25    # "read":I
    :catchall_0
    move-exception v30

    invoke-virtual {v10}, Ljava/io/FileInputStream;->close()V

    throw v30

    .line 613
    .end local v9    # "file":Ljava/io/File;
    .end local v10    # "fis":Ljava/io/FileInputStream;
    :cond_1f
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v30

    if-eqz v30, :cond_10

    .line 614
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Lcom/ning/http/client/BodyGenerator;->createBody()Lcom/ning/http/client/Body;

    move-result-object v6

    .line 616
    .local v6, "body":Lcom/ning/http/client/Body;
    :try_start_2
    invoke-interface {v6}, Lcom/ning/http/client/Body;->getContentLength()J

    move-result-wide v30

    move-wide/from16 v0, v30

    long-to-int v0, v0

    move/from16 v18, v0

    .line 617
    .local v18, "length":I
    if-gez v18, :cond_20

    .line 618
    invoke-interface/range {p3 .. p3}, Lcom/ning/http/client/Request;->getContentLength()J

    move-result-wide v30

    move-wide/from16 v0, v30

    long-to-int v0, v0

    move/from16 v18, v0

    .line 620
    :cond_20
    if-ltz v18, :cond_21

    .line 621
    const-string v30, "Content-Length"

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p2

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 624
    :cond_21
    invoke-virtual/range {p2 .. p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v23

    .line 625
    .restart local v23    # "os":Ljava/io/OutputStream;
    const/16 v30, 0x2000

    invoke-static/range {v30 .. v30}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 626
    .local v8, "buffer":Ljava/nio/ByteBuffer;
    :goto_7
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 627
    invoke-interface {v6, v8}, Lcom/ning/http/client/Body;->read(Ljava/nio/ByteBuffer;)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-wide v30

    const-wide/16 v32, 0x0

    cmp-long v30, v30, v32

    if-gez v30, :cond_22

    .line 633
    invoke-static {v6}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    goto/16 :goto_5

    .line 630
    :cond_22
    :try_start_3
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v30

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v31

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->position()I

    move-result v32

    move-object/from16 v0, v23

    move-object/from16 v1, v30

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_7

    .line 633
    .end local v8    # "buffer":Ljava/nio/ByteBuffer;
    .end local v18    # "length":I
    .end local v23    # "os":Ljava/io/OutputStream;
    :catchall_1
    move-exception v30

    invoke-static {v6}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v30

    .line 495
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method private filterException(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 7
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 417
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;, "Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection<TT;>;"
    instance-of v3, p1, Ljava/net/UnknownHostException;

    if-eqz v3, :cond_1

    .line 418
    new-instance v1, Ljava/net/ConnectException;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .end local p1    # "t":Ljava/lang/Throwable;
    .local v1, "t":Ljava/lang/Throwable;
    move-object p1, v1

    .line 430
    .end local v1    # "t":Ljava/lang/Throwable;
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    return-object p1

    .line 420
    :cond_1
    instance-of v3, p1, Ljava/net/SocketTimeoutException;

    if-eqz v3, :cond_2

    .line 421
    iget-object v3, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    invoke-static {v3}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v3

    iget-object v4, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    invoke-static {v3, v4}, Lcom/ning/http/util/AsyncHttpProviderUtils;->requestTimeout(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)I

    move-result v0

    .line 422
    .local v0, "responseTimeout":I
    new-instance p1, Ljava/util/concurrent/TimeoutException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string v3, "No response received after %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p1, v3}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    .line 424
    .restart local p1    # "t":Ljava/lang/Throwable;
    goto :goto_0

    .end local v0    # "responseTimeout":I
    :cond_2
    instance-of v3, p1, Ljavax/net/ssl/SSLHandshakeException;

    if-eqz v3, :cond_0

    .line 425
    new-instance v2, Ljava/net/ConnectException;

    invoke-direct {v2}, Ljava/net/ConnectException;-><init>()V

    .line 426
    .local v2, "t2":Ljava/lang/Throwable;
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 427
    move-object p1, v2

    goto :goto_0
.end method

.method private handleIoException(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;
    .locals 4
    .param p1, "fc"    # Lcom/ning/http/client/filter/FilterContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/filter/FilterException;
        }
    .end annotation

    .prologue
    .line 407
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;, "Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection<TT;>;"
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    invoke-static {v2}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIOExceptionFilters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/filter/IOExceptionFilter;

    .line 408
    .local v0, "asyncFilter":Lcom/ning/http/client/filter/IOExceptionFilter;
    invoke-interface {v0, p1}, Lcom/ning/http/client/filter/IOExceptionFilter;->filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;

    move-result-object p1

    .line 409
    if-nez p1, :cond_0

    .line 410
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "FilterContext is null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 413
    .end local v0    # "asyncFilter":Lcom/ning/http/client/filter/IOExceptionFilter;
    :cond_1
    return-object p1
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 39
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 227
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;, "Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection<TT;>;"
    const/16 v35, 0x1

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    .line 228
    sget-object v26, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 230
    .local v26, "state":Lcom/ning/http/client/AsyncHandler$STATE;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v35, v0

    invoke-interface/range {v35 .. v35}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v33

    .line 232
    .local v33, "uri":Lcom/ning/http/client/uri/Uri;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v35

    move-object/from16 v3, v36

    invoke-direct {v0, v1, v2, v3}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->configure(Lcom/ning/http/client/uri/Uri;Ljava/net/HttpURLConnection;Lcom/ning/http/client/Request;)V

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->connect()V

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    instance-of v0, v0, Lcom/ning/http/client/listener/TransferCompletionHandler;

    move/from16 v35, v0

    if-eqz v35, :cond_3

    .line 236
    new-instance v35, Ljava/lang/IllegalStateException;

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-class v37, Lcom/ning/http/client/listener/TransferCompletionHandler;

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "not supported by this provider"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v35
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 363
    .end local v33    # "uri":Lcom/ning/http/client/uri/Uri;
    :catch_0
    move-exception v30

    .line 364
    .local v30, "t":Ljava/lang/Throwable;
    :try_start_1
    invoke-static {}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$000()Lorg/slf4j/Logger;

    move-result-object v35

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 366
    move-object/from16 v0, v30

    instance-of v0, v0, Ljava/io/IOException;

    move/from16 v35, v0

    if-eqz v35, :cond_23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIOExceptionFilters()Ljava/util/List;

    move-result-object v35

    invoke-interface/range {v35 .. v35}, Ljava/util/List;->isEmpty()Z

    move-result v35

    if-nez v35, :cond_23

    .line 367
    new-instance v35, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct/range {v35 .. v35}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v36

    const-class v35, Ljava/io/IOException;

    move-object/from16 v0, v35

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/io/IOException;

    move-object/from16 v0, v36

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->ioException(Ljava/io/IOException;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v12

    .line 371
    .local v12, "fc":Lcom/ning/http/client/filter/FilterContext;
    :try_start_2
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->handleIoException(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;
    :try_end_2
    .catch Lcom/ning/http/client/filter/FilterException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v12

    .line 379
    :goto_0
    :try_start_3
    invoke-virtual {v12}, Lcom/ning/http/client/filter/FilterContext;->replayRequest()Z

    move-result v35

    if-eqz v35, :cond_23

    .line 380
    invoke-virtual {v12}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    .line 381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-static/range {v35 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$200(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Lcom/ning/http/client/Request;)Ljava/net/HttpURLConnection;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    .line 382
    invoke-virtual/range {p0 .. p0}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->call()Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v31

    .line 392
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    move/from16 v35, v0

    if-eqz v35, :cond_2

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v35

    const/16 v36, -0x1

    move/from16 v0, v35

    move/from16 v1, v36

    if-eq v0, v1, :cond_0

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 396
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v35

    if-eqz v35, :cond_1

    .line 398
    const-string v35, "http.auth.ntlm.domain"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 400
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/net/Authenticator;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    .line 403
    .end local v12    # "fc":Lcom/ning/http/client/filter/FilterContext;
    .end local v30    # "t":Ljava/lang/Throwable;
    :cond_2
    :goto_1
    return-object v31

    .line 239
    .restart local v33    # "uri":Lcom/ning/http/client/uri/Uri;
    :cond_3
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v28

    .line 241
    .local v28, "statusCode":I
    invoke-static {}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$000()Lorg/slf4j/Logger;

    move-result-object v35

    const-string v36, "\n\nRequest {}\n\nResponse {}\n"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v37, v0

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    invoke-interface/range {v35 .. v38}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 243
    new-instance v27, Lcom/ning/http/client/providers/jdk/ResponseStatus;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v36, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v33

    move-object/from16 v2, v35

    move-object/from16 v3, v36

    invoke-direct {v0, v1, v2, v3}, Lcom/ning/http/client/providers/jdk/ResponseStatus;-><init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;Ljava/net/HttpURLConnection;)V

    .line 244
    .local v27, "status":Lcom/ning/http/client/providers/jdk/ResponseStatus;
    new-instance v35, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct/range {v35 .. v35}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-virtual/range {v35 .. v36}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseStatus(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;

    move-result-object v12

    .line 245
    .restart local v12    # "fc":Lcom/ning/http/client/filter/FilterContext;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getResponseFilters()Ljava/util/List;

    move-result-object v35

    invoke-interface/range {v35 .. v35}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_8

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ning/http/client/filter/ResponseFilter;

    .line 246
    .local v4, "asyncFilter":Lcom/ning/http/client/filter/ResponseFilter;
    invoke-interface {v4, v12}, Lcom/ning/http/client/filter/ResponseFilter;->filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;

    move-result-object v12

    .line 247
    if-nez v12, :cond_4

    .line 248
    new-instance v35, Ljava/lang/NullPointerException;

    const-string v36, "FilterContext is null"

    invoke-direct/range {v35 .. v36}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v35
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 392
    .end local v4    # "asyncFilter":Lcom/ning/http/client/filter/ResponseFilter;
    .end local v12    # "fc":Lcom/ning/http/client/filter/FilterContext;
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v27    # "status":Lcom/ning/http/client/providers/jdk/ResponseStatus;
    .end local v28    # "statusCode":I
    .end local v33    # "uri":Lcom/ning/http/client/uri/Uri;
    :catchall_0
    move-exception v35

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    move/from16 v36, v0

    if-eqz v36, :cond_7

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v36

    const/16 v37, -0x1

    move/from16 v0, v36

    move/from16 v1, v37

    if-eq v0, v1, :cond_5

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 396
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v36

    if-eqz v36, :cond_6

    .line 398
    const-string v36, "http.auth.ntlm.domain"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v37, v0

    invoke-static/range {v37 .. v37}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 400
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/net/Authenticator;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    :cond_7
    throw v35

    .line 253
    .restart local v12    # "fc":Lcom/ning/http/client/filter/FilterContext;
    .restart local v13    # "i$":Ljava/util/Iterator;
    .restart local v27    # "status":Lcom/ning/http/client/providers/jdk/ResponseStatus;
    .restart local v28    # "statusCode":I
    .restart local v33    # "uri":Lcom/ning/http/client/uri/Uri;
    :cond_8
    :try_start_5
    invoke-virtual {v12}, Lcom/ning/http/client/filter/FilterContext;->replayRequest()Z

    move-result v35

    if-eqz v35, :cond_b

    .line 254
    invoke-virtual {v12}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-static/range {v35 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$200(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Lcom/ning/http/client/Request;)Ljava/net/HttpURLConnection;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    .line 256
    const/16 v35, 0x0

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    .line 257
    invoke-virtual/range {p0 .. p0}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->call()Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v31

    .line 392
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    move/from16 v35, v0

    if-eqz v35, :cond_2

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v35

    const/16 v36, -0x1

    move/from16 v0, v35

    move/from16 v1, v36

    if-eq v0, v1, :cond_9

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 396
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v35

    if-eqz v35, :cond_a

    .line 398
    const-string v35, "http.auth.ntlm.domain"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 400
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/net/Authenticator;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    goto/16 :goto_1

    .line 260
    :cond_b
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-static/range {v35 .. v36}, Lcom/ning/http/util/AsyncHttpProviderUtils;->followRedirect(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Z

    move-result v35

    if-eqz v35, :cond_10

    const/16 v35, 0x12e

    move/from16 v0, v28

    move/from16 v1, v35

    if-eq v0, v1, :cond_c

    const/16 v35, 0x12d

    move/from16 v0, v28

    move/from16 v1, v35

    if-ne v0, v1, :cond_10

    .line 262
    :cond_c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->currentRedirectCount:I

    move/from16 v35, v0

    add-int/lit8 v36, v35, 0x1

    move/from16 v0, v36

    move-object/from16 v1, p0

    iput v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->currentRedirectCount:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxRedirects()I

    move-result v36

    move/from16 v0, v35

    move/from16 v1, v36

    if-ge v0, v1, :cond_f

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    const-string v36, "Location"

    invoke-virtual/range {v35 .. v36}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 264
    .local v19, "location":Ljava/lang/String;
    move-object/from16 v0, v33

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/ning/http/client/uri/Uri;->create(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v25

    .line 266
    .local v25, "redirUri":Lcom/ning/http/client/uri/Uri;
    move-object/from16 v0, v25

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/ning/http/client/uri/Uri;->equals(Ljava/lang/Object;)Z

    move-result v35

    if-nez v35, :cond_10

    .line 267
    new-instance v6, Lcom/ning/http/client/RequestBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    invoke-direct {v6, v0}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    .line 269
    .local v6, "builder":Lcom/ning/http/client/RequestBuilder;
    invoke-static {}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$000()Lorg/slf4j/Logger;

    move-result-object v35

    const-string v36, "Redirecting to {}"

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 271
    move-object/from16 v0, v25

    invoke-virtual {v6, v0}, Lcom/ning/http/client/RequestBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v35

    check-cast v35, Lcom/ning/http/client/RequestBuilder;

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-static/range {v35 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$200(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Lcom/ning/http/client/Request;)Ljava/net/HttpURLConnection;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    .line 273
    const/16 v35, 0x0

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    .line 274
    invoke-virtual/range {p0 .. p0}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->call()Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v31

    .line 392
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    move/from16 v35, v0

    if-eqz v35, :cond_2

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v35

    const/16 v36, -0x1

    move/from16 v0, v35

    move/from16 v1, v36

    if-eq v0, v1, :cond_d

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 396
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v35

    if-eqz v35, :cond_e

    .line 398
    const-string v35, "http.auth.ntlm.domain"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 400
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/net/Authenticator;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    goto/16 :goto_1

    .line 277
    .end local v6    # "builder":Lcom/ning/http/client/RequestBuilder;
    .end local v19    # "location":Ljava/lang/String;
    .end local v25    # "redirUri":Lcom/ning/http/client/uri/Uri;
    :cond_f
    :try_start_7
    new-instance v35, Lcom/ning/http/client/MaxRedirectException;

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "Maximum redirect reached: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v37, v0

    invoke-static/range {v37 .. v37}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxRedirects()I

    move-result v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Lcom/ning/http/client/MaxRedirectException;-><init>(Ljava/lang/String;)V

    throw v35

    .line 281
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v35, v0

    invoke-interface/range {v35 .. v35}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v35

    if-eqz v35, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v35, v0

    invoke-interface/range {v35 .. v35}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v24

    .line 282
    .local v24, "realm":Lcom/ning/http/client/Realm;
    :goto_2
    const/16 v35, 0x191

    move/from16 v0, v28

    move/from16 v1, v35

    if-ne v0, v1, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->isAuth:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v35, v0

    const/16 v36, 0x1

    invoke-virtual/range {v35 .. v36}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v35

    if-nez v35, :cond_14

    if-eqz v24, :cond_14

    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    const-string v36, "WWW-Authenticate"

    invoke-virtual/range {v35 .. v36}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 285
    .local v34, "wwwAuth":Ljava/lang/String;
    invoke-static {}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$000()Lorg/slf4j/Logger;

    move-result-object v35

    const-string v36, "Sending authentication to {}"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v37, v0

    invoke-interface/range {v37 .. v37}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v37

    invoke-interface/range {v35 .. v37}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 287
    new-instance v35, Lcom/ning/http/client/Realm$RealmBuilder;

    invoke-direct/range {v35 .. v35}, Lcom/ning/http/client/Realm$RealmBuilder;-><init>()V

    move-object/from16 v0, v35

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->clone(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lcom/ning/http/client/Realm$RealmBuilder;->parseWWWAuthenticateHeader(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-interface/range {v36 .. v36}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v36

    invoke-virtual/range {v35 .. v36}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-interface/range {v36 .. v36}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v36

    invoke-virtual/range {v35 .. v36}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v35

    const/16 v36, 0x1

    invoke-virtual/range {v35 .. v36}, Lcom/ning/http/client/Realm$RealmBuilder;->setUsePreemptiveAuth(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;

    move-result-object v21

    .line 293
    .local v21, "nr":Lcom/ning/http/client/Realm;
    new-instance v6, Lcom/ning/http/client/RequestBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    invoke-direct {v6, v0}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    .line 294
    .restart local v6    # "builder":Lcom/ning/http/client/RequestBuilder;
    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Lcom/ning/http/client/RequestBuilder;->setRealm(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v35

    check-cast v35, Lcom/ning/http/client/RequestBuilder;

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v36, v0

    invoke-static/range {v35 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$200(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Lcom/ning/http/client/Request;)Ljava/net/HttpURLConnection;

    move-result-object v35

    move-object/from16 v0, v35

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    .line 296
    const/16 v35, 0x0

    move/from16 v0, v35

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    .line 297
    invoke-virtual/range {p0 .. p0}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->call()Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result-object v31

    .line 392
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    move/from16 v35, v0

    if-eqz v35, :cond_2

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v35

    const/16 v36, -0x1

    move/from16 v0, v35

    move/from16 v1, v36

    if-eq v0, v1, :cond_11

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 396
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v35

    if-eqz v35, :cond_12

    .line 398
    const-string v35, "http.auth.ntlm.domain"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 400
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/net/Authenticator;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    goto/16 :goto_1

    .line 281
    .end local v6    # "builder":Lcom/ning/http/client/RequestBuilder;
    .end local v21    # "nr":Lcom/ning/http/client/Realm;
    .end local v24    # "realm":Lcom/ning/http/client/Realm;
    .end local v34    # "wwwAuth":Ljava/lang/String;
    :cond_13
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v24

    goto/16 :goto_2

    .line 300
    .restart local v24    # "realm":Lcom/ning/http/client/Realm;
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Lcom/ning/http/client/AsyncHandler;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v26

    .line 301
    sget-object v35, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    move-object/from16 v0, v26

    move-object/from16 v1, v35

    if-ne v0, v1, :cond_15

    .line 302
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v35, v0

    new-instance v36, Lcom/ning/http/client/providers/jdk/ResponseHeaders;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v38, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v33

    move-object/from16 v2, v37

    move-object/from16 v3, v38

    invoke-direct {v0, v1, v2, v3}, Lcom/ning/http/client/providers/jdk/ResponseHeaders;-><init>(Lcom/ning/http/client/uri/Uri;Ljava/net/HttpURLConnection;Lcom/ning/http/client/AsyncHttpProvider;)V

    invoke-interface/range {v35 .. v36}, Lcom/ning/http/client/AsyncHandler;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v26

    .line 305
    :cond_15
    sget-object v35, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    move-object/from16 v0, v26

    move-object/from16 v1, v35

    if-ne v0, v1, :cond_1a

    .line 306
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v36, v0

    invoke-static/range {v35 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$300(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Ljava/net/HttpURLConnection;)Ljava/io/InputStream;

    move-result-object v14

    .line 307
    .local v14, "is":Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    const-string v36, "Content-Encoding"

    invoke-virtual/range {v35 .. v36}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 308
    .local v9, "contentEncoding":Ljava/lang/String;
    if-nez v9, :cond_1e

    const/16 v16, 0x0

    .line 309
    .local v16, "isGZipped":Z
    :goto_3
    if-eqz v16, :cond_16

    .line 310
    new-instance v15, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v15, v14}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .end local v14    # "is":Ljava/io/InputStream;
    .local v15, "is":Ljava/io/InputStream;
    move-object v14, v15

    .line 313
    .end local v15    # "is":Ljava/io/InputStream;
    .restart local v14    # "is":Ljava/io/InputStream;
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v7

    .line 314
    .local v7, "byteToRead":I
    move-object/from16 v29, v14

    .line 315
    .local v29, "stream":Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$400(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Z

    move-result v35

    if-nez v35, :cond_17

    if-gtz v7, :cond_18

    .line 316
    :cond_17
    const/16 v35, 0x1

    move/from16 v0, v35

    new-array v0, v0, [I

    move-object/from16 v18, v0

    .line 317
    .local v18, "lengthWrapper":[I
    move-object/from16 v0, v18

    invoke-static {v14, v0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->readFully(Ljava/io/InputStream;[I)[B

    move-result-object v8

    .line 318
    .local v8, "bytes":[B
    new-instance v29, Ljava/io/ByteArrayInputStream;

    .end local v29    # "stream":Ljava/io/InputStream;
    const/16 v35, 0x0

    const/16 v36, 0x0

    aget v36, v18, v36

    move-object/from16 v0, v29

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v8, v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 319
    .restart local v29    # "stream":Ljava/io/InputStream;
    const/16 v35, 0x0

    aget v7, v18, v35

    .line 322
    .end local v8    # "bytes":[B
    .end local v18    # "lengthWrapper":[I
    :cond_18
    if-lez v7, :cond_19

    .line 323
    const/16 v35, 0x2000

    move/from16 v0, v35

    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v20

    .line 324
    .local v20, "minBytes":I
    move/from16 v0, v20

    new-array v8, v0, [B

    .line 325
    .restart local v8    # "bytes":[B
    const/16 v35, 0x2000

    move/from16 v0, v20

    move/from16 v1, v35

    if-ge v0, v1, :cond_1f

    move/from16 v17, v20

    .line 326
    .local v17, "leftBytes":I
    :goto_4
    const/16 v23, 0x0

    .line 327
    .local v23, "read":I
    :goto_5
    const/16 v35, -0x1

    move/from16 v0, v17

    move/from16 v1, v35

    if-le v0, v1, :cond_19

    .line 329
    move-object/from16 v0, v29

    invoke-virtual {v0, v8}, Ljava/io/InputStream;->read([B)I

    move-result v23

    .line 330
    const/16 v35, -0x1

    move/from16 v0, v23

    move/from16 v1, v35

    if-ne v0, v1, :cond_20

    .line 343
    .end local v8    # "bytes":[B
    .end local v17    # "leftBytes":I
    .end local v20    # "minBytes":I
    .end local v23    # "read":I
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->request:Lcom/ning/http/client/Request;

    move-object/from16 v35, v0

    invoke-interface/range {v35 .. v35}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v35

    const-string v36, "HEAD"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_1a

    .line 344
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v35, v0

    new-instance v36, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;

    const-string v37, ""

    invoke-virtual/range {v37 .. v37}, Ljava/lang/String;->getBytes()[B

    move-result-object v37

    const/16 v38, 0x1

    invoke-direct/range {v36 .. v38}, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;-><init>([BZ)V

    invoke-interface/range {v35 .. v36}, Lcom/ning/http/client/AsyncHandler;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    .line 348
    .end local v7    # "byteToRead":I
    .end local v9    # "contentEncoding":Ljava/lang/String;
    .end local v14    # "is":Ljava/io/InputStream;
    .end local v16    # "isGZipped":Z
    .end local v29    # "stream":Ljava/io/InputStream;
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    instance-of v0, v0, Lcom/ning/http/client/ProgressAsyncHandler;

    move/from16 v35, v0

    if-eqz v35, :cond_1b

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v22, v0

    check-cast v22, Lcom/ning/http/client/ProgressAsyncHandler;

    .line 350
    .local v22, "progressAsyncHandler":Lcom/ning/http/client/ProgressAsyncHandler;
    invoke-interface/range {v22 .. v22}, Lcom/ning/http/client/ProgressAsyncHandler;->onHeaderWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;

    .line 351
    invoke-interface/range {v22 .. v22}, Lcom/ning/http/client/ProgressAsyncHandler;->onContentWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 354
    .end local v22    # "progressAsyncHandler":Lcom/ning/http/client/ProgressAsyncHandler;
    :cond_1b
    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v35, v0

    invoke-interface/range {v35 .. v35}, Lcom/ning/http/client/AsyncHandler;->onCompleted()Ljava/lang/Object;

    move-result-object v31

    .line 355
    .local v31, "t":Ljava/lang/Object;, "TT;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->future:Lcom/ning/http/client/providers/jdk/JDKFuture;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/jdk/JDKFuture;->content(Ljava/lang/Object;)V

    .line 356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->future:Lcom/ning/http/client/providers/jdk/JDKFuture;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKFuture;->done()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 392
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    move/from16 v35, v0

    if-eqz v35, :cond_2

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v35

    const/16 v36, -0x1

    move/from16 v0, v35

    move/from16 v1, v36

    if-eq v0, v1, :cond_1c

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 396
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v35

    if-eqz v35, :cond_1d

    .line 398
    const-string v35, "http.auth.ntlm.domain"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 400
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/net/Authenticator;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    goto/16 :goto_1

    .line 308
    .end local v31    # "t":Ljava/lang/Object;, "TT;"
    .restart local v9    # "contentEncoding":Ljava/lang/String;
    .restart local v14    # "is":Ljava/io/InputStream;
    :cond_1e
    :try_start_a
    const-string v35, "gzip"

    move-object/from16 v0, v35

    invoke-virtual {v0, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v16

    goto/16 :goto_3

    .restart local v7    # "byteToRead":I
    .restart local v8    # "bytes":[B
    .restart local v16    # "isGZipped":Z
    .restart local v20    # "minBytes":I
    .restart local v29    # "stream":Ljava/io/InputStream;
    :cond_1f
    move/from16 v17, v7

    .line 325
    goto/16 :goto_4

    .line 334
    .restart local v17    # "leftBytes":I
    .restart local v23    # "read":I
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->future:Lcom/ning/http/client/providers/jdk/JDKFuture;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKFuture;->touch()V

    .line 336
    move/from16 v0, v23

    new-array v5, v0, [B

    .line 337
    .local v5, "b":[B
    const/16 v35, 0x0

    const/16 v36, 0x0

    move/from16 v0, v35

    move/from16 v1, v36

    move/from16 v2, v23

    invoke-static {v8, v0, v5, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 338
    sub-int v17, v17, v23

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v36, v0

    new-instance v37, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;

    const/16 v35, -0x1

    move/from16 v0, v17

    move/from16 v1, v35

    if-le v0, v1, :cond_21

    const/16 v35, 0x1

    :goto_6
    move-object/from16 v0, v37

    move/from16 v1, v35

    invoke-direct {v0, v5, v1}, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;-><init>([BZ)V

    invoke-interface/range {v36 .. v37}, Lcom/ning/http/client/AsyncHandler;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    goto/16 :goto_5

    :cond_21
    const/16 v35, 0x0

    goto :goto_6

    .line 358
    .end local v5    # "b":[B
    .end local v7    # "byteToRead":I
    .end local v8    # "bytes":[B
    .end local v9    # "contentEncoding":Ljava/lang/String;
    .end local v14    # "is":Ljava/io/InputStream;
    .end local v16    # "isGZipped":Z
    .end local v17    # "leftBytes":I
    .end local v20    # "minBytes":I
    .end local v23    # "read":I
    .end local v29    # "stream":Ljava/io/InputStream;
    :catch_1
    move-exception v30

    .line 359
    .restart local v30    # "t":Ljava/lang/Throwable;
    new-instance v11, Ljava/lang/RuntimeException;

    invoke-direct {v11}, Ljava/lang/RuntimeException;-><init>()V

    .line 360
    .local v11, "ex":Ljava/lang/RuntimeException;
    move-object/from16 v0, v30

    invoke-virtual {v11, v0}, Ljava/lang/RuntimeException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 361
    throw v11
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 372
    .end local v11    # "ex":Ljava/lang/RuntimeException;
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v24    # "realm":Lcom/ning/http/client/Realm;
    .end local v27    # "status":Lcom/ning/http/client/providers/jdk/ResponseStatus;
    .end local v28    # "statusCode":I
    .end local v33    # "uri":Lcom/ning/http/client/uri/Uri;
    :catch_2
    move-exception v10

    .line 373
    .local v10, "e":Lcom/ning/http/client/filter/FilterException;
    :try_start_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v35

    const/16 v36, -0x1

    move/from16 v0, v35

    move/from16 v1, v36

    if-eq v0, v1, :cond_22

    .line 374
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 376
    :cond_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->future:Lcom/ning/http/client/providers/jdk/JDKFuture;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKFuture;->done()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto/16 :goto_0

    .line 387
    .end local v10    # "e":Lcom/ning/http/client/filter/FilterException;
    .end local v12    # "fc":Lcom/ning/http/client/filter/FilterContext;
    :cond_23
    :try_start_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->future:Lcom/ning/http/client/providers/jdk/JDKFuture;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->filterException(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v36

    invoke-virtual/range {v35 .. v36}, Lcom/ning/http/client/providers/jdk/JDKFuture;->abort(Ljava/lang/Throwable;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 392
    :goto_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->terminate:Z

    move/from16 v35, v0

    if-eqz v35, :cond_26

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v35

    const/16 v36, -0x1

    move/from16 v0, v35

    move/from16 v1, v36

    if-eq v0, v1, :cond_24

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 396
    :cond_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v35

    if-eqz v35, :cond_25

    .line 398
    const-string v35, "http.auth.ntlm.domain"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 400
    :cond_25
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;->this$0:Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/net/Authenticator;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    .line 403
    :cond_26
    const/16 v31, 0x0

    goto/16 :goto_1

    .line 388
    :catch_3
    move-exception v32

    .line 389
    .local v32, "t2":Ljava/lang/Throwable;
    :try_start_d
    invoke-static {}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->access$000()Lorg/slf4j/Logger;

    move-result-object v35

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto :goto_7
.end method
