.class public Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;
.super Lorg/jboss/netty/channel/group/DefaultChannelGroup;
.source "CleanupChannelGroup.java"


# static fields
.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-class v0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;-><init>()V

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 49
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;-><init>(Ljava/lang/String;)V

    .line 54
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 55
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 56
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 36
    check-cast p1, Lorg/jboss/netty/channel/Channel;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->add(Lorg/jboss/netty/channel/Channel;)Z

    move-result v0

    return v0
.end method

.method public add(Lorg/jboss/netty/channel/Channel;)Z
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 84
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    const/4 v0, 0x0

    .line 92
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    :goto_0
    return v0

    .line 90
    :cond_0
    :try_start_1
    invoke-super {p0, p1}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->add(Lorg/jboss/netty/channel/Channel;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    .line 92
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v0
.end method

.method public close()Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 3

    .prologue
    .line 62
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 64
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 66
    invoke-super {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->close()Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 73
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    :goto_0
    return-object v1

    .line 68
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v0, "futures":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jboss/netty/channel/ChannelFuture;>;"
    sget-object v1, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->logger:Lorg/slf4j/Logger;

    const-string v2, "CleanupChannelGroup Already closed"

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 70
    new-instance v2, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    const-class v1, Lorg/jboss/netty/channel/group/ChannelGroup;

    invoke-virtual {v1, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/group/ChannelGroup;

    invoke-direct {v2, v1, v0}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;-><init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Collection;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    move-object v1, v2

    goto :goto_0

    .end local v0    # "futures":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jboss/netty/channel/ChannelFuture;>;"
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v1
.end method
