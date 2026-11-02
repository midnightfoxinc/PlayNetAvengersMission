.class public final Lorg/jboss/netty/util/internal/ConcurrentHashMap;
.super Ljava/util/AbstractMap;
.source "ConcurrentHashMap.java"

# interfaces
.implements Ljava/util/concurrent/ConcurrentMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntryIterator;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$WriteThroughEntry;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$SimpleEntry;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$ValueIterator;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeyIterator;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashIterator;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;,
        Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractMap",
        "<TK;TV;>;",
        "Ljava/util/concurrent/ConcurrentMap",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field static final DEFAULT_CONCURRENCY_LEVEL:I = 0x10

.field static final DEFAULT_INITIAL_CAPACITY:I = 0x10

.field static final DEFAULT_LOAD_FACTOR:F = 0.75f

.field static final MAXIMUM_CAPACITY:I = 0x40000000

.field static final MAX_SEGMENTS:I = 0x10000

.field static final RETRIES_BEFORE_LOCK:I = 0x2


# instance fields
.field entrySet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field keySet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation
.end field

.field final segmentMask:I

.field final segmentShift:I

.field final segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field values:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    const/16 v1, 0x10

    .line 667
    const/high16 v0, 0x3f400000    # 0.75f

    invoke-direct {p0, v1, v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>(IFI)V

    .line 668
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "initialCapacity"    # I

    .prologue
    .line 658
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    const/high16 v0, 0x3f400000    # 0.75f

    const/16 v1, 0x10

    invoke-direct {p0, p1, v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>(IFI)V

    .line 659
    return-void
.end method

.method public constructor <init>(IF)V
    .locals 1
    .param p1, "initialCapacity"    # I
    .param p2, "loadFactor"    # F

    .prologue
    .line 644
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    const/16 v0, 0x10

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>(IFI)V

    .line 645
    return-void
.end method

.method public constructor <init>(IFI)V
    .locals 7
    .param p1, "initialCapacity"    # I
    .param p2, "loadFactor"    # F
    .param p3, "concurrencyLevel"    # I

    .prologue
    .line 592
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 593
    const/4 v5, 0x0

    cmpl-float v5, p2, v5

    if-lez v5, :cond_0

    if-ltz p1, :cond_0

    if-gtz p3, :cond_1

    .line 594
    :cond_0
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5

    .line 597
    :cond_1
    const/high16 v5, 0x10000

    if-le p3, v5, :cond_2

    .line 598
    const/high16 p3, 0x10000

    .line 602
    :cond_2
    const/4 v3, 0x0

    .line 603
    .local v3, "sshift":I
    const/4 v4, 0x1

    .line 604
    .local v4, "ssize":I
    :goto_0
    if-ge v4, p3, :cond_3

    .line 605
    add-int/lit8 v3, v3, 0x1

    .line 606
    shl-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 608
    :cond_3
    rsub-int/lit8 v5, v3, 0x20

    iput v5, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentShift:I

    .line 609
    add-int/lit8 v5, v4, -0x1

    iput v5, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentMask:I

    .line 610
    invoke-static {v4}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    .line 612
    const/high16 v5, 0x40000000    # 2.0f

    if-le p1, v5, :cond_4

    .line 613
    const/high16 p1, 0x40000000    # 2.0f

    .line 615
    :cond_4
    div-int v0, p1, v4

    .line 616
    .local v0, "c":I
    mul-int v5, v0, v4

    if-ge v5, p1, :cond_5

    .line 617
    add-int/lit8 v0, v0, 0x1

    .line 619
    :cond_5
    const/4 v1, 0x1

    .line 620
    .local v1, "cap":I
    :goto_1
    if-ge v1, v0, :cond_6

    .line 621
    shl-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 624
    :cond_6
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget-object v5, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    array-length v5, v5

    if-ge v2, v5, :cond_7

    .line 625
    iget-object v5, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    new-instance v6, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    invoke-direct {v6, v1, p2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;-><init>(IF)V

    aput-object v6, v5, v2

    .line 624
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 627
    :cond_7
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    const/16 v2, 0x10

    const/high16 v1, 0x3f400000    # 0.75f

    .line 679
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    float-to-int v0, v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-direct {p0, v0, v1, v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>(IFI)V

    .line 682
    invoke-virtual {p0, p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->putAll(Ljava/util/Map;)V

    .line 683
    return-void
.end method

.method private static hash(I)I
    .locals 2
    .param p0, "h"    # I

    .prologue
    .line 120
    shl-int/lit8 v0, p0, 0xf

    xor-int/lit16 v0, v0, -0x3283

    add-int/2addr p0, v0

    .line 121
    ushr-int/lit8 v0, p0, 0xa

    xor-int/2addr p0, v0

    .line 122
    shl-int/lit8 v0, p0, 0x3

    add-int/2addr p0, v0

    .line 123
    ushr-int/lit8 v0, p0, 0x6

    xor-int/2addr p0, v0

    .line 124
    shl-int/lit8 v0, p0, 0x2

    shl-int/lit8 v1, p0, 0xe

    add-int/2addr v0, v1

    add-int/2addr p0, v0

    .line 125
    ushr-int/lit8 v0, p0, 0x10

    xor-int/2addr v0, p0

    return v0
.end method

.method private static hashOf(Ljava/lang/Object;)I
    .locals 1
    .param p0, "key"    # Ljava/lang/Object;

    .prologue
    .line 139
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hash(I)I

    move-result v0

    return v0
.end method


# virtual methods
.method public clear()V
    .locals 4

    .prologue
    .line 995
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    .local v0, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 996
    .local v3, "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-virtual {v3}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->clear()V

    .line 995
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 998
    .end local v3    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    :cond_0
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 888
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    invoke-virtual {p0, p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 806
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hashOf(Ljava/lang/Object;)I

    move-result v0

    .line 807
    .local v0, "hash":I
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->containsKey(Ljava/lang/Object;I)Z

    move-result v1

    return v1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 13
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 823
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    if-nez p1, :cond_0

    .line 824
    new-instance v11, Ljava/lang/NullPointerException;

    invoke-direct {v11}, Ljava/lang/NullPointerException;-><init>()V

    throw v11

    .line 829
    :cond_0
    iget-object v10, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    .line 830
    .local v10, "segments":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    array-length v11, v10

    new-array v7, v11, [I

    .line 833
    .local v7, "mc":[I
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_0
    const/4 v11, 0x2

    if-ge v5, v11, :cond_7

    .line 834
    const/4 v8, 0x0

    .line 835
    .local v8, "mcsum":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v11, v10

    if-ge v3, v11, :cond_3

    .line 836
    aget-object v11, v10, v3

    iget v11, v11, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    aput v11, v7, v3

    add-int/2addr v8, v11

    .line 837
    aget-object v11, v10, v3

    invoke-virtual {v11, p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->containsValue(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 838
    const/4 v2, 0x1

    .line 871
    .end local v3    # "i":I
    .end local v8    # "mcsum":I
    :cond_1
    :goto_2
    return v2

    .line 835
    .restart local v3    # "i":I
    .restart local v8    # "mcsum":I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 841
    :cond_3
    const/4 v1, 0x1

    .line 842
    .local v1, "cleanSweep":Z
    if-eqz v8, :cond_4

    .line 843
    const/4 v3, 0x0

    :goto_3
    array-length v11, v10

    if-ge v3, v11, :cond_4

    .line 844
    aget v11, v7, v3

    aget-object v12, v10, v3

    iget v12, v12, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    if-eq v11, v12, :cond_5

    .line 845
    const/4 v1, 0x0

    .line 850
    :cond_4
    if-eqz v1, :cond_6

    .line 851
    const/4 v2, 0x0

    goto :goto_2

    .line 843
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 833
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 855
    .end local v1    # "cleanSweep":Z
    .end local v3    # "i":I
    .end local v8    # "mcsum":I
    :cond_7
    move-object v0, v10

    .local v0, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_4
    if-ge v4, v6, :cond_8

    aget-object v9, v0, v4

    .line 856
    .local v9, "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-virtual {v9}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->lock()V

    .line 855
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 858
    .end local v9    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    :cond_8
    const/4 v2, 0x0

    .line 860
    .local v2, "found":Z
    move-object v0, v10

    :try_start_0
    array-length v6, v0

    const/4 v4, 0x0

    :goto_5
    if-ge v4, v6, :cond_9

    aget-object v9, v0, v4

    .line 861
    .restart local v9    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-virtual {v9, p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->containsValue(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v11

    if-eqz v11, :cond_a

    .line 862
    const/4 v2, 0x1

    .line 867
    .end local v9    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    :cond_9
    move-object v0, v10

    array-length v6, v0

    const/4 v4, 0x0

    :goto_6
    if-ge v4, v6, :cond_1

    aget-object v9, v0, v4

    .line 868
    .restart local v9    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-virtual {v9}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 867
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 860
    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 867
    .end local v9    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    :cond_b
    throw v11

    :catchall_0
    move-exception v11

    move-object v0, v10

    array-length v6, v0

    const/4 v4, 0x0

    :goto_7
    if-ge v4, v6, :cond_b

    aget-object v9, v0, v4

    .line 868
    .restart local v9    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-virtual {v9}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 867
    add-int/lit8 v4, v4, 0x1

    goto :goto_7
.end method

.method public elements()Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 1080
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$ValueIterator;

    invoke-direct {v0, p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$ValueIterator;-><init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V

    return-object v0
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
    .line 1059
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->entrySet:Ljava/util/Set;

    .line 1060
    .local v0, "es":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    if-eqz v0, :cond_0

    .end local v0    # "es":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    :goto_0
    return-object v0

    .restart local v0    # "es":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    :cond_0
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;

    .end local v0    # "es":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-direct {v0, p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$EntrySet;-><init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->entrySet:Ljava/util/Set;

    goto :goto_0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 791
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hashOf(Ljava/lang/Object;)I

    move-result v0

    .line 792
    .local v0, "hash":I
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public isEmpty()Z
    .locals 7

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    const/4 v4, 0x0

    .line 692
    iget-object v3, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    .line 701
    .local v3, "segments":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    array-length v5, v3

    new-array v1, v5, [I

    .line 702
    .local v1, "mc":[I
    const/4 v2, 0x0

    .line 703
    .local v2, "mcsum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, v3

    if-ge v0, v5, :cond_2

    .line 704
    aget-object v5, v3, v0

    iget v5, v5, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    if-eqz v5, :cond_1

    .line 720
    :cond_0
    :goto_1
    return v4

    .line 707
    :cond_1
    aget-object v5, v3, v0

    iget v5, v5, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    aput v5, v1, v0

    add-int/2addr v2, v5

    .line 703
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 713
    :cond_2
    if-eqz v2, :cond_3

    .line 714
    const/4 v0, 0x0

    :goto_2
    array-length v5, v3

    if-ge v0, v5, :cond_3

    .line 715
    aget-object v5, v3, v0

    iget v5, v5, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    if-nez v5, :cond_0

    aget v5, v1, v0

    aget-object v6, v3, v0

    iget v6, v6, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    if-ne v5, v6, :cond_0

    .line 714
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 720
    :cond_3
    const/4 v4, 0x1

    goto :goto_1
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
    .line 1017
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->keySet:Ljava/util/Set;

    .line 1018
    .local v0, "ks":Ljava/util/Set;, "Ljava/util/Set<TK;>;"
    if-eqz v0, :cond_0

    .end local v0    # "ks":Ljava/util/Set;, "Ljava/util/Set<TK;>;"
    :goto_0
    return-object v0

    .restart local v0    # "ks":Ljava/util/Set;, "Ljava/util/Set<TK;>;"
    :cond_0
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;

    .end local v0    # "ks":Ljava/util/Set;, "Ljava/util/Set<TK;>;"
    invoke-direct {v0, p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;-><init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->keySet:Ljava/util/Set;

    goto :goto_0
.end method

.method public keys()Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 1070
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeyIterator;

    invoke-direct {v0, p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeyIterator;-><init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 906
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-nez p2, :cond_0

    .line 907
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 909
    :cond_0
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hashOf(Ljava/lang/Object;)I

    move-result v0

    .line 910
    .local v0, "hash":I
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, p2, v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->put(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 935
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
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

    .line 936
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 938
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    :cond_0
    return-void
.end method

.method public putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 919
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-nez p2, :cond_0

    .line 920
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 922
    :cond_0
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hashOf(Ljava/lang/Object;)I

    move-result v0

    .line 923
    .local v0, "hash":I
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, p2, v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->put(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 951
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hashOf(Ljava/lang/Object;)I

    move-result v0

    .line 952
    .local v0, "hash":I
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v0, v2, v3}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->remove(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    const/4 v1, 0x0

    .line 959
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hashOf(Ljava/lang/Object;)I

    move-result v0

    .line 960
    .local v0, "hash":I
    if-nez p2, :cond_1

    .line 963
    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v2

    invoke-virtual {v2, p1, v0, p2, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->remove(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 983
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-nez p2, :cond_0

    .line 984
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 986
    :cond_0
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hashOf(Ljava/lang/Object;)I

    move-result v0

    .line 987
    .local v0, "hash":I
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v1

    invoke-virtual {v1, p1, v0, p2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->replace(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;TV;)Z"
        }
    .end annotation

    .prologue
    .line 970
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "oldValue":Ljava/lang/Object;, "TV;"
    .local p3, "newValue":Ljava/lang/Object;, "TV;"
    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 971
    :cond_0
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 973
    :cond_1
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->hashOf(Ljava/lang/Object;)I

    move-result v0

    .line 974
    .local v0, "hash":I
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    move-result-object v1

    invoke-virtual {v1, p1, v0, p2, p3}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->replace(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method segmentFor(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    .locals 3
    .param p1, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    iget v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentShift:I

    ushr-int v1, p1, v1

    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segmentMask:I

    and-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0
.end method

.method public size()I
    .locals 18

    .prologue
    .line 732
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    .line 733
    .local v12, "segments":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    const-wide/16 v14, 0x0

    .line 734
    .local v14, "sum":J
    const-wide/16 v4, 0x0

    .line 735
    .local v4, "check":J
    array-length v13, v12

    new-array v9, v13, [I

    .line 738
    .local v9, "mc":[I
    const/4 v7, 0x0

    .local v7, "k":I
    :goto_0
    const/4 v13, 0x2

    if-ge v7, v13, :cond_2

    .line 739
    const-wide/16 v4, 0x0

    .line 740
    const-wide/16 v14, 0x0

    .line 741
    const/4 v10, 0x0

    .line 742
    .local v10, "mcsum":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v13, v12

    if-ge v3, v13, :cond_0

    .line 743
    aget-object v13, v12, v3

    iget v13, v13, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    int-to-long v0, v13

    move-wide/from16 v16, v0

    add-long v14, v14, v16

    .line 744
    aget-object v13, v12, v3

    iget v13, v13, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    aput v13, v9, v3

    add-int/2addr v10, v13

    .line 742
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 746
    :cond_0
    if-eqz v10, :cond_1

    .line 747
    const/4 v3, 0x0

    :goto_2
    array-length v13, v12

    if-ge v3, v13, :cond_1

    .line 748
    aget-object v13, v12, v3

    iget v13, v13, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    int-to-long v0, v13

    move-wide/from16 v16, v0

    add-long v4, v4, v16

    .line 749
    aget v13, v9, v3

    aget-object v16, v12, v3

    move-object/from16 v0, v16

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-eq v13, v0, :cond_3

    .line 750
    const-wide/16 v4, -0x1

    .line 755
    :cond_1
    cmp-long v13, v4, v14

    if-nez v13, :cond_4

    .line 759
    .end local v3    # "i":I
    .end local v10    # "mcsum":I
    :cond_2
    cmp-long v13, v4, v14

    if-eqz v13, :cond_7

    .line 760
    const-wide/16 v14, 0x0

    .line 761
    move-object v2, v12

    .local v2, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    array-length v8, v2

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_3
    if-ge v6, v8, :cond_5

    aget-object v11, v2, v6

    .line 762
    .local v11, "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-virtual {v11}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->lock()V

    .line 761
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 747
    .end local v2    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    .end local v6    # "i$":I
    .end local v8    # "len$":I
    .end local v11    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    .restart local v3    # "i":I
    .restart local v10    # "mcsum":I
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 738
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 764
    .end local v3    # "i":I
    .end local v10    # "mcsum":I
    .restart local v2    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    .restart local v6    # "i$":I
    .restart local v8    # "len$":I
    :cond_5
    move-object v2, v12

    array-length v8, v2

    const/4 v6, 0x0

    :goto_4
    if-ge v6, v8, :cond_6

    aget-object v11, v2, v6

    .line 765
    .restart local v11    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    iget v13, v11, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    int-to-long v0, v13

    move-wide/from16 v16, v0

    add-long v14, v14, v16

    .line 764
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 767
    .end local v11    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    :cond_6
    move-object v2, v12

    array-length v8, v2

    const/4 v6, 0x0

    :goto_5
    if-ge v6, v8, :cond_7

    aget-object v11, v2, v6

    .line 768
    .restart local v11    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-virtual {v11}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 767
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 771
    .end local v2    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    .end local v6    # "i$":I
    .end local v8    # "len$":I
    .end local v11    # "segment":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    :cond_7
    const-wide/32 v16, 0x7fffffff

    cmp-long v13, v14, v16

    if-lez v13, :cond_8

    .line 772
    const v13, 0x7fffffff

    .line 774
    :goto_6
    return v13

    :cond_8
    long-to-int v13, v14

    goto :goto_6
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
    .line 1038
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->values:Ljava/util/Collection;

    .line 1039
    .local v0, "vs":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    if-eqz v0, :cond_0

    .end local v0    # "vs":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    :goto_0
    return-object v0

    .restart local v0    # "vs":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    :cond_0
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;

    .end local v0    # "vs":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    invoke-direct {v0, p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;-><init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->values:Ljava/util/Collection;

    goto :goto_0
.end method
