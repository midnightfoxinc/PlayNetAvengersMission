.class public Lcom/ning/http/util/AsyncHttpProviderUtils;
.super Ljava/lang/Object;
.source "AsyncHttpProviderUtils.java"


# static fields
.field public static final DEFAULT_CHARSET:Ljava/nio/charset/Charset;

.field static final EMPTY_BYTE_ARRAY:[B

.field public static final REMOTELY_CLOSED_EXCEPTION:Ljava/io/IOException;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 40
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Remotely closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/ning/http/util/AsyncHttpProviderUtils;->REMOTELY_CLOSED_EXCEPTION:Ljava/io/IOException;

    .line 43
    sget-object v0, Lcom/ning/http/util/AsyncHttpProviderUtils;->REMOTELY_CLOSED_EXCEPTION:Ljava/io/IOException;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/StackTraceElement;

    invoke-virtual {v0, v1}, Ljava/io/IOException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 46
    sget-object v0, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    sput-object v0, Lcom/ning/http/util/AsyncHttpProviderUtils;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    .line 48
    const-string v0, ""

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/util/AsyncHttpProviderUtils;->EMPTY_BYTE_ARRAY:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final contentToByte(Ljava/util/List;)[B
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .local p0, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    const/4 v8, 0x0

    .line 73
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_1

    .line 74
    invoke-interface {p0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/ning/http/client/HttpResponseBodyPart;

    invoke-virtual {v6}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v2

    .line 89
    :cond_0
    return-object v2

    .line 77
    :cond_1
    const/4 v5, 0x0

    .line 78
    .local v5, "size":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/HttpResponseBodyPart;

    .line 79
    .local v0, "body":Lcom/ning/http/client/HttpResponseBodyPart;
    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v6

    array-length v6, v6

    add-int/2addr v5, v6

    .line 80
    goto :goto_0

    .line 81
    .end local v0    # "body":Lcom/ning/http/client/HttpResponseBodyPart;
    :cond_2
    new-array v2, v5, [B

    .line 82
    .local v2, "bytes":[B
    const/4 v4, 0x0

    .line 83
    .local v4, "offset":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/HttpResponseBodyPart;

    .line 84
    .restart local v0    # "body":Lcom/ning/http/client/HttpResponseBodyPart;
    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v1

    .line 85
    .local v1, "bodyBytes":[B
    array-length v6, v1

    invoke-static {v1, v8, v2, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    array-length v6, v1

    add-int/2addr v4, v6

    .line 87
    goto :goto_1
.end method

.method public static final contentToInputStream(Ljava/util/List;)Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;)",
            "Ljava/io/InputStream;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/ByteArrayInputStream;

    sget-object v1, Lcom/ning/http/util/AsyncHttpProviderUtils;->EMPTY_BYTE_ARRAY:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;

    invoke-direct {v0, p0}, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;-><init>(Ljava/util/List;)V

    goto :goto_0
.end method

.method public static final contentToString(Ljava/util/List;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->contentToByte(Ljava/util/List;)[B

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method

.method private static doubleUp([B)[B
    .locals 4
    .param p0, "b"    # [B

    .prologue
    const/4 v3, 0x0

    .line 135
    array-length v1, p0

    .line 136
    .local v1, "len":I
    add-int v2, v1, v1

    new-array v0, v2, [B

    .line 137
    .local v0, "b2":[B
    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 138
    return-object v0
.end method

.method private static encodeAndAppendFormParam(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 1
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "name"    # Ljava/lang/CharSequence;
    .param p2, "value"    # Ljava/lang/CharSequence;

    .prologue
    .line 186
    invoke-static {p0, p1}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendFormElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 187
    if-eqz p2, :cond_0

    .line 188
    const/16 v0, 0x3d

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 189
    invoke-static {p0, p2}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendFormElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 191
    :cond_0
    const/16 v0, 0x26

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 192
    return-void
.end method

.method public static encodeAndAppendQueryParam(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 1
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "name"    # Ljava/lang/CharSequence;
    .param p2, "value"    # Ljava/lang/CharSequence;

    .prologue
    .line 195
    invoke-static {p0, p1}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 196
    if-eqz p2, :cond_0

    .line 197
    const/16 v0, 0x3d

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 198
    invoke-static {p0, p2}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 200
    :cond_0
    const/16 v0, 0x26

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 201
    return-void
.end method

.method public static followRedirect(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Z
    .locals 1
    .param p0, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 169
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFollowRedirect()Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFollowRedirect()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClientConfig;->isFollowRedirect()Z

    move-result v0

    goto :goto_0
.end method

.method public static final getAuthority(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;
    .locals 3
    .param p0, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v0

    .line 65
    .local v0, "port":I
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 64
    .end local v0    # "port":I
    :cond_0
    invoke-static {p0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getDefaultPort(Lcom/ning/http/client/uri/Uri;)I

    move-result v0

    goto :goto_0
.end method

.method public static final getBaseUrl(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;
    .locals 2
    .param p0, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getAuthority(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final getDefaultPort(Lcom/ning/http/client/uri/Uri;)I
    .locals 3
    .param p0, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 99
    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v0

    .line 100
    .local v0, "port":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 101
    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ws"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    const/16 v0, 0x50

    .line 102
    :cond_1
    :goto_0
    return v0

    .line 101
    :cond_2
    const/16 v0, 0x1bb

    goto :goto_0
.end method

.method public static final getNonEmptyPath(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;
    .locals 1
    .param p0, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "/"

    goto :goto_0
.end method

.method public static keepAliveHeaderValue(Lcom/ning/http/client/AsyncHttpClientConfig;)Ljava/lang/String;
    .locals 1
    .param p0, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 161
    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAllowPoolingConnections()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "keep-alive"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "close"

    goto :goto_0
.end method

.method public static parseCharset(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "contentType"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 142
    const-string v6, ";"

    invoke-virtual {p0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 143
    .local v4, "part":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, "charset="

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 144
    const-string v6, "="

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 145
    .local v5, "val":[Ljava/lang/String;
    array-length v6, v5

    if-le v6, v8, :cond_0

    .line 146
    aget-object v6, v5, v8

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 153
    .local v1, "charset":Ljava/lang/String;
    const-string v6, "\""

    const-string v7, ""

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "\'"

    const-string v8, ""

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 157
    .end local v1    # "charset":Ljava/lang/String;
    .end local v4    # "part":Ljava/lang/String;
    .end local v5    # "val":[Ljava/lang/String;
    :goto_1
    return-object v6

    .line 142
    .restart local v4    # "part":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 157
    .end local v4    # "part":Ljava/lang/String;
    :cond_1
    const/4 v6, 0x0

    goto :goto_1
.end method

.method public static final readFully(Ljava/io/InputStream;[I)[B
    .locals 6
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "lengthWrapper"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    const/16 v4, 0x200

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    new-array v0, v4, [B

    .line 117
    .local v0, "b":[B
    const/4 v3, 0x0

    .line 119
    .local v3, "offset":I
    :cond_0
    :goto_0
    array-length v4, v0

    sub-int v2, v4, v3

    .line 120
    .local v2, "left":I
    invoke-virtual {p0, v0, v3, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 121
    .local v1, "count":I
    if-gez v1, :cond_1

    .line 130
    const/4 v4, 0x0

    aput v3, p1, v4

    .line 131
    return-object v0

    .line 124
    :cond_1
    add-int/2addr v3, v1

    .line 125
    if-ne v1, v2, :cond_0

    .line 126
    invoke-static {v0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->doubleUp([B)[B

    move-result-object v0

    goto :goto_0
.end method

.method public static requestTimeout(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)I
    .locals 1
    .param p0, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 165
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRequestTimeout()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRequestTimeout()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRequestTimeout()I

    move-result v0

    goto :goto_0
.end method

.method public static urlEncodeFormParams(Ljava/util/List;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Ljava/nio/ByteBuffer;"
        }
    .end annotation

    .prologue
    .line 182
    .local p0, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-static {p0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->urlEncodeFormParams0(Ljava/util/List;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/ning/http/util/StringUtils;->charSequence2ByteBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static urlEncodeFormParams0(Ljava/util/List;)Ljava/lang/StringBuilder;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/StringBuilder;"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v2

    .line 174
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/Param;

    .line 175
    .local v1, "param":Lcom/ning/http/client/Param;
    invoke-virtual {v1}, Lcom/ning/http/client/Param;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/ning/http/client/Param;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/ning/http/util/AsyncHttpProviderUtils;->encodeAndAppendFormParam(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 177
    .end local v1    # "param":Lcom/ning/http/client/Param;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 178
    return-object v2
.end method

.method public static final validateSupportedScheme(Lcom/ning/http/client/uri/Uri;)V
    .locals 4
    .param p0, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "scheme":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "ws"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "wss"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 54
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The URI scheme, of the URI "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", must be equal (ignoring case) to \'http\', \'https\', \'ws\', or \'wss\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 57
    :cond_1
    return-void
.end method
