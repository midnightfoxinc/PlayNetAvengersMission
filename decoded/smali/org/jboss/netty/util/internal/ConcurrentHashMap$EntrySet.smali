.class final Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;
.super Ljava/util/AbstractSet;
.source "ConcurrentHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "EntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V
    .locals 0

    .prologue
    .line 1351
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.EntrySet;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 1388
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->clear()V

    .line 1389
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.EntrySet;"
    const/4 v2, 0x0

    .line 1359
    instance-of v3, p1, Ljava/util/Map$Entry;

    if-nez v3, :cond_1

    .line 1364
    :cond_0
    :goto_0
    return v2

    :cond_1
    move-object v0, p1

    .line 1362
    check-cast v0, Ljava/util/Map$Entry;

    .line 1363
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    iget-object v3, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 1364
    .local v1, "v":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 1383
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 1354
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.EntrySet;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntryIterator;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntryIterator;-><init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1369
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.EntrySet;"
    instance-of v1, p1, Ljava/util/Map$Entry;

    if-nez v1, :cond_0

    .line 1370
    const/4 v1, 0x0

    .line 1373
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 1372
    check-cast v0, Ljava/util/Map$Entry;

    .line 1373
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1378
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.EntrySet;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method
