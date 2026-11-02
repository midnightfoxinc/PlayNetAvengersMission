.class public Lorg/jboss/netty/handler/codec/http/DefaultCookie;
.super Ljava/lang/Object;
.source "DefaultCookie.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/Cookie;


# instance fields
.field private comment:Ljava/lang/String;

.field private commentUrl:Ljava/lang/String;

.field private discard:Z

.field private domain:Ljava/lang/String;

.field private httpOnly:Z

.field private maxAge:I

.field private final name:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private ports:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private secure:Z

.field private unmodifiablePorts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private value:Ljava/lang/String;

.field private version:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->ports:Ljava/util/Set;

    .line 37
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->ports:Ljava/util/Set;

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->unmodifiablePorts:Ljava/util/Set;

    .line 38
    const/high16 v2, -0x80000000

    iput v2, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->maxAge:I

    .line 47
    if-nez p1, :cond_0

    .line 48
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "name"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 50
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 52
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "empty name"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 55
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 56
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 57
    .local v0, "c":C
    const/16 v2, 0x7f

    if-le v0, v2, :cond_2

    .line 58
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name contains non-ascii character: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 63
    :cond_2
    sparse-switch v0, :sswitch_data_0

    .line 55
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    :sswitch_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name contains one of the following prohibited characters: =,; \\t\\r\\n\\v\\f: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 72
    .end local v0    # "c":C
    :cond_3
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x24

    if-ne v2, v3, :cond_4

    .line 73
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name starting with \'$\' not allowed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 76
    :cond_4
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->name:Ljava/lang/String;

    .line 77
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->setValue(Ljava/lang/String;)V

    .line 78
    return-void

    .line 63
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x2c -> :sswitch_0
        0x3b -> :sswitch_0
        0x3d -> :sswitch_0
    .end sparse-switch
.end method

.method private static validateValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 317
    if-nez p1, :cond_1

    .line 333
    :cond_0
    :goto_0
    return-object v2

    .line 320
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 321
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 324
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 325
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 326
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_0

    .line 324
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 328
    :sswitch_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " contains one of the following prohibited characters: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ";\\r\\n\\f\\v ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x29

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .end local v0    # "c":C
    :cond_2
    move-object v2, p1

    .line 333
    goto :goto_0

    .line 326
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x3b -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p1, Lorg/jboss/netty/handler/codec/http/Cookie;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->compareTo(Lorg/jboss/netty/handler/codec/http/Cookie;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/Cookie;)I
    .locals 5
    .param p1, "c"    # Lorg/jboss/netty/handler/codec/http/Cookie;

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 252
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/Cookie;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    .line 253
    .local v0, "v":I
    if-eqz v0, :cond_1

    move v1, v0

    .line 281
    :cond_0
    :goto_0
    return v1

    .line 257
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getPath()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    .line 258
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 270
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getDomain()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5

    .line 271
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 281
    const/4 v1, 0x0

    goto :goto_0

    .line 261
    :cond_3
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    move v1, v2

    .line 262
    goto :goto_0

    .line 264
    :cond_4
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 265
    if-eqz v0, :cond_2

    move v1, v0

    .line 266
    goto :goto_0

    .line 274
    :cond_5
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_6

    move v1, v2

    .line 275
    goto :goto_0

    .line 277
    :cond_6
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getDomain()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    move v1, v0

    .line 278
    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 218
    instance-of v2, p1, Lorg/jboss/netty/handler/codec/http/Cookie;

    if-nez v2, :cond_1

    .line 247
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 222
    check-cast v0, Lorg/jboss/netty/handler/codec/http/Cookie;

    .line 223
    .local v0, "that":Lorg/jboss/netty/handler/codec/http/Cookie;
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 227
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getPath()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    .line 228
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 237
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getDomain()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    .line 238
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 247
    const/4 v1, 0x1

    goto :goto_0

    .line 231
    :cond_3
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 233
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 241
    :cond_4
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 244
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getDomain()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->commentUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public getMaxAge()I
    .locals 1

    .prologue
    .line 180
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->maxAge:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getPorts()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->unmodifiablePorts:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 137
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->ports:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->unmodifiablePorts:Ljava/util/Set;

    .line 139
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->unmodifiablePorts:Ljava/util/Set;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()I
    .locals 1

    .prologue
    .line 188
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->version:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 213
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isDiscard()Z
    .locals 1

    .prologue
    .line 128
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->discard:Z

    return v0
.end method

.method public isHttpOnly()Z
    .locals 1

    .prologue
    .line 204
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->httpOnly:Z

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .prologue
    .line 196
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->secure:Z

    return v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 1
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 116
    const-string v0, "comment"

    invoke-static {v0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->validateValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->comment:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public setCommentUrl(Ljava/lang/String;)V
    .locals 1
    .param p1, "commentUrl"    # Ljava/lang/String;

    .prologue
    .line 124
    const-string v0, "commentUrl"

    invoke-static {v0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->validateValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->commentUrl:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public setDiscard(Z)V
    .locals 0
    .param p1, "discard"    # Z

    .prologue
    .line 132
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->discard:Z

    .line 133
    return-void
.end method

.method public setDomain(Ljava/lang/String;)V
    .locals 1
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    .line 100
    const-string v0, "domain"

    invoke-static {v0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->validateValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->domain:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setHttpOnly(Z)V
    .locals 0
    .param p1, "httpOnly"    # Z

    .prologue
    .line 208
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->httpOnly:Z

    .line 209
    return-void
.end method

.method public setMaxAge(I)V
    .locals 0
    .param p1, "maxAge"    # I

    .prologue
    .line 184
    iput p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->maxAge:I

    .line 185
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 108
    const-string v0, "path"

    invoke-static {v0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->validateValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->path:Ljava/lang/String;

    .line 109
    return-void
.end method

.method public setPorts(Ljava/lang/Iterable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "ports":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 165
    .local v1, "newPorts":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 166
    .local v2, "p":I
    if-lez v2, :cond_0

    const v3, 0xffff

    if-le v2, v3, :cond_1

    .line 167
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "port out of range: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 169
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 171
    .end local v2    # "p":I
    :cond_2
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 172
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v3

    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->ports:Ljava/util/Set;

    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->unmodifiablePorts:Ljava/util/Set;

    .line 177
    :goto_1
    return-void

    .line 174
    :cond_3
    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->ports:Ljava/util/Set;

    .line 175
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->unmodifiablePorts:Ljava/util/Set;

    goto :goto_1
.end method

.method public varargs setPorts([I)V
    .locals 9
    .param p1, "ports"    # [I

    .prologue
    .line 143
    if-nez p1, :cond_0

    .line 144
    new-instance v6, Ljava/lang/NullPointerException;

    const-string v7, "ports"

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 147
    :cond_0
    invoke-virtual {p1}, [I->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [I

    .line 148
    .local v5, "portsCopy":[I
    array-length v6, v5

    if-nez v6, :cond_1

    .line 149
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->ports:Ljava/util/Set;

    iput-object v6, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->unmodifiablePorts:Ljava/util/Set;

    .line 161
    :goto_0
    return-void

    .line 151
    :cond_1
    new-instance v3, Ljava/util/TreeSet;

    invoke-direct {v3}, Ljava/util/TreeSet;-><init>()V

    .line 152
    .local v3, "newPorts":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move-object v0, v5

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_4

    aget v4, v0, v1

    .line 153
    .local v4, "p":I
    if-lez v4, :cond_2

    const v6, 0xffff

    if-le v4, v6, :cond_3

    .line 154
    :cond_2
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "port out of range: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 156
    :cond_3
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 152
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 158
    .end local v4    # "p":I
    :cond_4
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->ports:Ljava/util/Set;

    .line 159
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->unmodifiablePorts:Ljava/util/Set;

    goto :goto_0
.end method

.method public setSecure(Z)V
    .locals 0
    .param p1, "secure"    # Z

    .prologue
    .line 200
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->secure:Z

    .line 201
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 89
    if-nez p1, :cond_0

    .line 90
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "value"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->value:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 192
    iput p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->version:I

    .line 193
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 286
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 287
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 289
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getDomain()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 291
    const-string v1, ", domain="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getDomain()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 295
    const-string v1, ", path="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getComment()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 299
    const-string v1, ", comment="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getMaxAge()I

    move-result v1

    if-ltz v1, :cond_3

    .line 303
    const-string v1, ", maxAge="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->getMaxAge()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    const/16 v1, 0x73

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 307
    :cond_3
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->isSecure()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 308
    const-string v1, ", secure"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    :cond_4
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultCookie;->isHttpOnly()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 311
    const-string v1, ", HTTPOnly"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
