.class public Lorg/jboss/netty/util/DefaultObjectSizeEstimator;
.super Ljava/lang/Object;
.source "DefaultObjectSizeEstimator.java"

# interfaces
.implements Lorg/jboss/netty/util/ObjectSizeEstimator;


# instance fields
.field private final class2size:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 6

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x2

    const/4 v3, 0x4

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    .line 41
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    iget-object v0, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    return-void
.end method

.method private static align(I)I
    .locals 2
    .param p0, "size"    # I

    .prologue
    .line 120
    rem-int/lit8 v0, p0, 0x8

    .line 121
    .local v0, "r":I
    if-eqz v0, :cond_0

    .line 122
    rsub-int/lit8 v1, v0, 0x8

    add-int/2addr p0, v1

    .line 124
    :cond_0
    return p0
.end method

.method private estimateSize(Ljava/lang/Class;Ljava/util/Set;)I
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)I"
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "visitedClasses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    iget-object v8, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v8, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 82
    .local v7, "objectSize":Ljava/lang/Integer;
    if-eqz v7, :cond_0

    .line 83
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 116
    :goto_0
    return v0

    .line 86
    :cond_0
    if-eqz p2, :cond_1

    .line 87
    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 88
    const/4 v0, 0x0

    goto :goto_0

    .line 91
    :cond_1
    new-instance p2, Ljava/util/HashSet;

    .end local p2    # "visitedClasses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 94
    .restart local p2    # "visitedClasses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    :cond_2
    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 96
    const/16 v0, 0x8

    .line 97
    .local v0, "answer":I
    move-object v2, p1

    .local v2, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    if-eqz v2, :cond_5

    .line 98
    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    .line 99
    .local v4, "fields":[Ljava/lang/reflect/Field;
    move-object v1, v4

    .local v1, "arr$":[Ljava/lang/reflect/Field;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_2
    if-ge v5, v6, :cond_4

    aget-object v3, v1, v5

    .line 100
    .local v3, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v8

    and-int/lit8 v8, v8, 0x8

    if-eqz v8, :cond_3

    .line 99
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 105
    :cond_3
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    invoke-direct {p0, v8, p2}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->estimateSize(Ljava/lang/Class;Ljava/util/Set;)I

    move-result v8

    add-int/2addr v0, v8

    goto :goto_3

    .line 97
    .end local v3    # "f":Ljava/lang/reflect/Field;
    :cond_4
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_1

    .line 109
    .end local v1    # "arr$":[Ljava/lang/reflect/Field;
    .end local v4    # "fields":[Ljava/lang/reflect/Field;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_5
    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 112
    invoke-static {v0}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->align(I)I

    move-result v0

    .line 115
    iget-object v8, p0, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->class2size:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v8, p1, v9}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public estimateSize(Ljava/lang/Object;)I
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 53
    if-nez p1, :cond_0

    .line 54
    const/16 v3, 0x8

    .line 77
    .end local p1    # "o":Ljava/lang/Object;
    :goto_0
    return v3

    .line 57
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {p0, v3, v4}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->estimateSize(Ljava/lang/Class;Ljava/util/Set;)I

    move-result v3

    add-int/lit8 v0, v3, 0x8

    .line 59
    .local v0, "answer":I
    instance-of v3, p1, Lorg/jboss/netty/util/EstimatableObjectWrapper;

    if-eqz v3, :cond_2

    .line 60
    check-cast p1, Lorg/jboss/netty/util/EstimatableObjectWrapper;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/jboss/netty/util/EstimatableObjectWrapper;->unwrap()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->estimateSize(Ljava/lang/Object;)I

    move-result v3

    add-int/2addr v0, v3

    .line 77
    :cond_1
    :goto_1
    invoke-static {v0}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->align(I)I

    move-result v3

    goto :goto_0

    .line 61
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_2
    instance-of v3, p1, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v3, :cond_3

    .line 62
    check-cast p1, Lorg/jboss/netty/channel/MessageEvent;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->estimateSize(Ljava/lang/Object;)I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_1

    .line 63
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_3
    instance-of v3, p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v3, :cond_4

    .line 64
    check-cast p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_1

    .line 65
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_4
    instance-of v3, p1, [B

    if-eqz v3, :cond_5

    .line 66
    check-cast p1, [B

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [B

    array-length v3, p1

    add-int/2addr v0, v3

    goto :goto_1

    .line 67
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_5
    instance-of v3, p1, Ljava/nio/ByteBuffer;

    if-eqz v3, :cond_6

    .line 68
    check-cast p1, Ljava/nio/ByteBuffer;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_1

    .line 69
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_6
    instance-of v3, p1, Ljava/lang/CharSequence;

    if-eqz v3, :cond_7

    .line 70
    check-cast p1, Ljava/lang/CharSequence;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    shl-int/lit8 v3, v3, 0x1

    add-int/2addr v0, v3

    goto :goto_1

    .line 71
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_7
    instance-of v3, p1, Ljava/lang/Iterable;

    if-eqz v3, :cond_1

    .line 72
    check-cast p1, Ljava/lang/Iterable;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 73
    .local v2, "m":Ljava/lang/Object;
    invoke-virtual {p0, v2}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->estimateSize(Ljava/lang/Object;)I

    move-result v3

    add-int/2addr v0, v3

    .line 74
    goto :goto_2
.end method
