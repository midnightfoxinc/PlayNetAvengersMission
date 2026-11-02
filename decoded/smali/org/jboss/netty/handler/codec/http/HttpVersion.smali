.class public Lorg/jboss/netty/handler/codec/http/HttpVersion;
.super Ljava/lang/Object;
.source "HttpVersion.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/jboss/netty/handler/codec/http/HttpVersion;",
        ">;"
    }
.end annotation


# static fields
.field public static final HTTP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;

.field public static final HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

.field private static final VERSION_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final keepAliveDefault:Z

.field private final majorVersion:I

.field private final minorVersion:I

.field private final protocolName:Ljava/lang/String;

.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 29
    const-string v0, "(\\S+)/(\\d+)\\.(\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->VERSION_PATTERN:Ljava/util/regex/Pattern;

    .line 35
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;

    const-string v1, "HTTP"

    invoke-direct {v0, v1, v2, v3, v3}, Lorg/jboss/netty/handler/codec/http/HttpVersion;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .line 40
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;

    const-string v1, "HTTP"

    invoke-direct {v0, v1, v2, v2, v2}, Lorg/jboss/netty/handler/codec/http/HttpVersion;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIZ)V
    .locals 3
    .param p1, "protocolName"    # Ljava/lang/String;
    .param p2, "majorVersion"    # I
    .param p3, "minorVersion"    # I
    .param p4, "keepAliveDefault"    # Z

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    if-nez p1, :cond_0

    .line 119
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "protocolName"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 122
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 123
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 124
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "empty protocolName"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 127
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 130
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "invalid character in protocolName"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 127
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 134
    :cond_4
    if-gez p2, :cond_5

    .line 135
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "negative majorVersion"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 137
    :cond_5
    if-gez p3, :cond_6

    .line 138
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "negative minorVersion"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 141
    :cond_6
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->protocolName:Ljava/lang/String;

    .line 142
    iput p2, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->majorVersion:I

    .line 143
    iput p3, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->minorVersion:I

    .line 144
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->text:Ljava/lang/String;

    .line 145
    iput-boolean p4, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->keepAliveDefault:Z

    .line 146
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "keepAliveDefault"    # Z

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    if-nez p1, :cond_0

    .line 84
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "text"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 87
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 88
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 89
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "empty text"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 92
    :cond_1
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpVersion;->VERSION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 93
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_2

    .line 94
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid version format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 97
    :cond_2
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->protocolName:Ljava/lang/String;

    .line 98
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->majorVersion:I

    .line 99
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->minorVersion:I

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->protocolName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->majorVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->minorVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->text:Ljava/lang/String;

    .line 101
    iput-boolean p2, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->keepAliveDefault:Z

    .line 102
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpVersion;
    .locals 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 51
    if-nez p0, :cond_0

    .line 52
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "text"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    .line 56
    const-string v0, "HTTP/1.1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 57
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .line 62
    :goto_0
    return-object v0

    .line 59
    :cond_1
    const-string v0, "HTTP/1.0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 60
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    goto :goto_0

    .line 62
    :cond_2
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;-><init>(Ljava/lang/String;Z)V

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p1, Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->compareTo(Lorg/jboss/netty/handler/codec/http/HttpVersion;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/HttpVersion;)I
    .locals 3
    .param p1, "o"    # Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .prologue
    .line 211
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getProtocolName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getProtocolName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 212
    .local v0, "v":I
    if-eqz v0, :cond_0

    move v1, v0

    .line 221
    :goto_0
    return v1

    .line 216
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMajorVersion()I

    move-result v1

    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMajorVersion()I

    move-result v2

    sub-int v0, v1, v2

    .line 217
    if-eqz v0, :cond_1

    move v1, v0

    .line 218
    goto :goto_0

    .line 221
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMinorVersion()I

    move-result v1

    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMinorVersion()I

    move-result v2

    sub-int/2addr v1, v2

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 200
    instance-of v2, p1, Lorg/jboss/netty/handler/codec/http/HttpVersion;

    if-nez v2, :cond_1

    .line 205
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 204
    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .line 205
    .local v0, "that":Lorg/jboss/netty/handler/codec/http/HttpVersion;
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMinorVersion()I

    move-result v2

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMinorVersion()I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMajorVersion()I

    move-result v2

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMajorVersion()I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getProtocolName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getProtocolName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getMajorVersion()I
    .locals 1

    .prologue
    .line 159
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->majorVersion:I

    return v0
.end method

.method public getMinorVersion()I
    .locals 1

    .prologue
    .line 166
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->minorVersion:I

    return v0
.end method

.method public getProtocolName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->protocolName:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->text:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 194
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getProtocolName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMajorVersion()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMinorVersion()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isKeepAliveDefault()Z
    .locals 1

    .prologue
    .line 181
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/HttpVersion;->keepAliveDefault:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 189
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
