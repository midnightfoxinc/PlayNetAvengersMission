.class public abstract Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;
.super Ljava/lang/Object;
.source "AbstractHttpData.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/HttpData;


# static fields
.field private static final REPLACE_PATTERN:Ljava/util/regex/Pattern;

.field private static final STRIP_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field protected charset:Ljava/nio/charset/Charset;

.field protected completed:Z

.field protected definedSize:J

.field protected maxSize:J

.field protected final name:Ljava/lang/String;

.field protected size:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-string v0, "(?:^\\s+|\\s+$|\\n)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->STRIP_PATTERN:Ljava/util/regex/Pattern;

    .line 30
    const-string v0, "[\\r\\t]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->REPLACE_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;J)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "size"    # J

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->charset:Ljava/nio/charset/Charset;

    .line 37
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->maxSize:J

    .line 40
    if-nez p1, :cond_0

    .line 41
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->REPLACE_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 45
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->STRIP_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "empty name"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->name:Ljava/lang/String;

    .line 52
    if-eqz p2, :cond_2

    .line 53
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->setCharset(Ljava/nio/charset/Charset;)V

    .line 55
    :cond_2
    iput-wide p3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->definedSize:J

    .line 56
    return-void
.end method


# virtual methods
.method public checkSize(J)V
    .locals 5
    .param p1, "newSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->maxSize:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->maxSize:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 64
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Size exceed allowed maximum capacity"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_0
    return-void
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isCompleted()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->completed:Z

    return v0
.end method

.method public length()J
    .locals 2

    .prologue
    .line 88
    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->size:J

    return-wide v0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 81
    if-nez p1, :cond_0

    .line 82
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "charset"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->charset:Ljava/nio/charset/Charset;

    .line 85
    return-void
.end method

.method public setMaxSize(J)V
    .locals 1
    .param p1, "maxSize"    # J

    .prologue
    .line 59
    iput-wide p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;->maxSize:J

    .line 60
    return-void
.end method
