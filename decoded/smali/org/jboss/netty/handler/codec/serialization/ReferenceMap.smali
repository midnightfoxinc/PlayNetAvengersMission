.class abstract Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;
.super Ljava/lang/Object;
.source "ReferenceMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private final delegate:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/lang/ref/Reference",
            "<TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/lang/ref/Reference",
            "<TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    .local p1, "delegate":Ljava/util/Map;, "Ljava/util/Map<TK;Ljava/lang/ref/Reference<TV;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    .line 29
    return-void
.end method

.method private unfold(Ljava/lang/ref/Reference;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/Reference",
            "<TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    .local p1, "ref":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<TV;>;"
    if-nez p1, :cond_0

    .line 35
    const/4 v0, 0x0

    .line 38
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 76
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 77
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 50
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 54
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method abstract fold(Ljava/lang/Object;)Ljava/lang/ref/Reference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)",
            "Ljava/lang/ref/Reference",
            "<TV;>;"
        }
    .end annotation
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->unfold(Ljava/lang/ref/Reference;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 46
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->fold(Ljava/lang/Object;)Ljava/lang/ref/Reference;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->unfold(Ljava/lang/ref/Reference;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 71
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->fold(Ljava/lang/Object;)Ljava/lang/ref/Reference;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 73
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    :cond_0
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->unfold(Ljava/lang/ref/Reference;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 42
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->delegate:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
