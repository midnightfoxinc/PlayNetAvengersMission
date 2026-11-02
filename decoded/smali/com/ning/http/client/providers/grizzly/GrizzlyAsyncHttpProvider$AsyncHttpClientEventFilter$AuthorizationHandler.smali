.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lcom/ning/http/client/providers/grizzly/StatusHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AuthorizationHandler"
.end annotation


# static fields
.field static final INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1417
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;

    invoke-direct {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;-><init>()V

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1415
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleStatus(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z
    .locals 13
    .param p1, "responsePacket"    # Lorg/glassfish/grizzly/http/HttpResponsePacket;
    .param p2, "httpTransactionContext"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .param p3, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    .line 1432
    sget-object v0, Lorg/glassfish/grizzly/http/util/Header;->WWWAuthenticate:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {p1, v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getHeader(Lorg/glassfish/grizzly/http/util/Header;)Ljava/lang/String;

    move-result-object v6

    .line 1433
    .local v6, "auth":Ljava/lang/String;
    if-nez v6, :cond_0

    .line 1434
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "401 response received, but no WWW-Authenticate header was present"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1437
    :cond_0
    iget-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-interface {v0}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v12

    .line 1438
    .local v12, "realm":Lcom/ning/http/client/Realm;
    if-nez v12, :cond_1

    .line 1439
    iget-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v12

    .line 1441
    :cond_1
    if-nez v12, :cond_3

    .line 1442
    sget-object v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->STOP:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    iput-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 1443
    iget-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    if-eqz v0, :cond_2

    .line 1445
    :try_start_0
    iget-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    iget-object v3, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->responseStatus:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;

    invoke-interface {v0, v3}, Lcom/ning/http/client/AsyncHandler;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1451
    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 1499
    :goto_1
    return v0

    .line 1447
    :catch_0
    move-exception v7

    .line 1448
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {p2, v7}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1454
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_3
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->setSkipRemainder(Z)V

    .line 1456
    iget-object v2, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    .line 1457
    .local v2, "req":Lcom/ning/http/client/Request;
    new-instance v0, Lcom/ning/http/client/Realm$RealmBuilder;

    invoke-direct {v0}, Lcom/ning/http/client/Realm$RealmBuilder;-><init>()V

    invoke-virtual {v0, v12}, Lcom/ning/http/client/Realm$RealmBuilder;->clone(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v12}, Lcom/ning/http/client/Realm;->getScheme()Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    iget-object v3, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-interface {v3}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-interface {v2}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setMethodName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/ning/http/client/Realm$RealmBuilder;->setUsePreemptiveAuth(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/ning/http/client/Realm$RealmBuilder;->parseWWWAuthenticateHeader(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;

    move-result-object v12

    .line 1464
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v6, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    .line 1465
    .local v9, "lowerCaseAuth":Ljava/lang/String;
    const-string v0, "basic"

    invoke-virtual {v9, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1466
    invoke-interface {v2}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    sget-object v3, Lorg/glassfish/grizzly/http/util/Header;->Authorization:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v3}, Lorg/glassfish/grizzly/http/util/Header;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 1467
    invoke-interface {v2}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    sget-object v3, Lorg/glassfish/grizzly/http/util/Header;->Authorization:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v3}, Lorg/glassfish/grizzly/http/util/Header;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v12}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 1476
    :goto_2
    iget-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    move-result-object v10

    .line 1478
    .local v10, "m":Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    :try_start_1
    iget-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-virtual {v10, v2, v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->obtainConnection(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/Connection;

    move-result-object v1

    .line 1480
    .local v1, "c":Lorg/glassfish/grizzly/Connection;
    invoke-virtual {p2, v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->cloneAndStartTransactionFor(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v11

    .line 1482
    .local v11, "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    const/4 v0, 0x0

    iput-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    .line 1483
    sget-object v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->STOP:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    iput-object v0, v11, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 1485
    :try_start_2
    iget-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v3, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    iget-object v4, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->execute(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1490
    const/4 v0, 0x0

    goto/16 :goto_1

    .line 1468
    .end local v1    # "c":Lorg/glassfish/grizzly/Connection;
    .end local v10    # "m":Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    .end local v11    # "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    :cond_4
    const-string v0, "digest"

    invoke-virtual {v9, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1469
    invoke-interface {v2}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    sget-object v3, Lorg/glassfish/grizzly/http/util/Header;->Authorization:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v3}, Lorg/glassfish/grizzly/http/util/Header;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 1470
    invoke-interface {v2}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    sget-object v3, Lorg/glassfish/grizzly/http/util/Header;->Authorization:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v3}, Lorg/glassfish/grizzly/http/util/Header;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v12}, Lcom/ning/http/util/AuthenticatorUtils;->computeDigestAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_2

    .line 1473
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsupported authorization method: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1491
    .restart local v1    # "c":Lorg/glassfish/grizzly/Connection;
    .restart local v10    # "m":Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    .restart local v11    # "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    :catch_1
    move-exception v8

    .line 1492
    .local v8, "ioe":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v11, v8}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 1493
    const/4 v0, 0x0

    goto/16 :goto_1

    .line 1495
    .end local v1    # "c":Lorg/glassfish/grizzly/Connection;
    .end local v8    # "ioe":Ljava/io/IOException;
    .end local v11    # "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    :catch_2
    move-exception v7

    .line 1496
    .restart local v7    # "e":Ljava/lang/Exception;
    invoke-virtual {p2, v7}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 1498
    sget-object v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->STOP:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    iput-object v0, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 1499
    const/4 v0, 0x0

    goto/16 :goto_1
.end method

.method public handlesStatus(I)Z
    .locals 1
    .param p1, "statusCode"    # I

    .prologue
    .line 1424
    sget-object v0, Lorg/glassfish/grizzly/http/util/HttpStatus;->UNAUTHORIZED_401:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v0

    return v0
.end method
