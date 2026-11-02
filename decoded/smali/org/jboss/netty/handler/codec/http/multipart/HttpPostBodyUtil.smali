.class final Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;
.super Ljava/lang/Object;
.source "HttpPostBodyUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;,
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;,
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;
    }
.end annotation


# static fields
.field public static final ATTACHMENT:Ljava/lang/String; = "attachment"

.field public static final CONTENT_DISPOSITION:Ljava/lang/String; = "Content-Disposition"

.field public static final DEFAULT_BINARY_CONTENT_TYPE:Ljava/lang/String; = "application/octet-stream"

.field public static final DEFAULT_TEXT_CONTENT_TYPE:Ljava/lang/String; = "text/plain"

.field public static final FILE:Ljava/lang/String; = "file"

.field public static final FILENAME:Ljava/lang/String; = "filename"

.field public static final FORM_DATA:Ljava/lang/String; = "form-data"

.field public static final ISO_8859_1:Ljava/nio/charset/Charset;

.field public static final MULTIPART_MIXED:Ljava/lang/String; = "multipart/mixed"

.field public static final NAME:Ljava/lang/String; = "name"

.field public static final US_ASCII:Ljava/nio/charset/Charset;

.field public static final chunkSize:I = 0x1fa0


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lorg/jboss/netty/util/CharsetUtil;->ISO_8859_1:Ljava/nio/charset/Charset;

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 66
    sget-object v0, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->US_ASCII:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    return-void
.end method

.method static findEndOfString(Ljava/lang/String;)I
    .locals 2
    .param p0, "sb"    # Ljava/lang/String;

    .prologue
    .line 215
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "result":I
    :goto_0
    if-lez v0, :cond_0

    .line 216
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_1

    .line 220
    :cond_0
    return v0

    .line 215
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method static findNonWhitespace(Ljava/lang/String;I)I
    .locals 2
    .param p0, "sb"    # Ljava/lang/String;
    .param p1, "offset"    # I

    .prologue
    .line 187
    move v0, p1

    .local v0, "result":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 188
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_1

    .line 192
    :cond_0
    return v0

    .line 187
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static findWhitespace(Ljava/lang/String;I)I
    .locals 2
    .param p0, "sb"    # Ljava/lang/String;
    .param p1, "offset"    # I

    .prologue
    .line 201
    move v0, p1

    .local v0, "result":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 202
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 206
    :cond_0
    return v0

    .line 201
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
