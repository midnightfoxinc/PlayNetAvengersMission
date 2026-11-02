.class public Lorg/jboss/netty/channel/group/DefaultChannelGroup;
.super Ljava/util/AbstractSet;
.source "DefaultChannelGroup.java"

# interfaces
.implements Lorg/jboss/netty/channel/group/ChannelGroup;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet",
        "<",
        "Lorg/jboss/netty/channel/Channel;",
        ">;",
        "Lorg/jboss/netty/channel/group/ChannelGroup;"
    }
.end annotation


# static fields
.field private static final nextId:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final name:Ljava/lang/String;

.field private final nonServerChannels:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/channel/Channel;",
            ">;"
        }
    .end annotation
.end field

.field private final remover:Lorg/jboss/netty/channel/ChannelFutureListener;

.field private final serverChannels:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/channel/Channel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "group-0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;-><init>(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 44
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    .line 45
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    .line 46
    new-instance v0, Lorg/jboss/netty/channel/group/DefaultChannelGroup$1;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup$1;-><init>(Lorg/jboss/netty/channel/group/DefaultChannelGroup;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->remover:Lorg/jboss/netty/channel/ChannelFutureListener;

    .line 65
    if-nez p1, :cond_0

    .line 66
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->name:Ljava/lang/String;

    .line 69
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 39
    check-cast p1, Lorg/jboss/netty/channel/Channel;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->add(Lorg/jboss/netty/channel/Channel;)Z

    move-result v0

    return v0
.end method

.method public add(Lorg/jboss/netty/channel/Channel;)Z
    .locals 4
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 112
    instance-of v2, p1, Lorg/jboss/netty/channel/ServerChannel;

    if-eqz v2, :cond_1

    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    .line 115
    .local v1, "map":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<Ljava/lang/Integer;Lorg/jboss/netty/channel/Channel;>;"
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2

    const/4 v0, 0x1

    .line 116
    .local v0, "added":Z
    :goto_1
    if-eqz v0, :cond_0

    .line 117
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->remover:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 119
    :cond_0
    return v0

    .line 112
    .end local v0    # "added":Z
    .end local v1    # "map":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<Ljava/lang/Integer;Lorg/jboss/netty/channel/Channel;>;"
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    goto :goto_0

    .line 115
    .restart local v1    # "map":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<Ljava/lang/Integer;Lorg/jboss/netty/channel/Channel;>;"
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 150
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 151
    return-void
.end method

.method public close()Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 5

    .prologue
    .line 177
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 180
    .local v1, "futures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 181
    .local v0, "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 183
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_0
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 184
    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 187
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_1
    new-instance v3, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-direct {v3, p0, v1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;-><init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Map;)V

    return-object v3
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 39
    check-cast p1, Lorg/jboss/netty/channel/group/ChannelGroup;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->compareTo(Lorg/jboss/netty/channel/group/ChannelGroup;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/channel/group/ChannelGroup;)I
    .locals 3
    .param p1, "o"    # Lorg/jboss/netty/channel/group/ChannelGroup;

    .prologue
    .line 289
    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/channel/group/ChannelGroup;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 290
    .local v0, "v":I
    if-eqz v0, :cond_0

    .line 294
    .end local v0    # "v":I
    :goto_0
    return v0

    .restart local v0    # "v":I
    :cond_0
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    sub-int v0, v1, v2

    goto :goto_0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 96
    instance-of v2, p1, Ljava/lang/Integer;

    if-eqz v2, :cond_2

    .line 97
    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 106
    :cond_1
    :goto_0
    return v1

    .line 98
    :cond_2
    instance-of v2, p1, Lorg/jboss/netty/channel/Channel;

    if-eqz v2, :cond_1

    move-object v0, p1

    .line 99
    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 100
    .local v0, "c":Lorg/jboss/netty/channel/Channel;
    instance-of v1, p1, Lorg/jboss/netty/channel/ServerChannel;

    if-eqz v1, :cond_3

    .line 101
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 103
    :cond_3
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public disconnect()Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 5

    .prologue
    .line 191
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 194
    .local v1, "futures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 195
    .local v0, "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->disconnect()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 197
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_0
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 198
    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->disconnect()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 201
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_1
    new-instance v3, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-direct {v3, p0, v1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;-><init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Map;)V

    return-object v3
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 285
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public find(Ljava/lang/Integer;)Lorg/jboss/netty/channel/Channel;
    .locals 2
    .param p1, "id"    # Ljava/lang/Integer;

    .prologue
    .line 86
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 87
    .local v0, "c":Lorg/jboss/netty/channel/Channel;
    if-eqz v0, :cond_0

    .line 90
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :goto_0
    return-object v0

    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/Channel;

    move-object v0, v1

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 280
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jboss/netty/channel/Channel;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    new-instance v0, Lorg/jboss/netty/channel/group/CombinedIterator;

    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/channel/group/CombinedIterator;-><init>(Ljava/util/Iterator;Ljava/util/Iterator;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 124
    const/4 v0, 0x0

    .line 125
    .local v0, "c":Lorg/jboss/netty/channel/Channel;
    instance-of v1, p1, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 126
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 127
    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    if-nez v0, :cond_0

    .line 128
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 139
    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_0
    :goto_0
    if-nez v0, :cond_3

    .line 140
    const/4 v1, 0x0

    .line 144
    :goto_1
    return v1

    .line 130
    :cond_1
    instance-of v1, p1, Lorg/jboss/netty/channel/Channel;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 131
    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 132
    instance-of v1, v0, Lorg/jboss/netty/channel/ServerChannel;

    if-eqz v1, :cond_2

    .line 133
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    goto :goto_0

    .line 135
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    goto :goto_0

    .line 143
    :cond_3
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->remover:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->removeListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 144
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public setInterestOps(I)Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 5
    .param p1, "interestOps"    # I

    .prologue
    .line 205
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 208
    .local v1, "futures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 209
    .local v0, "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/Channel;->setInterestOps(I)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 211
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_0
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 212
    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/Channel;->setInterestOps(I)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 215
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_1
    new-instance v3, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-direct {v3, p0, v1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;-><init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Map;)V

    return-object v3
.end method

.method public setReadable(Z)Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 5
    .param p1, "readable"    # Z

    .prologue
    .line 219
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 222
    .local v1, "futures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 223
    .local v0, "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 225
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_0
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 226
    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 229
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_1
    new-instance v3, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-direct {v3, p0, v1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;-><init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Map;)V

    return-object v3
.end method

.method public size()I
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v0

    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 2

    .prologue
    .line 162
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 163
    .local v0, "channels":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jboss/netty/channel/Channel;>;"
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 164
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 165
    invoke-interface {v0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 170
    .local p1, "a":[Ljava/lang/Object;, "[TT;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 171
    .local v0, "channels":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jboss/netty/channel/Channel;>;"
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 172
    iget-object v1, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 173
    invoke-interface {v0, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 299
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unbind()Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 5

    .prologue
    .line 233
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 236
    .local v1, "futures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->serverChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 237
    .local v0, "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->unbind()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 239
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_0
    iget-object v3, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/Channel;

    .line 240
    .restart local v0    # "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->unbind()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 243
    .end local v0    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_1
    new-instance v3, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-direct {v3, p0, v1}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;-><init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Map;)V

    return-object v3
.end method

.method public write(Ljava/lang/Object;)Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 6
    .param p1, "message"    # Ljava/lang/Object;

    .prologue
    .line 247
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 249
    .local v2, "futures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    instance-of v4, p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v4, :cond_0

    move-object v0, p1

    .line 250
    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 251
    .local v0, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v4, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/Channel;

    .line 252
    .local v1, "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-interface {v1, v5}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 255
    .end local v0    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "c":Lorg/jboss/netty/channel/Channel;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v4, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/Channel;

    .line 256
    .restart local v1    # "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, p1}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 259
    .end local v1    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_1
    new-instance v4, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-direct {v4, p0, v2}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;-><init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Map;)V

    return-object v4
.end method

.method public write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/group/ChannelGroupFuture;
    .locals 6
    .param p1, "message"    # Ljava/lang/Object;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 263
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 265
    .local v2, "futures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/channel/ChannelFuture;>;"
    instance-of v4, p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v4, :cond_0

    move-object v0, p1

    .line 266
    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 267
    .local v0, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v4, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/Channel;

    .line 268
    .local v1, "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-interface {v1, v5, p2}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 271
    .end local v0    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "c":Lorg/jboss/netty/channel/Channel;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v4, p0, Lorg/jboss/netty/channel/group/DefaultChannelGroup;->nonServerChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/Channel;

    .line 272
    .restart local v1    # "c":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, p1, p2}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 275
    .end local v1    # "c":Lorg/jboss/netty/channel/Channel;
    :cond_1
    new-instance v4, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;

    invoke-direct {v4, p0, v2}, Lorg/jboss/netty/channel/group/DefaultChannelGroupFuture;-><init>(Lorg/jboss/netty/channel/group/ChannelGroup;Ljava/util/Map;)V

    return-object v4
.end method
