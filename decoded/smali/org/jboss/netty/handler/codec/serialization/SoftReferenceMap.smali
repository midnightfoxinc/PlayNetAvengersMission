.class public Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;
.super Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;
.source "SoftReferenceMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/jboss/netty/handler/codec/serialization/ReferenceMap",
        "<TK;TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
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
    .line 25
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    .local p1, "delegate":Ljava/util/Map;, "Ljava/util/Map<TK;Ljava/lang/ref/Reference<TV;>;>;"
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;-><init>(Ljava/util/Map;)V

    .line 26
    return-void
.end method


# virtual methods
.method public bridge synthetic clear()V
    .locals 0

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->clear()V

    return-void
.end method

.method public bridge synthetic containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic entrySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method fold(Ljava/lang/Object;)Ljava/lang/ref/Reference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)",
            "Ljava/lang/ref/Reference",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic isEmpty()Z
    .locals 1

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic keySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic putAll(Ljava/util/Map;)V
    .locals 0
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic size()I
    .locals 1

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 22
    .local p0, "this":Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;, "Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap<TK;TV;>;"
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/serialization/ReferenceMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
