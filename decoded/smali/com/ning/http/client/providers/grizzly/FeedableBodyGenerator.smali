.class public Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/BodyGenerator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$SimpleFeeder;,
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;,
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;,
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;,
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT:I = -0x2

.field public static final UNBOUND:I = -0x1


# instance fields
.field private final EMPTY_BODY:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;

.field private asyncTransferInitiated:Z

.field private configuredMaxPendingBytes:I

.field private volatile contentBuilder:Lorg/glassfish/grizzly/http/HttpContent$Builder;

.field private volatile context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

.field private feeder:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;

.field private origMaxPendingBytes:I

.field private volatile requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const-class v0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->EMPTY_BODY:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;

    .line 77
    const/4 v0, -0x2

    iput v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->configuredMaxPendingBytes:I

    .line 618
    return-void
.end method

.method static synthetic access$100(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->flushOnSSLHandshakeComplete()V

    return-void
.end method

.method static synthetic access$200(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->feeder:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;

    return-object v0
.end method

.method static synthetic access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    return-object v0
.end method

.method static synthetic access$302(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
    .param p1, "x1"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    return-object p1
.end method

.method static synthetic access$400(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    return-object v0
.end method

.method static synthetic access$402(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
    .param p1, "x1"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    return-object p1
.end method

.method static synthetic access$500(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/http/HttpContent$Builder;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->contentBuilder:Lorg/glassfish/grizzly/http/HttpContent$Builder;

    return-object v0
.end method

.method static synthetic access$502(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/http/HttpContent$Builder;)Lorg/glassfish/grizzly/http/HttpContent$Builder;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
    .param p1, "x1"    # Lorg/glassfish/grizzly/http/HttpContent$Builder;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->contentBuilder:Lorg/glassfish/grizzly/http/HttpContent$Builder;

    return-object p1
.end method

.method static synthetic access$600(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->asyncTransferInitiated:Z

    return v0
.end method

.method static synthetic access$800(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)I
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 54
    iget v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->origMaxPendingBytes:I

    return v0
.end method

.method private flushOnSSLHandshakeComplete()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    invoke-virtual {v4}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getFilterChain()Lorg/glassfish/grizzly/filterchain/FilterChain;

    move-result-object v2

    .line 206
    .local v2, "filterChain":Lorg/glassfish/grizzly/filterchain/FilterChain;
    const-class v4, Lorg/glassfish/grizzly/ssl/SSLFilter;

    invoke-interface {v2, v4}, Lorg/glassfish/grizzly/filterchain/FilterChain;->indexOfType(Ljava/lang/Class;)I

    move-result v3

    .line 207
    .local v3, "idx":I
    sget-boolean v4, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->$assertionsDisabled:Z

    if-nez v4, :cond_0

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 208
    :cond_0
    invoke-interface {v2, v3}, Lorg/glassfish/grizzly/filterchain/FilterChain;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/glassfish/grizzly/ssl/SSLFilter;

    .line 209
    .local v1, "filter":Lorg/glassfish/grizzly/ssl/SSLFilter;
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    invoke-virtual {v4}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    .line 210
    .local v0, "c":Lorg/glassfish/grizzly/Connection;
    new-instance v4, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;

    invoke-direct {v4, p0, v0, v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$2;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/ssl/SSLFilter;)V

    invoke-virtual {v1, v4}, Lorg/glassfish/grizzly/ssl/SSLFilter;->addHandshakeListener(Lorg/glassfish/grizzly/ssl/SSLBaseFilter$HandshakeListener;)V

    .line 225
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    invoke-virtual {v4}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Lorg/glassfish/grizzly/ssl/SSLFilter;->handshake(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 226
    return-void
.end method

.method private isServiceThread()Z
    .locals 1

    .prologue
    .line 200
    invoke-static {}, Lorg/glassfish/grizzly/threadpool/Threads;->isService()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public createBody()Lcom/ning/http/client/Body;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->EMPTY_BODY:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;

    return-object v0
.end method

.method declared-synchronized initializeAsynchronousTransfer(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 4
    .param p1, "context"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p2, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->asyncTransferInitiated:Z

    if-eqz v2, :cond_0

    .line 152
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Async transfer has already been initiated."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 154
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->feeder:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;

    if-nez v2, :cond_1

    .line 155
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No feeder available to perform the transfer."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 157
    :cond_1
    sget-boolean v2, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    if-nez p1, :cond_2

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 158
    :cond_2
    sget-boolean v2, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->$assertionsDisabled:Z

    if-nez v2, :cond_3

    if-nez p2, :cond_3

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 160
    :cond_3
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .line 161
    invoke-static {p2}, Lorg/glassfish/grizzly/http/HttpContent;->builder(Lorg/glassfish/grizzly/http/HttpHeader;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->contentBuilder:Lorg/glassfish/grizzly/http/HttpContent$Builder;

    .line 162
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    .line 163
    .local v0, "c":Lorg/glassfish/grizzly/Connection;
    invoke-interface {v0}, Lorg/glassfish/grizzly/Connection;->getMaxAsyncWriteQueueSize()I

    move-result v2

    iput v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->origMaxPendingBytes:I

    .line 164
    iget v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->configuredMaxPendingBytes:I

    const/4 v3, -0x2

    if-eq v2, v3, :cond_4

    .line 165
    iget v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->configuredMaxPendingBytes:I

    invoke-interface {v0, v2}, Lorg/glassfish/grizzly/Connection;->setMaxAsyncWriteQueueSize(I)V

    .line 167
    :cond_4
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->context:Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .line 168
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->asyncTransferInitiated:Z

    .line 169
    new-instance v1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;

    invoke-direct {v1, p0, p2, p1, v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/http/HttpRequestPacket;Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/Connection;)V

    .line 188
    .local v1, "r":Ljava/lang/Runnable;
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->isServiceThread()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 189
    invoke-interface {v0}, Lorg/glassfish/grizzly/Connection;->getTransport()Lorg/glassfish/grizzly/Transport;

    move-result-object v2

    invoke-interface {v2}, Lorg/glassfish/grizzly/Transport;->getWorkerThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 193
    :goto_0
    monitor-exit p0

    return-void

    .line 191
    :cond_5
    :try_start_2
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized setFeeder(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;)V
    .locals 2
    .param p1, "feeder"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;

    .prologue
    .line 134
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->asyncTransferInitiated:Z

    if-eqz v0, :cond_0

    .line 135
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to set Feeder after async data transfer has been initiated."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 137
    :cond_0
    if-nez p1, :cond_1

    .line 138
    :try_start_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Feeder argument cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_1
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->feeder:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setMaxPendingBytes(I)V
    .locals 3
    .param p1, "maxPendingBytes"    # I

    .prologue
    .line 111
    monitor-enter p0

    const/4 v0, -0x2

    if-ge p1, v0, :cond_0

    .line 112
    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid maxPendingBytes value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 114
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->asyncTransferInitiated:Z

    if-eqz v0, :cond_1

    .line 115
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to set max pending bytes after async data transfer has been initiated."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_1
    iput p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->configuredMaxPendingBytes:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 118
    monitor-exit p0

    return-void
.end method
