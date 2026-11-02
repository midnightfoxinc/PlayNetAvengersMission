.class public Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;
.super Lorg/jboss/netty/handler/codec/http/HttpHeaders;
.source "DefaultHttpHeaders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$1;,
        Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;,
        Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;
    }
.end annotation


# static fields
.field private static final BUCKET_SIZE:I = 0x11

.field private static final KNOWN_NAMES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final KNOWN_VALUES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

.field private final head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

.field protected final validate:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lorg/jboss/netty/handler/codec/http/HttpHeaders$Names;

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->createSet(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->KNOWN_NAMES:Ljava/util/Set;

    .line 38
    const-class v0, Lorg/jboss/netty/handler/codec/http/HttpHeaders$Values;

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->createSet(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->KNOWN_VALUES:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 116
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;-><init>(Z)V

    .line 117
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 3
    .param p1, "validate"    # Z

    .prologue
    const/4 v2, 0x0

    .line 119
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;-><init>()V

    .line 111
    const/16 v0, 0x11

    new-array v0, v0, [Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 112
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    const/4 v1, -0x1

    invoke-direct {v0, p0, v1, v2, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;-><init>(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;ILjava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 120
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v2, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v2, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 121
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validate:Z

    .line 122
    return-void
.end method

.method static synthetic access$100(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;)Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    return-object v0
.end method

.method private add0(IILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "h"    # I
    .param p2, "i"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    aget-object v0, v2, p2

    .line 169
    .local v0, "e":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    new-instance v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    invoke-direct {v1, p0, p1, p3, p4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;-><init>(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;ILjava/lang/String;Ljava/lang/String;)V

    .local v1, "newEntry":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    aput-object v1, v2, p2

    .line 170
    iput-object v0, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 173
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->addBefore(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;)V

    .line 174
    return-void
.end method

.method private static createSet(Ljava/lang/Class;)Ljava/util/Set;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 42
    .local v6, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 44
    .local v2, "fields":[Ljava/lang/reflect/Field;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 45
    .local v1, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    .line 46
    .local v5, "m":I
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    const-class v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 49
    const/4 v7, 0x0

    :try_start_0
    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 55
    .end local v1    # "f":Ljava/lang/reflect/Field;
    .end local v5    # "m":I
    :cond_1
    return-object v6

    .line 50
    .restart local v1    # "f":Ljava/lang/reflect/Field;
    .restart local v5    # "m":I
    :catch_0
    move-exception v7

    goto :goto_1
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p0, "name1"    # Ljava/lang/String;
    .param p1, "name2"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 79
    if-ne p0, p1, :cond_1

    .line 97
    :cond_0
    :goto_0
    return v4

    .line 83
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 84
    .local v3, "nameLen":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-eq v3, v6, :cond_2

    move v4, v5

    .line 85
    goto :goto_0

    .line 88
    :cond_2
    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_1
    if-ltz v2, :cond_0

    .line 89
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 90
    .local v0, "c1":C
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 91
    .local v1, "c2":C
    if-eq v0, v1, :cond_3

    .line 92
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->toLowerCase(C)C

    move-result v6

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->toLowerCase(C)C

    move-result v7

    if-eq v6, v7, :cond_3

    move v4, v5

    .line 93
    goto :goto_0

    .line 88
    :cond_3
    add-int/lit8 v2, v2, -0x1

    goto :goto_1
.end method

.method private get(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "last"    # Z

    .prologue
    .line 281
    if-nez p1, :cond_0

    .line 282
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "name"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 285
    :cond_0
    const/4 v4, 0x0

    invoke-static {p1, v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->hash(Ljava/lang/String;Z)I

    move-result v1

    .line 286
    .local v1, "h":I
    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->index(I)I

    move-result v2

    .line 287
    .local v2, "i":I
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    aget-object v0, v4, v2

    .line 288
    .local v0, "e":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    const/4 v3, 0x0

    .line 290
    .local v3, "value":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_1

    .line 291
    iget v4, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->hash:I

    if-ne v4, v1, :cond_2

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p1, v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 292
    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    .line 293
    if-eqz p2, :cond_2

    .line 300
    :cond_1
    return-object v3

    .line 298
    :cond_2
    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    goto :goto_0
.end method

.method private static hash(Ljava/lang/String;Z)I
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "validate"    # Z

    .prologue
    .line 59
    const/4 v1, 0x0

    .line 60
    .local v1, "h":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_1

    .line 61
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 62
    .local v0, "c":C
    if-eqz p1, :cond_0

    .line 63
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->valideHeaderNameChar(C)V

    .line 65
    :cond_0
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->toLowerCase(C)C

    move-result v0

    .line 66
    mul-int/lit8 v3, v1, 0x1f

    add-int v1, v3, v0

    .line 60
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 69
    .end local v0    # "c":C
    :cond_1
    if-lez v1, :cond_2

    .line 74
    .end local v1    # "h":I
    :goto_1
    return v1

    .line 71
    .restart local v1    # "h":I
    :cond_2
    const/high16 v3, -0x80000000

    if-ne v1, v3, :cond_3

    .line 72
    const v1, 0x7fffffff

    goto :goto_1

    .line 74
    :cond_3
    neg-int v1, v1

    goto :goto_1
.end method

.method private static index(I)I
    .locals 1
    .param p0, "hash"    # I

    .prologue
    .line 108
    rem-int/lit8 v0, p0, 0x11

    return v0
.end method

.method private remove0(IILjava/lang/String;)V
    .locals 4
    .param p1, "h"    # I
    .param p2, "i"    # I
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 188
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    aget-object v0, v2, p2

    .line 189
    .local v0, "e":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    if-nez v0, :cond_0

    .line 221
    :goto_0
    return-void

    .line 194
    :cond_0
    :goto_1
    iget v2, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->hash:I

    if-ne v2, p1, :cond_3

    iget-object v2, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p3, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 195
    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->remove()V

    .line 196
    iget-object v1, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 197
    .local v1, "next":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    if-eqz v1, :cond_1

    .line 198
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    aput-object v1, v2, p2

    .line 199
    move-object v0, v1

    goto :goto_1

    .line 201
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    const/4 v3, 0x0

    aput-object v3, v2, p2

    goto :goto_0

    .line 214
    :cond_2
    iget v2, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->hash:I

    if-ne v2, p1, :cond_4

    iget-object v2, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p3, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 215
    iget-object v2, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v2, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 216
    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->remove()V

    .line 210
    .end local v1    # "next":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    :cond_3
    :goto_2
    iget-object v1, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 211
    .restart local v1    # "next":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    if-nez v1, :cond_2

    goto :goto_0

    .line 218
    :cond_4
    move-object v0, v1

    goto :goto_2
.end method

.method private static toLowerCase(C)C
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 101
    const/16 v0, 0x41

    if-lt p0, v0, :cond_0

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_0

    .line 102
    add-int/lit8 v0, p0, 0x20

    int-to-char p0, v0

    .line 104
    :cond_0
    return p0
.end method

.method private static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 388
    if-nez p0, :cond_0

    .line 389
    const/4 p0, 0x0

    .line 403
    .end local p0    # "value":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 391
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_0
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 392
    check-cast p0, Ljava/lang/String;

    goto :goto_0

    .line 394
    :cond_1
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_2

    .line 395
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 397
    :cond_2
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_3

    .line 398
    invoke-static {}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v0

    check-cast p0, Ljava/util/Date;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {v0, p0}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 400
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_3
    instance-of v0, p0, Ljava/util/Calendar;

    if-eqz v0, :cond_4

    .line 401
    invoke-static {}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    move-result-object v0

    check-cast p0, Ljava/util/Calendar;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 403
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/http/HttpHeaders;"
        }
    .end annotation

    .prologue
    .line 148
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    const/4 v4, 0x0

    .line 149
    .local v4, "validateName":Z
    iget-boolean v6, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validate:Z

    if-eqz v6, :cond_0

    .line 150
    sget-object v6, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->KNOWN_NAMES:Ljava/util/Set;

    invoke-interface {v6, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    const/4 v4, 0x1

    .line 153
    :cond_0
    :goto_0
    invoke-static {p1, v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->hash(Ljava/lang/String;Z)I

    move-result v0

    .line 154
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->index(I)I

    move-result v1

    .line 155
    .local v1, "i":I
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 156
    .local v3, "v":Ljava/lang/Object;
    invoke-static {v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 157
    .local v5, "vstr":Ljava/lang/String;
    iget-boolean v6, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validate:Z

    if-eqz v6, :cond_1

    .line 158
    invoke-virtual {p0, v5}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validateHeaderValue0(Ljava/lang/String;)V

    .line 160
    :cond_1
    invoke-direct {p0, v0, v1, p1, v5}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->add0(IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 150
    .end local v0    # "h":I
    .end local v1    # "i":I
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "v":Ljava/lang/Object;
    .end local v5    # "vstr":Ljava/lang/String;
    :cond_2
    const/4 v4, 0x0

    goto :goto_0

    .line 162
    .restart local v0    # "h":I
    .restart local v1    # "i":I
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_3
    return-object p0
.end method

.method public add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 133
    invoke-static {p2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 134
    .local v2, "strVal":Ljava/lang/String;
    const/4 v3, 0x0

    .line 135
    .local v3, "validateName":Z
    iget-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validate:Z

    if-eqz v4, :cond_0

    .line 136
    invoke-virtual {p0, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validateHeaderValue0(Ljava/lang/String;)V

    .line 137
    sget-object v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->KNOWN_NAMES:Ljava/util/Set;

    invoke-interface {v4, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v3, 0x1

    .line 140
    :cond_0
    :goto_0
    invoke-static {p1, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->hash(Ljava/lang/String;Z)I

    move-result v0

    .line 141
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->index(I)I

    move-result v1

    .line 142
    .local v1, "i":I
    invoke-direct {p0, v0, v1, p1, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->add0(IILjava/lang/String;Ljava/lang/String;)V

    .line 143
    return-object p0

    .line 137
    .end local v0    # "h":I
    .end local v1    # "i":I
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public clear()Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 3

    .prologue
    .line 270
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 271
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v2, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v2, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 272
    return-object p0
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 342
    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->get(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public contains(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "ignoreCaseValue"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 352
    if-nez p1, :cond_0

    .line 353
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "name"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 356
    :cond_0
    invoke-static {p1, v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->hash(Ljava/lang/String;Z)I

    move-result v1

    .line 357
    .local v1, "h":I
    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->index(I)I

    move-result v2

    .line 358
    .local v2, "i":I
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    aget-object v0, v5, v2

    .line 359
    .local v0, "e":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    :goto_0
    if-eqz v0, :cond_4

    .line 360
    iget v5, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->hash:I

    if-ne v5, v1, :cond_3

    iget-object v5, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p1, v5}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 361
    if-eqz p3, :cond_2

    .line 362
    iget-object v5, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    invoke-virtual {v5, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 373
    :cond_1
    :goto_1
    return v3

    .line 366
    :cond_2
    iget-object v5, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 371
    :cond_3
    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    goto :goto_0

    :cond_4
    move v3, v4

    .line 373
    goto :goto_1
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
    .line 325
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 328
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, v2, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 329
    .local v1, "e":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    if-eq v1, v2, :cond_0

    .line 330
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    iget-object v1, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    goto :goto_0

    .line 333
    :cond_0
    return-object v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 277
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->get(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
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
    .line 305
    if-nez p1, :cond_0

    .line 306
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "name"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 309
    :cond_0
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 311
    .local v3, "values":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    invoke-static {p1, v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->hash(Ljava/lang/String;Z)I

    move-result v1

    .line 312
    .local v1, "h":I
    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->index(I)I

    move-result v2

    .line 313
    .local v2, "i":I
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->entries:[Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    aget-object v0, v4, v2

    .line 314
    .local v0, "e":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    :goto_0
    if-eqz v0, :cond_2

    .line 315
    iget v4, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->hash:I

    if-ne v4, v1, :cond_1

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-static {p1, v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 316
    iget-object v4, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 318
    :cond_1
    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    goto :goto_0

    .line 320
    :cond_2
    return-object v3
.end method

.method public isEmpty()Z
    .locals 2

    .prologue
    .line 347
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

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
    .line 337
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;-><init>(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$1;)V

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
    .line 378
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 379
    .local v1, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v0, v2, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 380
    .local v0, "e":Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->head:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    if-eq v0, v2, :cond_0

    .line 381
    iget-object v2, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 382
    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    goto :goto_0

    .line 384
    :cond_0
    return-object v1
.end method

.method public remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 178
    if-nez p1, :cond_0

    .line 179
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "name"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 181
    :cond_0
    const/4 v2, 0x0

    invoke-static {p1, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->hash(Ljava/lang/String;Z)I

    move-result v0

    .line 182
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->index(I)I

    move-result v1

    .line 183
    .local v1, "i":I
    invoke-direct {p0, v0, v1, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->remove0(IILjava/lang/String;)V

    .line 184
    return-object p0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/http/HttpHeaders;"
        }
    .end annotation

    .prologue
    .line 241
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    if-nez p2, :cond_0

    .line 242
    new-instance v6, Ljava/lang/NullPointerException;

    const-string v7, "values"

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 245
    :cond_0
    const/4 v5, 0x0

    .line 246
    .local v5, "validateName":Z
    iget-boolean v6, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validate:Z

    if-eqz v6, :cond_1

    .line 247
    sget-object v6, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->KNOWN_NAMES:Ljava/util/Set;

    invoke-interface {v6, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    const/4 v5, 0x1

    .line 250
    :cond_1
    :goto_0
    invoke-static {p1, v5}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->hash(Ljava/lang/String;Z)I

    move-result v0

    .line 251
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->index(I)I

    move-result v1

    .line 253
    .local v1, "i":I
    invoke-direct {p0, v0, v1, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->remove0(IILjava/lang/String;)V

    .line 254
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 255
    .local v4, "v":Ljava/lang/Object;
    if-nez v4, :cond_4

    .line 265
    .end local v4    # "v":Ljava/lang/Object;
    :cond_2
    return-object p0

    .line 247
    .end local v0    # "h":I
    .end local v1    # "i":I
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_3
    const/4 v5, 0x0

    goto :goto_0

    .line 258
    .restart local v0    # "h":I
    .restart local v1    # "i":I
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "v":Ljava/lang/Object;
    :cond_4
    invoke-static {v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 259
    .local v3, "strVal":Ljava/lang/String;
    iget-boolean v6, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validate:Z

    if-eqz v6, :cond_5

    .line 260
    invoke-virtual {p0, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validateHeaderValue0(Ljava/lang/String;)V

    .line 262
    :cond_5
    invoke-direct {p0, v0, v1, p1, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->add0(IILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 225
    invoke-static {p2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 226
    .local v2, "strVal":Ljava/lang/String;
    const/4 v3, 0x0

    .line 227
    .local v3, "validateName":Z
    iget-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validate:Z

    if-eqz v4, :cond_0

    .line 228
    invoke-virtual {p0, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validateHeaderValue0(Ljava/lang/String;)V

    .line 229
    sget-object v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->KNOWN_NAMES:Ljava/util/Set;

    invoke-interface {v4, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v3, 0x1

    .line 232
    :cond_0
    :goto_0
    invoke-static {p1, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->hash(Ljava/lang/String;Z)I

    move-result v0

    .line 233
    .local v0, "h":I
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->index(I)I

    move-result v1

    .line 234
    .local v1, "i":I
    invoke-direct {p0, v0, v1, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->remove0(IILjava/lang/String;)V

    .line 235
    invoke-direct {p0, v0, v1, p1, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->add0(IILjava/lang/String;Ljava/lang/String;)V

    .line 236
    return-object p0

    .line 229
    .end local v0    # "h":I
    .end local v1    # "i":I
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method validateHeaderValue0(Ljava/lang/String;)V
    .locals 1
    .param p1, "headerValue"    # Ljava/lang/String;

    .prologue
    .line 125
    sget-object v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->KNOWN_VALUES:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 129
    :goto_0
    return-void

    .line 128
    :cond_0
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validateHeaderValue(Ljava/lang/String;)V

    goto :goto_0
.end method
