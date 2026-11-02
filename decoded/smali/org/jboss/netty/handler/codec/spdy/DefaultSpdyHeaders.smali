.class public Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;
.super Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
.source "DefaultSpdyHeaders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$1;,
        Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;,
        Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderIterator;
    }
.end annotation


# static fields
.field private static final BUCKET_SIZE:I = 0x11


# instance fields
.field private final entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

.field private final head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 82
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;-><init>()V

    .line 79
    const/16 v0, 0x11

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 80
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v2, v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 83
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v2, v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v2, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 84
    return-void
.end method

.method static synthetic access$100(Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;)Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;

    .prologue
    .line 28
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    return-object v0
.end method

.method private add0(IILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "h"    # I
    .param p2, "i"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    aget-object v0, v2, p2

    .line 102
    .local v0, "e":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    new-instance v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    invoke-direct {v1, p1, p3, p4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .local v1, "newEntry":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    aput-object v1, v2, p2

    .line 103
    iput-object v0, v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 106
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->addBefore(Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;)V

    .line 107
    return-void
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p0, "name1"    # Ljava/lang/String;
    .param p1, "name2"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x5a

    const/16 v6, 0x41

    const/4 v4, 0x0

    .line 52
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 53
    .local v3, "nameLen":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-eq v3, v5, :cond_1

    .line 72
    :cond_0
    :goto_0
    return v4

    .line 57
    :cond_1
    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_1
    if-ltz v2, :cond_5

    .line 58
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 59
    .local v0, "c1":C
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 60
    .local v1, "c2":C
    if-eq v0, v1, :cond_4

    .line 61
    if-lt v0, v6, :cond_2

    if-gt v0, v7, :cond_2

    .line 62
    add-int/lit8 v5, v0, 0x20

    int-to-char v0, v5

    .line 64
    :cond_2
    if-lt v1, v6, :cond_3

    if-gt v1, v7, :cond_3

    .line 65
    add-int/lit8 v5, v1, 0x20

    int-to-char v1, v5

    .line 67
    :cond_3
    if-ne v0, v1, :cond_0

    .line 57
    :cond_4
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 72
    .end local v0    # "c1":C
    .end local v1    # "c2":C
    :cond_5
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private static hash(Ljava/lang/String;)I
    .locals 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const/4 v1, 0x0

    .line 34
    .local v1, "h":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_1

    .line 35
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 36
    .local v0, "c":C
    const/16 v3, 0x41

    if-lt v0, v3, :cond_0

    const/16 v3, 0x5a

    if-gt v0, v3, :cond_0

    .line 37
    add-int/lit8 v3, v0, 0x20

    int-to-char v0, v3

    .line 39
    :cond_0
    mul-int/lit8 v3, v1, 0x1f

    add-int v1, v3, v0

    .line 34
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 42
    .end local v0    # "c":C
    :cond_1
    if-lez v1, :cond_2

    .line 47
    .end local v1    # "h":I
    :goto_1
    return v1

    .line 44
    .restart local v1    # "h":I
    :cond_2
    const/high16 v3, -0x80000000

    if-ne v1, v3, :cond_3

    .line 45
    const v1, 0x7fffffff

    goto :goto_1

    .line 47
    :cond_3
    neg-int v1, v1

    goto :goto_1
.end method

.method private static index(I)I
    .locals 1
    .param p0, "hash"    # I

    .prologue
    .line 76
    rem-int/lit8 v0, p0, 0x11

    return v0
.end method

.method private remove0(IILjava/lang/String;)V
    .locals 4
    .param p1, "h"    # I
    .param p2, "i"    # I
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 122
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    aget-object v0, v2, p2

    .line 123
    .local v0, "e":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    if-nez v0, :cond_0

    .line 155
    :goto_0
    return-void

    .line 128
    :cond_0
    :goto_1
    iget v2, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->hash:I

    if-ne v2, p1, :cond_3

    iget-object v2, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p3, v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 129
    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->remove()V

    .line 130
    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 131
    .local v1, "next":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    if-eqz v1, :cond_1

    .line 132
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    aput-object v1, v2, p2

    .line 133
    move-object v0, v1

    goto :goto_1

    .line 135
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    const/4 v3, 0x0

    aput-object v3, v2, p2

    goto :goto_0

    .line 148
    :cond_2
    iget v2, v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->hash:I

    if-ne v2, p1, :cond_4

    iget-object v2, v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p3, v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 149
    iget-object v2, v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v2, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 150
    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->remove()V

    .line 144
    .end local v1    # "next":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    :cond_3
    :goto_2
    iget-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 145
    .restart local v1    # "next":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    if-nez v1, :cond_2

    goto :goto_0

    .line 152
    :cond_4
    move-object v0, v1

    goto :goto_2
.end method

.method private static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 296
    if-nez p0, :cond_0

    .line 297
    const/4 v0, 0x0

    .line 299
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;"
        }
    .end annotation

    .prologue
    .line 279
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderValue(Ljava/lang/String;)V

    .line 280
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->hash(Ljava/lang/String;)I

    move-result v0

    .line 281
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->index(I)I

    move-result v1

    .line 282
    .local v1, "i":I
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 283
    .local v3, "v":Ljava/lang/Object;
    invoke-static {v3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 284
    .local v4, "vstr":Ljava/lang/String;
    invoke-static {v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderValue(Ljava/lang/String;)V

    .line 285
    invoke-direct {p0, v0, v1, p1, v4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->add0(IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 287
    .end local v3    # "v":Ljava/lang/Object;
    .end local v4    # "vstr":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 88
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "lowerCaseName":Ljava/lang/String;
    invoke-static {v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderName(Ljava/lang/String;)V

    .line 90
    invoke-static {p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 91
    .local v3, "strVal":Ljava/lang/String;
    invoke-static {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderValue(Ljava/lang/String;)V

    .line 92
    invoke-static {v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->hash(Ljava/lang/String;)I

    move-result v0

    .line 93
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->index(I)I

    move-result v1

    .line 94
    .local v1, "i":I
    invoke-direct {p0, v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->add0(IILjava/lang/String;Ljava/lang/String;)V

    .line 95
    return-object p0
.end method

.method public clear()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .locals 4

    .prologue
    .line 196
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 197
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 196
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 199
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v3, v2, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v3, v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 200
    return-object p0
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 262
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public entries()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 244
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 247
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v1, v2, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 248
    .local v1, "e":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    if-eq v1, v2, :cond_0

    .line 249
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    iget-object v1, v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    goto :goto_0

    .line 252
    :cond_0
    return-object v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 205
    if-nez p1, :cond_0

    .line 206
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "name"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 209
    :cond_0
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->hash(Ljava/lang/String;)I

    move-result v1

    .line 210
    .local v1, "h":I
    invoke-static {v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->index(I)I

    move-result v2

    .line 211
    .local v2, "i":I
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    aget-object v0, v3, v2

    .line 212
    .local v0, "e":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    :goto_0
    if-eqz v0, :cond_2

    .line 213
    iget v3, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->hash:I

    if-ne v3, v1, :cond_1

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p1, v3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 214
    iget-object v3, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->value:Ljava/lang/String;

    .line 219
    :goto_1
    return-object v3

    .line 217
    :cond_1
    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    goto :goto_0

    .line 219
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getAll(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 224
    if-nez p1, :cond_0

    .line 225
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "name"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 228
    :cond_0
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 230
    .local v3, "values":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->hash(Ljava/lang/String;)I

    move-result v1

    .line 231
    .local v1, "h":I
    invoke-static {v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->index(I)I

    move-result v2

    .line 232
    .local v2, "i":I
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->entries:[Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    aget-object v0, v4, v2

    .line 233
    .local v0, "e":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    :goto_0
    if-eqz v0, :cond_2

    .line 234
    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->hash:I

    if-ne v4, v1, :cond_1

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p1, v4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 235
    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 237
    :cond_1
    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    goto :goto_0

    .line 239
    :cond_2
    return-object v3
.end method

.method public isEmpty()Z
    .locals 2

    .prologue
    .line 292
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v1, v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 257
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderIterator;-><init>(Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$1;)V

    return-object v0
.end method

.method public names()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 267
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 269
    .local v1, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v0, v2, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 270
    .local v0, "e":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->head:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    if-eq v0, v2, :cond_0

    .line 271
    iget-object v2, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 272
    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    goto :goto_0

    .line 274
    :cond_0
    return-object v1
.end method

.method public remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 111
    if-nez p1, :cond_0

    .line 112
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "name"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 114
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 115
    .local v2, "lowerCaseName":Ljava/lang/String;
    invoke-static {v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->hash(Ljava/lang/String;)I

    move-result v0

    .line 116
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->index(I)I

    move-result v1

    .line 117
    .local v1, "i":I
    invoke-direct {p0, v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->remove0(IILjava/lang/String;)V

    .line 118
    return-object p0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;"
        }
    .end annotation

    .prologue
    .line 172
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    if-nez p2, :cond_0

    .line 173
    new-instance v6, Ljava/lang/NullPointerException;

    const-string v7, "values"

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 176
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 177
    .local v3, "lowerCaseName":Ljava/lang/String;
    invoke-static {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderName(Ljava/lang/String;)V

    .line 179
    invoke-static {v3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->hash(Ljava/lang/String;)I

    move-result v0

    .line 180
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->index(I)I

    move-result v1

    .line 182
    .local v1, "i":I
    invoke-direct {p0, v0, v1, v3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->remove0(IILjava/lang/String;)V

    .line 183
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 184
    .local v5, "v":Ljava/lang/Object;
    if-nez v5, :cond_2

    .line 191
    .end local v5    # "v":Ljava/lang/Object;
    :cond_1
    return-object p0

    .line 187
    .restart local v5    # "v":Ljava/lang/Object;
    :cond_2
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 188
    .local v4, "strVal":Ljava/lang/String;
    invoke-static {v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderValue(Ljava/lang/String;)V

    .line 189
    invoke-direct {p0, v0, v1, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->add0(IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 159
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 160
    .local v2, "lowerCaseName":Ljava/lang/String;
    invoke-static {v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderName(Ljava/lang/String;)V

    .line 161
    invoke-static {p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 162
    .local v3, "strVal":Ljava/lang/String;
    invoke-static {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderValue(Ljava/lang/String;)V

    .line 163
    invoke-static {v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->hash(Ljava/lang/String;)I

    move-result v0

    .line 164
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->index(I)I

    move-result v1

    .line 165
    .local v1, "i":I
    invoke-direct {p0, v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->remove0(IILjava/lang/String;)V

    .line 166
    invoke-direct {p0, v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;->add0(IILjava/lang/String;Ljava/lang/String;)V

    .line 167
    return-object p0
.end method
