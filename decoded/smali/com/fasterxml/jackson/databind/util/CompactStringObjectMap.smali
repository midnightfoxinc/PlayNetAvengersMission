.class public final Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;
.super Ljava/lang/Object;
.source "CompactStringObjectMap.java"


# static fields
.field private static final EMPTY:Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;


# instance fields
.field private final _hashArea:[Ljava/lang/Object;

.field private final _hashMask:I

.field private final _spillCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 22
    new-instance v0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2, v3}, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;-><init>(II[Ljava/lang/Object;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->EMPTY:Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;

    return-void
.end method

.method private constructor <init>(II[Ljava/lang/Object;)V
    .locals 0
    .param p1, "hashMask"    # I
    .param p2, "spillCount"    # I
    .param p3, "hashArea"    # [Ljava/lang/Object;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput p1, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashMask:I

    .line 32
    iput p2, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_spillCount:I

    .line 33
    iput-object p3, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    .line 34
    return-void
.end method

.method private final _find2(Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "slot"    # I
    .param p3, "match"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 103
    if-nez p3, :cond_1

    .line 121
    :cond_0
    :goto_0
    return-object v4

    .line 106
    :cond_1
    iget v5, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashMask:I

    add-int/lit8 v1, v5, 0x1

    .line 107
    .local v1, "hashSize":I
    shr-int/lit8 v5, p2, 0x1

    add-int/2addr v5, v1

    shl-int/lit8 v3, v5, 0x1

    .line 108
    .local v3, "ix":I
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    aget-object p3, v5, v3

    .line 109
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 110
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    add-int/lit8 v5, v3, 0x1

    aget-object v4, v4, v5

    goto :goto_0

    .line 112
    :cond_2
    if-eqz p3, :cond_0

    .line 113
    shr-int/lit8 v5, v1, 0x1

    add-int/2addr v5, v1

    shl-int/lit8 v2, v5, 0x1

    .line 114
    .local v2, "i":I
    iget v5, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_spillCount:I

    add-int v0, v2, v5

    .local v0, "end":I
    :goto_1
    if-ge v2, v0, :cond_0

    .line 115
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    aget-object p3, v5, v2

    .line 116
    if-eq p3, p1, :cond_3

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 117
    :cond_3
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    add-int/lit8 v5, v2, 0x1

    aget-object v4, v4, v5

    goto :goto_0

    .line 114
    :cond_4
    add-int/lit8 v2, v2, 0x2

    goto :goto_1
.end method

.method public static construct(Ljava/util/Map;)Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TT;>;)",
            "Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "all":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;TT;>;"
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 39
    sget-object v10, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->EMPTY:Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;

    .line 72
    :goto_0
    return-object v10

    .line 43
    :cond_0
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v10

    invoke-static {v10}, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->findSize(I)I

    move-result v7

    .line 44
    .local v7, "size":I
    add-int/lit8 v6, v7, -0x1

    .line 46
    .local v6, "mask":I
    shr-int/lit8 v10, v7, 0x1

    add-int/2addr v10, v7

    mul-int/lit8 v0, v10, 0x2

    .line 47
    .local v0, "alloc":I
    new-array v2, v0, [Ljava/lang/Object;

    .line 48
    .local v2, "hashArea":[Ljava/lang/Object;
    const/4 v9, 0x0

    .line 50
    .local v9, "spillCount":I
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 51
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;TT;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 53
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v10

    and-int v8, v10, v6

    .line 54
    .local v8, "slot":I
    add-int v4, v8, v8

    .line 57
    .local v4, "ix":I
    aget-object v10, v2, v4

    if-eqz v10, :cond_1

    .line 59
    shr-int/lit8 v10, v8, 0x1

    add-int/2addr v10, v7

    shl-int/lit8 v4, v10, 0x1

    .line 60
    aget-object v10, v2, v4

    if-eqz v10, :cond_1

    .line 62
    shr-int/lit8 v10, v7, 0x1

    add-int/2addr v10, v7

    shl-int/lit8 v10, v10, 0x1

    add-int v4, v10, v9

    .line 63
    add-int/lit8 v9, v9, 0x2

    .line 64
    array-length v10, v2

    if-lt v4, v10, :cond_1

    .line 65
    array-length v10, v2

    add-int/lit8 v10, v10, 0x4

    invoke-static {v2, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    .line 69
    :cond_1
    aput-object v5, v2, v4

    .line 70
    add-int/lit8 v10, v4, 0x1

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    aput-object v11, v2, v10

    goto :goto_1

    .line 72
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;TT;>;"
    .end local v4    # "ix":I
    .end local v5    # "key":Ljava/lang/String;
    .end local v8    # "slot":I
    :cond_2
    new-instance v10, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;

    invoke-direct {v10, v6, v9, v2}, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;-><init>(II[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static final findSize(I)I
    .locals 3
    .param p0, "size"    # I

    .prologue
    .line 77
    const/4 v2, 0x5

    if-gt p0, v2, :cond_1

    .line 78
    const/16 v1, 0x8

    .line 88
    :cond_0
    :goto_0
    return v1

    .line 80
    :cond_1
    const/16 v2, 0xc

    if-gt p0, v2, :cond_2

    .line 81
    const/16 v1, 0x10

    goto :goto_0

    .line 83
    :cond_2
    shr-int/lit8 v2, p0, 0x2

    add-int v0, p0, v2

    .line 84
    .local v0, "needed":I
    const/16 v1, 0x20

    .line 85
    .local v1, "result":I
    :goto_1
    if-ge v1, v0, :cond_0

    .line 86
    add-int/2addr v1, v1

    goto :goto_1
.end method


# virtual methods
.method public find(Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v3

    iget v4, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashMask:I

    and-int v2, v3, v4

    .line 93
    .local v2, "slot":I
    shl-int/lit8 v0, v2, 0x1

    .line 94
    .local v0, "ix":I
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    aget-object v1, v3, v0

    .line 95
    .local v1, "match":Ljava/lang/Object;
    if-eq v1, p1, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 96
    :cond_0
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    add-int/lit8 v4, v0, 0x1

    aget-object v3, v3, v4

    .line 98
    :goto_0
    return-object v3

    :cond_1
    invoke-direct {p0, p1, v2, v1}, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_find2(Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0
.end method

.method public keys()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 125
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    array-length v0, v4

    .line 126
    .local v0, "end":I
    new-instance v3, Ljava/util/ArrayList;

    shr-int/lit8 v4, v0, 0x2

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 127
    .local v3, "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 128
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/util/CompactStringObjectMap;->_hashArea:[Ljava/lang/Object;

    aget-object v2, v4, v1

    .line 129
    .local v2, "key":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 130
    check-cast v2, Ljava/lang/String;

    .end local v2    # "key":Ljava/lang/Object;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    :cond_0
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 133
    :cond_1
    return-object v3
.end method
