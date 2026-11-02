.class public Lorg/jboss/netty/channel/ChannelLocal;
.super Ljava/lang/Object;
.source "ChannelLocal.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Lorg/jboss/netty/channel/Channel;",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field private final map:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Lorg/jboss/netty/channel/Channel;",
            "TT;>;"
        }
    .end annotation
.end field

.field private final removeOnClose:Z

.field private final remover:Lorg/jboss/netty/channel/ChannelFutureListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    .local p0, "this":Lorg/jboss/netty/channel/ChannelLocal;, "Lorg/jboss/netty/channel/ChannelLocal<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/ChannelLocal;-><init>(Z)V

    .line 55
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "removeOnClose"    # Z

    .prologue
    .line 63
    .local p0, "this":Lorg/jboss/netty/channel/ChannelLocal;, "Lorg/jboss/netty/channel/ChannelLocal<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/ChannelLocal;->map:Ljava/util/concurrent/ConcurrentMap;

    .line 41
    new-instance v0, Lorg/jboss/netty/channel/ChannelLocal$1;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/ChannelLocal$1;-><init>(Lorg/jboss/netty/channel/ChannelLocal;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/ChannelLocal;->remover:Lorg/jboss/netty/channel/ChannelFutureListener;

    .line 64
    iput-boolean p1, p0, Lorg/jboss/netty/channel/ChannelLocal;->removeOnClose:Z

    .line 65
    return-void
.end method


# virtual methods
.method public get(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;
    .locals 4
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lorg/jboss/netty/channel/ChannelLocal;, "Lorg/jboss/netty/channel/ChannelLocal<TT;>;"
    if-nez p1, :cond_0

    .line 81
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "channel"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 84
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/channel/ChannelLocal;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 85
    .local v1, "value":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_1

    .line 86
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/ChannelLocal;->initialValue(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v1

    .line 87
    if-eqz v1, :cond_1

    .line 88
    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/channel/ChannelLocal;->setIfAbsent(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 89
    .local v0, "oldValue":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_1

    .line 90
    move-object v1, v0

    .line 94
    .end local v0    # "oldValue":Ljava/lang/Object;, "TT;"
    :cond_1
    return-object v1
.end method

.method protected initialValue(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lorg/jboss/netty/channel/ChannelLocal;, "Lorg/jboss/netty/channel/ChannelLocal<TT;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/jboss/netty/channel/Channel;",
            "TT;>;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lorg/jboss/netty/channel/ChannelLocal;, "Lorg/jboss/netty/channel/ChannelLocal<TT;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/ChannelLocal;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 149
    .local p0, "this":Lorg/jboss/netty/channel/ChannelLocal;, "Lorg/jboss/netty/channel/ChannelLocal<TT;>;"
    if-nez p1, :cond_0

    .line 150
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "channel"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 152
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/channel/ChannelLocal;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 153
    .local v0, "removed":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_2

    .line 154
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/ChannelLocal;->initialValue(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v0

    .line 159
    .end local v0    # "removed":Ljava/lang/Object;, "TT;"
    :cond_1
    :goto_0
    return-object v0

    .line 156
    .restart local v0    # "removed":Ljava/lang/Object;, "TT;"
    :cond_2
    iget-boolean v1, p0, Lorg/jboss/netty/channel/ChannelLocal;->removeOnClose:Z

    if-eqz v1, :cond_1

    .line 157
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/channel/ChannelLocal;->remover:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->removeListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_0
.end method

.method public set(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "this":Lorg/jboss/netty/channel/ChannelLocal;, "Lorg/jboss/netty/channel/ChannelLocal<TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    if-nez p2, :cond_1

    .line 104
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/ChannelLocal;->remove(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v0

    .line 113
    :cond_0
    :goto_0
    return-object v0

    .line 106
    :cond_1
    if-nez p1, :cond_2

    .line 107
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "channel"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/channel/ChannelLocal;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 110
    .local v0, "old":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lorg/jboss/netty/channel/ChannelLocal;->removeOnClose:Z

    if-eqz v1, :cond_0

    .line 111
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/channel/ChannelLocal;->remover:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_0
.end method

.method public setIfAbsent(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "this":Lorg/jboss/netty/channel/ChannelLocal;, "Lorg/jboss/netty/channel/ChannelLocal<TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    if-nez p2, :cond_1

    .line 125
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/ChannelLocal;->get(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v0

    .line 135
    :cond_0
    :goto_0
    return-object v0

    .line 127
    :cond_1
    if-nez p1, :cond_2

    .line 128
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "channel"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 130
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/channel/ChannelLocal;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 132
    .local v0, "mapping":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lorg/jboss/netty/channel/ChannelLocal;->removeOnClose:Z

    if-eqz v1, :cond_0

    if-nez v0, :cond_0

    .line 133
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/channel/ChannelLocal;->remover:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_0
.end method
