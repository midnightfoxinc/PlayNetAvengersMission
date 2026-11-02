.class final Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
.super Ljava/util/concurrent/locks/ReentrantLock;
.source "ConcurrentHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentHashMap;
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
.field private static final serialVersionUID:J = -0x1bc7a7ae5c5faaabL


# instance fields
.field volatile transient count:I

.field final loadFactor:F

.field modCount:I

.field volatile transient table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
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
    .line 263
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 264
    iput p2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->loadFactor:F

    .line 265
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->setTable([Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;)V

    .line 266
    return-void
.end method

.method private static keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "src"    # Ljava/lang/Object;
    .param p1, "dest"    # Ljava/lang/Object;

    .prologue
    .line 274
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;
    .locals 1
    .param p0, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)[",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 270
    new-array v0, p0, [Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;

    return-object v0
.end method


# virtual methods
.method clear()V
    .locals 3

    .prologue
    .line 556
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    if-eqz v2, :cond_1

    .line 557
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->lock()V

    .line 559
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 560
    .local v1, "tab":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 561
    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 560
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 563
    :cond_0
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    .line 564
    const/4 v2, 0x0

    iput v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 566
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 569
    .end local v0    # "i":I
    .end local v1    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :cond_1
    return-void

    .line 566
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    throw v2
.end method

.method containsKey(Ljava/lang/Object;I)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I

    .prologue
    .line 335
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    iget v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    if-eqz v1, :cond_1

    .line 336
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v0

    .line 337
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    .line 338
    iget v1, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    if-ne v1, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 339
    const/4 v1, 0x1

    .line 344
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_1
    return v1

    .line 341
    .restart local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_0

    .line 344
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method containsValue(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 348
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    iget v6, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    if-eqz v6, :cond_3

    .line 349
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .local v0, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_3

    aget-object v1, v0, v2

    .line 350
    .local v1, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v1, :cond_2

    .line 351
    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v4

    .line 354
    .local v4, "opaque":Ljava/lang/Object;, "TV;"
    if-nez v4, :cond_0

    .line 355
    invoke-virtual {p0, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;)Ljava/lang/Object;

    move-result-object v5

    .line 360
    .local v5, "v":Ljava/lang/Object;, "TV;"
    :goto_2
    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 361
    const/4 v6, 0x1

    .line 366
    .end local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "opaque":Ljava/lang/Object;, "TV;"
    .end local v5    # "v":Ljava/lang/Object;, "TV;"
    :goto_3
    return v6

    .line 357
    .restart local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .restart local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "opaque":Ljava/lang/Object;, "TV;"
    :cond_0
    move-object v5, v4

    .restart local v5    # "v":Ljava/lang/Object;, "TV;"
    goto :goto_2

    .line 350
    :cond_1
    iget-object v1, v1, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_1

    .line 349
    .end local v4    # "opaque":Ljava/lang/Object;, "TV;"
    .end local v5    # "v":Ljava/lang/Object;, "TV;"
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 366
    .end local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
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
    .line 317
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    if-eqz v2, :cond_2

    .line 318
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v0

    .line 319
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_2

    .line 320
    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_1

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 321
    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v1

    .line 322
    .local v1, "opaque":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_0

    .line 331
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v1    # "opaque":Ljava/lang/Object;, "TV;"
    :goto_1
    return-object v1

    .line 326
    .restart local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .restart local v1    # "opaque":Ljava/lang/Object;, "TV;"
    :cond_0
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 328
    .end local v1    # "opaque":Ljava/lang/Object;, "TV;"
    :cond_1
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_0

    .line 331
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .locals 2
    .param p1, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 290
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 291
    .local v0, "tab":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, p1

    aget-object v1, v0, v1

    return-object v1
.end method

.method newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    .locals 1
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;TV;)",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 296
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "next":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .local p4, "value":Ljava/lang/Object;, "TV;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;-><init>(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;Ljava/lang/Object;)V

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
    .line 408
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->lock()V

    .line 410
    :try_start_0
    iget v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    .line 411
    .local v0, "c":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .local v1, "c":I
    iget v8, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->threshold:I

    if-le v0, v8, :cond_4

    .line 412
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->rehash()I

    move-result v6

    .line 413
    .local v6, "reduced":I
    if-lez v6, :cond_4

    .line 414
    sub-int v0, v1, v6

    .end local v1    # "c":I
    .restart local v0    # "c":I
    add-int/lit8 v8, v0, -0x1

    iput v8, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    .line 418
    .end local v6    # "reduced":I
    :goto_0
    iget-object v7, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 419
    .local v7, "tab":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    array-length v8, v7

    add-int/lit8 v8, v8, -0x1

    and-int v4, p2, v8

    .line 420
    .local v4, "index":I
    aget-object v3, v7, v4

    .line 421
    .local v3, "first":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    move-object v2, v3

    .line 422
    .local v2, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v2, :cond_1

    iget v8, v2, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    if-ne v8, p2, :cond_0

    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v8

    invoke-static {p1, v8}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 423
    :cond_0
    iget-object v2, v2, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_1

    .line 427
    :cond_1
    if-eqz v2, :cond_3

    .line 428
    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v5

    .line 429
    .local v5, "oldValue":Ljava/lang/Object;, "TV;"
    if-nez p4, :cond_2

    .line 430
    invoke-virtual {v2, p3}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 440
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 438
    return-object v5

    .line 433
    :cond_3
    const/4 v5, 0x0

    .line 434
    .restart local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    :try_start_1
    iget v8, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    .line 435
    invoke-virtual {p0, p1, p2, v3, p3}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v8

    aput-object v8, v7, v4

    .line 436
    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 440
    .end local v0    # "c":I
    .end local v2    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v3    # "first":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v4    # "index":I
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    .end local v7    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v8

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    throw v8

    .restart local v1    # "c":I
    :cond_4
    move v0, v1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    goto :goto_0
.end method

.method readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 306
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    .local p1, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->lock()V

    .line 308
    :try_start_0
    invoke-virtual {p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 310
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 308
    return-object v0

    .line 310
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    throw v0
.end method

.method rehash()I
    .locals 23

    .prologue
    .line 445
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-object/from16 v17, v0

    .line 446
    .local v17, "oldTable":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v16, v0

    .line 447
    .local v16, "oldCapacity":I
    const/high16 v21, 0x40000000    # 2.0f

    move/from16 v0, v16

    move/from16 v1, v21

    if-lt v0, v1, :cond_0

    .line 448
    const/16 v19, 0x0

    .line 506
    :goto_0
    return v19

    .line 464
    :cond_0
    shl-int/lit8 v21, v16, 0x1

    invoke-static/range {v21 .. v21}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v14

    .line 465
    .local v14, "newTable":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    array-length v0, v14

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->loadFactor:F

    move/from16 v22, v0

    mul-float v21, v21, v22

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->threshold:I

    .line 466
    array-length v0, v14

    move/from16 v21, v0

    add-int/lit8 v20, v21, -0x1

    .line 467
    .local v20, "sizeMask":I
    const/16 v19, 0x0

    .line 468
    .local v19, "reduce":I
    move-object/from16 v3, v17

    .local v3, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;
    array-length v12, v3

    .local v12, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1
    if-ge v5, v12, :cond_6

    aget-object v4, v3, v5

    .line 471
    .local v4, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    if-eqz v4, :cond_1

    .line 472
    iget-object v15, v4, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 473
    .local v15, "next":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    iget v0, v4, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v6, v21, v20

    .line 476
    .local v6, "idx":I
    if-nez v15, :cond_2

    .line 477
    aput-object v4, v14, v6

    .line 468
    .end local v6    # "idx":I
    .end local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 480
    .restart local v6    # "idx":I
    .restart local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :cond_2
    move-object v11, v4

    .line 481
    .local v11, "lastRun":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    move v10, v6

    .line 482
    .local v10, "lastIdx":I
    move-object v9, v15

    .local v9, "last":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_2
    if-eqz v9, :cond_4

    .line 483
    iget v0, v9, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v7, v21, v20

    .line 484
    .local v7, "k":I
    if-eq v7, v10, :cond_3

    .line 485
    move v10, v7

    .line 486
    move-object v11, v9

    .line 482
    :cond_3
    iget-object v9, v9, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_2

    .line 489
    .end local v7    # "k":I
    :cond_4
    aput-object v11, v14, v10

    .line 491
    move-object/from16 v18, v4

    .local v18, "p":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_3
    move-object/from16 v0, v18

    if-eq v0, v11, :cond_1

    .line 493
    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v8

    .line 494
    .local v8, "key":Ljava/lang/Object;, "TK;"
    if-nez v8, :cond_5

    .line 495
    add-int/lit8 v19, v19, 0x1

    .line 491
    :goto_4
    move-object/from16 v0, v18

    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-object/from16 v18, v0

    goto :goto_3

    .line 498
    :cond_5
    move-object/from16 v0, v18

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v7, v21, v20

    .line 499
    .restart local v7    # "k":I
    aget-object v13, v14, v7

    .line 500
    .local v13, "n":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    move-object/from16 v0, v18

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v8, v1, v13, v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v21

    aput-object v21, v14, v7

    goto :goto_4

    .line 505
    .end local v4    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v6    # "idx":I
    .end local v7    # "k":I
    .end local v8    # "key":Ljava/lang/Object;, "TK;"
    .end local v9    # "last":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v10    # "lastIdx":I
    .end local v11    # "lastRun":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v13    # "n":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v18    # "p":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :cond_6
    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

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
    .line 513
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->lock()V

    .line 515
    :try_start_0
    iget v10, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I

    add-int/lit8 v0, v10, -0x1

    .line 516
    .local v0, "c":I
    iget-object v8, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 517
    .local v8, "tab":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    array-length v10, v8

    add-int/lit8 v10, v10, -0x1

    and-int v3, p2, v10

    .line 518
    .local v3, "index":I
    aget-object v2, v8, v3

    .line 519
    .local v2, "first":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    move-object v1, v2

    .line 521
    .local v1, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v1, :cond_1

    iget-object v10, v1, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key:Ljava/lang/Object;

    if-eq p1, v10, :cond_1

    if-nez p4, :cond_0

    iget v10, v1, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    if-ne p2, v10, :cond_0

    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v10

    invoke-static {p1, v10}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 523
    :cond_0
    iget-object v1, v1, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_0

    .line 526
    :cond_1
    const/4 v5, 0x0

    .line 527
    .local v5, "oldValue":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_5

    .line 528
    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v9

    .line 529
    .local v9, "v":Ljava/lang/Object;, "TV;"
    if-eqz p3, :cond_2

    invoke-virtual {p3, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 530
    :cond_2
    move-object v5, v9

    .line 533
    iget v10, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->modCount:I

    .line 534
    iget-object v4, v1, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 535
    .local v4, "newFirst":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    move-object v6, v2

    .local v6, "p":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eq v6, v1, :cond_4

    .line 536
    invoke-virtual {v6}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v7

    .line 537
    .local v7, "pKey":Ljava/lang/Object;, "TK;"
    if-nez v7, :cond_3

    .line 538
    add-int/lit8 v0, v0, -0x1

    .line 535
    :goto_2
    iget-object v6, v6, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_1

    .line 542
    :cond_3
    iget v10, v6, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    invoke-virtual {v6}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {p0, v7, v10, v4, v11}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v4

    goto :goto_2

    .line 545
    .end local v7    # "pKey":Ljava/lang/Object;, "TK;"
    :cond_4
    aput-object v4, v8, v3

    .line 546
    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 551
    .end local v4    # "newFirst":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    .end local v6    # "p":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v9    # "v":Ljava/lang/Object;, "TV;"
    :cond_5
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 549
    return-object v5

    .line 551
    .end local v0    # "c":I
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v2    # "first":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v3    # "index":I
    .end local v8    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v10

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    throw v10
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
    .line 389
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->lock()V

    .line 391
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v0

    .line 392
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 393
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_0

    .line 396
    :cond_1
    const/4 v1, 0x0

    .line 397
    .local v1, "oldValue":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_2

    .line 398
    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v1

    .line 399
    invoke-virtual {v0, p3}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 403
    .end local v1    # "oldValue":Ljava/lang/Object;, "TV;"
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 401
    return-object v1

    .line 403
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

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
    .line 370
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "oldValue":Ljava/lang/Object;, "TV;"
    .local p4, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->lock()V

    .line 372
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    move-result-object v0

    .line 373
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 374
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    goto :goto_0

    .line 377
    :cond_1
    const/4 v1, 0x0

    .line 378
    .local v1, "replaced":Z
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 379
    const/4 v1, 0x1

    .line 380
    invoke-virtual {v0, p4}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 384
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    .line 382
    return v1

    .line 384
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    .end local v1    # "replaced":Z
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->unlock()V

    throw v2
.end method

.method setTable([Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 282
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment<TK;TV;>;"
    .local p1, "newTable":[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry<TK;TV;>;"
    array-length v0, p1

    int-to-float v0, v0

    iget v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->loadFactor:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->threshold:I

    .line 283
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentHashMap$HashEntry;

    .line 284
    return-void
.end method
