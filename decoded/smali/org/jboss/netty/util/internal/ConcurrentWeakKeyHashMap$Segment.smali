.class final Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;
.super Ljava/util/concurrent/locks/ReentrantLock;
.source "ConcurrentWeakKeyHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Segment"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/locks/ReentrantLock;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x73935f43c8f169f6L


# instance fields
.field volatile transient count:I

.field final loadFactor:F

.field modCount:I

.field volatile transient refQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field volatile transient table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field threshold:I


# direct methods
.method constructor <init>(IF)V
    .locals 1
    .param p1, "initialCapacity"    # I
    .param p2, "lf"    # F

    .prologue
    .line 309
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 310
    iput p2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->loadFactor:F

    .line 311
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->setTable([Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;)V

    .line 312
    return-void
.end method

.method private static keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "src"    # Ljava/lang/Object;
    .param p1, "dest"    # Ljava/lang/Object;

    .prologue
    .line 320
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;
    .locals 1
    .param p0, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)[",
            "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 316
    new-array v0, p0, [Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;

    return-object v0
.end method


# virtual methods
.method clear()V
    .locals 3

    .prologue
    .line 619
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I

    if-eqz v2, :cond_1

    .line 620
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->lock()V

    .line 622
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    .line 623
    .local v1, "tab":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 624
    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 623
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 626
    :cond_0
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->modCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->modCount:I

    .line 629
    new-instance v2, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v2}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->refQueue:Ljava/lang/ref/ReferenceQueue;

    .line 630
    const/4 v2, 0x0

    iput v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 632
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    .line 635
    .end local v0    # "i":I
    .end local v1    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :cond_1
    return-void

    .line 632
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    throw v2
.end method

.method containsKey(Ljava/lang/Object;I)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I

    .prologue
    .line 384
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    iget v1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I

    if-eqz v1, :cond_1

    .line 385
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v0

    .line 386
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    .line 387
    iget v1, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    if-ne v1, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 388
    const/4 v1, 0x1

    .line 393
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_1
    return v1

    .line 390
    .restart local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_0

    .line 393
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method containsValue(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 397
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    iget v6, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I

    if-eqz v6, :cond_3

    .line 398
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    .local v0, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_3

    aget-object v1, v0, v2

    .line 399
    .local v1, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v1, :cond_2

    .line 400
    iget-object v4, v1, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->valueRef:Ljava/lang/Object;

    .line 403
    .local v4, "opaque":Ljava/lang/Object;
    if-nez v4, :cond_0

    .line 404
    invoke-virtual {p0, v1}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;)Ljava/lang/Object;

    move-result-object v5

    .line 409
    .local v5, "v":Ljava/lang/Object;, "TV;"
    :goto_2
    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 410
    const/4 v6, 0x1

    .line 415
    .end local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "opaque":Ljava/lang/Object;
    .end local v5    # "v":Ljava/lang/Object;, "TV;"
    :goto_3
    return v6

    .line 406
    .restart local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;
    .restart local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "opaque":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v1, v4}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->dereferenceValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .restart local v5    # "v":Ljava/lang/Object;, "TV;"
    goto :goto_2

    .line 399
    :cond_1
    iget-object v1, v1, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_1

    .line 398
    .end local v4    # "opaque":Ljava/lang/Object;
    .end local v5    # "v":Ljava/lang/Object;, "TV;"
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 415
    .end local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_3
    const/4 v6, 0x0

    goto :goto_3
.end method

.method get(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)TV;"
        }
    .end annotation

    .prologue
    .line 366
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I

    if-eqz v2, :cond_2

    .line 367
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v0

    .line 368
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_2

    .line 369
    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_1

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 370
    iget-object v1, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->valueRef:Ljava/lang/Object;

    .line 371
    .local v1, "opaque":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 372
    invoke-virtual {v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->dereferenceValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 380
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v1    # "opaque":Ljava/lang/Object;
    :goto_1
    return-object v2

    .line 375
    .restart local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .restart local v1    # "opaque":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 377
    .end local v1    # "opaque":Ljava/lang/Object;
    :cond_1
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_0

    .line 380
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;
    .locals 2
    .param p1, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 337
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    .line 338
    .local v0, "tab":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, p1

    aget-object v1, v0, v1

    return-object v1
.end method

.method newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;
    .locals 6
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry",
            "<TK;TV;>;TV;)",
            "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 343
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "next":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .local p4, "value":Ljava/lang/Object;, "TV;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    iget-object v5, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->refQueue:Ljava/lang/ref/ReferenceQueue;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;-><init>(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    return-object v0
.end method

.method put(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;
    .locals 9
    .param p2, "hash"    # I
    .param p4, "onlyIfAbsent"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;Z)TV;"
        }
    .end annotation

    .prologue
    .line 459
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->lock()V

    .line 461
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->removeStale()V

    .line 462
    iget v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I

    .line 463
    .local v0, "c":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .local v1, "c":I
    iget v8, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->threshold:I

    if-le v0, v8, :cond_4

    .line 464
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->rehash()I

    move-result v6

    .line 465
    .local v6, "reduced":I
    if-lez v6, :cond_4

    .line 466
    sub-int v0, v1, v6

    .end local v1    # "c":I
    .restart local v0    # "c":I
    add-int/lit8 v8, v0, -0x1

    iput v8, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I

    .line 470
    .end local v6    # "reduced":I
    :goto_0
    iget-object v7, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    .line 471
    .local v7, "tab":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    array-length v8, v7

    add-int/lit8 v8, v8, -0x1

    and-int v4, p2, v8

    .line 472
    .local v4, "index":I
    aget-object v3, v7, v4

    .line 473
    .local v3, "first":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    move-object v2, v3

    .line 474
    .local v2, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v2, :cond_1

    iget v8, v2, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    if-ne v8, p2, :cond_0

    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v8

    invoke-static {p1, v8}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 475
    :cond_0
    iget-object v2, v2, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_1

    .line 479
    :cond_1
    if-eqz v2, :cond_3

    .line 480
    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v5

    .line 481
    .local v5, "oldValue":Ljava/lang/Object;, "TV;"
    if-nez p4, :cond_2

    .line 482
    invoke-virtual {v2, p3}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 492
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    .line 490
    return-object v5

    .line 485
    :cond_3
    const/4 v5, 0x0

    .line 486
    .restart local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    :try_start_1
    iget v8, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->modCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->modCount:I

    .line 487
    invoke-virtual {p0, p1, p2, v3, p3}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v8

    aput-object v8, v7, v4

    .line 488
    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 492
    .end local v0    # "c":I
    .end local v2    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v3    # "first":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v4    # "index":I
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    .end local v7    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v8

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    throw v8

    .restart local v1    # "c":I
    :cond_4
    move v0, v1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    goto :goto_0
.end method

.method readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry",
            "<TK;TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 354
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    .local p1, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->lock()V

    .line 356
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->removeStale()V

    .line 357
    invoke-virtual {p1}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->value()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 359
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    .line 357
    return-object v0

    .line 359
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    throw v0
.end method

.method rehash()I
    .locals 23

    .prologue
    .line 497
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-object/from16 v17, v0

    .line 498
    .local v17, "oldTable":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v16, v0

    .line 499
    .local v16, "oldCapacity":I
    const/high16 v21, 0x40000000    # 2.0f

    move/from16 v0, v16

    move/from16 v1, v21

    if-lt v0, v1, :cond_0

    .line 500
    const/16 v19, 0x0

    .line 558
    :goto_0
    return v19

    .line 516
    :cond_0
    shl-int/lit8 v21, v16, 0x1

    invoke-static/range {v21 .. v21}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v14

    .line 517
    .local v14, "newTable":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    array-length v0, v14

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->loadFactor:F

    move/from16 v22, v0

    mul-float v21, v21, v22

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->threshold:I

    .line 518
    array-length v0, v14

    move/from16 v21, v0

    add-int/lit8 v20, v21, -0x1

    .line 519
    .local v20, "sizeMask":I
    const/16 v19, 0x0

    .line 520
    .local v19, "reduce":I
    move-object/from16 v3, v17

    .local v3, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;
    array-length v12, v3

    .local v12, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1
    if-ge v5, v12, :cond_6

    aget-object v4, v3, v5

    .line 523
    .local v4, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    if-eqz v4, :cond_1

    .line 524
    iget-object v15, v4, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    .line 525
    .local v15, "next":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    iget v0, v4, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v6, v21, v20

    .line 528
    .local v6, "idx":I
    if-nez v15, :cond_2

    .line 529
    aput-object v4, v14, v6

    .line 520
    .end local v6    # "idx":I
    .end local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 532
    .restart local v6    # "idx":I
    .restart local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :cond_2
    move-object v11, v4

    .line 533
    .local v11, "lastRun":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    move v10, v6

    .line 534
    .local v10, "lastIdx":I
    move-object v9, v15

    .local v9, "last":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_2
    if-eqz v9, :cond_4

    .line 535
    iget v0, v9, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v7, v21, v20

    .line 536
    .local v7, "k":I
    if-eq v7, v10, :cond_3

    .line 537
    move v10, v7

    .line 538
    move-object v11, v9

    .line 534
    :cond_3
    iget-object v9, v9, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_2

    .line 541
    .end local v7    # "k":I
    :cond_4
    aput-object v11, v14, v10

    .line 543
    move-object/from16 v18, v4

    .local v18, "p":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_3
    move-object/from16 v0, v18

    if-eq v0, v11, :cond_1

    .line 545
    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v8

    .line 546
    .local v8, "key":Ljava/lang/Object;, "TK;"
    if-nez v8, :cond_5

    .line 547
    add-int/lit8 v19, v19, 0x1

    .line 543
    :goto_4
    move-object/from16 v0, v18

    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-object/from16 v18, v0

    goto :goto_3

    .line 550
    :cond_5
    move-object/from16 v0, v18

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v7, v21, v20

    .line 551
    .restart local v7    # "k":I
    aget-object v13, v14, v7

    .line 552
    .local v13, "n":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    move-object/from16 v0, v18

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v8, v1, v13, v2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v21

    aput-object v21, v14, v7

    goto :goto_4

    .line 557
    .end local v4    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v6    # "idx":I
    .end local v7    # "k":I
    .end local v8    # "key":Ljava/lang/Object;, "TK;"
    .end local v9    # "last":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v10    # "lastIdx":I
    .end local v11    # "lastRun":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v13    # "n":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v18    # "p":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :cond_6
    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto/16 :goto_0
.end method

.method remove(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;
    .locals 12
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "refRemove"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Object;",
            "Z)TV;"
        }
    .end annotation

    .prologue
    .line 565
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->lock()V

    .line 567
    if-nez p4, :cond_0

    .line 568
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->removeStale()V

    .line 570
    :cond_0
    iget v10, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I

    add-int/lit8 v0, v10, -0x1

    .line 571
    .local v0, "c":I
    iget-object v8, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    .line 572
    .local v8, "tab":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    array-length v10, v8

    add-int/lit8 v10, v10, -0x1

    and-int v3, p2, v10

    .line 573
    .local v3, "index":I
    aget-object v2, v8, v3

    .line 574
    .local v2, "first":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    move-object v1, v2

    .line 576
    .local v1, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v1, :cond_2

    iget-object v10, v1, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->keyRef:Ljava/lang/Object;

    if-eq p1, v10, :cond_2

    if-nez p4, :cond_1

    iget v10, v1, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    if-ne p2, v10, :cond_1

    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v10

    invoke-static {p1, v10}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 578
    :cond_1
    iget-object v1, v1, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_0

    .line 581
    :cond_2
    const/4 v5, 0x0

    .line 582
    .local v5, "oldValue":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_6

    .line 583
    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v9

    .line 584
    .local v9, "v":Ljava/lang/Object;, "TV;"
    if-eqz p3, :cond_3

    invoke-virtual {p3, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 585
    :cond_3
    move-object v5, v9

    .line 588
    iget v10, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->modCount:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->modCount:I

    .line 589
    iget-object v4, v1, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    .line 590
    .local v4, "newFirst":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    move-object v6, v2

    .local v6, "p":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eq v6, v1, :cond_5

    .line 591
    invoke-virtual {v6}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v7

    .line 592
    .local v7, "pKey":Ljava/lang/Object;, "TK;"
    if-nez v7, :cond_4

    .line 593
    add-int/lit8 v0, v0, -0x1

    .line 590
    :goto_2
    iget-object v6, v6, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_1

    .line 597
    :cond_4
    iget v10, v6, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    invoke-virtual {v6}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {p0, v7, v10, v4, v11}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v4

    goto :goto_2

    .line 600
    .end local v7    # "pKey":Ljava/lang/Object;, "TK;"
    :cond_5
    aput-object v4, v8, v3

    .line 601
    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 606
    .end local v4    # "newFirst":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    .end local v6    # "p":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v9    # "v":Ljava/lang/Object;, "TV;"
    :cond_6
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    .line 604
    return-object v5

    .line 606
    .end local v0    # "c":I
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v2    # "first":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v3    # "index":I
    .end local v8    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v10

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    throw v10
.end method

.method removeStale()V
    .locals 5

    .prologue
    .line 613
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$WeakKeyReference;

    .local v0, "ref":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$WeakKeyReference;
    if-eqz v0, :cond_0

    .line 614
    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$WeakKeyReference;->keyRef()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$WeakKeyReference;->keyHash()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->remove(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;

    goto :goto_0

    .line 616
    :cond_0
    return-void
.end method

.method replace(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;)TV;"
        }
    .end annotation

    .prologue
    .line 439
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->lock()V

    .line 441
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->removeStale()V

    .line 442
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v0

    .line 443
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 444
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_0

    .line 447
    :cond_1
    const/4 v1, 0x0

    .line 448
    .local v1, "oldValue":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_2

    .line 449
    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v1

    .line 450
    invoke-virtual {v0, p3}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 454
    .end local v1    # "oldValue":Ljava/lang/Object;, "TV;"
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    .line 452
    return-object v1

    .line 454
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    throw v2
.end method

.method replace(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)Z
    .locals 3
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;TV;)Z"
        }
    .end annotation

    .prologue
    .line 419
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "oldValue":Ljava/lang/Object;, "TV;"
    .local p4, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->lock()V

    .line 421
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->removeStale()V

    .line 422
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    move-result-object v0

    .line 423
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 424
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    goto :goto_0

    .line 427
    :cond_1
    const/4 v1, 0x0

    .line 428
    .local v1, "replaced":Z
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 429
    const/4 v1, 0x1

    .line 430
    invoke-virtual {v0, p4}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 434
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    .line 432
    return v1

    .line 434
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    .end local v1    # "replaced":Z
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->unlock()V

    throw v2
.end method

.method setTable([Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 328
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment<TK;TV;>;"
    .local p1, "newTable":[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry<TK;TV;>;"
    array-length v0, p1

    int-to-float v0, v0

    iget v1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->loadFactor:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->threshold:I

    .line 329
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$HashEntry;

    .line 330
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$Segment;->refQueue:Ljava/lang/ref/ReferenceQueue;

    .line 331
    return-void
.end method
