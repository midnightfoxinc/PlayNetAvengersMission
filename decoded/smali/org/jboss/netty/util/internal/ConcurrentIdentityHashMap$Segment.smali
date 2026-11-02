.class final Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;
.super Ljava/util/concurrent/locks/ReentrantLock;
.source "ConcurrentIdentityHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;
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
.field private static final serialVersionUID:J = 0x4845ed18d1b49dffL


# instance fields
.field volatile transient count:I

.field final loadFactor:F

.field modCount:I

.field volatile transient table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
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
    .line 265
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 266
    iput p2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->loadFactor:F

    .line 267
    invoke-static {p1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->setTable([Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;)V

    .line 268
    return-void
.end method

.method private static keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "src"    # Ljava/lang/Object;
    .param p1, "dest"    # Ljava/lang/Object;

    .prologue
    .line 276
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;
    .locals 1
    .param p0, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)[",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 272
    new-array v0, p0, [Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;

    return-object v0
.end method


# virtual methods
.method clear()V
    .locals 3

    .prologue
    .line 571
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I

    if-eqz v2, :cond_1

    .line 572
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->lock()V

    .line 574
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 575
    .local v1, "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 576
    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 575
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 578
    :cond_0
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->modCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->modCount:I

    .line 579
    const/4 v2, 0x0

    iput v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 581
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    .line 584
    .end local v0    # "i":I
    .end local v1    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_1
    return-void

    .line 581
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    throw v2
.end method

.method containsKey(Ljava/lang/Object;I)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I

    .prologue
    .line 341
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I

    if-eqz v2, :cond_2

    .line 342
    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 343
    .local v1, "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    and-int/2addr v2, p2

    aget-object v0, v1, v2

    .line 344
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-eq v1, v2, :cond_1

    .line 345
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->containsKey(Ljava/lang/Object;I)Z

    move-result v2

    .line 354
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v1    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_0
    return v2

    .line 351
    .restart local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .restart local v1    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 347
    :cond_1
    if-eqz v0, :cond_2

    .line 348
    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 349
    const/4 v2, 0x1

    goto :goto_0

    .line 354
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v1    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method containsValue(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 358
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    iget v7, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I

    if-eqz v7, :cond_4

    .line 359
    iget-object v5, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 360
    .local v5, "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    move-object v0, v5

    .local v0, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_3

    aget-object v1, v0, v2

    .line 361
    .local v1, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v1, :cond_2

    .line 362
    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v4

    .line 365
    .local v4, "opaque":Ljava/lang/Object;, "TV;"
    if-nez v4, :cond_0

    .line 366
    invoke-virtual {p0, v1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;)Ljava/lang/Object;

    move-result-object v6

    .line 371
    .local v6, "v":Ljava/lang/Object;, "TV;"
    :goto_2
    invoke-virtual {p1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 372
    const/4 v7, 0x1

    .line 380
    .end local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "opaque":Ljava/lang/Object;, "TV;"
    .end local v5    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v6    # "v":Ljava/lang/Object;, "TV;"
    :goto_3
    return v7

    .line 368
    .restart local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .restart local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "opaque":Ljava/lang/Object;, "TV;"
    .restart local v5    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_0
    move-object v6, v4

    .restart local v6    # "v":Ljava/lang/Object;, "TV;"
    goto :goto_2

    .line 361
    :cond_1
    iget-object v1, v1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    goto :goto_1

    .line 360
    .end local v4    # "opaque":Ljava/lang/Object;, "TV;"
    .end local v6    # "v":Ljava/lang/Object;, "TV;"
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 376
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_3
    iget-object v7, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-eq v7, v5, :cond_4

    .line 377
    invoke-virtual {p0, p1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->containsValue(Ljava/lang/Object;)Z

    move-result v7

    goto :goto_3

    .line 380
    .end local v0    # "arr$":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_4
    const/4 v7, 0x0

    goto :goto_3
.end method

.method get(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 4
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
    .line 319
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    iget v3, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I

    if-eqz v3, :cond_3

    .line 320
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 321
    .local v2, "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    and-int/2addr v3, p2

    aget-object v0, v2, v3

    .line 322
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    iget-object v3, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-eq v2, v3, :cond_2

    .line 323
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 337
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v2    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_0
    :goto_0
    return-object v1

    .line 334
    .restart local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .restart local v2    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_1
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 325
    :cond_2
    if-eqz v0, :cond_3

    .line 326
    iget v3, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    if-ne v3, p2, :cond_1

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v3}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 327
    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v1

    .line 328
    .local v1, "opaque":Ljava/lang/Object;, "TV;"
    if-nez v1, :cond_0

    .line 332
    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 337
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v1    # "opaque":Ljava/lang/Object;, "TV;"
    .end local v2    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .locals 2
    .param p1, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 292
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 293
    .local v0, "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, p1

    aget-object v1, v0, v1

    return-object v1
.end method

.method newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .locals 1
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;TV;)",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 298
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "next":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .local p4, "value":Ljava/lang/Object;, "TV;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;-><init>(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;Ljava/lang/Object;)V

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
    .line 422
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->lock()V

    .line 424
    :try_start_0
    iget v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I

    .line 425
    .local v0, "c":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .local v1, "c":I
    iget v8, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->threshold:I

    if-le v0, v8, :cond_4

    .line 426
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->rehash()I

    move-result v6

    .line 427
    .local v6, "reduced":I
    if-lez v6, :cond_4

    .line 428
    sub-int v0, v1, v6

    .end local v1    # "c":I
    .restart local v0    # "c":I
    add-int/lit8 v8, v0, -0x1

    iput v8, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I

    .line 432
    .end local v6    # "reduced":I
    :goto_0
    iget-object v7, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 433
    .local v7, "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    array-length v8, v7

    add-int/lit8 v8, v8, -0x1

    and-int v4, p2, v8

    .line 434
    .local v4, "index":I
    aget-object v3, v7, v4

    .line 435
    .local v3, "first":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    move-object v2, v3

    .line 436
    .local v2, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v2, :cond_1

    iget v8, v2, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    if-ne v8, p2, :cond_0

    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v8

    invoke-static {p1, v8}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 437
    :cond_0
    iget-object v2, v2, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    goto :goto_1

    .line 441
    :cond_1
    if-eqz v2, :cond_3

    .line 442
    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v5

    .line 443
    .local v5, "oldValue":Ljava/lang/Object;, "TV;"
    if-nez p4, :cond_2

    .line 444
    invoke-virtual {v2, p3}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 454
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    .line 452
    return-object v5

    .line 447
    :cond_3
    const/4 v5, 0x0

    .line 448
    .restart local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    :try_start_1
    iget v8, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->modCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->modCount:I

    .line 449
    invoke-virtual {p0, p1, p2, v3, p3}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v8

    aput-object v8, v7, v4

    .line 450
    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 454
    .end local v0    # "c":I
    .end local v2    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v3    # "first":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v4    # "index":I
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    .end local v7    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v8

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    throw v8

    .restart local v1    # "c":I
    :cond_4
    move v0, v1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    goto :goto_0
.end method

.method readValueUnderLock(Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 308
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    .local p1, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->lock()V

    .line 310
    :try_start_0
    invoke-virtual {p1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 312
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    .line 310
    return-object v0

    .line 312
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    throw v0
.end method

.method rehash()I
    .locals 23

    .prologue
    .line 459
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-object/from16 v17, v0

    .line 460
    .local v17, "oldTable":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v16, v0

    .line 461
    .local v16, "oldCapacity":I
    const/high16 v21, 0x40000000    # 2.0f

    move/from16 v0, v16

    move/from16 v1, v21

    if-lt v0, v1, :cond_0

    .line 462
    const/16 v19, 0x0

    .line 521
    :goto_0
    return v19

    .line 478
    :cond_0
    shl-int/lit8 v21, v16, 0x1

    invoke-static/range {v21 .. v21}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v14

    .line 479
    .local v14, "newTable":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    array-length v0, v14

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->loadFactor:F

    move/from16 v22, v0

    mul-float v21, v21, v22

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->threshold:I

    .line 480
    array-length v0, v14

    move/from16 v21, v0

    add-int/lit8 v20, v21, -0x1

    .line 481
    .local v20, "sizeMask":I
    const/16 v19, 0x0

    .line 482
    .local v19, "reduce":I
    move-object/from16 v3, v17

    .local v3, "arr$":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    array-length v12, v3

    .local v12, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1
    if-ge v5, v12, :cond_6

    aget-object v4, v3, v5

    .line 485
    .local v4, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    if-eqz v4, :cond_1

    .line 486
    iget-object v15, v4, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 487
    .local v15, "next":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    iget v0, v4, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v6, v21, v20

    .line 490
    .local v6, "idx":I
    if-nez v15, :cond_2

    .line 491
    aput-object v4, v14, v6

    .line 482
    .end local v6    # "idx":I
    .end local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 494
    .restart local v6    # "idx":I
    .restart local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_2
    move-object v11, v4

    .line 495
    .local v11, "lastRun":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    move v10, v6

    .line 496
    .local v10, "lastIdx":I
    move-object v9, v15

    .local v9, "last":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_2
    if-eqz v9, :cond_4

    .line 497
    iget v0, v9, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v7, v21, v20

    .line 498
    .local v7, "k":I
    if-eq v7, v10, :cond_3

    .line 499
    move v10, v7

    .line 500
    move-object v11, v9

    .line 496
    :cond_3
    iget-object v9, v9, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    goto :goto_2

    .line 503
    .end local v7    # "k":I
    :cond_4
    aput-object v11, v14, v10

    .line 505
    move-object/from16 v18, v4

    .local v18, "p":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_3
    move-object/from16 v0, v18

    if-eq v0, v11, :cond_1

    .line 507
    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v8

    .line 508
    .local v8, "key":Ljava/lang/Object;, "TK;"
    if-nez v8, :cond_5

    .line 509
    add-int/lit8 v19, v19, 0x1

    .line 505
    :goto_4
    move-object/from16 v0, v18

    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-object/from16 v18, v0

    goto :goto_3

    .line 512
    :cond_5
    move-object/from16 v0, v18

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    and-int v7, v21, v20

    .line 513
    .restart local v7    # "k":I
    aget-object v13, v14, v7

    .line 514
    .local v13, "n":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    move-object/from16 v0, v18

    iget v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    move/from16 v21, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v8, v1, v13, v2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v21

    aput-object v21, v14, v7

    goto :goto_4

    .line 519
    .end local v4    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v6    # "idx":I
    .end local v7    # "k":I
    .end local v8    # "key":Ljava/lang/Object;, "TK;"
    .end local v9    # "last":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v10    # "lastIdx":I
    .end local v11    # "lastRun":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v13    # "n":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v15    # "next":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v18    # "p":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :cond_6
    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 520
    const/16 v21, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

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
    .line 528
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->lock()V

    .line 530
    :try_start_0
    iget v10, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I

    add-int/lit8 v0, v10, -0x1

    .line 531
    .local v0, "c":I
    iget-object v8, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 532
    .local v8, "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    array-length v10, v8

    add-int/lit8 v10, v10, -0x1

    and-int v3, p2, v10

    .line 533
    .local v3, "index":I
    aget-object v2, v8, v3

    .line 534
    .local v2, "first":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    move-object v1, v2

    .line 536
    .local v1, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v1, :cond_1

    iget-object v10, v1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key:Ljava/lang/Object;

    if-eq p1, v10, :cond_1

    if-nez p4, :cond_0

    iget v10, v1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    if-ne p2, v10, :cond_0

    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v10

    invoke-static {p1, v10}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 538
    :cond_0
    iget-object v1, v1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    goto :goto_0

    .line 541
    :cond_1
    const/4 v5, 0x0

    .line 542
    .local v5, "oldValue":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_5

    .line 543
    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v9

    .line 544
    .local v9, "v":Ljava/lang/Object;, "TV;"
    if-eqz p3, :cond_2

    invoke-virtual {p3, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 545
    :cond_2
    move-object v5, v9

    .line 548
    iget v10, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->modCount:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->modCount:I

    .line 549
    iget-object v4, v1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 550
    .local v4, "newFirst":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    move-object v6, v2

    .local v6, "p":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eq v6, v1, :cond_4

    .line 551
    invoke-virtual {v6}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v7

    .line 552
    .local v7, "pKey":Ljava/lang/Object;, "TK;"
    if-nez v7, :cond_3

    .line 553
    add-int/lit8 v0, v0, -0x1

    .line 550
    :goto_2
    iget-object v6, v6, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    goto :goto_1

    .line 557
    :cond_3
    iget v10, v6, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    invoke-virtual {v6}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {p0, v7, v10, v4, v11}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->newHashEntry(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;Ljava/lang/Object;)Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v4

    goto :goto_2

    .line 560
    .end local v7    # "pKey":Ljava/lang/Object;, "TK;"
    :cond_4
    aput-object v4, v8, v3

    .line 561
    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 566
    .end local v4    # "newFirst":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v5    # "oldValue":Ljava/lang/Object;, "TV;"
    .end local v6    # "p":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v9    # "v":Ljava/lang/Object;, "TV;"
    :cond_5
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    .line 564
    return-object v5

    .line 566
    .end local v0    # "c":I
    .end local v1    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v2    # "first":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v3    # "index":I
    .end local v8    # "tab":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v10

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

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
    .line 403
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->lock()V

    .line 405
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v0

    .line 406
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 407
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    goto :goto_0

    .line 410
    :cond_1
    const/4 v1, 0x0

    .line 411
    .local v1, "oldValue":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_2

    .line 412
    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v1

    .line 413
    invoke-virtual {v0, p3}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 417
    .end local v1    # "oldValue":Ljava/lang/Object;, "TV;"
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    .line 415
    return-object v1

    .line 417
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

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
    .line 384
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "oldValue":Ljava/lang/Object;, "TV;"
    .local p4, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->lock()V

    .line 386
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->getFirst(I)Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v0

    .line 387
    .local v0, "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_1

    iget v2, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    if-ne v2, p2, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->keyEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 388
    :cond_0
    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    goto :goto_0

    .line 391
    :cond_1
    const/4 v1, 0x0

    .line 392
    .local v1, "replaced":Z
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 393
    const/4 v1, 0x1

    .line 394
    invoke-virtual {v0, p4}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 398
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    .line 396
    return v1

    .line 398
    .end local v0    # "e":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .end local v1    # "replaced":Z
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->unlock()V

    throw v2
.end method

.method setTable([Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 284
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    .local p1, "newTable":[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    array-length v0, p1

    int-to-float v0, v0

    iget v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->loadFactor:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->threshold:I

    .line 285
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 286
    return-void
.end method
