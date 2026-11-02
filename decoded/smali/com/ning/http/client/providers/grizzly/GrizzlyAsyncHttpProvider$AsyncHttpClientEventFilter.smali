.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;
.super Lorg/glassfish/grizzly/http/HttpClientFilter;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AsyncHttpClientEventFilter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;
    }
.end annotation


# instance fields
.field private final HANDLER_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/ning/http/client/providers/grizzly/StatusHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;I)V
    .locals 3
    .param p1, "provider"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "maxHerdersSizeProperty"    # I

    .prologue
    .line 976
    invoke-direct {p0, p2}, Lorg/glassfish/grizzly/http/HttpClientFilter;-><init>(I)V

    .line 966
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    .line 978
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    .line 979
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    sget-object v1, Lorg/glassfish/grizzly/http/util/HttpStatus;->UNAUTHORIZED_401:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/util/HttpStatus;->getStatusCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$AuthorizationHandler;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 981
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    sget-object v1, Lorg/glassfish/grizzly/http/util/HttpStatus;->MOVED_PERMANENTLY_301:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/util/HttpStatus;->getStatusCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 983
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    sget-object v1, Lorg/glassfish/grizzly/http/util/HttpStatus;->FOUND_302:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/util/HttpStatus;->getStatusCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 985
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    sget-object v1, Lorg/glassfish/grizzly/http/util/HttpStatus;->SEE_OTHER_303:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/util/HttpStatus;->getStatusCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 987
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    sget-object v1, Lorg/glassfish/grizzly/http/util/HttpStatus;->TEMPORARY_REDIRECT_307:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/util/HttpStatus;->getStatusCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 989
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    sget-object v1, Lorg/glassfish/grizzly/http/util/HttpStatus;->PERMANENT_REDIRECT_308:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/util/HttpStatus;->getStatusCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 992
    return-void
.end method

.method static synthetic access$1000(I)Z
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 964
    invoke-static {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->isRedirect(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Z)Lcom/ning/http/client/Request;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/uri/Uri;
    .param p1, "x1"    # Lorg/glassfish/grizzly/http/HttpResponsePacket;
    .param p2, "x2"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .param p3, "x3"    # Z

    .prologue
    .line 964
    invoke-static {p0, p1, p2, p3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->newRequest(Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Z)Lcom/ning/http/client/Request;

    move-result-object v0

    return-object v0
.end method

.method private static cleanup(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V
    .locals 4
    .param p0, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p1, "provider"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    .prologue
    .line 1379
    invoke-virtual {p0}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    .line 1380
    .local v0, "c":Lorg/glassfish/grizzly/Connection;
    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->cleanupTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v1

    .line 1381
    .local v1, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-object v2, v1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->canReturnConnection(Lorg/glassfish/grizzly/Connection;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    move-result-object v2

    iget-object v3, v1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-virtual {v2, v3, v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->returnConnection(Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/Connection;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1384
    :cond_0
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$900()Ljava/io/IOException;

    move-result-object v2

    if-nez v2, :cond_1

    .line 1385
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Maximum pooled connections exceeded"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$902(Ljava/io/IOException;)Ljava/io/IOException;

    .line 1389
    :cond_1
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$900()Ljava/io/IOException;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/glassfish/grizzly/Connection;->closeWithReason(Ljava/io/IOException;)V

    .line 1392
    :cond_2
    return-void
.end method

.method private static createWebSocketAdapter(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;
    .locals 5
    .param p0, "context"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    .line 1362
    new-instance v2, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->protocolHandler:Lorg/glassfish/grizzly/websockets/ProtocolHandler;

    const/4 v4, 0x0

    new-array v4, v4, [Lorg/glassfish/grizzly/websockets/WebSocketListener;

    invoke-direct {v2, v3, v4}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;-><init>(Lorg/glassfish/grizzly/websockets/ProtocolHandler;[Lorg/glassfish/grizzly/websockets/WebSocketListener;)V

    .line 1363
    .local v2, "ws":Lorg/glassfish/grizzly/websockets/SimpleWebSocket;
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->getAsyncHttpProviderConfig()Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-result-object v1

    .line 1364
    .local v1, "config":Lcom/ning/http/client/AsyncHttpProviderConfig;
    const/4 v0, 0x1

    .line 1365
    .local v0, "bufferFragments":Z
    instance-of v3, v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    if-eqz v3, :cond_0

    .line 1366
    check-cast v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    .end local v1    # "config":Lcom/ning/http/client/AsyncHttpProviderConfig;
    sget-object v3, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->BUFFER_WEBSOCKET_FRAGMENTS:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    invoke-virtual {v1, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->getProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 1369
    :cond_0
    new-instance v3, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    invoke-direct {v3, v2, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;-><init>(Lorg/glassfish/grizzly/websockets/SimpleWebSocket;Z)V

    return-object v3
.end method

.method private static isRedirect(I)Z
    .locals 1
    .param p0, "status"    # I

    .prologue
    .line 1403
    sget-object v0, Lorg/glassfish/grizzly/http/util/HttpStatus;->MOVED_PERMANENTLY_301:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v0, p0}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/glassfish/grizzly/http/util/HttpStatus;->FOUND_302:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v0, p0}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/glassfish/grizzly/http/util/HttpStatus;->SEE_OTHER_303:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v0, p0}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/glassfish/grizzly/http/util/HttpStatus;->TEMPORARY_REDIRECT_307:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v0, p0}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lorg/glassfish/grizzly/http/util/HttpStatus;->PERMANENT_REDIRECT_308:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v0, p0}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isRedirectAllowed(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Z
    .locals 1
    .param p0, "ctx"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    .line 1373
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-interface {v0}, Lcom/ning/http/client/Request;->getFollowRedirect()Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-interface {v0}, Lcom/ning/http/client/Request;->getFollowRedirect()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectsAllowed:Z

    goto :goto_0
.end method

.method private static newRequest(Lcom/ning/http/client/uri/Uri;Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Z)Lcom/ning/http/client/Request;
    .locals 5
    .param p0, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p1, "response"    # Lorg/glassfish/grizzly/http/HttpResponsePacket;
    .param p2, "ctx"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .param p3, "asGet"    # Z

    .prologue
    .line 1622
    new-instance v0, Lcom/ning/http/client/RequestBuilder;

    iget-object v3, p2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-direct {v0, v3}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    .line 1623
    .local v0, "builder":Lcom/ning/http/client/RequestBuilder;
    if-eqz p3, :cond_0

    .line 1624
    const-string v3, "GET"

    invoke-virtual {v0, v3}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 1626
    :cond_0
    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/ning/http/client/RequestBuilder;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 1627
    invoke-virtual {v0}, Lcom/ning/http/client/RequestBuilder;->resetQuery()V

    .line 1629
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getHeaders()Lorg/glassfish/grizzly/http/util/MimeHeaders;

    move-result-object v3

    sget-object v4, Lorg/glassfish/grizzly/http/util/Header;->Cookie:Lorg/glassfish/grizzly/http/util/Header;

    invoke-virtual {v3, v4}, Lorg/glassfish/grizzly/http/util/MimeHeaders;->values(Lorg/glassfish/grizzly/http/util/Header;)Ljava/lang/Iterable;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1630
    .local v1, "cookieStr":Ljava/lang/String;
    invoke-static {v1}, Lcom/ning/http/client/cookie/CookieDecoder;->decode(Ljava/lang/String;)Lcom/ning/http/client/cookie/Cookie;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/ning/http/client/RequestBuilder;->addOrReplaceCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilder;

    goto :goto_0

    .line 1632
    .end local v1    # "cookieStr":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v3

    return-object v3
.end method

.method private static redirectCountExceeded(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Z
    .locals 2
    .param p0, "context"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    .line 1396
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->maxRedirectCount:I

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public exceptionOccurred(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 1020
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 1022
    return-void
.end method

.method public handleEvent(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/filterchain/FilterChainEvent;)Lorg/glassfish/grizzly/filterchain/NextAction;
    .locals 4
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "event"    # Lorg/glassfish/grizzly/filterchain/FilterChainEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1001
    invoke-interface {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainEvent;->type()Ljava/lang/Object;

    move-result-object v2

    const-class v3, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;

    if-ne v2, v3, :cond_0

    move-object v0, p2

    .line 1006
    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;

    .line 1007
    .local v0, "closeEvent":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;
    invoke-virtual {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;->getHttpTxContext()Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v2

    iget-object v1, v2, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->responsePacket:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .line 1008
    .local v1, "response":Lorg/glassfish/grizzly/http/HttpResponsePacket;
    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getProcessingState()Lorg/glassfish/grizzly/http/ProcessingState;

    move-result-object v2

    invoke-virtual {v2}, Lorg/glassfish/grizzly/http/ProcessingState;->getHttpContext()Lorg/glassfish/grizzly/http/HttpContext;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/glassfish/grizzly/http/HttpContext;->attach(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Lorg/glassfish/grizzly/http/HttpContext;

    .line 1009
    invoke-virtual {p0, v1, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->onHttpPacketParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z

    .line 1011
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getStopAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v2

    .line 1014
    .end local v0    # "closeEvent":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;
    .end local v1    # "response":Lorg/glassfish/grizzly/http/HttpResponsePacket;
    :goto_0
    return-object v2

    :cond_0
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getInvokeAction()Lorg/glassfish/grizzly/filterchain/NextAction;

    move-result-object v2

    goto :goto_0
.end method

.method protected onHttpContentEncoded(Lorg/glassfish/grizzly/http/HttpContent;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V
    .locals 10
    .param p1, "content"    # Lorg/glassfish/grizzly/http/HttpContent;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    .line 1056
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    .line 1058
    .local v0, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-object v8, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 1059
    .local v8, "handler":Lcom/ning/http/client/AsyncHandler;
    instance-of v1, v8, Lcom/ning/http/client/listener/TransferCompletionHandler;

    if-eqz v1, :cond_0

    .line 1060
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpContent;->getContent()Lorg/glassfish/grizzly/Buffer;

    move-result-object v1

    invoke-interface {v1}, Lorg/glassfish/grizzly/Buffer;->remaining()I

    move-result v9

    .line 1061
    .local v9, "written":I
    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->totalBodyWritten:Ljava/util/concurrent/atomic/AtomicLong;

    int-to-long v2, v9

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v4

    .local v4, "total":J
    move-object v1, v8

    .line 1062
    check-cast v1, Lcom/ning/http/client/listener/TransferCompletionHandler;

    int-to-long v2, v9

    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpContent;->getHttpHeader()Lorg/glassfish/grizzly/http/HttpHeader;

    move-result-object v6

    invoke-virtual {v6}, Lorg/glassfish/grizzly/http/HttpHeader;->getContentLength()J

    move-result-wide v6

    invoke-virtual/range {v1 .. v7}, Lcom/ning/http/client/listener/TransferCompletionHandler;->onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;

    .line 1067
    .end local v4    # "total":J
    .end local v9    # "written":I
    :cond_0
    return-void
.end method

.method protected onHttpContentError(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "httpHeader"    # Lorg/glassfish/grizzly/http/HttpHeader;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p3, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1172
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    .line 1173
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 1174
    return-void
.end method

.method protected onHttpContentParsed(Lorg/glassfish/grizzly/http/HttpContent;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V
    .locals 5
    .param p1, "content"    # Lorg/glassfish/grizzly/http/HttpContent;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    .line 1029
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v3

    invoke-static {v3}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    .line 1031
    .local v0, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-object v2, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 1032
    .local v2, "handler":Lcom/ning/http/client/AsyncHandler;
    if-eqz v2, :cond_0

    iget-object v3, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    sget-object v4, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    if-eq v3, v4, :cond_0

    .line 1034
    :try_start_0
    new-instance v3, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;

    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;-><init>(Lorg/glassfish/grizzly/http/HttpContent;Lorg/glassfish/grizzly/Connection;)V

    invoke-interface {v2, v3}, Lcom/ning/http/client/AsyncHandler;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v3

    iput-object v3, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1042
    :cond_0
    :goto_0
    return-void

    .line 1037
    :catch_0
    move-exception v1

    .line 1038
    .local v1, "e":Ljava/lang/Exception;
    invoke-interface {v2, v1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onHttpHeaderError(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "httpHeader"    # Lorg/glassfish/grizzly/http/HttpHeader;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p3, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1163
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    .line 1164
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 1165
    return-void
.end method

.method protected onHttpHeaderParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/Buffer;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z
    .locals 4
    .param p1, "httpHeader"    # Lorg/glassfish/grizzly/http/HttpHeader;
    .param p2, "buffer"    # Lorg/glassfish/grizzly/Buffer;
    .param p3, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    const/4 v3, 0x0

    .line 1296
    invoke-super {p0, p1, p2, p3}, Lorg/glassfish/grizzly/http/HttpClientFilter;->onHttpHeaderParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/Buffer;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z

    move-object v1, p1

    .line 1298
    check-cast v1, Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getRequest()Lorg/glassfish/grizzly/http/HttpRequestPacket;

    move-result-object v0

    .line 1299
    .local v0, "request":Lorg/glassfish/grizzly/http/HttpRequestPacket;
    sget-object v1, Lorg/glassfish/grizzly/http/Method;->CONNECT:Lorg/glassfish/grizzly/http/Method;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getMethod()Lorg/glassfish/grizzly/http/Method;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1303
    invoke-virtual {p1, v3}, Lorg/glassfish/grizzly/http/HttpHeader;->setExpectContent(Z)V

    .line 1306
    :cond_0
    return v3
.end method

.method protected onHttpHeadersEncoded(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V
    .locals 3
    .param p1, "httpHeader"    # Lorg/glassfish/grizzly/http/HttpHeader;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    .line 1046
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    .line 1048
    .local v0, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 1049
    .local v1, "handler":Lcom/ning/http/client/AsyncHandler;
    instance-of v2, v1, Lcom/ning/http/client/listener/TransferCompletionHandler;

    if-eqz v2, :cond_0

    .line 1050
    check-cast v1, Lcom/ning/http/client/listener/TransferCompletionHandler;

    .end local v1    # "handler":Lcom/ning/http/client/AsyncHandler;
    invoke-virtual {v1}, Lcom/ning/http/client/listener/TransferCompletionHandler;->onHeaderWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;

    .line 1052
    :cond_0
    return-void
.end method

.method protected onHttpHeadersParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V
    .locals 24
    .param p1, "httpHeader"    # Lorg/glassfish/grizzly/http/HttpHeader;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    .line 1181
    invoke-super/range {p0 .. p2}, Lorg/glassfish/grizzly/http/HttpClientFilter;->onHttpHeadersParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V

    .line 1182
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$100()Lorg/slf4j/Logger;

    move-result-object v2

    const-string v6, "RESPONSE: {}"

    move-object/from16 v0, p1

    invoke-interface {v2, v6, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1183
    invoke-virtual/range {p2 .. p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v8

    .line 1186
    .local v8, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    sget-object v2, Lorg/glassfish/grizzly/http/util/Header;->Connection:Lorg/glassfish/grizzly/http/util/Header;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/glassfish/grizzly/http/HttpHeader;->containsHeader(Lorg/glassfish/grizzly/http/util/Header;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1187
    const-string v2, "close"

    sget-object v6, Lorg/glassfish/grizzly/http/util/Header;->Connection:Lorg/glassfish/grizzly/http/util/Header;

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/glassfish/grizzly/http/HttpHeader;->getHeader(Lorg/glassfish/grizzly/http/util/Header;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1188
    invoke-virtual/range {p2 .. p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->markConnectionAsDoNotCache(Lorg/glassfish/grizzly/Connection;)V

    .line 1191
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lorg/glassfish/grizzly/http/HttpHeader;->isSkipRemainder()Z

    move-result v2

    if-nez v2, :cond_1

    iget-boolean v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->establishingTunnel:Z

    if-eqz v2, :cond_2

    .line 1291
    :cond_1
    :goto_0
    return-void

    .line 1195
    :cond_2
    iget-object v13, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 1196
    .local v13, "handler":Lcom/ning/http/client/AsyncHandler;
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getResponseFilters()Ljava/util/List;

    move-result-object v12

    .line 1197
    .local v12, "filters":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/filter/ResponseFilter;>;"
    new-instance v18, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;

    move-object/from16 v2, p1

    check-cast v2, Lorg/glassfish/grizzly/http/HttpResponsePacket;

    move-object/from16 v0, v18

    invoke-direct {v0, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;-><init>(Lorg/glassfish/grizzly/http/HttpResponsePacket;)V

    .line 1198
    .local v18, "responseHeaders":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseHeaders;
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1199
    new-instance v2, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct {v2}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>()V

    invoke-virtual {v2, v13}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v2

    iget-object v6, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-virtual {v2, v6}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseHeaders(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v2

    iget-object v6, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->responseStatus:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;

    invoke-virtual {v2, v6}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->responseStatus(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;

    move-result-object v11

    .line 1204
    .local v11, "fc":Lcom/ning/http/client/filter/FilterContext;
    :try_start_0
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/ning/http/client/filter/ResponseFilter;

    .line 1205
    .local v10, "f":Lcom/ning/http/client/filter/ResponseFilter;
    invoke-interface {v10, v11}, Lcom/ning/http/client/filter/ResponseFilter;->filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    .line 1206
    goto :goto_1

    .line 1207
    .end local v10    # "f":Lcom/ning/http/client/filter/ResponseFilter;
    .end local v14    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v9

    .line 1208
    .local v9, "e":Ljava/lang/Exception;
    invoke-virtual {v8, v9}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 1210
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_3
    invoke-virtual {v11}, Lcom/ning/http/client/filter/FilterContext;->replayRequest()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1211
    const/4 v2, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    .line 1212
    invoke-virtual {v11}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v4

    .line 1213
    .local v4, "newRequest":Lcom/ning/http/client/Request;
    invoke-virtual {v11}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v5

    .line 1215
    .local v5, "newHandler":Lcom/ning/http/client/AsyncHandler;
    :try_start_1
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    move-result-object v16

    .line 1217
    .local v16, "m":Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    move-object/from16 v0, v16

    invoke-virtual {v0, v4, v2}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->obtainConnection(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/Connection;

    move-result-object v3

    .line 1220
    .local v3, "c":Lorg/glassfish/grizzly/Connection;
    invoke-virtual {v8, v3}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->cloneAndStartTransactionFor(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v17

    .line 1222
    .local v17, "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    const/4 v2, 0x0

    iput-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 1224
    :try_start_2
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v6, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->execute(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 1229
    :catch_1
    move-exception v15

    .line 1230
    .local v15, "ioe":Ljava/io/IOException;
    :try_start_3
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 1232
    .end local v3    # "c":Lorg/glassfish/grizzly/Connection;
    .end local v15    # "ioe":Ljava/io/IOException;
    .end local v16    # "m":Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    .end local v17    # "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    :catch_2
    move-exception v9

    .line 1233
    .restart local v9    # "e":Ljava/lang/Exception;
    invoke-virtual {v8, v9}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1238
    .end local v4    # "newRequest":Lcom/ning/http/client/Request;
    .end local v5    # "newHandler":Lcom/ning/http/client/AsyncHandler;
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v11    # "fc":Lcom/ning/http/client/filter/FilterContext;
    :cond_4
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    if-eqz v2, :cond_5

    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    sget-object v6, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    if-ne v2, v6, :cond_5

    .line 1239
    iget-object v6, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    move-object/from16 v2, p1

    check-cast v2, Lorg/glassfish/grizzly/http/HttpResponsePacket;

    move-object/from16 v0, p2

    invoke-interface {v6, v2, v8, v0}, Lcom/ning/http/client/providers/grizzly/StatusHandler;->handleStatus(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z

    move-result v19

    .line 1242
    .local v19, "result":Z
    if-nez v19, :cond_5

    .line 1243
    const/4 v2, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    goto/16 :goto_0

    .line 1247
    .end local v19    # "result":Z
    :cond_5
    iget-boolean v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isWSRequest:Z

    if-eqz v2, :cond_8

    .line 1249
    :try_start_4
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->protocolHandler:Lorg/glassfish/grizzly/websockets/ProtocolHandler;

    invoke-virtual/range {p2 .. p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/glassfish/grizzly/websockets/ProtocolHandler;->setConnection(Lorg/glassfish/grizzly/Connection;)V

    .line 1250
    invoke-static {v8}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->createWebSocketAdapter(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    move-result-object v20

    .line 1251
    .local v20, "webSocketAdapter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;
    move-object/from16 v0, v20

    iput-object v0, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    .line 1252
    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    move-object/from16 v21, v0

    .line 1253
    .local v21, "ws":Lorg/glassfish/grizzly/websockets/SimpleWebSocket;
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    sget-object v6, Lcom/ning/http/client/AsyncHandler$STATE;->UPGRADE:Lcom/ning/http/client/AsyncHandler$STATE;

    if-ne v2, v6, :cond_7

    .line 1254
    const/4 v2, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/glassfish/grizzly/http/HttpHeader;->setChunked(Z)V

    .line 1255
    invoke-virtual/range {v21 .. v21}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->onConnect()V

    .line 1256
    invoke-virtual/range {p2 .. p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    iget-object v6, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->protocolHandler:Lorg/glassfish/grizzly/websockets/ProtocolHandler;

    move-object/from16 v0, v21

    invoke-static {v2, v6, v0}, Lorg/glassfish/grizzly/websockets/WebSocketHolder;->set(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/websockets/ProtocolHandler;Lorg/glassfish/grizzly/websockets/WebSocket;)Lorg/glassfish/grizzly/websockets/WebSocketHolder;

    .line 1259
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    check-cast v2, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    iget-object v6, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    invoke-virtual {v2, v6}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onSuccess(Lcom/ning/http/client/ws/WebSocket;)V

    .line 1260
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getWebSocketTimeout()I

    move-result v22

    .line 1261
    .local v22, "wsTimeout":I
    invoke-virtual/range {p2 .. p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    if-gtz v22, :cond_6

    sget-object v6, Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;->FOREVER:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    :goto_2
    sget-object v23, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v23

    invoke-static {v2, v6, v7, v0}, Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;->setCustomTimeout(Lorg/glassfish/grizzly/Connection;JLjava/util/concurrent/TimeUnit;)V

    .line 1266
    invoke-interface {v13}, Lcom/ning/http/client/AsyncHandler;->onCompleted()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v8, v2}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->done(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    .line 1275
    .end local v20    # "webSocketAdapter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;
    .end local v21    # "ws":Lorg/glassfish/grizzly/websockets/SimpleWebSocket;
    .end local v22    # "wsTimeout":I
    :catch_3
    move-exception v9

    .line 1276
    .local v9, "e":Ljava/lang/Throwable;
    const/4 v2, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    .line 1277
    invoke-virtual {v8, v9}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1261
    .end local v9    # "e":Ljava/lang/Throwable;
    .restart local v20    # "webSocketAdapter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;
    .restart local v21    # "ws":Lorg/glassfish/grizzly/websockets/SimpleWebSocket;
    .restart local v22    # "wsTimeout":I
    :cond_6
    move/from16 v0, v22

    int-to-long v6, v0

    goto :goto_2

    .line 1268
    .end local v22    # "wsTimeout":I
    :cond_7
    const/4 v2, 0x1

    :try_start_5
    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    .line 1269
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    check-cast v2, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    iget-object v6, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    const/16 v7, 0x3ea

    const-string v23, "WebSocket protocol error: unexpected HTTP response status during handshake."

    move-object/from16 v0, v23

    invoke-virtual {v2, v6, v7, v0}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onClose(Lcom/ning/http/client/ws/WebSocket;ILjava/lang/String;)V

    .line 1273
    invoke-virtual {v8}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->done()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_0

    .line 1280
    .end local v20    # "webSocketAdapter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;
    .end local v21    # "ws":Lorg/glassfish/grizzly/websockets/SimpleWebSocket;
    :cond_8
    iget-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    sget-object v6, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    if-eq v2, v6, :cond_1

    .line 1282
    :try_start_6
    move-object/from16 v0, v18

    invoke-interface {v13, v0}, Lcom/ning/http/client/AsyncHandler;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v2

    iput-object v2, v8, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    goto/16 :goto_0

    .line 1284
    :catch_4
    move-exception v9

    .line 1285
    .local v9, "e":Ljava/lang/Exception;
    const/4 v2, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    .line 1286
    invoke-virtual {v8, v9}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto/16 :goto_0
.end method

.method protected onHttpPacketParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z
    .locals 10
    .param p1, "httpHeader"    # Lorg/glassfish/grizzly/http/HttpHeader;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    const/4 v0, 0x0

    .line 1314
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpHeader;->isSkipRemainder()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1315
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->clearResponse(Lorg/glassfish/grizzly/Connection;)V

    .line 1316
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {p2, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->cleanup(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V

    move v9, v0

    .line 1354
    .end local p1    # "httpHeader":Lorg/glassfish/grizzly/http/HttpHeader;
    :goto_0
    return v9

    .line 1320
    .restart local p1    # "httpHeader":Lorg/glassfish/grizzly/http/HttpHeader;
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/glassfish/grizzly/http/HttpClientFilter;->onHttpPacketParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Z

    move-result v9

    .line 1322
    .local v9, "result":Z
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v6

    .line 1324
    .local v6, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-boolean v2, v6, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->establishingTunnel:Z

    if-eqz v2, :cond_1

    sget-object v2, Lorg/glassfish/grizzly/http/util/HttpStatus;->OK_200:Lorg/glassfish/grizzly/http/util/HttpStatus;

    check-cast p1, Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .end local p1    # "httpHeader":Lorg/glassfish/grizzly/http/HttpHeader;
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getStatus()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1327
    iput-boolean v0, v6, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->establishingTunnel:Z

    .line 1328
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v1

    .line 1329
    .local v1, "c":Lorg/glassfish/grizzly/Connection;
    invoke-virtual {v6, v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->tunnelEstablished(Lorg/glassfish/grizzly/Connection;)V

    .line 1331
    :try_start_0
    iget-object v0, v6, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v2, v6, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    iget-object v3, v6, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    iget-object v4, v6, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->execute(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1337
    :catch_0
    move-exception v7

    .line 1338
    .local v7, "e":Ljava/io/IOException;
    invoke-virtual {v6, v7}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1342
    .end local v1    # "c":Lorg/glassfish/grizzly/Connection;
    .end local v7    # "e":Ljava/io/IOException;
    :cond_1
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {p2, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->cleanup(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V

    .line 1343
    iget-object v8, v6, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 1344
    .local v8, "handler":Lcom/ning/http/client/AsyncHandler;
    if-eqz v8, :cond_2

    .line 1346
    :try_start_1
    invoke-interface {v8}, Lcom/ning/http/client/AsyncHandler;->onCompleted()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->done(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 1347
    :catch_1
    move-exception v7

    .line 1348
    .local v7, "e":Ljava/lang/Throwable;
    invoke-virtual {v6, v7}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1351
    .end local v7    # "e":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {v6}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->done()V

    goto :goto_0
.end method

.method protected onInitialLineParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V
    .locals 10
    .param p1, "httpHeader"    # Lorg/glassfish/grizzly/http/HttpHeader;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 1073
    invoke-super {p0, p1, p2}, Lorg/glassfish/grizzly/http/HttpClientFilter;->onInitialLineParsed(Lorg/glassfish/grizzly/http/HttpHeader;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)V

    .line 1074
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpHeader;->isSkipRemainder()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1156
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v3, p1

    .line 1078
    check-cast v3, Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .line 1080
    .local v3, "responsePacket":Lorg/glassfish/grizzly/http/HttpResponsePacket;
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v6

    invoke-static {v6}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    .line 1082
    .local v0, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    invoke-virtual {v3}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getStatus()I

    move-result v5

    .line 1083
    .local v5, "status":I
    iget-boolean v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->establishingTunnel:Z

    if-eqz v6, :cond_2

    sget-object v6, Lorg/glassfish/grizzly/http/util/HttpStatus;->OK_200:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v6, v5}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1086
    :cond_2
    sget-object v6, Lorg/glassfish/grizzly/http/util/HttpStatus;->CONINTUE_100:Lorg/glassfish/grizzly/http/util/HttpStatus;

    invoke-virtual {v6, v5}, Lorg/glassfish/grizzly/http/util/HttpStatus;->statusMatches(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1087
    new-instance v6, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;

    invoke-direct {v6, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;-><init>(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V

    invoke-virtual {p2, v6}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->notifyUpstream(Lorg/glassfish/grizzly/filterchain/FilterChainEvent;)V

    goto :goto_0

    .line 1092
    :cond_3
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    if-eqz v6, :cond_8

    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    invoke-interface {v6, v5}, Lcom/ning/http/client/providers/grizzly/StatusHandler;->handlesStatus(I)Z

    move-result v6

    if-nez v6, :cond_8

    .line 1093
    iput-object v9, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    .line 1094
    sget-object v6, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    iput-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 1098
    :goto_1
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    sget-object v7, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    if-ne v6, v7, :cond_5

    .line 1099
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1100
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->HANDLER_MAP:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/ning/http/client/providers/grizzly/StatusHandler;

    iput-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    .line 1102
    :cond_4
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    instance-of v6, v6, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    if-eqz v6, :cond_5

    .line 1103
    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->isRedirectAllowed(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 1104
    iput-object v9, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    .line 1108
    :cond_5
    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->isRedirectAllowed(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1109
    invoke-static {v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->isRedirect(I)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 1110
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    if-nez v6, :cond_6

    .line 1111
    sget-object v6, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;->INSTANCE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter$RedirectHandler;

    iput-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    .line 1113
    :cond_6
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 1114
    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->redirectCountExceeded(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1115
    invoke-virtual {p1, v8}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    .line 1116
    new-instance v6, Lcom/ning/http/client/MaxRedirectException;

    invoke-direct {v6}, Lcom/ning/http/client/MaxRedirectException;-><init>()V

    invoke-virtual {v0, v6}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 1125
    :cond_7
    :goto_2
    new-instance v4, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;

    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-interface {v6}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v6

    iget-object v7, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v7}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v7

    invoke-direct {v4, v3, v6, v7}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;-><init>(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 1129
    .local v4, "responseStatus":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;
    iput-object v3, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->responsePacket:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .line 1130
    iput-object v4, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->responseStatus:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;

    .line 1132
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    if-nez v6, :cond_0

    .line 1135
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    sget-object v7, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    if-eq v6, v7, :cond_0

    .line 1138
    :try_start_0
    iget-object v2, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 1139
    .local v2, "handler":Lcom/ning/http/client/AsyncHandler;
    if-eqz v2, :cond_0

    .line 1140
    invoke-interface {v2, v4}, Lcom/ning/http/client/AsyncHandler;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v6

    iput-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 1141
    iget-boolean v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isWSRequest:Z

    if-eqz v6, :cond_0

    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    sget-object v7, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    if-ne v6, v7, :cond_0

    .line 1142
    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 1144
    :try_start_1
    invoke-interface {v2}, Lcom/ning/http/client/AsyncHandler;->onCompleted()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->done(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 1145
    :catch_0
    move-exception v1

    .line 1146
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_2
    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 1150
    .end local v1    # "e":Ljava/lang/Throwable;
    .end local v2    # "handler":Lcom/ning/http/client/AsyncHandler;
    :catch_1
    move-exception v1

    .line 1151
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p1, v8}, Lorg/glassfish/grizzly/http/HttpHeader;->setSkipRemainder(Z)V

    .line 1152
    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1096
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "responseStatus":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;
    :cond_8
    iput-object v9, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    goto/16 :goto_1

    .line 1119
    :cond_9
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v6

    if-lez v6, :cond_7

    .line 1120
    iget-object v6, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    goto :goto_2
.end method
