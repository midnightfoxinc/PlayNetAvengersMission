.class public Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;
.super Ljava/lang/Object;
.source "GrizzlyConnectionPool.java"

# interfaces
.implements Lcom/ning/http/client/providers/grizzly/ConnectionPool;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/slf4j/Logger;


# instance fields
.field private final cacheSSLConnections:Z

.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;",
            ">;"
        }
    .end annotation
.end field

.field private final delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

.field private final listener:Lorg/glassfish/grizzly/CloseListener;

.field private final maxConnectionLifeTime:J

.field private final maxConnections:I

.field private final maxConnectionsPerHost:I

.field private final ownsDelayedExecutor:Z

.field private final timeout:J

.field private final totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final unlimitedConnections:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 4
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;

    .line 55
    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 56
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 67
    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;

    invoke-direct {v2, p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)V

    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->listener:Lorg/glassfish/grizzly/CloseListener;

    .line 114
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAllowPoolingSslConnections()Z

    move-result v2

    iput-boolean v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->cacheSSLConnections:Z

    .line 115
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getPooledConnectionIdleTimeout()I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->timeout:J

    .line 116
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getConnectionTTL()I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionLifeTime:J

    .line 117
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnectionsPerHost()I

    move-result v2

    iput v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionsPerHost:I

    .line 118
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v2

    iput v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnections:I

    .line 119
    iget v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnections:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    move v0, v1

    :cond_0
    iput-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->unlimitedConnections:Z

    .line 120
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-direct {v0, v2, p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;-><init>(Ljava/util/concurrent/ExecutorService;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .line 121
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$200(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)V

    .line 122
    iput-boolean v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->ownsDelayedExecutor:Z

    .line 123
    return-void
.end method

.method public constructor <init>(ZIIIILcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)V
    .locals 6
    .param p1, "cacheSSLConnections"    # Z
    .param p2, "timeout"    # I
    .param p3, "maxConnectionLifeTime"    # I
    .param p4, "maxConnectionsPerHost"    # I
    .param p5, "maxConnections"    # I
    .param p6, "delayedExecutor"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;

    .line 55
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 56
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 67
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;

    invoke-direct {v0, p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->listener:Lorg/glassfish/grizzly/CloseListener;

    .line 92
    iput-boolean p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->cacheSSLConnections:Z

    .line 93
    int-to-long v4, p2

    iput-wide v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->timeout:J

    .line 94
    int-to-long v4, p3

    iput-wide v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionLifeTime:J

    .line 95
    iput p4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionsPerHost:I

    .line 96
    iput p5, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnections:I

    .line 97
    const/4 v0, -0x1

    if-ne p5, v0, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->unlimitedConnections:Z

    .line 98
    if-eqz p6, :cond_2

    .line 99
    iput-object p6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .line 100
    iput-boolean v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->ownsDelayedExecutor:Z

    .line 107
    :goto_1
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$100(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$200(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)V

    .line 110
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 97
    goto :goto_0

    .line 102
    :cond_2
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-direct {v0, v2, p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;-><init>(Ljava/util/concurrent/ExecutorService;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    .line 105
    iput-boolean v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->ownsDelayedExecutor:Z

    goto :goto_1
.end method

.method static synthetic access$000()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    return-object v0
.end method

.method static synthetic access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method


# virtual methods
.method public canCacheConnection()Z
    .locals 2

    .prologue
    .line 232
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->unlimitedConnections:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnections:I

    if-ge v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public destroy()V
    .locals 4

    .prologue
    .line 241
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 254
    :cond_0
    :goto_0
    return-void

    .line 245
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 246
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->destroy()V

    goto :goto_1

    .line 248
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;>;"
    :cond_2
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 249
    iget-boolean v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->ownsDelayedExecutor:Z

    if-eqz v2, :cond_0

    .line 250
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$400(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)V

    .line 251
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$500(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    goto :goto_0
.end method

.method public offer(Ljava/lang/String;Lorg/glassfish/grizzly/Connection;)Z
    .locals 10
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 131
    invoke-static {p1}, Lcom/ning/http/client/providers/grizzly/Utils;->isSecure(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->cacheSSLConnections:Z

    if-nez v4, :cond_0

    .line 132
    const/4 v4, 0x0

    .line 166
    :goto_0
    return v4

    .line 135
    :cond_0
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    .line 136
    .local v0, "conQueue":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    if-nez v0, :cond_2

    .line 137
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    invoke-interface {v4}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 138
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    const-string v5, "Creating new Connection queue for uri [{}] and connection [{}]"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    aput-object p2, v6, v7

    invoke-interface {v4, v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 141
    :cond_1
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->delayedExecutor:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->timeout:J

    iget-wide v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionLifeTime:J

    invoke-static {v4, v6, v7, v8, v9}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$300(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;JJ)Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    move-result-object v1

    .line 143
    .local v1, "newPool":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "conQueue":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    .line 144
    .restart local v0    # "conQueue":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    if-nez v0, :cond_2

    .line 145
    move-object v0, v1

    .line 149
    .end local v1    # "newPool":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    :cond_2
    invoke-virtual {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->size()I

    move-result v2

    .line 150
    .local v2, "size":I
    iget v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionsPerHost:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_3

    iget v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionsPerHost:I

    if-ge v2, v4, :cond_5

    .line 151
    :cond_3
    invoke-virtual {v0, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->offer(Lorg/glassfish/grizzly/Connection;)V

    .line 152
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->listener:Lorg/glassfish/grizzly/CloseListener;

    invoke-interface {p2, v4}, Lorg/glassfish/grizzly/Connection;->addCloseListener(Lorg/glassfish/grizzly/CloseListener;)V

    .line 153
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v3

    .line 154
    .local v3, "total":I
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    invoke-interface {v4}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 155
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    const-string v5, "[offer] Pooling connection [{}] for uri [{}].  Current size (for host; before pooling): [{}].  Max size (for host): [{}].  Total number of cached connections: [{}]."

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p2, v6, v7

    const/4 v7, 0x1

    aput-object p1, v6, v7

    const/4 v7, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    iget v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionsPerHost:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 158
    :cond_4
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 160
    .end local v3    # "total":I
    :cond_5
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    invoke-interface {v4}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 161
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    const-string v5, "[offer] Unable to pool connection [{}] for uri [{}]. Current size (for host): [{}].  Max size (for host): [{}].  Total number of cached connections: [{}]."

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p2, v6, v7

    const/4 v7, 0x1

    aput-object p1, v6, v7

    const/4 v7, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    iget v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->maxConnectionsPerHost:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x4

    iget-object v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 166
    :cond_6
    const/4 v4, 0x0

    goto/16 :goto_0
.end method

.method public poll(Ljava/lang/String;)Lorg/glassfish/grizzly/Connection;
    .locals 8
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 172
    iget-boolean v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->cacheSSLConnections:Z

    if-nez v3, :cond_1

    invoke-static {p1}, Lcom/ning/http/client/providers/grizzly/Utils;->isSecure(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 173
    const/4 v1, 0x0

    .line 206
    :cond_0
    :goto_0
    return-object v1

    .line 176
    :cond_1
    const/4 v1, 0x0

    .line 177
    .local v1, "connection":Lorg/glassfish/grizzly/Connection;
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    .line 178
    .local v0, "conQueue":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    if-eqz v0, :cond_5

    .line 179
    const/4 v2, 0x0

    .line 180
    .local v2, "poolEmpty":Z
    :cond_2
    :goto_1
    if-nez v2, :cond_6

    if-nez v1, :cond_6

    .line 181
    invoke-virtual {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 182
    invoke-virtual {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->poll()Lorg/glassfish/grizzly/Connection;

    move-result-object v1

    .line 185
    :cond_3
    if-nez v1, :cond_4

    .line 186
    const/4 v2, 0x1

    goto :goto_1

    .line 187
    :cond_4
    invoke-interface {v1}, Lorg/glassfish/grizzly/Connection;->isOpen()Z

    move-result v3

    if-nez v3, :cond_2

    .line 188
    invoke-virtual {p0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->removeAll(Lorg/glassfish/grizzly/Connection;)Z

    .line 189
    const/4 v1, 0x0

    goto :goto_1

    .line 193
    .end local v2    # "poolEmpty":Z
    :cond_5
    sget-object v3, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    invoke-interface {v3}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 194
    sget-object v3, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    const-string v4, "[poll] No existing queue for uri [{}]."

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-interface {v3, v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 198
    :cond_6
    if-eqz v1, :cond_0

    .line 199
    sget-object v3, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    invoke-interface {v3}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 200
    sget-object v3, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->LOG:Lorg/slf4j/Logger;

    const-string v4, "[poll] Found pooled connection [{}] for uri [{}]."

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    aput-object p1, v5, v7

    invoke-interface {v3, v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 203
    :cond_7
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 204
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->listener:Lorg/glassfish/grizzly/CloseListener;

    invoke-interface {v1, v3}, Lorg/glassfish/grizzly/Connection;->removeCloseListener(Lorg/glassfish/grizzly/CloseListener;)Z

    goto :goto_0
.end method

.method public removeAll(Lorg/glassfish/grizzly/Connection;)Z
    .locals 5
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 213
    if-eqz p1, :cond_0

    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 214
    :cond_0
    const/4 v2, 0x0

    .line 225
    :cond_1
    :goto_0
    return v2

    .line 216
    :cond_2
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->listener:Lorg/glassfish/grizzly/CloseListener;

    invoke-interface {p1, v4}, Lorg/glassfish/grizzly/Connection;->removeCloseListener(Lorg/glassfish/grizzly/CloseListener;)Z

    .line 217
    const/4 v2, 0x0

    .line 218
    .local v2, "isRemoved":Z
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->connectionsPool:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 219
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    invoke-virtual {v4, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->remove(Lorg/glassfish/grizzly/Connection;)Z

    move-result v3

    .line 220
    .local v3, "removed":Z
    or-int/2addr v2, v3

    .line 221
    goto :goto_1

    .line 222
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;>;"
    .end local v3    # "removed":Z
    :cond_3
    if-eqz v2, :cond_1

    .line 223
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->totalCachedConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    goto :goto_0
.end method
