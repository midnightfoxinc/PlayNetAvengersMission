.class final Lorg/jboss/netty/util/MapBackedSet;
.super Ljava/util/AbstractSet;
.source "MapBackedSet.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractSet",
        "<TE;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x5dd5b880ff1a7128L


# instance fields
.field private final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TE;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TE;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lorg/jboss/netty/util/MapBackedSet;, "Lorg/jboss/netty/util/MapBackedSet<TE;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<TE;Ljava/lang/Boolean;>;"
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/jboss/netty/util/MapBackedSet;->map:Ljava/util/Map;

    .line 38
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lorg/jboss/netty/util/MapBackedSet;, "Lorg/jboss/netty/util/MapBackedSet<TE;>;"
    .local p1, "o":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lorg/jboss/netty/util/MapBackedSet;->map:Ljava/util/Map;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 62
    .local p0, "this":Lorg/jboss/netty/util/MapBackedSet;, "Lorg/jboss/netty/util/MapBackedSet<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/MapBackedSet;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 63
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 47
    .local p0, "this":Lorg/jboss/netty/util/MapBackedSet;, "Lorg/jboss/netty/util/MapBackedSet<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/MapBackedSet;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lorg/jboss/netty/util/MapBackedSet;, "Lorg/jboss/netty/util/MapBackedSet<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/MapBackedSet;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 57
    .local p0, "this":Lorg/jboss/netty/util/MapBackedSet;, "Lorg/jboss/netty/util/MapBackedSet<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/MapBackedSet;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 42
    .local p0, "this":Lorg/jboss/netty/util/MapBackedSet;, "Lorg/jboss/netty/util/MapBackedSet<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/MapBackedSet;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method
