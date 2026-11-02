.class final Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
.super Ljava/lang/Object;
.source "HttpTransactionContext.java"


# static fields
.field private static final REQUEST_STATE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/attributes/Attribute",
            "<",
            "Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field bodyHandler:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

.field private final connection:Lorg/glassfish/grizzly/Connection;

.field currentState:Lcom/ning/http/client/AsyncHandler$STATE;

.field establishingTunnel:Z

.field future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

.field final handler:Lcom/ning/http/client/AsyncHandler;

.field handshake:Lorg/glassfish/grizzly/websockets/HandShake;

.field invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

.field isWSRequest:Z

.field lastRedirectURI:Ljava/lang/String;

.field private final listener:Lorg/glassfish/grizzly/CloseListener;

.field final maxRedirectCount:I

.field protocolHandler:Lorg/glassfish/grizzly/websockets/ProtocolHandler;

.field final provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

.field final redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field final redirectsAllowed:Z

.field final request:Lcom/ning/http/client/Request;

.field requestUri:Lcom/ning/http/client/uri/Uri;

.field responsePacket:Lorg/glassfish/grizzly/http/HttpResponsePacket;

.field responseStatus:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;

.field statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

.field totalBodyWritten:Ljava/util/concurrent/atomic/AtomicLong;

.field webSocket:Lcom/ning/http/client/ws/WebSocket;

.field wsRequestURI:Lcom/ning/http/client/uri/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 39
    sget-object v0, Lorg/glassfish/grizzly/Grizzly;->DEFAULT_ATTRIBUTE_BUILDER:Lorg/glassfish/grizzly/attributes/AttributeBuilder;

    const-class v1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/attributes/AttributeBuilder;->createAttribute(Ljava/lang/String;)Lorg/glassfish/grizzly/attributes/Attribute;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->REQUEST_STATE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    return-void
.end method

.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)V
    .locals 2
    .param p1, "provider"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "connection"    # Lorg/glassfish/grizzly/Connection;
    .param p3, "future"    # Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
    .param p4, "request"    # Lcom/ning/http/client/Request;
    .param p5, "handler"    # Lcom/ning/http/client/AsyncHandler;

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 55
    sget-object v0, Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;->CONTINUE:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 63
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->totalBodyWritten:Ljava/util/concurrent/atomic/AtomicLong;

    .line 71
    new-instance v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;

    invoke-direct {v0, p0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;-><init>(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->listener:Lorg/glassfish/grizzly/CloseListener;

    .line 123
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    .line 124
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->connection:Lorg/glassfish/grizzly/Connection;

    .line 125
    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    .line 126
    iput-object p4, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    .line 127
    iput-object p5, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 128
    invoke-virtual {p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->getClientConfig()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClientConfig;->isFollowRedirect()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectsAllowed:Z

    .line 129
    invoke-virtual {p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->getClientConfig()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxRedirects()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->maxRedirectCount:I

    .line 130
    invoke-interface {p4}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->requestUri:Lcom/ning/http/client/uri/Uri;

    .line 131
    return-void
.end method

.method static synthetic access$000(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Lorg/glassfish/grizzly/Connection;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->connection:Lorg/glassfish/grizzly/Connection;

    return-object v0
.end method

.method static cleanupTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .locals 2
    .param p0, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 96
    sget-object v1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->REQUEST_STATE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v1, p0}, Lorg/glassfish/grizzly/attributes/Attribute;->remove(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .line 97
    .local v0, "httpTxContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->listener:Lorg/glassfish/grizzly/CloseListener;

    invoke-interface {p0, v1}, Lorg/glassfish/grizzly/Connection;->removeCloseListener(Lorg/glassfish/grizzly/CloseListener;)Z

    .line 98
    return-object v0
.end method

.method static currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .locals 1
    .param p0, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 102
    sget-object v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->REQUEST_STATE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v0, p0}, Lorg/glassfish/grizzly/attributes/Attribute;->get(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    return-object v0
.end method

.method private static set(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V
    .locals 1
    .param p0, "c"    # Lorg/glassfish/grizzly/Connection;
    .param p1, "httpTxContext"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .prologue
    .line 91
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->listener:Lorg/glassfish/grizzly/CloseListener;

    invoke-interface {p0, v0}, Lorg/glassfish/grizzly/Connection;->addCloseListener(Lorg/glassfish/grizzly/CloseListener;)V

    .line 92
    sget-object v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->REQUEST_STATE_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v0, p0, p1}, Lorg/glassfish/grizzly/attributes/Attribute;->set(Lorg/glassfish/grizzly/attributes/AttributeStorage;Ljava/lang/Object;)V

    .line 93
    return-void
.end method

.method public static startTransaction(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .locals 6
    .param p0, "connection"    # Lorg/glassfish/grizzly/Connection;
    .param p1, "provider"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "future"    # Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
    .param p3, "request"    # Lcom/ning/http/client/Request;
    .param p4, "handler"    # Lcom/ning/http/client/AsyncHandler;

    .prologue
    .line 107
    new-instance v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-object v1, p1

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)V

    .line 111
    .local v0, "ctx":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    invoke-static {p0, v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->set(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V

    .line 113
    return-object v0
.end method


# virtual methods
.method abort(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->abort(Ljava/lang/Throwable;)V

    .line 174
    :cond_0
    return-void
.end method

.method cloneAndStartTransactionFor(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .locals 5
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 137
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    invoke-static {p1, v1, v2, v3, v4}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->startTransaction(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    .line 139
    .local v0, "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 140
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->bodyHandler:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->bodyHandler:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    .line 141
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 142
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    .line 143
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->lastRedirectURI:Ljava/lang/String;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->lastRedirectURI:Ljava/lang/String;

    .line 144
    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 145
    return-object v0
.end method

.method cloneAndStartTransactionFor(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .locals 4
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;
    .param p2, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 151
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    invoke-static {p1, v1, v2, p2, v3}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->startTransaction(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    .line 153
    .local v0, "newContext":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->invocationStatus:Lcom/ning/http/client/providers/grizzly/StatusHandler$InvocationStatus;

    .line 154
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->bodyHandler:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->bodyHandler:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    .line 155
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentState:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 156
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->statusHandler:Lcom/ning/http/client/providers/grizzly/StatusHandler;

    .line 157
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->lastRedirectURI:Ljava/lang/String;

    iput-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->lastRedirectURI:Ljava/lang/String;

    .line 158
    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 159
    return-object v0
.end method

.method done()V
    .locals 1

    .prologue
    .line 177
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->done(Ljava/lang/Object;)V

    .line 178
    return-void
.end method

.method done(Ljava/lang/Object;)V
    .locals 1
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    if-eqz v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->done(Ljava/lang/Object;)V

    .line 185
    :cond_0
    return-void
.end method

.method isGracefullyFinishResponseOnClose()Z
    .locals 6

    .prologue
    .line 163
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->responsePacket:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .line 164
    .local v0, "response":Lorg/glassfish/grizzly/http/HttpResponsePacket;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getProcessingState()Lorg/glassfish/grizzly/http/ProcessingState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/ProcessingState;->isKeepAlive()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->isChunked()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getContentLength()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method isTunnelEstablished(Lorg/glassfish/grizzly/Connection;)Z
    .locals 2
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 188
    invoke-interface {p1}, Lorg/glassfish/grizzly/Connection;->getAttributes()Lorg/glassfish/grizzly/attributes/AttributeHolder;

    move-result-object v0

    const-string v1, "tunnel-established"

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/attributes/AttributeHolder;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method tunnelEstablished(Lorg/glassfish/grizzly/Connection;)V
    .locals 3
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 192
    invoke-interface {p1}, Lorg/glassfish/grizzly/Connection;->getAttributes()Lorg/glassfish/grizzly/attributes/AttributeHolder;

    move-result-object v0

    const-string v1, "tunnel-established"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Lorg/glassfish/grizzly/attributes/AttributeHolder;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 193
    return-void
.end method
