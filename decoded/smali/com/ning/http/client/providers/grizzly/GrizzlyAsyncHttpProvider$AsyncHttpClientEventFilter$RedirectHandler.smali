.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;
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
    name = "RedirectHandler"
.end annotation


# static fields
.field static final INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1507
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    invoke-direct {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;-><init>()V

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1505
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private notifySchemeSwitch(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/uri/Uri;)V
    .locals 3
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "c"    # Lorg/glassfish/grizzly/Connection;
    .param p3, "uri"    # Lcom/ning/http/client/uri/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1607
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;

    const-string v1, "https"

    invoke-virtual {p3}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-direct {v0, v1, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;-><init>(ZLorg/glassfish/grizzly/Connection;)V

    invoke-virtual {p1, v0}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->notifyDownstream(Lorg/glassfish/grizzly/filterchain/FilterChainEvent;)V

    .line 1609
    return-void
.end method

.method private sendAsGet(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Z
    .locals 3
    .param p1, "response"    # Lorg/glassfish/grizzly/http/HttpResponsePacket;
    .param p2, "ctx"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    const/16 v2, 0x12e

    .line 1589
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getStatus()I

    move-result v0

    .line 1590
    .local v0, "statusCode":I
    if-lt v0, v2, :cond_1

    const/16 v1, 0x12f

    if-gt v0, v1, :cond_1

    if-ne v0, v2, :cond_0

    iget-object v1, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isStrict302Handling()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private switchingSchemes(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/uri/Uri;)Z
    .locals 2
    .param p1, "oldUri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "newUri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 1599
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public handleStatus(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z
    .locals 14
    .param p1, "responsePacket"    # Lorg/glassfish/grizzly/http/HttpResponsePacket;
    .param p2, "httpTransactionContext"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .param p3, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    .line 1522
    sget-object v1, Lorg/glassfish/grizzly/http/util/Header;->Location:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {p1, v1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getHeader(Lorg/glassfish/grizzly/http/util/Header;)Ljava/lang/String;

    move-result-object v12

    .line 1523
    .local v12, "redirectURL":Ljava/lang/String;
    if-nez v12, :cond_0

    .line 1524
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v4, "redirect received, but no location header was present"

    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1528
    :cond_0
    move-object/from16 v0, p2

    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->lastRedirectURI:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 1529
    move-object/from16 v0, p2

    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-interface {v1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v11

    .line 1534
    .local v11, "orig":Lcom/ning/http/client/uri/Uri;
    :goto_0
    move-object/from16 v0, p2

    iput-object v12, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->lastRedirectURI:Ljava/lang/String;

    .line 1536
    invoke-static {v11, v12}, Lcom/ning/http/client/uri/Uri;->create(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v13

    .line 1537
    .local v13, "uri":Lcom/ning/http/client/uri/Uri;
    invoke-virtual {v13}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1538
    invoke-direct/range {p0 .. p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->sendAsGet(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Z

    move-result v1

    move-object/from16 v0, p2

    invoke-static {v13, p1, v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->access$1100(Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Z)Lcom/ning/http/client/Request;

    move-result-object v3

    .line 1554
    .local v3, "requestToSend":Lcom/ning/http/client/Request;
    move-object/from16 v0, p2

    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    move-result-object v9

    .line 1556
    .local v9, "m":Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    :try_start_0
    move-object/from16 v0, p2

    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-virtual {v9, v3, v1}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->obtainConnection(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    .line 1558
    .local v2, "c":Lorg/glassfish/grizzly/Connection;
    invoke-direct {p0, v11, v13}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->switchingSchemes(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/uri/Uri;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result v1

    if-eqz v1, :cond_1

    .line 1560
    :try_start_1
    move-object/from16 v0, p3

    invoke-direct {p0, v0, v2, v13}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->notifySchemeSwitch(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/uri/Uri;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 1565
    :cond_1
    :goto_1
    :try_start_2
    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->cloneAndStartTransactionFor(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v10

    .line 1567
    .local v10, "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    const/4 v1, 0x0

    move-object/from16 v0, p2

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    .line 1568
    sget-object v1, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    iput-object v1, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 1569
    move-object/from16 v0, p2

    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v4, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    iget-object v5, v10, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->execute(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1574
    const/4 v1, 0x0

    .line 1580
    .end local v2    # "c":Lorg/glassfish/grizzly/Connection;
    .end local v3    # "requestToSend":Lcom/ning/http/client/Request;
    .end local v9    # "m":Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    .end local v10    # "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    :goto_2
    return v1

    .line 1531
    .end local v11    # "orig":Lcom/ning/http/client/uri/Uri;
    .end local v13    # "uri":Lcom/ning/http/client/uri/Uri;
    :cond_2
    move-object/from16 v0, p2

    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-interface {v1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->lastRedirectURI:Ljava/lang/String;

    invoke-static {v1, v4}, Lcom/ning/http/client/uri/Uri;->create(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v11

    .restart local v11    # "orig":Lcom/ning/http/client/uri/Uri;
    goto :goto_0

    .line 1543
    .restart local v13    # "uri":Lcom/ning/http/client/uri/Uri;
    :cond_3
    const/4 v1, 0x0

    move-object/from16 v0, p2

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    .line 1544
    sget-object v1, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    move-object/from16 v0, p2

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 1546
    :try_start_3
    move-object/from16 v0, p2

    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    move-object/from16 v0, p2

    iget-object v4, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->responseStatus:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;

    invoke-interface {v1, v4}, Lcom/ning/http/client/AsyncHandler;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 1551
    :goto_3
    const/4 v1, 0x1

    goto :goto_2

    .line 1548
    :catch_0
    move-exception v7

    .line 1549
    .local v7, "e":Ljava/lang/Exception;
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_3

    .line 1561
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v2    # "c":Lorg/glassfish/grizzly/Connection;
    .restart local v3    # "requestToSend":Lcom/ning/http/client/Request;
    .restart local v9    # "m":Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    :catch_1
    move-exception v8

    .line 1562
    .local v8, "ioe":Ljava/io/IOException;
    :try_start_4
    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    .line 1575
    .end local v2    # "c":Lorg/glassfish/grizzly/Connection;
    .end local v8    # "ioe":Ljava/io/IOException;
    :catch_2
    move-exception v7

    .line 1576
    .restart local v7    # "e":Ljava/lang/Exception;
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 1579
    sget-object v1, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    move-object/from16 v0, p2

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 1580
    const/4 v1, 0x1

    goto :goto_2
.end method

.method public handlesStatus(I)Z
    .locals 1
    .param p1, "statusCode"    # I

    .prologue
    .line 1514
    invoke-static {p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->access$1000(I)Z

    move-result v0

    return v0
.end method
