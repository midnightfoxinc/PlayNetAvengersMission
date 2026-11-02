.class public Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;
.super Ljava/lang/Object;
.source "HttpPostRequestDecoder.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;,
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;,
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;,
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;
    }
.end annotation


# instance fields
.field private final decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpRequest;)V
    .locals 4
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;

    const-wide/16 v2, 0x4000

    invoke-direct {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;-><init>(J)V

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0, p1, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;)V
    .locals 1
    .param p1, "factory"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;
    .param p2, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 56
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V
    .locals 2
    .param p1, "factory"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;
    .param p2, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    if-nez p1, :cond_0

    .line 70
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "factory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_0
    if-nez p2, :cond_1

    .line 73
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "request"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_1
    if-nez p3, :cond_2

    .line 76
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "charset"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_2
    invoke-static {p2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->isMultipart(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 80
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;

    invoke-direct {v0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_3
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;

    invoke-direct {v0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    goto :goto_0
.end method

.method protected static getMultipartDataBoundary(Ljava/lang/String;)[Ljava/lang/String;
    .locals 14
    .param p0, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v13, 0x3d

    const/16 v12, 0x22

    const/4 v9, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 161
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->splitHeaderContentType(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 162
    .local v4, "headerContentType":[Ljava/lang/String;
    aget-object v7, v4, v10

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, "multipart/form-data"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 164
    const/4 v6, 0x1

    .local v6, "mrank":I
    const/4 v3, 0x2

    .line 165
    .local v3, "crank":I
    aget-object v7, v4, v11

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, "boundary"

    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 167
    const/4 v6, 0x1

    .line 168
    const/4 v3, 0x2

    .line 176
    :goto_0
    aget-object v7, v4, v6

    invoke-static {v7, v13}, Lorg/jboss/netty/util/internal/StringUtil;->substringAfter(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v1

    .line 177
    .local v1, "boundary":Ljava/lang/String;
    if-nez v1, :cond_2

    .line 178
    new-instance v7, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v8, "Needs a boundary value"

    invoke-direct {v7, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 169
    .end local v1    # "boundary":Ljava/lang/String;
    :cond_0
    aget-object v7, v4, v9

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, "boundary"

    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 171
    const/4 v6, 0x2

    .line 172
    const/4 v3, 0x1

    goto :goto_0

    .line 174
    :cond_1
    const/4 v7, 0x0

    .line 196
    .end local v3    # "crank":I
    .end local v6    # "mrank":I
    :goto_1
    return-object v7

    .line 180
    .restart local v1    # "boundary":Ljava/lang/String;
    .restart local v3    # "crank":I
    .restart local v6    # "mrank":I
    :cond_2
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v12, :cond_3

    .line 181
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 182
    .local v0, "bound":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v5, v7, -0x1

    .line 183
    .local v5, "index":I
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v12, :cond_3

    .line 184
    invoke-virtual {v0, v11, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 187
    .end local v0    # "bound":Ljava/lang/String;
    .end local v5    # "index":I
    :cond_3
    aget-object v7, v4, v3

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, "charset"

    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 189
    aget-object v7, v4, v3

    invoke-static {v7, v13}, Lorg/jboss/netty/util/internal/StringUtil;->substringAfter(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v2

    .line 190
    .local v2, "charset":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 191
    new-array v7, v9, [Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "--"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    aput-object v2, v7, v11

    goto :goto_1

    .line 194
    .end local v2    # "charset":Ljava/lang/String;
    :cond_4
    new-array v7, v11, [Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "--"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    goto :goto_1

    .line 196
    .end local v1    # "boundary":Ljava/lang/String;
    .end local v3    # "crank":I
    .end local v6    # "mrank":I
    :cond_5
    const/4 v7, 0x0

    goto :goto_1
.end method

.method public static isMultipart(Lorg/jboss/netty/handler/codec/http/HttpRequest;)Z
    .locals 3
    .param p0, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 146
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 147
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->getMultipartDataBoundary(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 149
    :cond_0
    return v0
.end method

.method private static splitHeaderContentType(Ljava/lang/String;)[Ljava/lang/String;
    .locals 13
    .param p0, "sb"    # Ljava/lang/String;

    .prologue
    const/4 v12, -0x1

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 307
    invoke-static {p0, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v1

    .line 308
    .local v1, "aStart":I
    const/16 v6, 0x3b

    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 309
    .local v0, "aEnd":I
    if-ne v0, v12, :cond_0

    .line 310
    new-array v6, v11, [Ljava/lang/String;

    aput-object p0, v6, v8

    const-string v7, ""

    aput-object v7, v6, v9

    const-string v7, ""

    aput-object v7, v6, v10

    .line 326
    :goto_0
    return-object v6

    .line 312
    :cond_0
    add-int/lit8 v6, v0, 0x1

    invoke-static {p0, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v3

    .line 313
    .local v3, "bStart":I
    add-int/lit8 v6, v0, -0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x20

    if-ne v6, v7, :cond_1

    .line 314
    add-int/lit8 v0, v0, -0x1

    .line 316
    :cond_1
    const/16 v6, 0x3b

    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 317
    .local v2, "bEnd":I
    if-ne v2, v12, :cond_2

    .line 318
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->findEndOfString(Ljava/lang/String;)I

    move-result v2

    .line 319
    new-array v6, v11, [Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    const-string v7, ""

    aput-object v7, v6, v10

    goto :goto_0

    .line 321
    :cond_2
    add-int/lit8 v6, v2, 0x1

    invoke-static {p0, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v5

    .line 322
    .local v5, "cStart":I
    add-int/lit8 v6, v2, -0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x20

    if-ne v6, v7, :cond_3

    .line 323
    add-int/lit8 v2, v2, -0x1

    .line 325
    :cond_3
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->findEndOfString(Ljava/lang/String;)I

    move-result v4

    .line 326
    .local v4, "cEnd":I
    new-array v6, v11, [Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    goto :goto_0
.end method


# virtual methods
.method public cleanFiles()V
    .locals 1

    .prologue
    .line 286
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->cleanFiles()V

    .line 287
    return-void
.end method

.method public getBodyHttpData(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    .line 246
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->getBodyHttpData(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v0

    return-object v0
.end method

.method public getBodyHttpDatas()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    .line 218
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->getBodyHttpDatas()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBodyHttpDatas(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    .line 232
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->getBodyHttpDatas(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;
        }
    .end annotation

    .prologue
    .line 268
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->hasNext()Z

    move-result v0

    return v0
.end method

.method public isMultipart()Z
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->isMultipart()Z

    move-result v0

    return v0
.end method

.method public next()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;
        }
    .end annotation

    .prologue
    .line 279
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->next()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v0

    return-object v0
.end method

.method public offer(Lorg/jboss/netty/handler/codec/http/HttpChunk;)V
    .locals 1
    .param p1, "chunk"    # Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 256
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->offer(Lorg/jboss/netty/handler/codec/http/HttpChunk;)V

    .line 257
    return-void
.end method

.method public removeHttpDataFromClean(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V
    .locals 1
    .param p1, "data"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 293
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->decoder:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;->removeHttpDataFromClean(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 294
    return-void
.end method
